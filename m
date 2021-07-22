Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.2922.1626986627602478704
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 13:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Xoe8MOOm;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2837e0545f=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16MKdBpx030365
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 13:43:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=kcdXBaISUhrJBhBa6R7vxvD1LDgbLJ82u5vj4vV7AUQ=;
 b=Xoe8MOOmEl+C/xf2gLxuhGVWeSLsrLciiZrJY7ON6c97Aa+6OOXa1gh1jiyXO0qEfcrx
 pP1XFOk/3aQLvEi4LJGoHFTzPspZoY7j+kUOdUy2dnRuC3CaytXntxpTfdLeOHGhzJ1O
 piXdnKT59cPHMrfDVv9ggcThPnoQQlwIJNFwOWXsiitGyZPhOPSjVBbhzlkYURQwBDGn
 heM/EvsvOEm1SYbTgSZR0/OGLt1HSojHY9tRgoIuyJ9z4YC5Aw7dQPcYrznM3cP/y5Y4
 DcUoRgqHFYEi8yaIpJVwElo4Dz/4iqXqkORl/2tMcL+CnbHpMKyXzf85AZQhsjamsugP vw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 39y66p8g20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 13:43:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzh3umuc7CBiLwMnDtTHaBzZ3XVss9hcLQ4omn9Yv/ujqA261FJnGNXrbNLz9+iL+zMx/rwJDtsnL+d/8PgU0j0Px3NX4TC9eC3UrayWe+RdsSXHKgz7/Y7ZhFSwIIZL9nF1vVXiL16F3qqFjvnsb2HYoPijeXxoD6dItD2sqfYKwZyh3CtMMmTCbM08o86DibB67CED1Jg7avc1d7tdacxNM/b3gFQjF6ro/2Pc8J+l/yipPZGtc+ohG2Q9eT9KXxXeBc+QZ+qR8G+m1PrmN6JmSafve6a2Mf29yrDb4LjgoDxgG7oM11z5OvNyJqtq+ND163yPtKm0emqULtJX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kcdXBaISUhrJBhBa6R7vxvD1LDgbLJ82u5vj4vV7AUQ=;
 b=gGpNhyyxO3LuAahdDAMPlqpka3K4nwbA4MmrfeUEQbGuQbd2M6OR96Wm0OzKdDB9uwRji1JE5KrJau6fOMEKtAdBTkMvQv5qetNXKN5gAOUHZ6/PPTX3EwZJFCia5nj2jZjhUqoZWKvxDij9XiOqJaIXCY/oAB68mJLp1FzyXFq5UdV3+QNuLdU6PBJ5FMkjAz7ulnRqcWOoAswsx3+UTHz6F3wDwBs1QI9nlVz9dT2eL6BNmaU8F7TdL31R/DtZvQoeGs4UC/9Lg5qRHCRvesvvYWuA9VSU/snl6F7CaGZ54QwhQXaBPej++uTfrTh8WvVGmqbIXUPfC+EBh8O9ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Thu, 22 Jul
 2021 20:43:44 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::1dda:f315:a48c:fd4]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::1dda:f315:a48c:fd4%4]) with mapi id 15.20.4352.026; Thu, 22 Jul 2021
 20:43:43 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][hardknott][PATCH] python3-pip: fix CVE-2021-3572
