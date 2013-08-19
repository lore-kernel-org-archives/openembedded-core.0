Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C1F6169686
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 16:36:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Aug 2013 09:36:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,914,1367996400"; d="scan'208";a="388559012"
Received: from unknown (HELO helios.localnet) ([10.252.122.215])
	by fmsmga002.fm.intel.com with ESMTP; 19 Aug 2013 09:36:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 19 Aug 2013 17:36:46 +0100
Message-ID: <1574627.4jmVZAB5Ro@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1376928709.git.sgw@linux.intel.com>
References: <cover.1376928709.git.sgw@linux.intel.com>
MIME-Version: 1.0
Cc: clarson@kergoth.com, openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/25] Review and ACK
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
X-List-Received-Date: Mon, 19 Aug 2013 16:36:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 19 August 2013 09:19:55 Saul Wold wrote:
> Here is the latest C-Pull, I built this over the weekend with
> other bits.  The build resulted with some issues, so I removed
> the offending bits (Python3).
> 
> The libxext-native, I put in and then took out, but we do have a
> F19 issue that needs resolution
> 
> There is a poky.conf change that matches with Otavio's DISTRO_FEATURES
> patch, please review that also.
> 
> Thanks
> 	Sau!
> 
> The following changes since commit fd9e591f266e1a6c183e77f24e50d31e0d52bdd5:
> 
>   cronie: fix out of tree build (2013-08-19 11:24:51 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
> stage
> 
> Bruce Ashfield (2):
>   linux-yocto-3.8/meta: update drm and intel power management settings
>   linux-yocto-3.8/meta: enable ALTIVEC for qemuppc
> 
> Chen Qi (4):
>   useradd.bbclass: add missing functions to preinst
>   init-install.sh: improve hard drive searching process
>   init-install.sh: fix to handle the boot partition correctly
>   initscripts: remove obsolete device_table.txt
> 
> Chunrong Guo (1):
>   genext2fs: fix memory corruption on powerpc

This is the earlier version that doesn't use the correct Upstream-Status 
(Chunrong posted a v2).

> Jackie Huang (1):
>   texinfo: handle correctly @enumerate specification greater than 10
> 
> Joe Slater (2):
>   coreutils: add PACKAGECONFIG info for acl support

act -> acl in commit message

>   coreutils: allow for acl support
> 
> Khem Raj (3):
>   qemuppc: Change default tune to 74xx
>   uclibc: Upgrade to latest on git
>   tune-ppc7400.inc: Add tune file
> 
> Mark Hatle (1):
>   prelink: update to latest cross-prelink
> 
> Marko Lindqvist (6):
>   glib-2.0: use trim_version() to get the source directory
>   pixman: update to upstream version 0.30.2
>   curl: update to upstream version 7.32.0
>   glib-2.0: update to upstream version 2.36.4
>   gtk+: update to upstream version 2.24.20
>   gettext: update to upstream version 0.18.3
> 
> Otavio Salvador (2):
>   default-distrovars.inc: Add 'DISTRO_FEATURES_DEFAULT' variable
>   linux-dtb.inc: Fix dtb generation for kernels newer than 3.8
> 
> Paul Eggleton (1):
>   tslib: update to 1.1
> 
> Yang Shi (2):
>   Revert "hello-mod: Ensure the produced package name begins with
>     kernel-module-"
>   hello-mod: Add comment for kernel module package naming

Everything else looks OK.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

