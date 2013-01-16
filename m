Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TvS4w-0000Uy-9a for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 13:26:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0GCBQ9a023924;
	Wed, 16 Jan 2013 12:11:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20832-04; Wed, 16 Jan 2013 12:11:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0GCBJfE023918
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 16 Jan 2013 12:11:20 GMT
Message-ID: <1358338279.8129.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 16 Jan 2013 12:11:19 +0000
In-Reply-To: <cover.1358322515.git.sgw@linux.intel.com>
References: <cover.1358322515.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	r0GCBQ9a023924
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/50] automake, read-only, mutlilib, and updates
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
X-List-Received-Date: Wed, 16 Jan 2013 12:26:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2013-01-15 at 23:56 -0800, Saul Wold wrote:
> The following changes since commit 6080d1dc719c38fd97c2abd38e0ad938fbf6=
f452:
>=20
>   connman: fixed init script so connman can runs over nfs (2013-01-15 0=
8:09:30 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?=
h=3Dsgw/stage
>=20
> Andrei Dinu (1):
>   Removed undisplayed picture from connman-gnome
>=20
> Chen Qi (7):
>   runqemu scripts: add support for booting an ISO image
>   sysvinit: add ROOTFS_READ_ONLY variable to rcS-default
>   image.bbclass: add a hook funtion to support readonly rootfs
>   core-image.bbclass: support read-only rootfs
>   initscripts: support read-only rootfs
>   volatile-conf-minimal: add recipe
>   volatile-conf-sato: add recipe

This ro-rootfs stuff is setting off warnings in my mind, I need to look
at the patches more to figure out why. I therefore didn't take the
patches for now.

> Constantin Musca (5):
>   gcc: remove the 64bithack patch
>   multilib.conf: add TARGET_ARCH to MULTILIB_SAVE_VARNAME
>   gcc: enable multilib for target gcc
>   tune-mips32: add BASE_LIB to mips32 tunes
>   tune-ppc603e: add BASE_LIB

Again, something isn't quite right here, haven't figured out what yet.

> Cristian Iorga (6):
>   db: upgrade to 5.3.21
>   iproute2: upgrade to v3.7.0
>   quota: upgrade to 4.01
>   qemu: machine override ability added
>   connman-conf: configures connman in qemu machines
>   connman: upgrade to 1.10
>=20
> Emilia Ciobanu (1):
>   distrodata: Updated checkpkg task
>=20
> Eric B=C3=A9nard (1):
>   add meta-toolchain-qt
>=20
> Jesse Zhang (1):
>   coreutils: remove dependency on coreutils-native

I've replied to this one, not taken.

> Marko Lindqvist (21):
>   polkit: replace obsolete automake macros with working ones
>   pango: replace obsolete automake macros with working ones
>   libxsettings-client: replace obsolete automake macros with working
>     ones
>   rgb: replace obsolete automake macros with working ones
>   sysfsutils: replace obsolete automake macros with working ones
>   vte: replace obsolete automake macros with working ones
>   libtirpc: replace obsolete automake macros with working ones
>   curl: fix build with automake-1.13
>   bluez-hcidump: replace obsolete automake macros with working ones
>   alsa-utils: replace obsolete automake macros with working ones
>   tremor: replace obsolete automake macros with working ones
>   ofono: replace obsolete automake macros with working ones
>   libidn: add checksums to version 0.6.14 recipe
>   gzip: fix license segment md5sum boundary
>   iptables: fix license segment md5sum boundary
>   shadow: fix license segment md5sum boundary
>   ethtool: fix license segment md5sum boundary
>   gperf: fix license segment md5sum boundary
>   libidn: fix license segment md5sum boundary
>   dbus: fix license segment md5sum boundary
>   apmd: fix license segment md5sum boundary
>=20
> Muhammad Shakeel (2):
>   archiver class: Use tasks with sstate instead of pre/post funcs
>   archive-*-source.bbclass: Handle all package classes

Replied to these with feedback. They're using "internal" bitbake API and
don't need to.

> Robert P. J. Day (1):
>   image_types.bbclass: Add and update comments regarding image types.
>=20
> Saul Wold (1):
>   xz: LICENSE field is wrong
>=20
> Tom Zanussi (3):
>   lttng: remove 'legacy' lttng
>   lttng2-ust: rename to lttng-ust
>   recipes-kernel/lttng-2.0: rename to recipes-kernel/lttng

I took everything else.

Cheers,

Richard



