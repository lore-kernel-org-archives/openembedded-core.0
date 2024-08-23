Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05CEC531DF
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 01:48:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7466.1724377701229115067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 18:48:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89658b1c4b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47N0qJ8b009254
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:20 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6x11k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkiGqOX/B862ckVDVKf/T0Mfp3xUqnkE571bMsVaYTayPd8ucKS95YKBfMBGGskZQxIeAijaLwioXWUWIW2sDgIEUSxOUeESilvQzNfxeLaukhXbpRC4PZiu8A5Wth/YfiuaajUPPVjCh5Qbqbjrw87VzuwlUQf4JAo1HUWp4OPyRmttf1AktSq39dETzABbXROXDmNa/iQiRYg8ewxabDOLB4yqEHtJztJqH9RrIMkozIQrg/A59djoZMNCWzi9Y0sQ0bxjbgI06JQrWpMz1fplyNobWNIp4StPIGjcpCpM0SnK5qmFj5PGBeEWnOKIMFq2aHjyGijF4TY5As4KtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BXlpq6AuMqfpCI3QbMUwNr8NjXfOVW4NZAMaR7/IlY=;
 b=fCnN/73W59LCdDfpWR3xykijQNAzvToW6np/SU4wdkhn3A5/w5tgVX/L+joUCfT1WG4xwmNBB1be+xeWuS0rOAgoftPLu7IKEe4Se4ac5eVZHIHHmefs6IjOlqWc1w+dT2JPWlD+jpBTRHmiXa8sirUPEiE2+oFX3mvsjbOKMU9wVOmacgPU0ijk79FpzkPbS72B/YtaoLUjwBgIt351dXbgSUv1Fz6JNsvhRq/cix/VOw27fnk2BgUwkCtvqu2gcJbx51f8Tq5tQzWs6CRL4bI3BC1T5Akc85AKoPq5JIbUrzc/+T9HHjUKmXpE2FAwlJyf8T3WZ7iUISid7sdWMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by BL3PR11MB6483.namprd11.prod.outlook.com (2603:10b6:208:3be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Fri, 23 Aug
 2024 01:48:16 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 01:48:16 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [RR][NULL][0/9] Upgrade 9 recipes
Date: Fri, 23 Aug 2024 09:47:57 +0800
Message-Id: <20240823014806.4154590-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To MW3PR11MB4633.namprd11.prod.outlook.com
 (2603:10b6:303:5b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4633:EE_|BL3PR11MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c53d4ee-a871-44a0-e41e-08dcc315a7ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZGYToVKIWLcvrSPpzxr3mC9KtZsuX2wQWCctWyuSQuSU0M0JIkObwA3I30Sy?=
 =?us-ascii?Q?aUv3xDvPz7T9YgM4uZNaSzAcmpc5l/ZZfGLRm2O4b5R4nxUMi63Fko52G7in?=
 =?us-ascii?Q?YngSbxS6WKhVd9Xbp/qMBqE8JlVXm4v4SWijZRUk5W4CJ63mIrmAGY0xJFrD?=
 =?us-ascii?Q?EtWOBu3+u24ez3It3Ja2eG4EXlhjy9yEh3gmYH+So5X6CCZa45X+MgJ3Ak3O?=
 =?us-ascii?Q?gGgY+7mFYcmd2VAvXHE2rHq2VGj4YTeJ++dsmlEYRTzo3W1RCRnbXmbSneHA?=
 =?us-ascii?Q?9zcKZRImKFyAkzPWPbuZjUXFBdXruU5vheQ7p7mNYvDiLoOH1XrdddgKOHSe?=
 =?us-ascii?Q?KodDQh59updDV8JvOmN5eXKB0bf1eeAzufCI0zz5Vxpnilu/Uspm7Av3JR50?=
 =?us-ascii?Q?zclsAoYIXz32GGtdZWARARqQhEX+EUUy6BsVcO2clGuA+YrFRY21d1Zl2mYe?=
 =?us-ascii?Q?CDlzH14B8yctD7+xrOxf5ZcfHSzJVeJIhD8v1Jn6k4zhsn18co0eB/VHS66b?=
 =?us-ascii?Q?Q9opJN53o/cD46tGNjFX3gDIpqYFtWdyqIEMDIBJv2LyJX7c6X3qbMBagOb7?=
 =?us-ascii?Q?39xTcacR5JJ6kbp8Uak57fvAbOwKS/ijQ4OHcblnFX0dULTiIT9QofVeIWYw?=
 =?us-ascii?Q?Z4dlWdVXgCHOqAnSlo5XTNGWQqZIBZDkV1YdqUqhbqB8uiCxIHQlgHtok5eJ?=
 =?us-ascii?Q?keXSdADzRTGpY8V3LKn/B/5oRIGJbLJmrI5MB+G+Uu+FZy5rAemuW+vQGtbF?=
 =?us-ascii?Q?4OLgLaxb17bT+Bucg/5zJJCUcxa2WWgE93JPqjWeotCNASw0m2c00xzDdj/g?=
 =?us-ascii?Q?8mrqta+7PWi/I72w3TkafSIxfMSw2rQrA+s1HDIGgx0TyY7f0Y5Fmp0LhwON?=
 =?us-ascii?Q?+9YbsW5juaKXTLN/lcbH/SC8ryxI3Rsai7lFHJ0YV59rQgnFzEjfZOb0SFL/?=
 =?us-ascii?Q?pl3z1+dRkS6cVX7MzjceVX4P6TuKB9HKv3oi8/J2W3885EKQD1zo7anmqX43?=
 =?us-ascii?Q?paTS7GewA3getBYaP4Y5kBqnKgJDLf9c8RQ/jpt37buC58LNK0wkS5iApoi6?=
 =?us-ascii?Q?sMJl0+BVXcqYLP4+hbkfasCZ+mV+VCsxNi/CrUPSjG6o906Pze4NurAh7oZ3?=
 =?us-ascii?Q?4FCi3BzlwlzxbpygBOyKWWikFQc9VH5kVPlmbY7/36QaTDwFaz3dXTQwcfWW?=
 =?us-ascii?Q?sD5tmqtOhnKtF7aCWonOfeZBOuhc/fQlGucmX/xwViApzLGlQiIofh9GNMx2?=
 =?us-ascii?Q?WISHkN37uyTYjiUT0d1FjFzC9wfNVlpfZMk9RSERHjlVkITtdB4JiWDiCI18?=
 =?us-ascii?Q?VF/58UOw5yI0epr52GN9r/HUHtSutYcHREViA2keSYUxj7C+MMvQyIE9qI2K?=
 =?us-ascii?Q?iyYDRhg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FYKC6m6F7+obUsC6hd8zvYWhK/G+GNoJshWVkqrbdeJ2qfNryDfDK+hHMB03?=
 =?us-ascii?Q?mOKe7irH+hJL97AG55j1hsCL8TRusudBygD8/H0hiwXH/mE41UCtZCzZmJx7?=
 =?us-ascii?Q?n0QBR6N+j2n48rCY80F0g27IwcIcWXvsnMoZrw5yNLHoOsTXZtwRAk+oI9/7?=
 =?us-ascii?Q?PF7NE5M6+h9X5J1kATgixQaC1e6/FhI/3HBKkkqV6lQEgjCnTl71hnzhLXvr?=
 =?us-ascii?Q?nNBFTYI3DTDkjO/psBiQFqsuc+LOJzfoefmBtNPTMTyREIp9DZdweOBhYUYY?=
 =?us-ascii?Q?TCAdHc+5DfiszhHsplUDCXk7ytHKfN9KCl4B4Ohrfcb6oy+XD6LUDF4AGdHg?=
 =?us-ascii?Q?zfUOQLXvErLugisaOOyqHmkOr8xiVn4L7dXaoJB32LmalM+UEAy/qZpCl06g?=
 =?us-ascii?Q?CDgVP0e+Jv3KCc68MOKFNSIuLSs5UIEkEh90VspnPO6LnMSDl+6t+jRWh7tC?=
 =?us-ascii?Q?DQF7sIZPw5IsZA1EAe1MYr0asGsaVo6rYpZhMxO8oj0PoucTwYg4IUCMJQEM?=
 =?us-ascii?Q?ss29ytN8O5Q+tNfZfwauKtUNXO9ULoqe4Su6Oqd5yQa2NsF2pw43ir+U2hp2?=
 =?us-ascii?Q?rzQbURVfXnRNHZaP995jpM+p3QSK3/fyl92cnDATXDjCC3DUkkOfJHNxN2Ot?=
 =?us-ascii?Q?JSKFAkob3Ticb+vQImM0npdyRxb7QxXedhwF+C5sk2nl0NRfkRPLn6BW0obe?=
 =?us-ascii?Q?tw44BbAqAsZ88i9uqy1fchcn2XEUG7jcxEI2CKWmZGoN9AZB+JFY2cjvf8Sz?=
 =?us-ascii?Q?cZz+iAPp/Ow12Q9nuDVi9FUQQl4VFwbCs1E4KV/Jvc+Xj7zjocfT2TmFA3+t?=
 =?us-ascii?Q?VTfiWmhNlDDoyr0QyWVE8Ma44mXoqh26adlPmPm+GCh9d+LI6ygj9VZaSbVc?=
 =?us-ascii?Q?6aj0As/N1qR7dCTgsJPmQpzd9X2apdj8kHLw2sRhnYFcNyiRrU/WU74fpnbI?=
 =?us-ascii?Q?YQoJEa858Y+n+fPqulnYmpcRXQMpaUorVE1KFVSlGDelNuavAXvf/ePNFUqg?=
 =?us-ascii?Q?8xNcLWp+JQrKGwiTYh28iUnIazJ1/IlV8KI2yQX+RkquJpiMAShIaJYLMYHn?=
 =?us-ascii?Q?XPeWlwn8yvkZIU8PeVfgMN1awcWQjnvf/3/LHKBiXnRhnbMJSA4p2BGBpHx/?=
 =?us-ascii?Q?B9ksl2QgwCbJte9qA4Xb/n9pIG3YW5brDg4zgBt7us5MAdZFXaqJgkh8dypc?=
 =?us-ascii?Q?xO1c+2H0efsKXZsVyUgLHoSM/epKxMOOULky0r/Hn6udYioe8pFnGLL12AeO?=
 =?us-ascii?Q?VSLcxXly3N5tqRCdwk59e+UenUnhoP/f2L+4tjKpkzV75DQzxFquhL1cCLb9?=
 =?us-ascii?Q?LwlFLC5v8TpIECRtXHzrivR3/cxKIK9dVuyBAsw376/jXQ97XSBD/ojPkwCi?=
 =?us-ascii?Q?EbYtjX00RXmr9dLtgAydy+pTEDLw9B1RKm/Gutfo75GrPEFf1PDSSoUTtwxg?=
 =?us-ascii?Q?BELahBu/Sm3iaCpAmB1a/7QvDikHiR44H+2ckGWOpUEzoggJOO/hKSbyy27u?=
 =?us-ascii?Q?q/LLPzvWLVDA3LRvRCWNKCRNdpzSCJozVLVgAtuvaktAqaxZFnTf4ghydbZI?=
 =?us-ascii?Q?KyCFDyeHwwwfPFSJDobZpuYFoRaPqJY5x9lGH6y/zCfHSpg539gtdJ8FXcUs?=
 =?us-ascii?Q?gw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c53d4ee-a871-44a0-e41e-08dcc315a7ff
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 01:48:16.2041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2GwbzEIZgyEFR3lhmFakbkkH0SogTXaEwvF0WDcblzvchxVulS0Z9ecakyiLNwvb77CaeWKi/h3eUjex5zFYVcEKbhgQLX2lAclfXwbwtic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6483
X-Proofpoint-ORIG-GUID: EBqyM8omKziM-Ees-_l_nW-acV7Z92oo
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c7ea63 cx=c_pps a=PZJ0/dUMjH0jBWORzn298Q==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=lViJMyulAAAA:8 a=GHR8O2WEAAAA:20
 a=iGHA9ds3AAAA:8 a=bLZqKDXHAAAA:8 a=fEJmTNvjfWQFHKHhNzcA:9 a=m9p5bXcFLgAA:10 a=_bH2KxHPhUEA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=gb9IC-u5QvZuJU0a8fSk:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=SM0NOtVXJcAQk9PFKD3C:22
X-Proofpoint-GUID: EBqyM8omKziM-Ees-_l_nW-acV7Z92oo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_01,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408230010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203667

Summary: Upgrade 9 recipes

====== Comments (indicate scope for each "y" above) ======
* Conditions of submission

* Documentation Changes/Release Notes
  = Doc changes

  = Release notes

* Git logs
[poky]
commit 17fbb2c5c2fe290c4d6c217d9cc36f9a671c6929
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Thu Aug 15 18:23:06 2024 +0000

    gnupg: 2.4.5 -> 2.5.0
    
    Fix compile failure with musl
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

commit 13dca72c78eb898b0da84017d90b9ff6b1a58155
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Thu Aug 15 13:05:06 2024 +0000

    xmlto: 0.0.28 -> 0.0.29
    
    * Do not tweak var-PV in recipe
    * Rename variable BASH to XMLTO_BASH_PATH [1]
    
    [1] https://pagure.io/xmlto/c/5030f081b0e2d94d791b62ee6da0831026cf57e0?branch=master
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

commit db1933b048519df5034ab73429e8b87ea09cbc44
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Thu Aug 22 13:18:21 2024 +0800

    libxslt: 1.1.39 -> 1.1.42
    
    Remove mem-debug option [1]
    
    [1] https://gitlab.gnome.org/GNOME/libxslt/-/commit/c65a7c05f98ea4e9fae1247510b45db9dd3ec907
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

commit 70f1138e93970749ab51f6f941378b63462d9186
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Thu Aug 15 13:09:58 2024 +0000

    bash: 5.2.21 -> 5.2.32
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

commit 24bd5f14471796c460d3295ee548412e8cd263e5
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Thu Aug 22 12:57:19 2024 +0800

    rpcbind: 1.2.6 -> 1.2.7
    
    Rebase 0001-systemd-use-EnvironmentFile.patch to 1.2.7
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

commit 166d21c710d933e1becfb99e47a7d811699cd83d
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Thu Aug 22 12:47:07 2024 +0800

    readline: 8.2 -> 8.2.13
    
    Drop backport patches:
    - readline82-001.patch ~ readline82-010.patch
    
    Rebase norpath.patch to 8.2.13
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

commit 215747fcbfba1a246b6e728910c7a448c7191e1a
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Thu Aug 22 11:21:15 2024 +0800

    libxml2: 2.12.8 -> 2.13.3
    
    * Remove Trio and updated Copyright to remove Trio [1]
    * Remove --with-fexceptions configuration option [2]
    
    [1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/7d6969d95509a94347d6f96167ac5420abafa291
    [2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/e349709ae7e07a2183304ccc9352b6ac86f62a18
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

commit 22b013be26223ae086259e0caa2193dae2536b58
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Thu Aug 22 12:29:06 2024 +0800

    man-pages: 6.8 -> 6.9.1
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

commit 24a9f1de3adfe96e4d2c8d8223c7b96bf5e75bc0
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Thu Aug 22 11:05:58 2024 +0800

    libgpg-error: 1.49 -> 1.50
    
    * Rebase pkgconfig.patch
    * No license change, just update copyright years:
      2001-2023 -> 2001-2024
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>



====== Testing ======
* Commands
topdir=`pwd`
git clone  git://git.yoctoproject.org/poky
. $topdir/poky/oe-init-build-env build
pkgs="xmlto  libxslt  gnupg bash rpcbind readline libxml2 man-pages libgpg-error"
MACHINE="qemuarm qemuarm64 qemux86 qemux86-64 qemuriscv64"
for machine in $MACHINE; do
  echo "=======MACHINE $machine=============="
  echo "MACHINE = '$machine'" >> conf/local.conf
  echo "TOOLCHAIN = 'gcc'" >> conf/local.conf
  echo "TCLIBC='glibc'" >> conf/local.conf
  bitbake $pkgs -ccleansstate && bitbake $pkgs
  echo "=======MACHINE $machine gcc +  musl=============="
  echo "TCLIBC='musl'" >> conf/local.conf
  bitbake $pkgs -ccleansstate && bitbake $pkgs
  echo "=======MACHINE $machine clang=============="
  echo "TOOLCHAIN = 'clang'" >> conf/local.conf
  echo "TCLIBC='glibc'" >> conf/local.conf
  bitbake $pkgs -ccleansstate && bitbake $pkgs
  echo "=======MACHINE $machine clang + musl=============="
  echo "TCLIBC='musl'" >> conf/local.conf
  bitbake $pkgs
done

* Expected Results

* Applicable to

* Tested configurations

  Arch    built      boot     boardname
  -------------------------------------
  ARM32     n         n
  ARM64     n         n
  MIPS      n         n
  MIPS64    n         n
  MIPS64n32 n         n
  PPC       n         n
  PPC64     n         n
  RISCV64   n         n
  x86       n         n
  x86_64    n         n


====== Reviewer Checklist ======
[Submitters: make sure that your review doesn't trigger any checkmarks!]
http://lxgit.wrs.com/cgit/bin.git/tree/etc/review.txt


====== PULLs ======
* PULLs


* WRH-PULLs ("wrh -m" can merge it):


