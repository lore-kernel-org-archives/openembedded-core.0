Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SHyd9-0004Y3-0T
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 16:34:44 +0200
Received: by ggcy3 with SMTP id y3so468725ggc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 07:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=2FtX6ej6LVdutm4E5AOkaPPxIzvXxn9GwcsoeRgY51E=;
	b=ycBK4FNbnEuU3APWez8CKu52/1rkQUOmvsGtYqdsIq1wFPQmf55kmrhSNql1P3RmBP
	ThNu9ML87DW008oVQK/n6UuiWkOq9ElAlOFZ1X/1+T0kjPz0t+achmhBKQ2kfe6oYeV8
	2ymcnPKrx0ZEQWjbBj3O7Yg+ivN7B5D4FGWvhvsB3qPUL7yyaEFV2VyvuWUw8nkq2tGO
	MTJmtwNZ2wAeZu0sHn5orQGIKqHFslSX1i3RoiCP68HjKaqGRCJc+fRCriqCGTzlZClz
	JHStL/1i9gzjtRYhvC5fC2uW5wJyLkjkJCDMadRmE8ED/8rHvp6ruL7Ysf37SUeJ59Kl
	qwSg==
MIME-Version: 1.0
Received: by 10.236.128.116 with SMTP id e80mr11401250yhi.116.1334154323602;
	Wed, 11 Apr 2012 07:25:23 -0700 (PDT)
Received: by 10.236.37.131 with HTTP; Wed, 11 Apr 2012 07:25:23 -0700 (PDT)
In-Reply-To: <615f8201f2fb18a7e3e0e0c07febd57f788005ad.1334153781.git.andrei@gherzan.ro>
References: <cover.1334153781.git.andrei@gherzan.ro>
	<615f8201f2fb18a7e3e0e0c07febd57f788005ad.1334153781.git.andrei@gherzan.ro>
Date: Wed, 11 Apr 2012 16:25:23 +0200
Message-ID: <CA+chaQd=XHpTSX3xWrpsMJ+f8LaH1EEB__HpwN_9_QkfYHH5YQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in include/gdbm
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
X-List-Received-Date: Wed, 11 Apr 2012 14:34:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 11, 2012 at 4:18 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> ndbm.h is needed by python for dbm module. This is why -enable-libgdbm-co=
mpat was added
> to configure.
> The second change is because python is looking for the gdbm headers in in=
clude/gdbm.
> The easiest way to solve this issue is to add symlinks in include/gdbm.
>
> In order to avoid breaking packages which depend on old package name libg=
dbm4 (>=3D 1.10),
> compat libs are packaged into a separate package named gdbm-compat.
>
> [YOCTO #1937]
>
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
> =C2=A0meta/recipes-support/gdbm/gdbm_1.10.bb | =C2=A0 18 ++++++++++++++++=
+-
> =C2=A01 files changed, 17 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-support/gdbm/gdbm_1.10.bb b/meta/recipes-suppor=
t/gdbm/gdbm_1.10.bb
> index 9b2fde4..40bdd86 100644
> --- a/meta/recipes-support/gdbm/gdbm_1.10.bb
> +++ b/meta/recipes-support/gdbm/gdbm_1.10.bb
> @@ -4,7 +4,7 @@ SECTION =3D "libs"
> =C2=A0LICENSE =3D "GPLv3"
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D241da1b9fe42e642cbb2c24d=
5e0c4d24"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
> =C2=A0SRC_URI =3D "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz"
>
> @@ -13,4 +13,20 @@ SRC_URI[sha256sum] =3D "23f8134c5b94bbfb06d756a6b78f07=
4fba6e6028cf2fe01341d40b26db
>
> =C2=A0inherit autotools gettext lib_package
>
> +# Needed for dbm python module
> +EXTRA_OECONF =3D "-enable-libgdbm-compat"
> +
> =C2=A0BBCLASSEXTEND =3D "native nativesdk"
> +
> +do_install_append () {
> + =C2=A0 =C2=A0# Create a symlink to ndbm.h and gdbm.h in include/gdbm to=
 let other packages to find
> + =C2=A0 =C2=A0# these headers
> + =C2=A0 =C2=A0install -d ${D}${includedir}/gdbm
> + =C2=A0 =C2=A0ln -sf ../ndbm.h ${D}/${includedir}/gdbm/ndbm.h
> + =C2=A0 =C2=A0ln -sf ../gdbm.h ${D}/${includedir}/gdbm/gdbm.h
> +}
> +

^^ whole part above was already applied in
http://git.openembedded.org/openembedded-core/commit/?id=3De4d2ee00419f675b=
a8b7fb5d75256762253d8b32

So you should rebase this patch on top of master and add another PR
bump to it (and depending recipes).

> +PACKAGES =3D+ "${PN}-compat \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
> +FILES_${PN}-compat =3D "${libdir}/libgdbm_compat${SOLIBS} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


