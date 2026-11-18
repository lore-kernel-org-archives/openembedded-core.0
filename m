Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6954.1794982055360467142
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 22:07:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cOEWN1VW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=57820221a8=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Ue8Z3427003
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 06:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Tc6OHXXeH
	Lemwu57QNAUICt9pn1+HnSwU7jmu39ngJ8=; b=cOEWN1VWA0z1B16xg51NMkzcs
	1HMt+uOXdGvz1LBEXOUcjP3wBSXD+UasSXbUkx+t9t5ZJjP6e6uj6+kqYd1Tk36M
	nS/NglRBaGp3OEfvajg9fAvQShPIGC+0sHk1TVxNHvfenOW8nq43ridMc36XjoP3
	fuPGZkObR2gl0gHCrFsSpqy+g8mIA10Egk/BaHUNtFp+AE6RGfsY0GWB++k5dy7H
	Sc9pej4swpVx+hISeSyxqU0ghgEVAVxbF/pGydcDiMJss8fMqWnDVvXJWsGpDXzm
	W+mJ3Yhq3ZE1HuROd8o7QHnDXPfuNL/GsIxhTKnRPaka4j027KVAu/Tj4gtyg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022093.outbound.protection.outlook.com [52.101.53.93])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j0yvh0exq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 06:07:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgXAwgbr3n+pf1WlwpV61d89wvFwKEpMX6PhHof4lr4Rl+4epfuET13pO/GbM7OT+B/ri8ZUwdravySZq02QMImIY+9oYb+cwwYpuXzNuLJTkYcTJkBMkionmd9vx+ZKH//T02aCk65LySm6gKUIM7Ik/iL/RdIe9tlFvOw+buWjrxMpTkTLBaqwdpFJaGps2xS1BaFmTmvTU8xtNODWwlnr8bXTwqkeQqQMF9Zl+9vmp35o5VVjn9fHwDbahLS6/fKjom3xinvfMO5V4XQpYT+T1RolkyfTQMKzYkUl061Da5rIT6LBVd+FtWj3T9bbX8uF9A4Ph4XPuO7X5uMYVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tc6OHXXeHLemwu57QNAUICt9pn1+HnSwU7jmu39ngJ8=;
 b=PVGI1KltpDY5ikh70Utc6tlPpDAnyaeoJ7ledoSaxJM96gJbEtFvT+TENuB1H3nWzCyZ4GRU1mYmA92GrGVs/kkm4uynl7Tfac8KbkiBf3imJ0K6x0CZcMoJMBeW4/GJkYZ1LpjS81zGhxUoMRM+2kLvMK4aTLPOWbFhq+/TfrlMGLQTobNMRW6GyP72eGJFml94llYQ9k5KVrA2GmFMR9tr+7PQp/quUoLmpCZrlQUg3Qn6ODyBxnb+x8Lb/JP9IAqEHlS+wCWl+ZXzgRHyl0iWXQK1ZJ+Xqtb+4fI4BaRnb9ocYs6yrf3Q99rWZqtJff3pOb6IJrUQ5hq6wXljIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by SA0PR11MB4768.namprd11.prod.outlook.com
 (2603:10b6:806:71::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 06:07:30 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 06:07:30 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.kokkonda@Windriver.com
Subject: [PATCH] gcc: Fix for CVE-2026-125709
Date: Tue, 17 Nov 2026 22:06:45 -0800
Message-ID: <20261118060645.1117433-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ2P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::15) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|SA0PR11MB4768:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc88e20-718c-47ef-f10a-08df453a3aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|376014|1800799024|23010399003|261102123227099003|38350700014|10067099003|260925022911599003|260925021311599003|11063799006|5023799004|260925021911599003|56012099006|261026121527099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|261009223027099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: wbfEqAs3QdVuU2o/OvUzTHcENjyHca0X7rDzfbfAKZ3zX7YIJX0YVuYvK0YPwN5GVaLq5/fkoDR2BmvANrwf+cJBugJ+JF731qxL1lLEEAFeq0XpeCEAhzrrF86iNhRblJTP0Xko4xQDJQD7RdAbaJr/84vWEhmIb4/6deaHrDirvGNGjtwks8EiA28V2hgRY0aP1m0J4rQrJFdyuxo7XfMhqawV3ayTkScDML3NvjMOQ3ZGOs4AnDnUocNGwARwA6dEOkce6NxWqh3JAMMyZmaufA4EdtFbSJD8hAyMVu6KUnc3veVN1Bg2ibquSrm76ROUMBpAqr9H2UUvu7DkSDIJmUSVnSNG7aCoUN46snnI0CdQoPa3kOLhlRO2Un0x6gtQjb7VHkPS65j3KzB66DzgPQQicXbGG6j9mg154Rp7gGhklPdAZi5nNzf+59MMXelb/6Fjv3uyZYWmpDavmw260MSKwerytbIfiVwdieM6haFKYSwFrdbK6yHZ8ErQsYODONMXbJ3l+3BpHMxrms4Rdu9McbwV1CbA5pRes2m4Gd2y8PnO7XI0ulqp6pZHx/dLS3iA0HCv1cWw6n09nv+7wehcP233qOmAuGCv7mKOxYX2/nDA1ta3L2YiZG1j7OqIQ+95hKrP9hgkSWkG3Lj0wvylO+GrwgNd10my6OjA1u5QGryyOSN+sIxA8o8VCc7SQGDv6JSE4fO4YksEpnGK+MufO98tsPR1pBx9VaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(23010399003)(261102123227099003)(38350700014)(10067099003)(260925022911599003)(260925021311599003)(11063799006)(5023799004)(260925021911599003)(56012099006)(261026121527099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(261009223027099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o69XUEBKPZonQT9/crnYLQB8b2yxaVxLLSBD0cDJsx+9UcNfzVRHvOALGVMl?=
 =?us-ascii?Q?8wQog6r8U4LPe7fAxP77F0cj+69MSSsMECpRiPPETnmOQNIKdtfgT+ZTdSGO?=
 =?us-ascii?Q?BPYSRmD5J8a+9yEITkBn/cjGF/6ncC46GI165yJJy7K9TqO4w2ROKalLUvg2?=
 =?us-ascii?Q?65Rmn3/lnhjM2lo2BMbA7C3XirbZ9i6sC97KLi01IiSNhXH7HL10mGErdWmH?=
 =?us-ascii?Q?PfkEzT9q4MXPxBWcNIU2JNOqsdypp+bbVV18+4QSdwwTbrtdMzWgapQDmwnK?=
 =?us-ascii?Q?syCBDllt7Z5stGw/jMBPWBQu0Hkkcj1ike76UN1hQMwsC+/iOQFJFdiXj1Ah?=
 =?us-ascii?Q?ojT4BI+3Y/UeBZWxV4+zEl2DWNumZUtA5WrJ8MqJo0TPyOlwEuaav7hDaAio?=
 =?us-ascii?Q?LhrXRVsVU7+3CuwxyrXnHz7ZFBD1edPgVDpL0r59177CPy8Af9Iq2eMIq/Ot?=
 =?us-ascii?Q?EhEIPIZYHXTAYB142TC9OoW/dfCjqf3O3mPHiAesYoBMW9rY+wgKTJs5E2ZR?=
 =?us-ascii?Q?mCi4cw3l3O4M3i4J6JrWY/dJ/Uh5tbIDkxqLcd3NZA16O8P9PVQRksS4o2vy?=
 =?us-ascii?Q?mD0OkxXW8ES9AnKOCmOn4MSDD+wj7/a2y2q3a5NJT8OpNkdGCOPknzUI7aaT?=
 =?us-ascii?Q?GnidJ9WwU74pnLnl/AHC5nTOmdW3CSllcE2FGrIldDzatouE9qi2ziWfMn0L?=
 =?us-ascii?Q?O3a0QA8DxBU0OF3BZzrClAbzCOIBlfl3dwmudfZ7QTlz0eFeFjsLQBc3nk5s?=
 =?us-ascii?Q?moe2jC8FZqtlcpI9hBESawgpMDJbgJgEFNYLngCeTbz6hVPDlp2lH8Q9Pg36?=
 =?us-ascii?Q?M85Gv4HUh+LVevWZ/uoG2WKovmJPeyXz/fse4bFDP0+SW48AB1gMGS7s3Anl?=
 =?us-ascii?Q?u78S6zVBo7D0GxhnRAU6EkRWitzJxpnx/3CetgZ2YMXSf/5KFXHtqnxQVz2y?=
 =?us-ascii?Q?4Gpdjcrt1oHdiOrmHtl4zH2jdjVJFiY0WjNqAwyPAEi/Oh6LAOfn9tmB8WYZ?=
 =?us-ascii?Q?oZVXBToy160fhIyRLOuWoIkpWjuE45U+g/JAkeAjWKcbYVBbzHZD9779rjGm?=
 =?us-ascii?Q?ATf2GuiTRODutVpeixOkg+knSfpokaI9bFjwzz2IFWbmzeZWj48bNs+mirDm?=
 =?us-ascii?Q?OyfYX8DpNaov5WnorHlNs5emHfVk6b8SvL4zOtAkCU7wc0/khCjeFNs4mgSs?=
 =?us-ascii?Q?PcGxnR6OKxq3/hCKEPGWeNRbSDDC3O6mzDCa3KXCH+KVzml9JMxSOvZcLwL0?=
 =?us-ascii?Q?g6To1U9e32I7jp2529Zp5dDH7kWyMaJLXnA6IEuUsjne++NikmElJpO8ypjk?=
 =?us-ascii?Q?Lg2R57CM85B3yPCTO+f9PrDUzLghVMoVUASYL6i/US0bx7gAWM6I+AIpYNHa?=
 =?us-ascii?Q?aRSoSboYjWOTyBZuKAtFQTV6ZDYI8ZPsUBZlb5E8/PtNM+J23iFcYFbUmoGW?=
 =?us-ascii?Q?OAEfMu5hKElE4aM7pFs8IrxJy11O5hMpjfyn3DughYuJd2gjEDLpuUa5ApkP?=
 =?us-ascii?Q?ZnGrIg3auPWQLMn9/ZBIu1ryTK0oTA5h9gPLi0kr0frunPnNXKEUDr/QldBD?=
 =?us-ascii?Q?h08wge7H2/m0oDkAw/cKzL9jR4No+MA3ggJP6Mhw4z0eIkL7/Lm6ONc9X7HT?=
 =?us-ascii?Q?UKkmuBFhgsWKMWIIbCSrK0WyW2Cpa9T4h0R+YXLVQLs6RzB7u3VHUq9HWXAH?=
 =?us-ascii?Q?rwg7bT7cnnZFXzI3qgHfNGx4DwYXhl1FnvWLQg7ZGwZ6MbAyFdPXkixl4gKj?=
 =?us-ascii?Q?l9xysj7NMj0apwQTO6I7fqlP2ctUbwg=3D?=
X-Exchange-RoutingPolicyChecked: LAKia6SSMnE9+DIUp7UxXqMiyS2/JUrjKL/drbjpQ9rHT43KqLr+Rz7at7pSYB3JjzlOrAZIDe8i09X9/LaHcPyzsIwxWTBolgWuvUxnkljow+oPwPmKLf6tXhTXlqfyGlzIPSg8Xu1kTb+uF2TZn05xSlufDMLuTiacPCvnOFc2Z64oYWRp0KcLD9Fiht/khqhgf3jvfmqlgyOpf7sSpv+Zkuc0vdNoXmRL162aXQ1I1YbY38lABhYYfRuqFvibXV3ixwiqraULPbgBAAHkpzsa1EtkeiuLT1Oyw80TMoIy8hC7OdNzHdR6oras7PvnbV7ncYBz49LdzR2tggQ6vw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc88e20-718c-47ef-f10a-08df453a3aba
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 06:07:30.6548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMdAv8ckm0DSUtOspIXvemjsl9PAONIw9k80I2g6WrammvpyRtQih1vUfkXMhdx6t6cSVBvTJFZ0JZORe7NTy1ue5rNf/ZOFtQW/PI5mxRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4768
X-Proofpoint-GUID: fAyMCK_tzm94H4Iq2hoTBP8x4uWCbnMa
X-Proofpoint-ORIG-GUID: fAyMCK_tzm94H4Iq2hoTBP8x4uWCbnMa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX92QwushrD/4h
 M8wQsEZA0SSk6ZNyCEWKCjGFMc5GmkS6XkUWh8occZfTOdYUKLBXty8MtYEBho/aFM3+3lO2iZW
 kQQW6etiobm7TXbzmlJpXL08rB3dpSx7TdjFhX1aNNmXlNYJfM+lrVNgI2biIUimlgDrD89Cvmn
 U/h1s5n6VScZZCN8ke0ppNenYl/b1yHyVjc+Djqd5qY1ti9W12bacuM2IGN0QOg29/pmpyH1nMk
 +QLuU3ovm7FQpV6d4sBHvovhIZDAnutuEF3OjjzJGKqZUyQ8Sa0DxBKNO9Rn0aZaGiQ/ed2t1Mb
 L05RqUdzxnbKfD5ecPPh04k/qg6Xgo1lrKjCDZSfbd73H1HehYaJ7junUUtbvNXRdB00AEJ/bt9
 a+eDX7YajKAdCTPQgWqe2noYxfvuJ0f+W2rYuFrJWWZNu0OeC1xtJG6u2piQ7s9cWHTjUb+np8I
 LpvBKUhJkWqKPDDtz/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX6PC4jpqeSVKe
 kRqzx+ieyBiNfIqJR8Z4n4/WrRptoAVyqS3gJ+/zyX2D6daOYmeHAVL6YG/jza0evnYGBzaw3l6
 FbsNYQ5dNrShWjqic/ClDify/A5iRGk9sKxSYhEle0YZORZ9N1uZ
X-Authority-Analysis: v=2.4 cv=GNCdgeNK c=1 sm=1 tr=0 ts=6afd40a6 cx=c_pps
 a=F9xFoPyAMX64h5WOW3qpxA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=mDV3o1hIAAAA:8 a=20KFwNOVAAAA:8 a=t7CeM3EgAAAA:8 a=j5bqmL3JzUQx6YTb6fkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 06:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250514
Content-Type: text/plain; charset="utf-8"

From: Harish Sadineni <Harish.Sadineni@windriver.com>

libstdc++: Fix buffer overflows in basic_filebuf::overflow [PR118099]

If we fail to write the content of the buffer after inserting the
overflow character into the end of it, then remove that overflow
character before propagating the error back to the caller. Without this,
the caller is left with pptr set past epptr, and successive calls to
overflow will write further past the end of the managed buffer with each
failure.

References:
https://nvd.nist.gov/vuln/detail/cve-2026-125709
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118099
https://bugzilla.redhat.com/show_bug.cgi?id=2569390

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-16.2.inc        |   1 +
 .../gcc/gcc/0027-CVE-2026-125709.patch        | 377 ++++++++++++++++++
 2 files changed, 378 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0027-CVE-2026-125709.patch

diff --git a/meta/recipes-devtools/gcc/gcc-16.2.inc b/meta/recipes-devtools/gcc/gcc-16.2.inc
index 3497493619..a629b48d95 100644
--- a/meta/recipes-devtools/gcc/gcc-16.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.2.inc
@@ -75,6 +75,7 @@ SRC_URI = "${BASEURI} \
            file://0001-mapper-localhost-might-not-be-known.patch \
            file://0001-Fix-check-for-working-assembler-gdwarf-4-option.patch \
 	   file://0026-CVE-2026-102010.patch \
+	   file://0027-CVE-2026-125709.patch \
 "
 
 UNPACKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-125709.patch b/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-125709.patch
new file mode 100644
index 0000000000..99ab6f36c9
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0027-CVE-2026-125709.patch
@@ -0,0 +1,377 @@
+From 68b1b9056c70acb31f2964963b51c480ff820602 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Wed, 28 Oct 2026 10:34:17 +0000
+Subject: libstdc++: Fix buffer overflows in basic_filebuf::overflow [PR118099]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If we fail to write the content of the buffer after inserting the
+overflow character into the end of it, then remove that overflow
+character before propagating the error back to the caller. Without this,
+the caller is left with pptr set past epptr, and successive calls to
+overflow will write further past the end of the managed buffer with each
+failure.
+
+The new 118099-codecvt.cc tests were assisted by an LLM because I was
+too lazy to remember how to write codecvt facets.
+
+Assisted-by: LLM
+
+libstdc++-v3/ChangeLog:
+
+	PR libstdc++/118099
+	* include/bits/fstream.tcc (basic_filebuf::overflow): Rewind the
+	put position if outputting the put area fails.
+	* testsuite/27_io/basic_filebuf/overflow/char/118099-codecvt.cc:
+	New test.
+	* testsuite/27_io/basic_filebuf/overflow/char/118099.cc: New
+	test.
+	* testsuite/27_io/basic_filebuf/overflow/wchar_t/118099-codecvt.cc:
+	New test.
+	* testsuite/27_io/basic_filebuf/overflow/wchar_t/118099.cc:
+	New test.
+
+CVE: CVE-2026-125709
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/patch/?id=68b1b9056c70acb31f2964963b51c480ff820602]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+
+(cherry picked from commit 2d296e9f024edbb49cad1f3ebb5ae34c71ea5f7a)
+---
+ libstdc++-v3/include/bits/fstream.tcc              |  8 +++
+ .../basic_filebuf/overflow/char/118099-codecvt.cc  | 76 ++++++++++++++++++++++
+ .../27_io/basic_filebuf/overflow/char/118099.cc    | 57 ++++++++++++++++
+ .../overflow/wchar_t/118099-codecvt.cc             | 76 ++++++++++++++++++++++
+ .../27_io/basic_filebuf/overflow/wchar_t/118099.cc | 57 ++++++++++++++++
+ 5 files changed, 274 insertions(+)
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099-codecvt.cc
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099.cc
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/118099-codecvt.cc
+ create mode 100644 libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/118099.cc
+
+diff --git a/libstdc++-v3/include/bits/fstream.tcc b/libstdc++-v3/include/bits/fstream.tcc
+index 99aa296b83c4..0d1d9491cb6a 100644
+--- a/libstdc++-v3/include/bits/fstream.tcc
++++ b/libstdc++-v3/include/bits/fstream.tcc
+@@ -561,11 +561,18 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+             }
+ 	  if (this->pbase() < this->pptr())
+ 	    {
++	      struct _Guard {
++		~_Guard() { if (_M_p) _M_p->pbump(-1); }
++		basic_filebuf* _M_p;
++	      };
++	      _Guard __g = { };
++
+ 	      // If appropriate, append the overflow char.
+ 	      if (!__testeof)
+ 		{
+ 		  *this->pptr() = traits_type::to_char_type(__c);
+ 		  this->pbump(1);
++		  __g._M_p = this;
+ 		}
+ 
+ 	      // Convert pending sequence to external representation,
+@@ -573,6 +580,7 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
+ 	      if (_M_convert_to_external(this->pbase(),
+ 					 this->pptr() - this->pbase()))
+ 		{
++		  __g._M_p = 0;
+ 		  _M_set_buffer(0);
+ 		  __ret = traits_type::not_eof(__c);
+ 		}
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099-codecvt.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099-codecvt.cc
+new file mode 100644
+index 000000000000..e4b1106b9b8d
+--- /dev/null
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099-codecvt.cc
+@@ -0,0 +1,76 @@
++// { dg-do run }
++// { dg-require-fileio "" }
++
++// PR libstdc++/118099
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/O error
++//
++// Companion test of 118099.cc testing the throwing failure path in overflow:
++// a codecvt whose do_out always returns error makes _M_convert_to_external
++// throw after the overflow character has been written to the end of put area.
++// If the put pointer is advanced before the throw (and only rewound on the
++// non-throwing error path), a caller that catches the exception and keeps
++// writing will cause overflow(c) to write past the end of the managed buffer,
++// just like the original PR libstdc++/118099 testcase.
++
++#include <fstream>
++#include <locale>
++#include <testsuite_hooks.h>
++
++typedef char C;
++
++struct failing_codecvt : std::codecvt<C, char, std::mbstate_t>
++{
++protected:
++  result
++  do_out(state_type&, const intern_type* from, const intern_type*,
++	 const intern_type*& from_next,
++	 extern_type* to, extern_type*, extern_type*& to_next) const
++  {
++    from_next = from;
++    to_next = to;
++    return error;
++  }
++
++  bool do_always_noconv() const throw() { return false; }
++};
++
++static void
++test_pr118099_codecvt()
++{
++  const C val = C('x');
++  const C canary = ~val;
++  const int N = 8;
++  C buf[N * 2];
++  for (int i = 0; i < N * 2; ++i)
++    buf[i] = canary;
++
++  std::basic_filebuf<C> fb;
++  fb.pubimbue(std::locale(std::locale::classic(), new failing_codecvt));
++  fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]
++  fb.open("tmp_118099_codecvt", std::ios_base::out | std::ios_base::trunc);
++  VERIFY( fb.is_open() );
++
++  // Libstdc++ filebuf throws ios::failure for the codecvt error,
++  // but the standard allows overflow to return eof instead.
++  // To make this test portable, we check for either kind of error.
++  bool got_error = false;
++  for (int i = 0; i < N * 2; ++i)
++    try {
++      std::char_traits<C>::int_type r = fb.sputc(val);
++      if (std::char_traits<C>::eq_int_type(r, std::char_traits<C>::eof()))
++	got_error = true;
++    } catch (const std::exception&) {
++      got_error = true;
++    }
++  VERIFY( got_error ); // a codecvt error actually happened
++
++  for (int i = 0; i < N; ++i)
++    VERIFY( buf[i] == val );
++  for (int i = N; i < N * 2; ++i)
++    VERIFY( buf[i] == canary ); // nothing was written past buf[0..N]
++}
++
++int main()
++{
++  test_pr118099_codecvt();
++}
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099.cc
+new file mode 100644
+index 000000000000..2407119dcb1b
+--- /dev/null
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/char/118099.cc
+@@ -0,0 +1,57 @@
++// { dg-do run }
++// { dg-require-fileio "" }
++
++// PR libstdc++/118099
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/O error
++
++#include <fstream>
++#include <testsuite_hooks.h>
++
++static void
++test_pr118099()
++{
++  typedef char C;
++
++  // Only run if /dev/full already exists as a device: probe it with a
++  // read-only open first, so we never accidentally create a regular file
++  // named /dev/full on a hypothetical system with a writable /dev.
++  {
++    std::filebuf probe;
++    if (!probe.open("/dev/full", std::ios_base::in))
++      return; // no /dev/full here: nothing to test.
++  }
++
++  const C val = C('x');
++  const C canary = ~val;
++  const int N = 8;
++  C buf[N * 2] = { };
++  for (int i = 0; i < N * 2; ++i)
++    buf[i] = canary;
++
++  std::basic_filebuf<C> fb;
++  fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]
++  fb.open("/dev/full", std::ios_base::out);
++  VERIFY( fb.is_open() );
++
++  int i = 0;
++  // Keep writing until overflow happens (and fails):
++  while (fb.sputc(val) != std::char_traits<C>::eof())
++    ++i;
++  // There should have been N-1 successful calls before overflow failed:
++  VERIFY( i == (N - 1) );
++  // Overflow some more:
++  VERIFY( fb.sputc(val) == std::char_traits<C>::eof() );
++  VERIFY( fb.sputc(val) == std::char_traits<C>::eof() );
++  VERIFY( fb.sputc(val) == std::char_traits<C>::eof() );
++
++  // Verify that only the first N positions in the buffer were changed:
++  for (i = 0; i < N; ++i)
++    VERIFY( buf[i] == val );
++  for (; i < N * 2; ++i)
++    VERIFY( buf[i] == canary );
++}
++
++int main()
++{
++  test_pr118099();
++}
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/118099-codecvt.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/118099-codecvt.cc
+new file mode 100644
+index 000000000000..add23cc99500
+--- /dev/null
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/118099-codecvt.cc
+@@ -0,0 +1,76 @@
++// { dg-do run }
++// { dg-require-fileio "" }
++
++// PR libstdc++/118099
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/O error
++//
++// Companion test of 118099.cc testing the throwing failure path in overflow:
++// a codecvt whose do_out always returns error makes _M_convert_to_external
++// throw after the overflow character has been written to the end of put area.
++// If the put pointer is advanced before the throw (and only rewound on the
++// non-throwing error path), a caller that catches the exception and keeps
++// writing will cause overflow(c) to write past the end of the managed buffer,
++// just like the original PR libstdc++/118099 testcase.
++
++#include <fstream>
++#include <locale>
++#include <testsuite_hooks.h>
++
++typedef wchar_t C;
++
++struct failing_codecvt : std::codecvt<C, char, std::mbstate_t>
++{
++protected:
++  result
++  do_out(state_type&, const intern_type* from, const intern_type*,
++	 const intern_type*& from_next,
++	 extern_type* to, extern_type*, extern_type*& to_next) const
++  {
++    from_next = from;
++    to_next = to;
++    return error;
++  }
++
++  bool do_always_noconv() const throw() { return false; }
++};
++
++static void
++test_pr118099_codecvt()
++{
++  const C val = C('x');
++  const C canary = ~val;
++  const int N = 8;
++  C buf[N * 2];
++  for (int i = 0; i < N * 2; ++i)
++    buf[i] = canary;
++
++  std::basic_filebuf<C> fb;
++  fb.pubimbue(std::locale(std::locale::classic(), new failing_codecvt));
++  fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]
++  fb.open("tmp_118099_codecvt", std::ios_base::out | std::ios_base::trunc);
++  VERIFY( fb.is_open() );
++
++  // Libstdc++ filebuf throws ios::failure for the codecvt error,
++  // but the standard allows overflow to return eof instead.
++  // To make this test portable, we check for either kind of error.
++  bool got_error = false;
++  for (int i = 0; i < N * 2; ++i)
++    try {
++      std::char_traits<C>::int_type r = fb.sputc(val);
++      if (std::char_traits<C>::eq_int_type(r, std::char_traits<C>::eof()))
++	got_error = true;
++    } catch (const std::exception&) {
++      got_error = true;
++    }
++  VERIFY( got_error ); // a codecvt error actually happened
++
++  for (int i = 0; i < N; ++i)
++    VERIFY( buf[i] == val );
++  for (int i = N; i < N * 2; ++i)
++    VERIFY( buf[i] == canary ); // nothing was written past buf[0..N]
++}
++
++int main()
++{
++  test_pr118099_codecvt();
++}
+diff --git a/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/118099.cc b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/118099.cc
+new file mode 100644
+index 000000000000..bcbbd58ee9c1
+--- /dev/null
++++ b/libstdc++-v3/testsuite/27_io/basic_filebuf/overflow/wchar_t/118099.cc
+@@ -0,0 +1,57 @@
++// { dg-do run }
++// { dg-require-fileio "" }
++
++// PR libstdc++/118099
++// basic_filebuf::overflow leaves streambuf in inconsistent state on I/O error
++
++#include <fstream>
++#include <testsuite_hooks.h>
++
++static void
++test_pr118099()
++{
++  typedef wchar_t C;
++
++  // Only run if /dev/full already exists as a device: probe it with a
++  // read-only open first, so we never accidentally create a regular file
++  // named /dev/full on a hypothetical system with a writable /dev.
++  {
++    std::filebuf probe;
++    if (!probe.open("/dev/full", std::ios_base::in))
++      return; // no /dev/full here: nothing to test.
++  }
++
++  const C val = C('x');
++  const C canary = ~val;
++  const int N = 8;
++  C buf[N * 2] = { };
++  for (int i = 0; i < N * 2; ++i)
++    buf[i] = canary;
++
++  std::basic_filebuf<C> fb;
++  fb.pubsetbuf(buf, N); // filebuf can use buf[0..N]
++  fb.open("/dev/full", std::ios_base::out);
++  VERIFY( fb.is_open() );
++
++  int i = 0;
++  // Keep writing until overflow happens (and fails):
++  while (fb.sputc(val) != std::char_traits<C>::eof())
++    ++i;
++  // There should have been N-1 successful calls before overflow failed:
++  VERIFY( i == (N - 1) );
++  // Cause some more calls to overflow, which should also fail:
++  VERIFY( fb.sputc(val) == std::char_traits<C>::eof() );
++  VERIFY( fb.sputc(val) == std::char_traits<C>::eof() );
++  VERIFY( fb.sputc(val) == std::char_traits<C>::eof() );
++
++  // Verify that only the first N positions in the buffer were changed:
++  for (i = 0; i < N; ++i)
++    VERIFY( buf[i] == val );
++  for (; i < N * 2; ++i)
++    VERIFY( buf[i] == canary );
++}
++
++int main()
++{
++  test_pr118099();
++}
+-- 
+cgit 
+
-- 
2.49.0

