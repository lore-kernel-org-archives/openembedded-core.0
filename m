Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3DEC87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 07:41:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16753.1754379683584760840
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 00:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0312acd637=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5755o3N44028324
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Aug 2025 07:41:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4899n62duj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 07:41:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtfuZHxFCEZArM3hSDgVZudylLaIjhOWVcgGopyMfl4xVqZRp1ab/EU6CvFBNG1xF/RKWWNAMUr40eGmJK4jSJcvkdlMQ+xi4SsN9lVnmoxZxSqROGgl9fkuHqag+nVaQzA9Q5817FLDE9sXMApzjTwXjp6/OcTkoTL0At63gwTFkj9dqRG1HJVk5rzURkjyN5mQjSX+n8y1rkdhcOqkkbc1O0cTakAsCBSkGh7cmc9uVtVKKrIol5UuSt1IFS72cCHJ8SKDGnxs2ReIkYR1j+j8NGmoywVF2KFqTu0UNXS79LemCKJpopCrWCaM3c0cdhrbWNFpjRB5HfuQr5i6xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7qh8Y3AoJRNiko9PmJXw8Zehui6OTyYg1VJ0KD8oMc=;
 b=QJI7qabu1r8qVf2RpxqRQ/jXxW+rQhceWEM6F8A2S8MI1k7bvO/GO6uuMVgIq5GYpZS5c1LoEknES39ydlGmzkwbyAXvgpxq3RR0wreRHgF+JP5pKkrR1WJzex++xBa3b0D70kRocctgVz0FR6QOFbWZ4e5EMirfgE2afSe+8Nz5Hj/teY2MDlEi9pujBFxr9JdhPeR36021xyDYPk02qDPbydVn6KJ1qxunEVoH17rxYgtJyKG3m26afvsTDQne+yk5uT0IiTUwFPtM2R8vyvFaR5AFHaVsn9Kt7qMuGQ34YDF1clO2pf7vQ/bxyRUZQMXc56CXQWkFVvjHLn1G0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB7319.namprd11.prod.outlook.com (2603:10b6:208:425::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.20; Tue, 5 Aug 2025 07:41:19 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 07:41:19 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] debianutils: upgrade 5.23.1 -> 5.23.2
