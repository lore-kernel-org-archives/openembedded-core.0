Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301FAC5472D
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 01:48:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7351.1724377702172343842
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 18:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89658b1c4b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MBhYIn018581
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:21 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6x11n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLyeQytxnL1UbrrwBlNezoy6CpCLhyGu7cqoDvmG6Lrd8EkFfbjv5CLQq83KnNYcMDd7CPeuulxbFHmfSiTVowYyF5DQF9ef74AG+S1rY/+xrNr+27J8dwUnGKbjKpDsZYmnIP7Q5mZWJ5PTo2nHFJeFzoqBCoB2+q7NRVPfyNk7Nqo5GnU45nHWM24B8Dpi1X1g7DUmGdJ8njpK8eMi5DsCoF296TR3OJlUiVk+cqWSfOWNLxWQZ3C2ZTRzlXniR7kW5g1vkyzDizRLE+jdKn5tbWUC/GFSjRyFXy3JdivPosg+L8bqEx+E1DaMA3WMY3iimXknpQWbFhe/EWi6Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7CI6sXxpjKtzzDaIyuFtZxX6Ib5Znw5CFJtMs4/vSw=;
 b=HQfl5ILtrOtT1+J9BVQ3SOl+skTvcsosWh94XafCUimEyJNMF+Lzivn/144FS9K8GjFBBGPVsw4Z6VPasPr7U++QQSEs0TSMyr6Z97EcNj36HUhx+d12ErLOvy7vM9s6YWha8QKkNrNTazwukDFzSER2XuAFIEurbGXdl4aJcFRcnJTIeJXGK1NeT/3bVWy2i9XcHMoHwE1VZj8Y69FBniASIJIumOpufWCoo5utWz63uQr3YwFNGT98fQo+QbU5j7BLRw8tbRtsxvzuKNklQanCxT0RfQELAEh3z0pe7MFuqGZsSVwg6cbvBsyPd/MZRTWvLRYRAvQIyP56KKJ43A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by DS0PR11MB8114.namprd11.prod.outlook.com (2603:10b6:8:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 01:48:18 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 01:48:18 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky][PATCH 2/9] man-pages: 6.8 -> 6.9.1
