Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 47021 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 03 Nov 2018 01:30:53 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0056.outbound.protection.outlook.com [104.47.0.56])
	by mail.openembedded.org (Postfix) with ESMTP id 9F41879D76
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 01:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rgzVuv/EMiQZmxnNb+hngTKA7o8pvRzt0x60wFeoES8=;
	b=lTFwV7g1jhfwH13vwq2GZrIR8+qCKPNIQkSI5ZNVKEzDtfs87E7aZHPOQtydGC/z64nA4UbQqRs2AeAAyfBv3tm3csD6dk25A2vtWSV4zpdcior9BhEgC342RxsnzdELkw8wE32Zv1062Wzv1RWU8/KoZBYQLScb78eGKBUVD9M=
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com (20.176.235.12) by
	DB7PR04MB4203.eurprd04.prod.outlook.com (52.135.131.12) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.21; Fri, 2 Nov 2018 06:52:45 +0000
Received: from DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::9563:6aa7:dd40:a955]) by
	DB7PR04MB5068.eurprd04.prod.outlook.com
	([fe80::9563:6aa7:dd40:a955%5]) with mapi id 15.20.1294.024;
	Fri, 2 Nov 2018 06:52:45 +0000
From: "C.r. Guo" <chunrong.guo@nxp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [thud][PATCH] ppce500v2: remove spe
Thread-Index: AQHUcnio2J7rM4/TeUaFri7VXLgNRA==
Date: Fri, 2 Nov 2018 06:52:45 +0000
Message-ID: <1541141546-32688-1-git-send-email-chunrong.guo@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0046.APCP153.PROD.OUTLOOK.COM
	(2603:1096:203:17::34) To DB7PR04MB5068.eurprd04.prod.outlook.com
	(2603:10a6:10:1c::12)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chunrong.guo@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB7PR04MB4203;
	6:5IE7nCHS/v65nvyxKttTmuWS2XeYa4RX4Mzj4+2KNB92O2Q3q+IJOyTS6c7xtKAxa9AT+nsGbkfGxWGoZmnznahYjBC8WE7UK1n2Plrz2Uhl5WICpckm7LVsrwftb63moww6P/FF3PTOjvCLOwmm7m/OJsHJ+SPmR+Oo2k7tNRHQlBHkqtwIj7VK/EThWBnATvjlaXP1dG3gvXF50alyxb2iH78drXziy/JLuShtMwyT6QZtfXcYtJvG/zAwHeyizqC56B2VljGHE2aFjfCceRDFgDZZMXqBsC0aqGmEWOMlESneWtzRgi8XmBKUrEE2AHURia3+j1NVD1l5b3LB0Y/34tRjcteaX/Y9xmfuApSvcBlkiaClpw+DXijVxrV0jjoa5F9aexXbZw0CXZyogeOFp02hxRJQ9+dv+H2KUfDxp7RddG35hAqnXYgTtHo4tKNGRC2GavsmrclMrXBUCQ==;
	5:iRjv49Wa5DfvkHjqCRrKelOZHNDynE0Rjcjj7gRo4oWJfss+LQF1JnlioL/zQWutvV9s8GsitQEkUXFLfcS75SB5/t2Vk1j/fC9RG0t0qvAlsoZyOvi0u1zgZypS4CVq3bSSksrKygXD+aiBPEaPmdF8v9jALcvdjOYv/5H6RRw=;
	7:mbdyUnWJs3A04lZIqdOjeu6Cemngw54GmK4GGVfysdBl9GY1tGpyRWqN95DFmqSgmPR0b82RVlEAKzkp9tdVnuqfzJb66hzcHv2eVHl1Gz2/QLvUia66aDk9UNTGUfv0MXxfHpju36MCNHbwcSVNiw==
x-ms-office365-filtering-correlation-id: bf5e990c-a75c-4fb3-6ada-08d6408fcb12
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:DB7PR04MB4203; 
x-ms-traffictypediagnostic: DB7PR04MB4203:
x-microsoft-antispam-prvs: <DB7PR04MB4203676ABAF7265B72942D9984CF0@DB7PR04MB4203.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231382)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:DB7PR04MB4203; BCL:0; PCL:0; RULEID:; SRVR:DB7PR04MB4203; 
x-forefront-prvs: 08444C7C87
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(346002)(136003)(396003)(366004)(189003)(199004)(68736007)(14444005)(5640700003)(106356001)(105586002)(2351001)(71190400001)(71200400001)(2900100001)(305945005)(256004)(81166006)(53936002)(7736002)(4326008)(6486002)(6512007)(6436002)(25786009)(86362001)(316002)(36756003)(8676002)(99286004)(52116002)(81156014)(8936002)(476003)(2616005)(66066001)(486006)(102836004)(26005)(386003)(6506007)(186003)(1857600001)(2906002)(478600001)(97736004)(6116002)(6916009)(3846002)(5660300001)(14454004)(2501003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR04MB4203;
	H:DB7PR04MB5068.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: LnzW+IesFLMLr1jpuxTs8DVLrJzlMrYlJrIApAfhp3t6d6NkVafEzMV5EmdQ3B/yg0g3Q0cPSGv3rKhLKhjMTakBrLyX2C0B5vkkgrvxX6Cs38i1xf433aaSzrRXM0vHyBk6p5nK1EbWyJV3c2X9py2WqiYGH2Rv5uvpouLvnq7uv/kjHhT/HixsO105Nki3uwLBiJiD2WDvN3hDuhN/qw0m2D337EycoacRQe3P6NaCFcwed3pKD9vVqJghZKfVs8MUvQG0IFdIyoTwYixmhl+GigNeT0kEKXKpmHKDs9DlOFiRQcGx+fDzmkuD2sDKXWWG17wyTcGB4Zgla0K3+hcHfiMNqDEJka9gFxje5Lg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5e990c-a75c-4fb3-6ada-08d6408fcb12
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2018 06:52:45.5620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4203
Subject: [thud][PATCH] ppce500v2: remove spe
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
X-List-Received-Date: Sat, 03 Nov 2018 01:30:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From: Chunrong Guo <chunrong.guo@nxp.com>

*The PowerPC SPE support is split off to a separate powerpcspe port

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 meta/conf/machine/include/tune-ppce500v2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machi=
ne/include/tune-ppce500v2.inc
index 3a006e2..d318bba 100644
--- a/meta/conf/machine/include/tune-ppce500v2.inc
+++ b/meta/conf/machine/include/tune-ppce500v2.inc
@@ -15,6 +15,6 @@ SPEABIEXTENSION =3D "${@bb.utils.filter('TUNE_FEATURES', =
'spe', d)}"
 ABIEXTENSION .=3D "${SPEABIEXTENSION}"
=20
 AVAILTUNES +=3D "ppce500v2"
-TUNE_FEATURES_tune-ppce500v2 =3D "m32 spe ppce500v2"
+TUNE_FEATURES_tune-ppce500v2 =3D "m32 ppce500v2"
 TUNE_PKGARCH_tune-ppce500v2 =3D "ppce500v2"
 PACKAGE_EXTRA_ARCHS_tune-ppce500v2 =3D "ppce500v2"
--=20
2.7.4


