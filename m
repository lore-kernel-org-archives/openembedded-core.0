Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.42147.1628886271209616109
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 13:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rTzVkPNu;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3859fa1769=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17DJdmBA015761
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 20:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=4yUWJTJCGYaRLOEALsQTnlPaBXIQCGuw5t9wjdWluYk=;
 b=rTzVkPNuSRdqiPuk6fRGfX0qjWA9BeNZ9qsQY0CrzJ0JPeY9Ka2pqJFAozoJAavaI5Qg
 gkz5VKIrvxqzD+kA4alFkoVSIojyhshAXmfVDcodes8fcnTNy+m19oujIa4vA+Q7EuGs
 O7Ubd8jrTsNP0akH6A1AgFuYrsEBb3wZ+ugky5m6KGKfVfZ0ZMN35qUh2QmsJzZo4JVf
 vXQ93nQRVmlDdLoidX9umjsQJkPq7Ey8HppJ+isFySG5Bur3AbpZLr/JImRzd5Hg8x2l
 T7A8Pz0nuequrqU3xvc3g/F054Uv9aB1ESm3egEvohaamTjh34S1N4eZUkaTJb1nYpuO Ew== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com with ESMTP id 3adm0n0f01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 20:24:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afGliJlJy2Wmc2Io+yfkMTff4cGtFp4FneKWafjsUMqhIBeSwd2n0014wR2qvclOvNpDm2EUpvmYcVj6avEx6yiUmuB6dNo/YOWn8+9Sd+dox9XENbQMp42v8DXXWYzXi+tB5YF6wStqhOJT+/z0bJta+UhOWrbugt6GxHNvziSg5gRod7BddSZOzCaTXlI+Jn7JmBwdNh8kjmGtPZzFyNjS2aL2sJOWHzfxkFnkZ2LBjw/7tXHba/PCpvUB5pREgTvaZ28cKdHc8RcfgsnwakStIuWed9yZ44yvRrbihjF3xBH4ZUd3tu/AhZOhTF6EAiY15hp4JbU6jnISE4/8Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yUWJTJCGYaRLOEALsQTnlPaBXIQCGuw5t9wjdWluYk=;
 b=QOxAy3zbPuzcfCTFpcKWzxOAit1lpZrRf+hW2uSFr9+uqu6H4c1/GJweHE4qviQkb5Q9ikaVRFNon0VUB24NwRW1/GGr2FQsXyTDJXY6GDlrIhiWbj1EYGvqEfPXzTJ8bUQxRCrM0VH3o7yN89A7SvgjtRlVhs6ZymgGYKU8fWBCMcts2lUxrvQVcnUtGsaqUQfzAQ5qWIAugg0lVIJr+LaxOFUalUOm7a2IYtXE+crDELBu9XE//2Y63TCZReSzHfOZ4B4YgbgovwCS/1B30qGxGiodj5EZqkiuZPrcfXeV7o9b3zybV3xryFx2ehM3IkJVJer1rll7QVPWwGXlzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB2936.namprd11.prod.outlook.com (2603:10b6:a03:8c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Fri, 13 Aug
 2021 20:24:28 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4%4]) with mapi id 15.20.4415.017; Fri, 13 Aug 2021
 20:24:28 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][PATCH 1/1] blktrace: add rdepends
