Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgXGj-0008PQ-LP
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 09:20:33 +0200
Received: by wyg30 with SMTP id 30so3516248wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 00:16:37 -0700 (PDT)
Received: by 10.217.7.66 with SMTP id z44mr4699924wes.100.1310454996982;
	Tue, 12 Jul 2011 00:16:36 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id z83sm4429968weq.44.2011.07.12.00.16.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 00:16:36 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <e5fe3daf894671d811f8596b427b980d6ead363f.1310425837.git.sgw@linux.intel.com>
Date: Tue, 12 Jul 2011 09:16:35 +0200
Message-Id: <A2567180-9E06-4BF8-B949-81F335064733@dominion.thruhere.net>
References: <cover.1310425837.git.sgw@linux.intel.com>
	<e5fe3daf894671d811f8596b427b980d6ead363f.1310425837.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 23/26] glibc: Use bitbake default FILES for packaging
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
X-List-Received-Date: Tue, 12 Jul 2011 07:20:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 jul 2011, om 01:13 heeft Saul Wold het volgende geschreven:

> This will ensure correct -dev and -staticdev packging

Missing PR bump

>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-core/glibc/glibc-package.inc |   12 ++++++++----
> 1 files changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-core/glibc/glibc-package.inc =
b/meta/recipes-core/glibc/glibc-package.inc
> index c1c3853..5337de5 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -20,13 +20,14 @@ PKGSUFFIX_virtclass-nativesdk =3D "-nativesdk"
> PACKAGES =3D "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} =
nscd${PKGSUFFIX} \
> 	ldd${PKGSUFFIX} ${PN}-utils ${PN}-dev ${PN}-doc \
> 	libsegfault${PKGSUFFIX} ${PN}-extra-nss ${PN}-thread-db \
> -	${PN}-pcprofile"
> +	${PN}-pcprofile ${PN}-staticdev"
>=20
> libc_baselibs =3D "${base_libdir}/libc* ${base_libdir}/libm* =
${base_libdir}/ld* \
> 	${base_libdir}/libpthread* ${base_libdir}/libresolv* =
${base_libdir}/librt* \
> 	${base_libdir}/libutil* ${base_libdir}/libnsl* =
${base_libdir}/libnss_files* \
> 	${base_libdir}/libnss_compat* ${base_libdir}/libnss_dns* =
${base_libdir}/libdl* \
> -	${base_libdir}/libanl* ${base_libdir}/libBrokenLocale*"
> +	${base_libdir}/libanl* ${base_libdir}/libBrokenLocale* \
> +        ${base_libdir}/lib*nonshared.a"
>=20
> # The problem is that if PN =3D "glibc", FILES_${PN} will overwrite =
FILES_glibc
> # Solution: Make them both the same thing, then it doesn't matter
> @@ -37,8 +38,9 @@ glibcdbgfiles =3D "${bindir}/.debug =
${sbindir}/.debug ${libdir}/.debug \
>                   ${base_bindir}/.debug ${base_sbindir}/.debug =
${base_libdir}/.debug \
>                   ${libdir}/gconv/.debug ${libexecdir}/*/.debug"
> glibcdevfiles =3D "${bindir}/rpcgen ${includedir} =
${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
> -                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
> -                ${base_libdir}/*.a ${base_libdir}/*.o =
${datadir}/aclocal"
> +                ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.o =
${datadir}/aclocal"
> +
> +glibcstaticdev =3D "${libdir}/*.a ${base_libdir}/*.a"
>=20
> FILES_glibc =3D "${glibcfiles}"
> FILES_${PN} =3D "${glibcfiles}"
> @@ -48,6 +50,8 @@ FILES_glibc-extra-nss =3D "${base_libdir}/libnss*"
> FILES_sln =3D "${base_sbindir}/sln"
> FILES_glibc-dev =3D "${glibcdevfiles}"
> FILES_${PN}-dev =3D "${glibcdevfiles}"
> +FILES_glibc-staticdev =3D "${glibcstaticdev}"
> +FILES_${PN}-staticdev =3D "${glibcstaticdev}"
> FILES_glibc-dbg =3D "${glibcdbgfiles}"
> FILES_${PN}-dbg =3D "${glibcdbgfiles}"
> FILES_nscd${PKGSUFFIX} =3D "${sbindir}/nscd* ${sysconfdir}/nscd* =
${sysconfdir}/init.d/nscd*"
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



