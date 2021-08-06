Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.6436.1628264448348276874
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 08:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Bk9zE/QB;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3852649d93=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 176FLfGc015706
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Aug 2021 08:40:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=1Fzd6ZBoIunbRmqr0O3xi4qb+oHcG+sPIZB4c/One0M=;
 b=Bk9zE/QBkE23eLHnfw9VwV5S/q71AxvYFYUCNGZ/2NufBAxn4/t2Rpi5CSLUyuEIDpUL
 ZiDi6hTIcKiYe2QT3UMnfqzWnIcG6Lw9WoyN4d2X9DbIgpWA08gTXDn0wvjZpegAhs+X
 ZZxEIDJXFq8+Gei0lvKcMdaQaMijv9H3BmKthsNC/2PVk9rpp6ZG1HTpWomqgN1YVxMu
 4mJJB4bdMJGMokSHRo566fvqcU5qESRgyE/Mbfv5r5dGc5C2bf5qGgWmxIGlKhvvBG8/
 Bf5wmjXwQg/P1JorF1sxYQNz2dqBIGW3kDMaNeEJIOydb1F9kO91v6jGZKLnVfZEu2z7 bA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a8ke0gs5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 08:40:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjgK0AObRG0AHqSJibx1rOpbe9Qpo4SfsvKdwN7USP/4cmF1fKOtSOfsQcznFcGh99aDhXtsg15LkwxUhg6vSAz3wyRqXcq3TqZwoi/YV3Pgr3ar/wAv9E1U3rTt0ScFUDDNSYQwuZn7DNocmVhe08a8JrOk5gf52XqaVvWaNB6lsIHKONenqOeG6IVQMVqkQMY8lJhzZF2tX+zO8sFU4pn8VpteDrX/6zT3dVL32h9nU0sICKZ0BZJaVUxxPriVP32zlxHKzKm2POZJdtLKkmObhfUCgYGzG0wVwkDuDWGoal/izdTXc9BC2jqY2aQ0YWkaUlRDPQrEUxfEg5lSLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Fzd6ZBoIunbRmqr0O3xi4qb+oHcG+sPIZB4c/One0M=;
 b=MB07m2ZZx11WFsAlZL2e0oHWuI8eC0ivX7QOnesgN0i3kaN5NvNbekmPCkr8TTgbMW68Jj8qANR+ng37nh42twq3yX63IWmfW/fk/PCxe5uOmQz4AVGCD7hhaYWj0jGu9qYP8zhEG5vJBbXGIMukGZLmKcOsZ7ZfmJoKTQBPh+ZnZ0CPPp2o3yVruAU0ylEQh1/0HnCrPs88OlJTIDtv/zrPV3enZrVoDLbnzsne0ZnOkX2wpmynLdEwUQLzx6k95lZ6ZLioClwv47awuTUlg/0Ducoz0RyzyMcB/YUnJ4f5s7ocGME3K18vv4kbfMZmduieDoRVo79cbWSm5YRskg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB2936.namprd11.prod.outlook.com (2603:10b6:a03:8c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Fri, 6 Aug
 2021 15:40:41 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4%4]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 15:40:41 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [v2][oe-core][PATCH 1/1] icu: increase command buffer size
