Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB40C54722
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 01:48:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7358.1724377706391742057
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 18:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89658b1c4b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47N0fVSf026506
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6x11p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9/EIhVa/h1s3DoPPu0E0PIU60GEuJVDu8/4MEbytorwYLymYmAgNnQaFLtKGyY59zYY1MJ/k5HUN6mcRMYCY+3HXJWTIn7nAz+zeei94+iqpj2w0LUkB1S6nnf6gGS2Qm79GJ2qo0dxCU00vSC3GyrEY9EpK6TKF8It2Itk55HHdNYsP0QOZ3vHBKVbZl38hKuzZR3dCxmdXjsZtAQyYsTQMJ/lafoqMiNDB5twM29T6UnCRmsUSLSGd3kRBln/3uBaFJW32gPkFMc/5kYC5v94D+HhMx51/gwHobhWOSnT2UsYwf5CczXKpkaY6onCIhyHqNLa8kc6+XFMI1aOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVX4DBWC9bppKA0zuvGVqYt/C0vDQX7rtFzz8j5v3B8=;
 b=UqinMZDEXQieRJcbLVwuF/8Q9J9y9uT1WYGZsD8w9kOp0sGgefhiIY7De/5XfwoCqJTNa24+XG03KxCD6uAov1vBAF1818SlxapFmwG6dFEx8eiaE4fQZVUkezAgKLLgWvhCKRYs9kWVy/F1+GXoUtMTegeP2TGDPD3c14Nn/FGMUvwvzsvoigHWfcuqYwIUlWzBiBrDDj2kjAfSJXzmDUn7jpNlcFjVO6FtDFLyv447Mnvu2XxCFZBNg0FFvCypt+EHdIIAh2nerJChn52L9PSyp+hdT4fUJ/QyXKsM/tIJDMjEZ6v/HTt0fQVPrnGKbEVC5SX3Pm0SARb6Mcsm5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by DS0PR11MB8114.namprd11.prod.outlook.com (2603:10b6:8:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 01:48:24 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 01:48:24 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky][PATCH 7/9] libxslt: 1.1.39 -> 1.1.42
