Return-Path: <carol.zhu@nxp.com>
X-Greylist: delayed 857 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 11 Oct 2016 11:03:34 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0054.outbound.protection.outlook.com
	[104.47.37.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF4560116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 11:03:34 +0000 (UTC)
Received: from BY2PR03CA052.namprd03.prod.outlook.com (10.141.249.25) by
	DM2PR03MB335.namprd03.prod.outlook.com (10.141.54.20) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.557.21; Tue, 11 Oct 2016 10:48:30 +0000
Received: from BL2FFO11FD058.protection.gbl (2a01:111:f400:7c09::188) by
	BY2PR03CA052.outlook.office365.com (2a01:111:e400:2c5d::25) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.659.11 via
	Frontend Transport; Tue, 11 Oct 2016 10:48:29 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD058.mail.protection.outlook.com (10.173.161.126) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.629.5 via Frontend Transport; Tue, 11 Oct 2016 10:48:29 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u9BAmRNj015910; Tue, 11 Oct 2016 03:48:27 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2016 18:48:25 +0800
Message-ID: <1476182905-15182-1-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131206565095379249;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(92566002)(356003)(8666005)(85426001)(50986999)(87936001)(8936002)(86362001)(81166006)(47776003)(104016004)(305945005)(7846002)(105606002)(230783001)(11100500001)(5660300001)(33646002)(50466002)(626004)(48376002)(8676002)(4326007)(81156014)(110136003)(189998001)(97736004)(586003)(2906002)(15975445007)(106466001)(19580395003)(229853001)(68736007)(77096005)(5003940100001)(36756003)(6916009)(19580405001)(2351001)(50226002)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR03MB335;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD058;
	1:mhvTaF56AOabCF0CDIPMsLNfYEa80rKOk3bpUL+sd6n6zq6axdTLdMoY36vP5gUsnfa52Ih6ADYNq0RBuGduO4p2eEoCtk7DCdw1vsJHAcq22uuSj+XWqc4cN8URrGj3rw/UN7Mvv3vL4VPc+I5qNPbEhSyiHjy4DcdTLDEgWuo8OTJ1QMiGltZXmrWhy+2/2J6hm+oeG/Kdo+tcUZymaaNG/kou7/B9W986T8w8ANEl4AMIHvjc2l+v5QdZ60om05Wx2B+TVq0u9SUR7Mmc3jDPhuZR9hOmkq+hyUR4mq52HcP3Fb/kg2s46TeQ1YGH6b0ZWllw56FDA19zfU5Qs+5yOS7uh5GN4ilDyFKhEIT108tXPjAt8Bj5xfGkwuIC8fSJpQbNIKcjhJh30Zta0sGITJnAeHuAMeBZ4iXXmZrlWNbbPYwLAHxfPqRSYistyJY826UBrCJ09W9kUFQIYOm0WEv/jPldTj2Ef8OfhBysZXb5/k/u07BKmZmdfbcXQiYLecdKiqIrPzj4HU3HqhtgivUCPZtpD8TKsOFENTQUmZ01hQGS4Ao2l41/3H3HbCsDyzITV9kmbUEMxlRzeJWnLfRyn/ULKBNrMRPW+FdknfCiytwo3iHfUDDEymIAbJL6KoZOeRxrn0zbcE9iLpWhafzzOdwZlU+OH7Q8E3zWNL6CpegRoCwOnjW3M1x1RIRDH0HmNxVT8KYAA2hdwRKgZUOyBewOLQIlXJixQaw=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 2aeaca66-3c83-4210-2fd0-08d3f1c4232a
X-Microsoft-Exchange-Diagnostics: 1; DM2PR03MB335;
	2:u9I6VnINmuLrCTtQNbWzeNGAncvkdsReSZ2OV4rjMre3wxmCAba3j+pj59ZQ/zwgNnKVIi/R36mjcQqLIIZnWWXQKBjcU7i3Op2kDh27CFnNM4n2FO5SiRCfD4cx9mkA5IsFN5Gju5wDQNRL0pZYo63qeSUC5BXvsZJ8S561IxIXD2WWQdnB0A+tatJ9dRoR;
	3:4rGF6uY8b24wTbsD1/YYM8x6Y7/e2HqIyfJ81cpLdTeMb8CJ/xorsQwo/VjFmYmOtur8fsdp21wrowcGtyUVB3vGcVfkhlJ/EWhNv6iDUV88H4FCEAHOko6wymHWKscFGfRpJ9lJk0F2nk0QiyDH0dBpLY1dZ/E/2rBQllmozZ3/GYgmWXXsqwQmzvS0oucCafUMsVx7966XHOzDOtFzyBfbrRq7CH+1r7N/Db4Q5Qs=;
	25:wQTUrLVWsVA0ifqAn2i80ZTGYAefuV0DdpuhxlPus1NnVuM9e9JWUsPWGV5x4fq973EsuCqjlS+V/zTrX+mTv3fQF8OkC5F0wm8FJ9AB3Rhzq3LFi13KsORtJpg8S/YhUAHOvJBH+QAToT9JwvMNlqo9oSeKJINbJp6K2nM7z3dCUm1jF4tClvVxXyaO2eA7bQVtKYwj677sq8Z1NwDtqi1zmIt2GLVMBUz6dzOLxHiKZ7F03CR3hp2dAKzZReKnPZUcguxP4TnsczRCNU7a6843S1kwMOLk7GuRXlHLtJy8QmQKTooztQnnHlp5UtPaXVlazZwx7kgH9lkbm/zvw0bZemZxMkO35E1pv6fKjl2cwzCT9mPgVyiWLPVv8zNTduYPLDCcKqW7vTZ5OxsSiymrHuUkQspELzZ1NDFzm8U=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR03MB335;
X-Microsoft-Exchange-Diagnostics: 1; DM2PR03MB335;
	31:ADmLbQkRqi9MPbPdOcGcesJHeXV5rzpRMX4iydwu5lX14PSn6HgWwHB3fDAho5wtO9qsy8bC1Rur+m6ly0m7ZJF5qFbef+kSOsBxxe54LE3OmLLcUupFxuk0v4uP1UwqB8+t7uVEG9INnwt6C/px5ZUhp8f1bdFHoBtXEqDBVMLdZ8U1pfImX3NcxwI9uMNz+SNLy9vkNhxcdmHfOLDBiYEtP+OefPzvQ6eDw6G53iubuRFBatVh2x74n/0SbCaE;
	4:GoSkxjyNsVRFv5IGrxMsdfWYsPA7jGhDCBpQx3FzLUlfLfDTXOrDcImtreWAEcqUeb72ROfakp0CqOkLGHHoIP7rF38y2sJYOvYINQKIqnHhvMX2Z4wGiFaQOdPVTNXjNIFZ2JXFQXx+MfHqSFVYpb2JfF2ne0Gbtec2yH83HvMTL6fy+ynFR929XKu9kNxrhJ78VZKbAWjhH59xWHHQCOyhgVAvFVHFiV4IUsyK/OZ0WtYu7eIo9Tz6nh0U7bq9cTLASEYC5NEzPvRF6gTTY/nHFefa/ejnB47BwnrwE8/wiksV+f3hQdF8NIP5xW7y1HQI6/U/sD8t445RZCdH1ugl1Q0aR6Yr5/bK1KHMBxg9A6S71Vv9EzIjLjFo0H/Q13d+qd280UY45IN+3/BHX01G6L+qNUXmjP/4UBmDCkIxLIMikE8yTixbMuuPI6sjVTgbz5AqKF/yqCBs/3G2v7ZO/pookGWfVDpyN0RuOWCqZKMDIvGc0gbsGu+DoNIh2wnWScTcWuEGDVWkxdprChmuAUz9De9PkDae5pIdcNg=
X-Microsoft-Antispam-PRVS: <DM2PR03MB335B10A54B608BC164E5BD3E9DA0@DM2PR03MB335.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13018025)(8121501046)(13017025)(5005006)(13015025)(13023025)(13024025)(10201501046)(3002001)(6055026);
	SRVR:DM2PR03MB335; BCL:0; PCL:0; RULEID:(400006);
	SRVR:DM2PR03MB335; 
