Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8478E71633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 19:20:08 +0000 (UTC)
Received: by wicfv10 with SMTP id fv10so20365873wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 12:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=M9cfTwikKdLxpD8vFjey9PbZJEBpWOhqQLuhEbuCJJU=;
	b=bS3NGgvKkXP3vvjGxehs9adUL8ifoQLpJJtRbk3IGkQ0Y9iJr7ZtdtdDoltgh8B4Bg
	XaBMj+AdxASKgM1eOO1t8TQZevSxvhtd+hwWbBQnTelBU6saTWr+4sl8/tNcficxrqPX
	zes/qSWg/1WkkbbrV5pF4KBKXfeX0WO+tBkBiav4tiPZ65Kp67Bv/cbjByT6BSqZZZr8
	cXeWXJHWmdt22TntB5CG0fEEUU31sewu8dJ+tthC4p/x98g7tfBIRLT9CrLKN8Rm8gq4
	HloF2kX7OjY1am4LfYaDSGN6zC3so4voVog/yVthxaKBHvCkl7waXFdElcR6l+d4sGV1
	TFQw==
X-Received: by 10.194.5.103 with SMTP id r7mr12579647wjr.47.1440789608942;
	Fri, 28 Aug 2015 12:20:08 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cw8sm9337467wjb.49.2015.08.28.12.20.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 12:20:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 28 Aug 2015 21:20:34 +0200
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20150828192034.GB2488@jama>
References: <cover.1440789168.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1440789168.git.akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/17] For Dizzy 1.7.3a
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
X-List-Received-Date: Fri, 28 Aug 2015 19:20:12 -0000
X-Groupsio-MsgNum: 70260
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline

--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2015 at 12:16:04PM -0700, Armin Kuster wrote:
> Please consider these addition changes for Dizzy 1.7.3
>=20
> The following changes since commit 86971b5d97645cdbf2e48c39f30afa7c44e81e=
81:
>=20
>   oeqa/bbtests: Fix to ensure DL_DIR is set (2015-07-26 07:59:00 +0000)

Some of these changes were already applied in dizzy, you should refresh
your dizzy branch:

OE @ ~/openembedded-core $ git log origin/dizzy --oneline
4621675 grub-efi: Add backslash lost from previous commit
ac135bd grub-efi: Use the backport patch from grub
8687b8b license_class: Fix choose_lic_set into incompatible license
5f50f90 dpkg: Fix tarfix.patch
386898a dpkg: Fix for Fedora22 and new versions of tar
c58814c oeqa/bbtests: Fix to ensure DL_DIR is set
e443498 oeqa/bbtests: Fix race over DL_DIR and SSTATE_DIR

