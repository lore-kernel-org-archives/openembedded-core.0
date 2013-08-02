Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id AB12D6A9E1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 15:35:05 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2013 08:35:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,802,1367996400"; d="scan'208";a="276853871"
Received: from unknown (HELO helios.localnet) ([10.252.122.201])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2013 08:35:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 02 Aug 2013 16:35:03 +0100
Message-ID: <1884229.ooeQbcBQ1r@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1375456955.git.sgw@linux.intel.com>
References: <cover.1375456955.git.sgw@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/45] Final Review & ACK
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
X-List-Received-Date: Fri, 02 Aug 2013 15:35:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 02 August 2013 08:32:43 Saul Wold wrote:
> Richard,
> 
> Updated based on Paul's comments
> 
> This set went through the Autobuilder with the Python3 changes, some
> of the failures on the AB are Pyhton3 related, but have not been included
> here yet.
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
> 
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

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

-- 

Paul Eggleton
Intel Open Source Technology Centre

