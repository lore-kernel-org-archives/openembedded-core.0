Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web08.9280.1611048234720859363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 01:23:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SH1fkWP0;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2xnF8vc7Cs2afYJaq9IRH3JFleKzMO8Gxs2gcOX3bK33ThZk2TTrfL6YO+G4lVD5UZUKPPezdkdtqeFvRdYDtyvnNZZg6DQo+zGDMgvolhh3YzLeR2HsHjkdGIq5L/5i3b/zXXCcFP/HTSMKCFQ/vwlgtB0DB6EEpJD7Tq4MJd0OGzz7x/LLpWFLiIiemgGve3o13LwDgk1bslBmLRhS4VsbhT2HH9bBl62lh7dszj3OrEuSYjsnPV/41n8BMouDgWtYzbIxXSZ61RPeTBIFxOl6xIi93wQUDJ58nmQQyZDhdwTX+OWHCat+jRiOJADVwFQJ3bEI9Y2JrXaKeu1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pH+UWpC3BPIoZKP6O9CAZoy3IeWhLfOnKi0PwYPikYM=;
 b=fKiMspv79zErogdNcw1v8KMsCKuz/nIMOGxMcoPmaJEkmwwo28A5LZ2gv3LQt6ybFuAJZ1Y6FUZRuIsaxc01riQ2NBYaHRy8Gqrqri1ZmHaJERi/4KLX5TiFkuO/lIN3tXh8XI/8m3tleoUCivTozhMi4GbROy66UjP3kaLrXQr3eJlX8Cj08DTFIychETfDSKbEE1SuNASjwB4kHQQWeEGmja7cgkqMQJKBIpUyradAie06LTduOid84WYZSid0UELHWvPFgo94W8pS7WE0aQt8nOG4mpAC8AUyF+3UtaD1Y6mBh/FX3TjOAaWGH16MDGHTd0ial6BrQutZFbZc+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pH+UWpC3BPIoZKP6O9CAZoy3IeWhLfOnKi0PwYPikYM=;
 b=SH1fkWP0T1aaZLP+mmI1B10cs7ipjtGEQkxiUncdLdKA1hXlLyq2F04h6+hqVfY6ExUWPZ3s3swFXY03UVcF4MDBK5eEh/5utPslXdflT14DnMBTw57uDp4jF3JR3xXdKS6qt0Vbx6ttHJkwb2rNlJc4kFIs2RI/QLDdwrKGM+o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SA0PR11MB4541.namprd11.prod.outlook.com (2603:10b6:806:94::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Tue, 19 Jan
 2021 09:23:53 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1%6]) with mapi id 15.20.3784.011; Tue, 19 Jan 2021
 09:23:53 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] Revert "ccache.bbclass: use ccache from host distribution"
