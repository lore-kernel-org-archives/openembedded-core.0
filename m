Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3659.1792488596943463135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 02:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=uJjg8QCL;
 spf=pass (domain: est.tech, ip: 52.101.65.53, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzh7EzHaeS2rzITO7WmSSTvKgamKafMnR8jKaug8GpG1oW8ID2CYcFDjOkSJfpJZmDvhwVs4kNspgu8i++auOxmN48FkQEeqn9DvlPcgoT+9dQ1aslruv8FUV0ioAj1ScWKdDpNUR8zYIQ7gWpEl08Or0yUJG+msVbaoP1FbloxLCUgyMO/s9XO9esdZ2Cs1j6spsoEC4sGimLLkYVxf0qdGkZJYmxM3C4wud01bL3evyK5p6Uc0HW689ZyYcm8nyR3dvekcOdK4EpvuV6XAya1ocYAI4I/RnfXVCn/4XaAgchT2DecXeAaKMk5MvUlzAK8/q5FjxcxPibyBkoLv0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/OP4UAPJj8PTzDbf5tcp/pgKmjoAfx5ujLkOOde5JQ=;
 b=gyFAxmLj4cwECjXTGRo0fafbvArN0KbT8grKvcBvFYr5HrC6ffUiMOkpqFLAXBL/0sVu2wNC4EJ6rLOLJsapuGtIofwG33UrH55shbwZ7KMmK3wE14f/l4ayA1odNjjJU6mzwIQzvkIBtUGVl9yNVfRlEeKlrzyiV0bqugWLLXzlYpZ639rzRx+ZgVRqacLajn5z0CZfTukyk+v/3nX8k2Yy+0NPnDscHd/NNvmfNmaTtcEwiM9acLGA0aVnntXpNw86YTmFtS4rVBpc4HjGbdDqHcxoya/LIdFIZTGVSc7avaKae5QVlKEBRhPgV1xpde1YCthLuIiINv1gRoqZ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/OP4UAPJj8PTzDbf5tcp/pgKmjoAfx5ujLkOOde5JQ=;
 b=uJjg8QCLy75MmcyuhXVhVTLqib7ZguysXXHrWoOnTIsx5Rm75NDtweem2O7t1Kg4dgPy+JGJQuv51z1sr4BJxuF9cbo02dcTmHtk3D1i1GkSXQsymU4gw3cANk2SC4TKq2yNPfOEiKVdao8Fsp2PN0HIzSoH9FZTs2eTzzj5hFVIwZAueGDWpCG3xDll94o3uWovPvcLadUrxok/5v8QkQmX+/1WGnBpF998keBIhHuS2BvIfiquxrFfeKauYyvDx1TOWUg1h4h5v67VQHFdj5EZuMq6s0y1MV4gW2j7DcjCFCcKcvNHVOsr0AeIknpzCI/nFPkV6OEVZ8giYCNlEg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB3220.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5c9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:29:53 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 09:29:53 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] python3-jsonpointer: upgrade 3.2.1 -> 3.4
