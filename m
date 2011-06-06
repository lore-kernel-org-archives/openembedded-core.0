Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QTdGq-0004AE-5v
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 19:07:20 +0200
Received: by wwb17 with SMTP id 17so3399521wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jun 2011 10:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=izXFfm1NPBc4x5fX+dSt+4/Pu41Q88nYfavcNr/MEec=;
	b=QRYnz/8kxy1j5KOuzraazrTNGLohfol/XnCLi+VuRq1EvJQTLT9BfasWAdXrDlFJWU
	9LJ/uVaNBNnHub6HR3fW4kgwg/E8mayObMbA4j7GvhZ+wYW9m2cXI/DpSYDbWuph+BjD
	lT0R71S8xt4V4F09RUjKcBtPz+BVvGw6qEm3M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=IKVdMNwybSIQ/aeBC0nVDrzq0QUf3O0WhnDh5W2BDh+uYoMcDT75f/uaLrCm/F9JOG
	Fna0AZPIBxl+xv5RxP9yMaFznxWLKS0j+6KTV37FrL9JE4BNvD9QktenMBg1AzCLXsaz
	YRaqhSEmweet01qLdama2nkJsaGlKxUpcUokQ=
Received: by 10.216.253.215 with SMTP id f65mr5117315wes.14.1307379843080;
	Mon, 06 Jun 2011 10:04:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.28.19 with HTTP; Mon, 6 Jun 2011 10:03:32 -0700 (PDT)
In-Reply-To: <3eba2df4c6f2371db24ab2420d037b992725cb84.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
	<3eba2df4c6f2371db24ab2420d037b992725cb84.1307342214.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Jun 2011 10:03:32 -0700
Message-ID: <BANLkTi=eR+PJ5+jPDsqZeGB6w8Xr276X1Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 01/20] bitbake.conf: Create staticlibs pacakge for static libraries
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
X-List-Received-Date: Mon, 06 Jun 2011 17:07:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 5, 2011 at 11:44 PM, Saul Wold <sgw@linux.intel.com> wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> =C2=A0meta/conf/bitbake.conf | =C2=A0 12 ++++++++++--
> =C2=A01 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index de94316..520b808 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -194,9 +194,13 @@ This package contains ELF symbols and related source=
s for debugging purposes."
>
> =C2=A0SUMMARY_${PN}-dev ?=3D "${SUMMARY} - Development files"
> =C2=A0DESCRIPTION_${PN}-dev ?=3D "${DESCRIPTION} =C2=A0\
> -This package contains symbolic links, static binaries, header files, and=
 \
> +This package contains symbolic links, header files, and \
> =C2=A0related items necessary for software development."
>
> +SUMMARY_${PN}-staticlibs ?=3D "${SUMMARY} - Development files (Static Li=
braries)"
> +DESCRIPTION_${PN}-staticlibs?=3D "${DESCRIPTION} =C2=A0\
> +This package contains static libraries for software development."
> +
> =C2=A0SUMMARY_${PN}-doc ?=3D "${SUMMARY} - Documentation files"
> =C2=A0DESCRIPTION_${PN}-doc ?=3D "${DESCRIPTION} =C2=A0\
> =C2=A0This package contains documentation."
> @@ -248,13 +252,17 @@ FILES_${PN}-doc =3D "${docdir} ${mandir} ${infodir}=
 ${datadir}/gtk-doc \
> =C2=A0SECTION_${PN}-doc =3D "doc"
>
> =C2=A0FILES_${PN}-dev =3D "${includedir} ${libdir}/lib*${SOLIBSDEV} ${lib=
dir}/*.la \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/*.a ${=
libdir}/*.o ${libdir}/pkgconfig \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/*.o ${=
libdir}/pkgconfig \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/pkgcon=
fig ${datadir}/aclocal \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${base_libdir}/*.=
a ${base_libdir}/*.o"
> =C2=A0SECTION_${PN}-dev =3D "devel"
> =C2=A0ALLOW_EMPTY_${PN}-dev =3D "1"
> =C2=A0RDEPENDS_${PN}-dev =3D "${PN} (=3D ${EXTENDPKGV})"
>
> +FILES_${PN}-staticlibs =3D "${libdir}/*.a ${base_libdir}/*.a"
> +SECTION_${PN}-staticlibs =3D "devel"
> +RDEPENDS_${PN}-staticlibs =3D "${PN}-dev (=3D ${EXTENDPV})"
> +

I think if you need to divide it then -dev should be divided into
static, dynamic and headers otherwise this may not be so useful.

> =C2=A0DOTDEBUG-dbg =3D "${bindir}/.debug ${sbindir}/.debug ${libexecdir}/=
.debug ${libdir}/.debug \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${base_bindir}/.debug ${base_sb=
indir}/.debug ${base_libdir}/.debug ${libdir}/${PN}/.debug \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir}/matchbox-panel/.debug=
 /usr/src/debug"
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


