Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QewGb-00070Z-FL
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 23:38:54 +0200
Received: by pwi1 with SMTP id 1so781200pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2011 14:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Z73VYsElw9JzAjpBopm2adyGxxfrj0xbHxX1XwbbZFo=;
	b=C3NI+nKe8hRCz86xQsawOskKDp2ujzbPBpVDIzA5nR1xq1Gv4qXEymsQ5WUObA/IER
	ii9OKvRa3aBEr7EjdsU0nUtKrUrtEvY0rflj7wicZDBLF+1sUxfvz78t/efNOwbpG/sA
	glF9ZIe6euKF54uJ5C/IrMzl2eoF1njiZoci8=
Received: by 10.68.28.104 with SMTP id a8mr1542091pbh.431.1310074385044; Thu,
	07 Jul 2011 14:33:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.57.104 with HTTP; Thu, 7 Jul 2011 14:32:35 -0700 (PDT)
In-Reply-To: <12dc19831b4766f0894ff43ae916150057a0e65e.1310070283.git.nitin.a.kamble@intel.com>
References: <cover.1310070283.git.nitin.a.kamble@intel.com>
	<629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
	<12dc19831b4766f0894ff43ae916150057a0e65e.1310070283.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Jul 2011 14:32:35 -0700
Message-ID: <CAMKF1srko_7QGtUzYqRHh0EY92=ga7nPo8qO_vwYqmeqo=f0HQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] binutils: package unpackaged files
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
X-List-Received-Date: Thu, 07 Jul 2011 21:38:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 7, 2011 at 1:25 PM,  <nitin.a.kamble@intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> To fix these package qa warnings
> WARNING: For recipe binutils, the following files were installed but not =
shipped in any package:
> WARNING: =C2=A0 /usr/bin/ld.bfd
> WARNING: =C2=A0 /usr/bin/elfedit
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
> =C2=A0.../binutils/binutils-cross-canadian_2.21.1.bb =C2=A0 =C2=A0 | =C2=
=A0 =C2=A02 +-
> =C2=A0.../binutils/binutils-crosssdk_2.21.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0meta/recipes-devtools/binutils/binutils.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 ++
> =C2=A0meta/recipes-devtools/binutils/binutils_2.21.1.bb =C2=A0| =C2=A0 =
=C2=A02 +-
> =C2=A04 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.=
1.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb
> index 7dad2a6..e91e7dc 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb
> +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1.bb
> @@ -1,3 +1,3 @@
> =C2=A0require binutils_${PV}.bb
> =C2=A0require binutils-cross-canadian.inc
> -PR =3D "r0"
> +PR =3D "r1"
> diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb b=
/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb
> index 0d6efff..21289cd 100644
> --- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb
> +++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1.bb
> @@ -4,7 +4,7 @@ inherit crosssdk
>
> =C2=A0PROVIDES =3D "virtual/${TARGET_PREFIX}binutils-crosssdk"
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =C2=A0do_configure_prepend () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i 's#/usr/local/lib /lib /usr/lib#${SDKPA=
THNATIVE}/lib ${SDKPATHNATIVE}/usr/lib /usr/local/lib /lib /usr/lib#' ${S}/=
ld/configure.tgt
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-d=
evtools/binutils/binutils.inc
> index 08c14b2..9a6b9c8 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -35,11 +35,13 @@ FILES_${PN}-symlinks =3D " \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/c++filt \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/gprof \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/ld \
> + =C2=A0 =C2=A0 =C2=A0 ${bindir}/ld.bfd \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/nm \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/objcopy \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/objdump \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/ranlib \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/readelf \
> + =C2=A0 =C2=A0 =C2=A0 ${bindir}/elfedit \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/size \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0${bindir}/strip"
>

I wonder if symlinks is appropriate name for this Package if it does
not have symlinks

> diff --git a/meta/recipes-devtools/binutils/binutils_2.21.1.bb b/meta/rec=
ipes-devtools/binutils/binutils_2.21.1.bb
> index 368ec4a..4eb6566 100644
> --- a/meta/recipes-devtools/binutils/binutils_2.21.1.bb
> +++ b/meta/recipes-devtools/binutils/binutils_2.21.1.bb
> @@ -1,6 +1,6 @@
> =C2=A0require binutils.inc
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =C2=A0LIC_FILES_CHKSUM=3D"\
> =C2=A0 =C2=A0 file://src-release;endline=3D17;md5=3D4830a9ef968f3b18dd5e9=
f2c00db2d35\
> --
> 1.7.4.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