Date: Tue, 19 Jan 2021 01:23:43 -0800
Message-Id: <f2520cc39b90722eda993f4ef424e9b736fbd3f7.1611048144.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611048144.git.liezhi.yang@windriver.com>
References: <cover.1611048144.git.liezhi.yang@windriver.com>
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: SJ0PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::7) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by SJ0PR03CA0122.namprd03.prod.outlook.com (2603:10b6:a03:33c::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Tue, 19 Jan 2021 09:23:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd99112a-a615-43d2-784b-08d8bc5bf015
X-MS-TrafficTypeDiagnostic: SA0PR11MB4541:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB454157287CB71529B764555BFFA30@SA0PR11MB4541.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:165;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yvXAq4lDDAgcyRfcGSUTv4oMJWwYZPf81x2Mp2KWIFXCWeQWGRWRk1BS+64YfPtgYRSOJw8znMt2NMPtwjBdmEc74JufnsnZABRERPc06532ym813enBjXLA+jjBFiwI85Mg8lTFa9pelMjwIRicwyePeAusWhA1K3eXPONJdMPrXY4XCSMBfRTDIt05nLC/i3Ttvs6IiLNOrYjVU0MFjQDo+T/iVltCfziMJFmBQ+cFi+K4d0iUGv7gaRTC8FhleEjvDVbNE6qaoQQOI/tacjs3BI78AabCgmabBLziqkD2a7CqaFPzEyY/1Y0O8vI23TqjtkXtRGoZka9twvML1YpsvvRGm8PhVqo5n1AG72WBXNFvCbpSdN0+AMrYhAkKKWxiKPYd2Rp+QBZr+7iDAQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(136003)(396003)(39850400004)(6916009)(6666004)(86362001)(66946007)(66476007)(2616005)(956004)(6486002)(6506007)(66556008)(83380400001)(26005)(52116002)(186003)(5660300002)(478600001)(316002)(16526019)(8676002)(2906002)(36756003)(8936002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?pAPlko4O5a/Ml/T5h2pNSXVT/P/J9UlQ1Z4J0zUD12BtvWUAn5DGYG5KQAX2?=
 =?us-ascii?Q?jTMP90pMEF1Z2prN6GELaAN+fap6rOtD4iU/gnueKZmYu4bX4ZJHp0Dgz8wP?=
 =?us-ascii?Q?VxHXKUZxIyAnHtAtSP6dmgKvIsSFVbX4y/cgIImTo6zhQxJGtC1nzaFxX/oS?=
 =?us-ascii?Q?0xmFhGlFhk4hPJ4fdhHE0VdcOazVp7+09bQ/jQigAMNZKowkUPT5sBitE0vQ?=
 =?us-ascii?Q?Su5XoUjJKj/iPfKhhWqPC2HL0nyujQ4wzd+CH3TTIosU2rTcmG6/QkEoU+5S?=
 =?us-ascii?Q?OMkL7a0a23Wzi7kNViASXn7ExnaxAN1RTiaUIS7PhuqTsZCdHQjwqcJaOLKv?=
 =?us-ascii?Q?wuAQ8wO68wC59DcAHDA2ToI/4q69XPgsfb3+PzoCipEPiIbeJIgh9Ec+IxiI?=
 =?us-ascii?Q?v1b3LWqkUpvdI+f1xO9X3gziEmsMAK+HOr/HNXXpk8GSZIHGzEb0P0IoeQl0?=
 =?us-ascii?Q?3Gvk27IodPDJCzRsojOw2tIKbGlftbbpKegKs48hdUZSp0jeqP9h6/v/NFM7?=
 =?us-ascii?Q?Ph1k1P1TIvP/4g6wfZbV3YePZ3Mef4yj6OBulUB8pmDIhn2oSngcMUBDpHuv?=
 =?us-ascii?Q?i/hJuRo5XzJ1olRbNo6Szmk3l5F3FV8ZoWxvnoWbkIwjxBokC4JDSHij2Ht7?=
 =?us-ascii?Q?EWnwThcT1zlUtbtiRhJZ1pKu/Yf82ngNgzvZuSixBd5LfvbvX+lbJjAbHP9j?=
 =?us-ascii?Q?t/t2sDR2OKgfrkoswAskrBQHNw5qfXZfKNjXmTiCDzaeC3vbL6V/No6DawyO?=
 =?us-ascii?Q?by2mHpM5q80qjpGZl+oyRTV6EULf3HFOzNSga4nXECWuX4kTuqGyy7egcSYS?=
 =?us-ascii?Q?nU3x5bGw9OT+O1k8VvOnxvtm/ilOaw+MIasUpjWjbdacwO/k53MVyKugLcnA?=
 =?us-ascii?Q?6G/Vh4fULQw+l7z+ul8SZezEPHCFgCi6UJrbsBFDoFxyYKJupBn090Bgpild?=
 =?us-ascii?Q?8CG/IS1RaEyChxX/8VN3ETBvSHAD0eXmLpalDCAVJQcLTfGzi4D6yCy0e8DF?=
 =?us-ascii?Q?FrVM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd99112a-a615-43d2-784b-08d8bc5bf015
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 09:23:52.9879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUdTgqKWV4zrgVHbQKWejSGZD7/aLTdrmraXrDpUQMQAiOPuZM7VD5nY+r2wNZ9kgwomyzw7vSqxIQmKAeQudqHnuxVUetKR9lexwOCMUR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4541
Content-Type: text/plain

This reverts commit f5b29367af4d8e5daea5771264774aa49519f9a8.

Will use ccache-native which is more reliable.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/ccache.bbclass                  | 3 +--
 meta/conf/bitbake.conf                       | 2 +-
 meta/lib/oeqa/selftest/cases/buildoptions.py | 8 ++++----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/classes/ccache.bbclass b/meta/classes/ccache.bbclass
index f00fafc292a..fc4745609ce 100644
--- a/meta/classes/ccache.bbclass
+++ b/meta/classes/ccache.bbclass
@@ -1,7 +1,5 @@
 #
 # Usage:
-# - Install ccache package on the host distribution and set up a build directory
-#
 # - Enable ccache
 #   Add the following line to a conffile such as conf/local.conf:
 #   INHERIT += "ccache"
@@ -53,6 +51,7 @@ python() {
     # quilt-native doesn't need ccache since no c files
     if not (pn in ('ccache-native', 'quilt-native') or
             bb.utils.to_boolean(d.getVar('CCACHE_DISABLE'))):
+        d.appendVar('DEPENDS', ' ccache-native')
         d.setVar('CCACHE', 'ccache ')
 }
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index be94b78eb15..74976ac05c2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -498,7 +498,7 @@ HOSTTOOLS += " \
 HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True, False, d) or any(x in (d.getVar("BBINCLUDED") or "") for x in ["testimage.bbclass", "testsdk.bbclass"])) else ''}"
 
 # Link to these if present
-HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc pigz sftp socat ssh sudo"
+HOSTTOOLS_NONFATAL += "aws gcc-ar gpg ld.bfd ld.gold nc pigz sftp socat ssh sudo"
 
 # Temporary add few more detected in bitbake world
 HOSTTOOLS_NONFATAL += "join nl size yes zcat"
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index d0f64773002..e91f0bd18f6 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -33,10 +33,10 @@ class ImageOptionsTests(OESelftestTestCase):
         self.assertTrue(incremental_removed, msg = "Match failed in:\n%s" % log_data_removed)
 
     def test_ccache_tool(self):
-        bb_vars = get_bb_vars(['HOSTTOOLS_DIR'], 'm4-native')
-        p = bb_vars['HOSTTOOLS_DIR'] + "/" + "ccache"
-        if not os.path.isfile(p):
-            self.skipTest("No ccache binary found in %s" % bb_vars['HOSTTOOLS_DIR'])
+        bitbake("ccache-native")
+        bb_vars = get_bb_vars(['SYSROOT_DESTDIR', 'bindir'], 'ccache-native')
+        p = bb_vars['SYSROOT_DESTDIR'] + bb_vars['bindir'] + "/" + "ccache"
+        self.assertTrue(os.path.isfile(p), msg = "No ccache found (%s)" % p)
         self.write_config('INHERIT += "ccache"')
         self.add_command_to_tearDown('bitbake -c clean m4-native')
         bitbake("m4-native -c clean")
-- 
2.17.1

