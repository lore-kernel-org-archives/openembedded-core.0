Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 30DE96B2CA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 08:56:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Aug 2013 01:56:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,800,1367996400"; d="scan'208";a="375040664"
Received: from unknown (HELO helios.localnet) ([10.252.122.201])
	by fmsmga001.fm.intel.com with ESMTP; 02 Aug 2013 01:56:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 02 Aug 2013 09:56:30 +0100
Message-ID: <2742525.TaHAicXVaK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1375419531.git.sgw@linux.intel.com>
References: <cover.1375419531.git.sgw@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/45] Initial Review - lots of upgrades
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
X-List-Received-Date: Fri, 02 Aug 2013 08:56:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 02 August 2013 00:15:00 Saul Wold wrote:
> Ross, Paul:
> 
> Please review this batch, contains alot of updates along with some
> patches and bug fixes.
> 
> Thanks
> 	Sau!
> 
> 
> The following changes since commit f192c444c2d88c49738bea4ff4c3af0cc72916de:
> 
>   texinfo: Update to 5.1 (2013-07-31 06:56:28 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
> stage
> 
> Chen Qi (1):
>   opkg.inc: remove the obsolete REDIRECT_CMD
> 
> Cristian Iorga (2):
>   alsa-lib: upgrade to v1.0.27.2
>   alsa-utils: upgrade to 1.0.27.2
> 
> Eric Nelson (1):
>   gst-plugins-gl: add explicit dependency on libpng
> 
> Ionut Radu (1):
>   apt: Upgrade from 0.9.8.2 to 0.9.9.4
> 
> Joe MacDonald (1):
>   oe-find-native-sysroot: minor optimization
> 
> Jukka Rissanen (3):
>   ofono: Add systemd support
>   ofono: Move bluetooth enabling to .inc file
>   ofono: Enable test scripts by default
> 
> Khem Raj (1):
>   gcc-4.8: Fix meta-fsl-arm iperf build issue
> 
> Laurentiu Palcu (13):
>   adt_installer: allow specifying relative target sysroot paths
>   xf86-video-intel: upgrade to 2.21.13
>   git: upgrade to 1.8.3.4
>   nasm: upgrade to 2.10.09
>   powertop: upgrade to 2.4
>   libdrm: upgrade to 2.4.46
>   libpciaccess: upgrade to 0.13.2
>   xrandr: upgrade to 1.4.1
>   xf86-input-evdev: upgrade to 2.8.1
>   xhost: upgrade to 1.0.6
>   makedepend: upgrade to 1.0.5
>   flex: upgrade to 2.5.37

This one needs PR dropping.

>   grub_2.00: fix compilation when using flex 2.5.37
> 
> Martin Jansa (1):
>   mesa: inherit gettext
> 
> Muhammad Shakeel (1):
>   avahi: Remove unnecessary runtime dependency on sysvinit-pidof
> 
> Paul Barker (1):
>   opkg: Bump SRCREV as patch has been applied upstream
> 
> Paul Eggleton (3):
>   classes/sanity: check for suid root command evility
>   classes/sanity: fix some grammatical errors in messages
>   grub: disable floating ncurses dependency for GPLv2 version

While you're at it could you please tweak my commit message for that last one 
to to replace "because ncurses" with "because there ncurses"? I just noticed 
it doesn't quite read properly at the moment.

> Richard Tollerton (1):
>   shadow: Fix build when DISTRO_FEATURES contains pam, libc-crypt
> 
> Rogerio Nunes (1):
>   packagegroup-core-tools-testapps: isolate x11 dependent tools
> 
> Ross Burton (3):
>   bluez5: Add obex-profiles as a PACKAGECONFIG, package obexd separately
>   qemu: remove unused SDL variable
>   u-boot: state the MACHINE when skipping u-boot
> 
> Saul Wold (7):
>   dpkg: upgrade to 1.17.1
>   dpkg: Drop INC_PR as it's unused
>   glew: upgrade to 1.10.0
>   libgcrypt: upgrade to 1.5.3
>   resolvconf: upgrade to 1.74
>   xorg-cf-files: upgrade to 1.0.5
>   grep: Add patch for texinfo 5.1
> 
> Stefan Stanacar (4):
>   oeqa/utils/sshcontrol: increase and log timeout in output
>   oeqa/utils/qemurunner: add comment and header
>   oeqa/utils/qemurunner: tweak console bootparam and ip command
>   oeqa/runtime/xorg: use the right ps command for xorg test

Otherwise they all look good to me.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

