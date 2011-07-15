Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qhqiu-0006SF-Kn
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 00:19:04 +0200
Received: by pvf24 with SMTP id 24so1504296pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 15:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Mv+/JW9+Hk2cGcDv+0qjdCUyR5fQTQ8q4b8NObcv/4Y=;
	b=URZgeWA9ClrfhcCO4z7GXosZlI/HazDGcmbSFzrTAZpW1hfQxv7ka3I6Jsab3Mu8zZ
	OBFWbPLpvpk3EZhZy4XJBzxRH5z7atgwPScQ8MGYPMVKZ8oH5/79GKorjSHhJM/kNzdf
	OY0uncQ3XRpmb/oNLrUYgKt1Qy5Q0BK80uD60=
Received: by 10.68.9.165 with SMTP id a5mr5054436pbb.412.1310768102112; Fri,
	15 Jul 2011 15:15:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Fri, 15 Jul 2011 15:14:32 -0700 (PDT)
In-Reply-To: <d481ce0f7896af7699864f9f5ca4410b2d5e39f0.1310758615.git.tom_rini@mentor.com>
References: <cover.1310758615.git.tom_rini@mentor.com>
	<d481ce0f7896af7699864f9f5ca4410b2d5e39f0.1310758615.git.tom_rini@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jul 2011 15:14:32 -0700
Message-ID: <CAMKF1sqYRFyjdBdQwWXfxtOytKQGpZP+ww569eR6DnkCCfpdtw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] mercurial-native: Add 1.9 version
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
X-List-Received-Date: Fri, 15 Jul 2011 22:19:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2011 at 3:03 PM, Tom Rini <tom_rini@mentor.com> wrote:
> This is based on 91c14caa8819b08def8ea99e02949e49604c2e86 from oe.dev
> with an update to 1.9.
>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
> =C2=A0.../mercurial/mercurial-native_1.9.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 24 ++++++++++++++++++++
> =C2=A01 files changed, 24 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta/recipes-devtools/mercurial/mercurial-native=
_1.9.bb
>
> diff --git a/meta/recipes-devtools/mercurial/mercurial-native_1.9.bb b/me=
ta/recipes-devtools/mercurial/mercurial-native_1.9.bb
> new file mode 100644
> index 0000000..b4438a3
> --- /dev/null
> +++ b/meta/recipes-devtools/mercurial/mercurial-native_1.9.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION =3D "The Mercurial distributed SCM"
> +HOMEPAGE =3D "http://mercurial.selenic.com/"
> +SECTION =3D "console/utils"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +DEPENDS =3D "python-native"
> +PR =3D "r1"
> +
> +SRC_URI =3D "http://mercurial.selenic.com/release/mercurial-${PV}.tar.gz=
"
> +SRC_URI[md5sum] =3D "d4842129fa2732eb6ed1180467bc32e2"
> +SRC_URI[sha256sum] =3D "711e4b1cd2924a7a88499d6c431a9122390183bf554d4e15=
3edbb3b2f30123e0"
> +
> +S =3D "${WORKDIR}/mercurial-${PV}"
> +
> +inherit native


why not use BBCLASSEXTEND although I dont know why someone would want
target package of hg


> +
> +EXTRA_OEMAKE =3D "STAGING_LIBDIR=3D${STAGING_LIBDIR} STAGING_INCDIR=3D${=
STAGING_INCDIR} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_S=
YS} PREFIX=3D${prefix}"
> +
> +do_install () {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake -e install-bin DESTDIR=3D${D} PRE=
FIX=3D${prefix}
> +}
> +
> +NATIVE_INSTALL_WORKS =3D "1"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


