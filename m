Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5673.1628587675635972737
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 02:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=U9zXHwNC;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3856d61800=dragos.panait@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17A98tSJ015663
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 02:27:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=nIcNoMLS8/DYUMH8kyNNsfijqyVfOFPi/+cGYfwJM48=;
 b=U9zXHwNCsSQFlfvRmIZzS+qtrROBNrkB0iYqHIVPcmp+bmoRL7UGYsaBTerp2CXtncrO
 eN3pDC6mLxCyjFQODj3ietcX5oirnNi/tB7tbXIJeYdt0E22/GcSUgp/vWlypgsCpZgK
 C+naIeUUsKqy1fCM16ZxvHG6/tav5LHLu2xJewcWj0V24gn7toBm8c6rpoMI6jtW08Nl
 ZMqS5frOBrXVoE7URPavtCSbcMab/ch8r/LZvwcBZavf1VMfek80ArEZS6wpcz8Orqip
 0wtHB5+FBIP7QPvmWTYzKzhl8RRkvA50fL4h9zwsnjSJcUDdbWes/HwDzS+V2z80WUeB rw== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com with ESMTP id 3abjr3g4en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 02:27:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmfBPFpsa3pyFoS2MTmUvB68L6EV3MeBrFc99bgabp3x3Vxorow3nH6r8Y8dXSp5F+u25jD2BaO6UJX461Y4KG7xKI7/PxN6jtiWoqyMXOSHdAAMllRDaEGxifHihFID+EQep650myPmwDkhLYCiLlQuX+ftLPUorTH+vwQHqhq0mElESnB6t/U3mEkwokBAKHXPmiaeSWiIRBiasa2zWmDdVvizdQbzmUsAMBwhrPwry7qWoTvwR1iovKDiDYP1JB1TnVhua/m6V+Y3jgInJJLeST3jtII9DjoN3KkwYJEXwJMgOxj58CENO5olqxS5LKHjovU+YyX3OL91/dJ0Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIcNoMLS8/DYUMH8kyNNsfijqyVfOFPi/+cGYfwJM48=;
 b=I0G97ZMJKw9k5djKYheIwksSxv+U89RnFH9/PQEzFSKSJRbk+dGzM/tz0OV6tEYh/HXThsVkBbkOyvuEBtWiLlaGJYEAWIWL26PulVXv788BlyB2wZ6sPTjQTFcArlQGCdFkDvrhVWuQ70E5dLur3yNO4polBMhG780Y6Im/wf0rmfM516jgX0OXw2qM52+ayXoujmCF+VCY8Xir9s+tQ8paQbLNN1O16TWAM7ay7NSkvmp5h49/LE2waoZrYgchQj7dh0o7iGLjBA2RC5E4MV0bHv4/5Q/LN1b8FZaGwaa3iQFX16scVaCU5xvoLEwCsagVFI1rkfhOvHfG83fzdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by PH0PR11MB5080.namprd11.prod.outlook.com (2603:10b6:510:3f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Tue, 10 Aug
 2021 09:27:52 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::5024:6607:6373:2e80]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::5024:6607:6373:2e80%5]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 09:27:52 +0000
