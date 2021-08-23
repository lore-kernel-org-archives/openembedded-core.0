Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.30554.1629754201331813033
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 14:30:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iPOlEVje;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3869da013b=joe.slater@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17NLFb3n003638
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 14:30:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=brVSYgMcrfd7JkX4aax8b+H1Ma7EBjI1WYhOcWtuWOM=;
 b=iPOlEVjeWjPkDu0gMxZWFgZykBkpUsIcBGUJfO7Zwwn9Wx2mGnJAYZFD1wTPS+T3/Bfr
 2eWuBNWGblkkVmU2c8IVt98tlXvOUEncIgHkHgXwRHJkP6VD1qnrV6XinIlIPv+T1wiP
 /Tq5nuv+Lru/U7NRhTL/OwfQd/1CND1tgxHriNfyHaU7a6sD8vBiMV1vQ72iWDWIrF8E
 LY0vAKvmQptumyJN0JLNfcMGJ3tnP8blDQg+DvLysqK6KZffML+2mVk92YZ2UvNoAfjn
 Yl9Pc3/GEqvXSe5+yfK+ssdSO/JMi7b1k+113xbPlp65/yDyHogGAf7F1YRyIJ/kG3Cj pg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
	by mx0a-0064b401.pphosted.com with ESMTP id 3akxy78r7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 14:30:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daHmTM6gmo2OAePeAE4/KFoWPpvQSmUves/2lc8DO704kFXjbti2rXLXv4a5SrCMgl2GE+zJySPFqrJI0IrGp7NbxdDi45/8QuJQestl7t+jk1HXNxXIopskHpW6ioGov//Z2DqVlfNL+PIgLxCa0oMT3MLfS5j2nFncUf8x/OPUPnFOy6hQsjCcsuawZ1o5Xn+ZSGW08Qujc9acnWrxOUIKG4iuGsMtX6zjKgGb4TbF40cxJLpM/3Rw03Ici51/SYE9rnRWUVWbLcjAdB0L06fJj/YFcNSNuOErQK5LfTg1JojpVoVnnFSseoPNTJ3akgoce4uGFIYoPTU+k6Z+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brVSYgMcrfd7JkX4aax8b+H1Ma7EBjI1WYhOcWtuWOM=;
 b=iihsPTRo/hXlnVLD3HaaJIU6y6G/bCHbrcKNE8s4oPN0yJ4DwHDqOhTYVe+Vvt/qMOpBAkd59AByYZuHA3GCcSJ2ccMa1G8kDYpha2yyk2kMG5peZl2HA/FXjPbs+CPdLNHoSD6G6evCzCbs2nq/QDS8q5agdHV2hfrDcWzvhBJ7ZG7oxxS19hR72ESda5UrPWD3yrX+VfZYlOHIghAOGpHN1nvYmnhs9wLDoENWlsVpH1vadADYuwze09S38UfrnjplHeMOZKsFLMOd0T5v5o5L5CKkajNEhv04nurLbpOqjY4k2kHVY45u6xz7MBF5Wdy13jxHSF1J2MPV7fGh0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB3128.namprd11.prod.outlook.com (2603:10b6:a03:86::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Mon, 23 Aug
 2021 21:29:58 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4%4]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 21:29:57 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][hardknott][PATCH 1/1] icu: increase pkgdata command buffer size