Date: Fri,  6 Aug 2021 08:40:27 -0700
Message-Id: <20210806154027.118311-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BYAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::29) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BYAPR05CA0016.namprd05.prod.outlook.com (2603:10b6:a03:c0::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.5 via Frontend Transport; Fri, 6 Aug 2021 15:40:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a986eb69-65d9-48a0-aac5-08d958f08bf9
X-MS-TrafficTypeDiagnostic: BYAPR11MB2936:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29362ADB6D8347488C13F46788F39@BYAPR11MB2936.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:446;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+VKKO4dqKijbcYleBjL46+gsK8zGu7iB210b+mRA74GyXyTLkq/yr1Vx1y5rQqWj72ekCmjSslUe6fDw9/TcZ3JLX4sDfpxueLElrxT8EMNqOpHmFYJzEqh0abRKwtG4uCc+Zx8Yks+eIhPRcCn1uYyh2z3sjDsEaed5ZYo7NemMPFAJsUluRI04D3nahrrj0UjU7k01RskPULHHLdA5XkvOl4yyiMeIracErMl8wiUs6VoCulnJv5NJ/dW3/uPfTfvPL79v98r8d5d1B3D4uzyOxrPpoVMVHrWkvkuaryBN6ZiTVPYp2l7OU6gQXMOp+JZMvoWlsevIngXutppn6I8NWWLp0rzmpdIbsKpAKq9Z9k0KJi3pyYo4gHUZC9v4H8IfFVExnCis9lA93Vwjm8tg5//vK4fHPnODbHLO8jJ2rVZPtPNrnarcw1eMcqHAQsUE3IEEXan0OKPFD7aFVMi+1H1jQL8oXFHC6wreNWOLdCVLQMpzs8iEnKjVRgQbykbatPa3ks9OZpFpqamgjOrVFebKsnKn0SwB5Ljs6lY/Ha1UFCZfiIchBL09Bfs/u/J9XNZ2lJyhnurq/qVq9qq2eOk52l4o+7VeeVnqPLM7AKtfsaQwh1ICfY3ScbaGd9DRaDxyGnpK50z8NY4DPZd/Sz99kmwmcxRpxBWJtpY3P4EQg8+X4aRYux/uZVEW1/oGvyDxKXpVteGMSyNr8w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(136003)(366004)(396003)(376002)(1076003)(6486002)(66556008)(36756003)(52116002)(2616005)(44832011)(66946007)(86362001)(26005)(66476007)(316002)(956004)(6512007)(2906002)(6916009)(38350700002)(5660300002)(8936002)(107886003)(4326008)(8676002)(83380400001)(478600001)(38100700002)(6506007)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qaHXlb6fOpzRYsIm0z6EIG9lpnaknDtuIAy11ULHHRQk/VxT/uz7cxj3JKJC?=
 =?us-ascii?Q?s1C6clM2pEBByE0KCRZv416UgogSHSVovJ6kRf39e+IE3Uyg7fFI4didzLC2?=
 =?us-ascii?Q?a7hGdFt0h1svOjnb5UW4ezuUs0BCEBezElh6Bag5pmHGfq9S/oKpwjvfW078?=
 =?us-ascii?Q?+4oW7tO0Un07a6jTdKBs8LMnpHeRO0qMEdJg/VTXM0fGYAW6FuORUa2ZlUxS?=
 =?us-ascii?Q?jKjzi94X8U/vuyS+6OpEnKrA0QsVem0zV5GVaLXvYu+uLFDMd7avFFhyeUEH?=
 =?us-ascii?Q?tQjExSRm+rtQCOhzhlcIUQxWtry2/LFwWbm7mgjCnUe6gIdhHg/VffEutSHl?=
 =?us-ascii?Q?2e0mYfnygnLxSKDab6XI7dHUiOung6JFbZP0iamrLObPdGZTfXY9DA0Ty+59?=
 =?us-ascii?Q?CK0wm7rYFwV+M8Co0MjronTEGpNnD1IMXSTbO7NRLotcC13mHlh7t3FfPxQK?=
 =?us-ascii?Q?Z+m6qxnvhOt6F62+E2VVE1MzA76ItztwIZKuAkFI5p96jYhy6GcvEoyglQh0?=
 =?us-ascii?Q?e3mSGzRtuHVqcO9jlqYdquG3DDL/9Ofia3koCw0T07p5pW3/4Fv1gw3kMjc5?=
 =?us-ascii?Q?68IUODDTp9KNn+wlpL3Dg8zcPJ+0w4a+MfZUKZBL21wUMoLOR3q2m7rkp3Of?=
 =?us-ascii?Q?+LsTi0JRzkL/j/MPOZSVhQAQyQ0O07oIHm2ZhGDSERW8MFO7I/M8MZmgcw8o?=
 =?us-ascii?Q?F0SiI6SDgpTU8X5NnSZ5QPCchcDeWXBqm7T/07KaMdszsxN2nxDGALweqUpE?=
 =?us-ascii?Q?F9L4TloT77glfwPJt2KSnrz8t6wVgTUl/iUL7rgInW2LZLAhwam69XxP5cED?=
 =?us-ascii?Q?pDC1sd+rp6uu50cYibrcRLh4QTOHW3Y7VFwnFkBALHSh2v2sCWiykSOef+Nn?=
 =?us-ascii?Q?HW1utOH+mtJLgNw9K2aWOZPHDjk3Fp7DPJbLdsnNfUrwGCZdhdD1zaMxjcnD?=
 =?us-ascii?Q?ClYEATQF3pauiCaXo5La75OynaWFs5dDJ5bJQWKk2jPBJxJ/CkSN/sAuT8WP?=
 =?us-ascii?Q?RA+zOKlyBy0CE84ePSQXDpFRqqDZYlRdcB7tRQ5cKvUDdlu3mJGzEq1YsVDk?=
 =?us-ascii?Q?y66ODs3zkxXuL08d2672iLFBDyoOkTkG1vLTdSiycJknRYm95V5IjERavML/?=
 =?us-ascii?Q?tAN+SjbSAZoh0K58FbPGgia074XmNFUm9rf5HInm4Wj0o/rtuxa9KGSM3BwF?=
 =?us-ascii?Q?mdlG9clc/ltshq2Vqt28rW3SSXwAn9Z1+NNn4lX9xB1ziYGHbrujKST6bai5?=
 =?us-ascii?Q?NdeBfSSuffRdgo1IpOzZNRRulksW0KoWSLqyzt9g8GHS8j9XUO4SEj9RexCV?=
 =?us-ascii?Q?NApRVbHNw5wZQ/kIgX9+HrMN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a986eb69-65d9-48a0-aac5-08d958f08bf9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 15:40:41.5005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KNKsHHqszaBvDnxB2YlXkS/V8ayNyZBYGHGBvZKkPre8lU8Mk4F+khKBpBNLll9c4aagYVCpy/nAikmyItZZ+OrKWf78h8YbuXiXsFl764=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2936
X-Proofpoint-ORIG-GUID: jQoohMKs8fWPNi7OUf7SExFOAs4RnthQ
X-Proofpoint-GUID: jQoohMKs8fWPNi7OUf7SExFOAs4RnthQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-06_05,2021-08-06_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxscore=0 mlxlogscore=951 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108060108
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Make cmd in pkg_installLibrary() LARGE_BUFFER_SIZE to avoid
pathname truncation if the install path is longer than about
150 characters.  For default compilation, the U_ASSERT does
not detect buffer overflow, but that issue is not addressed.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 ...pkgdata-increase-command-buffer-size.patch | 43 +++++++++++++++++++
 meta/recipes-support/icu/icu_69.1.bb          |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch

diff --git a/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch b/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch
new file mode 100644
index 0000000000..ea68e4be9f
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch
@@ -0,0 +1,43 @@
+From ab6b1acdeed76899f8227c38ab7e7675c7673ff1 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Thu, 5 Aug 2021 09:23:48 -0700
+Subject: [PATCH 1/1] pkgdata: increase command buffer size
+
+Make cmd LARGE_BUFFER_SIZE to avoid pathname truncation
+when install paths are longer than about 150 characters.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ source/tools/pkgdata/pkgdata.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/source/tools/pkgdata/pkgdata.cpp b/source/tools/pkgdata/pkgdata.cpp
+index 5ab682e..d4b70ef 100644
+--- a/tools/pkgdata/pkgdata.cpp
++++ b/tools/pkgdata/pkgdata.cpp
+@@ -1131,17 +1131,17 @@ normal_symlink_mode:
+ 
+ static int32_t pkg_installLibrary(const char *installDir, const char *targetDir, UBool noVersion) {
+     int32_t result = 0;
+-    char cmd[SMALL_BUFFER_MAX_SIZE];
++    char cmd[LARGE_BUFFER_MAX_SIZE];
+ 
+     auto ret = snprintf(cmd,
+-            SMALL_BUFFER_MAX_SIZE,
++            LARGE_BUFFER_MAX_SIZE,
+             "cd %s && %s %s %s%s%s",
+             targetDir,
+             pkgDataFlags[INSTALL_CMD],
+             libFileNames[LIB_FILE_VERSION],
+             installDir, PKGDATA_FILE_SEP_STRING, libFileNames[LIB_FILE_VERSION]);
+     (void)ret;
+-    U_ASSERT(0 <= ret && ret < SMALL_BUFFER_MAX_SIZE);
++    U_ASSERT(0 <= ret && ret < LARGE_BUFFER_MAX_SIZE);
+ 
+     result = runCommand(cmd);
+ 
+-- 
+2.29.2
+
diff --git a/meta/recipes-support/icu/icu_69.1.bb b/meta/recipes-support/icu/icu_69.1.bb
index bfeea8d2f0..00c22372b5 100644
--- a/meta/recipes-support/icu/icu_69.1.bb
+++ b/meta/recipes-support/icu/icu_69.1.bb
@@ -107,6 +107,7 @@ SRC_URI = "${BASE_SRC_URI};name=code \
            file://filter.json \
            file://fix-install-manx.patch \
            file://0001-icu-Added-armeb-support.patch \
+           file://0001-pkgdata-increase-command-buffer-size.patch \
            "
 
 SRC_URI_append_class-target = "\
-- 
2.29.2

