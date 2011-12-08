Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RYkgT-00072A-6L
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 21:35:13 +0100
Received: by lahd3 with SMTP id d3so852212lah.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 12:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=JNMY8Iqmn/OIJYD67pvrhWjLagXKfHlc5R2f6O9rZO4=;
	b=MldZqsYvEiDoXTez6LdSGBFg8DTdvSpTeI7DTo1ancfgKA60luT7LtA7r1BDF/XmoF
	KyhBq2na8NqeA20JFk7t2n68CKcE9QF17Af1IZR+wPN8cquFlKBlOeCXy+9AoLjZiH9l
	8+/eH3sPiu++Z6nHmTn13flzPIyXw89+uWEbk=
Received: by 10.152.145.233 with SMTP id sx9mr3014216lab.6.1323376102320; Thu,
	08 Dec 2011 12:28:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Thu, 8 Dec 2011 12:27:51 -0800 (PST)
In-Reply-To: <ed534a9d15bc3a952b9a4ca736e0c25c13b670af.1323360188.git.mark.hatle@windriver.com>
References: <cover.1323360188.git.mark.hatle@windriver.com>
	<ed534a9d15bc3a952b9a4ca736e0c25c13b670af.1323360188.git.mark.hatle@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Dec 2011 12:27:51 -0800
Message-ID: <CAMKF1soxFdTkTQNVXLC=AVakA9MAiY31Npp4Rrjn-aDPKYG7og@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Rename leftover POKY references to OE in image variables
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
X-List-Received-Date: Thu, 08 Dec 2011 20:35:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 8, 2011 at 8:03 AM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> The names POKY_BASE_INSTALL and POKY_EXTRA_INSTALL have been renamed
> to OE_BASE_INSTALL and OE_EXTRA_INSTALL.
>

How about calling it IMAGE_* instead ?

> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
> =C2=A0meta/classes/core-image.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A08 ++++----
> =C2=A0meta/recipes-core/images/core-image-minimal.bb =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +-
> =C2=A0meta/recipes-core/images/self-hosted-image.bb =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-extended/images/core-image-basic.bb =C2=A0 | =C2=A0 =
=C2=A02 +-
> =C2=A0meta/recipes-extended/images/core-image-lsb-dev.bb | =C2=A0 =C2=A02=
 +-
> =C2=A0meta/recipes-extended/images/core-image-lsb-sdk.bb | =C2=A0 =C2=A02=
 +-
> =C2=A0meta/recipes-extended/images/core-image-lsb.bb =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +-
> =C2=A0meta/recipes-graphics/images/core-image-clutter.bb | =C2=A0 =C2=A02=
 +-
