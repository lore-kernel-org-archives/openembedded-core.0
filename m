Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA547F2B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 21:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D057118403;
	Tue,  3 Sep 2019 23:21:09 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id iDWitrw-lvZg; Tue,  3 Sep 2019 23:21:07 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7E1B118440;
	Tue,  3 Sep 2019 23:21:07 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E4431E094;
	Tue,  3 Sep 2019 23:21:06 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21E361E093;
	Tue,  3 Sep 2019 23:21:06 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue,  3 Sep 2019 23:21:06 +0200 (CEST)
Received: from xbox05.axis.com (xbox05.axis.com [10.0.15.175])
	by thoth.se.axis.com (Postfix) with ESMTP id 15324CBC;
	Tue,  3 Sep 2019 23:21:06 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by xbox05.axis.com (10.0.15.175)
	with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Tue, 3 Sep 2019 23:21:05 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1395.000; Tue, 3 Sep 2019 23:21:05 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "liu.ming50@gmail.com" <liu.ming50@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core]  [PATCH] iputils: fix a usrmerge build issue
Thread-Index: AQHVYjbLHFixKxaCVE+8PaVO0Sc5MKcadTXQ
Date: Tue, 3 Sep 2019 21:21:05 +0000
Message-ID: <125d803667e745e3abe576316672be12@XBOX04.axis.com>
References: <1567501308-20950-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1567501308-20950-1-git-send-email-liu.ming50@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "stefan.agner@toradex.com" <stefan.agner@toradex.com>
Subject: Re: [PATCH] iputils: fix a usrmerge build issue
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
X-List-Received-Date: Tue, 03 Sep 2019 21:21:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of liu.ming50@gmail.com
> Sent: den 3 september 2019 11:02
> To: openembedded-core@lists.openembedded.org
> Cc: stefan.agner@toradex.com; Ming Liu <liu.ming50@gmail.com>
> Subject: [OE-core] [PATCH] iputils: fix a usrmerge build issue
>=20
> From: Ming Liu <liu.ming50@gmail.com>
>=20
> Fix a following build issue when usrmerge is enabled:
> | WARNING: iputils-s20190709-r0 do_package: iputils: alternative target
> (/usr/bin/ping or /usr/bin/ping.iputils) does not exist, skipping...
> | WARNING: iputils-s20190709-r0 do_package: iputils: NOT adding
> alternative provide /usr/bin/ping: /usr/bin/ping.iputils does not exist
> | ERROR: iputils-s20190709-r0 do_package: QA Issue: iputils:
> Files/directories were installed but not shipped in any package:
> |  /bin/tracepath
> |  /bin/ping
> |  /bin/arping
> |  /bin/traceroute6
> |  /bin/tftpd
> |  /bin/clockdiff
> |  /sbin/rdisc
> |  /sbin/rarpd
> |  /sbin/ninfod
>=20
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/recipes-extended/iputils/iputils_s20190709.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb
> b/meta/recipes-extended/iputils/iputils_s20190709.bb
> index 34a6c68..ea7e6e3 100644
> --- a/meta/recipes-extended/iputils/iputils_s20190709.bb
> +++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
> @@ -28,7 +28,7 @@ PACKAGECONFIG[docs] =3D "-DBUILD_HTML_MANS=3Dtrue -
> DBUILD_MANS=3Dtrue,-DBUILD_HTML_MAN
>=20
>  inherit meson update-alternatives
>=20
> -EXTRA_OEMESON +=3D "--prefix=3D/"
> +EXTRA_OEMESON +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', =
'', '--prefix=3D/', d)}"

This should be better:

EXTRA_OEMESON +=3D "--prefix=3D${root_prefix}/"

(and yes, the / after ${root_prefix} is needed in this case or meson=20
will complain about --prefix having to be an absolute path in case=20
${root_prefix} is empty, which it is when usrmerge is not set.)

>  ALTERNATIVE_PRIORITY =3D "100"
>=20
> --
> 2.7.4

//Peter