Date: Tue, 20 Oct 2026 11:29:31 +0200
Message-ID: <20261020092931.4330-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261020092931.4330-1-jaipaul.cheernam@est.tech>
References: <20261020092931.4330-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0312.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB3220:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c952230-e701-4fbe-bea0-08df2e8cb1ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|10067099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: mqGw5M+x+p/W0pEW+S0GBj1QsvziDlUKFuai8lzJrCl7kDfbAOFBN1t6ZSTDACj26L7SeFDFeQdghR4MXlEnfyuZPoJ89l9l8LKPe/t/YtyAX2i39OkMtePGDG5JK6+dAREPhDIU+TIqmcB2b54VvSVE80RLb/XHQGTtS0YlpPdIUeMC3roXqAwYOBu/sHnWVl3pKtSroNqhDEihnABfr7j027TkibXLBcO7tJheU0zW1KaTr0jAGCYyRVMRRRRh1xzi70y34cQhofd16w293L6GFVQABY1SLTOjZLlugHSuVWwxRQpke3ElznV+Qm8b6O4gQlAF+7ojyjJ99oLUGGct+tVMfL+DJQYfzmaoSX1y/gGvppV3q+NMgk3AIojh6FRB7TqDh+fZuCbd8e/vTYODmL8iuVv3C6D34Xs4wvo9NPsFEelx/poiQ+OdV1DxOp3oGCx7sgoVDCV24kN/8kVPjWIeN+uj6SerYA0ZUHHJgKAlPXcw7pLg+OeiA+W4sR5aulH0Nz/1WnBGwaqWcgVZ8KkPOnZ3enUhZrkZMREQ3rTAEOHLtoFiCnqxvVWS79SzPejLAGMPrg12+O1AvufF2eBaQHZ4nJZQ+L5Akb1C0t7N8+qxNqtUfWxU9reMSKLsyzQPxI4pgycjvI+9J6K1l68kMp4fLEfSJLRbbyI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AyqGiuSpORVbB2xlTa3CatWlbKVAAlr6TiwYJd8p0aFlJG/PGF6jeFs+sVOu?=
 =?us-ascii?Q?4hnmWq5KjB+iqZFqk3Z3Rpj2gyZuPheWXo1lsfkJcCMU/45FH8wp7fdRco8p?=
 =?us-ascii?Q?nsjocQkYSIKmRtFZmGWvu5az9thjUE8cpGVQ3/BvANxt3EGOw6T3O6WrFv0w?=
 =?us-ascii?Q?3uvAlP62RAtfeaLFP05AoeC2w2VXxbg1zNL/VarCKXMr1YKvGX2WxZY50dcA?=
 =?us-ascii?Q?6un5nmwsQyb+H17O26oy5C6XFRi0Hoj2x3njx7iGs0FW6j7KJG8Ph/TIYasn?=
 =?us-ascii?Q?MEOXOmeQtF4Tm4QosnwSqAHP89GxO21dU2ko555iPxYxPt7M16nOgFlH4aP4?=
 =?us-ascii?Q?I923ONzZtB6/fnJbFNLxwLNxQ5JM03RdqqvmCqdbyfA+v4n2AGCVH6vOVkFn?=
 =?us-ascii?Q?kOAkIQ3fG9ghpu6GbgH0tmzykIQgqsptLgBtVGOSQfCiaAC6bPzlgMTfilYI?=
 =?us-ascii?Q?H8pykPTySm72imJKz8cUbGItNUZgS5fwDPXfmY0X4Jr6AQzzrNO2WVi+YsjS?=
 =?us-ascii?Q?0sYVZKb9G2LTBaLJ6bmBcFFhzXAml4EbnoS/M50CMjywCFO3sXPB241ir7wQ?=
 =?us-ascii?Q?HW2KLZanoufL5UET/ACBzwBOZSrrHdgay6RN8WQu0mss/Nw8zXB27t9sS0m7?=
 =?us-ascii?Q?5x4V1YpCr6/SrdU8cPMCrAPHPjRAKBs6VhZ25MtG9lM0++Ls20AM8uw9gU6D?=
 =?us-ascii?Q?h7sbbY9/rqgEYf29qLjgTXZJO6pAr6TMJHmz6JNvSndblK/wdSA74nuKQwOS?=
 =?us-ascii?Q?lZacXtXpR/1771GIkxDZ+ScHEycXe1rqbqG4+ryjaMjpnZynE474TZLsoyiG?=
 =?us-ascii?Q?wq6rf9NRP90zLumlBF7+S1ERZSipah16myH4pvdzAigJdeqkl+GiaVi3selV?=
 =?us-ascii?Q?augoA0VPrlCj2QShAQmmmEw7Twu7v93Es+sBNPRVbW0lkMkiydBYqXNTC3U6?=
 =?us-ascii?Q?bBnCVpBtiWFvewJvE4kaDkAzGJV/cs6TmgOAps2GHdmHVpwT48HOROfw2OrV?=
 =?us-ascii?Q?iMy+T2unHXJeNoqB8tzz8seHIyHGJWgv/REO3sozLdoN/y5iEMu/d+MFFKAQ?=
 =?us-ascii?Q?Ouej2JRbZR3HRUQcJ+ZLgOhrjJuQ4VhuL3AXeDoRZWRTXMQ+aD3U8dRXPr86?=
 =?us-ascii?Q?tZysyP7QVd2cDBECKtsOMEGJpsn2EjztRhuFtO/1yR7CPEHgrz27bjzmwIvp?=
 =?us-ascii?Q?7ZLAiqLCx8cvCTnfJ8TK1vk5h6yL6Wc0LPVuwIf00NA8rcus2tKx70z+VLMs?=
 =?us-ascii?Q?s3oYWxY7zNpkRrxIdxyY570XGEav+bW70SL+BbvjGFxe97a1orzktWOl80j2?=
 =?us-ascii?Q?vwSVESrKm75vBSIuQkycj06Nt0NDOPrK8lgNmLL2vp6JpgVtcjG0pQ2vnyC8?=
 =?us-ascii?Q?WRNmkRzCVCKdsE9npPN7h6r2Jf29iQT6IG8wA4ZRC7eFpx6bikQvGHIzDLjB?=
 =?us-ascii?Q?x6y0U2H6b2po3VQZ2b2MbGWu6e6CMeC5ZsA/NXhwbb2jBjRrhhtvqJTxAzJZ?=
 =?us-ascii?Q?nSHWSUd2RUA/i6vR1RCI5tq8e4PSZx1DBYdA1UA8Z4HxawLgll2+sG8L/cVt?=
 =?us-ascii?Q?EnXdZcGWlJV3GpW3/AMcqEJUJFz1zHGHr+hZP+G+nLOD87rLcaMTwg7l73Jg?=
 =?us-ascii?Q?yVtp1mxewDmUKgEAEFEZI624862Udbpzkg79tkPN0wLnMOwDQpKV9vvarsAT?=
 =?us-ascii?Q?HbCMeSceI2M2b0MLbCZIdNk/SpHxSS8JW1h4CX1f9JQ4CUF17eXAw6KDzyat?=
 =?us-ascii?Q?4X2bE1i3ow=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c952230-e701-4fbe-bea0-08df2e8cb1ff
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:29:52.9610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EzZ62ODfYFz49xSbP7nl4KOix3gCBjkTBI/zzpRM897e8muoXZTFDVYgBfDqcUGK1qXMLN6mF08dOViPgKef55b8knKpzBNi/AcSEndY6TI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB3220
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 09:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248264
Content-Type: text/plain; charset="utf-8"

CompareLog: https://github.com/stefankoegl/python-json-pointer/compare/v3.2=
.1...v3.4

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...{python3-jsonpointer_3.2.1.bb =3D> python3-jsonpointer_3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.2.1.bb =3D> pyt=
hon3-jsonpointer_3.4.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.2.1.bb b/me=
ta/recipes-devtools/python/python3-jsonpointer_3.4.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.2.1.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.4.bb
index 16a393ad28e..1fa8ce75513 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.2.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D32b15c843b7a=
329130f4e266a281ebb3"
=20
 inherit pypi ptest setuptools3
=20
-SRC_URI[sha256sum] =3D "47c846513b3a4ec46eecef1105207fba075e2a3659048e362b=
d7daff0fc33342"
+SRC_URI[sha256sum] =3D "e57015ae65af3821c6a3976069860789cf326103f38b22b217=
8d41d021adad25"
=20
 SRC_URI +=3D " \
 	file://run-ptest \