Date: Tue,  5 Aug 2025 15:41:17 +0800
Message-Id: <20250805074117.515426-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805074117.515426-1-yi.zhao@windriver.com>
References: <20250805074117.515426-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: 48262dae-03f6-40fa-2851-08ddd3f377ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gS62iyNeOVHMFA77bl5o/8Fuwe9VeRilpJ2aMGtC5COx4N/zQXWqYHl0TJ1S?=
 =?us-ascii?Q?TuU5aX8PX3aXxto8RLN8aS1WHtzRTEVOSXgRUZLnpw8nP6Wh7nLAzOB6eWdw?=
 =?us-ascii?Q?cRcsO8z6RimtXxkgPVMswvrqpoyjwObbV1ByX5EbKpDQ7f9PA4v21oF9gcIc?=
 =?us-ascii?Q?j3xqGZdgk5VwbN9Thni17LuFB1IjvW9pwqSuGWyAkl+qyLqdCPLD3OuufuxG?=
 =?us-ascii?Q?2N5cKwljl41AaDKCbuky6fqdhyPCRAYhGfmz72VcOV7gYwJM+hkUWJh+2JfI?=
 =?us-ascii?Q?X1ARBGXIGbEBudoVoU/5IS6yFGpYWU9BevtYk622H1oP0hU2l59l7dcbDsLA?=
 =?us-ascii?Q?iPFqEPy3nGLB57kUYWJkSeQWquLNFa4Ozuo42RUpBTIx1zSaRTikchFKCKi0?=
 =?us-ascii?Q?92j1hWG2lj5CyCCWXxQDdPeecRIWYhJa6ACIRcZc2rPnVpSccDJx9QAWrBYR?=
 =?us-ascii?Q?eoECjd5l3LEviU9+hrxNYAUqBnkYJotsMiYX0jQVKbKAZrd3nxxBE2U/64hG?=
 =?us-ascii?Q?RC2Jy/jeiYwc6GAgmXuHrF07jT8O1jzq+cjsTUgMbfo1mue7RNLt+ihhqIDY?=
 =?us-ascii?Q?q86o83JaB6PoNbTQxgVMftz6c9rEbiyU00t1SDzwirT+WYaypS5ChpD1S5Nq?=
 =?us-ascii?Q?IsFl844z+fWYXyWsQHSouDrbLqElefFJVBAETlv7gCJMku2eXzsg9ZL7Tzzk?=
 =?us-ascii?Q?EhQdyr6udnjI5b5S8RlL9wT25pyUoD1tIYI/nzMg3Bfphfh4vZQ87nPyKED2?=
 =?us-ascii?Q?1+ec7levafNJKj+TFS8yJhADwkTmGp9AM+9nt+XwdXOH+yPuzecPa921TMWC?=
 =?us-ascii?Q?LItHzwIjrvSTZjwpJlXVY45MG43xjIl3CWi+aoZ7jJatw3lX++BK7H7wsmE/?=
 =?us-ascii?Q?+b+ALB6LeE8P+cdayYPfxbcTwCpzZ6r46Gmva7tFlUhRghhjuI/SoF27dKqY?=
 =?us-ascii?Q?mp9+x6bwYO3Ee2WrVXymwDzP/Aa8xF1zM3a/fcI8SKcb+XX2pJZ7ZyXneyDi?=
 =?us-ascii?Q?jNkoQgTZ9Wu8gddL6r406baVbHfQAf53OzTIAD7bamSDRIfWBW0o6w0fP5qU?=
 =?us-ascii?Q?gdpNJ60eH4KEL7mGraDpZ02QnJGsC7ZO94r1tcUJ0vZsRYcsh7iJ+Zql66HE?=
 =?us-ascii?Q?6pJqFffLAejDx224h4r+yTZ88sIG9iG71zZ2bSmJf7RY71QOimFCA5I9LpF/?=
 =?us-ascii?Q?Th5ukN4el03I+/UmHnr+Ufi0US/nczUZT5RH0w+2FkToHeWnT1Gb5XlP2TeE?=
 =?us-ascii?Q?iMl/noYOeH/6139J/dtrfHZkKXYZz/lDNCndMxe8IJSReoWWFdza6HwSzx5p?=
 =?us-ascii?Q?JQbQ0Kx+GMbPTTjVKpStl1dc9NlwaXIKdzn/B+4cVNbIppN8Im0KW8MZrWa1?=
 =?us-ascii?Q?yBEW8zdxxNhVybqOsxz74v40CgHs7j+2gvhzuMJNMzIhGQUTLMOlH3Qr6f8/?=
 =?us-ascii?Q?TtFcX3Za7Cob1hktOia+CmBbgif71cgtvyXRlvKdPweRa02lbUFT4g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cuUw+XnTO8Ez4PrGywUPJE2gDXtkWighZf2ii1K9xJyUBFohi1PuLHEqNjGn?=
 =?us-ascii?Q?HklxJy5YvYluC3ivZjvsgC3htUqNtTc/l8EygdXXvEs+EzOdjn3PUA+9E/0n?=
 =?us-ascii?Q?iGvjJJyVyrLFE91bjykHKh6bfowWAqDWAlAC/k1/fukQmRIRUXbKIz6wDrVp?=
 =?us-ascii?Q?4hOWPuZlIo/qEkoEGyTehBc+krCtRFwNWA7M4abFQ4yx1XZhb94TMKapAUj3?=
 =?us-ascii?Q?DuXEF3i5twe+B9nl+2CCxbMxqKRJbyqPBU0GT5f7ul5nXcQO8NCbjtjsr9G+?=
 =?us-ascii?Q?ZEVV3EsO1f0GOA6uMR5aqJiIG3KzgFsJtw0fvSImUgLBFA5uAWHHT99+hi++?=
 =?us-ascii?Q?QcGtB8U7pHcLUG+rIbBkqmCqg2qMNaYiorvKmqAJCQ+SmlzPQkkmDb7jMwKn?=
 =?us-ascii?Q?jN0+A+6JYnvStBj4fPnNqCtFjs5nooxIWUUfO6Z2BVhDwbp+Vn0jJg3gbvg6?=
 =?us-ascii?Q?Q2traEuKBJ9nBgRI0/vSfERVYjb7dIqJo2OKva+AAC8asgpg5lOCC/hc9L48?=
 =?us-ascii?Q?szkNIkJjMLVrmkeMU9+m5NdXjQ2gx18pyrNe3Gxh7lM0/Rruqdr3caQxTzoi?=
 =?us-ascii?Q?8cBakz9v2rlHbvDiUIVeaCkF5SnzTLRP0V/zpIU2A6QzRpdbxAdAkkgkhlx8?=
 =?us-ascii?Q?wxb2snFzndg7awDUaxszLegk/V6MuLecw8svKA19nkv6Dmr1yI2Y0RAAAU+Z?=
 =?us-ascii?Q?VsRzt9Z3jy6p0vxb6iNLb1Pr0jz/cp0EZ4STVib/nn8CG7+hXeKZAjPEqT/a?=
 =?us-ascii?Q?/Nfaqtwmksc6Rq9FwcmObrXN9FFCKuwu5mceFoi/dx0c4eRa1ZDA1J4RGCH7?=
 =?us-ascii?Q?Jk6l3Fo7ozXeUISIfQPtOOM4rVns1wdS7ju4YIXSnqa6TqdRyUqE0z/t7C2E?=
 =?us-ascii?Q?c7JcPcSIywpxA1W7kXLry11cy3HAP76mzSsk4vdoZcgjleCdRYA4mSXDSSe2?=
 =?us-ascii?Q?zgNZzau3JIRJhP3WitRTGIq4RdGZbthL3dMYDV+eGiL4/tT1ys3B0OCq5W1m?=
 =?us-ascii?Q?9DHuRq4BMp+tBLWZbjztkFNGFuDWeFceH2vqlLqYs/A9/BR96fnBjyOd9zit?=
 =?us-ascii?Q?ax39EUAfF5FrJcSmHlwkHpBXc3ySdy5rrH8jzSjjQ5I3sBR6MhL9dRxlS6q6?=
 =?us-ascii?Q?etRfUZEW6c5muyaVuGa5iC0v3Adfm+rqvWzN0woG6pyMmTfX8yCakZN2ZRp5?=
 =?us-ascii?Q?w7tVLGG+g0PgjqLvQTezOEBDC9sNDPJK0Vi8kDhGBjEfnsbytmdDYKCsQfFc?=
 =?us-ascii?Q?egghHRXe6dIIdOdyGaJiN4qs8U28GPtcVMCJPMbmLrLUMZzywW3e/SaFlzfJ?=
 =?us-ascii?Q?h2Mclyeqx0wo9itisuW3iQKtJlYTE44EDkwe0CrgyvbbENTxFFHBfkAsFXki?=
 =?us-ascii?Q?qzY9bI1spLGUzJNizKeab/JraXTNFpf0n+ps0Dqh6YQ45DNVWM0aMcdrWQgl?=
 =?us-ascii?Q?MbCxh5VqntgQEPTUjqPhS5uKVZRQVAR+82Imeh7fLRfA2DaSbrO09f+y5THA?=
 =?us-ascii?Q?u20a+dn69yCpaoRu9HH/OoLPn+z1U1TfFCdhjOs5YrMHJ6ELCXuw7DmGiBMp?=
 =?us-ascii?Q?YWJnnUF0GD1SsdvFfIsew1wPAL4mqpJFWAbPUOEC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48262dae-03f6-40fa-2851-08ddd3f377ae
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 07:41:19.7863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csskvzPXXWAz5ix5mOAW2MmG8ZIis0JH5+wN5c1bf0D7awUF8PsN9sTjuceMIzqZ92TXHDXtZ5XQjsGCkwyAAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7319
X-Authority-Analysis: v=2.4 cv=EP0G00ZC c=1 sm=1 tr=0 ts=6891b5a2 cx=c_pps
 a=ZMlgkNkj7zZq27zQSNy95g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=xNf9USuDAAAA:8
 a=kuZfx865xTl7LJEx4KgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: JydY_YsPKf4qK6LOHZ-va1xij7vrwSD_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA1NCBTYWx0ZWRfX5IwkAIwk+QBP
 VtYeH7n05u/5BsTQKPFYYhQe+Cs4UiZWjx/yYczrQJrjUnCa1GQC16wQpn2T5SNDvEJFT4Ny6DM
 wHeEpaNmJfNFj4tKci/0eaO+0WVEBxWAbwkrRBiQJZf6ARg/0nkIUYUUnP0ea6duzgiCz8RjZ9k
 /hBMTtL9mKNnCsveJoJqKDcdDlAc8m/wTk0UfhIp54jMlr5lbMqLqZMKG61UwP0OXCVW2iMMzxg
 CPw6kU86FXg+J+8YUanOKN0pFkrUW/rE8PkvVD/XZMo4ZqNQxY5xVYIAyJrkQgTZAlJPeUa2Tca
 xzInHSGBx7C/SdYSUAR9EVkoeocBcVFZFG8DNF9TMV7mnz6ucBIy16ARCzZq2DJk3nndZsmayh7
 cAj88Zyu
X-Proofpoint-GUID: JydY_YsPKf4qK6LOHZ-va1xij7vrwSD_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2508020017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 07:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221460

ChangeLog:
* run-parts: Remove warning on non-existing directory with `--list`. It
  was emitted to `stdout` and even on `stderr` it would cause issues.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{debianutils_5.23.1.bb => debianutils_5.23.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.23.1.bb => debianutils_5.23.2.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.23.1.bb b/meta/recipes-support/debianutils/debianutils_5.23.2.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.23.1.bb
rename to meta/recipes-support/debianutils/debianutils_5.23.2.bb
index 96ea9063bf..b2e984f7dc 100644
--- a/meta/recipes-support/debianutils/debianutils_5.23.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.23.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master;tag=debian/${PV} \
            "
 
-SRCREV = "ab0eaf33b783ba578773af2557753d2b973ba5bb"
+SRCREV = "b999bb0969471d302f1db85e58f17dcb64f274c2"
 
 inherit autotools update-alternatives
 
-- 
2.34.1