> =C2=A0meta/recipes-qt/images/qt4e-demo-image.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A09 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bb=
class
> index 8e83d4a..fd8d5d2 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -45,18 +45,18 @@ PACKAGE_GROUP_ssh-server-openssh =3D "task-core-ssh-o=
penssh"
> =C2=A0PACKAGE_GROUP_package-management =3D "${ROOTFS_PKGMANAGE}"
> =C2=A0PACKAGE_GROUP_qt4-pkgs =3D "task-core-qt-demos"
>
> -POKY_BASE_INSTALL =3D '\
> +OE_BASE_INSTALL =3D '\
> =C2=A0 =C2=A0 task-core-boot \
> =C2=A0 =C2=A0 task-base-extended \
> =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 ${@base_contains("IMAGE_FEATURES", "package-management", ""=
, "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)} \
> =C2=A0 =C2=A0 \
> - =C2=A0 =C2=A0${POKY_EXTRA_INSTALL} \
> + =C2=A0 =C2=A0${OE_EXTRA_INSTALL} \
> =C2=A0 =C2=A0 '
>
> -POKY_EXTRA_INSTALL ?=3D ""
> +OE_EXTRA_INSTALL ?=3D ""
>
> -IMAGE_INSTALL ?=3D "${POKY_BASE_INSTALL}"
> +IMAGE_INSTALL ?=3D "${OE_BASE_INSTALL}"
>
> =C2=A0X11_IMAGE_FEATURES =C2=A0=3D "x11-base apps-x11-core package-manage=
ment"
> =C2=A0ENHANCED_IMAGE_FEATURES =3D "${X11_IMAGE_FEATURES} apps-x11-games a=
pps-x11-pimlico package-management"
> diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipe=
s-core/images/core-image-minimal.bb
> index 56fc20c..4837cd4 100644
> --- a/meta/recipes-core/images/core-image-minimal.bb
> +++ b/meta/recipes-core/images/core-image-minimal.bb
> @@ -1,7 +1,7 @@
> =C2=A0#
> =C2=A0# Copyright (C) 2007 OpenedHand Ltd.
> =C2=A0#
> -IMAGE_INSTALL =3D "task-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${POKY_E=
XTRA_INSTALL}"
> +IMAGE_INSTALL =3D "task-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${OE_EXT=
RA_INSTALL}"
>
> =C2=A0IMAGE_LINGUAS =3D " "
>
> diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes=
-core/images/self-hosted-image.bb
> index 53bd989..255928f 100644
> --- a/meta/recipes-core/images/self-hosted-image.bb
> +++ b/meta/recipes-core/images/self-hosted-image.bb
> @@ -1,6 +1,6 @@
> =C2=A0IMAGE_INSTALL =3D "task-core-boot task-core-apps-console task-core-=
ssh-openssh task-self-hosted"
>
> -POKY_EXTRA_INSTALL =3D "\
> +OE_EXTRA_INSTALL =3D "\
> =C2=A0 =C2=A0 task-self-hosted \
> =C2=A0 =C2=A0 "
>
> diff --git a/meta/recipes-extended/images/core-image-basic.bb b/meta/reci=
pes-extended/images/core-image-basic.bb
> index ba71cd0..5543fe9 100644
> --- a/meta/recipes-extended/images/core-image-basic.bb
> +++ b/meta/recipes-extended/images/core-image-basic.bb
> @@ -5,6 +5,6 @@ IMAGE_INSTALL =3D "\
> =C2=A0 =C2=A0 task-core-basic \
> =C2=A0 =C2=A0 "
>
> -# =C2=A0 =C2=A0${POKY_BASE_INSTALL}
> +# =C2=A0 =C2=A0${OE_BASE_INSTALL}
>
> =C2=A0inherit core-image
> diff --git a/meta/recipes-extended/images/core-image-lsb-dev.bb b/meta/re=
cipes-extended/images/core-image-lsb-dev.bb
> index 9ef85ff..98ec5ae 100644
> --- a/meta/recipes-extended/images/core-image-lsb-dev.bb
> +++ b/meta/recipes-extended/images/core-image-lsb-dev.bb
> @@ -1,7 +1,7 @@
> =C2=A0IMAGE_FEATURES +=3D "apps-console-core dev-pkgs ssh-server-openssh"
>
> =C2=A0IMAGE_INSTALL =3D "\
> - =C2=A0 =C2=A0${POKY_BASE_INSTALL} \
> + =C2=A0 =C2=A0${OE_BASE_INSTALL} \
> =C2=A0 =C2=A0 task-core-basic \
> =C2=A0 =C2=A0 task-core-lsb \
> =C2=A0 =C2=A0 "
> diff --git a/meta/recipes-extended/images/core-image-lsb-sdk.bb b/meta/re=
cipes-extended/images/core-image-lsb-sdk.bb
> index 5e0e7ae..94ab995 100644
> --- a/meta/recipes-extended/images/core-image-lsb-sdk.bb
> +++ b/meta/recipes-extended/images/core-image-lsb-sdk.bb
> @@ -3,7 +3,7 @@ EXTRA_IMAGE_FEATURES =3D "tools-debug tools-profile tools=
-testapps debug-tweaks"
>
>
> =C2=A0IMAGE_INSTALL =3D "\
> - =C2=A0 =C2=A0${POKY_BASE_INSTALL} \
> + =C2=A0 =C2=A0${OE_BASE_INSTALL} \
> =C2=A0 =C2=A0 task-core-basic \
> =C2=A0 =C2=A0 task-core-lsb \
> =C2=A0 =C2=A0 "
> diff --git a/meta/recipes-extended/images/core-image-lsb.bb b/meta/recipe=
s-extended/images/core-image-lsb.bb
> index 22eb7f4..7369c89 100644
> --- a/meta/recipes-extended/images/core-image-lsb.bb
> +++ b/meta/recipes-extended/images/core-image-lsb.bb
> @@ -1,7 +1,7 @@
> =C2=A0IMAGE_FEATURES +=3D "apps-console-core ssh-server-openssh"
>
> =C2=A0IMAGE_INSTALL =3D "\
> - =C2=A0 =C2=A0${POKY_BASE_INSTALL} \
> + =C2=A0 =C2=A0${OE_BASE_INSTALL} \
> =C2=A0 =C2=A0 task-core-basic \
> =C2=A0 =C2=A0 task-core-lsb \
> =C2=A0 =C2=A0 "
> diff --git a/meta/recipes-graphics/images/core-image-clutter.bb b/meta/re=
cipes-graphics/images/core-image-clutter.bb
> index 7d50405..a4adc54 100644
> --- a/meta/recipes-graphics/images/core-image-clutter.bb
> +++ b/meta/recipes-graphics/images/core-image-clutter.bb
> @@ -3,7 +3,7 @@ IMAGE_FEATURES +=3D "apps-console-core ${SATO_IMAGE_FEATU=
RES}"
> =C2=A0LICENSE =3D "MIT"
>
> =C2=A0IMAGE_INSTALL =3D "\
> - =C2=A0 =C2=A0${POKY_BASE_INSTALL} \
> + =C2=A0 =C2=A0${OE_BASE_INSTALL} \
> =C2=A0 =C2=A0 task-core-clutter-core \
> =C2=A0 =C2=A0 task-core-clutter-tests \
> =C2=A0 =C2=A0 task-core-clutter-apps"
> diff --git a/meta/recipes-qt/images/qt4e-demo-image.bb b/meta/recipes-qt/=
images/qt4e-demo-image.bb
> index 6523379..5d0a992 100644
> --- a/meta/recipes-qt/images/qt4e-demo-image.bb
> +++ b/meta/recipes-qt/images/qt4e-demo-image.bb
> @@ -11,7 +11,7 @@ RDEPENDS_${PN} +=3D " \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>
> =C2=A0IMAGE_INSTALL +=3D "\
> - =C2=A0 =C2=A0 =C2=A0 ${POKY_BASE_INSTALL} \
> + =C2=A0 =C2=A0 =C2=A0 ${OE_BASE_INSTALL} \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0module-init-tools \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0task-qt4e-base \
> =C2=A0"
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


