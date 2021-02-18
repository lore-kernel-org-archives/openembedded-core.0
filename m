Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.40])
 by mx.groups.io with SMTP id smtpd.web12.1718.1613684627009891181
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 13:43:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=l5wQd0AS;
 spf=pass (domain: windriver.com, ip: 40.107.243.40, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksN1xWzyq4RMQ73skK1fmlMNuGMuoFdbbyrXXUuGc5L7trjXYhVfJu3Qsmkrmsoold1GnGzlrHvxZXkErmMqvqV50J1OWE0GEd2e9WEb8Iotty7CnFF8+vrYmY/GFoAJ444c8qrxWRsyC8rNuJHPtr6HikEYF5boe1Tu4OlKdtp5mYJPKc0PEUTRhpOPiWg9gyKpaZ0Ja5a0UtbmTbZY10OzeQBNCiQZNg9C76KxHhNzMFDPIwgshPeFS0TN/noVx6qAdJcWAgVknNZ97ing8DQlu2OPb403dKNASeFfeX6tkmet9LzCjF46+ZFNquEOzu+MY/KQgy18L7ZKg8XFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMplR5tsugKt9xUvKiGbR2EXBDiwSmLMRVsNpI7VSjs=;
 b=Aesi9l0leW8+/NdoNOmi6Xye4E2OnkZ0ZH4stGxupGko6CQqPuDpiCHtLKE3eKhSttEOqoA3mHYhJ+/xfBMlSmGW/DFPiFlgzV8JlUi7Qxmso0IOMQznbAxxU9Px/I7b7U0mvAz70d0BfIkXmKrbWdo/WMhcijjONpoB0V/MlTbkL0sKHeEUtop4NEs68xfI7h3WEaWNyqVEM3yc12pG5IWOGgrJIB0L5WvyHuoZkM4ZLv6depJTRga1tclnjAfO/GGvuUJoBfHmJVgmQOvJsm05zXYHydr/P5JXHFjEp+ro6Ro44TXZFVu804HS0Fgh/5bNLhF6PR0hymQDksw1+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMplR5tsugKt9xUvKiGbR2EXBDiwSmLMRVsNpI7VSjs=;
 b=l5wQd0ASKj4h1CwK5Fax2cMfw8Zb+KIEtXPEKg++t9xdIZ4cuaWI1grq9WuJoNe2iYbAPKlHkRwUFtq3Fd0Scm3u1W3/diHvSbHdtXxI3AYb9U9AbxCpyt+I6QV87KgS0yNHLoPW/kuGvmx4himisabPrP8alu8QY/mIRBtQtrs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA0PR11MB4576.namprd11.prod.outlook.com (2603:10b6:806:97::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Thu, 18 Feb
 2021 21:43:45 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%8]) with mapi id 15.20.3846.042; Thu, 18 Feb 2021
 21:43:45 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] valgrind: Remove reference to non-existent ptests
