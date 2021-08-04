Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11994.1628096297842459883
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 09:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ae3JyoB4;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3850afccf5=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 174F3kJt030500
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Aug 2021 16:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=pnOYaeUjCAtrFnqTgfNAx59vPl2g/arvs36uxeoVqOc=;
 b=ae3JyoB4r9OSZ5Lz8c1GjE+YgGGGmCUkm9Md5gPkgu5xKLKVSecGFMaVo9ilktt1hYqy
 PVeuviPT9gZDkugiM56QGUSKv/fgcxawwucf9dSYZ68fntcdW84aeSS658/TM4iHXRUX
 yOu7GvH/Q3SQk2x0Fu1VgiOJO4C9pjZQPySbIMnO3zU78YjpsZJ1HsZDnfFsY9pEBBl/
 Xf2K7DlIZXoZTyqIW41ymbbisMlJ6SOUE99jYb+JyjfOQ1/1p8FPXs3BQysNB9DO4eJg
 +icOYPUaWOTXyOzJiz2GPVZ906ZPWVITrmKSiB4zN/QgchgqyGJykSfqmijtEnC7hpDU 0A== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a7w7182s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 16:58:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnuxWwrDEc8GUqaln0yynVnAt6MsNziMmLVupeq10LKTE3sIzmTSeyc6Rr6UiZQj/ekOdL5ewdn6pncHqThPNJapITd/V95Y+L9lNuBX4Bs4WUNPo62zO34hGCwzMcTRv+46Yc3dqeTMrYTex0ow042Gv/5a+l2fi5jawOI4BRjTd6/vIiHw7qyHrH2nhGReHMy2LoJpj+waOaAA8Nq9eGfaWfx9+TlmQ7sEZmT8RVLNHhovw58Aey389Py9cS4LyviRT4pqcpALc3hI44GQCEdBpFLRTuAPhkEFXZh1vZ+XoAuoZAdxRPhONhqFICvDSODCFrb9nM+E30jBp1XxuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnOYaeUjCAtrFnqTgfNAx59vPl2g/arvs36uxeoVqOc=;
 b=Yz6Ep/prMyUrYfybbFGuHAfrhHuD6v8wHCtGoMzhpnOLsYHYDN2LIiO88XnePUWwPJhAeLf5izrBkMffGN2/dPF/wRt9qWPkX4v63MIEZjYrDL803+03xmZqg0prH97LL51pFd0z1ctHAzAOX/wbW9E0PvuSnUBC1uOAAMLmPnIKSkNiQFSnzCMhKqubNUguXFt7Ut6jCwjlmvRobffkj6j75mzhx4W6gmVQ6gwgF5Lo4EHOi+ZTrGZssgnULtu9zgU6y1iNJECJBHSXdJjFlasFaj8FtaNpH6xXQCuFy8gbBFurop08oXR6++0ZUGoazVaWlPNwu/OvFdtuHgCYLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by SJ0PR11MB4992.namprd11.prod.outlook.com (2603:10b6:a03:2d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 16:58:08 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4%4]) with mapi id 15.20.4394.017; Wed, 4 Aug 2021
 16:58:07 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][hardknott][PATCH 1/1] util-linux: fix CVE 2021-37600
