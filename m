Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1F31E77692
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 16:35:41 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id pp5so4702156pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2016 09:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=tMuPr3thBxXs1H03ZDYWIc9HEvNR4ZFzdQJFB9TwMSM=;
	b=QksBKqT5qyZ1NqIzOxVt9IpTHnV2jn7wOqLQUkiyOFgJeE4jt0npcdhHYlQfpZT1pB
	540PPIeD8dkbgBy2HIcqL88pYKpKV8exZdQi5K8G1igfuxyqV0MgWc/WeKOG3dICue3F
	Thc2ofY7TU0tnVhggnqWOxn4ijHKLzPZkTUPdpVOEan4t9lmwOGzsfTrebMUBvpvTgzQ
	VX8RUb2M75UwywqW+OnG28tJFGxoLti43JkcdsIMY+VFAltvTApqjZ0LTyF09TorNJZg
	XT0d/ELvHW9e4zOMiSshUoCyt4ki1zb9SxM4ZHIMWOGSChbUuAQ545G6WMW4e09pyJkg
	B7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=tMuPr3thBxXs1H03ZDYWIc9HEvNR4ZFzdQJFB9TwMSM=;
	b=EGoirpC2Jmpgq6S9oIUQIksayX56jE/ug48ZvRpLUK6e/RME+hNAMrNdAI41XYE8p5
	yzXKCcsWTnacWwgXWafqjDjwFrhdLVtArJrAAfTzkOSxtE2xi+2ynbVJnjM8Ka66iR1u
	D+3R95M5dkkYjkWfYat2FalzZW5YfhozbAH4LG/X9Xw3CQNSTQ7mTuux04y8y0k2JXdo
	uLkNJQPcbT10Sa18+B8fi8GVEF++kjqWiJx2K2bjNtnASrq6De08NeV2QEHDwlKfF2IH
	FbynhV/NG/CRa74nEG4LcFhdyHloJncUrgy1TwUFKGDNnpdPobGdCyNRGhdPPtSC0TK/
	BHTg==
X-Gm-Message-State: AE9vXwObahpBHYkN09SnE8cn8+1ywrl33EYFbqgRVu20yShyCD8rcHA1XRKpGvowhAyJjQ==
X-Received: by 10.66.76.65 with SMTP id i1mr27527314paw.51.1473179742098;
	Tue, 06 Sep 2016 09:35:42 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:99d4:c55f:fbd3:66fa?
	([2601:647:4c00:3edf:99d4:c55f:fbd3:66fa])
	by smtp.gmail.com with ESMTPSA id
	xv9sm42352534pab.36.2016.09.06.09.35.40
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Sep 2016 09:35:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160904202555.30636-1-stefan@agner.ch>
Date: Tue, 6 Sep 2016 09:35:43 -0700
Message-Id: <D66BCC92-E85B-4BCA-AB12-2517146B91C9@gmail.com>
References: <20160904202555.30636-1-stefan@agner.ch>
To: Stefan Agner <stefan@agner.ch>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: avoid circular dependency when using initramfs
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
X-List-Received-Date: Tue, 06 Sep 2016 16:35:44 -0000
X-Groupsio-MsgNum: 86810
Content-Type: multipart/signed;
	boundary="Apple-Mail=_79BD06AE-8268-43E3-9AEA-6151342D0F76";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_79BD06AE-8268-43E3-9AEA-6151342D0F76
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 4, 2016, at 1:25 PM, Stefan Agner <stefan@agner.ch> wrote:
>=20
> The kernel does not automatically mount devtmpfs when using initramfs
> based booting (even when using CONFIG_DEVTMPFS_MOUNT). If the rootfs
> is built with USE_DEVFS=3D1 (which is the default), the system ends up
> with a completely empty /dev to begin with.
>=20
> Busybox uses the first entry in inittab slightly different than
> other init systems:
> <id>: WARNING: This field has a non-traditional meaning for BusyBox =
init!
>=20
> The id field is used by BusyBox init to specify the controlling tty =
for
> the specified process to run on.  The contents of this field are
> appended to "/dev/" and used as-is.
>=20
> Since /dev/null is not there yet, Busybox throws errors instead of
> executing the commands, and hence never mounts devtmpfs:
> init started: BusyBox v1.24.1 (2016-09-04 11:53:14 PDT)
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
> can't open /dev/null: No such file or directory
>=20
> Avoid this circular dependency by not specifing <id>. With that
> Busybox ends up using the stdio of the init process and executes
> the inittab just fine.

This looks good. Have you also tested it when using busybox/mdev as main
init system just not in initramfs

>=20
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> meta/recipes-core/busybox/files/inittab | 14 +++++++-------
> 1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/recipes-core/busybox/files/inittab =
b/meta/recipes-core/busybox/files/inittab
> index bfec4a7..2bc831c 100644
> --- a/meta/recipes-core/busybox/files/inittab
> +++ b/meta/recipes-core/busybox/files/inittab
> @@ -1,13 +1,13 @@
> # This is run first except when booting in single-user mode.
>=20
> # Startup the system
> -null::sysinit:/bin/mount -t proc proc /proc
> -null::sysinit:/bin/mount -t sysfs sysfs /sys
> -null::sysinit:/bin/mount -t devtmpfs devtmpfs /dev
> -null::sysinit:/bin/mount -o remount,rw /
> -null::sysinit:/bin/mkdir -p /dev/pts
> -null::sysinit:/bin/mount -t devpts devpts /dev/pts
> -null::sysinit:/bin/mount -a
> +::sysinit:/bin/mount -t proc proc /proc
> +::sysinit:/bin/mount -t sysfs sysfs /sys
> +::sysinit:/bin/mount -t devtmpfs devtmpfs /dev
> +::sysinit:/bin/mount -o remount,rw /
> +::sysinit:/bin/mkdir -p /dev/pts
> +::sysinit:/bin/mount -t devpts devpts /dev/pts
> +::sysinit:/bin/mount -a
>=20
> ::sysinit:/etc/init.d/rcS
>=20
> --
> 2.9.0
>=20


--Apple-Mail=_79BD06AE-8268-43E3-9AEA-6151342D0F76
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlfO8F8ACgkQuwUzVZGdMxRZeQCfZi/Ftubh6ejI5UELnLCntnBC
QvgAoJCyP3xQowClwcA9SG11lSnRkhPZ
=RH5l
-----END PGP SIGNATURE-----

--Apple-Mail=_79BD06AE-8268-43E3-9AEA-6151342D0F76--
