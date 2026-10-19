Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2795.1792437539525515854
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 12:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Mxlwt0To;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=47523e1662=saisireesha.t@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJHbQ81800288
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 19:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=upLeoHs00WfhoR38kxDK
	UsCB50/5q5/azgdGpCxuO/8=; b=Mxlwt0ToIA2lE+v4IOZdzbx8EV6DvTsdzmo1
	L8hmOA7j4GFn7naAgyA53a3DU12W8aIwP7dRFZWuw4OXwdzctEuZlDlTaui8qt9i
	ws+x4k6P6ZJ/EATAh4tEn+8SIwbygCiWQwza9z7jYk0kPkY8eKIRjXkU0L80i5aV
	2Hft2Rw6ycx7qaAmqy/6dS5d/QDAGFI40oWt7iyjxxB9PPyncPmf16OOFO08TdYW
	92837sV9Cb/dxkO1+L1qICWe2ntzu7mtl8G6gpBkvoV9PqT+ztIAujllOhPOekQK
	YFMAaBPfu10OWqBincH4fMSj2+fWz/Nq1DTILJtXE6lWqY6ACA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022081.outbound.protection.outlook.com [52.101.43.81])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hc004kjwk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 19:18:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BElUzCc7ZbzV2AoZCjn9URC0/Ir0HTN26YegVB8RVykSC5JsnjgTWUkJe2wQfSDHGRZzKr37vMPkfSevZjLeFNK2RBTtgbR0SAq5LHA2EiisqhVqP/lhFcNALtWC6XdPieaZzcXqQoCVIph4sO0CLi6QLf5FmRMOkFjT8d5Ws14AyfT6A9ptMyrL8FIAe9+V58lafMzL0aGb/owA4WzdjwRd6MURsdHOaDDxO35OCmCZjW/Uqpq/znttjwAC71kO21GjjJg2eA1Nc04saXGbPpep4tTQefazo2o8vF0aV9CUrcZYEMugHvA5Hu5rv2QrtLb6nPqSE4Rpy8YOUowZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upLeoHs00WfhoR38kxDKUsCB50/5q5/azgdGpCxuO/8=;
 b=NNMKHk0BUbfNXbO2kctgdYvDvbX1/xmL19cbK0TouLY6Hb1JgojZkB/CRPHfHwEpvGKRp3HSf8ItD9lls41KipsP7sxJyIZP5A/9NGxKO/3UvueLBGpvDplY+5lnu8PwGJ43JhGeZwWyWr3ImorPV9FZWpgV8tv22ysmWOL2Mu3RbofOglto91gjkpW9ErYYzzkwywjnr9rEFduoumXXPRPErTrSkI/oD+dS8tNsCrbamBZUpWkAs3W7wPcVO+CPwQJZCVnChtq5hAxoNY5E7x8eVsk0+Kg0EBVtUyPEEMIjxfZpwstxjehee6euHAUWYE/qK3+fXY/G7pAnxI6AVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA7PR11MB9594.namprd11.prod.outlook.com (2603:10b6:806:4cf::24)
 by EAYPR11MB9588.namprd11.prod.outlook.com (2603:10b6:303:2c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 19:18:55 +0000
Received: from SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102]) by SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102%3]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 19:18:55 +0000
From: Sai Sireesha T <saisireesha.t@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] maintainers.inc: Update maintainer for systemd-tools-native
Date: Mon, 19 Oct 2026 14:18:40 -0500
Message-ID: <20261019191840.17324-1-saisireesha.t@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:408:143::21) To SA7PR11MB9594.namprd11.prod.outlook.com
 (2603:10b6:806:4cf::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA7PR11MB9594:EE_|EAYPR11MB9588:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2cdcc0-aaad-4205-74ac-08df2e15d143
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|366016|10070799003|23010399003|1800799024|261009223027099003|10067099003|56012099006|6133799003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: ePDoN8kqTL7I8S1SLHulDmUfEOgaP4Q1TiiaAe+8V4Mi5s5nM6lcXNdUOj1eYuW4ID50387MzEsRMwguSiqMeiRq59p//1/2csCz48QCiYqZccHjkUEQo5KXR2+WTKeEKPatFgYBUFTJ1X+y8mW8m8SszFBhvzFiL+LmAADU7n/ZuP+6sp7CbQagHRAAJebslYCS3GtVByWeZCiA8xn/u5bopE+g9miszTqiqcmD1L5r0ILlEaRfdR86DXlKzmUQan6Whj2V6SKxfOuY9DcyF6bJCECy/9BFzyot1WEyjQqxYTGaR5+kwoPL39Wssh/GRITXH1ephow9HqoPxrwBuQuuqdxbJVDjAV2Qd2Wm8F1081lpYRIGnLSCkeykMjdKjSjeyau1UDUNcfNUqim5NPSmFEeklr8nphSy8QJN3AICdgwQ9MOI5sTZDOPyKn0YBb61mdBbfJSmRfTAqKWeT7goGRaQVAajQ6faMJ5KCChDhXajjqcHf57aMwaQQ2hPWJFNK7fGfpDjyrdTAIeemVekoiMqfdyCUtOVky+HsriTrYuKyS0aNscAUEYNNY8v7OgsU32+fVBORlScZRMduQYDQYEgr0TPTI5MUy+pdQJCj36d8j6+4esw/p5mokyl4EGOuD4WqRYe2aQ+wLjQNjNxawojkQ3DzsjQXukOvtY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA7PR11MB9594.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(10070799003)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(6133799003)(18002099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+cpgBK9NsqqpYN8sNXpHCLax9SNd6hvWhe8wU6x090i6/9CKGUfK9/hU6/iZ?=
 =?us-ascii?Q?WSOwLyl/EyxRWcW/yqU8KcXanSf6Fzwd7dGlUckLoA6P7N8cCdeqjfgVFIkK?=
 =?us-ascii?Q?cQTtXAKwiK56XyzL3OtTYAj1lXsXU5vbX0pqQamRBe4DfJLcG7X50ET7St89?=
 =?us-ascii?Q?mQTFRVRwpQoMF4ShSlXIujvGlFl1S7DeSlNB4d0EK8sxzmUA9fSB8sNEKjXz?=
 =?us-ascii?Q?hP8G6zb91Uw7AqGjuQuIKDt8dbqL91CuoH0mw7yLjlKcU+FWF6iUDEB4KUZ3?=
 =?us-ascii?Q?l7XzOuNmOzVV8eHKcnWRY0JPxIelNEm2OrBVZZJL47s95XiJghY5cZkOeBGh?=
 =?us-ascii?Q?CnKNKjEsxvSz7ybJafgYE08agC4ZmaNoy/sjxZWLDJQc/1eC1X9RW/09MGEz?=
 =?us-ascii?Q?38qzaPO2nNJdDY5dpuw27PShPwRLM1aaRbvQIivdLpqUE4AVsvgLzlZvlTST?=
 =?us-ascii?Q?vAfUlBTNPOk5mMtGpAxB3coSllb4uVsLTNKq7L1WoqUeT/cB8R8pVYPzbOoo?=
 =?us-ascii?Q?k6zALwucnWJv5OC77MlXXJ5fFGyrV3Qa+TWlgS8UlZAxianSb9HZcj+A9iNr?=
 =?us-ascii?Q?OHbyl9Qg7l/0Ra9WOoapk38tIGktDvqJJ++Qyzo8XID0pzmZPnK98S+V//oH?=
 =?us-ascii?Q?fy+P1isT9azJPnq+r6vo1/y4rHE5aVWG0oCE8BZ+6bViG+d3nUnKcBpgkW8a?=
 =?us-ascii?Q?NGGEo6MgxfXOEzY53DV1twawEEZlxhBDPyWpjmzNbRQtR+2VXYbuXQfcryYZ?=
 =?us-ascii?Q?dOKwSts6TnrBe+CKiB5QtTHiw0o/sCIZqdiqvQVYSAPkNVB3acZgAM4H4PfN?=
 =?us-ascii?Q?I4AGx07O2s0YgW3Qv1G+gSEmlBt0x37PoUFYD0ADZiqzRpF73XxYnkj9bkXS?=
 =?us-ascii?Q?HxnFOWauxcO1dFFDdmjeAtfq0GVEgskwrejWCD+/cFv4GAptoNoSMsUD0fm6?=
 =?us-ascii?Q?8SBbagPTzxvc+w9jBtGen4Z2bQ5tzEeGcLjqTc+hRAMqFO+G8q9K3r6NVEwb?=
 =?us-ascii?Q?JV9ulEQXu7gfSWbPqHXdDNHb9Mk6zbIN44IeUc+E+xxHNbeFHzTt02FJ8DyH?=
 =?us-ascii?Q?ir3vV0HZZA/igmoDia8Iqb/XxdhxqHgR245/g5frLU/95eqEi7dtJTGm3NGG?=
 =?us-ascii?Q?Ox+CciLMfAwWlomPCCjDb/9JJbGQ4I3ng0uWICjLceewH5owiPfaEEB90FJI?=
 =?us-ascii?Q?0IcXMdQgi5FnzugcflckdwBdrl4WzpzkZCecrHeHsiqZB/jqcZ/nLQWJ51SM?=
 =?us-ascii?Q?aKeDAxJPybxW7LhsqpIkNnIOAGQZ2xnAxk3qGl6Bmx+Zt4ibLiCEFDrucZQ7?=
 =?us-ascii?Q?wcwCz+Z2bqQECCkdlHnYGnyIBNCMC3+nOLuzxloVnLAmRvFbTYlJ3kjX9or9?=
 =?us-ascii?Q?6/s2hNt2SWM2JmbvlMr1sn9Q/45OfQJYG32Qy7d3EYciSSKmysypGQLzBaZn?=
 =?us-ascii?Q?+IX1D8uiVF7CQaVFVqrqMf5NUQGnPNNmHQtS8bfBZQgaexjbnYIDyNn7zHlZ?=
 =?us-ascii?Q?0spnwmXK3QZSKhSbCGixRSJNmsRcT+QLsnnQF2qtz4VJphvMDPq4MEbDKDBh?=
 =?us-ascii?Q?l7imSKeyoKtCidFeNL03B0MzOR1v0h8DEpVCwqCH2NB/i1CjCrf0kNtGHIY3?=
 =?us-ascii?Q?A+stF4KgLYKBIZAnNwcX4GJBDm/PyNzWPpm/EDs/zkabX/ZJcH8mWwuEUV8c?=
 =?us-ascii?Q?6O0Bq87w9QMSvjqXCwtPny9GHHe/nC3FJcuM/P3nDuKoLLEYtyEcFh87dt/o?=
 =?us-ascii?Q?Yz7U5NudNW/TlEIJ7YRtMRBkpCif6AeYVkiM7VVMIkBsOmVq1eY71KQQAxsV?=
X-MS-Exchange-AntiSpam-MessageData-1: nkyORajuvCq0xewupZUXm9qvJAT0npMb+4Q=
X-Exchange-RoutingPolicyChecked: FBHnRh4WfyC2MC+0xD1prbcvl+Xa9RhsGGMKuH7tRCPieAcDmhvK2tsVC0LWPb4HZMPBFsc24547Yic434Cen8Tpp5Zg3xoiXJlevaZsavGWNJoMgyqTM36T6g0MgZ53cxi4JKu6Kpwiqmy/oHKVoV2DEpXT+w8QcrSaTFGUZBky+YXlWUiJj8wIPAsUKD38JFlEzO+E3XP2x95Jk8TWGusvXa1MWDbNqFzykDQ+Rt6tUGpquSKXmxFgwad/3cU1lF/M7+LcQ9k3pb2Iod5Z1Oj3m4AvWe4TlegQJkUG8cJI3jFk+1VPNjw+YzV7aAhTgxgdwp1k/kUpEo0wNpoosQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2cdcc0-aaad-4205-74ac-08df2e15d143
X-MS-Exchange-CrossTenant-AuthSource: SA7PR11MB9594.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 19:18:55.0428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Nnc4j4dvxeduasl4rwqmgpiQzlLIv6Sd+WPd6kNp/XD3Pdm5fcDlR28PrTdRIF1GZCQ6dehj0F8cCUG7TwrtiTrhliEkgBPfdL9iJZNXJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR11MB9588
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA3NiBTYWx0ZWRfX0QJUnWycd2yQ
 8qrLW7z7uuERt4br5Iw4g7UQz26omY7kJ8jyJUm7DwKBRM5fc4FtuDUv5Xbf/6AdMkwVM28XJ8e
 n0vaEq2GWYPmnrDTBAOOBAp/x8McEX65AEJdn9h/zMSojJ0z3DHF
X-Proofpoint-ORIG-GUID: LJVxZ6Pm-7vpyisqm-_LXFR2PVatSYOZ
X-Proofpoint-GUID: LJVxZ6Pm-7vpyisqm-_LXFR2PVatSYOZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA3NiBTYWx0ZWRfX7VM6UghyMQEK
 Z2Ep+AMbjM97NeIvIFDaFWux5Nhcc08DYUZs9im1iTf/QGdP1VKOQQMe+vqAl7Y7+hcewaD9EfC
 4sByn3V4AnVRniY1o926SelQe82w47zpvX3rFJUgl1yl84CnccFLYFix9o+83Nmt+MSnlGafnZP
 9ILEh7ZdiXw9RmR9SlRm4PhNjQ15udMPHiMUGbt4OB4PfNNJw0DWwe1sxe0fRHUEakd377rjTCG
 ekKQli/vLwBHrpp6zRucfLhRlZ7Q0TzlLQnkZj9o98tWCtV6muNoNAhmtLQDcbd9dGz3s9ojpDU
 63AIVc7P0lwp2meIlQ9+BKUuMMKgxvC3/y5X0FUTMmBJGjqUpGcg4oL1btgyWM8bXTS98xXFRUw
 qI1LSJfUeJEJCar/FTW1O4SiARQ4J3g4Ob/hguTasEgcPgoIqMdikdfPDI0YB4IYatRPK8LL4VN
 TRMoWcJUwJpMyg9m5iQ==
X-Authority-Analysis: v=2.4 cv=Yb0odARf c=1 sm=1 tr=0 ts=6ad66d22 cx=c_pps
 a=hO11pga2tcgH964FPuxqBw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=7CQSdrXTAAAA:8 a=3bldS6ano62NNfzrn98A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1011 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 19:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248207
Content-Type: text/plain; charset="utf-8"

Assign systemd-tools-native to Sai Sireesha T alongside the other systemd recipes.

Signed-off-by: Sai Sireesha T <saisireesha.t@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ea5ab307ec..7fe1be9851 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -834,7 +834,7 @@ RECIPE_MAINTAINER:pn-systemd-bootconf = "Sai Sireesha T <saisireesha.t@windriver
 RECIPE_MAINTAINER:pn-systemd-conf = "Sai Sireesha T <saisireesha.t@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-machine-units = "Sai Sireesha T <saisireesha.t@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-serialgetty = "Sai Sireesha T <saisireesha.t@windriver.com>"
-RECIPE_MAINTAINER:pn-systemd-tools-native = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-systemd-tools-native = "Sai Sireesha T <saisireesha.t@windriver.com>"
 RECIPE_MAINTAINER:pn-systemtap = "Victor Kamensky <victor.kamensky7@gmail.com>"
 RECIPE_MAINTAINER:pn-systemtap-native = "Victor Kamensky <victor.kamensky7@gmail.com>"
 RECIPE_MAINTAINER:pn-sysvinit = "Ross Burton <ross.burton@arm.com>"