Date: Wed,  4 Aug 2021 09:57:51 -0700
Message-Id: <20210804165751.10095-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: SJ0PR13CA0161.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::16) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by SJ0PR13CA0161.namprd13.prod.outlook.com (2603:10b6:a03:2c7::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.10 via Frontend Transport; Wed, 4 Aug 2021 16:58:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f57ecae-ca3b-4d7a-9065-08d957690887
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4992D9FBB55DFFA7894B82CA88F19@SJ0PR11MB4992.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SIxAuFlpjwqBJ/kZLE7+KefmCO0l3dqTzWm6O6eDmPc3GFoGC0zohi0qoeB7frrJfFoiUCAQt5CZoXr3otFeAfoRq6lrdAoIiH6o7uvpRPbUkCVYTY21lZZETAgYfauhgXMe8lHLI0gS3A9j6b/Me34Ojg1oufq2yjIMKGbPSzl4hZcPa6x0NZg7nr3DwwScySLjalLZRqUqPtOFSBdDPtk/dbusajZiDEW0a7SgfuweFu9nF7V32daL7x8JTxSu96n0KTk/2P3IzXRiElz+oLRVobm/TITToL42w7aFIlgDQ4uP6KqnGfzDl2Bh8MIQg7Si8lmsYk4jx3hjroMa9MiDzrdd+mX+sIlo6zxIcRT4eLBj0Rte6BxoRxO02IGggLgcvSl2zKh0tmH9SFYtssA1MNsYW0TRKpDCIk0d3T4KnOlJLsFb7wAEm1gtb4x2l89WVefDsgX4Hx7jkoMtY8448q/z/zPRsV0eNGGOUhlpYQa1eSQh1TWBRjTZbF22aa0gSis+cCFESPtVlvXthMHJCqrANdoBG1d3/8dxkSl4xoBXWN/G3qVZ5hZU4eg/8arZ/NCMBNkwbXO7vJfjJMWS4I+GqfavV+Rv81KrFHrhwtMN+XL3Gokd48vQTuBJnB1ez5cyr1gI2T7gWcF7F/5SNe4k0BZlCdEC5iR74E4jFGrJD445neTwXqnwDImcfOMIzJJ5KypsdYbBwRX27t4CInwMqRzMDCwHN+kf0I/r6fD1cssozXxCznopQ9N7y8a8cisBa4s2Im2Hv/tiHTKLRd9KMkBlJgJRTK6tDfjdeKwGEHCM0eIuVsarRtAo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39850400004)(26005)(6666004)(66476007)(4326008)(6916009)(66946007)(6506007)(86362001)(186003)(38350700002)(38100700002)(52116002)(8936002)(66556008)(36756003)(6512007)(478600001)(2906002)(1076003)(5660300002)(316002)(83380400001)(44832011)(6486002)(966005)(8676002)(107886003)(2616005)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KMVuOvcjL8TPRJXEUq2WJCgapexkwJqWiRnvByG+CYdiEG2bHAeOXw56m1A8?=
 =?us-ascii?Q?5BvTuLNfM+1QxCNYqLFE7bMjmzXnvSysbEN4Wrojavn4mmKNObvGICL6FMyx?=
 =?us-ascii?Q?pOgEOix3OGS6DwqjSVQESdt9a8x+e9I2axudUinxIwYiaNilqqPckzvzsyjR?=
 =?us-ascii?Q?Re6e93oG+BUAKvVdN1GcBr6ruk2AEjsswaUqQBMK8kvIU7Ql9GIDKPp7WJdv?=
 =?us-ascii?Q?sISSJM+CXk2q1aZU2/mi3azc223clmH68b2LwKBAZTz7IfmgQ0uQ0ukrpfs/?=
 =?us-ascii?Q?PSKjDyxogZB4W9/KA8d6ny+wqp0nz0rpYWxl4IMqg1RIW+sOpy3+7I2JoOkn?=
 =?us-ascii?Q?WkMTMnyUSGdHiNPLudZzp4LsqzoZH0zNE+EDHCx2q3XG2zaKc2oR+TkbmIBD?=
 =?us-ascii?Q?DdCP4jhP07i9Y2m0WWSMuwxtW+JSNXIHMWSWTPWQAH+2xMhZ3Omx0A/IDhyZ?=
 =?us-ascii?Q?/wJtO+XGvYHd4JJHvkh1+2fIA2sAc7O1nPIQphYcgNiBrZvwAq2OeLpgtvCQ?=
 =?us-ascii?Q?wRSlQlAzJU5+uS5bOQiyRJyn7dNZ+qzQSdLfiYUwGprY5ZYiEnJgk4JxprM7?=
 =?us-ascii?Q?Pm6thoeRfFs8auXIDW65nlnrBJ+B0mgtimH75pfAIp/AKyR4ao9DelQYgRRK?=
 =?us-ascii?Q?TVpXFujsIevrF7wqmOgVM8VQmxYAADck57bO+QC1XMQ42UrzQl/0/1BZDmhy?=
 =?us-ascii?Q?cJGeDyY0AyAdXIGxERy4wIbFjXYsn3oqnxCUSd4I5Nh2QFb9I5qxfGz5it8N?=
 =?us-ascii?Q?xsR2Zfta0Giv1nNnj+gAQa5KBZQz3WLFmjwu5cQeBp8cXn94ejlatXeYWyPL?=
 =?us-ascii?Q?rFY4TUrZKwGEZ2WXP7PPCus2Ks2SiXQUCFF0cDmtCUsvqQT+M/rTyaUQdM88?=
 =?us-ascii?Q?SS9wqO3qxgjPRr0xRDJe6ThDsC8yizTYXHbve4FJkoNOB/jGstqCNQabME+c?=
 =?us-ascii?Q?7np5axlQryuDQ1n0E29TcFd0TnNmmYgK/WxycWfYzFhjy2VleV1lyV/45PNU?=
 =?us-ascii?Q?S6JXLkQH+DEuE4PuPt8yUv4Tb36YLW12sxP61MdfQU4f69Lg0EBALdf04XOq?=
 =?us-ascii?Q?AFDrVi1u5GXsN4V9XFulMvo6wKUVy0gJtv2BaUi9rZtI5RGDyA0u4tuux2lW?=
 =?us-ascii?Q?1nXfyaN54cnZqUjHZJBVKekEGCC3bCBNuDP79Wi/6ZEwzy/LXXKARrZ/Lkq9?=
 =?us-ascii?Q?r3dHyFlQ+rxM8CMAxuG1H+b2Jc9D1EZkRUiRnXSI0s9Huppnj2Hjx2VGRWeA?=
 =?us-ascii?Q?jZ1jOMbE91I0YAPs52XdXQPI0eFSON2/JNYwQz6cKjBNgg9v+sjBjp1qFyn9?=
 =?us-ascii?Q?79teo3Fb7Okpx5SopyesH8cV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f57ecae-ca3b-4d7a-9065-08d957690887
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 16:58:07.8289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwizjlK5OpndxREuHGjnIpTXYxvpn25FXzOqatfZajZIGDtO2zJ2L/9RKjWms5o8uvmq8cQJF2WQjVvxX8zs6rGcinQqG5giVAq2nKCymK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4992
X-Proofpoint-ORIG-GUID: OqkXpPnZCrsyD6W0Wq4tfYNIBAkNVWBk
X-Proofpoint-GUID: OqkXpPnZCrsyD6W0Wq4tfYNIBAkNVWBk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-04_05,2021-08-04_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011
 mlxscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108040097
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport patch, which should be in next release (2.37.2).

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc        |  1 +
 .../util-linux/util-linux/CVE-2021-37600.patch     | 38 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 6b47f41..b21d6d4 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -36,5 +36,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            file://Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch \
+           file://CVE-2021-37600.patch \
            "
 SRC_URI[sha256sum] = "f7516ba9d8689343594356f0e5e1a5f0da34adfbc89023437735872bb5024c5f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch b/meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
new file mode 100644
index 0000000..11934ee
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
@@ -0,0 +1,38 @@
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
+
+after version 2.37.1
+https://github.com/karelzak/util-linux.git 1c9143d0c1d...
+unmodified
+
+Upstream-Status: Backport
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ sys-utils/ipcutils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sys-utils/ipcutils.c b/sys-utils/ipcutils.c
+index e784c4d..18868cf 100644
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
+2.7.4
+
-- 
2.7.4

