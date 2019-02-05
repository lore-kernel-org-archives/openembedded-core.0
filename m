Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58AB16B06C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 08:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 99430184AD;
	Tue,  5 Feb 2019 09:02:13 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id go0q80rFCw3R; Tue,  5 Feb 2019 09:02:12 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id A47CE1834A;
	Tue,  5 Feb 2019 09:02:11 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 939751E066;
	Tue,  5 Feb 2019 09:02:11 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87B2D1E056;
	Tue,  5 Feb 2019 09:02:11 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue,  5 Feb 2019 09:02:11 +0100 (CET)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id 7BAC02ADB;
	Tue,  5 Feb 2019 09:02:11 +0100 (CET)
Received: from xbox12.axis.com (10.0.5.26) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 5 Feb 2019 09:02:11 +0100
Received: from XBOX04.axis.com (10.0.5.18) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Tue, 5 Feb 2019 09:02:11 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Tue, 5 Feb 2019 09:02:11 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [v2][PATCH] timezone: refactor to simplify maint
Thread-Index: AQHUvOYFs6far5f1ukeEz1iMOUe2u6XQ1gRA
Date: Tue, 5 Feb 2019 08:02:10 +0000
Message-ID: <a5620373fc864292bd5fb263253c0e07@XBOX04.axis.com>
References: <1549324887-20286-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1549324887-20286-1-git-send-email-akuster808@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [v2][PATCH] timezone: refactor to simplify maint
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
X-List-Received-Date: Tue, 05 Feb 2019 08:02:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Armin Kuster
> Sent: den 5 februari 2019 01:01
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [v2][PATCH] timezone: refactor to simplify maint
>=20
> move tzcode and tzdata-native into new dir
>=20
> Updates are now limited to the common include file.
>=20
> [v2]
> Fix UMMARY typ0 in timezone.inc

Move the v2 info to below the --- since it relates to the review process=20
and not the actual change.

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../timezone.inc}                                   | 21 +++++----------=
------
>  meta/recipes-extended/timezone/tzcode-native.bb     | 17 +++++++++++++++=
++
>  .../{tzdata/tzdata_2018i.bb =3D> timezone/tzdata.bb}  | 12 +-----------
>  3 files changed, 23 insertions(+), 27 deletions(-)
>  rename meta/recipes-extended/{tzcode/tzcode-native_2018i.bb =3D> timezon=
e/timezone.inc} (63%)
>  create mode 100644 meta/recipes-extended/timezone/tzcode-native.bb
>  rename meta/recipes-extended/{tzdata/tzdata_2018i.bb =3D> timezone/tzdat=
a.bb} (94%)
>=20

//Peter


