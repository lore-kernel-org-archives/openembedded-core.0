Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B188C54732
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 01:48:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7359.1724377708965556344
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 18:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=89658b1c4b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47N1O2ZM009100
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 18:48:28 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412uck5rav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 18:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJdFkXKNQuk1GJB+4x1aPS+S57s9eIrN8H9Y/+RWeJhbfo8ByRwF6iAc/PJ6sRp+Zhoq/QyVnx0jOBMp8tmYrOE0ML1bGLmAt+OSHT/FaluBIU9XQSpRi2LKqJ8rHFwZ+KiYxqjuJ2s+xNgdmNd9T+mdfklnRoActVwHxAI8sNdSbm0P5e/is7PwGCY9l39KVQHHfBdHAq8cp3o50nN0Tqa3Ni/GMCr6O3Nx5mNffT28FmFRs0LMxBQ2N+Cjc1M4iUVWn/MhlPF4/VkN1EroLoJkwjYIzoFwzKjA16Tm22WGehXgBvyG4t2ngETODHO/y/3n92vWzGR8QZUygIItvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RskeFbn6Csbi9Ou8tyaK4JB+pZ4EnKuzbFjou5X5eD0=;
 b=Kv09X2t50AGtQHmW6WmjppWgi44Wvr8xqEeLK4kKzDI5swN6DSKYvGdG5W1rf+qGLUGLolwV2zNpgIfh4hsg7Caq5wBIyHW/5h0ri/b3FWJfGu6LIJSAyJtA6zBOx+svm/elKBbHFJZzcKZXbq+S3pmMu1DgGKzBz4/TE/3NcFP7U6F6pN7VOR7rNGU4Og20u5C5cR8KCmvgDAzcHO5c7pjXoc1HmlejerfCN1QRI2pMWWLAF9mPPqyQDCA8Wb7mM0faP1xb5jhruSIs0K+RmNdL7B/AZkoBUBKT5cBohwwhIj3jHbKKGQRVSn8SfMi6MzX2N1qghb2+Kj6jSlMmEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by DS0PR11MB8114.namprd11.prod.outlook.com (2603:10b6:8:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 01:48:26 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 01:48:26 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky][PATCH 9/9] gnupg: 2.4.5 -> 2.5.0
