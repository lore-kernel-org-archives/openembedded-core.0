Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23810.1794818196023240111
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 00:36:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mwUZZyBh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5780073afa=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7fm6Q3134481
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=02TCiGOQgUmwewlykAAgxfWzAedeiAKvNoX3Pby1bYs=; b=
	mwUZZyBhcE5Mn6bc2xwIdBaDotqL5zBF/4a58HZ+iQPDMea1mR6dPi+gAW+rGnMl
	ixeToJOzxpr7XhG5of6BmngQHeWWcsEyhI8kNj1pzxuqZhV4pc6F5tWMs9yx+QPM
	l04wneqbturDFqd/f1dtRIKtiHLX+H6YzV/LTOSP2076JbqdZBLH0S2jRhCn03uM
	BClr3EkV9EIOkZIfJ5wjxJwtvF3OCGJXcHnv+pfEdEpDwMRb9WkeVXLAZVzcRO0b
	z1An0p0yyTMLrKcE1OQhgD4BiZpaxEshjvBh9K0BKt/6CXDE/tTAasnEutBScgvA
	xlarxV3CwLU3LMDYHEQ26w==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022091.outbound.protection.outlook.com [52.101.53.91])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hxgwaaaq6-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:36:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uW3x0gGreqcGHp18t33pEzPa9e+/gAotd5ui6lyU0/fm32BHiGHr5GEQ2tYcEEuiLzTRZE05e62QNN+TJMqDcvIMHIbvOsxnEUpIFmhAWaE4wgJxSIgftt5e4YpZEB9G9Qn3NF6JdSSg4mrqMRsfcUH5NB0f5x1z7h18x23vcPdnurv4P1t3idrHccEt31CiHQ8CZVgYqNGtzncOiSZMy87fzlATEabjXeK4q6ruU6MJsrrKMRCR2XODTb1kXdQ6QBPRK6DUT+d9u5xXIipvHGE87Miu8czfTKjyu5ltF2qL5MT3mnU7RUGKs2S/Yh4Cz0rlxOpjG16yk0rV0zGEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02TCiGOQgUmwewlykAAgxfWzAedeiAKvNoX3Pby1bYs=;
 b=q0sXUnLalCJujWXK4VqPhM0aNwbv5+uh8Uz31G0wzOmG/DRoeFSOCVPA+jp6yP5l/8hLLkU1EEkdzaVCmCwGi2v8ZiHzAxJVvHqJckDaF497FMJrekp4xOFS9BcFz7WT8YPr3auKL1/vmdOnGQ7733wMOXX+UKWbkhI5TUlpahgUr8v3WHQOVKAdy5YqziNzxYwiUW/zuc0glg5h0KlBg0/Axivdi7VlLA1lvadVEQ3705foG1idh+Wf03Gr2naYYvWSqQxjhZb4jc1NLGpzjPY/m5AxR7REZa6FRYitJTUdSkY+TVrUg850pX+7ck8Cchbu3Z02EzkPfRi2Ckd9Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:36:33 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 08:36:33 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [blacksail][PATCH 2/4] toolchain-scripts: source target-specific environment setup scripts
