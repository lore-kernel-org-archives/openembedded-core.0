Return-Path: <jlock@vmware.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820079.outbound.protection.outlook.com [40.107.82.79])
	by mail.openembedded.org (Postfix) with ESMTP id 9111A7F1DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 11:26:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=cVwRaRDYc6Idc9ztN6xO28/Myylh63VPQ3j1azJzidFU5v/tCDIPLWI8Zo5sBX6CIKkOyiRQkIgq1W3HVHprf23dl8lDBZeLE2ur3D6pStUYFc1+NlyOFWGPduk03deXqm+oPdtwDQ8KArdKLpjXjVxhCTI1I7yhu1VX2jxXxviY+G9Q3FUeofYoc7wur5EceRYwVLh7+jEj6yz8Fj8W4Z9A5mg5rYPnsIJNDuOxQWj+NCDNaLBZcQdgPZ31qOCeHWU4o+ityiO1XS5LWRDIGgY6LhLtA+2PnnYBO7sW2wE7b3ONi5rYCW7OETk1/lUUB7Hf1FztRJPH3u7YADsWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jLEcvoozeuetlX0EVH2HpMxRS8f+H38cDpH/qkvY0y8=;
	b=Gnm0ubsWPOoCzOAMPR6FO1ByZ4QRrqFvVfmiV7/ibEmg2CGVIbmyFCZemIytE1c+iYPYUA5FrErPcGFP1EDHWalsLhmIAfXsKllRnN/Lky5SlwmPajhhLjYGP0AOW4u6t3fKRevPJIkiSa9kSJBof1iQZUojGm12j67PMg9knVe2NInwT33KtCK2UjD77+ZcbIxVo4ncneaCTVs29KmuD50WwJmCKcrdYu584NyReg2hTKI52K/EoM9RheD8wPVQttlyOiHYNhjRXlaOndJ2Is6iZ/2bf+4CQWM/m27Xw6bgJTD39tJfxG6MJ5hO/F/rX90SyTEZptP9oWwdFWVhCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=vmware.com;dmarc=pass action=none
	header.from=vmware.com;dkim=pass header.d=vmware.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jLEcvoozeuetlX0EVH2HpMxRS8f+H38cDpH/qkvY0y8=;
	b=Nd568pAj39GkiRnhn+Hl0n/OY+es3HdId99tCai3Vc1KUykXDpbNQ9MmddzAaid86HtWAPYh4i7HdT4IJvTOPwrsZ37QxXYAb87oTL6RBAtriPcJfVAYy7QZwk4z8ggETPtRMTn2x2WBH/tWeHhMRCJK3Gp06qID6gF8Zy43U3w=
Received: from CO2PR05MB2645.namprd05.prod.outlook.com (10.166.91.154) by
	CO2PR05MB2453.namprd05.prod.outlook.com (10.166.214.148) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.9; Fri, 26 Jul 2019 11:26:50 +0000
Received: from CO2PR05MB2645.namprd05.prod.outlook.com
	([fe80::4d14:654a:9769:3f59]) by
	CO2PR05MB2645.namprd05.prod.outlook.com
	([fe80::4d14:654a:9769:3f59%5]) with mapi id 15.20.2115.005;
	Fri, 26 Jul 2019 11:26:50 +0000
From: Joshua Lock <jlock@vmware.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [RFC PATCH 3/3] classes/sstate: regenerate sstate when signing
	enabled
