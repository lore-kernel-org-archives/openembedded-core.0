Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TlO2f-0000sE-IA for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 19:06:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBJHq87T009235;
	Wed, 19 Dec 2012 17:52:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07237-08; Wed, 19 Dec 2012 17:52:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBJHpwE3009229
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 19 Dec 2012 17:51:59 GMT
Message-ID: <1355939518.18874.48.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 19 Dec 2012 17:51:58 +0000
In-Reply-To: <cover.1355903662.git.sgw@linux.intel.com>
References: <cover.1355903662.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL v2 00/56] More Updates & Fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2012 18:06:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Saul,

I merged this apart from two commits:

On Wed, 2012-12-19 at 00:03 -0800, Saul Wold wrote:
> The following changes since commit 26bf8f6a047ccc0f73eaa40093afddabfce8ea1b:
> 
>   gst-openmax: fix build with newer GLib (2012-12-17 17:53:33 +0000)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

> Chen Qi (1):
>   ICU: upgrade to 50.1.
> 
> Ciprian Ciubotariu (1):
>   packagegroup-base: use virtual runtime instead of keymap
> 
> Constantin Musca (6):
>   bitbake.conf: add nonarch_base_lib variable
>   alsa-utils: Pass udev-rules-dir as parameter
>   pcmciautils: set correct udevdir and add missing debug files
>   bluez: set correct udevdir
>   polkit: fix multilib packaging issue
>   psplash: enable multilib
> 
> Johan Hovold (1):
>   udev: fix failed /dev/shm mount
> 
> Khem Raj (1):
>   gcc-cross-canadian.inc: Add dependency on cross-gcc
> 
> Laurentiu Palcu (7):
>   avahi: use useradd.bbclass to add avahi-autoipd user
>   distcc: use useradd.bbclass to add the distcc user
>   gconf: add gconftool-2 native wrapper
>   gtk+-native: add gtk-update-icon-cache wrapper
>   xserver-xorg: upgrade to 1.13.1
>   xf86-video-intel: upgrade to 2.20.16
>   matchbox-session-sato: use a proper schema file
> 
> Marcin Juszkiewicz (2):
>   net-tools: disable Token Ring and Strip support - both got removed in
>     3.7 kernel
>   xinetd: added gnu-configize for AArch64 support
> 
> Mark Hatle (1):
>   package_rpm.bbclass: Refactor the attempt only install
> 
> Marko Kati? (1):
>   udev: Remove deprecated binaries from packaging

The commit message for this looks wrong.

> Marko Lindqvist (9):
>   fontconfig: update to upstream version 2.10.2
>   gtk+: update to upstream version 2.24.14
>   patch: drop global-reject-file patch
>   patch: update to upstream version 2.7.1
>   guile: update to upstream version 2.0.7
>   gdk-pixbuf: update to upstream version 2.26.5
>   gdb: update to upstream version 7.5.1
>   pixman: update to upstream version 0.28.2
>   libpng: update to upstream version 1.5.13
> 
> Martin Jansa (4):
>   rootfs_*.bbclass: exclude BUILDNAME var dependency from do_rootfs
>   bitbake.conf: exclude DATETIME var dependency from IMAGE_NAME
>   kernel.bbclass: use the same versioning schema for modules.tgz and
>     provide link to latest
>   iptables: include /usr/share/xtables/pf.os in PN if it's build
> 
> Ming Liu (1):
>   initscripts/urandom: create directory before staging into it
> 
> Paul Eggleton (1):
>   classes/image: handle multilibs in complementary package lookup
> 
> Phil Blundell (1):
>   kernel.bbclass: Allow modules*.tar.gz generation to be inhibited
> 
> Ross Burton (2):
>   mutter: remove
>   matchbox-wm-2: remove
> 
> Saul Wold (15):
>   standalone-sdk: Need to have an update-alternatives package

This doesn't look right and I'd like to understand why users of
update-alternatives doesn't have a dependency on it themselves?


Cheers,.

Richard



