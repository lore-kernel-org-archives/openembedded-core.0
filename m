Received: from EUR06-VI1-obe.outbound.protection.outlook.com (EUR06-VI1-obe.outbound.protection.outlook.com [40.92.17.17])
 by mx.groups.io with SMTP id smtpd.web11.43432.1600698622054718387
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 07:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=SEMkhrhB;
 spf=pass (domain: outlook.com, ip: 40.92.17.17, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWt1ckxpysfs2VIONXzApNHUKVhyF2cgVHA2nA1A28fB+j0myjQdLWPAhmHtzb6b1t7xYzx8oIaAi0j5l/wwezHCadnUR4H9lfn5tB80dNdbFW9n9B7TbDSxFm4+FX1TdVmVd/86G1w7av6sf6mNEliYGxDRbdH6mDWbds6UalrqMCJGKRtFZneh0gmzZ+NfV0++8/m/lA1g5n31Za1mPPZZqzUarb8+XXTBFB/taXydAsF+7KMW5D3dwbO0sNwWJJ4QxObF5NhYeT1hXINdhGqEfLN81bRPoo8FwQgJYtT6yg9kxTxwKvZLO9s+jE23TR03o6D+u9S7OvY0ja28GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhsNpNYMdx0gEqu4NaD5lDNOypI4rf/W5w/SeA/qqAU=;
 b=kCRv9vHpSbs3VMFruhLj7JIAa1ViQWZBO7u5We5lElXxrHKwn5WSGvDq6Bso4AHHjriZ19iszYoqoJJx3P0guVlEz9QzoVm+P67LtudmaKycZ0KbJFmcNtqeBC74POgS1Iy6C5tpDdTHev85nHhHK/4gTkdbeyM3nrlSU0W7DPuX3q1uXEin6o5u+bKhD8MMwidMFbAnmcJ5DBNuXuzRCNKCJ4yevl3BRlSGf4cgxqvdNpaZgUEuRH+9PgejJ/eRsr9Y4bfPHV6EArXtNVbLuo05Rj9+RCApRoNbZ5dBSw4B2vtUJ32huQvtjTFtHZ0b5le0cxBC81dEFKn3HstPNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhsNpNYMdx0gEqu4NaD5lDNOypI4rf/W5w/SeA/qqAU=;
 b=SEMkhrhBKBEq55f+h8PJGikH08xkn5CZPt9YNWfVBO/wjaa6UrnijIPPjR6sU+wJTIHSfAU+O1aMXfqrFJbApTuKhaicDMM3OAjpz9FHkVItStmQz4nkF9YFSxm97K0q7r5J+H4XYmPI9XyYpTu+LXyWl967SMvkuxESdrBCCuMNIWBiklsJGLEFMPPPqYg3Mz7WYlQgFTkNJAcVVU04gt4qEgArJA5ypAguGG8elDYi3ys2sW8dSpqOQZAKIvkrKIfzS+fd2MSEm1fTnCRc/YOTJMAPfohyOnLi4UHrCMC44GPk+5xlE8WOXTfjAXE51PEnfCdOlDApJDlGVlIegg==
Received: from AM7EUR06FT011.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::4d) by
 AM7EUR06HT235.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::290)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Mon, 21 Sep
 2020 14:30:19 +0000
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2a01:111:e400:fc36::4b) by AM7EUR06FT011.mail.protection.outlook.com
 (2a01:111:e400:fc36::340) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15 via Frontend
 Transport; Mon, 21 Sep 2020 14:30:19 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:073D4EB993897871510275306EA570FEFE159ED2B688062A0EE2F76BE725CBA6;UpperCasedChecksum:3434C7227A8B53F5AF38B847549882335DA94DF4DB1F19437CB22E9080BBD51F;SizeAsReceived:7449;Count:47
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::a1a8:ed42:7e0f:10dc]) by VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::a1a8:ed42:7e0f:10dc%8]) with mapi id 15.20.3391.025; Mon, 21 Sep 2020
 14:30:19 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] testexport: rename create_tarball method
