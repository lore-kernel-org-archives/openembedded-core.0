Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QE7V4-0000dY-A9 for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 00:10:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3OM70BY001423;
	Sun, 24 Apr 2011 23:07:00 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00849-09; Sun, 24 Apr 2011 23:06:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3OM6oUH001379
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 24 Apr 2011 23:06:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
Date: Sun, 24 Apr 2011 22:43:08 +0100
Message-ID: <1303681388.5518.370.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	p3OM70BY001423
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: Re: [PATCH 00/37] V2 - Consolidated Pull Request
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
X-List-Received-Date: Sun, 24 Apr 2011 22:10:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2011-04-22 at 23:28 -0700, Saul Wold wrote:
> Please pull this request, based on some cleanups and
> additional changes.  This has been built on multiple=20
> machines.
[...]
> Dexuan Cui (9):
>   libxfixes: upgrade from 4.0.5 to the latest version 5.0
>   util-macros: upgrade from 1.11.0 to 1.13.0
>   preferred-xorg-versions.inc: update libxfixes, util-macros,
>     xorg-cf-files
>   mdadm: upgrade from 3.1.4 to the latest version 3.2.1
>   liburcu: upgrade from 0.5.2 to 0.5.4
>   lttng-ust: upgrade from 0.11 to the latest version 0.12
>   task-poky-tools.bb, task-sdk-gmae.inc: enable lttng-ust for ARM
>   lttng-viewer: upgrade from 0.12.36 to the latest version 0.12.38
>   distro_tracking_fields.inc: update the info for the following recipes
>=20
> Gary Thomas (1):
>   Control over when package init scripts are run
>=20
> Kang Kai (1):
>   lsbsetup: add some workaround for LSB tests
>=20
> Khem Raj (1):
>   pcmciautils: Upgrade 017 -> 018
>=20
> Koen Kooi (1):
>   librsvg 2.32.1: fix postinst script
>=20
> Martin Jansa (3):
>   gconf-dbus: add SRCREV to recipe
>   xf86-video-omapfb: add SRCREV to recipe
>   task-base: allow distribution to define apm provider

I've given some feedback on these.

> Nitin A Kamble (8):
>   mpfr: upgrade from 3.0.0 to 3.0.1
>   python-gst: upgrade from 0.10.19 to 0.10.21
>   git: upgrade from 1.7.3.4 to 1.7.4.3
>   python-pycairo: fix installation path of __init__.py
>   perl-5.12.2: use of PERLHOSTLIB var fix
>   cpan.bbclass: export PERLHOSTLIB for perl modules
>   libxml-parser-perl: upgrade from 2.36 to 2.40
>   distro_tracking: recipe information update
>=20
> Petr =C5=A0tetiar (1):
>   modutils-initscripts: fix wrong order of module loading happening in
>     udev
>=20
> Saul Wold (4):
>   slang: Fix host contamination issue
>   qemu: disable sdl for target build
>   ofono: add bluez4 to DEPENDS list
>   qemu-helper-nativesdk: Update LIC_FILE_CHKSUM for renamed helper
>=20
> Tom Zanussi (1):
>   linux-tools.inc: turn off newt and dwarf for perf
>=20
> Xiaofeng Yan (1):
>   create-lsb-image:Rename creat-lsb-image and fix some bugs
>=20
> Zhai Edwin (6):
>   tasks: Upgrade to 0.19 (from 0.18)
>   avahi: Upgrade to 0.6.30 (from 0.6.28)
>   consolekit: Upgrade to 0.4.4 (from 0.4.3)
>   libgpg-error: Upgrade to 1.10 (from 1.9)
>   jpeg: Upgrade to 8c (from 8b)
>   puzzles: Upgrade to svn r9151 (from r9084)

but I merged everything else, thanks!

Richard




