Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.17434.1631131733961418341
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 13:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GEiFuiLg;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=488573eb99=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 188JkAKi004955
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Sep 2021 20:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=0XyYcUbkQ9iTUQMn5RLie++qzQaF1vlsJ0RkZ/gJMBU=;
 b=GEiFuiLgqk05YAaDRctULfXRUOzG+6sry/DFfM/seNhN602qTW/L2eKlot+fsCXEjFXX
 t432uT5hjAQxxKp9tXQCrWWSY2QxUalQDbM2BiXX3BoQ6nDEAne5/bbfo5sQDvF8Cgpj
 3H/Fq+l3l2SzNFuYnHOsxMEYuHGCZQLrY9lDtO6YD6ALUwflfjMhBdeR5GLw0mO5rxuD
 w0l+NHq2UanLfpNjJDymWV6CoLWLfQLum+umKpSVgCjEL/BUYEc94A4nXKWodiDhz51G
 2GHwMpIY0rnQO1ORQM3ptzdT5Le+Lj4CNoHddigzk8ighggefy66T5jGM43v+L+juAz7 Ig== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2048.outbound.protection.outlook.com [104.47.51.48])
	by mx0a-0064b401.pphosted.com with ESMTP id 3axcmtgxxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 20:08:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnfvpIJOtDkqT5tlVqpLPJR8/kl5LdC3haVWt1B/ktXyLoySGpBVvENYimYSLEnJ6bi3+29H3yBY61mbXund+g8LSpQ4n9g1okADAxrs+CtKFHjgO6D2evc2AZWsNOunIwsgUkY3BQFyMJ/Gudz2vl6N2aGnN1MNfFwfF+4o9tM+fTyicySuhe6bh3yaNAe1O0o1Ls5KuqI6Q/hDkVIvDFa9uqnFHX6I9HDwEcOWvrtw/pN7167wG6opIklGDgEvFSi3WEzEEeqN85zf29f6WDlbkSghjtDAUv/HufHp0zrAuVB2eUFBZJ0Wg04WT2ufxipnoY5Vt/+zXn8YO/LWNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0XyYcUbkQ9iTUQMn5RLie++qzQaF1vlsJ0RkZ/gJMBU=;
 b=iAV8dQH7IkA3z9Prif/SdhyG7qk1ZzeA6e1pN6B5p+cGE7aZ8hUBYAq1q5fuX3s9Iq63wWiuEkrCvqYIqZEiuewnnphQW+ps7a+lZ5rql5CW6MWRmUWNVFQNSq9wOkmB7besTxT2WY/g5N/t9GU2kVa6uekDd9zz279ndHry7yZW9LxUfyReHolX6TMhHeLLhWzzY6iF8WaO38FowHRgvbar8Kl8swCETA2nkzux8f5dDsNgm0V4QFDx080TS9z7snFon6+Y2zwMOuEXuw+UKe4FzJsNRfSIa6FP8fM1ASgsGHzsEPkzWlkZqDHvyqxiEK922cMNFqkAoCP1ipEV6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5006.namprd11.prod.outlook.com (2603:10b6:a03:2db::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 20:08:50 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::fdd3:dc0f:a385:34d1%4]) with mapi id 15.20.4478.025; Wed, 8 Sep 2021
 20:08:50 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][hardknott][PATCH] bluez5: fix CVE-2021-0129