Date: Mon, 23 Aug 2021 14:29:44 -0700
Message-Id: <20210823212944.159869-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BYAPR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::43) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BYAPR02CA0030.namprd02.prod.outlook.com (2603:10b6:a02:ee::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 21:29:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9569b3d9-64cb-4cfb-10ef-08d9667d27f2
X-MS-TrafficTypeDiagnostic: BYAPR11MB3128:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3128FA7B5CAE78591895637B88C49@BYAPR11MB3128.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:127;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bj7GGGpC6d+sjmWziFX9OEliTbwKnBLrCMbz8HmplXB02MCMc5WFQ4n8+TepRULo5xrVKWWUTRVluXMrdCMNBS9lsAKd73frATkeCWRY6k533TLxSZ38KOJRBwEu3DO1N9mxGZwKOqi7fIV4SQxGI/EvpC0yhkF+YHN1BLPsJnw9LBkAbA9HGTA+ICNJSqW8A6UDXso7PBJr+GPNazAOTgJOV92t+7szQuukqiBJSImuswOv4ayQqvgPufs7fBsuUd1IwwlZDX4ah2Vo566s0/4E+7Seyt7vcxynxKDq+Uw6+gf3Hmh0V+LFl+5FTfqYa1B8LDnDKQXIwn1WnjLV7RxbUrrByBBPJi6IhIaU7LksNI/t+qVwqYqC0YYPGN7A4VdirCHey7kKDwTMsyk6rlXkujH8TtoN4YQCaTRs6GFNcEdi1GuahR+oaL7duCInP5d2T1CW4MklzS97ErPnRiKRvkFTA2Pvm9WaCK7EfNfBB4iOvZZEjYr/JesF9I+lvVNrk/mKQJZsxjySC5CWyVtpvNQfVqFTJ7o50249n32rh26XuHHYGycyPP7Qu3gtKfEWJDFzp+YwpQxTuGrK41ZRf+OX6Hfq3jYkAuqLwicn9jusHtwFGIe2+VWZ6BOzY5uI9NzPRh+yeeFtzhgkVbFNuFnAPuXG19bgjYf/p6g3lr2JCCWUC/U8XXtHWydlIq7sL1ncQl2d53posJMQMQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39850400004)(376002)(346002)(4326008)(6486002)(6512007)(8936002)(36756003)(2906002)(956004)(2616005)(83380400001)(478600001)(86362001)(6916009)(38350700002)(38100700002)(5660300002)(6506007)(66476007)(66946007)(186003)(26005)(52116002)(316002)(44832011)(6666004)(1076003)(66556008)(107886003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Pm87PwQhZ//5H8AeFK5wPXst83KHikngaXMq6LfRM3vrCE7V+ERoIb6ckjlR?=
 =?us-ascii?Q?QJF1UWFOygcKKDSkrAJaD2n1FCuDUketON4QNFeATsQV7He3q2H5Fev2lpL1?=
 =?us-ascii?Q?//H1dpnYL04tNMyZls80WNr5N9sqfdlxVzmEVJr9cn84f3Ryg7UcZuW3Ke5i?=
 =?us-ascii?Q?DgM0kpNIPUsqo4kBfvDrNT/5RXnzged0CRDUdTop1QUy56NvaPhu7KqtvuJW?=
 =?us-ascii?Q?uB7J4LhGqgHw25wuNeN1/y9UILcu6XnBW3K3UuJHVDGepomErGcKKCxhijSW?=
 =?us-ascii?Q?cefUmQfhqqGv7XmDk1KIr9ywpODPcXHcJXzhAXtXJnZ1/C2SWx6w5yB8WIwm?=
 =?us-ascii?Q?QSY+cB+IjlODXW0dt+3o+s27PDajvtMUAhDlma1dZvirX9coiluCtmcs3xGW?=
 =?us-ascii?Q?5EUC/LHLt9EbvLxZ5JZC1t1K8Hu25bf3glDZl4CK3nD+6z74r1ebMA71g+c2?=
 =?us-ascii?Q?jWya9O8lRTjr6L14mG9b6ismrhwrDliMNbWmQuWzrDm0NWbJl+IR3iDS1Nrk?=
 =?us-ascii?Q?oZJWc/R1APhNWIe7cZQRmjqm0shR+UOYwP0qM+Aw13E4EXf+wa3EJAafYuTS?=
 =?us-ascii?Q?xpCAs8+BmW/AHaCK4E0avWyz5A+PDijpYbnJq4B1LpBn7XU+kAh6jTH1CQes?=
 =?us-ascii?Q?lHXEXqZ/535VOxYKoddtPLn11HUlT39twwbHErLbbnE/Sir0fTAmkuRZ4lu8?=
 =?us-ascii?Q?jgHHS7t34WPKLvpPclJo4usHI4ctQ9DIjdXcwfiMwUdo4WnJ0f2alMAMcKLB?=
 =?us-ascii?Q?eba9EOKg2pzwoH55hJ/MUlHhyXOjqH8uoCiWPkjhKqDLBmD/tqN9rn1lm99k?=
 =?us-ascii?Q?BsHTuhHPisgYkpsBrBwn1+e0u7+Zopd1yXwHFZrNNgcNWj1ykRoYKSDp16oN?=
 =?us-ascii?Q?z6wIBbi3gextaXZE5szM8/B0D/JJNXwVNd0yWBVDQBKkZHLThhmJijx/8www?=
 =?us-ascii?Q?Q/CoBtW/WNY3WmuV2VvGgVbzsGoVQi4TAFdBS2n/fNJ1GeBcGAWmFbg1glkO?=
 =?us-ascii?Q?O1BdOZsZp125cD4VZqdzo0t+JV4Moz29U65ZD8rN27NdiRDfGpvO2keuUr3K?=
 =?us-ascii?Q?+gL7Zd2ZpbI+ueyC2uOVFCIHddasrv0oYQsYnRHvEfZahc5YMtFpuf3Voc/9?=
 =?us-ascii?Q?IexC4v1M8FSnO83cwQeVTDwtbx/xtE2Lq16mlqkM8qlPSpnEEuHH4HYqIARd?=
 =?us-ascii?Q?0LsASa0w/xavBsSM8JNNarjxXwActQOTx96TTcBYA4iL4CaWd6V/sEwgxG9b?=
 =?us-ascii?Q?dEIglqpIY2vvOtu1mAIk75IPs/CTjOuVzv+EtDDtPnvlqxOcvwcu88x5rL+5?=
 =?us-ascii?Q?WmETLxTObsNspid8BvQ9N6f5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9569b3d9-64cb-4cfb-10ef-08d9667d27f2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 21:29:57.8605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwT73560rjs/0NQYI82Lpg6D9VsEh9BSlOP27o0DxjhEhEj5k1IDQXnLyTCsU1LEAHm3pXpdwkJ3joLn7Wt9pnLYRZouNcFgBXwuQRPGI4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3128
X-Proofpoint-ORIG-GUID: 49zMoZP7FyIBe-R_ywdGqGifCjBifAxJ
X-Proofpoint-GUID: 49zMoZP7FyIBe-R_ywdGqGifCjBifAxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-23_04,2021-08-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 mlxscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108230146
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Mitigate pathname truncation when installing in a project
with a very long pathname.  The patch is on the master
branch, but they have moved to a later version of icu
so we cannot cherry-pick.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 ...pkgdata-increase-command-buffer-size.patch | 43 +++++++++++++++++++
 meta/recipes-support/icu/icu_68.2.bb          |  1 +
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
diff --git a/meta/recipes-support/icu/icu_68.2.bb b/meta/recipes-support/icu/icu_68.2.bb
index 1ca87feee4..130212d245 100644
--- a/meta/recipes-support/icu/icu_68.2.bb
+++ b/meta/recipes-support/icu/icu_68.2.bb
@@ -107,6 +107,7 @@ SRC_URI = "${BASE_SRC_URI};name=code \
            file://filter.json \
            file://fix-install-manx.patch \
            file://0001-icu-Added-armeb-support.patch \
+           file://0001-pkgdata-increase-command-buffer-size.patch \
            "
 
 SRC_URI_append_class-target = "\
-- 
2.31.1