Thread-Index: AQHVQ6UE5rhOJ/uaUky4hHEl4x+jFA==
Date: Fri, 26 Jul 2019 11:26:50 +0000
Message-ID: <5c2484a9c2c5dd78f7c4488839a4e2d2929e2c7d.1564139487.git.jlock@vmware.com>
References: <cover.1564139487.git.jlock@vmware.com>
In-Reply-To: <cover.1564139487.git.jlock@vmware.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR04CA0015.eurprd04.prod.outlook.com
	(2603:10a6:10:12::28) To CO2PR05MB2645.namprd05.prod.outlook.com
	(2603:10b6:102:8::26)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jlock@vmware.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [212.140.202.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49187e5a-e291-442d-c8de-08d711bc273c
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CO2PR05MB2453; 
x-ms-traffictypediagnostic: CO2PR05MB2453:
x-microsoft-antispam-prvs: <CO2PR05MB2453AD06ACD70FAB66C96C40CEC00@CO2PR05MB2453.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(189003)(199004)(118296001)(6116002)(6436002)(3846002)(5640700003)(2501003)(86362001)(2351001)(5660300002)(66446008)(64756008)(66556008)(66476007)(66946007)(6506007)(386003)(102836004)(14454004)(11346002)(76176011)(2906002)(52116002)(6486002)(478600001)(486006)(305945005)(2616005)(256004)(14444005)(476003)(7736002)(6512007)(71200400001)(99286004)(71190400001)(81166006)(81156014)(8676002)(6916009)(316002)(8936002)(50226002)(25786009)(36756003)(186003)(66066001)(446003)(53936002)(26005)(68736007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO2PR05MB2453;
	H:CO2PR05MB2645.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: d8NpOwM9EG+Wi6bu3B5d4DrJDafCQ5W4foqK35BQmYyb/5n0dxjww0U/s8GR95LSSvLNVE7gwwktXY9gWlk4g+VvXZpezWh/BnhsFmQwYcOt3dwYCsD5ezZB+oqblJcic/CU+SpXuX8dHifG0iBj6uY2tiuSFaZtyGPfDc/wP71xRqPuItWMSgeGOAW1N+K2bpfAbVksaTeqwrrrFZT975bcNhV48ZWYnOF8P5uCATTQg1DY0lznpdS4swQ2tjc6IQAj1PJEQsgsg0nA+wSnoO1J22R3rjtwy9QckZp1iNpievOboIXh8MlWJCBRBnHBvvk5RsYw34c01ZAQVhLsaKWAIlmaETCEakumMhbcydXeI5caQwJLQ40+RtZmG+8AgXY7XyQNUGXIZ6n8OXLQmi01mzUG6FSmdE5bLfczRd4=
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49187e5a-e291-442d-c8de-08d711bc273c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 11:26:50.7792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jlock@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR05MB2453
Subject: [RFC PATCH 3/3] classes/sstate: regenerate sstate when signing enabled
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
X-List-Received-Date: Fri, 26 Jul 2019 11:26:50 -0000
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
 meta/classes/sstate.bbclass | 10 ++++++++--
 meta/lib/oe/gpg_sign.py     | 10 ++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3342c5ef50..b060e15053 100644
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
@@ -774,7 +778,7 @@ sstate_create_package () {
 }
=20
 python sstate_sign_package () {
-    from oe.gpg_sign import get_signer
+    from oe.gpg_sign import get_signer, SignFailedError
=20
     if d.getVar('SSTATE_SIG_KEY'):
         signer =3D get_signer(d, 'local')
@@ -783,6 +787,8 @@ python sstate_sign_package () {
             os.unlink(sstate_pkg + '.sig')
         signer.detach_sign(sstate_pkg, d.getVar('SSTATE_SIG_KEY', False), =
None,
                            d.getVar('SSTATE_SIG_PASSPHRASE'), armor=3DFals=
e)
+    else:
+        raise SignFailedError("Can't sign sstate packages without key, SST=
ATE_SIG_KEY empty")
 }
=20
 python sstate_report_unihash() {
diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 2fd8c3b1ac..ec5ace0dd0 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -123,6 +123,16 @@ class LocalSigner(object):
         return ret
=20
=20
+class SignFailedError(bb.build.FuncFailed):
+    def __init__(self, description, name=3DNone, logfile=3DNone):
+        self.description =3D description
+        self.name =3D name
+        self.logfile =3D logfile
+
+    def __str__(self):
+        return 'Signing failed: %s' % self.description
+
+
 def get_signer(d, backend):
     """Get signer object for the specified backend"""
     # Use local signing by default
--=20
2.21.0