Date: Fri, 23 Aug 2024 09:48:06 +0800
Message-Id: <20240823014806.4154590-10-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240823014806.4154590-1-hongxu.jia@windriver.com>
References: <20240823014806.4154590-1-hongxu.jia@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To MW3PR11MB4633.namprd11.prod.outlook.com
 (2603:10b6:303:5b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4633:EE_|DS0PR11MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e6d8dc6-2767-48ae-0346-08dcc315ae1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uTRfo2rRCXwbf6xveWq70u0w/NF3fXOZRu84FDRj/Q8cdm7fLQGtwPJ03p0X?=
 =?us-ascii?Q?y8MH2HGyYyvtR8HpWeO76Bj74N75lgKmgQ5MmDUnV8C2Gc32ttpyFmtgH7cm?=
 =?us-ascii?Q?UrsHip6Sm0LjvSgMgRbNhGxnQkVltS+D+n8FbhYkVwlYj+J9blwBPFf2o9kJ?=
 =?us-ascii?Q?kZTKFq6AT0V3ld4rZGRHOYByrpwijGW9M77drFD3xQNTQxbKvrxg1To21FL4?=
 =?us-ascii?Q?3B9gEPj8Yw6nhQhCtofLYFhAeBFRTch0ZDfG1bhSL0pRXH0kYeBq75UqfQv7?=
 =?us-ascii?Q?L6kX9LK6B5hIcDkJTW+fH8QVbrWGLp3mxuBzhDOZq5YyqTjQ9qeWGNCfnFsN?=
 =?us-ascii?Q?Tb7yPVmvHop5LoYse2w0cn9Gbs47i1q9POnTzElqzEzjCtBc1bJ6r4PBI//t?=
 =?us-ascii?Q?8oRr1tlV7ibRKvaPADLDbHB9WMkOzHgBx1tY2qSB60c5YJsRnFkvOYPich71?=
 =?us-ascii?Q?hExvhhPw/8UNFS6VRzc6XZUBX4teaSDA7DpOTussmfbHpgmMG3D4zz2zmJx5?=
 =?us-ascii?Q?PW2pOV39Ah55LGxYWqK3J1+ldUr1E6/hZJOOYdEfoPJzWl6vAUBAEzTZhEyq?=
 =?us-ascii?Q?jWzqmKaVwgqlQqUdPAeQ854TCLiXfPfvpnPNsWoRZVM6bVjcdOj9/Sbv0swR?=
 =?us-ascii?Q?EHkVg+WWVazdHr4BfqINDCkrGWGCTiSMsFYPFcZjc+xmEcYFRruhOMZ1B9b/?=
 =?us-ascii?Q?fz58SipznpXt6Jh7FownUQ2kvlJQVow+MVSHX+5Dug27qD0pesDk3MaeWG7s?=
 =?us-ascii?Q?iMN0CJbsSfYasb4saGIBFz38HABkOfO+9rbwbGYUrW4AojOCcrs5R7giUv37?=
 =?us-ascii?Q?nrIL+fPoRBvia1y39+qTucVQEIVe4wy88YXE9bTpUZHhUVh37JARo16TEpWl?=
 =?us-ascii?Q?fR8de6sBUomr0LHlLiMAqyX3JOXMEUnIqNDYwCAoZEE/qkLLph+4IyXt2T4c?=
 =?us-ascii?Q?fYoUrG2gQYGVPnnBfBrVumy+OXYrv9hny92XJnKCwNw4xp6c2+s1Ylkkq0oC?=
 =?us-ascii?Q?Bn5Wr5Gw8n5KQG4UQG/gTalbYohNZFXi61vLDjCHRDQao+h7TLlAeH7zJR28?=
 =?us-ascii?Q?7WDw89dVsuPRKzPtkRTjaC9MivcmVdgMUWC1YkSM33rHcbSkV0cHAO1Y6+9a?=
 =?us-ascii?Q?feFD9Fg5kh+8OScv1Eb1P/FGsxy2R9UB0Ek5C9IF3f1pOylQdk363rrr1SY4?=
 =?us-ascii?Q?7/TJZ4EUF3n6rh6cU6vpKLHbD0WEs+yg2fVrzMv+8xSYwjFr7RBYJadyA58h?=
 =?us-ascii?Q?40P/w/UYlMgq6PNdxcDT6MgES2TRvklQEVVlqtjuzjET61wSury402WkZ7y4?=
 =?us-ascii?Q?jgFqevBIx+merhmeIDSe1u6QSBdHQhj1zj35RA3Ygdwto7ER8TGrUvTGeO/L?=
 =?us-ascii?Q?wzPdeRA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jux05J2eLxS/IxdV+ud+9QrdRrB0uIkCRpNI5Zhau12a/EvWa3BiTYdWlh91?=
 =?us-ascii?Q?4Ws8TftT5tNvbOhYN7IRKClLUWmHUoJhcDQpHP9ZKGw17Vxm1bVD3uNMkhqC?=
 =?us-ascii?Q?lOmhwvfOJru0FyftxF3yfzFCir3rkvyMn0ZIv20+dCgeMQLnebZ9k7hq6t94?=
 =?us-ascii?Q?5OdnT4x7lWLAmbOU/gDU326cfph285vLTdx+XaY7JsX6nfeQWwmHIx7kZ4Ex?=
 =?us-ascii?Q?CgB1qRn5PI6iSzzIhS3bjxkWC1cDWd1eiLXJwsqNHKW/EN+9u2MrkJGVd3D/?=
 =?us-ascii?Q?JGfLQ1M2s10MVs+ou4lA9Hxf3WSthXDsK/XMdx3XHce9wWZpVPqd/HsDocY9?=
 =?us-ascii?Q?jl8PZz6TitS/EL6892UbzUFc8BIt+sK0FGRJDsRIwIpaAsnNEWFr/QnYTHpj?=
 =?us-ascii?Q?TwhdtVxtpKu8qKurQbxcm9SItaBnTXscNHvDF8uzEMtdHvy5YDAg6GbORtwc?=
 =?us-ascii?Q?+vpo/Eou0tmtbIDzYT/dNZlHtjDs8LZqkTGEmjZwPH9euxpMtogA9GQXx1VO?=
 =?us-ascii?Q?ZV5xb4ptxlsMM1ivnxvrM5pXFURQlRvWPzrv69Ct+2bnAfTLGkYvdTJM1fjT?=
 =?us-ascii?Q?tFRJvzmlxZquWwkx7MBj9K8CJ99lx3yd1mmIBjyxinHADnbQZcJYj2DnRqzv?=
 =?us-ascii?Q?c3ehYsMwQ5xGnxP8xSdAbudKYh4LCIH7SfPbBJPqqA8jkp8ULZxP0HstwvlV?=
 =?us-ascii?Q?PyFfbZE/QDvavscDZVqir36byiirF6dQ0zvYSZ6q6YfRo9WjdlElJOCJ2iHY?=
 =?us-ascii?Q?6iWhhnt0NtQugH7K3yUMBBwFomhfdHP6ITF0K6hYHkH2KSCf+8UmDH1444Cx?=
 =?us-ascii?Q?1m5ePIioRP8mUAoWAxH7VBFljNsibXIV681gDR7INgqzwFCJnyE51yFHafi4?=
 =?us-ascii?Q?vyGmVdV9X7qK6Y4BtDgz0SafD/8TCyTIrTQB7cNmjKlUCeNHAGbCcvOhX7N1?=
 =?us-ascii?Q?jr9VSNl1+BxM/6GT2eqVpVCvlGloVqkB40So0t5IUPiE1YKCXrizFxP3gTto?=
 =?us-ascii?Q?4hqjy/BUTWjwZtn+6kjJIYDd7SfCmHZPSX45L8HXF1WWEMmjk304UKlwi2OO?=
 =?us-ascii?Q?qe5PxByT7G1SunXb92z6XbES/Y5B509y8IcbhWxFqT88XjFAnFT7cfvcnKqX?=
 =?us-ascii?Q?4S5fEYrsisX8Ma7HLbM1o/h5buyCW3HicbPj9VSEjWKeUMp4cuhZPoymQKey?=
 =?us-ascii?Q?jHpzECOflvdo0I3yFZUFxcRnbw+TMXrmDlpA9uHv0xBGC7m1jqk+ELu+Hpra?=
 =?us-ascii?Q?rV66A3qe7yP/uDLkoVhW8vh4p2UD8yBDnhqxA6eXFnyNqj5GQesBwPhTRmC3?=
 =?us-ascii?Q?zQWu+oBIGd7yC3YlPguZI5cjNulLr7817jkHgNAQIYE90J7GPrB0+FaR8nLr?=
 =?us-ascii?Q?MtcMsKq+O84CpL/+g6j5QsDYYziEP3PkyWew8DrPlS5uH+CcF0aXNps29lWt?=
 =?us-ascii?Q?IenuFpEvdRgtK8A8ED75oG/cF+8S6jZLxsGbSCE6thIUyz4dGDuAbOS2oli3?=
 =?us-ascii?Q?q7FrROUzuCMEgemofwfk/FjgCAzfjQwAsvfxtIRPvuXhWEYR+UvNwwrtAs1Z?=
 =?us-ascii?Q?LFSqHDe4rb5dLac7RMimGYqSTevmpxL4oWapg9p6z74LMhouGBJG4fOrVYti?=
 =?us-ascii?Q?/w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e6d8dc6-2767-48ae-0346-08dcc315ae1c
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 01:48:26.4368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7SAPYM8bLaPsyuCuQdR80FApiOwHKPNYsGYbfZgJAm252Cfoyk4la8MsqOnO26v7HGtgGiSCeqVomQWflUER+oBMW/ul6yzwH3aNw4wfjRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8114
X-Authority-Analysis: v=2.4 cv=SIcQV/vH c=1 sm=1 tr=0 ts=66c7ea6c cx=c_pps a=28bFCgguF5sZfysLuYgbMw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=GwUem0DFAAAA:8
 a=QyXUC8HyAAAA:8 a=cYZBkVnQ82N_0yLFABYA:9 a=9elNzGoonJZXiKvC:21 a=FdTzh2GWekK77mhwV6Dw:22 a=r0dl5i_q2XGqDZkti5dn:22
X-Proofpoint-ORIG-GUID: w9NkQu5pe3HlERazjRu5d1ajha6SelZP
X-Proofpoint-GUID: w9NkQu5pe3HlERazjRu5d1ajha6SelZP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_01,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408230010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203676

Fix compile failure with musl

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...erride-init-is-not-needed-with-gcc-9.patch |  7 ++--
 ...-a-custom-value-for-the-location-of-.patch |  7 ++--
 .../0001-fix-compile-failure-with-musl.patch  | 36 +++++++++++++++++++
 ...use-pkgconfig-instead-of-npth-config.patch |  3 +-
 ...h-fix-find-version-for-beta-checking.patch |  9 +++--
 .../gnupg/gnupg/relocate.patch                | 19 +++++-----
 .../gnupg/{gnupg_2.4.5.bb => gnupg_2.5.0.bb}  |  3 +-
 7 files changed, 57 insertions(+), 27 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
 rename meta/recipes-support/gnupg/{gnupg_2.4.5.bb => gnupg_2.5.0.bb} (95%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 83195b5bd4..77d7507edc 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From e3adc816d2d56dd929016073937ba24e01e03cb8 Mon Sep 17 00:00:00 2001
+From 6392cb71a23adfd601537049da4e5e06e51d2e50 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dirmngr/dns.h b/dirmngr/dns.h
-index 024d6dcc8..c6e141e16 100644
+index 1f647e1..334acb6 100644
 --- a/dirmngr/dns.h
 +++ b/dirmngr/dns.h
 @@ -139,7 +139,7 @@ DNS_PUBLIC int *dns_debug_p(void);
@@ -29,6 +29,3 @@ index 024d6dcc8..c6e141e16 100644
  #define DNS_PRAGMA_PUSH _Pragma("GCC diagnostic push")
  #define DNS_PRAGMA_QUIET _Pragma("GCC diagnostic ignored \"-Woverride-init\"")
  #define DNS_PRAGMA_POP _Pragma("GCC diagnostic pop")
--- 
-2.17.1
-
diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index f957f6b55e..12b1447138 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 6b581c43bd01f815db78a410fd3814fc5994171e Mon Sep 17 00:00:00 2001
+From a0e986b487891ef8e3bb41b95f969e00edd4923f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -8,16 +8,15 @@ This should avoid clashes with the host gpg-agent observed on autobuilders.
 
 Upstream-Status: Inappropriate [oe-core specific, and only for -native]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 26d7f7b..e953c2e 100644
+index e4f8c0e..fa75ec8 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1921,7 +1921,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1925,7 +1925,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch b/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
new file mode 100644
index 0000000000..fef05cf3c8
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/0001-fix-compile-failure-with-musl.patch
@@ -0,0 +1,36 @@
+From 4a7d4d6e45c68708ec95335b0f11d6596b23095a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 22 Aug 2024 15:31:16 +0800
+Subject: [PATCH] fix compile failure with musl
+
+```
+../../gnupg-2.5.0/scd/app.c:379:3: error: implicit declaration of function 'write'; did you mean 'fwrite'? [-Wimplicit-function-declaration]
+  379 |   write (card_list_lock.notify_pipe[1], "", 1);
+      |   ^~~~~
+      |   fwrite
+```
+To access the Posix low level file interface such as open, read,
+write and close, should include <unistd.h>.
+
+Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=1d5cfa9b7fd22e1c46eeed5fa9fed2af6f81d34f]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ scd/app.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/scd/app.c b/scd/app.c
+index 926ab79..7bf58a2 100644
+--- a/scd/app.c
++++ b/scd/app.c
+@@ -23,6 +23,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <npth.h>
++#include <unistd.h>
+ 
+ #include "scdaemon.h"
+ #include "../common/exechelp.h"
+-- 
+2.27.0
+
diff --git a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
index 0e58fd4c4d..945abb55ff 100644
--- a/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
+++ b/meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch
@@ -1,4 +1,4 @@
-From d9048788d906774b1475c3bb1b17e22455c2add4 Mon Sep 17 00:00:00 2001
+From fa93b5f7c2da0e5846b80de9c6296966ca2a3d83 Mon Sep 17 00:00:00 2001
 From: Saul Wold <sgw@linux.intel.com>
 Date: Wed, 16 Aug 2017 11:16:30 +0800
 Subject: [PATCH] use pkgconfig instead of npth config
@@ -9,7 +9,6 @@ Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
 Rebase to 2.1.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  m4/npth.m4 | 53 ++++++++---------------------------------------------
  1 file changed, 8 insertions(+), 45 deletions(-)
diff --git a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
index d664c36a1b..761fd6c608 100644
--- a/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
+++ b/meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch
@@ -1,4 +1,4 @@
-From 6a7f9b71d936847dcaeeac7d1b69d8299be4dd85 Mon Sep 17 00:00:00 2001
+From e8f67e3bbbdbaa17cfe88c1f7a8f488eb4936281 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Wed, 16 Aug 2017 11:23:22 +0800
 Subject: [PATCH] autogen.sh: fix find-version for beta checking
@@ -13,20 +13,19 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
 
 Rebase to 2.1.23
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  autogen.sh | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/autogen.sh b/autogen.sh
-index 0abf103..78753b5 100755
+index 9f91297..116fb7f 100755
 --- a/autogen.sh
 +++ b/autogen.sh
-@@ -237,7 +237,6 @@ if [ "$myhost" = "find-version" ]; then
+@@ -270,7 +270,6 @@ if [ "$myhost" = "find-version" ]; then
        rvd=$((0x$(echo ${rev} | dd bs=1 count=4 2>/dev/null)))
      else
        ingit=no
 -      beta=yes
        tmp="-unknown"
+       cid="0000000"
        rev="0000000"
-       rvd="0"
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index ea0252026a..5c4d81f87a 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From c50d0a95fcf8f96c272fadd4ba85f3eeac39fcaf Mon Sep 17 00:00:00 2001
+From 4e556a5edde8a97312abae63f8e9b5f989ca5c91 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
@@ -8,16 +8,15 @@ Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
 ---
  common/homedir.c | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/common/homedir.c b/common/homedir.c
-index 6f99f3e..f22aa9e 100644
+index 3929108..d3a7b8f 100644
 --- a/common/homedir.c
 +++ b/common/homedir.c
-@@ -1284,7 +1284,7 @@ gnupg_socketdir (void)
+@@ -1439,7 +1439,7 @@ gnupg_socketdir (void)
    if (!name)
      {
        unsigned int dummy;
@@ -26,7 +25,7 @@ index 6f99f3e..f22aa9e 100644
        gpgrt_annotate_leaked_object (name);
      }
  
-@@ -1316,7 +1316,7 @@ gnupg_sysconfdir (void)
+@@ -1468,7 +1468,7 @@ gnupg_sysconfdir (void)
    if (dir)
      return dir;
    else
@@ -35,7 +34,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1352,7 +1352,7 @@ gnupg_bindir (void)
+@@ -1504,7 +1504,7 @@ gnupg_bindir (void)
        return name;
      }
    else
