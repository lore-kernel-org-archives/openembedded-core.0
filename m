Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3B5C021B8
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 02:12:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1847.1740622331836668333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 18:12:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=415316051b=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R0fFSg011452
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 02:12:11 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 451pub9hbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 02:12:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pskvYb2Bzi9TJIsrcLpV5hc0lLFFVFO7D6Kyj8Pj7J5RyoXfAgJ5xsPSvlScokqIx/0AotnrZ8NIbL3jJwIRFFGK9GurUqRVDZz02axpS5O2l//eCnFIggwvhoePFoFJZECT11uxJFcpzdMXVlKV0GnAxY+BXe3izwXTFA7RjPWXQEW+g2bX0+w0dL37PyoFjrrklZGCMtKJKklIu3sBTxVK3HjRUnEg5BWlvg/aUpnv/qhI7SaH8jVBYdhUs+EwpjbuITOcjS4fKTo/x5HrqpD32mCEes6wg3fUdA3wCDSe/yxIyVoRpc79uuTPeTt/aXsuUERAO0NOjAuvJLV52Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wnA6WWcsTIFExtooI0nSzdkTG4xwnuQZXu9GBIEeLQ=;
 b=bQ6Y+RWGOchAtaU+0CkNp73z3oLVB7pqNdEelYeC3OW1JCkkmLujT2cy4ZJJNI9XENRFwfwtRslsx5cz4SLigR3QkeMzjyN1OcX3MHDtPeUh3XpjvR1pvNFzJfmyboYyQ66p8HOJgXNN7JhbIEdWvqtCHtJ/d1rmyli9pzC8HKtaU5opwSI50x7flhyawkKr9aNhmHoMppPsN+BjbHJPEKerAt4Aks2CeWHs6lmrDQBdobEDnmFQz4S5CA66Hy3gjeUXBysVcipWF/pwkSDStKQCGwKgPiJjk7F0mQhx4sPyXSInsnGeABpt6TWVO2I3oSGxfdHhSMtOn0jG/LIyfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2671.namprd11.prod.outlook.com (2603:10b6:805:60::18)
 by SJ2PR11MB8568.namprd11.prod.outlook.com (2603:10b6:a03:56c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 02:12:08 +0000
Received: from SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326]) by SN6PR11MB2671.namprd11.prod.outlook.com
 ([fe80::3e06:cc6f:58bb:3326%6]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 02:12:08 +0000
From: guocai.he.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][kirkstone][PATCH 1/2] tzcode: Update SRC_URI
Date: Thu, 27 Feb 2025 10:11:48 +0800
Message-Id: <20250227021149.628653-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::35)
 To SN6PR11MB2671.namprd11.prod.outlook.com (2603:10b6:805:60::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2671:EE_|SJ2PR11MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f64c3b-25aa-4fc1-f529-08dd56d42376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5N3ddhpydfW09gDLyLef8MndwQ4wXDb1lOjQ5VRtW/OVQ5BbKGwewJAuwLbl?=
 =?us-ascii?Q?v/cTPbFAcTSlm6/Vh4hX6CTVQi9VksqWqPyRy54kVIBWqr4zgWZV4goY6IzV?=
 =?us-ascii?Q?a5DLNipo/b9z4nYMrJdG3UfNal+TykMBvslzh6JeMuNAavT6GThZu2O2K1Hp?=
 =?us-ascii?Q?AmylWIJgfVFRQtMjx5eGpLRwVERzHzeQbEUlVUBBVXgjtAmEluIosEb+BC/p?=
 =?us-ascii?Q?4srxyC9wDuQyC+eS4Zywo2u/61rTyW2aorjhYOEkMYQzmBoINkcc9RI0kOHC?=
 =?us-ascii?Q?aY6jzSgk7mtn0/Zcw/yeYDdoT7WBc51X8DV3JEVGWbDs9u1GgGaNR3PRCnI/?=
 =?us-ascii?Q?xzJSo2e0+0FFOSuVAS/Inm9vWbKwFQf6H/aY64kn7oXZDLahOnAo0iuoZKSQ?=
 =?us-ascii?Q?uMh0OHf/8NbtnJDisbAI3jJp6PwsVLaCGGbGfqyrmNK5kbVinAC3y+gfCWeT?=
 =?us-ascii?Q?o+7Ho/dbb/RmU9y0ioUsYqnBveIFaga1gN2kBTugQetlWbwzYL1g1HmYedLz?=
 =?us-ascii?Q?7R6zy2FQAzI3/WQceB2nMlschetTyHIefguTir1XpIx8SwA8Ilq8OfHeqzBG?=
 =?us-ascii?Q?QWq5TkMLWHV/OSdYm+Q9fGuxbDYN87wz/LGM5Cii3bnGyikO3tbADHaSoTUr?=
 =?us-ascii?Q?iX3SoZ/wzi+HL4ek3mWk9vNtz+c4EEba7rj/zksUgvPlrl/nH728Na9PE162?=
 =?us-ascii?Q?B3tYWHmBj3KZ5vgDzm0iOUqSaiThnQt8RgaSdwYC6QyfoufkLNRbRPyXh5fA?=
 =?us-ascii?Q?yKdTGJ1u/JZNycDFoJKKvgxF0KWl9lyRZity4e5a4uw/5xgHwglZ617MrgRS?=
 =?us-ascii?Q?gh7Mt6y+nPQ+0jSmCSk22Gy9/yrYl6lLGdYJjkbfpKANbiJABSEG+M8vZk/k?=
 =?us-ascii?Q?0U7EUu8ROZLq0IbRnPO/8r3XX44IjmkUwK+A+Gs13PwBVhDu5NoCZycVpONC?=
 =?us-ascii?Q?vK8IrVyHAt8Q0jsuaYjvEaym7i2ZT70wONGxsu/FfCOpxYvc5HqSkR25reR4?=
 =?us-ascii?Q?hDuGeYfEkrCwA5k4YEpDFVverWVY9Vbop/loUMFrhho6Zk3XBCpofSrm/6s9?=
 =?us-ascii?Q?3X1JOqJwztMWah1FY4i/1Gp65qizJ/+R1kWlI7VETim+OYxunaiOCpQKGZ/J?=
 =?us-ascii?Q?sUjyE4GeMMl/6q++UhtN9vz76VPaKZRqqJhaDWUcluhOFaz6rDfdBK2KhnuT?=
 =?us-ascii?Q?u4kBpKp1YA8mPZ2rQgK1QOBKoKnqWc7cis2ZMUcCJ8YTaFnz1RI7j23xkfK0?=
 =?us-ascii?Q?NzxXIPG+BYILTOrLi59ACNuYoTx6OHvyCPEHAxRLBcnQi55JXKbhilODiH0A?=
 =?us-ascii?Q?D6yUzwXAOfZ47tfP+UsTYKR5HUZO00NsA0qyCo6obNVVkQSI9lh1xMRqW7qy?=
 =?us-ascii?Q?SfSSvYmpD4SKRO2Ta76NVtAS89ILvZsc1Uov6cZG0KPoe2eES23TrM9YyYYl?=
 =?us-ascii?Q?4rezATOz0oouyqgD+m5/hCzDMRR6BByf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2671.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ipMItNzmD7zSAYlHP8mBYStIWV9swiHKIrAu/X4GF73fYXLQhBLFPDNNOvr7?=
 =?us-ascii?Q?oqNBAnXYtjKm2y+835m4nylV4sPm4Mw742U9Dth0+2kuXhdqgeaK1U48a+HQ?=
 =?us-ascii?Q?i/kzI8xzVsZO9USGLBrWc62IF+MTSE4Kt+4Rl1CEf/ZdSCsFCUUGMA2PZvvi?=
 =?us-ascii?Q?2dyrwDzrmghWmMH7eqcy97oaCZeTpvT1VhwqcqLWl8E82hyo0y6Sj1DPZlyR?=
 =?us-ascii?Q?p1YAgjnOVjsQM1aWK6JSJ5LdupCXXBLfZG69OR5yP0Ht4uFa0hu8rzeJgaRV?=
 =?us-ascii?Q?FKL4Ruzs8LXv4u35wJv14kWFePwr8T380oJvByeLXAMFUIWZlG+QJtJYVryf?=
 =?us-ascii?Q?gACT93npnLSJ4h9p2nuZ7WyYTUxAfPPhfQB1r/sBBXkvVbOroPELng2FbXj3?=
 =?us-ascii?Q?RDuBQl3ue0AgxSyPL7uC8Nep4n1KK1Uqw5J5oyqakVHGoR70zIDmJGCbI+Uy?=
 =?us-ascii?Q?+3USnVxwTzBtB6W725yDT3F2K0seb7kUsmPoUffe6DmyAUuLcfcutpdKM5M4?=
 =?us-ascii?Q?iS87GpsBIgcUV3FuTMMKTMvQUV95iOtzYFW7rBaYakeJaQ2BmgCowebYaDMu?=
 =?us-ascii?Q?R86nfokWQ+H4uPapa2/pKQj2xp+vXT8bJ/LVHelgebPOtnkPS+ivAI26iVcZ?=
 =?us-ascii?Q?JwPJAo4ezmgW0O1POAiq5ccmJiL7mt1Nxegl+nrxglBv46iZGF2QTvt1GWaY?=
 =?us-ascii?Q?JILHH/RIIx4NwfqmatugtkEobylNoRnY7qEI4ha5jHrfjf1OXKKz/PSQEv+L?=
 =?us-ascii?Q?IjtDvkuqBwxAXJl9XmrMFZFy3lIvoWrUDX58KZZOqy2HnUQg7E9eAKmnbIMw?=
 =?us-ascii?Q?KZjnWq1QLnqHTCTgS5dSRgTlz/iUTdzU7fcc+jPqfN/ueDA1+qxEShTDM7Hy?=
 =?us-ascii?Q?E94oa0sh3SR2wzHL9ULpd0KPH9vpPcWFskrVXifjXj+6Xxf43oWgtcHl3Knk?=
 =?us-ascii?Q?fDFOxDYEJA91XI5amzwbQ4rRH0kFy4Zq6r7aKrTezD6yMzTOiunHEK333hMi?=
 =?us-ascii?Q?Fqoc5qIVggn7LPoyF8RCaLPubom9rjcRN5Vzy6Cb07khYBHmEn3KChIhID66?=
 =?us-ascii?Q?HoqhWbRh19YzMqMdXnoK0TRVz9XiTJDQ/wIsx1jF3G9MYFi8hlTflrbYhHYu?=
 =?us-ascii?Q?gy19FUR92Gjb/FeYoUG1a+FXuJkmUbdT45m6FwL634+L/khpiIDEU+YAwXVT?=
 =?us-ascii?Q?hS6nfGGUc3hGWaXFF2DZY14Q9CAVNNToeLpb1C3NbRRxNaGBEC/M54mEb7yl?=
 =?us-ascii?Q?MnfFAD13T45xh9Daq0iaztMX+rDe5bN93FbD6SwcrgWF97aPTgh2CsYcoGdm?=
 =?us-ascii?Q?qZ+EinrKF8Akad2PvGmS/kMnTd63vehVbtyatnF3sp5pKnuv+93sJpX7BOjL?=
 =?us-ascii?Q?Pd7rilJV2iEdej+THaso6JnQw5RiIkg9int/ht662gj725zHZUhz+o3zagmU?=
 =?us-ascii?Q?PhWgFQ3wytvXoFgHwC/tOlepLCeGQM56Wth6dGMZ6N8HILcQPqnt56eSQDrE?=
 =?us-ascii?Q?Pf9XCnfC2kRtTcf+6takNHahDwOS0LzdJHWXdo07wXVPa/KU5lTku/3Nm0M6?=
 =?us-ascii?Q?bIIkKSnue5G/slsmKF/GQHjyqi2tmxSvzeW3yxQxKi2K4yX6QbGeof7ddgLm?=
 =?us-ascii?Q?1Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f64c3b-25aa-4fc1-f529-08dd56d42376
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 02:12:08.6839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/yBspnHW3g6b8AhawxEeqgcmmHgX1JXj1Gm8Y5HTZRWqHWO3Zcj192bSUfq+pXs6vqolbogHVlDbLHcuJnunGD2g6N9raHrexkD2hJLyLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8568
X-Authority-Analysis: v=2.4 cv=S9sjwJsP c=1 sm=1 tr=0 ts=67bfc9fa cx=c_pps a=bqH6H/OQt14Rv/FmpY1ebg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=I0CVDw5ZAAAA:8 a=t7CeM3EgAAAA:8
 a=UVGsvvPNZjscMflNSc0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: K9bTiwq4nbHawTq_XgoX9uFvSRIk-CB0
X-Proofpoint-ORIG-GUID: K9bTiwq4nbHawTq_XgoX9uFvSRIk-CB0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_01,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=915
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502100000 definitions=main-2502270016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 02:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211973

From: Guocai He <guocai.he.cn@windriver.com>

Update SRC_URI for tzcode.
Update the http to https in SRC_URI to fix the do_fetch issue.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta/recipes-extended/timezone/timezone.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index adf095280f..8935d1cd8c 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -1,20 +1,20 @@
 SUMMARY = "Timezone data"
 DESCRIPTION = "The Time Zone Database contains code and data that represent \
 the history of local time for many representative locations around the globe."
-HOMEPAGE = "http://www.iana.org/time-zones"
+HOMEPAGE = "https://www.iana.org/time-zones"
 SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
 PV = "2024b"
 
-SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
-           http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
+SRC_URI =" https://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
+           https://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
            "
 
 S = "${WORKDIR}/tz"
 
-UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
+UPSTREAM_CHECK_URI = "https://www.iana.org/time-zones"
 
 SRC_URI[tzcode.sha256sum] = "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
 SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
-- 
2.34.1

