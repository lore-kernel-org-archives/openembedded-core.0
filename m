Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B27F16AFBA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 17:19:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2013 10:17:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,654,1367996400"; d="scan'208";a="369257403"
Received: from unknown (HELO helios.localnet) ([10.252.122.54])
	by orsmga002.jf.intel.com with ESMTP; 12 Jul 2013 10:19:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2013 18:19:45 +0100
Message-ID: <91579262.ustWe2Jvc9@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <cover.1373649195.git.sgw@linux.intel.com>
References: <cover.1373649195.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 00/27] REVIEWED & READY
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
X-List-Received-Date: Fri, 12 Jul 2013 17:19:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 12 July 2013 10:16:45 Saul Wold wrote:
> Richard,
> 
> Poss and Paul have reviewed this set and either acked the
> last email or will ack this one.
> 
> I removed Stefan's change from this one, since he posted a new set for
> weekend review. This also includes the updated distrodata (v3) from Ema
> 
> Please take the 2 items for Poky also from Tom and Ema (yocto-kernel and
> package regex)
> 
> Thanks
> 	Sau!
> 
> The following changes since commit 4f5009dcbbeb27bdf5dcaebb3b457fecef410ebe:
> 
>   security_flags: Add addition recipes to the non pie list (2013-07-10
> 09:40:42 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
> stage
> 
> Andreas Oberritter (4):
>   xserver-xorg: extend packageconfig and dependencies
>   cogl-1.0: put each library into its own package
>   cogl-1.0: make building cogl-pango optional
>   qt4-x11-free: fix post-processing of QtWebKit.pc
> 
> Bian Naimeng (1):
>   package_rpm.bbclass: remove xx.spec before doing rpmbuild xx.src.rpm

This looked a bit odd and the commit message doesn't fully explain how the 
problem comes about; the issue can be worked around another way, but 
considering the trivial nature of the change and that it solves a rather nasty 
error condition (see thread for details), I'm OK with it being merged.

> Cristian Iorga (3):
>   libogg: upgrade to 1.3.1
>   xdg-utils: upgrade to 1.1.0-rc1
>   dbus: upgrade to 1.6.10
> 
> Darren Hart (1):
>   alsa-state: Provide an empty asound.conf by default
> 
> Emilia Ciobanu (1):
>   distrodata.bbaclass: change in git and svn package reporting
> 
> Gabriel Barbu (1):
>   ethtool: add ptest
> 
> Hongxu Jia (5):
>   nspr: add native version
>   packagegroup-core-lsb: add nss for LSB library check
>   nss: add version 3.15.1
>   nss: create checksum files for the nss libraries
>   nss: fix incorrect shebang line of perl script
> 
> Jonathan Liu (1):
>   boot-directdisk: allow specifying custom MBR disk signature
> 
> Kang Kai (1):
>   packagegroup-core-tools-profile: exclude systemtap and valgrind for
>     mips64
> 
> Mark Hatle (1):
>   qemu: QEMU fix libtool usage
> 
> Radu Moisan (3):
>   iputils: Upgrade to v20121221
>   diffutils: Upgrade to v3.3
>   rxvt-unicode: Check existence of acinclude.m4
> 
> Roy.Li (1):
>   pango: remove pango-module-basic-x RRECOMMENDS
> 
> Saul Wold (3):
>   boost: backport glibc patch for new eglibc
>   pciutils: Add kmod dependency
>   ncurses: add xterm-256color to terminfo-base
> 
> Sergey Matyukevich (1):
>   powertop: fix update-alternatives link


Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 

Paul Eggleton
Intel Open Source Technology Centre

