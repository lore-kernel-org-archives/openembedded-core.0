Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 248BE7718C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 15:59:38 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id ez1so24211428pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 08:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=8qBZ9eU95e67TqcBJibOjIy0TF2b2rw/H7zj2F9xY9k=;
	b=yGLgP64rpY36RSpWMSof/3djZRN5KrHWxm4zjRY3HfZr3Isxf5FxRW2xAhurLo49CB
	5rDL5BpKdXqg1wZn3dWA+espR0Aegkihz6DZao29ImZHc6gTtiNgq7f0AtM1gvGNv8dy
	4ZeZom/CTvQddbi4Zk350Ufhpa/o7QwjUy+TqRlfsHDn6Y74h/8ZCKkfBbzOD1X5nO/m
	F5k3Xs7xo08gTa/0NiFZisGkElbp+mj71pjw9JMeZl7tN+RSlILT8e0ZGQ8vkZwkUWro
	9F0U+z/TRL/XM50XDISAhqI4M0bhisVimx2bd28Cy/GU5X/iGZx7JLOWLQSFaoyWmK9b
	9mag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=8qBZ9eU95e67TqcBJibOjIy0TF2b2rw/H7zj2F9xY9k=;
	b=Qc1DBkIjhIOo/FbqDOqTBYEZIQwpaBeLTpcIngcxNVNfuRUExKPNFOWHCO09KJwLg7
	ZWzs9GcfZOTky6W1UKaDdHwpS70SHTagupMg6bA70nOZ5w0P5hfyKcezVzukudfJQwCU
	w1MOQQKX88zufi+okCyeZWX2IJh82PJGYMOsGBwSib1PXiPERcBrPlANQ3KczblDgfER
	S5OPx83/ZeKPm8wRvwVkVcJYmSe1it5W4ONGA+UI2X2SB9UHaANrvcNYVrukwLwJqnrq
	ihSP7N5wEjpJXOStVpbd8Qsi3UkwL/NLWpfLz7RxmsVgl4+37dF/5MgTZjmyQH/Gpg5H
	Wkiw==
X-Gm-Message-State: AEkoousXIrDOcSuwPxpMk187whAt1LbVYCfrqDDEa6cwp8wtEM4vv3JVUWiWTFjFFRabSQ==
X-Received: by 10.66.79.167 with SMTP id k7mr125596499pax.4.1470671979455;
	Mon, 08 Aug 2016 08:59:39 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:ddaa:6f66:32b4:378?
	([2601:646:8882:b8c:ddaa:6f66:32b4:378])
	by smtp.gmail.com with ESMTPSA id
	v26sm49204572pfi.41.2016.08.08.08.59.38
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 08:59:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1470634944-24686-1-git-send-email-mingli.yu@windriver.com>
Date: Mon, 8 Aug 2016 09:00:13 -0700
Message-Id: <0679704C-A85B-4F1B-A7D9-E4CFCAE18840@gmail.com>
References: <1470634944-24686-1-git-send-email-mingli.yu@windriver.com>
To: Mingli Yu <mingli.yu@windriver.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tmpfiles.d: don't create the symbol link
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
X-List-Received-Date: Mon, 08 Aug 2016 15:59:39 -0000
X-Groupsio-MsgNum: 85469
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4A6741BE-F56A-49D2-AA0D-D91124C544E5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4A6741BE-F56A-49D2-AA0D-D91124C544E5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 7, 2016, at 10:42 PM, Mingli Yu <mingli.yu@windriver.com> =
wrote:
>=20
> Don't create symbol link for existing file
> /etc/os-release and /etc/localtime exist in our
> system, so remove below two lines in /usr/lib/tmpfiles.d/etc.conf
> L /etc/os-release - - - - ../usr/lib/os-release
> L /etc/localtime - - - - ../usr/share/zoneinfo/UTC
>=20
> * The os-release is shipped by base-files in other distributions.
>  Recently, the base-files changed the os-release directory from
>  /etc/os-release to /usr/lib/os-release, which causes systemd boot
>  up failed, so a fix was added into systemd is
>=20
>  ln -s /usr/lib/os-release /etc/os-release
>=20
>  However, the os-release file shipped by os-release in Yocto project.
>  The location is still /etc/os-release, so systemd doesn't
>  need to create the symbol link.
>=20

OE should follow upstream. Why aren=E2=80=99t we doing what systemd is =
doing ?

