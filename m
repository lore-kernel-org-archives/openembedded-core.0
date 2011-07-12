Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgXCC-0008Iv-Og
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 09:15:52 +0200
Received: by wyg30 with SMTP id 30so3514282wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 00:11:56 -0700 (PDT)
Received: by 10.227.32.73 with SMTP id b9mr5043278wbd.107.1310454715993;
	Tue, 12 Jul 2011 00:11:55 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fe4sm10625564wbb.11.2011.07.12.00.11.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 00:11:55 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <c5a86ee71f9a3fb65e9f411ffa3ef76f16530631.1310425837.git.sgw@linux.intel.com>
Date: Tue, 12 Jul 2011 09:11:49 +0200
Message-Id: <9B559E61-0AFC-47B4-8C69-294CB5AB4082@dominion.thruhere.net>
References: <cover.1310425837.git.sgw@linux.intel.com>
	<c5a86ee71f9a3fb65e9f411ffa3ef76f16530631.1310425837.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 11/26] rpm: Create ${PN}-staticdev package
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
X-List-Received-Date: Tue, 12 Jul 2011 07:15:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 jul 2011, om 01:13 heeft Saul Wold het volgende geschreven:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Missing PR bump


> ---
> meta/recipes-devtools/rpm/rpm_5.4.0.bb |   16 +++++++++-------
> 1 files changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb =
b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> index d093345..5e6d0a4 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> @@ -166,7 +166,7 @@ EXTRA_OECONF =3D "--verbose \
>=20
> CFLAGS_append =3D " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY"
>=20
> -PACKAGES =3D "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev =
${PN}-common ${PN}-build python-rpm-dbg python-rpm perl-module-rpm =
perl-module-rpm-dev ${PN}-locale"
> +PACKAGES =3D "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev =
${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm =
perl-module-rpm perl-module-rpm-dev ${PN}-locale"
>=20
> SOLIBS =3D "5.4.so"
>=20
> @@ -301,26 +301,28 @@ FILES_perl-module-rpm-dev =3D =
"${prefix}/share/man/man3/RPM* \
> 		"
>=20
> FILE_${PN}-dev =3D "${includedir}/rpm \
> -		${libdir}/librpm.a \
> 		${libdir}/librpm.la \
> 		${libdir}/librpm.so \
> -		${libdir}/librpmconstant.a \
> 		${libdir}/librpmconstant.la \
> 		${libdir}/librpmconstant.so \
> -		${libdir}/librpmdb.a \
> 		${libdir}/librpmdb.la \
> 		${libdir}/librpmdb.so \
> -		${libdir}/librpmio.a \
> 		${libdir}/librpmio.la \
> 		${libdir}/librpmio.so \
> -		${libdir}/librpmmisc.a \
> 		${libdir}/librpmmisc.la \
> 		${libdir}/librpmmisc.so \
> -		${libdir}/librpmbuild.a \
> 		${libdir}/librpmbuild.la \
> 		${libdir}/librpmbuild.so \
> 		${libdir}/pkgconfig/rpm.pc \
> 		"
> +FILE_${PN}-staticdev =3D " \
> +		${libdir}/librpm.a \
> +		${libdir}/librpmconstant.a \
> +		${libdir}/librpmdb.a \
> +		${libdir}/librpmio.a \
> +		${libdir}/librpmmisc.a \
> +		${libdir}/librpmbuild.a \
> +                "
>=20
> ###%{_rpmhome}/lib/libxar.a
> ###%{_rpmhome}/lib/libxar.la
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



