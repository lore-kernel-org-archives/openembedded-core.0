Return-Path: <silvio.fricke@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 005CD6D749
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 12:14:18 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q18so4423241wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 04:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=e5YGqZtxU0ckAEbwzYsSpK2tllu3pcnr58CKlHi+RdI=;
	b=NWxwKiFHsqUjpapmnDYU207U92Z5vZv6irDGFUDKC4yPBnRiwoqvVw8DGovjboLm6S
	AXGoaNsr3KB63HJ/BypS2moxLAvH2uBRRSQ/sdcdZdI0E9diyO6rpotZowmnjy8mLWvz
	D/OayVe4Y8DylaAkTw5VtfoR+JDDU787KaaRZ12DYKogzyhEZBGD7XYHqxOkVRV2sIwL
	mdlOustl8Y73Ro9xGUXo/M6/qF3j1Gso57BKlvqa2cJ6JNVL0AvNmrRsyCTcCdl53xgn
	oVo9Kb4IBgj75eo0UtuPKYitEIiTEL5fXO33bim8Icvo50IzqsEc88R2uetI05EJ45R6
	cHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=e5YGqZtxU0ckAEbwzYsSpK2tllu3pcnr58CKlHi+RdI=;
	b=ApM8qvEb9X6Sacmf+Y9+DQxU4ueXKbcB52QSG7TGfzgH2cx/Lfi5U7tNf7N2ogogM5
	JXUeCp2z7MN4uR/B7ROo/6VnfEijMfAV+2RB7bx2I6E6rKbckgkXY/0JaRj0GKT+6lP0
	WnEUQo8LWCO1ZwsviwCSviKALS8XhWgUB9VIaNvFU1HVAa16rz6WUyEEgwnRuJIYFDgL
	2qJhKBPZDh2xqOc8qhaGicfbHsSQXcpy3RrCfcrDZt2c3GI/bGcLLfyPoLEJev2oenUL
	wPV7YO/17p58koCRnwsOU4aIt9InC9Et/tWjLbyBM3KN9yOLpabL7oBOLVv6Z0DV05nx
	yNyQ==
X-Gm-Message-State: AHQUAubDIDUljLw/bayOGe7SUO0Ujgc9+rkQDJKLVWkHOe7uZ0vh78ZI
	n9qgHcHpMQqhjlh7z+WqH28=
X-Google-Smtp-Source: AHgI3IZGBj2aUHgz6cnkoARshJe3Tu20P8K8YO9hiIidSkwxW+T/XKWSr31FL7S5sLybhVAhts29wA==
X-Received: by 2002:adf:f70c:: with SMTP id r12mr5560667wrp.54.1549887259483; 
	Mon, 11 Feb 2019 04:14:19 -0800 (PST)
Received: from localhost ([2a02:8070:89b1:6700:82ee:73ff:fe95:bfa4])
	by smtp.gmail.com with ESMTPSA id
	u17sm5168197wrg.71.2019.02.11.04.14.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 04:14:18 -0800 (PST)
Date: Mon, 11 Feb 2019 13:14:17 +0100
From: "S. Fricke" <silvio.fricke@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190211121417.podjcgrldnykucgb@sfserver>
References: <cover.1549821635.git.silvio.fricke@gmail.com>
	<4c3dabb9814914747119a28172f38e2a32c0bd36.1549821635.git.silvio.fricke@gmail.com>
	<CAJTo0Laft-Z97PmWL8G4i-qrHxQUmurL6dYz_fp1PJjkwmS2hw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Laft-Z97PmWL8G4i-qrHxQUmurL6dYz_fp1PJjkwmS2hw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1 1/1] image_types: add base64 conversion
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
X-List-Received-Date: Mon, 11 Feb 2019 12:14:19 -0000
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

>    Is it?=A0 I'm genuinely curious when a base64 encoded image is useful.=
=A0

It is! :-)
We are using a softwarestack which use base64 (I am delighted thats no one =
is
using uuencode ^^) encoded images to transfer them via wire. I can not chan=
ge
this stack.

