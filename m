Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7FDD6AC20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 06:28:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9O6SnZe011594
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Oct 2014 23:28:49 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 23 Oct 2014 23:28:48 -0700
Message-ID: <5449F19E.4020200@windriver.com>
Date: Fri, 24 Oct 2014 14:28:46 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1413879309.git.Chong.Lu@windriver.com>
	<6fe7bbee542ba42ae03304919b3c7abbe63bc8b4.1413879309.git.Chong.Lu@windriver.com>
	<CAJTo0LYxF2JA+3uaZqrAWPnvNpZkfZRpDvnBg6qg-K04T5_CHg@mail.gmail.com>
In-Reply-To: <CAJTo0LYxF2JA+3uaZqrAWPnvNpZkfZRpDvnBg6qg-K04T5_CHg@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kmod: fix debuginfo is missing in shared library
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
X-List-Received-Date: Fri, 24 Oct 2014 06:28:51 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/23/2014 10:21 PM, Burton, Ross wrote:
>
> On 21 October 2014 09:16, Chong Lu <Chong.Lu@windriver.com 
> <mailto:Chong.Lu@windriver.com>> wrote:
>
>     -INHIBIT_PACKAGE_STRIP = "${@bb.utils.contains("DISTRO_FEATURES",
>     "ptest", "1", "0", d)}"
>     +INHIBIT_PACKAGE_STRIP_${PN}-ptest =
>     "${@bb.utils.contains("DISTRO_FEATURES", "ptest", "1", "0", d)}"
>
>
> Was this actually tested?
>
> ERROR: runstrip: ''arm-poky-linux-gnueabi-strip' --strip-debug 
> --remove-section=.comment --remove-section=.note --preserve-dates 
> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/armv5te-poky-linux-gnueabi/kmod/18+gitAUTOINC+ae58de0fcb-r0/package/usr/lib/kmod/ptest/testsuite/rootfs/test-depmod/detect-loop/lib/modules/4.4.4/kernel/moduleA.ko'' 
> strip command failed
>
> INHIBIT_PACKAGE_STRIP isn't a per-package variable as stripping 
> happens before the package-splitting.   Moving it to happen after 
> splitting won't be trivial as you'd need to know what package to put 
> the resultant files into.  Maybe we need a strip blacklist?
>
> Ross

Drop this one, I have send a v2.

Best Regards
Chong

