Return-Path: <Hugues.Kamba@arm.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0079.outbound.protection.outlook.com [104.47.2.79])
	by mail.openembedded.org (Postfix) with ESMTP id 62E4D74E1A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 01:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=AYip+KyIuI4szvuXQx+6wRnOkresxfguA9juoTkkflk=;
	b=K43CoD5N3FqH0u/u3fTk4tgL4X6sFxTCR9Q5CkRfxqeJgq9MpeLauzbdrNVd17GLWyAPTk4otEGwlOteXg6jSSx2Jl0aE4e6iPhRNbG82ofRZBOApnbtH4M8j+qLGZ2/bkFSnrOggUxz0LpaFFVoDcIUOyo7sjfu8xFv78vpcs4=
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com (20.177.61.82) by
	VI1PR08MB3134.eurprd08.prod.outlook.com (52.133.15.27) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1250.30; Tue, 23 Oct 2018 08:49:46 +0000
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::c4f0:a260:fc5c:1c78]) by
	VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::c4f0:a260:fc5c:1c78%5]) with mapi id 15.20.1250.028;
	Tue, 23 Oct 2018 08:49:46 +0000
From: Hugues Kamba <Hugues.Kamba@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] python3: Fix python3-pyvenv run-time dependency
Thread-Index: AQHUaq1Z72sGK8G3VEuzU2sUeExOyw==
Date: Tue, 23 Oct 2018 08:49:46 +0000
Message-ID: <20181023084931.5543-1-hugues.kamba@arm.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CWLP265CA0072.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:401:12::36) To VI1PR08MB3631.eurprd08.prod.outlook.com
	(2603:10a6:803:85::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Hugues.Kamba@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR08MB3134;
	6:DpEkkhaZZxpvezmEasMWip/XHZ558ZPbZFt7DXAYKY+cAD7fZTuxw5NekeafWejIeLRxFo9Y5bys7WmqQLZrZTM7z/NpbGa8yf50KbiFHPi++ph5Sfhyl/9o6NVC5eukt6JyLBW1bbrCWVrRqnpb5FWQkQnJ3IUg/TmkXDYZbSm+2aFdrobWHlIykYt0g6P7xFpHng6mgmwgKtyqF9z7M4DYrUg3SFX061zwVIBFRUlYAd+hIwfcBAUkcP86pyCQS/H/IFwBK0bMZKgYaxC/DiP6m7ni9qNzDyNZALkLosb0F4/ol6QnkcO73BrstgRwUccNt1nmg2NZET5KYed/OUSc/QDNV8/o1CGSCGskrL8G4WG+JujhKML5hrfjSMuBjpz8CKfStzB08K3jOycocijq+d5juPAxFN+Gfmk0ZLSWZ437reZzwPxwsGaATv4jIlz+mo6USbot6UFtXkdf/g==;
	5:kRXeT9uf6Sv0D39ebbETgJc3pMNhJ0I1lpLGOWZu8zSk/zimP20mD95Gd98toi2qF0JWr0NXoBWRNZ0cgSBcOs6JOgLZSuwHC1kduQFli/XsjEabwdLWUu1+O7ZkDmlRBx1jG3A6J4yOSL1Qyj1uqTjp/8MsVOaTfK6Gkux30Vc=;
	7:cUNPN2jOTHk/FvZKTsVF3c5VYL6WOc5m8qBFiL7hD7GCs7CcezalVwgo8dni3ZCGiCcX/LQR9X40rjbf57PSKDcFlyj0hwneTMCMPQ8me4nFj6Z/eRPUG6NI9FRPecr1uLWoQ9SaGsoEYZxpOTUEK0Wda15YYB6a/acCAsXJBCsW8SejS0VhL70EckVkaoxEIF4s8IC+U3NkPvxABuET/OuD2Zf4C1VfHvt4MU5N4pH12LlJb69BbLBxcmlLj0Iq
x-ms-office365-filtering-correlation-id: 53cc8c12-6865-4ab6-6ee3-08d638c47bc7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR08MB3134; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB3134:|VI1PR08MB3134:
x-microsoft-antispam-prvs: <VI1PR08MB3134B1E83FB6443BA2E9BFAD98F50@VI1PR08MB3134.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(3231355)(944501410)(52105095)(10201501046)(93006095)(93001095)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123560045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR08MB3134; BCL:0; PCL:0; RULEID:; SRVR:VI1PR08MB3134; 
x-forefront-prvs: 0834BAF534
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(39860400002)(136003)(376002)(366004)(346002)(40434004)(199004)(189003)(102836004)(6916009)(2501003)(2351001)(105586002)(106356001)(26005)(36756003)(386003)(6506007)(99286004)(305945005)(6116002)(3846002)(7736002)(66066001)(966005)(68736007)(72206003)(2900100001)(14454004)(1076002)(5640700003)(6436002)(6486002)(53936002)(5250100002)(5660300001)(6306002)(6512007)(2906002)(486006)(97736004)(52116002)(316002)(71200400001)(81166006)(71190400001)(8936002)(476003)(44832011)(478600001)(186003)(14444005)(256004)(25786009)(5024004)(1857600001)(2616005)(81156014)(86362001)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3134;
	H:VI1PR08MB3631.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: RAHvoMLt3B8k+AWs/CFx1WJDHWItR6MBWbfMsBGe36pgiD/SCKKPItURCFGlhr/lsr68X2/Blp1+oPtqlkeEvu8CvGiN6QDF0Pn6m38MVs8J9IwCtjGHkikqZK8i+H4tpmrg1Bd1mJazzWpjs920c1AfnscYFLCfSMQYWSnAmMccZ5zq1Nm1S0jU1LUb/bgWTm4YmrPYb0SYypSwP/LMD8RYMlOZLMkc2b8qcp9MjIc2VIwDPle2M2nj89XO8mg0Oz2CQ+8TfBLCgDxYxk9Bz65ooGeMJ6FXjzvv6xaftczCOX75Y8pkz3ZyA2wuWW37T/0jCp2xy/EQwoWKYT/wkmr2J/SKwVLDcRRiseQaAdQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 53cc8c12-6865-4ab6-6ee3-08d638c47bc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2018 08:49:46.6420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3134
X-Microsoft-Exchange-Diagnostics: 1; VI1PR08MB3134;
	23:rDYk+D9wV3YIjzcowAY8pk6JrwJ7GJ5ni2PydDLdcrHTieD1+7z8scOWB+RxT+WLl3SDEbehQj+pRwOlOA90eIbYu5sh0XL22vxlQV9AdGU57QpX9TIAG0bun25994NZwdO55gDWNrheUVwNZ2IQDg==
X-OriginatorOrg: arm.com
Subject: [PATCH] python3: Fix python3-pyvenv run-time dependency
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
X-List-Received-Date: Wed, 24 Oct 2018 01:18:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Pyvenv is just a small script that uses venv to create virtual
environments.
https://www.python.org/dev/peps/pep-0405/#creating-virtual-environments

This patch adds the python3-venv module as a self-contained package which
python3-pyvenv must depend on at run-time. This is also good for
future-proofing since python3-pyvenv has been deprecated and only
python3-venv is now available in Python 3.6.
https://docs.python.org/3/library/venv.html.

Without this patch python3-pyvenv is broken because it is missing the
venv module at run-time. This patch specifies the newly created
python3-venv as a run-time dependency of python3-pyvenv.

The python3-pyvenv package is removed from the python3 recipe since it is
now created from the manifest.

Signed-off-by: Hugues Kamba <hugues.kamba@arm.com>
---
 .../python/python3/python3-manifest.json      | 26 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.6.bb |  3 ---
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/m=
eta/recipes-devtools/python/python3/python3-manifest.json
index f922561368..68bea36781 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -915,6 +915,17 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
         ]
     },
