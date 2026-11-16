Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33444.1794849551047179525
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:19:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=MErj69VI;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=V2h60hyd;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AGGHtBB2517784
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 11:19:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Zw9IuBJBPuIKf
	APZjpDp5TguN6FbDx1IqKOWzI2dxyg=; b=MErj69VILA2ppkpPqbuHPAWOyZwlo
	gVXsAVQy+2wocRsr8rqeFV13qnKMvsnPJEo4FpT/RSekwbFqe0WmVl+0yG1QuRsj
	IWntuFKHQm8kQCJJRP0Mg2h8F5l2Cn+K6Ate4fQ6X0UD4Z1QxiVghEC+fILyHYc2
	p0/sV4CnhpZOOaTSIFdsJNdDoMHVjFiQNDoprN1J/Z0Axjo74gLZZ3zd4p4LdYZp
	2dRX11RUkqWc/9ko4c3dN6FUC7HLFNWJJhRaHukt6/w9+7MPDTimzhgXi6VfhvRl
	szwgRB94CqRjEzYrC6YvmTaoFIsAo6AD1/P0BpnwtdjSUbUzLqhLbpo5g==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012046.outbound.protection.outlook.com [52.101.43.46])
	by m0384305.ppops.net (PPS) with ESMTPS id 4j029f1npb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 11:19:10 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKyH+f12vDun4HW5ZJenV41PYm7MfWWBri0oKua54AlZFhSi2sN6l7dYpgKOjfE08HxLT1GMCqyi9l1W6KVaEpaVV1zHA1psfa84GdY6tHy+zwBhLLsX22S8bP5YbVQmpd7u393fIK7q4VuXlEHyQSrlOj+P3u19NUYQF4Y0XnbQnOQQ477mJPdXuKxpmL9mZTTxvsfj+6dIVkajjlp5a+tagPwWzptOf9IRakbreEEdJGuQrfd11JIeweGlDIMF8DwEYcmD281+xp+oMr+0c2jMEiPeJKuPv6pzQmj1YxO2TbL/8B36DL8IT17eKEpNAMOiXEctP1lp8NlXLYBB4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zw9IuBJBPuIKfAPZjpDp5TguN6FbDx1IqKOWzI2dxyg=;
 b=vCMcXummyDP9mfA5Z9R+6Eg3K7homuT0kHlKH7AAjEpGKzMdKXoZZQ1v5gyxaYJLA53AA3UfPbjAGqbn8o+Av754o1oZCTrUeq9WYacrlR9Syd43O6SvJun+ke3J6iinvHefkJ4uSTFGXZLdPzdBvDUiJMRV7yTOTTVFVxK+xcGvC/h5zmOmdebZ7HlONFmVMo5Pn+8eECg3Xcqc0ZS+8aPeJkyRoRivg4/0rIYAmyqkNI7NReRoJ62fohjfbY0YMA2wSY9pIa3xOEVb9OW3wsBtUg9KPrpdsbhM8z9YOCNuRVZFmuhgiNFkoJt/qDOZ59K+od4k/22rdn8rESX0dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zw9IuBJBPuIKfAPZjpDp5TguN6FbDx1IqKOWzI2dxyg=;
 b=V2h60hydI/Kgxw7bgg7yntjDphMh+2QtnfJ86KzH5b5u9VEzDj53AQUEP2zJswG99yGQUtPb78N0vfg3o1/NGpxvomKC93cZEoqimzkZpaTYOOATIzl1her0I91M6bEBmioKsSLWtaA2GPaeAgRSoUAM0RRG+WzyqfNpgoV4OQM=
