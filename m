Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RNPx4-0008Ru-RC for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 15:13:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA7E7I5R019861
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Nov 2011 14:07:18 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19698-02 for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2011 14:07:12 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA7E79JR019855
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Nov 2011 14:07:10 GMT
Message-ID: <1320674831.23708.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 07 Nov 2011 14:07:11 +0000
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/28]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Nov 2011 14:13:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-11-05 at 10:22 -0700, Saul Wold wrote:
> The following changes since commit e3c003282afb93ec52882496400b042620ab00ef:
> 
>   rt-tests: update to 0.83 (2011-11-04 15:43:19 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Bruce Ashfield (1):
>   linux-yocto_3.0: update base to v3.0.8 + meta config changes
> 
> Dmitry Cherukhin (1):
>   tslib: fix the bug with loading libts-1.0.so
> 
> Elizabeth Flanagan (1):
>   buildstats: Fix for buildstats on tmpfs
> 
> Koen Kooi (4):
>   image_types bbclass: use 4k bytes per inode so we don't run out of
>     space immediately
>   connman 0.75: bump PR for iptables library change
>   iproute2: update to 3.0.0 to fix build with updated iptables
>   lighttpd 1.4.29: rename index.html to avoid clashes with DL_DIR
> 
> Kumar Gala (1):
>   udev-164: Update init script to do an explicit add action
> 
> Martin Jansa (6):
>   libcense.bbclass: fix OpenSSL mapping
>   python: improve packaging
>   libnl-2.0: move fix-pktloc_syntax_h-race.patch to libnl-2.0
>     subdirectory and merge with fix-makefile.patch
>   libnl-2.0: add patch from meta-openembedded to fix pkg-config file
>   libnl-2.0: split to more packages, as meta-openembedded does
>   libnl-2.0: add PE/PR bump for upgradable patch for meta-openembedded
>     users
> 
> Matthew McClintock (2):
>   dtc: update to latest git version
>   Add new IMAGE_CLASSES variable for classes for image generation
> 
> Paul Eggleton (3):
>   allarch.bbclass: disable shlib and debug symbol processing
>   core-image-minimal-initramfs: force IMAGE_FSTYPES
>   qemugl: switch to new git repo
> 
> Richard Purdie (3):
>   bash: Ensure we fully reautoconf the recipes so site data is used
>   patch: Convert to use oe_terminal
>   bitbake.conf: Drop remaining TERMCMD pieces and document OE_TERMINAL
>     usage instead
> 
> Saul Wold (4):
>   cogl: COPYING file Updated FSF Address
>   dtc: Add patch to correctly install shared libraries and links
>   qmmp: Fix qmmp packaging, ensure lowercase package names
>   fotowall: disable videocapture since we do not have a webcam
> 
> Scott Garman (1):
>   distro_tracking_fields: updates for sudo, mtools, grep, and openssh
> 
> Xiaofeng Yan (1):
>   qmmp: update to 0.5.2


I've merged to master apart from where the patches had feedback.

Cheers,

Richard