Date: Wed,  8 Sep 2021 16:08:33 -0400
Message-Id: <20210908200833.1070143-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: YTXPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::46) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc) by YTXPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 20:08:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da63c716-3305-40a2-2113-08d9730478d1
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5006:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5006EB2F5C05B9CDBE774C9A9FD49@SJ0PR11MB5006.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MFoXwBT2vlO43HOscbSVBjtH4EmqSNJCmO3IUm59fnRSO0U5l07IjOfLyALBCht4+ZL3otUlOzQIdjv2BCqIt6WJA1RLu+ue8vAvT2oRxYfcQXleApNGjyvvCv1UvTT3gNT4SY6xjVHOqI8+C8WNv8+2RoiBbkhVm7xsEHWsRyvAu/QeJzODJzFWhxh/cqFx8ZaWHmJBXpBe9Yy9gzEE1kfACA9QitQHoc242FMehnnL8xCAzJPQbmBIef2WpOjz7a55URfF4IdUn/2ZNaWkPooZKYlqskGYL9+4A4okyCcsu9p752Qa7JbinhnJG8OFAAe7vwWyJWoAABVOgHNMzvdCHmxZtcdkCC/NXZsfU3iT9loOuPYlk9+zWGRxLTIuHdsSyNg78q/jQbHNMJwpHQWYKCE67hFjc+a1fdk3q7t+4z2ui9+yqJUmZjzlS6j1uUmasgHj5UNlOXzWeqocr1mWK88BhTsImmQ+qrzZUirUMtFRpyA9pUeEpMKMD6usMCJTjL557dKkHtdrii//d99lKO8vnrW3i8NkqOVNxbgKnLKRM4reXcGtejMWzsKPcRONycnIdMRWEDEpky4t/USXAoRgJ6HfeZPIItClsLMnV406ezXow1l9jSuSs2YXuKd9tnTQ+Rarfcrmfjs9d5RmtMC/kvcQXavonGzPteDdnaGuVtyYXz71ooWW1rEotEOvJKbswQZemQLcv8Z9bTRdQtZnR4KZqF0XeqKDd/8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(366004)(136003)(396003)(86362001)(52116002)(66476007)(66556008)(6916009)(38100700002)(1076003)(5660300002)(83380400001)(6486002)(8676002)(478600001)(44832011)(316002)(2616005)(66946007)(186003)(36756003)(2906002)(6666004)(6512007)(8936002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XPYt8FtKaKQtny+iSy8yiDSPWQJDLdF6mgx6ovo4W03dwKi7UHTGxO3aakPt?=
 =?us-ascii?Q?CXq91YvZg/4Zk+bQ+lf+cpuUf2VnawtgfwbvwhkayP5q68M8ruwUT6BP43uQ?=
 =?us-ascii?Q?ZXqlVfiAWjRkbMroCotzj4zHw/tVVvdRmZBBT0PTLJ2OvQ8F+9J9un+hjv/z?=
 =?us-ascii?Q?8mQ7I9FZwgXv2e+MCjpqxNwXFnO2SlZZPTTOSrOP0NDh4c5mwFHB27esNPyw?=
 =?us-ascii?Q?tBg44aUerSvYO34nZ5p5gIui4eB5MPH0k8bPUhnC19OuApcI/0bA57tBE4eU?=
 =?us-ascii?Q?uEuNRFSLsaLGOR6LmakK3M/y5mgTQ+elHUgSET3rbQ7kfc6QlDWJLrnn/MH7?=
 =?us-ascii?Q?oJxHepomXHMkcofVBP3uTkrBO/VGncn//M1NHLJHiuTFNIIrIRdruPz4GSql?=
 =?us-ascii?Q?QAcHfcswrC2hEu4C5q3MtdhgG1bvWxmPuQDiefD3v1e+8oDjVtNLWDsQrOQ3?=
 =?us-ascii?Q?8HftDwScg7CeGpoJJyV5O0hKUFhBTJ/RlJizIYIj0/qijBxC8p76xLA3rDIc?=
 =?us-ascii?Q?eMGMiiHH8lPDtmUNCdvWEvPQ3BXdOrCPKx8XMws+QR4AJV73DQh5KHO1+9XQ?=
 =?us-ascii?Q?Qj8jPzEoAJ3P91TbZfopYo8R35tiLKjOEVll5TtXyRSjFeoUAABcB4O+hmZB?=
 =?us-ascii?Q?/lCc3fvAl7bZVs0s3+CTrUkJ9M4tfebQfiJLnQEO4xJdiTurD3yIROEKeWy/?=
 =?us-ascii?Q?BQBJTPeEfwPV3HMAtj/Ik0rQH0uk+Z7ya4d0wU6+KPX13D+rgfAMy7pUOktI?=
 =?us-ascii?Q?eP3Z9QJRarOy/O4dKXYqqKhTaRQO27+u9xeKHx+HKxvJztCoPPEj4kZce8/f?=
 =?us-ascii?Q?S/6jUonKePvcD8brd8r8qeYuNjf4YtX9oHiXD5MeymaxCoxXEssphcwjWFjw?=
 =?us-ascii?Q?nAEnRvs+D8YtGUv+gS98CdywhWa6UK3sP/pCG73hZxu6umgBS3c5dMgpzqOX?=
 =?us-ascii?Q?DwXefTVXMVGfPIdxLL37virqlKCT+k0aIEKbMGcob7YpVbDZbKT+aBf7Wi3E?=
 =?us-ascii?Q?k5XE0oXFbtUaPhI08e2dHtV4vURWGWwenpPq7+lUnZd4n3eJmHe8fGcEwvBX?=
 =?us-ascii?Q?iBjDMb5dngXuyVjMVrVv7+BI00cFqd2AbYZInAIr+iNE1OzoU6Br1zJdEzGA?=
 =?us-ascii?Q?DSiiTotxILsyQbUpjWWICixFelF9UJZHa784e+g74fVWlUxWknbvs96vfYMb?=
 =?us-ascii?Q?waFcReYY/9SjsAjok9uheLy1QzjXQv1QBjkqafd+rA/8kS+Zc7zRHU5Cfia1?=
 =?us-ascii?Q?+4bHhFgP1WnoCRs53SlB7/mFBHGMcgoq31UV7nOYFaZ7DmedQCHo2l2O11zE?=
 =?us-ascii?Q?ZlVeNR3/QPGs1eOPCg+l7JPkAzNjnohn+mDYfe3i4UzDjINCF3fVBBLpTLBO?=
 =?us-ascii?Q?0KOPfBYr1c+ZEEVeZ/U7zs/0R/Pq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da63c716-3305-40a2-2113-08d9730478d1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 20:08:50.0416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3+2Vodb2mD3t3VfVDhilarGQbESAWj3nYwf/7br2frEHkMRuTOpc002ZH8SJa6aUjLcEZUabsxOqdgL1TxPOCao2LJcF1CllveqSbku9Qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5006
