Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id C17A56E630;
	Tue, 15 Sep 2015 05:17:23 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so10683970wic.0;
	Mon, 14 Sep 2015 22:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xxCjsx91Di8EpmkG+0G2RI/8ok81Bx7j/r1nDkw9qBw=;
	b=kolTFAwkjXJ4ks7fbd/BArdgrr6Az3K2zr3Sk188YZy3qvesXcaeno9iaCPHBpsqHP
	JVo3QUg2ApWv4VIUc3UEZjdhzZyOBJiryuvise/M2DPW3h6MDY0NgbojDbAfOEYDnVao
	0Yds54W0YJ1TyBNvKk7QENynJ7GlUOLRjQSz4b0SimpKVuT/9aX+XpsSPq26k7Q95D6M
	F/7D5NsTytxcrsoWoHJse5tDTBe/8qt5UEBkTat2XX0ULX3UWYDGaOpMLu+c1bGOAept
	AgzcRe8Ub9RZf5l+Yv2Ejm4nKOMCisETkO41y+4EbgFUnaSCE72crZhyUVfKhgWs53Ey
	V/EQ==
X-Received: by 10.194.108.232 with SMTP id hn8mr35611683wjb.154.1442294242737; 
	Mon, 14 Sep 2015 22:17:22 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ht5sm17787233wib.10.2015.09.14.22.17.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Sep 2015 22:17:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 15 Sep 2015 07:17:27 +0200
To: openembedded-core@lists.openembedded.org,
	=?iso-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Message-ID: <20150915051727.GC2380@jama>
References: <20150829123935.7DCF45031A@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20150829123935.7DCF45031A@opal.openembedded.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-commits@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IFtvZS1jb21taXRzXSBBbsOtYmFsIExpbcOzbiA6IHN5c3RlbWQ6IEluY3JlYXNlIGRldmljZXMgdGltZW91dCBpbiBRRU1VIG1hY2hpbmVzIHRvIGF2b2lkIGZhaWx1cmVzIG9uIHNlcmlhbC1nZXR0eQ==?=
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
X-List-Received-Date: Tue, 15 Sep 2015 05:17:24 -0000
X-Groupsio-MsgNum: 71091
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L6iaP+gRLNZHKoI4"
Content-Disposition: inline

--L6iaP+gRLNZHKoI4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2015 at 12:39:35PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 5196d7bacaef1076c361adaa2867be31759c1b52
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D5196d7bacaef1076c361adaa2867be31759c1b52
>=20
> Author: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
> Date:   Fri Aug 28 11:15:01 2015 -0500
>=20
> systemd: Increase devices timeout in QEMU machines to avoid failures on s=
erial-getty
>=20
> Systemd serial-getty is failing because dev-tty ends with timeout, systemd
> uses a default timeout of 90 secs that it's reached on AB's production en=
vironment
> due to high I/O loads (nfs).
>=20
> When use QEMU is used without KVM support, the machine code is executed b=
y TCG
> (software code execution) that is dependent on devices layer and causes l=
ocks
>  between TCG/Devices increasing the machine code execution time [1].
>=20
> QEMU don't support configuration of device timeout always uses a default =
one that is
> 90 secs, so the next patch increases the device timeout to 240 secs [2] i=
n order give
> enough time to get devices ready. It ONLY applies on QEMU machines.
>=20
> [YOCTO #8141]
>=20
> [1] http://blog.vmsplice.net/2011/03/qemu-internals-overall-architecture-=
and.html
> [2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8141#c10
>=20
> Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  ....c-Change-the-default-device-timeout-to-2.patch | 31 ++++++++++++++++=
++++++
>  meta/recipes-core/systemd/systemd_219.bb           |  1 +
>  2 files changed, 32 insertions(+)
>=20
> diff --git a/meta/recipes-core/systemd/systemd/qemuall_io_latency-core-de=
vice.c-Change-the-default-device-timeout-to-2.patch b/meta/recipes-core/sys=
temd/systemd/qemuall_io_latency-core-device.c-Change-the-default-device-tim=
eout-to-2.patch
> new file mode 100644
> index 0000000..c7e1711
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/qemuall_io_latency-core-device.c-=
Change-the-default-device-timeout-to-2.patch
> @@ -0,0 +1,31 @@
> +Upstream-Status: Inappropriate [Specific case QEMU/AB]
> +
> +From 7b8c4e0a67a79a75e1bd77df3a452a5497322108 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?An=3DC3=3DADbal=3D20Lim=3DC3=3DB3n?=3D <anibal.limon@l=
inux.intel.com>
> +Date: Thu, 27 Aug 2015 17:58:26 -0500
> +Subject: [PATCH] core/device.c: Change the default device timeout to 240=
 sec.
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
> +---
> + src/core/device.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/core/device.c b/src/core/device.c
> +index e7efcf0..4ed8f08 100644
> +--- a/src/core/device.c
> ++++ b/src/core/device.c
> +@@ -110,7 +110,7 @@ static void device_init(Unit *u) {
> +          * indefinitely for plugged in devices, something which cannot
> +          * happen for the other units since their operations time out
> +          * anyway. */
> +-        u->job_timeout =3D u->manager->default_timeout_start_usec;
> ++        u->job_timeout =3D (240 * USEC_PER_SEC);
> +=20
> +         u->ignore_on_isolate =3D true;
> +         u->ignore_on_snapshot =3D true;
> +--=20
> +1.9.1
> +
> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core=
/systemd/systemd_219.bb
> index e187cea..2326753 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -50,6 +50,7 @@ SRC_URI =3D "git://github.com/systemd/systemd-stable;br=
anch=3Dv219-stable;protocol=3Dg
>             file://init \
>             file://run-ptest \
>            "
> +SRC_URI_append_qemuall =3D "file://qemuall_io_latency-core-device.c-Chan=
ge-the-default-device-timeout-to-2.patch"

Most appends need to start with leading space, this breaks all build
where SRC_URI doesn't end with a space already (e.g. if some layer
appends something to SRC_URI).

I'll send patch, but be more careful next time.

> =20
>  S =3D "${WORKDIR}/git"
> =20
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L6iaP+gRLNZHKoI4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlX3qeYACgkQN1Ujt2V2gBzkeACgkPvgrw26tiu6BBYVMYDAYSlI
H9kAnR8LSrZkQjE0pGQ8fyA1Tk1QX+RX
=w1jU
-----END PGP SIGNATURE-----

--L6iaP+gRLNZHKoI4--
