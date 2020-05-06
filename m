Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.84])
 by mx.groups.io with SMTP id smtpd.web10.1534.1588746229679812022
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 23:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=iKRmaTZ4;
 spf=pass (domain: siemens.com, ip: 40.107.5.84, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHHx7ENUt2RNppPVVqE9xt8TaccFl1OeQh9zx6xfJKgcyrsIGYKU6DD+ozPYNl9xKSViz5SpBzTwz66q2pkccDEz8mUL0jAa2SP1iUe6HetxEr9jDL04PSAm5AEYjTMVu0AZHw+LONj5/j40OgtCAvtj9SJJk4iYQ3OZA2+QFBWCGTBcS2GDpnOfHJFbJ2sZtLLM7kTonzu9bNbwXAgWjACRM/k2zXcbZSbvWAxPJ8XKybKB9mfu4bOJ3vdGDUV7Q86EJxM29MWUrK23Vz6HnYHuf5FEeBL//k3dERiT6MuMZ/9lr3v1+QVfp1MVIVlRgA1yusw9Chiil37pi2pCBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7AEgLgQiDusvgNeMicuUd8kui+4lSnJKOzHgG0qrSE=;
 b=CH69mm4G/Ohsk0U/1V6frGwSbCDgNqC8C4Sq8+aflRGdMi6DYRaInJCZWoQwvcdNbT7Aey79zdO6mauHA8pygmg00iyX+DPWbNwTk22LlKC00NhS5jpGEx9friWDYkafWPNhXugQQ4MPalaw2OEpoJb7NgroUCfuSs7+IGa0kWAvuEYJSbnn8PVMQUcuPsXnb6q8wBUUdSfEgbXixVgGuiuTcSw4S6SJ1ICa4OCvdkO/tpCN2TP3rpGyhEAS7ev9s1P3ZPWwcexmYutf5rbEXYYZ5di4xhe0Thso0UE9WPH8MvOSRQ4WADcC+nKUa7VMGKnbI+dhLEHiTnWjZyknMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7AEgLgQiDusvgNeMicuUd8kui+4lSnJKOzHgG0qrSE=;
 b=iKRmaTZ4Y0UN+PDP2IObOGEZQZDV1j4HbDzE1ET1inOwsd4khQIF41Jt+C9vmETbJh+yQv46jRO/hR4Z0A0vl/WuunLxKd2m9Np5AL/YTPhwOo8PR1LBrSuD0sY9ldfRULZCQfzPfuX/3h/TqgiwkQ7RS/10b0SHhbyXu81LTkc=
Received: from AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:e6::28)
 by AM6PR10MB3016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Wed, 6 May
 2020 06:23:47 +0000
Received: from AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::808a:ad03:40a9:baec]) by AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::808a:ad03:40a9:baec%6]) with mapi id 15.20.2958.030; Wed, 6 May 2020
 06:23:47 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] vte: add icu dependency
Thread-Topic: [OE-core] [PATCH] vte: add icu dependency
Thread-Index: AQHWIyHNAdp/OwGPaUi4MMBkYnaYkaialtLw
Date: Wed, 6 May 2020 06:23:47 +0000
Message-ID: 
 <AM6PR10MB30006B2E2AD20BE11908060892A40@AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM>
