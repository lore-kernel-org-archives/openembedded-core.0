Return-Path: <jlock@vmware.com>
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720081.outbound.protection.outlook.com [40.107.72.81])
	by mail.openembedded.org (Postfix) with ESMTP id 0CACA7F331
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 13:16:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=dMIhFfGrYQ8/EwlwJiCzwTaotxNBQ3oF7oZ5Vsm3gw64RKOGPAvvZO6ZkVn5bychAOqJOglSb87Dt0pasWhcuvIkYxyQdEHcLZjScqP3w4IUw5XU5LObs4E3f4hyFXBEjKIxZ2gbz/Jw3yug2FcK++dwNVNDFJBD+F2e9dL44ErQYIcYJIEiXw9rI7Qbyfg0JjFPJczvasJquOMoaPqXhKZl3kJ0r6DkkOK4mx/ZhrcJCrQkSltjbuk1f0IRImhvpgAVMWom8LYHtS3cbfOcnuyLlI+zoTT4JKL54cHSrc4WWovXl/msTxU24k9Czb1Mk9ko3mcSFKnZQ3b3pKI5bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gJPJh5LYi06QxkNAli4StaB8dFqWnlhti6g7yys/rSc=;
	b=ZAMOYb0O1sZeFZ+48NuUj669zzw/W3mFFlIRDWqJHPctUZqZ8wK8l54gad8USH0VhXRhWwdrTz8y3PoFn+op/b1AaX2gDk9PggPng1Pis7m/TN+gKrdKBW7x/7cU/DiV+i8mYmZ6kjGAE4LZR7JgY+4EVsa//hJWPw+VpEKQkbTBt2pcudjsxevE4mOdRo1bCG2fjUoKHNhOz9c4fXkljr0mhhj024bvT1nnqcllFgIL3CW2/v5lRqK2XooilsUeiyXEH2VKXme40b7MG3pFZJ3dYBJuHDrn8EXwLTBSuH+wemYqG3GiTd9HacaenSnpkh4nuoGTug5UcbyWLLpAUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=vmware.com;dmarc=pass action=none
	header.from=vmware.com;dkim=pass header.d=vmware.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gJPJh5LYi06QxkNAli4StaB8dFqWnlhti6g7yys/rSc=;
	b=XYR9SkrWPfsyti6dY/FA2NxgoV9NYs0NYBu8N6v9MPY9nRVOPT0vhK2uwUdYs92NepDbRtQzOSU2klLmANBFs7SDuDOLBjDBoDwsVHEuGRpGSLn6z5iFETbmKY5mXAcuMtdgzs+Nk83aKGKgNPWq42t9JM06LysTWXTW3yFDDzQ=
Received: from CO2PR05MB2645.namprd05.prod.outlook.com (10.166.91.154) by
	CO2PR05MB2662.namprd05.prod.outlook.com (10.166.95.14) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.12; Tue, 30 Jul 2019 13:16:08 +0000
Received: from CO2PR05MB2645.namprd05.prod.outlook.com
	([fe80::4d14:654a:9769:3f59]) by
	CO2PR05MB2645.namprd05.prod.outlook.com
	([fe80::4d14:654a:9769:3f59%5]) with mapi id 15.20.2136.010;
	Tue, 30 Jul 2019 13:16:08 +0000
From: Joshua Lock <jlock@vmware.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2 3/3] classes/sstate: regenerate sstate when signing
	enabled