Date: Fri, 23 Aug 2024 09:47:59 +0800
Message-Id: <20240823014806.4154590-3-hongxu.jia@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 692b4c68-1c2d-41b3-af69-08dcc315a954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?M9JyGEhlInEuxgPYVqQYIJmaUE3o+kXyRcdgNwkH3X/7Atn88BSoAOO7q5ZR?=
 =?us-ascii?Q?+ouSMtGK2HzuKP9nXzY8rycs6qF/HfjpjD2W6oHQS8VygWWUlYHfrQg8o/2H?=
 =?us-ascii?Q?G/r698TYiiPdP5PZKCyPYf/x/cr67eEMjLx/MPg0YyuMx5VuXPeyo/b+SshX?=
 =?us-ascii?Q?ywgnJn+GHjTHy35FK1AUofaPcHUTYRZT6Ib3Ukt45XH/S8wGADgrq27mQaWx?=
 =?us-ascii?Q?+OD2yG/Y9jHG9cLesIf2OzRGkthC4N85GmKEcRQV2aZOcYF6huDoDnKrd29Q?=
 =?us-ascii?Q?x7um05G7YMeqyVzQf0q5Gez2qpU4RqFlDSitgiydFN0vfH8g389BVzE57Jtk?=
 =?us-ascii?Q?Tsj4L0omcYUr/pcRjdWQofsUGUNbCPTbDbAYmICyYX3GKub0lvLd7xSIlbuA?=
 =?us-ascii?Q?sjJ9DNtSfeQpPB6V73mwnZR+7+j3x+Gcjc0re5PIamj+bhUoWKNn8iwzB/M1?=
 =?us-ascii?Q?Xz9hY3oaWdxhKe0N7vLITlyLt/9fWHs0u3sRKd7jOugGJZvw/80+dUnaS9PR?=
 =?us-ascii?Q?sqGr9XSImfYocS1WnScaRc34x4GYz5pKnFKo2x5VasMaI/3Ud8eNgkrsCqcU?=
 =?us-ascii?Q?rJbrNCuDj9/amvz5M3+vJJjxHhwqAOOfScKGP1dYWmlAm4T260fjnDbDMAKZ?=
 =?us-ascii?Q?PQ1yry1RRO/nf0/mDMA2j4XZcmZvKgbY8Y6x9A7QFRUX1x8jxlQNCcrrCf6s?=
 =?us-ascii?Q?toQ0zOj1wUbZBUp/mHvKzEH4yVqxxUB3aqxRpJcEYKajMQvCHF3h3snowomL?=
 =?us-ascii?Q?JTYrnHroMPWEF/4TOaCd9MyyAdWTLzxqP8pCDBaIRf9AXD6aejmboK0ghjGY?=
 =?us-ascii?Q?R2YhxLDshvHelRYyQF5OyjgWcfvowzsh6iu9Ot4D7hDYHdfLrytFNPoFHsuW?=
 =?us-ascii?Q?GkoJYCGEsM5a3L+yxtv2riCxm5F7M8b4ZRxp1qcdjHgpjoLeMIzJGbPIopiB?=
 =?us-ascii?Q?MChWKwr3ZlAKFaqy55KxMN5SKnTrhdaCzEwk+w7j/joWHQiGIV+yWdwxGoyR?=
 =?us-ascii?Q?LyzIJteUFL92rabWrsggVwtK41J0R2/jNkjKyxlznCJW3h7PfZHlZAcazc6n?=
 =?us-ascii?Q?sQNN7V2aSm7vuYzXGf35F2ImbmaMWTu4mT7mrgom85JYw7HIYhXx8iXN9Ynl?=
 =?us-ascii?Q?sXDzpqieD1iF12TwUAJBK3CsBcrcIdhYtG4p+zCM3EWGdTQjFudIzKqjRhqr?=
 =?us-ascii?Q?SKTETMjW+MRotonyskdFu+rqlKvSV7ouDk6In/Ata8EJEmuhQrZTfSeZLlrx?=
 =?us-ascii?Q?hfj2ilGcsKc0q0z1dQ0OWx2gScvHb66m4oBcc00Or4K73MpU9pm+dbAkuKLQ?=
 =?us-ascii?Q?wT//hj4KGSQ7v4mdd2fBpkfBx5f+haQDmXTjBV1jJs0zAAZg+sbyxY1Umqwk?=
 =?us-ascii?Q?Rd1OirA8o817u5lUWIonXMkQznPmJLleSRClcJagErAhp2xz5Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YDp83ufOyU9WiL7MvPHGgzAuINAlBa6asqLffI3sh9vFoRzlNXKGX2Mc3I+r?=
 =?us-ascii?Q?m0AQAb2IcjBmGU7TDA929s+dY3gmvI9wGRJU0wvsU2JTKQzTHJuOBYqoE91n?=
 =?us-ascii?Q?mJb33y9jdJRac1EL/fOQ3x3wGN7qlZP5VVJet2SCNNAgCZxJ3C94KRRm4Itk?=
 =?us-ascii?Q?p9wGBTu7PfNH7BfjUkfKZiFojvDUFBOicEL6W6Ic8NPbVM5aGSwph6qzbS3p?=
 =?us-ascii?Q?SwpuZgm9CuAPfm5A8qVl6d374NBy2wuqX9mNnpK6PXeEwonmNqvguTxRpPwF?=
 =?us-ascii?Q?dC+cHef+YUK9oCaHOdHqPAekWDLNY2vjBwTkcYQXeuwsedJEv4ibafzUORTu?=
 =?us-ascii?Q?q+lbNtZQGuPrRTTM7Sw/4+34H6FTJ9y521msB4GhpfCPrAJJxaRKhNe+kRr9?=
 =?us-ascii?Q?spFkvynuDFYP7FDZUX1F4yuqQ33PBEdBA0B0cK4ECc6yYsPbfWe800o4sujh?=
 =?us-ascii?Q?Q4el0QNsmXcVeud//8ybIc7rXUuQ5D7cpiFyTHwepiC/2YhLlM74vbUI5kxa?=
 =?us-ascii?Q?99jm5iNBNDLYVTcn690m2mKAfLrUsFs9njyoqE84zftbBwMB+aNDxlhRwAn4?=
 =?us-ascii?Q?6aygjV3yOK+/PrMitmMq/YaB+2ZyajatyUdffMWw9f/Fa5lwBm9sE2uQ+DdJ?=
 =?us-ascii?Q?4p5ExlBKCRSbGzmSDK9ozezHIxgjHvOSjw4VyHGf63ytBfTJ1f/bYMxR86H+?=
 =?us-ascii?Q?KwjZi3x09Fg6oiR6l2mHv7Br+x1DNfIjDOx5J8XhCwgICG/GdJ9/P936pHLU?=
 =?us-ascii?Q?eJPMupqFXJgpW6Y2nLmHkgdavZX5eBXzBjMNFLkgvVjReHAy/5C+/UAAB4yN?=
 =?us-ascii?Q?dNvnv/pc6G7PFfUWU4MEfunq3G4t/a9+1K+ehYbGN8u+xqa8R1x4SvCV1OGw?=
 =?us-ascii?Q?J6cQARReLBvi+nInNK6OB2U4t8dz4WCB090Lf3IWZjcE2qUkP6VMMhHcK8CQ?=
 =?us-ascii?Q?HZ7Go47J//EK0cswRUhTZIsx6iS23I3jsb4uVx3f/GXFLPynGIJjGyN1zMnJ?=
 =?us-ascii?Q?Z1QbuyscSRFiPdX9G15GvIgrZnfniI/4I31aHgmDfW94bBMpJdwRr2ngJR+9?=
 =?us-ascii?Q?9IuJvGU1AeiLV73Lj4wFGRNXUm28NthG7uQQl1QbIefeGVtNe11rK8g355L0?=
 =?us-ascii?Q?nNxZwrTQzhrXWVa08mHAaQxcQpsIOlzK4DvfHr2FuVNhUbqNqlShCRMaAGJ2?=
 =?us-ascii?Q?/IT2AgyEc6ZTrmYG1ngaN0YVtxj6qerzkG2vkHtXvm+/WQfqPJ5TBkvdLjH+?=
 =?us-ascii?Q?mJ0eZFY8+cmjdJlTEVW0lF7Wd6UHwSTWIXW/HI9MB9zCAXbfd5hPvVvLP25T?=
 =?us-ascii?Q?eIX0lVIkung9kHhNkbY8uSMP4UoE2kDWEAmktgr52yrL8TEokBrxb+GkVtw1?=
 =?us-ascii?Q?se1tKv45mft41VKHSV5z71M+NLzWz6sOyFtICxLu9xXnRLmcFPst4Pb4gTZb?=
 =?us-ascii?Q?naY+vpkoUlzRVHjwEiEDYFMCAANE8AnxiWn0epy4qw8fo0wIWtTk1riE/d69?=
 =?us-ascii?Q?9g9evsuT8TjcMC5vl1Bh19wV8HS2kUYkvJpLAXUo6YRwPM5OGaqyDJCebHxR?=
 =?us-ascii?Q?X93VZlR96gD0vmgW0DuosXV1PFUjucPxtpo/Z/hjZwzOnwrGcuSCLXR39LT8?=
 =?us-ascii?Q?BQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 692b4c68-1c2d-41b3-af69-08dcc315a954
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 01:48:18.4618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88LGLJyBfJ6VnaPDtJrcsBwTzYrjZO5OB+n3GnV0d1fGGgavhrtz9+M7E8ERxPG1vJcWXDegNvtFWOkBknhHez6V/m6OgVEfXDYIjf3n8xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8114
X-Proofpoint-ORIG-GUID: eexO8nUIvf-gMxgsFPVI9pfMJSRZ7m6O
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c7ea65 cx=c_pps a=28bFCgguF5sZfysLuYgbMw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=VKCDbnnurRTxch7X85cA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: eexO8nUIvf-gMxgsFPVI9pfMJSRZ7m6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_01,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=839 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408230010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203668

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../man-pages/{man-pages_6.8.bb => man-pages_6.9.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.8.bb => man-pages_6.9.1.bb} (95%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.8.bb b/meta/recipes-extended/man-pages/man-pages_6.9.1.bb
similarity index 95%
rename from meta/recipes-extended/man-pages/man-pages_6.8.bb
rename to meta/recipes-extended/man-pages/man-pages_6.9.1.bb
index 1181de1f15..ba1a6c16c4 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.8.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.9.1.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://README;md5=72cff06b7954222c24d38bc2c41b234e \
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "f4d5b9756b4ee52e34ca9d895095c92312ced6292395b811e11069ab007e6f06"
+SRC_URI[sha256sum] = "3ae3f8ad97487d2c1b14258231d97d03b4e569b915377f6dd4f6be7141c57ee0"
 
 inherit manpages
 
-- 
2.27.0