X-Forefront-PRVS: 00922518D8
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR03MB335;
	23:ANf9YazTdAJPiGC6OhShgzRTXGZgun0GOheHQ9bvsv?=
	=?us-ascii?Q?Mk0PC+uNV22q8XD4lzuEuv8JF98EmvR/2XkmQG/i4A5zTY/pA7dHaEdxqUTT?=
	=?us-ascii?Q?EoI+MUxSLxqhaCgWYAfR3QD3sB2cyKSKqYeE9xsCQMk995VDrhl4XeStWaJD?=
	=?us-ascii?Q?Z5Yd/1Qs1zwKcraa17cRnEWBKEfrKr2sUa7xTbcUiAOukzEC+M4IR2I56BAh?=
	=?us-ascii?Q?0ARE5VIqEMncfsFwkh++IlLx4Cc1TLR8oAeamWrt789oQuZOtBE44ts/zJ8l?=
	=?us-ascii?Q?5k0kUZwvm3XYrHo7HJQYxgyyUFxrYXaVM1jyWumjUv/V1XPKjcPqvaH9i4z7?=
	=?us-ascii?Q?3jg0m30WGL4tNkevxdfyPci8h3XqeQ2E1QVFOv+WuXbQ/XKmnCx+8KVMpm9w?=
	=?us-ascii?Q?KRwF9IF2wz1AnJxv1i2CHju0tkHycyV6bKMTy4HYc2r48mA1u/T1ztJBM5AD?=
	=?us-ascii?Q?6YcHttOhWlfDItW8gVv2AN/zr5AwFk4NAurV5QGWvYOjTb8a2nobmUcRyAy9?=
	=?us-ascii?Q?hSW52Lq1EHEaz3ZxPi69YrZ94CNR/4zoSsR73CWkwqFfflfoikp/D8zZKnoo?=
	=?us-ascii?Q?xNSdP1Lv/ElG+t0iL65OJG1s7KM68sbT2NUunRvq2OJk3gb+Jz1N4LiA2Z/k?=
	=?us-ascii?Q?K7OIUW2O6cdkJ3JlSjb7HowS5M+1uGQoFFbyYtcFQHroHnTVQ94Mb7k5fdoh?=
	=?us-ascii?Q?kMTvVE6coVeYAn1mZIdnQHh/86eBZr6lyymd5IysU/F6gEaOk9a+yYq1adO3?=
	=?us-ascii?Q?zKgSUBFvAAdKjZFWHmLJ4XCgW7R9f1WUzGP0PHux3G/CTXQNMC/6Lzpf2EQq?=
	=?us-ascii?Q?JWDYb5I/CdWEFFji88RARD2IN+pCPuBAy5a5F744ZBaQ+MBCtUrf9J+nHeQ4?=
	=?us-ascii?Q?dXJcAG55+oQB/3NKNthyrIRoUFYLxY7wMRPZAF2WICgvk3Mxod2UBhgSqPtT?=
	=?us-ascii?Q?SKP04b6t7ganId3WnjOrdukDQL3u2fOBaS2vJIJMzIOibZtoBIaj6UFhgLBe?=
	=?us-ascii?Q?UHerUYEe1nGfYTdO4/cblFrNrpjG7LIyL8U7egWynMlIoLzKvORUp5+UaSvm?=
	=?us-ascii?Q?DxaTODPTR7fXNm8hyXqTiOq4w9R1mmiJcQHxQro2GsATKohnddUH1/kmDTG7?=
	=?us-ascii?Q?gQJzGOXrC9vYkUdm6gZ7dcadsopraUiKjrTXOjeTsJxEnVwW7T8DQaLkGLMa?=
	=?us-ascii?Q?Yuv3B25UUPyVh2YTtDsbxewmP2V8/rHozp?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR03MB335;
	6:DkfB8bHFJhigZkbA4ct5UgnNvlTlDvrKfoJMXTp3tT4ylfPkAu4qcaOqHKdL1laXHgm1HesBDzyXuJpC2efrWoWPaoR5BpoqdWXvh/XgKiWNzJs0VrvRm99E5o3fUY97ahI3vYOUaRi09GmNfszvGtQlTxw1AxZ2smHT97Ao5FrTSSUgwE2XiKSA58GOrX4o5BW2R3qtRE85ucwi4SVKvDNCOXiiECT3IGZQnazwcoJGxSoz3x7RKmDSFdO/qbHBNLDY5a1mtQgkG7gaEZlsTFjoXOLc81b0bS7edsNZ3wQ=;
	5:wc3xk8oRkDB6LwqfOeRaH9Dg0aOCzFoj4wY4+2/8qAk1zO6hW36dskN3rYW7itSzMekpkYPZw+Ndvx2x9rmLfMLN1jevtY/UGqmKrKB93fWyp2l8yYY9RdcBc2+iY/MS53ZqS3qKIKcVHea0vTwEOtOCFjaJHob/lDwha3jkTOA=;
	24:JJ3rV2eWmvJC/etfw+MnGloiMjex3+1UFGEp4YipQTkJ2tjKMAR0cy19jWRLq68s4cBuIwdwtgG2mkaZzPbVkqqTd9u0xhZ2SdCsXHuITCw=;
	7:MYCwIWP1TMvimLD0j809GmolqS/vSgMP5/IKc7+JP9VF4XrdeFea4SRnar+Ik+r0uob1wxztWn2oINBv1w3PaR7SUk4NyV79LZN7gEcctDMeXXPVOVujdMjq/U+1VBKUdL6OOPoNdDbJjuFKRoZxzycrm2WnzU2t0ZavsEhW+BlW687R0vWuKW0Rr+F4EEVEaDpgUNRumLL2Prcl2wavIFd8rpCOLasxnXwoIGmoCG65T/o7RvaWEZMsH5PdzMKW9BvPrxRl01XA3guO/HpLIG/3UD5YcjPQt5TaF7HOIK2zfpZBvmTW4KuwTM8tLV/jaa6uLA1ua8M9PH27i7/aQw==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2016 10:48:29.3507 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR03MB335
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH] gstreamer1.0-plugins-good: Remove gst_meta_ximage_transform function
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
X-List-Received-Date: Tue, 11 Oct 2016 11:03:37 -0000
Content-Type: text/plain