Date: Fri, 13 Aug 2021 13:24:16 -0700
Message-Id: <20210813202416.138888-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: SJ0PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::31) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by SJ0PR13CA0086.namprd13.prod.outlook.com (2603:10b6:a03:2c4::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.9 via Frontend Transport; Fri, 13 Aug 2021 20:24:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e7e5218-0ead-4036-5f74-08d95e985960
X-MS-TrafficTypeDiagnostic: BYAPR11MB2936:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2936CDB5CE0B138259605E3E88FA9@BYAPR11MB2936.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ug+OD6ug17A9vw7nHFV0ifvNVjqsHSSmE8EZk6ElL0X7vCXj7P9NZ/6CLi/URQC010464QMq+gjQ3EVdBSyFrRKbsjAgezvMCnWCDYQw8DgExKbtuWYxRR5MELDMiIiBFc+qzg6sn8EmFKd39y3TKWlLELHG+Em8dUkStssn5fppugvWvb3A75ss/7DFViHf2/Rx18F0KcMvBSkIktQEiNNKCbN6wwVoH6hW+/z4VvRYrLQpHbfko0DheAmr02wNw/XaLuoW3R5zuD2o1xXvY6QUlcNhNfv3AkTQ91U1J+0lkbzEh+gi+guM0y6YctJtItLd35F5Dqk5ypowyJoaN++U/+SoM7Syb6AzPmX3QOUuvr7CvgPkGeZ7fqH3CktTxBXoLHgsrlYS1WM67k5UFTOw72Ag8RMcaJqXEWs0a2UB54cYgi53/nTda/tr+68vBqlP/toW6UHRRLDgHuICMNQ92vhWacOBKEoGNq8n0cqHmU0ztfIiqjBljGn4ixsOivnH27n2GgehTjs+z0MexZrQ5YUMSWBNh2Gh382ERL5RwqZYYTpdYRyajxMdN41Aho3D54wJkUIPNxVVuMCYJ5Isq9i2/5DcMVXQau+gTzHPKdupY9CoNFvVaLZJssXiRpI06VoIhgeONDsEc7F985SWluE6UA9UVbK7zAZvFm2PAbSbaLf6yOUHbczAMiFCQjXCVT7lAJBEupEbqnzvvQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(366004)(396003)(376002)(1076003)(956004)(2616005)(44832011)(8676002)(4326008)(2906002)(26005)(38100700002)(52116002)(6512007)(86362001)(6666004)(316002)(6506007)(478600001)(6916009)(8936002)(66476007)(36756003)(107886003)(38350700002)(83380400001)(6486002)(186003)(66946007)(5660300002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AKM1pg8Ig3uKc93wtWvj7ccRpgS/V1FqCYUIkOoYDNst0qD7jeO+fnXS64cq?=
 =?us-ascii?Q?E5qoEUXzaRPq6rvipYGAdIb5WCOyLyKvtiLOecl3ufb9zHt+ni2/V3o+eQzS?=
 =?us-ascii?Q?kG4iMJ/hAUAtelBFdrlZVTvMY3BLIZhyyy+Mt1sbtAKBNdJ/3Wnwdn4fKgHW?=
 =?us-ascii?Q?TqQ7KZUHkrQoZ/CLLNPrUZ84i9wRD8c2510EMUgHtR6FzTfiOh6T9q+bryZa?=
 =?us-ascii?Q?qz3j91STmA14Wja8vNDCshAWyiPe/06XvtwypprdlyAMyqPxmQj+fnfwLmgJ?=
 =?us-ascii?Q?Q8ibAMw76A9I1I3O3jqhcp4o6/8y5VlS7wCOMZvIwq60dh3zEanf0xVtX0TX?=
 =?us-ascii?Q?hEfMLInnipJBXXp2WiiYr62a30SOSOz6Y1VE3u5bK/CSRcfjs1uebQCA8Gym?=
 =?us-ascii?Q?vFO0ahX8RMVS6daA8DAUTNp0/xPIxem7WSBLR6+MDWYuv0+KCNj6wjQ/GMcC?=
 =?us-ascii?Q?eHBoEfon1LlLfw+ntz8XP96ComIPwISpd84wG2kb4gJs2pr/hCAB4vrYF/6R?=
 =?us-ascii?Q?fR+BeBqJlrkW6c7BtSU2i9ThWG4mV40EMNRneuUSDHxOzHStflKl3LDwXEK4?=
 =?us-ascii?Q?uvd9EKspVUXObmDYs6ZK53WxGV9sJz40XkXjfotLAEhEK9anLRkjMMFYC4Bd?=
 =?us-ascii?Q?X8BYP1elmclM8ySu/A0Mauo4L+dHDUhhlPBYg3v4GQCQ/w1RlnuL5c2cIAyE?=
 =?us-ascii?Q?yGma8D6QDWGjKorYhg1ALohJrVG6RCpkAAZCsa+/B/RheqLxo4mC7v4UA524?=
 =?us-ascii?Q?Flqc4MoLmpshG00IRXdGtfR77fLaBFDrLt6rZODurn3Lu59R8vdyGMv52lZF?=
 =?us-ascii?Q?3/cr6Fje9diQZpNWXkKc1+hoe7jcrkBlVe1zHKbjwQ9IPp2D82yOIh+wdU/f?=
 =?us-ascii?Q?/uzO1l8SMazJoS2Y7Wt4QH4hg/hKmHjYQRbhUpjX9Q4veWWKqf/hE79quuPP?=
 =?us-ascii?Q?JsiHoeLaKZMGTE5eqa/xnevy69jdPPPRjLzrks+svm3+ZcjCdVT6ZEcbtHe8?=
 =?us-ascii?Q?Y/Pwq/hOtUzLrbvAgM4UG0CwyEi0WXkZuCHdMRdoTygSCSnKhfbZN+mJn6GL?=
 =?us-ascii?Q?Ju0k7ncsVnqJZkhxGDB4WdHZhEHcnvMHeVGyO5vtUWr5nTzRzY9wqbSPKzxB?=
 =?us-ascii?Q?zTBfmrtHgBNJ5leNkRigpH2zeS3ifSdAYkNUiyd7/vGKnnDtQr7OAN6DR7fa?=
 =?us-ascii?Q?EVzKdLluGBQXyD0qcZNKqM4TvQ3sVS/RDvWRWpSTOe7ItqKzIGYfZ9TB+uWC?=
 =?us-ascii?Q?70CRquogauc7lcg4bSYrEFW1XP0HS6xCvGchNdk+LvnLbJJ2JUEsPn9JCr1b?=
 =?us-ascii?Q?Q3zZt68n1ZPHP1/Qpn6LOJjW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7e5218-0ead-4036-5f74-08d95e985960
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 20:24:28.0082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gosd4aPG/ayrq2o5qSAjtCqglXPOCpPEL8VI0qQBawP5S3Ps/pzTeBuM/wnGae+NtdhykKRxwjRalICARQ8G38kTMbK9NW0Q+WI32J1y5YM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2936
X-Proofpoint-ORIG-GUID: wDD-OqB_Di2lHtP3_1gJDIAHnrpgMV4f
X-Proofpoint-GUID: wDD-OqB_Di2lHtP3_1gJDIAHnrpgMV4f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-13_07,2021-08-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=421 impostorscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108130117
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

bno_plot.py uses gnuplot.  Also change shebangs to
python3 because we do not support python2.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-kernel/blktrace/blktrace_git.bb  |  6 +++-
 .../blktrace/files/python3-shebangs.patch     | 30 +++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/blktrace/files/python3-shebangs.patch

diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index d00b1bd0be..36ce282481 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -10,11 +10,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "libaio"
 
+RDEPENDS:${PN} += "gnuplot"
+
 SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
 
 PV = "1.3.0+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.dk/blktrace.git"
+SRC_URI = "git://git.kernel.dk/blktrace.git \
+           file://python3-shebangs.patch \
+          "
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/blktrace/files/python3-shebangs.patch b/meta/recipes-kernel/blktrace/files/python3-shebangs.patch
new file mode 100644
index 0000000000..70a35c2c3a
--- /dev/null
+++ b/meta/recipes-kernel/blktrace/files/python3-shebangs.patch
@@ -0,0 +1,30 @@
+blktrace: Use python3 shebangs
+
+blktrace can use either python2 or python3, but we really want
+python3, so modify the shebangs.
+
+Upstream-Status: pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com.
+
+
+diff --git a/btt/bno_plot.py b/btt/bno_plot.py
+index 3aa4e19..d7d7159 100644
+--- a/btt/bno_plot.py
++++ b/btt/bno_plot.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # btt blkno plotting interface
+ #
+diff --git a/btt/btt_plot.py b/btt/btt_plot.py
+index 40bc71f..8620d31 100755
+--- a/btt/btt_plot.py
++++ b/btt/btt_plot.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ #
+ # btt_plot.py: Generate matplotlib plots for BTT generate data files
+ #
-- 
2.25.1