Date: Fri, 23 Aug 2024 09:48:04 +0800
Message-Id: <20240823014806.4154590-8-hongxu.jia@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8a8af633-dc4e-4930-fbba-08dcc315accd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?U5yW3RUJAMn2J3U+4pA2gV01p4wMd1j6TVqG+Koov9rbSNVCARNX+zET+MkN?=
 =?us-ascii?Q?nBj3riSC15CulqfoCHgrfhVaKOEM3SGoDtAYDtzdK7CfM8ShIHBLLXAlKa9l?=
 =?us-ascii?Q?hS1I8Qw3SrmZPgW5FeOcPJy6yQ2tVR1swb55J4s1FttJMdNVrGtjcGSnsHjX?=
 =?us-ascii?Q?FA7KfKFy6MF92nINny9z29Miym4wnSxJn937RJtZtiS9d3BRofsAFQprsFau?=
 =?us-ascii?Q?RGWarFl1wgPxR9dw+MuP2Tn4ox3Wh0wvaPM5UgRCVXfn4/ELkzdyoNdzMdGp?=
 =?us-ascii?Q?3SGGrk/y3SYFrIYg6Z8rTflOaL96OzOzb+/kq5ZnIIFgURJeoZstLgI5uQEg?=
 =?us-ascii?Q?mqOXKOPFWS590a6b3cCYBJJv/sZ3KqPjfZrJuGAAWYMQ/iHySdTPwmvvMT1i?=
 =?us-ascii?Q?sHQ/y/qGU2dbePsznzm0KeSVqA/KTMo7+XWTvZQRh311zuSTa2BPnfVTKq1R?=
 =?us-ascii?Q?/YlDoPjXOAiDiCXUV9gGZ4gcm9SPIpHiFqo97dgMgMnxySdH8zMr9dIkAe1E?=
 =?us-ascii?Q?naxZeT9c1M2rgaBe4KHEMia1Q65Dix8iqvA5Zk+bJQwkU8SFv1EKBYAOA1b5?=
 =?us-ascii?Q?dWAvDDrQvYJRH6AeT+jKce/wiyWbVYNhLhEN7xlMfAHkHr5HpCZlFz8eWm/b?=
 =?us-ascii?Q?WbEr6ZJrW0vQ5WJrdLVmqEi7xDBwTClGFOEMa099+yV+Esqv2KDxusYB0N4T?=
 =?us-ascii?Q?XR4FhDUDy0cs6t7DI6Jwk/h4DgdqdWEqIoydVJmbIe8yanIzVobt2DGFIVT8?=
 =?us-ascii?Q?85RJ5KHmsd2xtISlJvPozJxtXBF/Yo9uNZ+GvykPQYyq8bIZ4j/bN0vA7G4C?=
 =?us-ascii?Q?V6SPytGnucr+eUGijQLeBOa2SjcPoyCL2zlliYNfxPRZ92LcoRyQi57VrJEz?=
 =?us-ascii?Q?qOERrvK86fi20yqACC8YkYjqHrNfpm4D78hMSqo5LG8T47daVudEW1OvlNmF?=
 =?us-ascii?Q?ObniB8olL3/V/5Lv90JG5F0EBhvXWezcK45QE4tlST18Iw4nOETs7G1ay9eh?=
 =?us-ascii?Q?V4WzaOl9ZOh09CYhUGXW25v5Mk5m23C8qqixS4/pQR6cSkiRHac/EUAm4wu+?=
 =?us-ascii?Q?fdACmB7oAgKjFmfvXsfO1lMFLIozR6AM6F9aU2FK+trn1XhcZUl5sFIEiRAE?=
 =?us-ascii?Q?eAHsqvDJZdogd7ZcwFknPnxSfiX3xWmHDWtEoUGVqpBB6tV4Qapxx+xWsuaB?=
 =?us-ascii?Q?2hTjq57OqheGPKmVr+xNmU3MaosGxOzpFwAouNkgDZjgB6y6vhTbZBEDeru6?=
 =?us-ascii?Q?qpaOJzBM505Ck+SY5T6KPRRw9idMKRzQPP8OqaLenFCle9DIzAGPvF1ZBc01?=
 =?us-ascii?Q?SUD0eWPV+XCVKIUXM6MAvQkZtFd9hLCP4pEi7YgBXSP2t2TKRBrZVUd3TAKr?=
 =?us-ascii?Q?xxOONe8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VEAH05bMG9/61uwL/LSVZDGLCYn+92py9SalDrY+NiOlwKXTk2nOZG2TtQLA?=
 =?us-ascii?Q?CV2cpQSPgoPb8uOYiKsSWQrJL0B3V5kHa7BaScq9EAa2+B/4k2dsh0QvQBkF?=
 =?us-ascii?Q?RnKLrD3P3ZH0jkukmBUblTKW6jQmmaSKeD83U9rU/i34sktNK5MIBX+VOIxK?=
 =?us-ascii?Q?zH1q94fpSYdFhiBfh7vUNtxBefuQW20nGq+nNQjnDklsAkTzBQ1MZdK0gp1L?=
 =?us-ascii?Q?0tEfGU2lxBfljZYY8Rpl6cvYpqKfITjmpfDmyGXF4lUHTIUNJw/TLViXu6YB?=
 =?us-ascii?Q?5NY+9cRUey3wXxRSOGuQB1T004iKl8wRKhUKrw6Ip2dwCD6lWZqhy+2sUb6S?=
 =?us-ascii?Q?81ZAx2lWHByfYNtP4X413bihFCQohwvcdhP5N2melt93pWA7fFk3t6VHsscH?=
 =?us-ascii?Q?gHlOZ1pBiTyORy6bcuKL4pSzLg2/CcCz6CnR6A7nc6F6d4Oh+ROWUPYpVdOb?=
 =?us-ascii?Q?zGQAfqsRuqb/cnfU32e5oqEC6yO4QSsAKD+mNgjk8TMzn/FCCAEklyjELM9B?=
 =?us-ascii?Q?bT1Wkz9DUBmfbP2BMpBqVMLA8V4tduI89t6OmsKgR8vSqjAzK9igtZTndEPk?=
 =?us-ascii?Q?Jott++iuhXto0AIwdUlQAto9Qd/n6SdxctWV6Ydwu5u9gmiOU8i8dqM3ciCH?=
 =?us-ascii?Q?EZWdu+buoh9X3smLAjo3wQC8vSPEVrSaReoD0E4V42W+VM4qGC9yaVqTm57L?=
 =?us-ascii?Q?9Vf9nCkzAnwtbHkRAjcoKY6Wvc/qHWVurI/v2ktHA7CB+PF7ol6+GPUY6LO+?=
 =?us-ascii?Q?Oq/kL0isBrVYlU88FeurMeyqiCgw881Mx3wMFi03EaN2iPYLYpGUfZ5Vtyen?=
 =?us-ascii?Q?Gc/+pfpUN4ltP84KVOxkgQuMJwtGokQqyqoOy/xJ3JuvoV0HQaTSgDfIBZdW?=
 =?us-ascii?Q?X8b0eMBau+tA/VZY3N58IeemI7O/rvF/iGL4H95o/hZc8qauFIUntE4XzTsC?=
 =?us-ascii?Q?A3EI3o8atB01Blvrd0EzbhyXj29wyE5RTdHMsXxVf4x9uotlev/CWANj+ShV?=
 =?us-ascii?Q?DKUTvAUtTFt176EyVYCEzEvF7C5vtGsCy6sI6z104dfinpWX5Bu3V8o0uA34?=
 =?us-ascii?Q?BYDPBbyn1PC7I9iHlD74ofXzCe1W6H85jVG/HkRgzOTTHjdBFH/v355JgURV?=
 =?us-ascii?Q?f6IfaQ0PC+2qqOn4zffpLi1nQOcdIUOpq5bDEEuVKlMPHmIuyv3HAqu36IDz?=
 =?us-ascii?Q?6aQoad4/0WxirIGH/G3XYLzazgngEbXWBJvBR2PjXSG2bwNWS/nHzYoPwQgw?=
 =?us-ascii?Q?JM8N0gp+O52DjJRk0MwFFo7+x82F55CwC0vewgl7CSCGkq8FlGBMlMSDtRwY?=
 =?us-ascii?Q?V2Khv2rGFXP/L3S+m6MzTEYMRJguD5IigurCuorhZaqNZdus4ibdlx3EeXEi?=
 =?us-ascii?Q?miJmBgSRaxMpk8hQFdtk52fOPkcA2cSMc89JtTnlxD7uMwHHi4ToJGaSnRsa?=
 =?us-ascii?Q?c7iL4ykKEiIQOHn5vOms4OMkqcw3Mdi2m+D876PZaNWiwjDYjHbHDgchYyok?=
 =?us-ascii?Q?1EUnH0gIW88DYI6lGDjjzs+AfaQTHdMDuyulPk0wumbMYS5FmAnSUEDye7n8?=
 =?us-ascii?Q?4yqmfVV+XmLYBcLTfGcOihwVPuLoesNDcdufzADdsiJ+l2f8KsYkaEiVQzqa?=
 =?us-ascii?Q?gw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8af633-dc4e-4930-fbba-08dcc315accd
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 01:48:24.2747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSWIWt1MrgccEdoaCn5XHWpBuxQQN7DF1rALODpOf5WCJeyi240b5S/1CXoVTaG4IiLZurEw4319Qvc86/SZVSecLRjfbs0bMrKBZNglCvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8114
X-Proofpoint-ORIG-GUID: i52ZXGebvRnDMta6yExPF5aFcgwCYsIr
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c7ea69 cx=c_pps a=JZW2CxG2E6UWpsn1SfDs7A==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=Z5getJ8MAAAA:20
 a=bO4M8U4Om4Npn2QWCZQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: i52ZXGebvRnDMta6yExPF5aFcgwCYsIr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_01,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=965 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408230010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203674