If this isn't useful, maybe you can help me to get a own conversion cmd into
my own bbclasses? I have tried it in several ways, but nothing worked. The
last approach was to change the image_type.bbclass.


TIA,
Silvio


>    Ross
>    On Mon, 11 Feb 2019 at 06:03, Silvio Fricke <[1]silvio.fricke@gmail.co=
m>
>    wrote:
>=20
>      Sometimes it is useful to have a base64 representation of an image.
>=20
>      Signed-off-by: Silvio Fricke <[2]silvio.fricke@gmail.com>
>      ---
>      =A0meta/classes/image_types.bbclass | 4 +++-
>      =A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
>      diff --git a/meta/classes/image_types.bbclass
>      b/meta/classes/image_types.bbclass
>      index 70bd315306..ddca5b624e 100644
>      --- a/meta/classes/image_types.bbclass
>      +++ b/meta/classes/image_types.bbclass
>      @@ -280,7 +280,7 @@ IMAGE_TYPES =3D " \
>      =A0# CONVERSION_CMD/DEPENDS.
>      =A0COMPRESSIONTYPES ?=3D ""
>=20
>      -CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum
>      sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2
>      ${COMPRESSIONTYPES}"
>      +CONVERSIONTYPES =3D "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum
>      sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2
>      base64 ${COMPRESSIONTYPES}"
>      =A0CONVERSION_CMD_lzma =3D "lzma -k -f -7
>      ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>      =A0CONVERSION_CMD_gz =3D "pigz -f -9 -n -c
>      ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
>      ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
>      =A0CONVERSION_CMD_bz2 =3D "pbzip2 -f -k
>      ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
>      @@ -300,6 +300,7 @@ CONVERSION_CMD_u-boot =3D "mkimage -A ${UBOOT_AR=
CH} -O
>      linux -T ramdisk -C none -n
>      =A0CONVERSION_CMD_vmdk =3D "qemu-img convert -O vmdk
>      ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
>      ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vmdk"
>      =A0CONVERSION_CMD_vdi =3D "qemu-img convert -O vdi
>      ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
>      ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.vdi"
>      =A0CONVERSION_CMD_qcow2 =3D "qemu-img convert -O qcow2
>      ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
>      ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.qcow2"
>      +CONVERSION_CMD_base64 =3D "base64
>      ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} >
>      ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.base64"
>      =A0CONVERSION_DEPENDS_lzma =3D "xz-native"
>      =A0CONVERSION_DEPENDS_gz =3D "pigz-native"
>      =A0CONVERSION_DEPENDS_bz2 =3D "pbzip2-native"
>      @@ -313,6 +314,7 @@ CONVERSION_DEPENDS_u-boot =3D "u-boot-tools-nati=
ve"
>      =A0CONVERSION_DEPENDS_vmdk =3D "qemu-native"
>      =A0CONVERSION_DEPENDS_vdi =3D "qemu-native"
>      =A0CONVERSION_DEPENDS_qcow2 =3D "qemu-native"
>      +CONVERSION_DEPENDS_base64 =3D "coreutils-native"
>=20
>      =A0RUNNABLE_IMAGE_TYPES ?=3D "ext2 ext3 ext4"
>      =A0RUNNABLE_MACHINE_PATTERNS ?=3D "qemu"
>      --
>      2.20.1
>=20
>      --
>      _______________________________________________
>      Openembedded-core mailing list
>      [3]Openembedded-core@lists.openembedded.org
>      [4]http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> References
>=20
>    Visible links
>    1. mailto:silvio.fricke@gmail.com
>    2. mailto:silvio.fricke@gmail.com
>    3. mailto:Openembedded-core@lists.openembedded.org
>    4. http://lists.openembedded.org/mailman/listinfo/openembedded-core
> /usr/bin/xdg-open: line 881: www-browser: command not found
> /usr/bin/xdg-open: line 881: links2: command not found

--=20
-- S. Fricke ---------------------------------------- silvio@port1024.net --
   Diplom-Informatiker (FH)
   Linux-Development                         Matrix: @silvio:port1024.net  =
=20
----------------------------------------------------------------------------