From: "Dragos-Marian Panait" <dragos.panait@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] util-linux: fix CVE-2021-37600
Date: Tue, 10 Aug 2021 12:27:34 +0300
Message-Id: <20210810092734.1667299-1-dragos.panait@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: VI1PR08CA0240.eurprd08.prod.outlook.com
 (2603:10a6:802:15::49) To PH0PR11MB4952.namprd11.prod.outlook.com
 (2603:10b6:510:40::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from otp-dpanait-l2.corp.ad.wrs.com (46.97.150.20) by VI1PR08CA0240.eurprd08.prod.outlook.com (2603:10a6:802:15::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Tue, 10 Aug 2021 09:27:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c1bac7e-f101-46ec-b051-08d95be12062
X-MS-TrafficTypeDiagnostic: PH0PR11MB5080:
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB508002C4893149E87E8FC382FAF79@PH0PR11MB5080.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nROkvRhxX9N+nOkzScoPzC7uU9pcI7bNtxn5lvGl76Z1xTmYbXPWH59DeXAfNa5OOWYSgTv31FCq6zyJmOiiLwZx0Z7+80Pt5hu4JUHTTCL0WsUDC1+6hLiRqrYOvxeYSWgRJyHliRX72sQcwSjFZTp+BMGF9JDDNd88uquQbQ19a04sHxq8SKH8mBE8u4SpClXb1nZWWLeVTfjz3LGyCSq+Ei5P5Uo2EEXNYBpc1te4uttX8QTXdybmuUJegbD6o8pDLu3EIfjRqyBqLw31foc7JPvp4xhsxJR55SOP6SKds7K5Cq4ldErzUUcW4Y9jRXljFYEKtrJYDyGFFBfZqRwNBwNRBQFkmLXuWJD/Ix5yHcvYEoHj+SlKF55GQ86nMDWEeO9fIJlms4bM4CozT7OWx0aFwQSigXkVR+MZL7+mmI+x/hopZsJ+VEGRIvpbTw6pAayHem3OrlioOyZFkthNvXhHb/HfxgNOM7M4aAkXu0UxmG9H/BgTsQYzywyYTTYxqt5AqIfyabM+O7CpkN5M+WYsIgoPpmYg7LhrqWEm7WxcgSVhJX7g9a6Rb+z3qFpbdJqe053rHywxsO6wlyCgdX2bFI2HBP/TpV0R/jMAqyxnSlIt1VMEHrzwAfetVFjL+IewrN5ZFBDHUbqR/elolYNkzEiPx2UI9MfA0JH5KP5nffAXZ/ges5jsmVB9aCcVls+ZNp/ZmCL53MJz8vHiw5/fevuFxOXtiX6hZElIv5aHPtMfKFYs7WPteKKrPZ1MiQw1rO0qes+H8LqYng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(346002)(376002)(136003)(52116002)(6506007)(6666004)(5660300002)(38350700002)(956004)(86362001)(38100700002)(2616005)(316002)(6916009)(8676002)(966005)(6486002)(36756003)(66476007)(66556008)(66946007)(8936002)(6512007)(83380400001)(478600001)(186003)(26005)(2906002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JUdd31ZFN25IPAX4hqg4JfYFNSesO9C7d6pI8Dj+KH7Z0KKcUPUKdyk4lDrH?=
 =?us-ascii?Q?FgCDPBGhEs+oUQR/wTSjsgdsgEuSsD9EgZEEdMSkZ9jaoQzPbh3JeSVRB/G/?=
 =?us-ascii?Q?A+BWOGNVZK+BwTdPI9316c4NGqg61PrYEvcrNLEuwlzG6bigjZVJjbt4XNRm?=
 =?us-ascii?Q?pFdyJny0J2rX0pw69iag45zTCkTwpLK3+1bJDSkWYAovzKbk55rGAZPb4b7v?=
 =?us-ascii?Q?gVX2pNlxt7zGxpxhjPT5iUO3VrPu/ehQAo5s1aM+rFBEY4SokcnP+Vp54/Jv?=
 =?us-ascii?Q?oL6zqGkjCbBG4m4nUPX5MULMIQ28D9CZl7Yd7VXp2XWT4F2aJ1f6Skb8OaAA?=
 =?us-ascii?Q?PFrsx4XAfcABjRqZeWc4/99gTf0PmIOgVB/zjo6zDdBsyWfCPM6SH92Ugma6?=
 =?us-ascii?Q?09gpvoBEXS9ZsxFx/0OshZRGR9koHiXj+yopqeAvXC4sYEN1YUc0tsWlRWgy?=
 =?us-ascii?Q?fZSM6pOZQHrIS3NLwH/LI485SkUSjbXmuGecOzgd/sT68IRb/YuJvw3+bse9?=
 =?us-ascii?Q?UCjqnJhWhX7rOhf+Az8eOsIYxDMvGj7yiGpSU69wChn+5TEqSMvzACelbDks?=
 =?us-ascii?Q?67drZzMg8UcBd7NhRrUfq11bCj080O5q5hMcGAf3PayUOLzEfC6sYamg5Xc9?=
 =?us-ascii?Q?eGfWEGJOOU4iumSzxndq+jfCg66ESQdhqIYXokuXjqqFkJIssrJ6NUUfYlrf?=
 =?us-ascii?Q?0h1dxZc3J2JCBF5Wf05OLCpc6UT51iPWQTd/2Ae8jzFtzp59jYBRq0Fyjjt7?=
 =?us-ascii?Q?guPpsiZOpZcl+erb0rGVgg3/NF/6zLDCC6nHWWxIM7HOAlfKhRZBqxDM16Sa?=
 =?us-ascii?Q?kwSO9l8UCifhP/M/X1rOtN78jH90A3+A8/E9oY3KYLlGtTs9Ri5OxVQPC5Sk?=
 =?us-ascii?Q?gS1Wsz7aF+1IUgrOn43sN9sNloigrQLkJlL0zl7XMjlC1LvphpolaapjF5On?=
 =?us-ascii?Q?FCkCLmkc/Zb3pfluKNRDGXfCXrz+o/JkxL93/LXmCy57JvrqpBevQUOozabT?=
 =?us-ascii?Q?mcb2gGL/2kg2ibizx391Ti5eR8dz6xd5o3BLokhKIuJ8lakLyQuvvWdC3ctz?=
 =?us-ascii?Q?4efNqe2buMZ8jbNplVdVytNQXbrR0SptvwiH37TS5QUfjeSHBr7a84TzqvkB?=
 =?us-ascii?Q?cMnA2flguO1MaAumji6zGE4gNfABshwixFUZuRq2icWCPvCnDYv3oisTSocL?=
 =?us-ascii?Q?QG3r9XfDCgKNLU3fgjVZTmGENVqfJ72LwlifMj/v5A0Ir4zcX05G3Nzm67Jj?=
 =?us-ascii?Q?6pAVCjioWQKgItJHneXP2/3ee9NblVNPAbk2jCk4mXZfazQMuQCZIehC7PFe?=
 =?us-ascii?Q?UDVkFTOq9nLnmjQ6JXfZ5K7C?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1bac7e-f101-46ec-b051-08d95be12062
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 09:27:52.0037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PZjgnd2tI7b+qoF5UrYa2mJaUGAlsAJMBF7eygMsI5LadtpljbcccWs5gbRcsIZCqZV2y+l9TxKEsnClrBCgrDG06gUnD3bPqcBctCunuSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5080
X-Proofpoint-GUID: ruCGmTJ4uy8xNK5O1_6MvMfMM8fBRDMA
X-Proofpoint-ORIG-GUID: ruCGmTJ4uy8xNK5O1_6MvMfMM8fBRDMA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-10_03,2021-08-06_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108100059
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

sys-utils/ipcutils: be careful when call calloc() for uint64 nmembs

Fix: #1395
Signed-off-by: Karel Zak <kzak@redhat.com>

CVE: CVE-2021-37600
Upstream-Status: Backport [1c9143d0c1f979c3daf10e1c37b5b1e916c22a1c]

Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 .../util-linux/CVE-2021-37600.patch           | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index a76fb9e500..0f17c73e86 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -35,6 +35,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://run-ptest \
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
+           file://CVE-2021-37600.patch \
            "
 
 SRC_URI[sha256sum] = "8e4bd42053b726cf86eb4d13a73bc1d9225a2c2e1a2e0d2a891f1020f83e6b76"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch b/meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
new file mode 100644
index 0000000000..2b306c435b
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
@@ -0,0 +1,33 @@
+From 1c9143d0c1f979c3daf10e1c37b5b1e916c22a1c Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 27 Jul 2021 11:58:31 +0200
+Subject: [PATCH] sys-utils/ipcutils: be careful when call calloc() for uint64
+ nmembs
+
+Fix: https://github.com/karelzak/util-linux/issues/1395
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+CVE: CVE-2021-37600
+Upstream-Status: Backport [1c9143d0c1f979c3daf10e1c37b5b1e916c22a1c]
+
+Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
+---
+ sys-utils/ipcutils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sys-utils/ipcutils.c b/sys-utils/ipcutils.c
+index e784c4dcb..18868cfd3 100644
+--- a/sys-utils/ipcutils.c
++++ b/sys-utils/ipcutils.c
+@@ -218,7 +218,7 @@ static void get_sem_elements(struct sem_data *p)
+ {
+ 	size_t i;
+ 
+-	if (!p || !p->sem_nsems || p->sem_perm.id < 0)
++	if (!p || !p->sem_nsems || p->sem_nsems > SIZE_MAX || p->sem_perm.id < 0)
+ 		return;
+ 
+ 	p->elements = xcalloc(p->sem_nsems, sizeof(struct sem_elem));
+-- 
+2.25.1
+
-- 
2.25.1