Remove mem-debug option [1]

[1] https://gitlab.gnome.org/GNOME/libxslt/-/commit/c65a7c05f98ea4e9fae1247510b45db9dd3ec907

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libxslt/{libxslt_1.1.39.bb => libxslt_1.1.42.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libxslt/{libxslt_1.1.39.bb => libxslt_1.1.42.bb} (91%)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.39.bb b/meta/recipes-support/libxslt/libxslt_1.1.42.bb
similarity index 91%
rename from meta/recipes-support/libxslt/libxslt_1.1.39.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.42.bb
index 2cc0c84bec..9985dd8827 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.39.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.42.bb
@@ -15,7 +15,7 @@ DEPENDS = "libxml2"
 
 SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2a20ad621148339b0759c4d4e96719362dee64c9a096dbba625ba053846349f0"
+SRC_URI[sha256sum] = "85ca62cac0d41fc77d3f6033da9df6fd73d20ea2fc18b0a3609ffb4110e1baeb"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -37,7 +37,7 @@ do_configure:prepend () {
 	touch ${S}/doc/xsltproc.1
 }
 
-EXTRA_OECONF = "--without-python --without-debug --without-mem-debug --without-crypto"
+EXTRA_OECONF = "--without-python --without-debug --without-crypto"
 # older versions of this recipe had ${PN}-utils
 RPROVIDES:${PN}-bin += "${PN}-utils"
 RCONFLICTS:${PN}-bin += "${PN}-utils"
-- 
2.27.0