+    "pyvenv": {
+        "summary": "Allows creation of virtual environments so project dep=
endencies can be isolated. Pyvenv has been deprecated in Python 3.6.",
+        "rdepends": [
+            "core",
+            "venv"
+        ],
+        "files": [
+            "${bindir}/pyvenv*"
+        ],
+        "cached": []
+    },
     "resource": {
         "summary": "Python resource control interface",
         "rdepends": [
@@ -1107,6 +1118,21 @@
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
+            "${libdir}/python${PYTHON_MAJMIN}/venv"
+        ],
+        "cached": []
+    },
     "xml": {
         "summary": "Python basic XML support",
         "rdepends": [
diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-d=
evtools/python/python3_3.5.6.bb
index 2a4547694a..4413022aa4 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -226,9 +226,6 @@ FILES_${PN}-2to3 +=3D "${bindir}/2to3-${PYTHON_MAJMIN}"
 FILES_${PN}-pydoc +=3D "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
 FILES_${PN}-idle +=3D "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"

-PACKAGES =3D+ "${PN}-pyvenv"
-FILES_${PN}-pyvenv +=3D "${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyven=
v"
-
 # package libpython3
 PACKAGES =3D+ "libpython3 libpython3-staticdev"
 FILES_libpython3 =3D "${libdir}/libpython*.so.*"
--
2.18.0

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

