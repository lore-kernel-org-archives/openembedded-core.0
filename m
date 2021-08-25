Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.22591.1629929654988589779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 15:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mu4T70IW;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=387133da41=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17PHR086014298
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 15:14:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=PUR+x3L3Xvrc7OoOtEP1Ba37UZMz8AgAUCVKGJtISNE=;
 b=mu4T70IW8e17Ef92pPeNychgxQyKpkBTL7WAcE5peNKFxVfk67FN3nqdE5xLN5r/fUPZ
 3Si21CGnxvyTHk1SJcIEsTXOk1qquBuLGk1eZRsvzX25h+OWbww2NIY7azfuMjMFvmXz
 G/bsxQ0VqwT69F8cCYhyhSj5R96EPVO9G7oWlqsg5b0pYMbhwCAEv1cjFrUgcq1iwNvJ
 /vjIR5n1EbSyROnXLpflncdNgZkMFDlPBJ1xHFMtYwJdghvVgATUN4lGPkpDG/3yuVRA
 i9WBtTFW4BkaDk0FVcL8ANojZRae08TjfPYxiJRqhJJfcecbm0leh8SwPbjbcHnncfcQ IQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 3andk48q1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 15:14:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFlRRns0Y+dCVh2wb5p9WpQAaUZTTK7Z82dvvob+QLvffCRfJP++1G5hFGw8qoHmvtJaz6IgMK7izTCAnpfJXBi+GTDWoK/S5mqfXvY64ReaPO564vrQjbI7IcSXM9/VECohl40QQ7smjJg/YWHhumS2iKvRVxisGiyMoM4TWeKrNkkylASVLd3zpNBEIZYPr1eYM44jwuK+PBjbjfkta4uwVVMZicWpjIovuD5iIWkWuUOQaSixGbB6A6ppe3eh/gGCAp3s8i3MzgKtv4N1wDzoTbinqYGZ3FyhmxLr3I0muJs7KNh7bkBwe1TEeMmJztpSsgofeCytiG8Sa4FEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUR+x3L3Xvrc7OoOtEP1Ba37UZMz8AgAUCVKGJtISNE=;
 b=MN9skfwB/PknDX8vlHiu5M6u+XmrPHKgC1qhGeqgw9GbHpajfZkR9j0iKjUmMSTgbPtvTI0AM/pEQetFfqGT1VM11Vu13n57Vp+XIN7NzWkC9fTfTU5KDnj7DEf2MHUd1nkOJ6FLg7AJV/w8WFgQ5xvdwi6Oj6Y9/ivvbHU0D9RU0DcWULRpNhxzGkgVyFDJFU+yXa2Tc8zcF6apy9ZwDjcFn8r8sttraE2vf6bsNKkWEC+lJe9nYgNgq+vTqlGiOJbK7+kpWfZyPWdLFxkwJ0rzLa5UpxhosRGIw9oRC9M2DGyXsq6vk/6mj7S0u2h0DHdyS2RidGoWEs+KbwtARw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB3592.namprd11.prod.outlook.com (2603:10b6:a03:fb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 22:14:11 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::8136:f22:7050:c089]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::8136:f22:7050:c089%3]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 22:14:11 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [v2][oe-core][hardknott][PATCH 1/1] icu: increase pkgdata command buffer size