X-Proofpoint-ORIG-GUID: Jwrz-dhVakE2-RG8xDThPXcYQeHM-43N
X-Proofpoint-GUID: Jwrz-dhVakE2-RG8xDThPXcYQeHM-43N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-08_06,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080127
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport a fix from version 5.57 rather than doing an uprev, since there
appear to be some minor functional changes between our current version
and that version, despite the changelog only listing fixes.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...er-Fix-not-properly-checking-for-sec.patch | 113 ++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-shared-gatt-server-Fix-not-properly-checking-for-sec.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index a7b628ce1b..7f0ff6474b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -52,6 +52,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
+           file://0001-shared-gatt-server-Fix-not-properly-checking-for-sec.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-shared-gatt-server-Fix-not-properly-checking-for-sec.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-shared-gatt-server-Fix-not-properly-checking-for-sec.patch
new file mode 100644
index 0000000000..422fd211ca
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-shared-gatt-server-Fix-not-properly-checking-for-sec.patch
@@ -0,0 +1,113 @@
+From 00da0fb4972cf59e1c075f313da81ea549cb8738 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Tue, 2 Mar 2021 11:38:33 -0800
+Subject: [PATCH] shared/gatt-server: Fix not properly checking for secure
+ flags
+
+When passing the mask to check_permissions all valid permissions for
+the operation must be set including BT_ATT_PERM_SECURE flags.
+
+Upstream-Status: Backport
+(https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=00da0fb4972cf59e1c075f313da81ea549cb8738)
+
+CVE: CVE-2021-0129
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ src/shared/att-types.h   |  8 ++++++++
+ src/shared/gatt-server.c | 25 +++++++------------------
+ 2 files changed, 15 insertions(+), 18 deletions(-)
+
+diff --git a/src/shared/att-types.h b/src/shared/att-types.h
+index 7108b4e94..3adc05d9e 100644
+--- a/src/shared/att-types.h
++++ b/src/shared/att-types.h
+@@ -129,6 +129,14 @@ struct bt_att_pdu_error_rsp {
+ #define BT_ATT_PERM_WRITE_SECURE	0x0200
+ #define BT_ATT_PERM_SECURE		(BT_ATT_PERM_READ_SECURE | \
+ 					BT_ATT_PERM_WRITE_SECURE)
++#define BT_ATT_PERM_READ_MASK		(BT_ATT_PERM_READ | \
++					BT_ATT_PERM_READ_AUTHEN | \
++					BT_ATT_PERM_READ_ENCRYPT | \
++					BT_ATT_PERM_READ_SECURE)
++#define BT_ATT_PERM_WRITE_MASK		(BT_ATT_PERM_WRITE | \
++					BT_ATT_PERM_WRITE_AUTHEN | \
++					BT_ATT_PERM_WRITE_ENCRYPT | \
++					BT_ATT_PERM_WRITE_SECURE)
+ 
+ /* GATT Characteristic Properties Bitfield values */
+ #define BT_GATT_CHRC_PROP_BROADCAST			0x01
+diff --git a/src/shared/gatt-server.c b/src/shared/gatt-server.c
+index b5f7de7dc..970c35f94 100644
+--- a/src/shared/gatt-server.c
++++ b/src/shared/gatt-server.c
+@@ -444,9 +444,7 @@ static void process_read_by_type(struct async_read_op *op)
+ 		return;
+ 	}
+ 
+-	ecode = check_permissions(server, attr, BT_ATT_PERM_READ |
+-						BT_ATT_PERM_READ_AUTHEN |
+-						BT_ATT_PERM_READ_ENCRYPT);
++	ecode = check_permissions(server, attr, BT_ATT_PERM_READ_MASK);
+ 	if (ecode)
+ 		goto error;
+ 
+@@ -811,9 +809,7 @@ static void write_cb(struct bt_att_chan *chan, uint8_t opcode, const void *pdu,
+ 				(opcode == BT_ATT_OP_WRITE_REQ) ? "Req" : "Cmd",
+ 				handle);
+ 
+-	ecode = check_permissions(server, attr, BT_ATT_PERM_WRITE |
+-						BT_ATT_PERM_WRITE_AUTHEN |
+-						BT_ATT_PERM_WRITE_ENCRYPT);
++	ecode = check_permissions(server, attr, BT_ATT_PERM_WRITE_MASK);
+ 	if (ecode)
+ 		goto error;
+ 
+@@ -913,9 +909,7 @@ static void handle_read_req(struct bt_att_chan *chan,
+ 			opcode == BT_ATT_OP_READ_BLOB_REQ ? "Blob " : "",
+ 			handle);
+ 
+-	ecode = check_permissions(server, attr, BT_ATT_PERM_READ |
+-						BT_ATT_PERM_READ_AUTHEN |
+-						BT_ATT_PERM_READ_ENCRYPT);
++	ecode = check_permissions(server, attr, BT_ATT_PERM_READ_MASK);
+ 	if (ecode)
+ 		goto error;
+ 
+@@ -1051,9 +1045,8 @@ static void read_multiple_complete_cb(struct gatt_db_attribute *attr, int err,
+ 		goto error;
+ 	}
+ 
+-	ecode = check_permissions(data->server, next_attr, BT_ATT_PERM_READ |
+-						BT_ATT_PERM_READ_AUTHEN |
+-						BT_ATT_PERM_READ_ENCRYPT);
++	ecode = check_permissions(data->server, next_attr,
++						BT_ATT_PERM_READ_MASK);
+ 	if (ecode)
+ 		goto error;
+ 
+@@ -1129,9 +1122,7 @@ static void read_multiple_cb(struct bt_att_chan *chan, uint8_t opcode,
+ 		goto error;
+ 	}
+ 
+-	ecode = check_permissions(data->server, attr, BT_ATT_PERM_READ |
+-						BT_ATT_PERM_READ_AUTHEN |
+-						BT_ATT_PERM_READ_ENCRYPT);
++	ecode = check_permissions(data->server, attr, BT_ATT_PERM_READ_MASK);
+ 	if (ecode)
+ 		goto error;
+ 
+@@ -1308,9 +1299,7 @@ static void prep_write_cb(struct bt_att_chan *chan, uint8_t opcode,
+ 	util_debug(server->debug_callback, server->debug_data,
+ 				"Prep Write Req - handle: 0x%04x", handle);
+ 
+-	ecode = check_permissions(server, attr, BT_ATT_PERM_WRITE |
+-						BT_ATT_PERM_WRITE_AUTHEN |
+-						BT_ATT_PERM_WRITE_ENCRYPT);
++	ecode = check_permissions(server, attr, BT_ATT_PERM_WRITE_MASK);
+ 	if (ecode)
+ 		goto error;
+ 
+-- 
+2.31.1
+
-- 
2.31.1

