Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.9058.1624633833847081687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jun 2021 08:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aPTJRW2F;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1810590aea=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15PF2RWw008834
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Jun 2021 15:10:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39d257rnu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Jun 2021 15:10:32 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15PF8BxV016441
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Jun 2021 15:10:32 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com with ESMTP id 39d257rnu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Jun 2021 15:10:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRybJk0CIoIqxV9hqAtSNnyYY0ycJY5Td4j26OA9ZeRbByZS9uIGrdD6YAXo/P00v0bsLxtfxO4SG2JsVVi690uMs/lutvkd27lOU5ik1wWQv00lC81DbfQC517W4Qqg7INx82xHE9/8JMUC2PW+i/s+iY9Dx8IkwPbJslNlYCVRZeq0LRLQstMbMSjoi/6SzrlRZDW+tRLp2TEfgJ87CMeHwFwn/AqvacT13xC1jvzNEOJuq5AwjoHr5OvYYwkmsovzAMbd7yM67MevRNqY5l5lCKV9TovUvBln3SF+ItkrrwhWJAex1j4PxDr1v+NPs2zB1rL+jICNP0+zKsIxlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8zk8EzPHZ8i3gHoXc0uJzbEdELb+9AAFZgPCFJ0/bs=;
 b=YDgsZut+GVc6kCdqZr2p91SEDfc7EWrgCshbQF+mRRENWgIICeHJpSKX3lhqklNbaf7iA+bNx0zg6uYliB4vewZid9iuesgG+u4uUgSzJ0Nc3fKWpYCDmrrJgnx2DOYph5Ck+et7Hjf9CdVab97w4S0HZ8lmwzkFVn7P5ejNXVTb7lME3lFr24DdB7IN6Fm9UyF7ochxLMOWi/8M+oAadT/+0xgL6MgVkNlQArcnANvcRyBWQm97QlbAWDmEkkqxS7/5tmHKY1SrjU8318xP+LJ3qa2GCexXO+Kxd7jzEakUyg84NIA4WhJlVdqy76UAvelfXudKQ+o6jG90FTDYBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8zk8EzPHZ8i3gHoXc0uJzbEdELb+9AAFZgPCFJ0/bs=;
 b=aPTJRW2FoZbh19ZCEoUEGO6CPnfX/DvHdYY6TJiCkX112VRGHqsvmAtVBCMLqo9IXXIMBrNG04TbftA0L1da5LFGIqXWjVvz62GKMtbiNjg9Bin18PGac/hnaM1/yMNOjB2oBTbahV7LtdAC59rGI6gvw/lV60RLWOM1SRQ+mvY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3913.namprd11.prod.outlook.com (2603:10b6:5:193::33)
 by DM6PR11MB3002.namprd11.prod.outlook.com (2603:10b6:5:6d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Fri, 25 Jun
 2021 15:10:31 +0000
Received: from DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::c5f7:bf05:b7c8:ebb9]) by DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::c5f7:bf05:b7c8:ebb9%5]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 15:10:31 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com
Subject: [OE-core][PATCH] linux-yocto/5.10: update SRCREV for NF support
Date: Fri, 25 Jun 2021 11:10:24 -0400
Message-Id: <20210625151024.23062-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: MN2PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::34) To DM6PR11MB3913.namprd11.prod.outlook.com
 (2603:10b6:5:193::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by MN2PR07CA0024.namprd07.prod.outlook.com (2603:10b6:208:1a0::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 15:10:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a741ea0d-a0d9-4090-46fd-08d937eb5f7f
X-MS-TrafficTypeDiagnostic: DM6PR11MB3002:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3002C4C9477A6550D7839E209F069@DM6PR11MB3002.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	niFxfVAAatMwg/LGibsjuJsmn/irRnf4H9BWrDpFFBw48Y/3NiUxeZKN/G4mlUGm6p4xN+N+rPg3w38u+qy//8ftAcA3EfkPFnTv2K1Cmk0TvgDfmtVMySfhU2cvEXzXUpPu3RlPn8SAWSYA3xC0Y9Xt9kJDCZk8HNoqUzcdxPilVijmrfsxEdD28UmjkQJ2K6wa5twTStiV3rXM51HyvDt1BwGo7/Bd4yKM+e2pzoib3hLcsZeDRENIlLVR6o8hSFANuIsGa7CLBp6/c7kB7qelpbc39UPr2/IOTg8K35yfNsf+LwwIeCIflAh31fxDHlEK+EZZOpc5sbw3qdo99Vtea+tx9WZjNoLEDOnDJhwM1xQi/rf0ehWk9299XDq3B25FfqO8P3EAM4yAsk5QOQAGe5hroHKqmRJYmhYWIm0rl5ii+O3tpsttWmV8x74uY+nxa6MrQ4FF3mLMjz2AepRAq2esabOV//0WVjE+9sgE4lzRG066c/BgQo0nMELJl6qb5iLNDv6DCtqIVZcGBqWPkQMFKmWNnwen4P7LnrfI4ooWskzYh2kJrUegilqrNEeJNrXsK4ZVAR6gsNDgQ743d5tdkWi0vXkGByo1+m7GeDgYDkErEAj+ESnKQDquBlgaKfKuxa1v+bB5kk0CqkOMk/neAagvQymWNTJteRvVTLKl8sxIIP60wBD7RhOwoP6sL2e6zpKhDplP+bDUYw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3913.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39850400004)(366004)(8936002)(2906002)(38100700002)(38350700002)(4326008)(186003)(1076003)(16526019)(83380400001)(5660300002)(26005)(956004)(2616005)(66556008)(6506007)(44832011)(478600001)(36756003)(6486002)(15650500001)(316002)(66476007)(6666004)(6512007)(52116002)(6916009)(66946007)(86362001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nJpUjGKK5YLv5YIYUNwM+iM122q/JyKQQMUGIPO4mBGjCL2EY9XmE1WE+ba2?=
 =?us-ascii?Q?ZbePdloZAGJ6GNPNPR4bXFEwDq3Zwajps4kDBievZyxtlF/v4/wMnB+0zDxK?=
 =?us-ascii?Q?AE86sjCPA8PUAO09Fm42anMh00jPpmDoZU9UGQ2J8x/JkKLwOz4orGghs7Jx?=
 =?us-ascii?Q?betxdYYE9Vl+WBBaWWaD4FViTVERWOgUY9Xpm40H2T5xjrPNxMz9QvE7yrXm?=
 =?us-ascii?Q?uHSthS9mJSrg86kn3URdLNYjz7T3YJDugkN8xIKVOYt4FFNDoEsNbBBhxzOu?=
 =?us-ascii?Q?Evw6tghI3Aje70GmzcXpj1ztw1vx2Mui5moGoIVQVNUjAZICjJhlZ4tnAFeE?=
 =?us-ascii?Q?gVBG7OYTO5rm6J/ZzwJ+OrY8Z18LWflDcABtc92seo0apoepVf/SvePrcqnA?=
 =?us-ascii?Q?lssrt/nxZYsrzr48k+PDY7VAXenxQTaYieII+YzygO6mpgdiwNY3Aqm8L6mo?=
 =?us-ascii?Q?Ep/OjFZs6/ekZ8M+JNa7mvdFzZtsHZ1Yz4l0FUjgYNa8PQp11L+aTy5ecSHT?=
 =?us-ascii?Q?/5XyjqNz0J9ZwYhimibGG+TEc8tXCJFVI/9uABFb/werfAc+w76HmyLgG4if?=
 =?us-ascii?Q?1lgZwg/6LNxKH04SUWlJEBQ26L3wPAHbmT0PtPegNuwjEc6YKmYrmFdAh++0?=
 =?us-ascii?Q?5SD38dt/9fqBo80zpphH+6YuVKb5N0WUs1GgvaxAshU3lcMs+grLSVPRPTaz?=
 =?us-ascii?Q?Jk+DBJ1cQjNcj3Gkqi1+TTPHetzBXplHajibU7jMFtAWK0N+9k3pZXlm7ysE?=
 =?us-ascii?Q?qmiFMkTtkvP9DtmNx7zkc/ZmLt3g9JYfQOoK4gHomgxc4Fpq/+aSTi4Pg6hF?=
 =?us-ascii?Q?vdJFPYc95M6Ev6b7UwAnqaOgNyUTiPVdWygRzbx8tBuRpUD+D1AHaIcrjDdG?=
 =?us-ascii?Q?olMuqaXxnOBtT+21hXFSkZ5a42XkTEVrvOqxZIS5aQkdTZQkjmWmk12p7HYf?=
 =?us-ascii?Q?0+sOQPgPxseJs61Tj24FDoOVMwxGzrA95Fb0ErnVo50yXlFa/VhBr/R+WEdj?=
 =?us-ascii?Q?JJ6y0BuNwEm3Idr1l0dxGZ/63AtAXDa92F1938Q68o/f0VxXBjLzaTi7oPIh?=
 =?us-ascii?Q?dSzQHcgoW8yLfaYbkWLppuT+q0nHddSMSpDCNcdQuteArn6McE4q3QinZLwi?=
 =?us-ascii?Q?q2IdY9KxDhhWC0yCReECse7zxZ8sBabtET1sQwOcv9LjCgmt1rq6eL1SofPh?=
 =?us-ascii?Q?kJZT/QZh+BE/akZe6nqDG8Zfmo8bVdSvhUF2iQakfBzW6YOjdAsOITkicG3T?=
 =?us-ascii?Q?RN4Nb9nnGr8PV17uHO3D/vVFN8ZKghsPjYzIgcEpFdZrP/uPicfe+xDfzewV?=
 =?us-ascii?Q?+oQCAWgEBVl4UVj+UmekVU+2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a741ea0d-a0d9-4090-46fd-08d937eb5f7f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 15:10:31.0313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+eWizoJyHaFFND3WuY2jlcVODRbhAfqLl+2RWN8jBv5UREgXfarWsDNZvS5rQjKic/Q3lCcj3tvB4fE5+OyKh1XjO1bVrUHAUMxxtdAT3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3002
X-Proofpoint-ORIG-GUID: ZqeaKtKvGGkgE-8eBkBQmtWBdsycnyf1
X-Proofpoint-GUID: szzaUeSVwbk29lEicDkkdkg9p7tSIqXX
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-25_05:2021-06-25,2021-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1011 impostorscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106250087
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

yocto-kernel-cache/yocto-5.10 has been updated to support the latest
kernel netfilter/nf_tables configurations, so update the SRCREV to match.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 877e8d2946..7d5cdaad90 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "6186341e981ad4fd3941c7c9af509923bbe2a2a5"
-SRCREV_meta ?= "67dad5ca86bd47dbbaa2194b9854c228055dfd37"
+SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index f99782c1be..1be6ba8150 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
 SRCREV_machine_qemux86-64 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
 SRCREV_machine_qemumips64 ?= "769a7118662a2256e20df60be9c9727f9c5878b0"
 SRCREV_machine ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
-SRCREV_meta ?= "67dad5ca86bd47dbbaa2194b9854c228055dfd37"
+SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.29.2