Date: Wed, 25 Aug 2021 15:13:59 -0700
Message-Id: <20210825221359.82163-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BYAPR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::19) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BYAPR03CA0006.namprd03.prod.outlook.com (2603:10b6:a02:a8::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 22:14:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e8269e9-9bd1-4a53-0ec3-08d96815aa89
X-MS-TrafficTypeDiagnostic: BYAPR11MB3592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB35925B64ED42E37E48E6041E88C69@BYAPR11MB3592.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:55;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zgxOine5vUrv1Jy5alBPu8Cgcw4l/xTM7diArI/043mqj7G57n2iHpMIYf3o80BalCkQ88dPcP6xC17UIGBoTkXocHm4yCTQn1uMw2TeiGSbK9HI+eg76bXzN3sjM5efVpKdzC5RUxUxwTyuOz4B3k9PfZdgSv0Hp3SZSkUoRpBdU5pLVTNcV6YO97uQeSeN8Ixw+A1PkZqaG/kZunaMnVkmPao9cJaa9udmNorpE8ZrU5/B992u+M4MOG9vYUJqPD3WfBxVRKYn1HxaMihChDoydjyian96YwCfO0bv1it6GEH8FGCTkFr/aybFvYv1gj0NSyomu7L15dYmjJrNh3YkSpqbFVCEQc5QPXtLSPLnByePEcd+qL5g9zjOHx7L9eS2x30kO7qS3Yb3xgsk95xLpV4rybrgYH8weZ6rz0r8HYG1l65HOimtJDgAv/Vw0hgsjQdkE/qfV7+HfTVbfziFTNPim7OBg4WHRi9BpdabNT0/5dlLyEQC6rIQpG3nVQ4Tm7n3qbjSCaigwjQZqljYj0kik1ykCA+dvFiv6hsEXUmZM46fLHHeg4d5ItjqslHRRvZ/grMh4t2AxGsLclMUZ7iZXxZfnEA9IJe6CMnlfk4nNtyOCR8ESSNEvVildHNCFm9CH/YRvy0vPIs2uBiCb+yjaY5qa4FPy15qAR+KqlcQYuCWX7VwAN3seGQF5v7tOkp3YUEt2WA/8SuTGA28KYdoaosdxFOFU3yx7vsCPkkYndBsdibEbhyuP17l+U3i1GNvGUI47Cdz2BGJtxoVPzephkkzCpUtvw/CazU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(39850400004)(136003)(6486002)(107886003)(1076003)(478600001)(2906002)(83380400001)(44832011)(2616005)(6506007)(36756003)(38100700002)(38350700002)(86362001)(4326008)(66476007)(66946007)(8936002)(186003)(66556008)(5660300002)(6512007)(6666004)(52116002)(26005)(8676002)(316002)(6916009)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UQBORwu5Oib9XFxtAEWGkWPlxntvg5RLcJzabgzHdKEEuSjflKml55efsFx6?=
 =?us-ascii?Q?Ez+8Bhq1PAt9XRntEVXtkDmvgePFk0TgdqBvriiplbHBIxnV4LxOBBnUvGGw?=
 =?us-ascii?Q?SPXquG7nHoCsdrGJA1dYcag/8r6TLzgwmbIgeV+MftYBjyNbUWkPqT4rYro1?=
 =?us-ascii?Q?xDbc7XyYkn/i7EqMZKV7zQSJm7Ix+YFgbN5TmWcGTbx5B85RbikYcSyf3UeE?=
 =?us-ascii?Q?7ki7h212MDa+rAcIyf15LSX4U+qIQ/W/Z8ukkjlBupAJQnU0iQaAgT/Nv767?=
 =?us-ascii?Q?dKNK80+LFTv82kRnFTQpfeXGp4wcqFcgHuOPeDCOdaoPk3rWvS6Yh4vOtviM?=
 =?us-ascii?Q?5Yh71s+NQhPg4qhp+QMt/HORNM0ayc6iQc8VBe2wNLnkVg6mS41OFZtMrvU/?=
 =?us-ascii?Q?EkM7mmUqizqavffitgQsEIqCmDe478sLxIdxi8pJTl2Bcv8HMuju2iiSkxVb?=
 =?us-ascii?Q?aYc4go0SLIi62mtJVfWBRh8idkBIVsI6zmCdqjW1qSYaVdvbzQ8RtdJWiTU7?=
 =?us-ascii?Q?nBnHrVVqKk5/NdA/hV4ziOMIPUgKPaehfShykeh5wCe5zbXJmyuNqOkGczoS?=
 =?us-ascii?Q?WXXfJCJhrbmx8w9FxL1f64M8ykM1kc5pLhh4fpfL2TBKYWH9hStah3QK0NX4?=
 =?us-ascii?Q?PfKoYRV1jTI6ndqcBxBaVMaDeYQT1CrcSmqN0WaYa24H6Tc6gROxi0TwBf2F?=
 =?us-ascii?Q?0Ghqxo4dGqNN+YRfk90vgXnHNwzbP5XJPkAMj0NtXMGnYmsWx2mD9Wad4O9J?=
 =?us-ascii?Q?coC5TDbDrl89l5GeJ0HX4Rh95+PvImB8frfUlVIGuCcDen67kiCcXABYW3Mf?=
 =?us-ascii?Q?Y1qndbWDHasiaT3HdvY8bTkPvHmh+shaaotipfTeSNZe94/LfzhFBMtwZ5iD?=
 =?us-ascii?Q?0+fvSkMwQWbqP2iyaspOZ6prQ3TknTPdbHbbisAIW60TSt3tdiautRWb/kjQ?=
 =?us-ascii?Q?DobErsSfKQ3oIOdtl9DEH4B+lZoid7KR8z39YIr6KsuKmV8bHdosl7wyAvrB?=
 =?us-ascii?Q?i0mKpsy0hv2l9stJgwqBBGwmZ/NniGClM4IIslPaVtpx+H7cA74qMT4roekU?=
 =?us-ascii?Q?tMwPy/YqeI38vNcE9056xbFDDBQFJTNxdTKzyR+qitCLqgRcrD8ftKDk14N/?=
 =?us-ascii?Q?p2MvHJl+4UT4oR2YkB+qrcy1exAWWQYh47tRGvWP7avxbg5L958Zt9xyyizl?=
 =?us-ascii?Q?4yYPcUCVHypvel1MzhfMfskMBWXEOesOcMHIPSpvm46W2O6Lh/eouVUjH/Dk?=
 =?us-ascii?Q?evjDU8u7/AcXE+KOZF6hYJI0G9Yqdptum1QphuN2uxrZErUEvRZRdQYvcFP/?=
 =?us-ascii?Q?2FPyu1vBCNk2bS956vSBJV5A?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8269e9-9bd1-4a53-0ec3-08d96815aa89
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 22:14:11.6525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nsiJ53F7iIFGAw0jpXXdXi0D1eAPQbMul2IkanR4lRIp2G0DlEyyZmMNsmmP7129WyISi+sBm2hivXvNdCvyb3p7bCkZIcDziilT7FJrnAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3592
X-Proofpoint-GUID: 3SbLlgmIFjM7JnAtGGUUjsNvqOuqk2sJ
X-Proofpoint-ORIG-GUID: 3SbLlgmIFjM7JnAtGGUUjsNvqOuqk2sJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-25_08,2021-08-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108250131
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Mitigate pathname truncation when installing in a project
with a very long pathname.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 ...pkgdata-increase-command-buffer-size.patch | 46 +++++++++++++++++++
 meta/recipes-support/icu/icu_68.2.bb          |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch

diff --git a/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch b/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch
new file mode 100644
index 0000000000..a5483568bb
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch
@@ -0,0 +1,46 @@
+From ab6b1acdeed76899f8227c38ab7e7675c7673ff1 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Thu, 5 Aug 2021 09:23:48 -0700
+Subject: [PATCH 1/1] pkgdata: increase command buffer size
+
+Make cmd LARGE_BUFFER_SIZE to avoid pathname truncation
+when install paths are longer than about 150 characters.
+
+https://unicode-org.atlassian.net/browse/ICU-21702 has been
+created to address this issue and error reporting.
+
+Upstream-Status: Submitted [ICU-21702 opened]
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

