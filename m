Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.758.1594272662923859242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 22:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ABxbpZkO;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: rehsack@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id l12so903451ejn.10
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 22:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
         :references;
        bh=eyIafpaTH29eLIz+FVAG024v27QR++f2QU7IdA1TM2Y=;
        b=ABxbpZkOIPXMrLNAkGULWDnbw/yjlEZ+Ps3s6s+RUX0/SNRhS18Lt+jAJtYWRusr+F
         zzwK9yFA0+mzjs4vuA6kVzF5jPdfm9k/5wvbV1zpnbZvLiw5aoJbblmiE6Fj3AzOrVhg
         fd6SFLfrQS/OuFlaYLFsrh8V15rWFGZL7YYiTXse3ry6Vkf9hb2AniebiVtW97gxEpt3
         9OMG3byi4XROMW+XTiSoX0SCslo0D2lUW4/GiWdJuKe+MEFDAxWaYrJWhrbSqC97ZcJx
         flmigdQJb4dfDxPdcyWU5dvIrFCgxfC0cFzS4lvJXS4Ae2PSMWMbGQw+AxKF+CU8vFWQ
         r5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:mime-version:subject:date
         :in-reply-to:cc:to:references;
        bh=eyIafpaTH29eLIz+FVAG024v27QR++f2QU7IdA1TM2Y=;
        b=fijhQej40PR5P48RvbSgh/iE8nO7QHnPU0G6AQmKH/QklRxlyxoZNwoSzwNBrLDcEX
         kcOFjT7upvmo5tukNGztwzNxq65jH6zgzSIU/I/Qu4yI8DjyMFK3g4u4Z1sJkkWYCEwa
         l0KuolMdqYUKqQBC//ngqSn0aPbJOG3GGCbtCsmr7HM+zHTrvG2a+coh4lProtjVJdpV
         jjXn/rKnjMiXjFCoONCkXKJ4AGmTlocnWWrWqD5nfgZ/nihAnuI8zpM5zCmzTkKXmCT2
         BRTmrEs0yO6tvO/cnoNqOXwMk3RPj5vNpLzwKngIic76A51yhSTRvQK/30MZYy2h5N8u
         46qQ==
X-Gm-Message-State: AOAM530VAqVCt3rsXjKUrxu5Td6qSAkFnLbuHsD6oVStGDlMRsKhIGHK
	3Vrrqqlj+fot2E+o4+lAM+Q=
X-Google-Smtp-Source: ABdhPJzB0JB+rb9ywWxTZMRkOJV/G4wNt6gFFlX3F/Hv2EcOhTszOHSOIK0kCH+qnou66hET2AlD5w==
X-Received: by 2002:a17:907:20b4:: with SMTP id pw20mr56926824ejb.225.1594272661303;
        Wed, 08 Jul 2020 22:31:01 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from [10.42.8.217] (p4fe931fc.dip0.t-ipconnect.de. [79.233.49.252])
        by smtp.gmail.com with ESMTPSA id m6sm1059265ejq.85.2020.07.08.22.31.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jul 2020 22:31:00 -0700 (PDT)
From: "Jens Rehsack" <rehsack@gmail.com>
Message-Id: <B35F64C3-D38E-4612-B68B-A359F79AE892@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [OE-core] [PATCH 1/2] rootfs-post: remove traling blanks from tasks
Date: Thu, 9 Jul 2020 07:30:59 +0200
In-Reply-To: <AM7PR05MB68810192ED5AB6DB0BDFF67DA8670@AM7PR05MB6881.eurprd05.prod.outlook.com>
Cc: openembedded-core@lists.openembedded.org
To: Konrad Weihmann <kweihmann@outlook.com>
References: <AM7PR05MB68810192ED5AB6DB0BDFF67DA8670@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Groupsio-MsgNum: 140462
Content-Type: multipart/signed;
	boundary="Apple-Mail=_484E1613-DF04-48F9-ABA1-84AA4F97079F";
	protocol="application/pgp-signature";
	micalg=pgp-sha512

--Apple-Mail=_484E1613-DF04-48F9-ABA1-84AA4F97079F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 08.07.2020 um 13:09 schrieb Konrad Weihmann <kweihmann@outlook.com>:
>=20
> remove the traling blanks before the ;-delimiter, so one could use
               ^
               here & subject: do you mean "trailing"?

