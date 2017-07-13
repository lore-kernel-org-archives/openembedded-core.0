Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2B0FA780ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 02:51:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6D2pEMH009879
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Jul 2017 19:51:15 -0700 (PDT)
Received: from [128.224.162.246] (128.224.162.246) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Jul 2017 19:51:14 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Saul Wold <sgw@linux.intel.com>
References: <cover.1499854502.git.liezhi.yang@windriver.com>
	<3afb134341c5cfde7c0f72fda35d6d94bad24704.1499854502.git.liezhi.yang@windriver.com>
	<CAJTo0LYUwPxW_0aLGwmwANyNv5sCovXijF-XrMCzTjGSr_V=Nw@mail.gmail.com>
	<dcbc00ff-666c-ce9a-9884-42224e2701e8@windriver.com>
	<CAJTo0LanadueCFtjEZXDrk3-jkv2+Y3kBO6FsSBC-9t-Ey1GWg@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <a75792ff-4291-1f5c-dca3-0a97ce64639b@windriver.com>
Date: Thu, 13 Jul 2017 10:51:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LanadueCFtjEZXDrk3-jkv2+Y3kBO6FsSBC-9t-Ey1GWg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] cryptodev: 1.8 -> 1.9
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
X-List-Received-Date: Thu, 13 Jul 2017 02:51:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/12/2017 09:39 PM, Burton, Ross wrote:
> Oh, didn't notice that.  Not sure I want to know why meta-intel has to patch
> cryptodev!
>
> CCing Saul for his input.

I've sent a patch to meta-intel@yoctoproject.org to update the patch.
If a layer has a bbappend and it patches the source, I usually prefer
not using wildcard as the version:

cryptodev-module_%.bbappend

And also set BB_DANGLINGAPPENDS_WARNONLY in layer.conf during development,
then we can have time to fix the errors.

BTW, I sent a meta-gplv2 patch to poky@yoctoproject.org two days ago, but
I didn't find it in poky@yoctoproject.org, Ross, did you see it, please ?
Maybe I should send it again.


// Robert

>
> Ross
>
> On 12 July 2017 at 14:36, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>
>
>     On 07/12/2017 08:32 PM, Burton, Ross wrote:
>
>         ERROR: cryptodev-module-1.9-r0 do_patch: Command Error: 'quilt --quiltrc
>         /data/poky-tmp/master/work/intel_corei7_64-poky-linux/cryptodev-module/1.9-r0/recipe-sysroot-native/etc/quiltrc
>         push' exited with 0  Output:
>         Applying patch 0001-zc-Force-4.10-get_user_pages_remote-API.patch
>         patching file zc.c
>         Hunk #1 FAILED at 67.
>         1 out of 1 hunk FAILED -- rejects in file zc.c
>         Patch 0001-zc-Force-4.10-get_user_pages_remote-API.patch does not apply
>         (enforce
>         with -f)
>
>
>     This patch is from meta-intel which I didn't build, sorry, I will fix it.
>
>     // Robert
>
>
>
>         Ross
>
>

