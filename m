Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q7M7A-0003Bg-Hm
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 08:21:16 +0200
Received: by fxm19 with SMTP id 19so864763fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 23:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=lueLqKUsMpjrF4wNma3xnz0sN69CbmExRYZrKE2fRqw=;
	b=mD4iVlGu94KIImXOPZdRGRZcdIqsPZLMFWH23yb6fjlDkulg2k9FCqh4lUDPZ2+oQX
	sY/6rsJcMsRqQeNKxJqfN1R+dlEajZRo4OLayZUgSVn90STGJdnJOTU47Fbglt6AVvBT
	Dk0WywD25NLALQlqcGDl6fYrmCX8DKmS8mCfE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=AFk/LdIu3G/tZLza9ir/3YURMHuEakO0sEuxHVsJBGIATuC2GXvZt3blsdShJMqT+S
	WQKC9W8fiQEGLvYcDCMNwuX0sk9QGwCwJZ5Diec93wnUcaAp3jqn/0sYI7zljYl/vyZI
	qiYr4TMvSehVHxJwR/dhCEIR+hJz/W5uhf1wo=
Received: by 10.223.127.210 with SMTP id h18mr616236fas.46.1302070750099; Tue,
	05 Apr 2011 23:19:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Tue, 5 Apr 2011 23:18:40 -0700 (PDT)
In-Reply-To: <95d636004deffc0d6473c67ee9b5ce62937dc085.1302050252.git.tom_rini@mentor.com>
References: <cover.1302050252.git.tom_rini@mentor.com>
	<95d636004deffc0d6473c67ee9b5ce62937dc085.1302050252.git.tom_rini@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Apr 2011 23:18:40 -0700
Message-ID: <BANLkTi=RTLB21JAz4N2B2kPWu6H3uTHn1w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ncurses: Update to 5.9
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
X-List-Received-Date: Wed, 06 Apr 2011 06:21:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 5, 2011 at 5:38 PM, Tom Rini <tom_rini@mentor.com> wrote:
> The previous 5.7 release was relatively close to 5.8 due to it bringing
> in a patch to sync with upstream work-in-progress. =C2=A0We skip over the
> 5.8 release and move to 5.9.


there already are patches for 5.9 available too
ftp://invisible-island.net/ncurses/5.9/ncurses-5.9.patch.gz

>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
> =C2=A0.../{ncurses-5.7 =3D> ncurses-5.9}/config.cache =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 =C2=A00
> =C2=A0.../{ncurses-5.7 =3D> ncurses-5.9}/tic-hang.patch =C2=A0 =C2=A0| =
=C2=A0 =C2=A00
> =C2=A0.../ncurses/{ncurses_5.7.bb =3D> ncurses_5.9.bb} =C2=A0 =C2=A0 | =
=C2=A0 21 +++----------------
> =C2=A03 files changed, 4 insertions(+), 17 deletions(-)
> =C2=A0rename meta/recipes-core/ncurses/{ncurses-5.7 =3D> ncurses-5.9}/con=
fig.cache (100%)
> =C2=A0rename meta/recipes-core/ncurses/{ncurses-5.7 =3D> ncurses-5.9}/tic=
-hang.patch (100%)
> =C2=A0rename meta/recipes-core/ncurses/{ncurses_5.7.bb =3D> ncurses_5.9.b=
b} (88%)
>
> diff --git a/meta/recipes-core/ncurses/ncurses-5.7/config.cache b/meta/re=
cipes-core/ncurses/ncurses-5.9/config.cache
> similarity index 100%
> rename from meta/recipes-core/ncurses/ncurses-5.7/config.cache
> rename to meta/recipes-core/ncurses/ncurses-5.9/config.cache
> diff --git a/meta/recipes-core/ncurses/ncurses-5.7/tic-hang.patch b/meta/=
recipes-core/ncurses/ncurses-5.9/tic-hang.patch
> similarity index 100%
> rename from meta/recipes-core/ncurses/ncurses-5.7/tic-hang.patch
> rename to meta/recipes-core/ncurses/ncurses-5.9/tic-hang.patch
> diff --git a/meta/recipes-core/ncurses/ncurses_5.7.bb b/meta/recipes-core=
/ncurses/ncurses_5.9.bb
> similarity index 88%
> rename from meta/recipes-core/ncurses/ncurses_5.7.bb
> rename to meta/recipes-core/ncurses/ncurses_5.9.bb
> index 7ab078d..9d4aa22 100644
> --- a/meta/recipes-core/ncurses/ncurses_5.7.bb
> +++ b/meta/recipes-core/ncurses/ncurses_5.9.bb
> @@ -3,34 +3,21 @@ HOMEPAGE =3D "http://www.gnu.org/software/ncurses/ncurs=
es.html"
> =C2=A0LICENSE =3D "MIT"
> =C2=A0LIC_FILES_CHKSUM =3D "file://ncurses/base/version.c;beginline=3D1;e=
ndline=3D27;md5=3Dcbc180a8c44ca642e97c35452fab5f66"
> =C2=A0SECTION =3D "libs"
> -PATCHDATE =3D "20100501"
> -PKGV =3D "${PV}+${PATCHDATE}"
> -PR =3D "r1"
> +PR =3D "r0"
>
> =C2=A0DEPENDS =3D "ncurses-native"
> =C2=A0DEPENDS_virtclass-native =3D ""
>
> =C2=A0inherit autotools binconfig
>
> -SRC_URI =3D "${GNU_MIRROR}/ncurses/ncurses-${PV}.tar.gz;name=3Dtarball \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0ftp://invisible-island.net/ncurses/5.7/ncurs=
es-5.7-20100424-patch.sh.bz2;apply=3Dyes;name=3Dp20100424sh \
> -\
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0http://autobuilder.yoctoproject.org/sources/=
ncurses-5.7-${PATCHDATE}.patch.gz;name=3Dp20100501 \
> +SRC_URI =3D "${GNU_MIRROR}/ncurses/ncurses-${PV}.tar.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://tic-hang.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://config.cache \
> =C2=A0"
>
> +SRC_URI[md5sum] =3D "8cb9c412e5f2d96bc6f459aa8c6282a1"
> +SRC_URI[sha256sum] =3D "9046298fb440324c9d4135ecea7879ffed8546dd1b58e594=
30ea07a4633f563b"
>
> -# =C2=A0 =C2=A0 =C2=A0 =C2=A0ftp://invisible-island.net/ncurses/5.7/ncur=
ses-5.7-${PATCHDATE}.patch.gz;name=3Dp20100501
> -
> -SRC_URI[tarball.md5sum] =3D "cce05daf61a64501ef6cd8da1f727ec6"
> -SRC_URI[tarball.sha256sum] =3D "0a9bdea5c7de8ded5c9327ed642915f2cc380753=
f12d4ad120ef7da3ea3498f4"
> -SRC_URI[p20100424sh.md5sum] =3D "3a5f76613f0f7ec3e0e73b835bc24864"
> -SRC_URI[p20100424sh.sha256sum] =3D "1e9d70d2d1fe1fea471868832c52f1b9cc60=
65132102e49e2a3755f2f4f5be53"
> -SRC_URI[p20100501.md5sum] =3D "6518cfa5d45e9069a1e042468161448b"
> -SRC_URI[p20100501.sha256sum] =3D "a97ccc30e4bd6fbb89564f3058db0fe84bd35c=
fefee831556c500793b477abde"
> -
> -#PARALLEL_MAKE =3D ""
> =C2=A0EXTRA_AUTORECONF =3D "-I m4"
> =C2=A0CONFIG_SITE =3D+ "${WORKDIR}/config.cache"
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