@@ -44,7 +43,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1379,7 +1379,7 @@ gnupg_libexecdir (void)
+@@ -1531,7 +1531,7 @@ gnupg_libexecdir (void)
        return name;
      }
    else
@@ -53,7 +52,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1409,7 +1409,7 @@ gnupg_libdir (void)
+@@ -1561,7 +1561,7 @@ gnupg_libdir (void)
        return name;
      }
    else
@@ -62,7 +61,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1440,7 +1440,7 @@ gnupg_datadir (void)
+@@ -1592,7 +1592,7 @@ gnupg_datadir (void)
        return name;
      }
    else
@@ -71,7 +70,7 @@ index 6f99f3e..f22aa9e 100644
  #endif /*!HAVE_W32_SYSTEM*/
  }
  
-@@ -1472,7 +1472,7 @@ gnupg_localedir (void)
+@@ -1624,7 +1624,7 @@ gnupg_localedir (void)
        return name;
      }
    else
diff --git a/meta/recipes-support/gnupg/gnupg_2.4.5.bb b/meta/recipes-support/gnupg/gnupg_2.5.0.bb
similarity index 95%
rename from meta/recipes-support/gnupg/gnupg_2.4.5.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.0.bb
index 97b5d8856c..9cfdbdf0a4 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.5.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.0.bb
@@ -18,12 +18,13 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
+           file://0001-fix-compile-failure-with-musl.patch \
            "
 SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch \
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "f68f7d75d06cb1635c336d34d844af97436c3f64ea14bcb7c869782f96f44277"
+SRC_URI[sha256sum] = "2222c827d4e7087f15e7f72739d004abc1d05c6c5f0a5a12b24c6a6cc5d173fb"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.27.0


