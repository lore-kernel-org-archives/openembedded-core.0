Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D7DC021A6
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 07:46:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16278.1739519173748449606
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 23:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4140ebda2b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E4jjTl010078
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 23:46:13 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwy6m0uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 23:46:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBq6h99qltxwa2K2VRX2yqjOGqUISFswzBB0nHA2ZWBKM1TF14qfeoBtTUehLQxKalmq/ORE/8dx4EDTVRlD5mUg6u9qWD9LLumYAtpvHMRORjfy3mpFAJ8m/+QMeo6Ezjc36FzWjPRfuBMK+waPXvVxDRPKmS1XZ0CnuOWseaeh4AfFIfYMwEReU5O2escMclp0HDDYoQ3+xnp/MQs+l5XBIxoh8rXRx7KeeB/2tIyfgIPc+rnhA09pQWay736iyRq6fiRVDFN58VnaZbgMmqQfcN49biES2Eq15jOcF4voU/Fv8xaRCKpsCPpyxicAbNf83F8VlervN7+J3GJJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BN/XlcStB0EXQzp9OVxLeLb8JaoplCG+pZUvlPnWBJU=;
 b=h6p+L75xBlVFwxo5CM5WzyjiDQZhLXLVCh2dqRwUGElSkR1mlxK88x9MDBwJZcW7/H58IbsKE0vrpjoO4vJvgiddw3pqDhQ4Qg0QTsODMIgA6zKnhAUtqLfK40VGHukUiWVK0V7r4NmOYnHwaeu0j5NtS4dwciyOMXsNR63olU4RkF9mlaFHho9RcV7Ua4kvoU7yVhFHBq2I8+HG90la5+pyD+o+dyrTW1F9d/G79RoP28aHjinOlPPlyAQm+NIXegpxVqQvCwnqoH8JFCuU0SgKOxfvzf798RgCb37ylrvoBPfgFjj6hxfCYiutYuY7WxeP+WehiamETiUFkDc9hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB7871.namprd11.prod.outlook.com (2603:10b6:208:3f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 07:46:10 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8445.015; Fri, 14 Feb 2025
 07:46:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libsdl2: upgrade 2.30.11 -> 2.30.12
Date: Fri, 14 Feb 2025 15:45:58 +0800
Message-Id: <20250214074558.1458206-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0181.apcprd04.prod.outlook.com
 (2603:1096:4:14::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fbaedd1-dc24-4133-8abc-08dd4ccba609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qt8ojjDQjCq4ubbJWA4qwUVeAqYe5K0suARVlnBen9mvecTazNDY8fhZvBO0?=
 =?us-ascii?Q?O7XgFh0OQorMIQKfdUD5byhqlc5sBwQXTEYS/pqsBAc9gqIu0nfYcNsEgNvp?=
 =?us-ascii?Q?t/KMsnnYOgTHgPmhA7btM5NPpAgeAFXwDdytZlRYOSTMNGE+9Ht7Qbvu5JKx?=
 =?us-ascii?Q?8y8biSRu0mUB1njw6lME1YWotezlctULm7AWGyh0mbIpofX55z4t9rpjoorb?=
 =?us-ascii?Q?A+KoiWKldIn8LGE+ExOUdUmt3DiU2qWxF5nhqWKQBGs60xaBmjXpE6UaChq+?=
 =?us-ascii?Q?WVBeN9aQVqBOtvLNpVfgEZERn7YGSL2GNQfD5ffMjsmYbecm1eZkWR8vlT5v?=
 =?us-ascii?Q?2pLJF6wJhUHRomEoK1hagnwOeXsQyXdwdmAJUepL7aN9AdrxVjfC0ha9lQxK?=
 =?us-ascii?Q?T4mgd11va7ZJqPYx8NdXN5qbcaRBQ2ZUWikPc2vHl934ECUeCWEjoAJzhqDW?=
 =?us-ascii?Q?BbZd6HQApoN828yUeXtSNrdpw/biZvweSGvgc2eFSSnHcYbJVCxYgginC8qf?=
 =?us-ascii?Q?D3QklXUPUQfOrKM/gE4hCgWlcbPz7pRSLz5ROF6J5WlYCKMELNCUeOyvrTUe?=
 =?us-ascii?Q?AkeoPKPg5VyYDxqvVgkAAVYP8IoNST/EgxUZ/9Ggfc6S+3JJNUzm3hixWZN5?=
 =?us-ascii?Q?1yQZtW0LymG6bD5DPSosOpaI6loyCvPotULiZb2VanEgZyJwK+bvhnyrjBK7?=
 =?us-ascii?Q?NIRRGk58EzwdEnBB8Yj4HWzZ89tjBxjRUZB+GvRt8LD1qFncfr49yAqb47Zs?=
 =?us-ascii?Q?9besA7PFQa1i4vgOx64xicyQZwr/1B4cRpDydogdFtFCSTPsxjVdj3d4Zzpd?=
 =?us-ascii?Q?EPi6MdU1KjEuw5FDJu3DphuK+hHco7DPdBkvtzYV+Z3uvBLyAjJIF7mwiOUm?=
 =?us-ascii?Q?3REFAANkus8elwFREvzPiE7NA46fC+Vqm31ZtWVbhZRSv4TZfd6vexDxQlhG?=
 =?us-ascii?Q?zOxS3YqQUJjRdJbNpej+9kNTDm7ecrjIH9waq28wj8ItG1WFqZfQrKMewlUo?=
 =?us-ascii?Q?40t3iyQbD27XBT20AaQNrp7OWILRCwpAwKSsy4WMKjcY9bN+/KV7be5G5dyF?=
 =?us-ascii?Q?FaZ/2xxYinF/PAmSX/fpdRCZztYNd9SvoKYRWvV1iE/A7nuwqAEJ0CjkRrs/?=
 =?us-ascii?Q?Fga6J8fEroxEIYc7cbzwGqrryeYr1gqDCie9E/LUf1sspliNVaMWpe0PYtX3?=
 =?us-ascii?Q?iGIfG2pNW8zJhACXiHbB8QwzvMCf58TMEpvp6bXtfvYvUxT3XR8i+cO8aZQp?=
 =?us-ascii?Q?fa2RNyhLmmq0+WoTD0GdMSLNM5TFKZorFXpWXvNfPNgCWGPnxNpNQdpzLjDI?=
 =?us-ascii?Q?gCFU7TffmAP72G5pr+PAyTMVLuhZ7rjba7QP+F90MknFwLukS/qoett7dGoZ?=
 =?us-ascii?Q?luzncJC5y292tVLNU+YMpxRbele7FQCfp1SGVY1a0B6S+RDsCw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2t059ADw3Hr5uvM5QNRy/ovhW8iMw0yyW4ggpp2mxwXDjyC7OXfSsdoQCgyz?=
 =?us-ascii?Q?qewVWHXTA6wdPSQSW72bA6lNmislPS5j98YkemBAH/n4Hk7mWDze6wOIGTR/?=
 =?us-ascii?Q?q+KVxUIuovkfyc+B+sTBLGSTXlbhOZ0vKCLx/9IFIAMW1KhbNoYf3bYWGJmc?=
 =?us-ascii?Q?74Ih7YqV/FLuwlYUy2mbSc20RUQWxfUhurd4I3v6+tffuitW41jDgfdyG6x4?=
 =?us-ascii?Q?nTLrXU5pSfbMEHziHCbIe2DTc6m25jOJgj0WPsNPehMucBCWaaQ4feQuq0OO?=
 =?us-ascii?Q?WKb60aOBKtWwb8uhIMhXYnRPYAHdwGd4uecv/H9s2iRfX9zjuEexkChLF4FE?=
 =?us-ascii?Q?XCmOSidKRRhDOhjYctSBLzRc4sReiEGIx3Z1A69FgrnJS5K2a4pLoIIaupEQ?=
 =?us-ascii?Q?0ZunTd/68n6vHfStkS54IBijq5gSMei4qdPOTw73EwvXq78W9S2WAP55CmN6?=
 =?us-ascii?Q?eVejNLukDnrnkuKQWzpaSJc9415pLQrZFXFMbuFld31t77rfMX6l/7FU4Muz?=
 =?us-ascii?Q?gIZILgk6WARyU4LnRLSDSIkDg8zixYkG87hraVmDlVXxMYMB2BsxLIdK6Isd?=
 =?us-ascii?Q?1j2fJXDsVpdmTmr63MJrQN0d0Mz/J8lz5++aMevHX1cWAauMbpo3lHgkKRc4?=
 =?us-ascii?Q?d+VnDmiASGLk/rVd0dx/OaapAvhWXSDDHv/Q94wqeZe30aIucjdhMwt7OVUm?=
 =?us-ascii?Q?DG5PpNhNgjo2ejs74Y7iwBtEnKy9CtwUvxQZ7v6hTKUeLLVj9iC0NgUTQe/t?=
 =?us-ascii?Q?pKxTbr6DF6WhLyohSA+TvMBSed+SsiK+ELVeoUdaHO/FxTQaPL7ezed0AtWF?=
 =?us-ascii?Q?MUS1gNiHKm2TvJjZUoSuvuTzO+5VVUyHmPlhEX6g4dbLdVypsG06iNljiEZv?=
 =?us-ascii?Q?02GzW4UeZ5SmxSeGSxZZHgfkb8rSPJXarclUkNH0mPGx+/G1J5DcKugEsc+V?=
 =?us-ascii?Q?DHCjCQ8lOH7n+O31IvuZYVdA/QUCM7X8aFb9QDK78xThbw87Y8I0b8xPjxEg?=
 =?us-ascii?Q?wI8YPqlN0uOYPiuqsJVRZAYLPV9gOR3umiULEupXHo7cKuQIE2QkEoBf58K0?=
 =?us-ascii?Q?eYA/xP8F8HCc3pPZx+ry5i78VHsdZ0sfoFcPVkdpBPsN27ZvynPme3tatBwK?=
 =?us-ascii?Q?5daQuUZ7XC8t7E0Tqh/r5861FlcRbBujW6Ok8RgDSCvJfY6VU2bZFgH1GXYZ?=
 =?us-ascii?Q?ZTk+3bik+Oro+AEQzr7/px6JH7ry9NfTuKh9adMFJkRTCc5mgPPzsfQr8gMn?=
 =?us-ascii?Q?TOmsv3TtkzjKhIuNYzHErHpmwrFOVPoJNvvtEuWaBqwp7WhHsPh1sAJpVt0p?=
 =?us-ascii?Q?OeQdPHLiROlKD4d0VoK9oqovbcA4u/Z44yJ4qSKLZiQlNQJIwZxXcKVLXVaJ?=
 =?us-ascii?Q?pIKIICjraeIq66I6/+QzbUZmmsbGDoiaNwsOmz1rTgdeSOW4bag6Z3JfyJSj?=
 =?us-ascii?Q?HNtUiRkKcbGSlLusaTCBR++HAcvrdRKeSrbmkr2ogopPUvGMwAerg0CV855q?=
 =?us-ascii?Q?DBoZ+y+rfGS0iw185TtrocrIYrzsWFzzeC5vAg7rEJxFg+6Glm8mQ+XJsg+t?=
 =?us-ascii?Q?kOIIODP5EpDrHDLCZHe3SUxOcV0zN98ebfR+tv0D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbaedd1-dc24-4133-8abc-08dd4ccba609
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 07:46:10.5818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJyt2yobzw5AC2ngTKb06LsOkUwRIXaU8PRtRBgeTLYQS1QufDNYGtxdXqARHsTxjd59FN1Vd+vbnk2HCkrbjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7871
X-Proofpoint-GUID: QaXdr91COu-qfWMR1Gs05-AQp7d9CxrL
X-Proofpoint-ORIG-GUID: QaXdr91COu-qfWMR1Gs05-AQp7d9CxrL
X-Authority-Analysis: v=2.4 cv=G8nmE8k5 c=1 sm=1 tr=0 ts=67aef4c5 cx=c_pps a=yfraj20uO1EtZH+TM7jpHA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=rApI4zH3AAAA:8
 a=t7CeM3EgAAAA:8 a=yZCa54tiGFLcBmgRktEA:9 a=nY6XeQbCzfSyNvKqsd4y:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=748 malwarescore=0
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502140058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 07:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211375

This is a stable bugfix release, with the following changes:
  Improved XInput controller detection on Windows
  Added support for the 8BitDo Ultimate 2C Wireless in Bluetooth mode
  Fixed Steam Deck controller not being visible to games running on
  Proton 9 and older
  Fixed a crash when hot-plugging keyboards and mice on Linux
  Fixed a crash when disconnecting a Bluetooth audio device on macOS
  Fixed building with Xcode using older Apple SDKs
  Fixed a crash when disconnecting an external display on iOS
  Fixed detection of function keys on Emscripten

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libsdl2/{libsdl2_2.30.11.bb => libsdl2_2.30.12.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.11.bb => libsdl2_2.30.12.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.11.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.11.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb
index ab6751ddd0..8f4d41ad84 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.11.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.12.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "8b8d4aef2038533da814965220f88f77d60dfa0f32685f80ead65e501337da7f"
+SRC_URI[sha256sum] = "ac356ea55e8b9dd0b2d1fa27da40ef7e238267ccf9324704850d5d47375b48ea"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.25.1