References: <20200505211114.2519-1-alex.kanavin@gmail.com>
In-Reply-To: <20200505211114.2519-1-alex.kanavin@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-document-confidentiality: NotClassified
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=siemens.com;
x-originating-ip: [165.225.72.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 70d2685d-056c-4808-0929-08d7f186091d
x-ms-traffictypediagnostic: AM6PR10MB3016:
x-microsoft-antispam-prvs: 
 <AM6PR10MB3016F3C83CC31513D3B3449892A40@AM6PR10MB3016.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-forefront-prvs: 03950F25EC
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1ltwW4/5rlgkQ9Tuie0QeHK4TJMZNJLEtF/WmdbmI/6VGgHyAc2PdaSkFfPgdTrMiEwNmhevPsrEGZtm6plM9yuHmS4Q2+diR2Lz74h+4nh1mIIwtvqiAhO8G6+7bO8uV/NMdXt1npBEPt4vIdjvxgefUe/P6XxjL0214Z5s3wa78/rDC1BCuf/Z8Ccyo5pDmAdphqjT/zXvpOQnh3xGKykqlcriiO55gAi+Vw2Q7jkDVKkFndIhFI3sw4bPp/DA1+tS0jUNG9USchUm77xkwt84clfqfe5fZfQ3LFgrNuf4EVoDwjKoWoB+NzySe+e8y5rKiptQyiILeImHsiMXU4xnPq+wTQsLjbx1Ac6SuQKuTOcneQb78MrDiSmWJEHQ0bpUs1qjRlodLUa7QhFnr9U6/OpAAzapPuqiqRAiIwfKo1rpyE3PDWlCr4OzHa87Yk55/u5DbJ/u2Z+1xgtFxfdraJ4aizLJlk14qLEhCaLtxH4CxzBHI2eLMWQsWeo0igPLkIBl0D+ICrA7Ta5ZBBCs00FXCMcZWefXr5YEUGCkuXhMaMlRFHJkGPITYesMuyiYoNZcUcq6/5w/xDeatb6viBh2ddqmW6GDSlpFKjA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR10MB3000.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(33430700001)(66556008)(8936002)(66446008)(52536014)(8676002)(76116006)(4326008)(66476007)(66946007)(5660300002)(55236004)(6506007)(53546011)(110136005)(33440700001)(316002)(7696005)(64756008)(2906002)(71200400001)(9686003)(55016002)(966005)(478600001)(86362001)(33656002)(26005)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 njd4r+DrOjnF2HhkHqJhaB0YscZRxbRpGqB8bL4oILo4w/fLquKpVqU46oBO+1EdDqr4TkfeyXjH1KZjueIhHeHyZg2fL03IgeCs2qXBl7JtKPBeCq/kpUcU+lwdobfY/LAuwT3QcT38LrO6UuvBvNzo9+f02yYRd0eIKrM2pnu2mgvjgAVzzl1jq7wBxtkvzYCqAwkAfZnuys8aum9jdnBaTCfHZYtm90ENoJLDaZncVxaYh6y3+gQimqdkdgADASF8NK7TLtGHcrZzn+y6F+AimHHDpWLuE09UiSZUEX2R78yK/jG0NzlfUpy/YklhbwTHzfqT91UzY/dQ9nLkClg9jA1r8K0tHHx5sFu7EXKkMXIrYKk2JPMgHTXrQIkPqAN2TdIygKeZnPeWmZToK84jKYuSXb3JhCipfzsGIAo2ZUGpKzhaYd2juqOcgFMzbB78805M2yZbeooapboTQ2vwkHVd7bR6i7Cs9paesoCOnUrcy37Qk2arVFnoQyDJqqjoN8UHZOXWJ1boPARcHWDNIHVq//EqpE8JMmopp9vlr6IKCaY123nkpfSEixoHxeoGehs180tvHHaWSo5h53+ooaXxXAUfhVBztZhkcVafLqNAW0IOhUApWo+ON3gmtIZ4epqNqVWx+3v7mRr/RzW1enP+fC2+sA+IEjT3AXXMYVZ7HLfFJyi291RKydwPbPkZRfj/t1jlevPicLl6LcFUh3l0TqCRGW6LA30SdMXyfC43PCQ1jY/9fRzy8hQzs6tFSguBkK/cuwwnws/CHdEOIbclXjGdlwIx8n8uhAM=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d2685d-056c-4808-0929-08d7f186091d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2020 06:23:47.6144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CQhcFN0aSCBDfpeBOxa2uuRdpi5vpEFTN+InKe5u92sVxvnVEtEcpWWzI5+VWtsHAUqZrXEp4pTYsrJLum7XsXKvHaPue7jb16VGKWfuOwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB3016
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

There was a problem, that libvte was searching for non existing symbols in =
ICU library after upgrading to version 67. But this is little bit funny, th=
at vte could be build without ICU support https://github.com/GNOME/vte/comm=
it/3ecbb90577582b93f43b184aab1cedd61a9ad86b . So looks like, internal ICU i=
s not full matching with external library, even if the external shouldn't b=
e used.

Cheers,
Andrej
=20
-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Alexander Kanavin
Sent: Tuesday, May 5, 2020 11:11 PM
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [OE-core] [PATCH] vte: add icu dependency

This is new in 0.60, and needs to be added explicitly to cause vte to rebui=
ld properly against icu changes (there will be a QA check to catch such sit=
uations).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/vte/vte_0.60.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vte/vte_0.60.2.bb b/meta/recipes-support/=
vte/vte_0.60.2.bb
index 3891ff8165..a722e152a4 100644
--- a/meta/recipes-support/vte/vte_0.60.2.bb
+++ b/meta/recipes-support/vte/vte_0.60.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D " \
     file://COPYING.LGPL3;md5=3Db52f2d57d10c4f7ee67a7eb9615d5d24 \  "
=20
-DEPENDS =3D "glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native"
+DEPENDS =3D "glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native icu"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
 GIR_MESON_OPTION =3D 'gir'
--
2.26.1