Remove the transform function as it is not supported. 

Or gst_buffer_copy_into() will print ERROR log.

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...shouldn-t-implement-transform-if-don-t-su.patch | 48 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_1.8.3.bb   |  1 +
 2 files changed, 49 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-ximageutil-shouldn-t-implement-transform-if-don-t-su.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-ximageutil-shouldn-t-implement-transform-if-don-t-su.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-ximageutil-shouldn-t-implement-transform-if-don-t-su.patch
new file mode 100755
index 0000000..a73f16e
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-ximageutil-shouldn-t-implement-transform-if-don-t-su.patch
@@ -0,0 +1,48 @@
+From 17b1abd8491d87fab389654f313b72bded24afc2 Mon Sep 17 00:00:00 2001
+From: Song Bing <bing.song@nxp.com>
+Date: Tue, 26 Apr 2016 16:49:33 +0800
+Subject: [PATCH] ximageutil: shouldn't implement transform if don't support
+ it.
+
+shouldn't implement transform if don't support it. Or
+gst_buffer_copy_into() will print ERROR log.
+
+Upstream-Status: Backport [1.9.1]
+
+https://bugzilla.gnome.org/show_bug.cgi?id=765583
+---
+ sys/ximage/ximageutil.c |   11 +----------
+ 1 file changed, 1 insertion(+), 10 deletions(-)
+
+diff --git a/sys/ximage/ximageutil.c b/sys/ximage/ximageutil.c
+index ac2fd49..add0422 100644
+--- a/sys/ximage/ximageutil.c
++++ b/sys/ximage/ximageutil.c
+@@ -36,15 +36,6 @@ gst_meta_ximage_api_get_type (void)
+   return type;
+ }
+ 
+-static gboolean
+-gst_meta_ximage_transform (GstBuffer * dest, GstMeta * meta,
+-    GstBuffer * buffer, GQuark type, gpointer data)
+-{
+-  /* ximage metadata can't be transformed or copied */
+-
+-  return FALSE;
+-}
+-
+ const GstMetaInfo *
+ gst_meta_ximage_get_info (void)
+ {
+@@ -54,7 +45,7 @@ gst_meta_ximage_get_info (void)
+     const GstMetaInfo *meta =
+         gst_meta_register (gst_meta_ximage_api_get_type (), "GstMetaXImageSrc",
+         sizeof (GstMetaXImage), (GstMetaInitFunction) NULL,
+-        (GstMetaFreeFunction) NULL, gst_meta_ximage_transform);
++        (GstMetaFreeFunction) NULL, (GstMetaTransformFunction) NULL);
+     g_once_init_leave (&meta_ximage_info, meta);
+   }
+   return meta_ximage_info;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb
index 5cc6578..34b6008 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb
@@ -9,6 +9,7 @@ SRC_URI = " \
     file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinel-for-gst_structure_get.patch \
+    file://0002-ximageutil-shouldn-t-implement-transform-if-don-t-su.patch \
 "
 
 SRC_URI[md5sum] = "473ebb1f15c67de99ddb6e4d027c0876"
-- 
1.9.1