> * /etc/localtime file shipped by tzdata-2016e in Yocto project, so
>  no need to create symbol link as:
>  ln -s /usr/share/zoneinfo/UTC /etc/localtime
>=20
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
> ...1-tmpfiles.d-don-t-create-the-symbol-link.patch | 51 =
++++++++++++++++++++++
> meta/recipes-core/systemd/systemd_230.bb           |  1 +
> 2 files changed, 52 insertions(+)
> create mode 100644 =
meta/recipes-core/systemd/systemd/0001-tmpfiles.d-don-t-create-the-symbol-=
link.patch
>=20
> diff --git =
a/meta/recipes-core/systemd/systemd/0001-tmpfiles.d-don-t-create-the-symbo=
l-link.patch =
b/meta/recipes-core/systemd/systemd/0001-tmpfiles.d-don-t-create-the-symbo=
l-link.patch
> new file mode 100644
> index 0000000..72cd9f8
> --- /dev/null
> +++ =
b/meta/recipes-core/systemd/systemd/0001-tmpfiles.d-don-t-create-the-symbo=
l-link.patch
> @@ -0,0 +1,51 @@
> +=46rom 6f7977d79fd464f8615d68476583f4b1732865b1 Mon Sep 17 00:00:00 =
2001
> +From: Wenlin Kang <wenlin.kang@windriver.com>
> +Date: Wed, 27 Jul 2016 05:20:24 +0000
> +Subject: [PATCH] tmpfiles.d: don't create the symbol link
> +
> +Don't create symbol link for existing file
> +/etc/os-release and /etc/localtime exist in our
> +system, so remove below two lines in /usr/lib/tmpfiles.d/etc.conf
> +L /etc/os-release - - - - ../usr/lib/os-release
> +L /etc/localtime - - - - ../usr/share/zoneinfo/UTC
> +
> +* The os-release is shipped by base-files in other distributions.
> +  Recently, the base-files changed the os-release directory from
> +  /etc/os-release to /usr/lib/os-release, which causes systemd boot
> +  up failed, so a fix was added into systemd is
> +
> +  ln -s /usr/lib/os-release /etc/os-release
> +
> +  However, the os-release file shipped by os-release in Yocto =
project.
> +  The location is still /etc/os-release, so systemd doesn't need
> +  to create the symbol link.
> +
> +* /etc/localtime file shipped by tzdata-2016e in Yocto project, so
> +  no need to create symbol link as:
> +  ln -s /usr/share/zoneinfo/UTC /etc/localtime
> +
> +Upstream-Status: Inappropriate [Yocto specific]
> +
> +Signed-off-by: Yue Tao <yue.tao@windriver.com>
> +Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + tmpfiles.d/etc.conf.m4 | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/tmpfiles.d/etc.conf.m4 b/tmpfiles.d/etc.conf.m4
> +index ef7b9b9..5691a07 100644
> +--- a/tmpfiles.d/etc.conf.m4
> ++++ b/tmpfiles.d/etc.conf.m4
> +@@ -7,8 +7,6 @@
> +
> + # See tmpfiles.d(5) for details
> +
> +-L /etc/os-release - - - - ../usr/lib/os-release
> +-L /etc/localtime - - - - ../usr/share/zoneinfo/UTC
> + L+ /etc/mtab - - - - ../proc/self/mounts
> + m4_ifdef(`HAVE_SMACK_RUN_LABEL',
> + t /etc/mtab - - - - security.SMACK64=3D_
> +--
> +2.8.2
> +
> diff --git a/meta/recipes-core/systemd/systemd_230.bb =
b/meta/recipes-core/systemd/systemd_230.bb
> index 374a197..55af780 100644
> --- a/meta/recipes-core/systemd/systemd_230.bb
> +++ b/meta/recipes-core/systemd/systemd_230.bb
> @@ -36,6 +36,7 @@ SRC_URI +=3D " \
>            =
file://0021-include-missing.h-for-getting-secure_getenv-definiti.patch \
>            =
file://0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
>            file://udev-re-enable-mount-propagation-for-udevd.patch \
> +           file://0001-tmpfiles.d-don-t-create-the-symbol-link.patch =
\
> "
> SRC_URI_append_libc-uclibc =3D "\
>            =
file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
> --
> 2.8.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_4A6741BE-F56A-49D2-AA0D-D91124C544E5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleorI0ACgkQuwUzVZGdMxTsdgCfc4JGDlrFLIyOWlMjUEP1z8BL
pIIAn1wJpBVpGT4giylq+cnBMHBAMVh5
=hwB4
-----END PGP SIGNATURE-----

--Apple-Mail=_4A6741BE-F56A-49D2-AA0D-D91124C544E5--