Date: Mon, 16 Nov 2026 00:36:02 -0800
Message-ID: <20261116083604.1926029-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261116083604.1926029-1-Harish.Sadineni@windriver.com>
References: <20261116083604.1926029-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::11) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|CO1PR11MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a4f3333-1b91-49b9-d81b-08df43bcb825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|18002099003|22082099003|6133799003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|38350700014;
X-Microsoft-Antispam-Message-Info: GYxdoUo+cjYULxyb6qq2oEZSXVmLS1jASTrqlC6Olv9taWZ7Diiod2o545RdyOdKxaUo5EavYIkWbxxwNYpCzji/McI58bdtRgoogCGe3aRb/IorayA0XTHWMClO5liEJD3bqXUM1P7AM9+tNiVgeicxfaYCYXjFyYBwvH4kEiBRl7pDZ/vo1tUryR6HaC78j0eQOv0z+lv4+1Rzmw+gEbtHlSHhoTuqDoasb8R9jyyuqonIU+6aUekLxC8Hko1AhtCcrontINWgT/I/Zc+08Br9zDJHwnCpD98fOcQw8uV7O1oLka7lZyMYaN8M4kYZaBecIqfZdzgG98juJsRJJX68BSiWqXOdtuVrVbDr+WXQvU7oYbvdoBTgYky3P/2UQGBLV80nkxGdEwknYFs117K70Dixb5ENCyzpxbKyP5nHvi3Ztgt83EdOAi8XoOwbCokp25XPZXiGgBSRNkSrdfQm3AgBceveZNdHYRn7LJH5R109TCXGhw2SBJ9svTSfqRh/h7ZeyflplpKaKMrzCeAXMNA2uWAXYWXI7Wi2kOtKrmvP4GOpUt+McW0Jx5fS30uKVdxo1yQRV/IzU3KEPzOINncLHQtI+fzQMiw3XE5Q5oYFhgAv6pCs1Yxo6IbWNiMYThq+vSF+6uFuhycIG0qHZj2c2M/p5Gl07yzNzS+CH5bKF/sdi+6nQZ1Fq/9dOY0F03acKrby7BnsDjrmZmJJX6QF2tHlcYohErrpMg8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(18002099003)(22082099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?akdzEL6PqIHiIOG5+GJn5L2XNQCCDnsABKuRniJTOrbbZmF3l8c03NTPPNWZ?=
 =?us-ascii?Q?7yFThEnIOSKFVOZZp+m1+EeLWDSTF0WshH7IdK8Sdpbh76FsSo+7DSAc86yl?=
 =?us-ascii?Q?e7yf3+Ipb2GL5BR+yXUs37ORvihTxBDSzMF4M6RFsyzEGOKefCvuZsbxaDJO?=
 =?us-ascii?Q?pgmX0ZbVVap8gt93ybEF0laxhQ3k/u0xGw7JyadnkAdwYntyLgaTtzqyF22W?=
 =?us-ascii?Q?7mbZzjpJ/ZwLgtLHwYF+YZ58ZwmqSN7I6QZybBgJiqqdlmvNaL/UyE4Xlhgu?=
 =?us-ascii?Q?8/VLOf8n2zHWzs2xq+samvMeNNqNHSEoGI6j4mcRaHttm6XSn+iygsJQOvof?=
 =?us-ascii?Q?0AFRhYxqf6iZiB+y4uzgrSgY8u1scuiH1Umjr1tG5vJSZqrXw+bR0y3rmiSA?=
 =?us-ascii?Q?eFrPruBq5j9GpgPAAM4Xmk/E0qWzzeY9D0HQOQk5y8S78omsWuho0KlNYxOp?=
 =?us-ascii?Q?3eNMPW2ZmBrg4xdzsuTqpncbbgEBiB+MT4zge0xVcrkjNCgtusweOj+HySYi?=
 =?us-ascii?Q?fzJpUoagOd64oUK0JTMYA+PATtzyLQ0zQUDZYi0tL5shGuzTCgx7HE6Z78AZ?=
 =?us-ascii?Q?p1J9VcDuVdQjOEfZmJO2bEMonxaAiyI30rTKCc73MUaOdonoILYGbZzQFCCM?=
 =?us-ascii?Q?KoIM5Ei1IV4KOLuE8yapY8psHy0+lHOYcCU+CYuU/grTfrfyeG0c6o72R4K4?=
 =?us-ascii?Q?Wy/GPMGrLUhTdFoIhkq17egNVVGCxGyvl5/fDtSngpBDbg2JZN2sXzzKrVsG?=
 =?us-ascii?Q?YOcEwgXb5/MdTE5Nf7vb2csaAoG6rQXJQBxFOwAl19gGdgB+SVLxPrLGsYHq?=
 =?us-ascii?Q?LpGoyMR9IbLXd9AAr5bBxj5HBzVw/16TtP4kjV50QEgnjUdgBzKeSSG6JDSE?=
 =?us-ascii?Q?oOIkUtEVS231OXnMCq7GFoRH7Nq7F6rfeWDQ3HOozN3R231NqODRntb0jG7r?=
 =?us-ascii?Q?oZ9FJ7HZH3ziivVI2/DhYLlZIHURWJfjenMU46GRXSGpC5ayNHXj+PtpLzBX?=
 =?us-ascii?Q?d1Mi4otlS/JsAf2g5xuUHZwnl3UhwN6bHUk65cN6xCyte0BPUtbOQtu8hF/C?=
 =?us-ascii?Q?SuvCjYIzH80jZrSfhxot5KM2iFDwKtwND7Eh+DisiIZUrGhKMfgMRdbEJJl7?=
 =?us-ascii?Q?2tfJlSrcSHvsd/n0rl5PH/VQULH6p2QPFw6I8AM0c5xn2cgedy0nRC3Rztb2?=
 =?us-ascii?Q?P9Jf25YqWcqMULP3gv93NqADyQUKRrH62EA/S7uP2H8OJIB8/fVj6cL2UfTT?=
 =?us-ascii?Q?UOvrzOGFHyjQRFlGkUt7nHee1wInB5dUpTeJnoxnVn/7OEnt0hfGoZp5Evw6?=
 =?us-ascii?Q?1o47sWoj690IpsAFGlzdlWJNQZrs2SxeZ4m+3hNiLGymMZZ/egI+WRwc2PJ7?=
 =?us-ascii?Q?stvh+O8zQ9lDyTdyRe6xm6/L902tGMu4krZe8jRLvnuCj65dcHXjoN5BaOXx?=
 =?us-ascii?Q?+6wFH3zeMwqFdIaQ3h6BhUn/PmbcQ2IpTiLVamdvLs3g7WL9STZnIRwGEnOi?=
 =?us-ascii?Q?EtrVjeXMCrEYf3+9yzU2F7PNQmcaJNEv6HCNhJ1o5KqdZVGGQ+V5YxDIwAOs?=
 =?us-ascii?Q?E1CZLSsk5r+l8EemFIbrAjmUlK9IRfv0Mbd2IO9xddg6l3+VSb8yYZqafU97?=
 =?us-ascii?Q?4r8rEf2dfhgOpawzsonPa7wHMEHJZTKHTZFnZ/+9N6cH/LUYh0X7mH1rUUYf?=
 =?us-ascii?Q?e8yU9PiqNk/qDUgqUxEXkWMxWwWMk5zxj30VOSBP0bNj+GYcnlXwguSrXil6?=
 =?us-ascii?Q?tB50SHQAZPEn08UcproUe5tQby7/tnU=3D?=
X-Exchange-RoutingPolicyChecked: Fy8OcwsujkzCAJiPs0V6sHBvmdSjDCYfzimPzVCT7/KEADxaUH4ceXy+zA4rfjcezIItUAg7diS3T1Y5p0vSlTpLEvERlEI8ao6/QKSp4HrUOaTuPpCrL8X8lo7nM5r6M87832cy3byNxy3ryx+zIoaoQlGysgq6VRgt36jDG97IYbmeU83vundKVQSOd5HBeXuyr8Cd/zSU0JbPzXEB7YFV5PTh/pHvtPoHDVBdrePqER0nILGcTo8E3DkiZ4Au8wxyvfFShpAbYKCx0LD13B0aKg3VqbEessas61CoIn+zHjnMnC+nloJn2AEvMvGcV46KdK98IvfVyS8aOCyf/w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a4f3333-1b91-49b9-d81b-08df43bcb825
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 08:36:33.2790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXLhR+qfr4xoTkFcmp0O69dystPwJ21HDmf+jr0fKjPvUol5GEze9bsuAKKWp9KteSwY+C/ITsCy7qEykWEG05F7pN8teZGfzVhz9eZgQ40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
X-Proofpoint-GUID: pksDxoCGkneFP4kLKw1YAaKtP7sQayLh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfX2SJrGeUu6EpH
 vEUDb+SH+eYfaJuunM38ikbTWqYwbmc9rV2peAcc1EnunYVp4TcutPJbB+ULJvvIYARCpnbCGpA
 r+wOo5ZMR68Dxx1duNuu+jMxKDgDy0xorDpG2LQvE+/NyaxH4c6UqPov6zmWN5Uyigi6MinnbO3
 JdFL3s245E+UBbE1ESLcA77eQP28y6BLH6OiskIjsMjhUr01/kh2AKXjvCTmr/FgEAmpsdcg3bo
 VZOZGesipvbVGo4SRW1d88h2s0+Zssq9Btq2Q65yyK5U4lmzXckyfqA2wSKfkzAoVphB4FCqn5C
 6qK0vLrnuivgWrUlATEAkEJuf0q+1DYG4wlRM9G1ESOUPaX76wR1fsTufbOtcUVmR0nP4hAOhQY
 tTCD6wAouBRgqMd3r5/rk+FNGOklC1bk2Bgmb6KRCQUIQPMACj61Y+apoTFLFsJs93r12uP0Qmw
 fU+ghVupYm+ZIp7BwbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfX6aBbEl3BSEKn
 GtHC4l+gJvR6e52P3YFxoP9Xsua6RQREhxeUPzOax5kO2bgs4PIYPVsbD4kx9XIbkmECYqAA146
 b2DzdM6c/4weO/Ou8a4toy2t6DxIo/fIyFTYsZC/JfnsK2RgPSty
X-Authority-Analysis: v=2.4 cv=OJWyTiaB c=1 sm=1 tr=0 ts=6afac092 cx=c_pps
 a=Xsn+9nYcq8ItZ5QxXIZu4A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=5IpqCTPlAPx7f6KQeWQA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: pksDxoCGkneFP4kLKw1YAaKtP7sQayLh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250317
Content-Type: text/plain; charset="utf-8"

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes [YOCTO #15061]

Source any *.sh files from environment-setup.d/${TARGET_ARCH} in
addition to the existing environment-setup.d directory in the generated
SDK and tree environment setup scripts.

This complements the rust-cross-canadian changes, where Rust
environment setup scripts are installed under a target-specific
directory. By sourcing only the scripts that match the active target,
the SDK avoids loading environment settings for other target variants,
such as mixing 32-bit and 64-bit configurations in multilib SDKs.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d4d39fede00aba9210f38fd780b7fdaee99fa33c)
---
 meta/classes-recipe/toolchain-scripts.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index 8bfcde55b5..7b10b76609 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -169,6 +169,11 @@ if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
 	    . \$envfile
     done
 fi
+if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d/\$OECORE_TARGET_ARCH" ]; then
+    for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/\$OECORE_TARGET_ARCH/*.sh; do
+            . \$envfile
+    done
+fi
 EOF
 }
 
-- 
2.51.0