Thread-Index: AQHVRtjz/ol+TwuJ1Ummvy7lYAz4KQ==
Date: Tue, 30 Jul 2019 13:16:08 +0000
Message-ID: <59778e62f8f110a61638af2ba35da732553448a5.1564487218.git.jlock@vmware.com>
References: <cover.1564487218.git.jlock@vmware.com>
In-Reply-To: <cover.1564487218.git.jlock@vmware.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0020.eurprd07.prod.outlook.com
	(2603:10a6:6:2d::30) To CO2PR05MB2645.namprd05.prod.outlook.com
	(2603:10b6:102:8::26)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jlock@vmware.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [212.140.202.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ddbf110-26ac-47dd-a16e-08d714f01566
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CO2PR05MB2662; 
x-ms-traffictypediagnostic: CO2PR05MB2662:
x-microsoft-antispam-prvs: <CO2PR05MB266279A5EE47A301E7308384CEDC0@CO2PR05MB2662.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(189003)(199004)(478600001)(6512007)(256004)(14444005)(81156014)(2351001)(316002)(5640700003)(476003)(486006)(7736002)(446003)(11346002)(6486002)(50226002)(6436002)(305945005)(66476007)(2616005)(53936002)(2501003)(14454004)(6916009)(66556008)(64756008)(66446008)(2906002)(66946007)(68736007)(8936002)(6116002)(3846002)(118296001)(25786009)(26005)(86362001)(102836004)(6506007)(386003)(36756003)(66066001)(52116002)(99286004)(81166006)(71200400001)(5660300002)(71190400001)(186003)(76176011)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO2PR05MB2662;
	H:CO2PR05MB2645.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: G3rdJwdJ1NNdCKqIoS3TFZT0INnf3Qx8E1/tR4EQb2TMs7y4PcbYIEbmNJTjz1+1iS9jv9aXVEXIO8eI7MJS3gMHQRBFkAo1S0Hk+jFNfgjiaRwJnm7frnmBbhBXuwbtub1uAfX5XOF4YlQB2s/YeK7+eZdrX/IJMMR9nGSq+F75RYBVe6G8oDtl+5CyHMARwrjQAb4vGUrzkfcMXGc69WAzfFgrSXZEgYlRpkjaLSf/8G2r+w26LV6Hvn1SMfXZ1Xhiwks38AUZUH/hivBzDVoAAi1+wHPmnfZ4zrS9/A2LZEVzVtlpyLibCwR3NO7aNzkUS4Lyz8DW+RlyPVjiewOdgSuLo+7aeUbynGkYwZlWa/dtBiWgie4LB79bDa29D6XnsSlCGq5PNYBRdGlaO1atfsN6BmtiiX6sG1lPu7Y=
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ddbf110-26ac-47dd-a16e-08d714f01566
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 13:16:08.2627 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jlock@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR05MB2662
Subject: [PATCH v2 3/3] classes/sstate: regenerate sstate when signing enabled
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
X-List-Received-Date: Tue, 30 Jul 2019 13:16:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This change ensures that the task signatures changes, and therefore
sstate tasks are rerun, when signing is enabled. This has the
positive outcome that if signing is enabled new signed shared state
objects will be produced, rather than just signing shared state
objects for tasks where no work has been performed yet.

The downside of this change is that enabling/disabling sstate object
signing alters the taskhash and results in rebuilding the world.

Signed-off-by: Joshua Lock <jlock@vmware.com>
---
 meta/classes/sstate.bbclass | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3342c5ef50..ee029196da 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -659,8 +659,12 @@ def sstate_package(ss, d):
     if d.getVar('SSTATE_SKIP_CREATION') =3D=3D '1':
         return
=20
+    sstate_create_package =3D ['sstate_report_unihash', 'sstate_create_pac=
kage']
+    if d.getVar('SSTATE_SIG_KEY'):
+        sstate_create_package.append('sstate_sign_package')
+
     for f in (d.getVar('SSTATECREATEFUNCS') or '').split() + \
-             ['sstate_report_unihash', 'sstate_create_package', 'sstate_si=
gn_package'] + \
+             sstate_create_package + \
              (d.getVar('SSTATEPOSTCREATEFUNCS') or '').split():
         # All hooks should run in SSTATE_BUILDDIR.
         bb.build.exec_func(f, d, (sstatebuild,))
@@ -776,13 +780,13 @@ sstate_create_package () {
 python sstate_sign_package () {
     from oe.gpg_sign import get_signer
=20
-    if d.getVar('SSTATE_SIG_KEY'):
-        signer =3D get_signer(d, 'local')
-        sstate_pkg =3D d.getVar('SSTATE_PKG')
-        if os.path.exists(sstate_pkg + '.sig'):
-            os.unlink(sstate_pkg + '.sig')
-        signer.detach_sign(sstate_pkg, d.getVar('SSTATE_SIG_KEY', False), =
None,
-                           d.getVar('SSTATE_SIG_PASSPHRASE'), armor=3DFals=
e)
+
+    signer =3D get_signer(d, 'local')
+    sstate_pkg =3D d.getVar('SSTATE_PKG')
+    if os.path.exists(sstate_pkg + '.sig'):
+        os.unlink(sstate_pkg + '.sig')
+    signer.detach_sign(sstate_pkg, d.getVar('SSTATE_SIG_KEY', False), None=
,
+                       d.getVar('SSTATE_SIG_PASSPHRASE'), armor=3DFalse)
 }
=20
 python sstate_report_unihash() {
--=20
2.21.0