Received: from MW4PR04CA0239.namprd04.prod.outlook.com (2603:10b6:303:87::34)
 by IA1PR10MB6193.namprd10.prod.outlook.com (2603:10b6:208:3a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 17:19:08 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::63) by MW4PR04CA0239.outlook.office365.com
 (2603:10b6:303:87::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 17:19:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 17:19:07 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 11:18:40 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 11:18:40 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 16 Nov 2026 11:18:40 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AGHIei11188745
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 11:18:40 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xT0Ln-00000002i2j-3gwA
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Nov 2026 11:18:39 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] create-spdx-3.0: Fix typo
Date: Mon, 16 Nov 2026 11:18:39 -0600
Message-ID: <20261116171839.645950-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|IA1PR10MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 5957c17d-7e47-4b0f-47d6-08df4405b8f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|18002099003|3023799007|56012099006|10067099003|261026121527099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: nT6kERFPiUI5b/7n1YB89YDaiyg8Le6/hmdGoBvKQrXejX8x9hl5JZlXRiT3b1PhtH/gFy3Vayz5cZfW+KQtdJd3qUqqA5f31RQrRpS1LwEhElxxbXZ0JqZXThje/fntu00/lCxDodHKl7Lut4frd3q4+Flvsb5I9SIHMGjW2NQkDkvMdavemGgcBRY53jQ1fvuW22Jo1WCBSO8XNs8Z6ex5qBqJvbXpzGheyPm27BddnvnTpm3YhoOU+eQdenCTjSK2klCNSltJSNnW2Zimjh2J2AZjEpFsNpePqRhoZvIPuDLzv4W+g5esZqbNvr6djt9Ug9TNozv5RaBANXZesbBiFFQB875S3tOQHqcAFj5ER/sLcM8CDByDGN16r3f2Z0/Nd2hTRQG4e/nMKjhn+VrBp4iH6b1OUJxqfiOz7hH4Pvb95itZhYXy2Yi2dP2YMuzSo4QDU8Tfpl25D/R0inhYi4yqCFk7Wkb6muX3O2cPv9RzHzZWQn0g8btWZUv2NlLvhAoSOLIp3MnEImZxNQ8sQr1fNkcsd5rV/qQlYnx7HExj/fKtGF/kOA+5L81Qm/yh+AcMyJOujrlLwHkdXHSu0ffXrjTtBLRWZ6iFXr7G2za6Ry4TitvjNO2Q/uZuEYBYyp6FGtbc4YKXDNK7pVvErod554F0vMzedhkrVN7MgbZfAD8/M8B77LtIQDVHtjrpFDsnQ9LfzmDNQSQWoQ==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(18002099003)(3023799007)(56012099006)(10067099003)(261026121527099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LcTTrresA0axfZpbUF8AlKA9uvKC3EtuWMuJzDluH6cmHjFeRI/RHYnu/SLspB0KKpcyk3rXL8tgbbd6m2tk8BmgUk4nw1NzfQMNL8Ji6UDutyEw4OlXMzcDYwAXP0hcV8+kbWEDoHvY5ZJ++g5Z77etbw9oD8fKSnxgOSG1Ayh1EgI48dSveZ8m1TuOgjCK3+d6UIzUIfGZrKRUvAn/gW2t7SntUbg/+Szy6SGUew/EsRPofoz40iqddQ/a1xhiqlwv643jXTJzAiLA7SawSIdZeWacldAGR4qpsnywEgm7IWMBgoyQErGO50lAMFvia0WjgpcbLlqCFN7eTv0lxSlSc15KI/FcFs7oyiwQlLCSfQH8kYJe7wmipHvceu1N1UcL9xS9N2CpqV0lKr8I4Nd48JyYXeSlwtyPSRZ1ghIekrZ5UYrYgesIxSAALU+X
X-Exchange-RoutingPolicyChecked: hMA8UdbW+f14THki/dHK1nm93eyDbr54KJihYoUO7oYGun78aE+x2YI/y63KemTof6nu4ag8S7Fr3LLJt5g6opyV29c6M6of/FpUcSPR1Rg3Xfv4wZjwbkDqJQdbwzwzJVQfZSJT5/OVoqJELsrPJWCNRqZ65YfhfukBnb4W9ZUq1KgdtW1AxJXFCSrQ45oo75Xu5Cx8df9eUVKQ6gDhziqXNgyWTk7Uew8EO8veZMoSF4n3rQ8rbPt0BCKU/Y+zy0MgHOOVhjLPi4m4hZ0Ogj8Uwfa6TWKe9RJ/TmtM0GJsXq7hAK1bNjP+ipXoPmpHztQkacTG6s8wG6i7tg9n7w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 17:19:07.7348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5957c17d-7e47-4b0f-47d6-08df4405b8f9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6193
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfXxcaDlu6LXzBw
 4FfXtVYdKB9lCk3AMve9Yj6SjGwc325hbt7cer74ukXpmZ6s3l9pCVJrBNNDkFYqyN42GYUhGSK
 oYTLuNuc6c/CSNNlNCwcQYPiE5NlukHhAmxOlhDUmPTqKLrS307iGK6kINMxAe29Lh8AykV68p9
 KiomBmgw62/hkwr2E1gpX0HMKnoI+Nk23na6InUJwkulfrU018Gm80wF+0t+IgS3++IT7EilTh+
 M6vq0kfBmDZ41iyCxw0fGYsI/wmZrehSt+2yJwf0NkO79e+Q5qB2Mv30YsfPHACXK7tFNpzyUY3
 X34f3Jp5l9Y5GQEDg1fng7cuJ8k3mnvPV6kO1PyFZYvWi8SwlpYyz8cuXfDz3DgE2+TOdS3qPxa
 Qs70xj0W7k6aCtigzqC3biMxsQO5UowPZfeRHqQZl2BmerFMa0mtZ+j3/GK+4qtjm2feaEtlzF/
 ADtZGXXo/Nt3rPX/iIw==
X-Proofpoint-ORIG-GUID: Jb4g9VdVPwrcRqy2LDKHYcvXfmO8HNpa
X-Proofpoint-GUID: Jb4g9VdVPwrcRqy2LDKHYcvXfmO8HNpa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfX8LTD5Bg9lNzU
 vrX7bZYZme4A6FmhHWQwGLM+KezdB0q7iSBbxtTw+QbIqOJV8eKZ3t2+Rh/horMNxCvqxOod26X
 Qa0XMx73IxrYb1dhNbGA2ViiUtW0zCQ=
X-Authority-Analysis: v=2.4 cv=YLYKWhGx c=1 sm=1 tr=0 ts=6afb3b0e cx=c_pps
 a=2EcEh/UKxA6NVIT+L3iE4w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=n20ms_3rGBNpTTd4l8cA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 17:19:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250370
Content-Type: text/plain; charset="utf-8"

Found a typo in the doc settings for SPDX_DEPLOY_ARTIFACTS.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta/classes/create-spdx-3.0.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 0d0bddcc67..0a957ab93a 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -194,9 +194,9 @@ SPDX_DEPLOY_SBOM_NAME[doc] = "The name of the output deploy SBoM when using \
     create_deploy_sbom"
 
 SPDX_DEPLOY_ARTIFACTS = "AUTO"
-SPDX_DEPLOY_ARITFACTS[doc] = "A space separated list of deployed artifacts, \
+SPDX_DEPLOY_ARTIFACTS[doc] = "A space separated list of deployed artifacts, \
     relative to SPDX_DEPLOY_ARTIFACTS_DIR that should be included in the SBoM. \
-    If 'AUTO' (the default), all files in SPDX_DEPLOY_ARITFACTS_DIR will be \
+    If 'AUTO' (the default), all files in SPDX_DEPLOY_ARTIFACTS_DIR will be \
     added. A :task- override *must* be used to set this value so that it is \
     scoped to a specific task"
 
-- 
2.43.0

