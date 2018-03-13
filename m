Return-Path: <cbugot@sierrawireless.com>
X-Greylist: delayed 97715 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 Mar 2018 14:47:35 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0071.outbound.protection.outlook.com [104.47.40.71])
	by mail.openembedded.org (Postfix) with ESMTP id 8162171A0C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 14:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=SierraWirelessInc.onmicrosoft.com; s=selector1-sierrawireless-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Ho6+43i8DNmRN4EXzQGOAR1HhPO4lLxKB0tPYQWn3wA=;
	b=wuEntsxjsnBl+SCe12D6B6hsMO13iU9oBU4O66wJ/tWDDVIEtmebmHOBp3Uslo++YxgtyHRZh7qzWpqdTTOPrhSQzOQyg6H08nzxDjG9qCDwNqQC1B+3g9uHyAFlRO3sjpjPBotVgsZU2RMUsm7BLdczPt97Re59NGSGzWYlQ1U=
Received: from CY1PR02MB1152.namprd02.prod.outlook.com (10.163.15.154) by
	CY1PR02MB1304.namprd02.prod.outlook.com (10.161.170.19) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.548.13; Tue, 13 Mar 2018 14:47:35 +0000
Received: from CY1PR02MB1152.namprd02.prod.outlook.com ([10.163.15.154]) by
	CY1PR02MB1152.namprd02.prod.outlook.com ([10.163.15.154]) with mapi id
	15.20.0548.021; Tue, 13 Mar 2018 14:47:34 +0000
From: Cuero Bugot <cbugot@sierrawireless.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] Fetch uninative binaries before recipe are parsed so
	that the datastore variables are updated and recipes parsed
	accordingly.
Thread-Index: AdO62YYQHzEkagWRRpK02uiKqxXRng==
Date: Tue, 13 Mar 2018 14:47:34 +0000
Message-ID: <CY1PR02MB1152ECD60DF5735043471913A3D20@CY1PR02MB1152.namprd02.prod.outlook.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=cbugot@sierrawireless.com; 
x-originating-ip: [84.14.163.134]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CY1PR02MB1304;
	7:q5WWYQbYbd4zUpjJcPJjs+cglS2GoB0Bfn9IL2fUW8km+zHoIeDogMJcqVlZpmeqWV8TLHwOaBOAx7TpSf/Tm+BElYwYIogMOos0/7UiZQxKDmMeQUEymPdg7R2cpVsqs+Wl5ZaOCBNzidfGsz084N94Z2gHeAB8YIcemcRNorDwNO7B5jkkJJWyUOw3nkI+z6TI/El9HaMvOIxYYxsmtMpPDP5UwKD/ZCVGS66tbJOy8kZdAaTjenV07fkkLxBh
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b75126da-3c2d-403a-828f-08d588f15bac
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(7168020)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CY1PR02MB1304; 
x-ms-traffictypediagnostic: CY1PR02MB1304:
x-microsoft-antispam-prvs: <CY1PR02MB1304CEE93DD349867140DC4EA3D20@CY1PR02MB1304.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231221)(944501244)(52105095)(93006095)(93001095)(6055026)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123564045)(6072148)(201708071742011);
	SRVR:CY1PR02MB1304; BCL:0; PCL:0; RULEID:; SRVR:CY1PR02MB1304; 
x-forefront-prvs: 0610D16BBE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(366004)(376002)(39380400002)(39860400002)(346002)(199004)(189003)(99286004)(7696005)(2351001)(5640700003)(105586002)(8676002)(81166006)(6436002)(59450400001)(53936002)(66066001)(316002)(14454004)(102836004)(6506007)(81156014)(478600001)(3660700001)(3280700002)(106356001)(8936002)(86362001)(186003)(25786009)(3846002)(6916009)(77096007)(2501003)(33656002)(68736007)(7736002)(2906002)(74316002)(1857600001)(9686003)(55236004)(97736004)(2900100001)(55016002)(5660300001)(305945005)(26005)(6116002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1304;
	H:CY1PR02MB1152.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: sierrawireless.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: sND0mq1C+W5L1MXV1n/WypLADHpEk37L4x1AhLszFVDV73sDunLwAg2m342Z1rWmivxHmiHln5vimy0YyGuVUGKqjtaq3RZSeGCuOJEH3CN/KGsBIV9MUuo5p4Zum+R4OYMYroMGoE1dhYuC3KjVh36rzbGBWnB2WAp4kUc3PuIXFN0++jJiVuEcMJFAtjnRn4qThpR46BFvjIH0C4dtKbLOONtzw/Ddfp/sCuLuIpTB2qkwE5AFV+f1us6XMPmmNDBGQhB3VAsvVV4/RCYSwZ5wpKCO8bGXQJYqBD5i3dd4uuZPVWeDxNNx6u+mKR2WphMdxGDcX573AxRJjG6zeQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: sierrawireless.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b75126da-3c2d-403a-828f-08d588f15bac
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2018 14:47:34.7758 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 08059a4c-2486-43dd-89e3-3a747e0dcbe8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1304
Subject: [PATCH] Fetch uninative binaries before recipe are parsed so that the datastore variables are updated and recipes parsed accordingly.
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
X-List-Received-Date: Tue, 13 Mar 2018 14:47:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Make sure uninative_event_fetchloader and uninative_event_enable are called=
 at the same time on an early build event (bb.event.ConfigParsed).
This way the uninative binaries are fetched even before the recipe are pars=
ed (the event is raised several time before the recipes are finally
parsed). And the uninative variables are set to the correct values for reci=
pe parsing.
Note: it also saves a second complete parsing the second time you run bitba=
ke.

Signed-off-by: Cuero Bugot <cbugot@sierrawireless.com>
---
 meta/classes/uninative.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclas=
s
index 8f34483..5d4b277 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -9,7 +9,7 @@ UNINATIVE_TARBALL ?=3D "${BUILD_ARCH}-nativesdk-libc.tar.bz=
2"
 UNINATIVE_DLDIR ?=3D "${DL_DIR}/uninative/"
=20
 addhandler uninative_event_fetchloader
-uninative_event_fetchloader[eventmask] =3D "bb.event.BuildStarted"
+uninative_event_fetchloader[eventmask] =3D "bb.event.ConfigParsed"
=20
 addhandler uninative_event_enable
 uninative_event_enable[eventmask] =3D "bb.event.ConfigParsed"
--=20
2.7.4

