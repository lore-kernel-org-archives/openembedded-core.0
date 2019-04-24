Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id BEFBA6BC19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 11:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id DA43E18288;
	Wed, 24 Apr 2019 13:47:07 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id wXLCH7aRyqMn; Wed, 24 Apr 2019 13:47:07 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2DB1E18343;
	Wed, 24 Apr 2019 13:47:07 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 177F11A092;
	Wed, 24 Apr 2019 13:47:07 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C3731A091;
	Wed, 24 Apr 2019 13:47:07 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 24 Apr 2019 13:47:07 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 0099B21FD;
	Wed, 24 Apr 2019 13:47:07 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 24 Apr 2019 13:47:06 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Wed, 24 Apr 2019 13:47:06 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core]  [PATCH v3] dnf: Enable nativesdk
Thread-Index: AQHU+k8hHf4NL6Kgek+PWTQFwM+a+qZLMcJA
Date: Wed, 24 Apr 2019 11:47:06 +0000
Message-ID: <0ee39b483fdc4409b7596b212ae80d2b@XBOX04.axis.com>
References: <1556077097-64268-1-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1556077097-64268-1-git-send-email-leimaohui@cn.fujitsu.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v3] dnf: Enable nativesdk
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
X-List-Received-Date: Wed, 24 Apr 2019 11:47:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Lei Maohui
> Sent: den 24 april 2019 05:38
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v3] dnf: Enable nativesdk
>=20
> Make dnf work on nativesdk environment.
>=20
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/dnf/dnf_4.2.2.bb | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-
> devtools/dnf/dnf_4.2.2.bb
> index 3970b41..159d7e9 100644
> --- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> +++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> @@ -26,7 +26,7 @@ EXTRA_OECMAKE =3D " -DWITH_MAN=3D0 -
> DPYTHON_INSTALL_DIR=3D${PYTHON_SITEPACKAGES_DIR} -
>=20
>  BBCLASSEXTEND =3D "native nativesdk"
>=20
> -RDEPENDS_${PN}_class-target +=3D " \
> +RDEPENDS_${PN} +=3D " \
>    python3-core \
>    python3-codecs \
>    python3-netclient \
> @@ -49,6 +49,8 @@ RDEPENDS_${PN}_class-target +=3D " \
>    python3-gpg \
>    "
>=20
> +RDEPENDS_${PN}_class-native =3D ""
> +
>  RRECOMMENDS_${PN}_class-target +=3D "gnupg"
>=20
>  # Create a symlink called 'dnf' as 'make install' does not do it, but
> @@ -66,6 +68,11 @@ do_install_append_class-native() {
>                  RPM_NO_CHROOT_FOR_SCRIPTS=3D1
>  }
>=20
> +do_install_append_class-nativesdk() {
> +        create_wrapper ${D}/${bindir}/dnf \
> +                RPM_CONFIGDIR=3D${SDKPATHNATIVE}${libdir_nativesdk}/rpm =
\
> +                RPM_NO_CHROOT_FOR_SCRIPTS=3D1 }

Move the "}" above to a line of its own.

> +
>  SYSTEMD_SERVICE_${PN} =3D "dnf-makecache.service dnf-makecache.timer \
>                           dnf-automatic.service dnf-automatic.timer \
>                           dnf-automatic-download.service dnf-automatic-
> download.timer \
> --
> 2.7.4

//Peter