>=20
> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
>   http://git.yoctoproject.org/cgit.cgi//log/?h=3Dakuster/dizzy-next
>=20
> Alejandro Hernandez (1):
>   qemurunner: Improves checking for server and target IPs on qemus
>     parameters
>=20
> An=EDbal Lim=F3n (2):
>   license_class: Fix choose_lic_set into incompatible license
>   license_class: fix license.manifest shows LICENSE field differently to
>     recipe
>=20
> Martin Jansa (2):
>   connman-conf: fix SRC_URI_append
>   license.bbclass: fix unexpected operator for LICENSE values with space
>=20
> Paul Eggleton (1):
>   oeqa/utils/qemurunner: fix logging
>=20
> Petter Mab=E4cker (1):
>   meta: set proper S value
>=20
> Richard Purdie (3):
>   dpkg: Fix for Fedora22 and new versions of tar
>   dpkg: Fix tarfix.patch
>   grub-efi: Add backslash lost from previous commit
>=20
> Ross Burton (1):
>   oeqa/QemuRunner: don't use bb for logging
>=20
> Saul Wold (1):
>   grub-efi: Use the backport patch from grub
>=20
> Sona Sarmadi (4):
>   bind9.9.5: CVE-2015-5477
>   qemu: CVE-2014-7840
>   qemu-vnc: CVE-2014-7815
>   qemu-slirp: CVE-2014-3640
>=20
> Yi Zhao (1):
>   oeqa/selftest: fix test_incremental_image_generation for changes in
>     log output
>=20
>  meta/classes/license.bbclass                       | 18 +++---
>  meta/lib/oeqa/selftest/buildoptions.py             | 11 ++--
>  meta/lib/oeqa/utils/qemurunner.py                  | 73 ++++++++++++----=
------
>  meta/recipes-bsp/alsa-state/alsa-state.bb          |  2 +
>  meta/recipes-bsp/grub/grub-efi_2.00.bb             |  1 +
>  meta/recipes-bsp/hostap/hostap-conf_1.0.bb         |  2 +
>  meta/recipes-bsp/keymaps/keymaps_1.0.bb            |  2 +
>  .../bind/bind/bind9_9_5-CVE-2015-5477.patch        | 45 +++++++++++++
>  meta/recipes-connectivity/bind/bind_9.9.5.bb       |  1 +
>  meta/recipes-connectivity/connman/connman-conf.bb  |  8 ++-
>  .../ppp-dialin/ppp-dialin_0.1.bb                   |  2 +
>  .../init-ifupdown/init-ifupdown_1.0.bb             |  2 +
>  .../initrdscripts/initramfs-boot_1.0.bb            |  2 +
>  .../initrdscripts/initramfs-framework_1.0.bb       |  2 +
>  .../initrdscripts/initramfs-live-boot_1.0.bb       |  2 +
>  .../initramfs-live-install-efi-testfs_1.0.bb       |  2 +
>  .../initramfs-live-install-efi_1.0.bb              |  2 +
>  .../initramfs-live-install-testfs_1.0.bb           |  2 +
>  .../initrdscripts/initramfs-live-install_1.0.bb    |  2 +
>  meta/recipes-core/initscripts/initscripts_1.0.bb   |  2 +
>  .../systemd/systemd-systemctl-native.bb            |  2 +
>  .../sysvinit/sysvinit-inittab_2.88dsf.bb           |  2 +-
>  meta/recipes-core/udev/udev-extraconf_1.1.bb       |  2 +
>  meta/recipes-devtools/dpkg/dpkg/tarfix.patch       | 45 +++++++++++++
>  meta/recipes-devtools/dpkg/dpkg_1.17.4.bb          |  1 +
>  meta/recipes-devtools/opkg/opkg-collateral.bb      |  2 +
>  .../recipes-devtools/qemu/qemu/CVE-2014-7840.patch | 57 +++++++++++++++++
>  .../qemu/qemu/slirp-CVE-2014-3640.patch            | 48 ++++++++++++++
>  .../qemu/qemu/vnc-CVE-2014-7815.patch              | 53 ++++++++++++++++
>  meta/recipes-devtools/qemu/qemu_2.1.0.bb           |  3 +
>  .../run-postinsts/run-postinsts_1.0.bb             |  2 +
>  .../shadow/shadow-securetty_4.2.1.bb               |  2 +
>  .../xorg-xserver/xserver-xf86-config_0.1.bb        |  2 +
>  .../modutils-initscripts/modutils-initscripts.bb   |  3 +
>  meta/recipes-qt/qt-demo/qt-demo-init_0.1.bb        |  2 +
>  .../ptest-runner/ptest-runner_1.0.bb               |  2 +
>  36 files changed, 361 insertions(+), 50 deletions(-)
>  create mode 100644 meta/recipes-connectivity/bind/bind/bind9_9_5-CVE-201=
5-5477.patch
>  create mode 100644 meta/recipes-devtools/dpkg/dpkg/tarfix.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2014-7840.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/slirp-CVE-2014-3640.p=
atch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/vnc-CVE-2014-7815.pat=
ch
>=20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXgtIEACgkQN1Ujt2V2gBwg9wCfTASdQdjMBYRQxUGz9nADmx7S
wPgAniv0be5QeKbQuRQiaQvRM5jDiW6L
=Qljf
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