> "_remove" to avoid running tasks like 'rootfs_update_timestamp',
> which are currently hardcoded and not bound to any
> configurable feature flag
>=20
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
> meta/classes/rootfs-postcommands.bbclass | 6 +++---
> meta/classes/rootfsdebugfiles.bbclass    | 2 +-
> 2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/roo=
tfs-postcommands.bbclass
> index c43b9a9823..984730ebe8 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -1,6 +1,6 @@
>=20
> # Zap the root password if debug-tweaks feature is not enabled
> -ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATUR=
ES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_passwor=
d ; ",d)}'
> +ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATUR=
ES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_passwor=
d; ",d)}'
>=20
> # Allow dropbear/openssh to accept logins from accounts with an empty pa=
ssword string if debug-tweaks or allow-empty-password is enabled
> ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURE=
S", [ 'debug-tweaks', 'allow-empty-password' ], "ssh_allow_empty_password; =
", "",d)}'
> @@ -12,7 +12,7 @@ ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_=
any("IMAGE_FEATURES", [ 'deb
> ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURE=
S", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; "=
, "",d)}'
>=20
> # Create /etc/timestamp during image construction to give a reasonably s=
ane default time setting
> -ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_update_timestamp ; "
> +ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_update_timestamp; "

How about
+ROOTFS_POSTPROCESS_COMMAND +=3D " rootfs_update_timestamp;"

Reading a list is much easier when words are separated by whitespaces.

> # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs i=
s enabled
> ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", =
"read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
> @@ -26,7 +26,7 @@ ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains(=
"IMAGE_FEATURES", "read-only
> APPEND_append =3D '${@bb.utils.contains("IMAGE_FEATURES", "read-only-roo=
tfs", " ro", "", d)}'
>=20
> # Generates test data file with data store variables expanded in json fo=
rmat
> -ROOTFS_POSTPROCESS_COMMAND +=3D "write_image_test_data ; "
> +ROOTFS_POSTPROCESS_COMMAND +=3D "write_image_test_data; "
>=20
> # Write manifest
> IMAGE_MANIFEST =3D "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ma=
nifest"
> diff --git a/meta/classes/rootfsdebugfiles.bbclass b/meta/classes/rootfs=
debugfiles.bbclass
> index e2ba4e3647..85c7ec7434 100644
> --- a/meta/classes/rootfsdebugfiles.bbclass
> +++ b/meta/classes/rootfsdebugfiles.bbclass
> @@ -28,7 +28,7 @@
> ROOTFS_DEBUG_FILES ?=3D ""
> ROOTFS_DEBUG_FILES[doc] =3D "Lists additional files or directories to be=
 installed with 'cp -a' in the format 'source1 target1;source2 target2;...'=
"
>=20
> -ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_debug_files ;"
> +ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_debug_files;"
> rootfs_debug_files () {
>    #!/bin/sh -e
>    echo "${ROOTFS_DEBUG_FILES}" | sed -e 's/;/\n/g' | while read source =
target mode; do
> --
> 2.20.1
>=20
>=20

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_484E1613-DF04-48F9-ABA1-84AA4F97079F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAl8Gq5MACgkQRJmWrtzl
Cp1rtBAAmUo+2b1MpJ6m/VmrBgHi2NK+F3aplTHAeshKF8Cb0WYvBT4k/qVuZyM9
y5/aBs9uU14mxc6DMaMpiT3+yGb4YIXFrO3UsZ2/5XMWPVcLnYXm21DVLdv/HA9h
THe06odcQO1hD87iZZlv6afaF7Az1I+raDm3UZvKCXJliSFshqcvxJgDMA0U5ven
ZB7J/f5JGNTfcw95OEJwvoCJlPkoqIuGndUVAyx6GpLMmgekgOJRN8uE502GXLpD
1H2NEURvfTYba62KRTqg2dsqgIXzjLYEaa/nK9QghtoxALSwghv/PrHFvX7r9a1X
TZW13x+QwilA9Jn8JTOOxTYvNZrbqlO8ypyliV3+RfxSJlFLPvOu45RDXGzDUGFC
8RqxAmD4+c21S8KTcPXGb5cLMGuR+PhfScaRJgNrXWMkVjNxjDJAl37aGfBmS8sD
4kkSQXDJGChxiaA9rcdQbjtmHPWrfKX4FVNPDGyZVyeCraXM+3pdygeEokLs/qBU
2qtqv6QYmyMhSiPKLvlH+CEWgVXkT5PriENOsbaepFtod0k/D2YSZNTe9z9vCGPv
moRQPxlMTuAFNE4ciuOUP1EpVcIhQH9i/nlYkb5J8Ns1oa4M6h1RRh6axigDIDRy
MpPu63MWuQMIepvLQTq77t7bEEGImO196Opuc8Oaa6nA4QXV0+w=
=WULy
-----END PGP SIGNATURE-----

--Apple-Mail=_484E1613-DF04-48F9-ABA1-84AA4F97079F--