Date: Mon, 21 Sep 2020 16:29:44 +0200
Message-ID: <VI1PR01MB6462F8CF4B2EABB0B4522AEDA83A0@VI1PR01MB6462.eurprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: AM4PR0902CA0022.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::32) To VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:154::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200921142944.511506-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.15) by AM4PR0902CA0022.eurprd09.prod.outlook.com (2603:10a6:200:9b::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Mon, 21 Sep 2020 14:30:18 +0000
X-Mailer: git-send-email 2.25.1
X-Microsoft-Original-Message-ID: <20200921142944.511506-1-kweihmann@outlook.com>
X-TMN: [3MFzBoYTVoFEVCC5IgGtHolK2niH2zjW]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 60b23959-80f3-4e92-a549-08d85e3add95
X-MS-Exchange-SLBlob-MailProps: 
	NS9Gj58uCj28fPWha8uCcW/gn5gOWLvmcnyVj5+t44mlj291d9mEsVCE74PVCFQykgFZ4DHAKwN0NbErs87q4PWcn0IbBebVCUh1pO914vCQnBFEJ55NYJvkCTHhoNYxcoFYC7d546vJiw8KULbeFp4r7L5Tf6jgp3BR5RLx0jalovKSjDNL4xTyU/zKah56qWm1kY3oIOSkMI2gRCPwQhONaFg2C/vqQFGrwf2Ww3L6nLN4d+a3kuz0Cv7uCLdPVZc9XBYUqai6F+ou2OcHXXpkZK9URiWLSCaxYVjSrD0UZ/cY2hOUavaW+AWjn4pr8XC7hVgdnyIEqsoAZf8WLmCVmG0XWoiHDiz3iE0AZodk9+fXTeXmBAooHu3YCjx/Zc0UfPhHA3GI0Z2JExfDJ2vjA/evKsF4QXpB3Hexl4XydATYGp6WmopbKQ7ab/yGjzKAneTas70dVoVO3PvtXtafk2nyFGTwy0AkEQjT1v57RSHAlxsjUuqHyhz+FJ75tcmUxltfUR3VVE+w/O4lsgrcGixFjhDzj6MQlMuZMVt2WMuOtLcaLbQw9tzEocbyuq3D3bb0DfkJqrIh0B4Rsj5dWQFfintjXm1shTOi3QK9TLtT7BwIGfpFvXmJqgv9NVvID28RNapyM2DM2bu9EPbFp6Vg6INrBUSMxVp/stvjGxxivorTcFghTbyKVcXlRZ++dUXq1Q2OQ2eH38qIeg==
X-MS-TrafficTypeDiagnostic: AM7EUR06HT235:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wHwt8/rEXNhf4KK5GAIVQqwfLxsH8O5+P8CMgr5nK5lu+jES0uLUpeyLFzfP6ks7Jvn2F0P9YgGNlqKjeObva1jCODyL7o7PQW6yjxFQJYIQ9Vkqz/y2aN3Ro/TAGlGH4GYRcYP7m3ShUKvThtlijZzzmNrW+78anA+u65C0ya+RyncS8/Yt6kVcRmBoKRymqhC1K0yC6spA1Ce7xAJMlg==
X-MS-Exchange-AntiSpam-MessageData: 
	QQsuLK/Bek3FEK00ER9Yms1KuiEJdQFsIt9cKfRackkLRBgZuaSxsecIVtyx23wWGULreMBl2LuLGu/ftILmC0ZcyWTrXpzy2dSsbGxGjsDyS/XGMo/g1QAzqrlAXA9JsApFc0dh6NCLglgAAN/FUA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b23959-80f3-4e92-a549-08d85e3add95
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 14:30:19.4737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR06FT011.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT235
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

as otherwise when using it in combination with archiver.bbclass we would
have 2 methods of the same name but with different signatures
leading to various hard to understand exceptions

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/testexport.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbcl=
ass
index 59cbaefbf9..1b0fb44a4a 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -137,7 +137,7 @@ def copy_needed_files(d, tc):
                 shutil.rmtree(os.path.join(subdir, dir))
=20
     # Create tar file for common parts of testexport
-    create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPORT_DIR"))
+    testexport_create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPOR=
T_DIR"))
=20
     # Copy packages needed for runtime testing
     package_extraction(d, tc.suites)
@@ -146,7 +146,7 @@ def copy_needed_files(d, tc):
         export_pkg_dir =3D os.path.join(d.getVar("TEST_EXPORT_DIR"), "pack=
ages")
         oe.path.copytree(test_pkg_dir, export_pkg_dir)
         # Create tar file for packages needed by the DUT
-        create_tarball(d, "testexport_packages_%s.tar.gz" % d.getVar("MACH=
INE"), export_pkg_dir)
+        testexport_create_tarball(d, "testexport_packages_%s.tar.gz" % d.g=
etVar("MACHINE"), export_pkg_dir)
=20
     # Copy SDK
     if d.getVar("TEST_EXPORT_SDK_ENABLED") =3D=3D "1":
@@ -159,11 +159,11 @@ def copy_needed_files(d, tc):
         shutil.copy2(tarball_path, export_sdk_dir)
=20
         # Create tar file for the sdk
-        create_tarball(d, "testexport_sdk_%s.tar.gz" % d.getVar("SDK_ARCH"=
), export_sdk_dir)
+        testexport_create_tarball(d, "testexport_sdk_%s.tar.gz" % d.getVar=
("SDK_ARCH"), export_sdk_dir)
=20
     bb.plain("Exported tests to: %s" % export_path)
=20
-def create_tarball(d, tar_name, src_dir):
+def testexport_create_tarball(d, tar_name, src_dir):
=20
     import tarfile
=20
--=20
2.25.1

