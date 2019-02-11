Return-Path: <matthieu.rogez@fivesgroup.com>
X-Greylist: delayed 950 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 Feb 2019 15:43:34 UTC
Received: from mx08-00371901.pphosted.com (mx08-00371901.pphosted.com
	[185.183.28.226])
	by mail.openembedded.org (Postfix) with ESMTP id 540D979CF3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 15:43:34 +0000 (UTC)
Received: from pps.filterd (m0168545.ppops.net [127.0.0.1])
	by mx08-00371901.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x1BFPkkq007088 for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 16:27:45 +0100
Authentication-Results: ppops.net;
	dkim=pass header.d=fivesgroup3com.onmicrosoft.com
	header.s=selector1-fivesgroup-com
Received: from eur01-ve1-obe.outbound.protection.outlook.com
	(mail-ve1eur01lp2051.outbound.protection.outlook.com [104.47.1.51])
	by mx08-00371901.pphosted.com with ESMTP id 2qhn13tfsq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 16:27:44 +0100
Received: from DB6PR0601MB2232.eurprd06.prod.outlook.com (10.168.53.153) by
	DB6PR0601MB2103.eurprd06.prod.outlook.com (10.168.57.147) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1601.22; Mon, 11 Feb 2019 15:27:43 +0000
Received: from DB6PR0601MB2232.eurprd06.prod.outlook.com
	([fe80::70a3:4b78:1f5e:5080]) by
	DB6PR0601MB2232.eurprd06.prod.outlook.com
	([fe80::70a3:4b78:1f5e:5080%8]) with mapi id 15.20.1601.023;
	Mon, 11 Feb 2019 15:27:43 +0000
From: ROGEZ Matthieu <matthieu.rogez@fivesgroup.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][sumo][PATCH] systemd: Fix typo in root home variable.
Thread-Index: AQHUwh5UsP8OD4X8PkCLNofGyv64Jg==
Date: Mon, 11 Feb 2019 15:27:43 +0000
Message-ID: <20190211152805.19320-1-matthieu.rogez@fivesgroup.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0242.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:600:8a::14) To DB6PR0601MB2232.eurprd06.prod.outlook.com
	(2603:10a6:4:47::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [185.8.253.125]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB6PR0601MB2103;
	20:ckDw+McXfLn80i+4XvbRfSsUHkB8cN2XP2eimhLt5aqC/M6ZCe+TDUOqpDjdnY1mprfy0az3EblhYRj0FvVmxZNel8RQxGXbnIqgu9LxJq65zkS4lqWZK0JfhqckHNqVJJnwQe6l74w/gb9S/MbgaAtjhcFYSJEvr/t5uD96xLA6UTuOfR1HwhG4vCsk313rHz9+d0R/Zc8aq+0qR85oSY+xfvu36m2lK5gfXKvd5T1anxbS/sWyzqnvW8FyNTsX
x-ms-office365-filtering-correlation-id: ee546fc0-9e9e-4217-1971-08d690357742
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:DB6PR0601MB2103; 
x-ms-traffictypediagnostic: DB6PR0601MB2103:
x-microsoft-antispam-prvs: <DB6PR0601MB2103F5F50F079C19547A39A9F3640@DB6PR0601MB2103.eurprd06.prod.outlook.com>
x-forefront-prvs: 0945B0CC72
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(39860400002)(396003)(366004)(136003)(199004)(189003)(6506007)(6916009)(6116002)(386003)(3846002)(2351001)(316002)(105586002)(4744005)(7736002)(106356001)(6436002)(5640700003)(305945005)(6486002)(53936002)(86362001)(107886003)(66066001)(25786009)(186003)(102836004)(2906002)(97736004)(6512007)(256004)(4326008)(476003)(486006)(14444005)(26005)(50226002)(1076003)(478600001)(68736007)(71200400001)(71190400001)(2501003)(8676002)(81166006)(8936002)(81156014)(14454004)(36756003)(52116002)(99286004)(2616005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0601MB2103;
	H:DB6PR0601MB2232.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fivesgroup.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: H8ZEWe6qOZHSvYxe1N0NSBdYlqbH5Iorw06Ec0ess6dgzHLZlY+eeGIlVJHdkLHkIWn7vkNlcJhSrJVmKaHpJfNOB1zkM7Mu7aNCj+lZ9/Ik8zVb8pQGdPTZ4KxU2el/pzv+qM6c05T19lIMWoXqektyVXtKObqRj7Wbc4gXAv8xa006edEP2Vik92CZUVS6N8GNyJpln7eg8usL1ruuBXJhBeXlKMPKeWHbpkN68vIw+JNYPBuZh+qjIh7VQ3IyxWXLLc5aOdA0lzGGaBqEVjrHR4dJ1hi5e2+OfMwu0OvGTdv1165eWDzsHwFUDzWoKgULFmhflpUWs0AEliBG59MwPXAghrNJbiFEUWENfhTZpeVo9VgVJ4WRPrsRFVUjOlASQeFAPmARIezy02wYzOz6jVzYCy9PM2ePQOvcT64=
MIME-Version: 1.0
X-OriginatorOrg: fivesgroup.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee546fc0-9e9e-4217-1971-08d690357742
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2019 15:27:42.6789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 8eeda45f-61e4-4e2c-ac8b-6019b84f9775
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0601MB2103
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-02-11_10:, , signatures=0
Subject: [sumo][PATCH] systemd: Fix typo in root home variable.
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
X-List-Received-Date: Mon, 11 Feb 2019 15:43:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This regression has been introduced while upgrading to version 237
(commit 906230a73b3ccfa4afd2a19a6b0aa18cd1d5fa08)
and seems to only affect sumo version.

Signed-off-by: Matthieu Rogez <matthieu.rogez@fivesgroup.com>
---
 meta/recipes-core/systemd/systemd_237.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/s=
ystemd/systemd_237.bb
index a409b18297..36f00af6d2 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -179,7 +179,7 @@ EXTRA_OEMESON +=3D "-Dlink-udev-shared=3Dfalse"
=20
 EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
                   -Dnobody-group=3Dnobody \
-                  -Droothomedir=3D${ROOTHOME} \
+                  -Droothomedir=3D${ROOT_HOME} \
                   -Drootlibdir=3D${rootlibdir} \
                   -Drootprefix=3D${rootprefix} \
                   -Dsysvrcnd-path=3D${sysconfdir} \
--=20
2.20.1


