Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgXE0-0008LS-H4
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 09:17:44 +0200
Received: by wwi18 with SMTP id 18so3741686wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 00:13:47 -0700 (PDT)
Received: by 10.217.6.137 with SMTP id y9mr3805763wes.47.1310454827709;
	Tue, 12 Jul 2011 00:13:47 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h22sm7367017wes.32.2011.07.12.00.13.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 00:13:46 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <da30f3b2645703da5e7d49e245d379ca82789989.1310425837.git.sgw@linux.intel.com>
Date: Tue, 12 Jul 2011 09:13:40 +0200
Message-Id: <07DCE710-AD3A-411F-8EED-74F3723D534C@dominion.thruhere.net>
References: <cover.1310425837.git.sgw@linux.intel.com>
	<da30f3b2645703da5e7d49e245d379ca82789989.1310425837.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 13/26] js: Use bitbake default FILES for packaging
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
X-List-Received-Date: Tue, 12 Jul 2011 07:17:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 12 jul 2011, om 01:13 heeft Saul Wold het volgende geschreven:

> This will ensure correct -dev and -staticdev packging
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb |    3 +--
> 1 files changed, 1 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb =
b/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
> index a4423ab..d4e1e4d 100644
> --- a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
> +++ b/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
> @@ -5,7 +5,7 @@ SECTION =3D "libs"
> # the package is licensed under either of the following
> LICENSE =3D "MPL-1 | GPLv2+ | LGPLv2.1+"
> LIC_FILES_CHKSUM =3D =
"file://jsapi.c;beginline=3D4;endline=3D39;md5=3D347c6bbf4fb4547de1fa5ad83=
0030063"
> -PR =3D "r2"
> +PR =3D "r4"
>=20
> SRC_URI =3D =
"http://ftp.mozilla.org/pub/mozilla.org/js/js-1.8.0-rc1.tar.gz \
>            file://link_with_gcc.patch \
> @@ -47,5 +47,4 @@ do_install() {
> }
>=20
> FILES_${PN} =3D "${libdir}/lib*.so"

Not .so.*?

> -FILES_${PN}-dev =3D "${includedir} ${libdir}/lib*.a"
>=20
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



