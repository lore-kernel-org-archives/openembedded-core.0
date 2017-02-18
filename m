Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 270E76010D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Feb 2017 15:00:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1IF0qs7001505
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 18 Feb 2017 07:00:52 -0800 (PST)
Received: from server.local (128.224.22.29) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Sat, 18 Feb 2017 07:00:51 -0800
To: Paul Barker <paul@paulbarker.me.uk>,
	<openembedded-core@lists.openembedded.org>
References: <20170218121148.59d11d00@host0.betafive.co.uk>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <d17277e0-cdcf-5d46-3b50-a6326f834656@windriver.com>
Date: Sat, 18 Feb 2017 10:00:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20170218121148.59d11d00@host0.betafive.co.uk>
Subject: Re: linux-yocto-dev currently trips do_kernel_version_sanity_check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Feb 2017 15:00:53 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-02-18 7:11 AM, Paul Barker wrote:
> Hi all,
>
> I've cloned the master branch of poky, ran oe-init-build-env then
> edited local.conf to include the following line:
>
>     PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
>
> After this I ran 'bitbake linux-yocto-dev' and got the following error:
>
>     ERROR: linux-yocto-dev-4.9-rc++gitAUTOINC+a5183d8346_36439e87c8-r0 do_kernel_version_sanity_check: Package Version (4.9-rc++gitAUTOINC+a5183d8346_36439e87c8) does not match of kernel being built (4.10-rc8). Please update the PV variable to match the kernel source.
>     ERROR: linux-yocto-dev-4.9-rc++gitAUTOINC+a5183d8346_36439e87c8-r0 do_kernel_version_sanity_check: Function failed: do_kernel_version_sanity_check (log file is located at .../poky/build/tmp/work/qemux86-poky-linux/linux-yocto-dev/4.9-rc++gitAUTOINC+a5183d8346_36439e87c8-r0/temp/log.do_kernel_version_sanity_check.30252)
>     ERROR: Logfile of failure stored in: .../poky/build/tmp/work/qemux86-poky-linux/linux-yocto-dev/4.9-rc++gitAUTOINC+a5183d8346_36439e87c8-r0/temp/log.do_kernel_version_sanity_check.30252
>     ERROR: Task (.../poky/meta/recipes-kernel/linux/linux-yocto-dev.bb:do_kernel_version_sanity_check) failed with exit code '1'
>
> I found this problem whilst playing around with the
> linux-raspberrypi_dev in meta-raspberrypi which also includes
> linux-yocto.inc.
>
> Should this task be disabled for linux-yocto-dev and similar recipes?
> I'd be happy with PV = "4.9+git...." for anything in the 4.9 series
> myself.

I carry a deltask for it myself, and Cal sent a series to disable the
check recently (via a variable).

So yes, it can (and often should be disabled) for AUTOREV -dev recipes.

I pushed 4.10-rc8 to the -dev kernel a few days ago, hence why things
are triggering while my recipe version bump is cycling through the
merge process.

Bruce

>
> Thanks,
> Paul
>