Date: Thu, 22 Jul 2021 16:43:29 -0400
Message-Id: <20210722204329.159765-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0::f245) by YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend Transport; Thu, 22 Jul 2021 20:43:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6884974d-a3c8-4f25-7001-08d94d516529
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB489605856AF970C39B52DEF59FE49@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/aAsEl1o/IfOciZDrPOXRA+Ii3AhRXSzOCCIrOjXm3bg+DLc57chJssPjvJykzAtY5obSljaItgvdKbT1FTyqIoiQW6iYHXlS+huYaeF9hNgykaNsHgaVK+2rCWpQv/DVkRCXGaBOW6IJ8N770YwK48H4bkMVLJAiFw3R1lyDOsBA0kZXt0IM8RtlnhfCp445ai/UDGmAGdu292lWES/LQb7J6YJbiEojTe8+MXAjaKT/DiJCHinf3fjUPeelYfj7cGVIjAHJtin4lJj6DKWFW1yvlNSNzS4obJLxewTxaMNON9ydpeIJ5ZGEgRGHGSJauWzpEPk8amA6ARUShNWlu/L47XVkApnbp7kvSYLkKW8kRjcX4Bjgb4epmCF5Lz9e235I7I8X4iK2l1NQpHITAC2ly2zaZlxXUHGXrF+1fNxQzwE3xX7YZuK88yPsQkqENlgndTs05j65Khgmn5QE2Y6qayxszZM48gBHTIZtVfjfaCK56FEEZP1hSpVxEHRi94/mdX671amG6M12hVnpyAHltvSirQ9Iz3Gv0fW5nigi6r9q9Otj7G7drZWBNhfwJ/HNRtRc3YYJhk6zKvKyPmkqsIpkM5xYZ2owFNndWn2GNJzMKJsRvSko/7WNjDcNJlae4AiJEOXh6oKogPsr6JqktJRkx8QtfpZUz32SyYCxyBCQWqy85UwEO94HjJFbs4p6QxSw11Zb1fGUYQ/2G+SFNc68pKLjZ+SYIv50ZU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(366004)(376002)(346002)(6512007)(5660300002)(52116002)(8676002)(66476007)(66946007)(6506007)(6916009)(86362001)(44832011)(186003)(8936002)(6486002)(2906002)(36756003)(2616005)(1076003)(478600001)(316002)(6666004)(66556008)(38100700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xr9a3Si3cvMtuKQ+TaK1FQKQZlWUjoOCHZs2Irh+OsB58JHm2qAw1B4XNWRD?=
 =?us-ascii?Q?qPiv54NF+nhYIh641lZ/sIajB+QWLLoUttWjqEH4Ufps9U44byOm2l+31KD9?=
 =?us-ascii?Q?XBPkInL62NnRnUCXykoOiIV4kAEiWc1d92LGJqSGOTxuagLWB5VmOy65KkYH?=
 =?us-ascii?Q?66kEDV/UgG5IySacdOmE7nuK38+2Q3eFntoHav0t00POJLtFLy6dWEMurF8N?=
 =?us-ascii?Q?lcHSgfo+tTZ6crYrjbG2nDjqQyTkBXhcvZEAWbDerNG/fP05fto7LU9DNlPA?=
 =?us-ascii?Q?BIsqgA1f5ncz15qrK16NE+EtbuTkfdMPnyLpp/zmcKFElq6oIvfkKVZSK5fJ?=
 =?us-ascii?Q?nh7CJKcT5UiS6wVOa2vOsXvzoTLOOF0Gi9WLO/bgF0Rf4yopr9qBOYla7Hps?=
 =?us-ascii?Q?0V5NBatbrr2PR8rayDx/KYxCq0eaxthIvBbUszLlU+v018ELm7EwhRiCKnVa?=
 =?us-ascii?Q?31NuzDIxcveU2mFIuCG02eJkqkla47XuWwa8uH6B6n8BQXrZwM5Oz6DD86VZ?=
 =?us-ascii?Q?01oXF5SD5wRm6Jyb5BxO8rTQXnZQHt1XjiYHrLW3ziqwo5aRnJnutVctgsqm?=
 =?us-ascii?Q?fA+iWQyPlm2fdHRrHlHA6dKIhLjnmD5NveRSjVjicuxX0TdJP25q+VLvpgVA?=
 =?us-ascii?Q?OR4cZnmKQwt7u/LzJlq8ATtNflDgwPSCUALPJ8U+RxQlGbZyp9FzkfTgTJIe?=
 =?us-ascii?Q?smXMvUa/0i8V80DcFoecPYBoqGdt4vkl8ah887dsM/chD38AdSLjwdF+lZpe?=
 =?us-ascii?Q?15xzZKo4muwuWlCpnV9DgJRJ2zwKGq87ocZx/XGpBRIGySMWSrn9LBpi6gju?=
 =?us-ascii?Q?FxYUbrHlyNR0IWmhoa3TEzfrBD/PtsZEpfzygteKhU1CtD57ja3T/bsXdAY+?=
 =?us-ascii?Q?/kF+Miy+DIVTqqDHYi5W9aVmL1nrgCz8ReC3uSRnMWlEOrsf34vf5ZF+L6s1?=
 =?us-ascii?Q?R53ogM3AHCshgY+clo4GjzSq7UUFZQ8tXatvzINlwTgYZnlnE5aIhLAPXW+n?=
 =?us-ascii?Q?u8mz/mamuH53GkdcLyoNqM6LxWi8TWw/edfYnIvHCVfOfqXfHecmg3WuRssO?=
 =?us-ascii?Q?tfnNBKMtTZq/jnzSn9ERiH10TFWSJ02EwOtPz9la5+tsOAZtjmKDX0wRPhTX?=
 =?us-ascii?Q?fC5gQtxGHMgA6Ak+4CiTNozwv0X5bDcGKlt+LE1ooTejV2FpsFj1UbQbVxW6?=
 =?us-ascii?Q?lT2cHaGVPBS3czKuK/FvXy5ZAOrqOCAaLgzfo8OgNwkqHfBBYEovZh5GXvqV?=
 =?us-ascii?Q?MT4yEeeurKJvEUrN7NtMLdyxBpK9aDH9cpbSBwVLW0/uiTzfPnu9SW/kGJZ2?=
 =?us-ascii?Q?Tfp01NU5o6DjOjT+zEKWgG35LGR981qhY/hWNE0XuxDkuQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6884974d-a3c8-4f25-7001-08d94d516529
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 20:43:43.6528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HEyC6pLrr4Qr6xatNLPYWwPrCeccvjyNm4jw8HKWmxrU9tbiwFpdxhNbcnBrw+RFTYPJpgwnlMqPkUwNOIT2D9/O7fYRi6DsSBoPLjJczk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
X-Proofpoint-GUID: ZwUYRsIGxJQWCDKSEyPlaJlqW5zMYLcl
X-Proofpoint-ORIG-GUID: ZwUYRsIGxJQWCDKSEyPlaJlqW5zMYLcl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-22_12,2021-07-22_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107220135
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport the body of a fix for CVE-2021-3572 since hardknott carries
20.0.2, and the delta between it and the latest 21.1.3 is more than just
bugfixes.

CVE: CVE-2021-3572

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...git-references-on-unicode-separators.patch | 40 +++++++++++++++++++
 .../python/python3-pip_20.0.2.bb              |  4 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/0001-Don-t-split-git-references-on-unicode-separators.patch

diff --git a/meta/recipes-devtools/python/python3-pip/0001-Don-t-split-git-references-on-unicode-separators.patch b/meta/recipes-devtools/python/python3-pip/0001-Don-t-split-git-references-on-unicode-separators.patch
new file mode 100644
index 0000000000..f85353668a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/0001-Don-t-split-git-references-on-unicode-separators.patch
@@ -0,0 +1,40 @@
+From 25c1b92b1add0b81afe2fc6f9e82f66738a2d800 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Thu, 22 Jul 2021 09:57:53 -0400
+Subject: [PATCH] Don't split git references on unicode separators
+
+Upstream-Status: Backport 
+(https://github.com/pypa/pip/commit/e46bdda9711392fec0c45c1175bae6db847cb30b)
+
+CVE: CVE-2021-3572
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ src/pip/_internal/vcs/git.py | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/pip/_internal/vcs/git.py b/src/pip/_internal/vcs/git.py
+index 7483303a9..d706064e7 100644
+--- a/src/pip/_internal/vcs/git.py
++++ b/src/pip/_internal/vcs/git.py
+@@ -137,9 +137,15 @@ class Git(VersionControl):
+         output = cls.run_command(['show-ref', rev], cwd=dest,
+                                  show_stdout=False, on_returncode='ignore')
+         refs = {}
+-        for line in output.strip().splitlines():
++        # NOTE: We do not use splitlines here since that would split on other
++        #       unicode separators, which can be maliciously used to install a
++        #       different revision.
++        for line in output.strip().split("\n"):
++            line = line.rstrip("\r")
++            if not line:
++                continue
+             try:
+-                sha, ref = line.split()
++                sha, ref = line.split(" ", maxsplit=2)
+             except ValueError:
+                 # Include the offending line to simplify troubleshooting if
+                 # this error ever occurs.
+-- 
+2.31.1
+
diff --git a/meta/recipes-devtools/python/python3-pip_20.0.2.bb b/meta/recipes-devtools/python/python3-pip_20.0.2.bb
index 99eeea2edf..9242d0e82e 100644
--- a/meta/recipes-devtools/python/python3-pip_20.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_20.0.2.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
 DEPENDS += "python3 python3-setuptools-native"
 
-SRC_URI += "file://0001-change-shebang-to-python3.patch"
+SRC_URI += "file://0001-change-shebang-to-python3.patch \
+            file://0001-Don-t-split-git-references-on-unicode-separators.patch \
+            "
 
 SRC_URI[md5sum] = "7d42ba49b809604f0df3d55df1c3fd86"
 SRC_URI[sha256sum] = "7db0c8ea4c7ea51c8049640e8e6e7fde949de672bfa4949920675563a5a6967f"
-- 
2.31.1