Date: Thu, 18 Feb 2021 16:43:28 -0500
Message-ID: <20210218214328.10970-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BL1PR13CA0133.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::18) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by BL1PR13CA0133.namprd13.prod.outlook.com (2603:10b6:208:2bb::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.12 via Frontend Transport; Thu, 18 Feb 2021 21:43:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d89d41c8-3dea-422c-bfbb-08d8d4564426
X-MS-TrafficTypeDiagnostic: SA0PR11MB4576:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4576E3D822E032E37C1F6A6580859@SA0PR11MB4576.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:140;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4itnuAcr7e+/ZzrGtGF98C3N2HJkjPRGWt48OxLv3LCogLxubCA+CWiu7IDxRMryPGJWYZ1ULL9RpSnQxWbPGyMzdc9MzUiEBtcV/JhsAho/u+bqZKxNVvZrR6+5EZAHY1OLx/2ljX7Bb84A4lVGId1X0N/EKs2tLaBpUySRrxIYZSy6kc1wiKhyniot74RSRBv5KfAbAykzsFNdHmjWDT4zSS+IFJmA1DlXYaHAC+GmbJv881j/5tweb/I9v/5I7DobVurgOTRv0UL2t9XdlKWHtO5s4nRnxyE5yHYAW81wcW2mLr7VAI6XgsilxoFRDkSVge41HARffBGyiffEe8AVR2Ns7BylqWw80sOECoan107hX65dDCWcmqEyvvio1gTsJbvxL3x4+5GnZHZGYotjFezPQNIEyH42THkPH66B4Ldm9qOLeBdzGQOt9GO0zsS4AzCtZB14f+qFUaSgGKY7wglu1Tu4rhXXfrpOFWgg+aeG4Zv0OO8DhAVJKyKXVgX2Ici2x1dgznFsEzcDUQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(39850400004)(396003)(346002)(52116002)(66946007)(16526019)(6512007)(956004)(2616005)(6916009)(66476007)(66556008)(6506007)(8936002)(8676002)(186003)(5660300002)(316002)(2906002)(6486002)(83380400001)(36756003)(26005)(478600001)(86362001)(6666004)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?nKOLA0vyHSB+3+AQzv5U05fXk/FYc8HTObs9Cyq0aeqIAp6iMIkmsbu1yVEN?=
 =?us-ascii?Q?TfezSl1SifdzrkK2znR3KFQsCqkvVegMlk0pX9LLcyVtGPnmcZA1lXlfv+m/?=
 =?us-ascii?Q?0xQvqWehV4zqSuYKMn70cktYGi3BQPLOUILw0zlo4ppabCqqlGqjNPf7N4ak?=
 =?us-ascii?Q?uuLhEUdjeIWlIpxuKtDUhFpmGAw2c0Le5dcoWqqD0aLkxA9Q0SAEyZqUsC8R?=
 =?us-ascii?Q?Sf7QOEvEhXnvT5c8IQry+oDWJNO416sa6Jq9TdB3OCEbOXcylnKz3KFjH48p?=
 =?us-ascii?Q?ViYTkCI1+At9qnYXOaOrw0VwDGEPlFkl8eHBOomJm/1c4HVoLdWWqmDaLjVU?=
 =?us-ascii?Q?DxtYAQvxKT/14XRZ2o8Usd1xW7oNgvcbkJibS5zcNDvoJhNjg6lTO/gDqUJB?=
 =?us-ascii?Q?MhFRWHqWSoYMS+tkQ3kn3NT12RnKBirohPdEPU+dR+pDxZTIldpbyDf3CLPd?=
 =?us-ascii?Q?IJ2GqHC8GTRc3q22VSxBrDsmw8ieAlaDlgXNn0ulwOaeNPohPt/GcO4E6wTT?=
 =?us-ascii?Q?8GK3j4S59M6pdYliBCRqz2Q+byD4eJ2otI3pop8Jme+0IQen8QVA62UpaD49?=
 =?us-ascii?Q?VYo6+EAAujE7uHNZyiplCYsYQDssREDvBArUgQLUf+9HI/69inxoc0mHQ9RA?=
 =?us-ascii?Q?uPC24LcSq1bMtiqtlXi0EHrMS1pob8duNJpXjrKqh7+/LuQZC32L7ymtAOg0?=
 =?us-ascii?Q?/irRqK2YBTu24okWHdPNvqDS8Noh8d//75GN7OtaKx67urX2NYoMk3qE2vhz?=
 =?us-ascii?Q?S/WThyrlnbmfjv4n4Q8fa3DF00ztuTRKpy0iEzC+/BWiJXGmGCCW6V+BNBcH?=
 =?us-ascii?Q?vA8Zq2RiNh3L72kD4FAybPJhNC0hECnyxFfQwBsbYxuAZxgnW25IS4FAVs2h?=
 =?us-ascii?Q?60hLDW6RrIUMFFad/+WURUPvX9S6jyX1CDj7MYtJ17+D7VyC3ew6JdvHjN+Y?=
 =?us-ascii?Q?dRDz38EMNFiRRnjAC8ecJJWPiQl+yUN4ui+++q21Icp0mj3HifBp5H1moKq6?=
 =?us-ascii?Q?8SK//wZ/4/if6N8+FJiXJWEONsIC6RZmM6lxEFzTO8ulOgjJeRJ8ZfS3JIBC?=
 =?us-ascii?Q?LM+wbHHJG3VcZH+ErthUf9amGw00QSB+6r92tk3csu+f+XbZRgsUqjBSk4er?=
 =?us-ascii?Q?6zSAol5Oje7DLmvwS3FhJN324W+ddFhQ70yCO3VeQK+Sf2yrgg45mGN/tZ0v?=
 =?us-ascii?Q?Iy6gMayKElPzE429IF5QVRYOCRcrvfyTFgbH2Atgdl27IzaDPCqunEFz5lOY?=
 =?us-ascii?Q?6VVeWF+oW+wos74Hv1CLmKj7mv8vY3uHinUlm2VtoaYb6CaX7nShzM/6bqPE?=
 =?us-ascii?Q?ewn8KdIoDktbK43kkUhfxBVu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d89d41c8-3dea-422c-bfbb-08d8d4564426
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 21:43:45.0283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTq0Mwmeez9z4yyoDzWFkkHKnSmpqL5nV7ebuN5jUkiKm2p94iV6rxKlHWDYdDNGJkxBrNxY+vYB4QRmnKWpkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4576
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

exp-dhat:
commit 441bfc5f5 promoted exp-dhat to dhat

exp-sgcheck:
commit 40187fcd6 removed the exp-sgcheck tool.

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind/run-ptest | 2 +-
 meta/recipes-devtools/valgrind/valgrind_3.16.1.bb | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recip=
es-devtools/valgrind/valgrind/run-ptest
index 7217dfca5d..e8a1a668fc 100755
--- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -12,7 +12,7 @@ VALGRIND_BIN=3D@bindir@/valgrind
 LOG=3D"${VALGRIND_LIB}/ptest/valgrind_ptest_$(date +%Y%m%d-%H%M%S).log"
=20
 TOOLS=3D"memcheck cachegrind callgrind helgrind drd massif dhat lackey non=
e"
-EXP_TOOLS=3D"exp-bbv exp-dhat exp-sgcheck"
+EXP_TOOLS=3D"exp-bbv"
=20
 GDB_BIN=3D@bindir@/gdb
 cd ${VALGRIND_LIB}/ptest && ./gdbserver_tests/make_local_links ${GDB_BIN}
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recip=
es-devtools/valgrind/valgrind_3.16.1.bb
index fc070dec78..fb7713fe48 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
@@ -175,8 +175,6 @@ do_install_ptest() {
 	   none/tests \
 	   tests \
 	   exp-bbv/tests \
-	   exp-dhat/tests \
-	   exp-sgcheck/tests \
 	"
         # Get the vg test scripts, filters, and expected files
         for dir in $subdirs ; do
--=20
2.29.2

