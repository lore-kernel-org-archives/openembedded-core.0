Return-Path: <Hugues.Kamba@arm.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0078.outbound.protection.outlook.com [104.47.2.78])
	by mail.openembedded.org (Postfix) with ESMTP id 8D57B79D62
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 17:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=hLszfTU8rnJCtZg9luJ59q3TzXAmsYq7ZirnH9J6t8Y=;
	b=C2++wAmZ33TfeUhEJsYod1AwlMx6tl7JGiodGJha3dNIslbMkh7xXTw3DCpcyWhlOZmkKph9a7idTCPaxIQ3px4dGBtb4aMZXgzX44XqVCNNvCStx2XVWwE7py20fwBXzhQId7+haMa0TJQs1iZkeAx/0lBvoG0+nE4SCY82Phw=
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com (20.177.61.82) by
	VI1PR08MB3231.eurprd08.prod.outlook.com (52.133.15.159) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1273.21; Wed, 31 Oct 2018 11:29:20 +0000
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::545d:f7d:7c9e:bf11]) by VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::545d:f7d:7c9e:bf11%2]) with mapi id 15.20.1273.028;
	Wed, 31 Oct 2018 11:29:20 +0000
From: Hugues Kamba <Hugues.Kamba@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v3] python3: Add python3-venv package
Thread-Index: AQHUcQz3QlVTDhnQKkyvAXoScQb6wg==
Date: Wed, 31 Oct 2018 11:29:20 +0000
Message-ID: <20181031112912.36661-1-hugues.kamba@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CWXP265CA0081.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:401:39::21) To VI1PR08MB3631.eurprd08.prod.outlook.com
	(2603:10a6:803:85::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Hugues.Kamba@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.141]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR08MB3231;
	6:dLsqMSmITyJp7erqjdBUrSSpHu/jO64mhFx77k5zsNrCEIe66zHMfluurOLk+w5UJ1UaZ0rPa3o2oxphlNC547WdmCoQ+T3anAxfNDL0FDGQaCHGs0Nev2hTtois3uu6aZSZKhwBWGLl+kVxIuqLJyyjio4rO6Q08NRo9ecBE5yZTXTkfigRGR4/BDEb7EgjNUv+g+7p6xQ5tzQnrrPeCOB7gVKVphePfumCtNkofDUIZ10bnmvq6z5rTFNqxNQx3J6ySt7rgL+yUYKDkzSbs71hwovoF6FT/u8YnEBSVTu33KsilGQF82W5AE6/anN/z+jLvg/WciarQlRiGpmN5ytqwakgvMg6lwQyMYcroDz8uDEakltSVn1ky3X0Uk3dDcoWWGGmkCVhl8YCoXgK1NGaHTFScJMywRcK2N0/N/KYewdg7V/ldoHFmQyupvcRaLESvFZF/AIjB0wbIVCoIg==;
	5:+2fNktSsNkB6xSDGuBEJPwpCGtVsrr8yhWThIWjqBTNUABCioRKJDXziHPn7lidsNt/IHa4/QidCNhvQ/gZJMJrl4jLPpDrxtIO7HECgS6qHkAkX0sgay+CXz4fMsW1EZR6OYZF00AtKBSGVrVh+6N+yyoEj9JQtKM2ryWmoNXA=;
	7:WtabC8v5cn0nFy6w1xipR0NHfxd4XyjJ14reQeCSmT7nKXV6ngjI9jXFCJ6TlhmgbIBQYHq5zfowzw6PQvWxIIMuGuTZ3OuNrcNhtuWH1BiGw9abXsbxb7cU+EYTAGUoCRbIvTWFUJHkfMolxT8RYg==
x-ms-office365-filtering-correlation-id: 3a9936d9-78ea-48f3-4314-08d63f24194f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR08MB3231; 
x-ms-traffictypediagnostic: VI1PR08MB3231:
x-microsoft-antispam-prvs: <VI1PR08MB32316B69DE2A8315A4F5396A98CD0@VI1PR08MB3231.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231382)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR08MB3231; BCL:0; PCL:0; RULEID:; SRVR:VI1PR08MB3231; 
x-forefront-prvs: 084285FC5C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(376002)(366004)(346002)(136003)(199004)(189003)(40434004)(2900100001)(6916009)(26005)(7736002)(256004)(305945005)(2501003)(72206003)(2351001)(68736007)(105586002)(5250100002)(2906002)(71190400001)(71200400001)(86362001)(2616005)(6436002)(81156014)(8676002)(476003)(81166006)(486006)(99286004)(5660300001)(36756003)(8936002)(6512007)(316002)(14444005)(5024004)(5640700003)(6486002)(25786009)(3846002)(44832011)(6506007)(478600001)(6116002)(102836004)(1076002)(52116002)(53936002)(14454004)(186003)(97736004)(106356001)(66066001)(386003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3231;
	H:VI1PR08MB3631.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: 7G7/8Qyo7uLVxhTMSnI2CU8DneGzKdKjJPYvTAzP1InZLyH7fELjusz6NrJgd22yZmGf8NKKwZRtg75g0WP5Jj6vkIl4vkyMsm9siyFaF1oByN+kj7+bzjyq1ODqOjCIUNMUGCp2xHBl5YPjcR7b+bs2CEjIOtMpDB6w1FodptdD7OKA71su7ZgLAd86fy38/XkdY+kX7gywQzAc8ByAVpG/FGCVa97U67J8V8Grr/mJcY+4044gKM0rX9dAxAEbmfyIZhytTPp2VnJXQYTdJqPeG6+H6YZe0qsye7vgNGbYl6CoSupOTvErfSj4bkwYnf+Emi9uVdOjggqI2FY4rrvVVHS6aYxGy9vYVtk4DAo=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9936d9-78ea-48f3-4314-08d63f24194f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2018 11:29:20.2063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3231
Subject: [PATCH v3] python3: Add python3-venv package
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
X-List-Received-Date: Wed, 31 Oct 2018 17:01:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Package both the venv module and the pyvenv binaries into the
python3-venv package.
Add python3-pyvenv RPROVIDES to python3-venv for backward compatibility.

Signed-off-by: Hugues Kamba <hugues.kamba@arm.com>
---
 .../python/python3/python3-manifest.json         | 16 ++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.6.bb    |  4 ++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/m=
eta/recipes-devtools/python/python3/python3-manifest.json
index f922561368..ef7fa4ecaf 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1107,6 +1107,22 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
         ]
     },
+    "venv": {
+        "summary": "Provides support for creating lightweight virtual envi=
ronments with their own site directories, optionally isolated from system s=
ite directories.",
+        "rdepends": [
+            "compression",
+            "core",
+            "logging",
+            "shell",
+            "stringold",
+            "unixadmin"
+        ],
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/venv",
+            "${bindir}/pyvenv*"
+        ],
+        "cached": []
+    },
     "xml": {
         "summary": "Python basic XML support",
         "rdepends": [
diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-d=
evtools/python/python3_3.5.6.bb
index 2a4547694a..31f8eada11 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -226,8 +226,8 @@ FILES_${PN}-2to3 +=3D "${bindir}/2to3-${PYTHON_MAJMIN}"
 FILES_${PN}-pydoc +=3D "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
 FILES_${PN}-idle +=3D "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"

-PACKAGES =3D+ "${PN}-pyvenv"
-FILES_${PN}-pyvenv +=3D "${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyven=
v"
+# provide python-pyvenv from python3-venv
+RPROVIDES_${PN}-venv +=3D "${PN}-pyvenv"

 # package libpython3
 PACKAGES =3D+ "libpython3 libpython3-staticdev"
--
2.18.0

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

