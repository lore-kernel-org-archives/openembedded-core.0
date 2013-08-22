Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 4996260842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:17:26 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 Aug 2013 10:17:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,935,1367996400"; d="scan'208";a="350263770"
Received: from timevans-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.195])
	by azsmga001.ch.intel.com with ESMTP; 22 Aug 2013 10:17:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 18:17:01 +0100
Message-ID: <9633335.TuIVTMGLYv@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1377188323.git.sgw@linux.intel.com>
References: <cover.1377188323.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 00/31] Updated for Final Review
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
X-List-Received-Date: Thu, 22 Aug 2013 17:17:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 22 August 2013 09:26:02 Saul Wold wrote:
> I updated a few of the commit messages and removed the Python3
> patch set along with a couple other patches which include the
> Build Appliance related ones and cpan patch (I will have an
> alternate fix soon)
> 
> Sau!
> 
> The following changes since commit 4c5756149754d0b18b14595db335f8f5e14cc0a3:
> 
>   busybox.inc: Avoid error when SYSLOG is not enabled (2013-08-22 15:10:06
> +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
> stage
> 
> Cristian Iorga (1):
>   builder: register directories with pcmanfm
> 
> Jonathan Liu (3):
>   xf86-video-intel: remove duplicate xf86driproto from DEPENDS
>   xf86-video-vesa: remove duplicate xf86driproto from DEPENDS
>   mesa: enable additional drivers for gallium-llvm x86/x86-64
> 
> Kai Kang (3):
>   bc: add patch to fix segmentation fault
>   libx11: upgrade to 1.6.1
>   libx11-diet: upgrade to 1.6.1
> 
> Khem Raj (1):
>   eglibc: Update SRC_URI and fix unpackaged empty dir
> 
> Lauren Post (2):
>   directfb: Upgrade to 1.6.3
>   directfb: add fusion patch for hangs
> 
> Mark Hatle (11):
>   image.bbclass: Add basic support for PACKAGE_EXCLUDE
>   python-smartpm: Add support for excluding package from the install
>   package_rpm.bbclass:  Add support for PACKAGE_EXCLUDE to RPM installs
>   python-smartpm: Add support to disable installing recommends
>   package_rpm.bbclass: NO_RECOMMENDATIONS support
>   package_deb.bbclass: Use the WORKDIR not SYSROOT for temp files
>   package_deb: Add support for NO_RECOMMENDATIONS and PACKAGE_EXCLUDE
>   opkg: Add --no-install-recommends option.
>   package_ipk: Add support for NO_RECOMMENDATIONS
>   opkg: Add support for excluding packages from the install
>   package_ipk: Add support for PACKAGE_EXCLUDE
> 
> Marko Lindqvist (3):
>   texinfo: correct dont-depend-on-help2man.patch
>   SDL2: add recipe

It would be great to tweak SDL2 -> libsdl2 in the commit message here.

>   boost: fix build when PARALLEL_MAKE is not set
> 
> Otavio Salvador (1):
>   distro_features_check.bbclass: Allow checking of required/conflicting
>     features
> 
> Paul Eggleton (1):
>   gst-plugins-good: fix orc enabling via PACKAGECONFIG
> 
> Roy.Li (1):
>   shadow: backport a patch to make newgrp work
> 
> Saul Wold (3):
>   libsdl: Backport xData32 patch for x11 update
>   valgrind: Backport patch for eglibc 2.18
>   gnupg: Update to 2.0.21
> 
> Yevhen Kyriukha (1):
>   connman: fix systemd support for connman-* packages.

Other than the above minor suggestion:

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 

Paul Eggleton
Intel Open Source Technology Centre

