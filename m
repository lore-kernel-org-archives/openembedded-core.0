Return-Path: <Hugues.Kamba@arm.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0070.outbound.protection.outlook.com [104.47.2.70])
	by mail.openembedded.org (Postfix) with ESMTP id 811F860237
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 13:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jEVQnfdEEZPvfhc5Xq7NJkvUkLf2CV0p19Hp6k6J6Qs=;
	b=ELJCp9OO7Ds6V/R3/60vVw63kubIkvkHB0lGBYArC5msGyQuG4Fa2wMzcHMB4yoa9pz6J1mkxTHAVSBM4jUGDyHRTIBzipsqb1vUJP5e4vjKiOvpD7jlb0v0SQ7VnncIeaYB36IHQUqkgTfQ5ml0O+Tzq4acgzLcKNl2WfE4DRg=
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com (20.177.61.82) by
	VI1PR08MB0800.eurprd08.prod.outlook.com (10.164.93.26) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1273.21; Tue, 30 Oct 2018 09:37:25 +0000
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::545d:f7d:7c9e:bf11]) by VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::545d:f7d:7c9e:bf11%2]) with mapi id 15.20.1273.025;
	Tue, 30 Oct 2018 09:37:25 +0000
From: Hugues Kamba <Hugues.Kamba@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] python3: Fix python3-pyvenv run-time dependency
Thread-Index: AQHUcDQqfCB08Ue58EaZPet6Df5zNw==
Date: Tue, 30 Oct 2018 09:37:25 +0000
Message-ID: <20181030093655.26251-1-hugues.kamba@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0046.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:600:61::34) To VI1PR08MB3631.eurprd08.prod.outlook.com
	(2603:10a6:803:85::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Hugues.Kamba@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.106.55]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR08MB0800;
	6:wykQTrBZip0NeI9cZW58Dkbckd9yQ2NrS87ykAuTSpHZWnp7ztNh64jION8n46vv8NTug8kcjaxLm5AnZIA246J2fXYy4d7saR3IbKTohOZMOIz/vI/IWiVJKbiY9JgTst1n2QCJ8Swo0GqbG3XtHaRWl/m3QccF0u5+UTUC0c7mIa9ghfkSKdOJ95/HkMhD3OcNstFGK/qQO9tNDCBFAlVZVUQ8UjBpzrIlZbmAJZmmwX32owZa2uTlCXzZme4stvc/h3IW/WwnELaiA7ZD6u3pG2coFsmUfHCmyVq6ZgnjCEe1StOYJWoMFH6rJse6sPUEOCvbjsqHb+Eorof9yrVP3/GlOE/1yeMgPeRsfKcA50pmrasTMGkM9C1V/LAKt7xuMkvaeV9e9rCs61kFzObUNCO3Ywr+WsTH0COz+PJS7HgG42k6qmIwvyIftPVi8fHIlcZi0XIxsTV9qbfOqw==;
	5:ux7Ma4bUN+0CKOk8W2ZRzQO9W6VWtwREtKVtBouO0vGyC8rHhsLu6fV1CxFFdZK4h4bWzTYKgsw9RctziVapBtdeEOtrJRSlnVwhrt19wCWYPF2hmY5+zWnrYe8A2ypiwJ3nXDxA/rDRDaXXEuaJVwmOmo9onQLPDqV1rurFvog=;
	7:bul6y9oZ/QEYjHuNh7oN12durIunXehaCxyyeAN76WLccPvfhfi9oyLLqJKxvf6cVcB6j0Je+nfyBOIEKL2P+j71j+8uFhEqNX7I6McFj3jqjCZe/czXcXVquxNr1nPDziZEkUrTyqwdCHrss8+K9g==
x-ms-office365-filtering-correlation-id: 1bb662c8-a121-4331-0270-08d63e4b4ca5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR08MB0800; 
x-ms-traffictypediagnostic: VI1PR08MB0800:
x-microsoft-antispam-prvs: <VI1PR08MB0800F1232595C5EE3C31131A98CC0@VI1PR08MB0800.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231382)(944501410)(52105095)(6055026)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR08MB0800; BCL:0; PCL:0; RULEID:; SRVR:VI1PR08MB0800; 
x-forefront-prvs: 08417837C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(346002)(39860400002)(396003)(376002)(136003)(40434004)(199004)(189003)(186003)(52116002)(99286004)(5024004)(6436002)(5660300001)(6512007)(256004)(14444005)(14454004)(71190400001)(71200400001)(36756003)(25786009)(66066001)(478600001)(5640700003)(6916009)(6306002)(1076002)(8676002)(97736004)(5250100002)(68736007)(6116002)(486006)(7736002)(316002)(53936002)(8936002)(6506007)(26005)(3846002)(81156014)(81166006)(2616005)(2501003)(86362001)(6486002)(2906002)(476003)(44832011)(105586002)(72206003)(305945005)(102836004)(2351001)(106356001)(2900100001)(966005)(386003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB0800;
	H:VI1PR08MB3631.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: zxKhZDS0qg/a1It+a9/qlcsfi5wU6t6wr1s96X6dNH+5DTkzWEat+M2fRLFPRFG0p8XHRdqV25fdHq/zxS+rLO464FluOxKNzThxrs5PjHY1LzPj6bBPqXMziAObEVG0bMXJVsN1nxojSny0V/ixNYVTxpKFZVbEitV4fXvtnlN0kmmOjS3s+XF4kLaweT9wMt6NXsVFJWzkxsP4AmAbh9UIvC13lHrt7jHV3Csdu1mFWBe9nTjEWLCQHjNhwS9AFX9vMi7VAbIWQJdrbi/nAFDMekoM4xxJwEOf42kgQSRPlgkOEbgpyiMEkjQMo6HhOheHzJHPSP+mqfev3WQH6W/5S3AkCTT65WqsHErmjY8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb662c8-a121-4331-0270-08d63e4b4ca5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2018 09:37:25.4168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB0800
Subject: [PATCH v2] python3: Fix python3-pyvenv run-time dependency
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
X-List-Received-Date: Tue, 30 Oct 2018 13:08:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Pyvenv is just a small script that uses venv to create virtual
environments.
https://www.python.org/dev/peps/pep-0405/#creating-virtual-environments

This patch adds the python3-venv module as a self-contained package which
python3-pyvenv must depend on at run-time.

The patch also provides the package python3-pyvenv from the pyhton3-venv
package.This is good for future-proofing since python3-pyvenv has been
deprecated and only python3-venv is now available in Python 3.6.
https://docs.python.org/3/library/venv.html.

Without this patch python3-pyvenv is broken because it is missing the
venv module at run-time. This patch specifies the newly created
python3-venv as a run-time dependency of python3-pyvenv.

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

