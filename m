Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16653.1795789344202628427
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 06:22:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=P5AN3Jnc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5791710b03=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE22iN1144021
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 14:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=0lxB4+MQa
	jGXB20EhQAdl0WwqnSFq2kkdh+tQtD/LF8=; b=P5AN3Jnc5bsu2WlGuLoE9S81M
	d/jcrkHLuV8OHjBnq8HkoP230TqjW2OezWdcKJDg1a2HE0yLBVn8UC9y1IMsET0X
	laVaYVJXG8A192dzY+rJ2fBhSXzuoNejiCEjyLBd68I6lgILJubvH6PteRzQ5FFa
	BQVp34hsieC9vyBlsdJAlYGR9uU/uviMzWCYCIWqAg1mqwzIup9xEhULajbsunq6
	W5cDGvyqyvaGUj65W6kz2zMZ+67zEqzTrvcuss6xT+cu5ABHTnszM09aJQvnXdvF
	2wXoGmiVOdHw5Q8uRWRkMDvs6zGXQ+yVcJ0tgBiVKa8UxAMLJ2SAaxivLaZFA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020101.outbound.protection.outlook.com [52.101.193.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j51497t44-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 14:22:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1VqHfpApSnxmnPmTVseV2dYgV8yBu+STUhtMaiFTzk9jwywAcCERbGuLBRXe/23sLJdfzpZiN56yZGAxelqzeNJr0kUDoSNxTAwzS0hOzfEJQK66to5N+1StU6zgHG3ppghLMkiRhGPf4mqytgzQdWXrjEKuYQX3VqE3KW2LjEkbzpqBVm1JKWzCO4F8vH7LicHQk4kVpRfeaRa6nfNbK6lnTtBwDKQbxlsXXknc2MgkPuW7UJ2qL/FnHMXyKpbVISX8yHuRSGZNZ1KPPnwcZWsXwtp44ru/F5+FEiDWnzAOuwz+NyB9KYK4OPpTzuOot17DXjfRvb7h2943IIssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lxB4+MQajGXB20EhQAdl0WwqnSFq2kkdh+tQtD/LF8=;
 b=LCepzJurYxpC85A1T2/Kx9Jy4HSBBO+YvbNGCkbA4dulZ+voQtyqFt8AbnCWPx+7AHoOY2tbOVVNzj6lRQSC23Y6pbZVPm7tgw+Q0H05cHJ4l0n58SYmTPDeKFTod9kl/ecOhQ594jSNzP3ydT4UwST6zzamFxWTDWHGi5EOejN7AmLZECO8zNIesE9EAzqfsDZ9s8lvbX3/PJhzTxLU5QzXPoImPWVUqFocDnxL3nFwEOh30+Pz3mw7v6q3D8RgJTMUvz36hn59/ofmvecjgrGniMaN1vPhjvW0bBbofY0X+cp3Q5l5m4TF0AF1uzdNcMQkvM40iE8ptETjSCid3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by MW4PR11MB6569.namprd11.prod.outlook.com
 (2603:10b6:303:1e1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 14:22:18 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 14:22:18 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: SunilKumar.Dora@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 1/2] gcc: Fix for CVE-2026-114691
Date: Fri, 27 Nov 2026 06:21:50 -0800
Message-ID: <20261127142151.2824782-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0172.namprd05.prod.outlook.com
 (2603:10b6:a03:339::27) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|MW4PR11MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 58987a57-f753-4f3e-29b7-08df4c91d778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|11063799006|6133799003|261009223027099003|18002099003|260925022911599003|260925021311599003|260925021911599003|10067099003|56012099006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|38350700014;
X-Microsoft-Antispam-Message-Info: j2xL//grlu3W1symWNufrWpm90Y3h+LnhkfuUZ0JiHaxb8k/YaoBJbJXfv4pfabFUZVhWCWol5dcoXJIg7rYL56JvdNfFILJbroY77G2NAVZinGD9Ila+ylalbGZb/ricFFOERcrbZoOE10qlvPROxLjjLBIbELdHgAR6fc+LmN60Gs5E8H333fYwDi2WBC4wFchBdizLMd6mTC7up1hWHdVntS3MPVW3IveKbEA8AjF/gCNQ1qZ2tGvRuexHWq2W0Qkmd8+LGYlSrXMJg8qd5YW5VYdhnJ2VNLP1KR0FgLMleCZuAjVBYd8FwmbNBgY+Vf2VZl8sXA8FSSGUtmXRCniKLc9qOntUFdYc7w21VbpbNSzL6lh2+x1AT13UVCAOfnztXXGGEax0glvmin32yq/K2JXCxzfx5WHOhvLQMvdhsG6whDdfjn5udzqU3TgfJ4psgvS6bSrC3fBuB267/UwfjPstm2KXq57xb3K8B55hmkoyDygU2WDLPyW51JsKaI0hV3YVsPFgR0jM3bFmYxbDlUguTRvyyuiJgztk2qQquVAkOLSFC3n2ECoeLCLkkCoYTFNDIOozmX9kK1siZbvdGJNWj5Gme3s0tPwFDQQy651/n2d40a+OPpDpx+3SKJE42BKgRLjHV8lw0aGDnTMn3WqF8vQ07nmxSqSKHAzvs7/InYi1pEUOm6YSG1lwROiqzDqNd0GseLiUXPv1vAKMRS4fvSDB5f3SpPwuHI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(11063799006)(6133799003)(261009223027099003)(18002099003)(260925022911599003)(260925021311599003)(260925021911599003)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?usR69kiZRQbVH6dxnf5uRvZ9qM3cHYePktPf6JPOcWtLphTYO4NKY0qy4Hsp?=
 =?us-ascii?Q?mT51s5DxRGEW3BEZBGICHehnnPg29HFebRYgBX7Xbl8OwfUve3kXxcvzPo1u?=
 =?us-ascii?Q?+cQFrff24DijrKENpXlvYCPk/yMGUsZ1LT4NZXK7PxeUwp3HI6mDqs7CuvaL?=
 =?us-ascii?Q?olHMESLHav1Y0LI6RDcdZIFvD2y+0fEqoQn+PSz9Oy0pEswi9OOvcEivarUL?=
 =?us-ascii?Q?BDBef/MkBBh/uTZ4TousXleJopk6hdhfpHs0uHQjxiuLT2SVDp0OM2GdHjfS?=
 =?us-ascii?Q?dpGcq7LeV4+ECv6f9s9WZUIK35wCadweYFSvolUTdBXy3AA9EVb8Gq8MR2y4?=
 =?us-ascii?Q?FCGMLCnN3rv7HEnijKP1KGW1wkm+2l0jhF07BWxZhAUQQpXo/KqDSIYFumVu?=
 =?us-ascii?Q?RcC0pOb4kdpAPa7nWMsfkFh510hxoso7KU6GWGd8wjJ323F75hrV0koMCAjV?=
 =?us-ascii?Q?yPWJBVRaCRB97UtLDrpts/Q+/b553lHS4Ba6SxaYy65pjmxrvHNurjyAutsQ?=
 =?us-ascii?Q?HNGPqJNwdaJUBYNvsu3sINSCF2E0oKj+qSo319qWnuU+ZnuHdL9X5d17qvtA?=
 =?us-ascii?Q?1P2cJJ7/itKpePqznIBmavItpn9MqfxbO9eXaXDBFm688NsbjoXVMI5zXW1o?=
 =?us-ascii?Q?T+X/g1gbMTn5wq60Niq+X/3DMydRPFedFjzZcra52LiSQ1B4ZxAFJp2THkqM?=
 =?us-ascii?Q?1GnVityN/l8c+uV/jpTH3YIpmmb5Pt+YytsnArdFO+CvxKwZGWvVaKowturV?=
 =?us-ascii?Q?AlPZfsrh82nqoEVwXXU8MbpZFS9UeH7NVbh6RMod9xZGoNSiSMhMbgdC8d00?=
 =?us-ascii?Q?dhoeph5rdHHE/Esg66Qb88cfxUl/mjH1qD14sm4Tbo6IddZPQsPIs6DFWv6j?=
 =?us-ascii?Q?pHJGt8yRR64cfYimtmym+tFn+5NZEjdUZ6+5ZZ73/NKggFlk2kf/Y6CF8WrO?=
 =?us-ascii?Q?H9X6aHdMHOhXCssPXGIeq3mJvY2kIHS3pj8LxX5k13Df32N7gOCazTjIILI8?=
 =?us-ascii?Q?pvs9Sj41GWu2vPXVrULMDxgKnpKk0ja2XPVlCwtbWWPqMtjbASS3AOrm+YJS?=
 =?us-ascii?Q?PBAgnBUl1YcW1TaohWaTN8l62QtSXrpW9ahbOozCERHqs8Ei4wDPYryyb4U3?=
 =?us-ascii?Q?Bgr0imgjt4q7oe5O3uzE0gQVNKu5Z7mlXGBDd8w5x2sws5lyBrKHIamiocxL?=
 =?us-ascii?Q?T//owH8UOWQaGVJMXopXC6yuREnjVi7KLg8I9lfwuVUh+ymirupFBQi3Olaz?=
 =?us-ascii?Q?diXnCf+KG18y6DpwECn0hcHxibJEsVlHoUqPXpE8z59JUhwQYMzBnQt2bao3?=
 =?us-ascii?Q?wNgH+lV/jXsVW8M7c18y2dqXhnOzujWzF+6rYbfQJ2AEZBbxAaJ1AOhVK1E2?=
 =?us-ascii?Q?sZmoNB5FYw2HIm1cIep9QT060NF+MpO7N1hAQPD+MKb08+YPnW++kVMqjFE0?=
 =?us-ascii?Q?DHaTu2QenaYC63uXYJ0f0PKnaDKzqVtpid76Oj87ZC5RjS0Ue1U+WdG2fMva?=
 =?us-ascii?Q?oaMiFLlj5y3YgiACF8i1tR12HWGPh7JqfhmjLdiHrMrmYT9l5z95/aUdGYxo?=
 =?us-ascii?Q?saFnu9afP9KEVbjRv8FfagDRGL1NFBli7v0VDtuB2Pday4I9lZ5NQnOd+6xU?=
 =?us-ascii?Q?HAqSyu3s5zWmg1/E/mpZZREbJq5ewQ7ISSFCyMNNFh00Qq6HGazOzKCVELWe?=
 =?us-ascii?Q?9lF9wrT0+GBfsdcjJ7Sa809zBIO5PevqW0Q5UQHOIygdXkyqGFHdFnqMrgj/?=
 =?us-ascii?Q?G+4r1BpP0mltxIDEaXnn/dKaoQe5O5g=3D?=
X-Exchange-RoutingPolicyChecked: NtD+dVSDDsGjYKAYrBVk/61nV6cGKzay1kjVgDnc+jpbGF9n+BSh/zWETfaUGgHojhFgmcUtdg8mSZTvbOEgiXlknU7AKdydxdgBTrx0+s6CEHPCGg82c560e5P7qZDYJdUYAOgXKOqnnrnaiTfOUoeAz0+BOaNlhgZOpMxzMqM7A1IGCAsQcwc5jCD2oGnqFqzB9NRswqlD61c9LumNLPYtYrqggtrdlKWMVUzYbO+2QsPqdZuX9dhHkj1uzX954Ogw11mkGISaB5pbykWu+n88tu94/BmK6IrQ3HK1nydCczV2mEk4j4iTVpnins8dgPyD7nFUnWlxv/xHdBu8QA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58987a57-f753-4f3e-29b7-08df4c91d778
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 14:22:17.9627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9bbPL3DE/HA7YIBaZa2TKCAlsNuPxSdb5WSvUHJ3l4ECf1zIGQDDkA244+0xdPvMQTeI67sTgnYwVNc9f3fz0Qa5UUtAaQEMqStR/OTbX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
X-Authority-Analysis: v=2.4 cv=ScJi5fRu c=1 sm=1 tr=0 ts=6b09921e cx=c_pps
 a=IAlGFxvWO5AZskdmYTP3vQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=Ts-6AtMENj6w9u1THSIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX4Vwl1+PxkCjW
 bx8GOeIA7zbN4JC42fmngxitg+TbvR7Ko8pw/iizBmi/KgFQKUVOKz+vDYu5RVSGPABFxGE5IRP
 seh2kY7sB5p1MD0PhfAgoT522SNjo5buqC+7Jlw0Q648VGKvLx04j1F7LVeUYBnNzn2oguCmox6
 iTfgWm5EKse3R50U9tgV0Sg2qYvVDoJCodlEzJYGed0GUQKX+3u1UajumnOgx/kWZ6VMsfj1GJF
 IlhiHu7L0EXIfj/oO47mJGnX/MOJFOQLx1lLmpAUhT7Oe1gRa6XIYCHWDeTaoZRqx2iD0+YYM81
 ftVFU00wwLXtBavVOgy+7WEhL4CwUYMqCzLekoRKQT2Y/S/CWm5jU4sxlLByDF/dVgb9rRhKvXz
 nAI0RAWldClKbjPRTNDL2uai9VByT+KUiwskCQUPtavkwiC6jZ6+9lRGG5pbq3d8trFEfn8Q3el
 TWQPC9zalcqNmsfgfzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX8gYl3MuDSz4V
 OTv0UaUlVAPwEoNHDMvxqy9UoykUEDYOiglyPonPbpBB0l2XpgbG9Zlls7knSKSyjy+6oJntJC4
 XKlYaPaNMu9esQjl1fBJ+AILx4vO3YLzgo2aEBrY9LT2ctTTSpuu
X-Proofpoint-GUID: lSKQZrnEpACQNoKWh58OvJ-uCc0gylFT
X-Proofpoint-ORIG-GUID: lSKQZrnEpACQNoKWh58OvJ-uCc0gylFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 14:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251393
Content-Type: text/plain; charset="utf-8"

From: Harish Sadineni <Harish.Sadineni@windriver.com>

libstdc++: Fix overflow in std::vector<bool> constructors (CVE-2026-114691)

Some std::vector<bool> constructors pass a user-provided size (or a
distance derived from user-provided range) to the _S_nword function
which does addition to find the number of words (of type unsigned long)
that are needed for that number of bits. If the size is close to
SIZE_MAX the addition wraps to zero and the number of words needed is
incorrect.

This adds a new function for initializing from user-provided sizes which
checks against max_size() so that out-of-range values are rejected
before any call to _S_nword.

The new function rejects negative values as well as large ones. For an
invalid range the result of ranges::distance or std::distance could be a
very large negative value that would become smaller than max_size() when
converted to size_t. This detects some invalid inputs (last before
first) at minimal cost.

References:
https://nvd.nist.gov/vuln/detail/cve-2026-114691
https://gcc.gnu.org/cgit/gcc/commit/?h=releases/gcc-16&id=2ab9ded76e8714b1654260ac68a815c20567cc09

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-16.2.inc        |   1 +
 .../gcc/gcc/0029-CVE-2026-114691.patch        | 293 ++++++++++++++++++
 2 files changed, 294 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0029-CVE-2026-114691.patch

diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devtools/gcc/gcc-16.2.inc
index 6cc9dc3344..4361fbe208 100644
--- a/meta/recipes-devtools/gcc/gcc-16.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
@@ -77,6 +77,7 @@ SRC_URI = "${BASEURI} \
 	   file://0026-CVE-2026-102010.patch \
 	   file://0027-CVE-2026-125709.patch \
 	   file://0028-CVE-2026-115456.patch \
+	   file://0029-CVE-2026-114691.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0029-CVE-2026-114691.patch b/meta/recipes-devtools/gcc/gcc/0029-CVE-2026-114691.patch
new file mode 100644
index 0000000000..f938979e62
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0029-CVE-2026-114691.patch
@@ -0,0 +1,293 @@
+From 2ab9ded76e8714b1654260ac68a815c20567cc09 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Mon, 26 Oct 2026 17:21:01 +0000
+Subject: libstdc++: Fix overflow in std::vector<bool> constructors
+ (CVE-2026-114691)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Some std::vector<bool> constructors pass a user-provided size (or a
+distance derived from user-provided range) to the _S_nword function
+which does addition to find the number of words (of type unsigned long)
+that are needed for that number of bits. If the size is close to
+SIZE_MAX the addition wraps to zero and the number of words needed is
+incorrect.
+
+This adds a new function for initializing from user-provided sizes which
+checks against max_size() so that out-of-range values are rejected
+before any call to _S_nword.
+
+The new function rejects negative values as well as large ones. For an
+invalid range the result of ranges::distance or std::distance could be a
+very large negative value that would become smaller than max_size() when
+converted to size_t. This detects some invalid inputs (last before
+first) at minimal cost.
+
+libstdc++-v3/ChangeLog:
+
+	* include/bits/stl_bvector.h (_M_check_and_initialize): New
+	function.
+	(vector(size_type, const bool&, const allocator_type&))
+	(vector(from_range_t, R&&, const Alloc&))
+	(_M_initialize_dispatch, _M_initialize_range): Use new function
+	instead of _M_initialize.
+	(_M_initialize): Add debug assertion.
+	* testsuite/23_containers/vector/bool/prX.cc: New test.
+
+CVE: CVE-2026-114691
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/patch/?id=2ab9ded76e8714b1654260ac68a815c20567cc09]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+(cherry picked from commit 2fd8866591b5aea7098835f80ab7e176382175ae)
+---
+ libstdc++-v3/include/bits/stl_bvector.h            |  24 +++-
+ .../testsuite/23_containers/vector/bool/prX.cc     | 160 +++++++++++++++++++++
+ 2 files changed, 179 insertions(+), 5 deletions(-)
+ create mode 100644 libstdc++-v3/testsuite/23_containers/vector/bool/prX.cc
+
+diff --git a/libstdc++-v3/include/bits/stl_bvector.h b/libstdc++-v3/include/bits/stl_bvector.h
+index f190d1be5cec..24e5e7bf0420 100644
+--- a/libstdc++-v3/include/bits/stl_bvector.h
++++ b/libstdc++-v3/include/bits/stl_bvector.h
+@@ -715,6 +715,7 @@ _GLIBCXX_BEGIN_NAMESPACE_CONTAINER
+       { _M_impl._M_move_data(std::move(__x._M_impl)); }
+ #endif
+ 
++      // Caller must ensure the addition won't overflow.
+       _GLIBCXX_CONSTEXPR
+       static size_t
+       _S_nword(size_t __n)
+@@ -811,7 +812,7 @@ _GLIBCXX_BEGIN_NAMESPACE_CONTAINER
+ #endif
+       : _Base(__a)
+       {
+-	_M_initialize(__n);
++	_M_check_and_initialize(__n);
+ 	_M_initialize_value(__value);
+       }
+ 
+@@ -909,7 +910,7 @@ _GLIBCXX_BEGIN_NAMESPACE_CONTAINER
+ 	{
+ 	  if constexpr (ranges::forward_range<_Rg> || ranges::sized_range<_Rg>)
+ 	    {
+-	      _M_initialize(size_type(ranges::distance(__rg)));
++	      _M_check_and_initialize(ranges::distance(__rg));
+ 	      ranges::copy(__rg, begin());
+ 	    }
+ 	  else
+@@ -1553,6 +1554,9 @@ _GLIBCXX_BEGIN_NAMESPACE_CONTAINER
+       void
+       _M_initialize(size_type __n)
+       {
++	// Caller must ensure this, to avoid overflow in _S_nword.
++	_GLIBCXX_DEBUG_ASSERT(__n <= (size_t)-_S_word_bit);
++
+ 	if (__n)
+ 	  {
+ 	    _Bit_pointer __q = this->_M_allocate(__n);
+@@ -1563,6 +1567,17 @@ _GLIBCXX_BEGIN_NAMESPACE_CONTAINER
+ 	  }
+       }
+ 
++      template<typename _SizeT>
++	_GLIBCXX20_CONSTEXPR
++	void
++	_M_check_and_initialize(_SizeT __n)
++	{
++	  if (__n > max_size() || __n < 0)
++	    __throw_length_error(
++	      __N("Cannot create std::vector<bool> larger than max_size()"));
++	  _M_initialize(static_cast<size_type>(__n));
++	}
++
+       _GLIBCXX20_CONSTEXPR
+       void
+       _M_initialize_value(bool __x) _GLIBCXX_NOEXCEPT
+@@ -1588,7 +1603,7 @@ _GLIBCXX_BEGIN_NAMESPACE_CONTAINER
+ 	void
+ 	_M_initialize_dispatch(_Integer __n, _Integer __x, __true_type)
+ 	{
+-	  _M_initialize(static_cast<size_type>(__n));
++	  _M_check_and_initialize(static_cast<size_type>(__n));
+ 	  _M_initialize_value(__x);
+ 	}
+ 
+@@ -1616,8 +1631,7 @@ _GLIBCXX_BEGIN_NAMESPACE_CONTAINER
+ 	_M_initialize_range(_ForwardIterator __first, _ForwardIterator __last,
+ 			    std::forward_iterator_tag)
+ 	{
+-	  const size_type __n = std::distance(__first, __last);
+-	  _M_initialize(__n);
++	  _M_check_and_initialize(std::distance(__first, __last));
+ 	  std::copy(__first, __last, begin());
+ 	}
+ 
+diff --git a/libstdc++-v3/testsuite/23_containers/vector/bool/prX.cc b/libstdc++-v3/testsuite/23_containers/vector/bool/prX.cc
+new file mode 100644
+index 000000000000..bc97b9bfde5f
+--- /dev/null
++++ b/libstdc++-v3/testsuite/23_containers/vector/bool/prX.cc
+@@ -0,0 +1,160 @@
++// { dg-do run }
++
++#include <vector>
++#include <ranges>
++#include <stdexcept>
++#include <testsuite_hooks.h>
++
++static void
++test_n_element_ctor()
++{
++  try {
++    std::vector<bool> v(-15, true);
++    VERIFY(false);
++  } catch (const std::length_error&) {
++  }
++}
++
++static void
++test_n_element_ctor_dispatch()
++{
++  try {
++    std::vector<bool> v(-15, 1); // in C++98 this calls vector(Iter, Iter) ctor
++    VERIFY(false);
++  } catch (const std::length_error&) {
++  }
++}
++
++// A Cpp17RandomAccessIterator for which std::distance always returns an
++// impossibly large distance. This implements the Cpp17RandomAccessIterator
++// API but doesn't meet the semantic requirements.
++// For the test below, all that matters is that the huge value from
++// std::distance(first, last) causes std::length_error to be thrown.
++struct FakeIterator
++{
++  typedef std::random_access_iterator_tag iterator_category;
++  typedef bool value_type;
++  typedef std::size_t difference_type; // should be a signed type
++  typedef const bool* pointer;
++  typedef const bool& reference;
++
++  FakeIterator() : val(true) { }
++
++  reference operator*() const { return val; }
++  pointer   operator->() const { return &val; }
++  reference operator[](difference_type) const { return val; }
++
++  FakeIterator& operator++() { return *this; }
++  FakeIterator  operator++(int) { return *this; }
++  FakeIterator& operator--() { return *this; }
++  FakeIterator  operator--(int) { return *this; }
++
++  FakeIterator& operator+=(difference_type) { return *this; }
++  FakeIterator& operator-=(difference_type) { return *this; }
++
++  FakeIterator operator+(difference_type) const { return *this; }
++  FakeIterator operator-(difference_type) const { return *this; }
++
++  friend FakeIterator operator+(difference_type, FakeIterator i) { return i; }
++
++  // Return an impossibly large distance
++  difference_type operator-(FakeIterator) const { return (std::size_t)-8; }
++
++  // These are meaningless results but not actually used by this test.
++  bool operator==(const FakeIterator&) const { return false; }
++  bool operator!=(const FakeIterator&) const { return true; }
++  bool operator<(const FakeIterator&) const { return true; }
++  bool operator>(const FakeIterator&) const { return false; }
++  bool operator<=(const FakeIterator&) const { return true; }
++  bool operator>=(const FakeIterator&) const { return false; }
++
++private:
++  bool val;
++};
++
++#ifdef __cpp_lib_ranges
++// Wraps a std::random_access_iterator as a Cpp17RandomAccessIterator
++// except for having an integer-like class type as difference_type.
++// This one is _almost_ a real Cpp17RandomAccessIterator, except for the
++// difference_type. Again, we only care that the huge distance is
++// detected and std::length_error is thrown.
++class Iterator
++{
++  using View = std::ranges::iota_view<std::size_t, std::size_t>;
++  using ViewIter = std::ranges::iterator_t<View>;
++
++public:
++  using iterator_category = std::random_access_iterator_tag;
++  using value_type = bool;
++  using difference_type = std::iter_difference_t<ViewIter>;
++
++  Iterator() = default;
++
++  explicit Iterator(ViewIter iter) : iter(iter) { }
++
++  const bool& operator*() const { return val; }
++  const bool* operator->() const { return &val; }
++  const bool& operator[](difference_type n) const { return *(*this + n); }
++
++  Iterator& operator++() { ++iter; return *this; }
++  Iterator  operator++(int) { return Iterator(iter++); }
++  Iterator& operator--() { --iter; return *this; }
++  Iterator  operator--(int) { return Iterator(iter--); }
++
++  Iterator& operator+=(difference_type n) { iter += n; return *this; }
++  Iterator& operator-=(difference_type n) { iter -= n; return *this; }
++
++  Iterator operator+(difference_type n) const { return Iterator(iter + n); }
++  Iterator operator-(difference_type n) const { return Iterator(iter - n); }
++
++  friend Iterator operator+(difference_type n, Iterator i) { return i + n; }
++  difference_type operator-(Iterator i) const { return iter - i.iter; }
++
++  bool operator==(const Iterator& i) const { return iter == i.iter; }
++  auto operator<=>(const Iterator& i) const { return iter <=> i.iter; }
++
++private:
++  ViewIter iter = ViewIter();
++  bool val = true;
++};
++
++static_assert( std::random_access_iterator<Iterator> );
++#endif
++
++static void
++test_range_ctors()
++{
++  try {
++    FakeIterator x;
++    std::vector<bool> v(x, x);
++    VERIFY(false);
++  } catch (const std::length_error&) {
++  }
++
++#ifdef __cpp_lib_ranges
++  const std::size_t min = 0, max = -8;
++  auto i = std::views::iota(min, max);
++  try {
++    Iterator first(std::ranges::begin(i));
++    Iterator last(std::ranges::end(i));
++    std::vector<bool> v(first, last);
++    VERIFY(false);
++  } catch (const std::length_error&) {
++  }
++
++#ifdef __cpp_lib_containers_ranges
++  try {
++    std::vector<bool> v(std::from_range, i);
++    VERIFY(false);
++  } catch (const std::length_error&) {
++  }
++#endif
++#endif
++}
++
++int main()
++{
++  test_n_element_ctor();
++  test_n_element_ctor_dispatch();
++  test_range_ctors();
++}
+-- 
+cgit 
-- 
2.55.0

