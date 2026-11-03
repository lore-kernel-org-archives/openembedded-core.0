Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7401.1793699142681093041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:45:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=rY9hv5lT;
 spf=pass (domain: est.tech, ip: 52.101.66.63, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTJIi0keQIde4MppnosxNkVZGb1EI7/cl31LPD19M2gWO5RodC93naeSZp31W5e40XDJtZjWEMeYEfmngYGQ/gNOa3P2kyebVbvZhucvwtm8tdJz+aQN1HGJKv6ptI8OhdGfojdsAYjg/FD8/StcuZv15v6JHhF4FGZ4FE/650EH5Gsls/DthCtlUh/2zxziTh69zVzdNpFVabyZNLdEFFXIYSun8iYi03dgW7ZCdl6lDYdtCHGUDXfFDafbdIpqVpRVQSPtKjUQerpo+NqsIuG+mKBMEMfgqgOMT4RdsDBLfL7DIj9TjYqpiWRLAVdhnHwARtafKHoMN6ewBR+Yjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMqzf35alxU9y1avsCk5bEDd2Mo7W55ZqufoFvxqhsw=;
 b=i8rmjfpN5djGzuC7mAZp83UOkAD/BhkI3lMBIT4Is74hkdrFc0d6MKdCBxNFMnR5xh38BLpbX0cHkQQYaibTKTz+GTBEFnl0Kq7ufeq3vgzsY/L7KQjYlx4mlKgElzDJy5owlSXBQsOn7JsQa6R8tjPk68hyTobAxAiBktJGDPk9CHTzQ0ehhQOWtWy5/wbk4a9SVMt3raXr6uHJSrhyCuy0PtTu1t6xGioDyDtuOSyCt8dnYfjz5d9IjcXG3YSgK+vFzG49mey1rh8Kh4AtvylteSrquXClADH6DIuMgjujThsGuKmHS9Nhr/CpjkdSt4w9JwYxmR67vmWwnK5Fug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMqzf35alxU9y1avsCk5bEDd2Mo7W55ZqufoFvxqhsw=;
 b=rY9hv5lTYVEVBIhdPoLkdLqUHGWVPGWmzqSbJzabv3ZaEQoiI4oeplu6ISqMEF8FarbLfe2fvTbi2YVYDntRY/O6NyZw0LOlo1sOFjDLIOwZbMvwMuBzDlXQ3AszaJCPLab12TRtIkJIuq/gHBTzPXYW4YEu3ScvRaCkxVAkldiSYLtQqLHW5h525YZnAlpYjM9ixWD7Xj0rBpDgDFoancYWTScKrRTbroUyQ01sioxbvqrjpl2XXG3+wpp8mYRoYoYok6BasZZsPNXLARLaa/kS49VVsR2AJywOQMux4MkNT8SKzAwI2ud8yKQarq0nxbGg7aR0+6xggV7WtsRw1Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV2P189MB3054.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 09:45:35 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 09:45:34 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] lttng-tools: Extend recipe for nativesdk variant
Date: Tue,  3 Nov 2026 10:45:29 +0100
Message-ID: <20261103094531.39610-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261103094531.39610-1-jaipaul.cheernam@est.tech>
References: <20261103094531.39610-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0531.eurprd06.prod.outlook.com
 (2603:10a6:20b:49d::26) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV2P189MB3054:EE_
X-MS-Office365-Filtering-Correlation-Id: 689179b9-d1dd-4fdd-c0bd-08df398f3535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|56012099006|261102123227099003|10067099003|261009223027099003|261022105027099003|261021121427099003|11063799006|261028144727099003|261026140227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: ufUhLBVmyqeeNv8XcwPrEHG2lokiQ83qeRB3s7gC7TFVD45xC6YHK7eIIbvUSs0C01t2s14OkE42I861ENcRBjsplrG0Vjt2Xi6L/lM4TGdle9FQxKckZTRJg/7zrWIXULQBWJXdte5Va6b1uKmrX9qNWUmI2o1Ack35RGqG2lKGraqnOUZLPHVdNQjBhZ6M0ii7z5Nj1BSyuMljZnTHCiJmhHxAmoyeMIGmSrtBoaGmVzidZossTWWS74OoH971DGDvK/Afjb2f6uSbBRndcWj3GySmegklQBhgUnhpvUgwJrWt96haqIjHivIPoVSqMF0NcDtX+rrRqKDMqHqIGL2XkjnhkGnLYsuWJcKu33CdAH5M8Tm7UM6CSJIkZOnGydCsEZlbKZsDNZUu6mweXDmnmAEG7H1VxWEmuB+7BuQeF8UoIEyrO7/xW6ebJywv8GiWgmzmrPA9iIw2WpWv/1sUYtAr0pGsAQGghctSFFqfND4m7i4ZrAvSDsPvUrjCQwKtEJjd2StrhmAt7C1YI+vPWztu0aHhLOm8A49IagE7O0M29vTS2dECEBmUef79qERN7bQklc3OvK1g3ZXawJKTwGXCsjEW9paVVLnt0Q5UrLHm/P5oNQMsHmtr+QNmYMeGTX9bf9sMdbH/NRuUtSlMuG7P+01ZpoFE4dwxJ9Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(56012099006)(261102123227099003)(10067099003)(261009223027099003)(261022105027099003)(261021121427099003)(11063799006)(261028144727099003)(261026140227099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ikXYcLyF/7H7yQYTLFbl3AyZV/EWKzZtsTJC3g5rJ8uas4clnv4cpnUbkGtQ?=
 =?us-ascii?Q?bCiOBiIvEZAi5aXMLPQ1n7Bq/E5sUziwGbONp07M/R/OVNYTlNrYCyKp5oXH?=
 =?us-ascii?Q?mtBnaVDM6VMPZ9jCQ8er/+Ax9GVJRDr9v95ZKTS8+esqV3ztIgzDCokLMnRW?=
 =?us-ascii?Q?j8L+IDgD5FTl96ONtN8avIE/SeJSR3dwlt32zRY+7U0UQWEe9+sV+yZkQDB5?=
 =?us-ascii?Q?y5dBzMdZCOxkAzEfedTrBg1fxTlqn9OBMGtQX6nRX/993eGvC94s1buUX7aO?=
 =?us-ascii?Q?qtNtjlcIyabNvcH1CmsWTwT4dVGCZXMhR/GxxSeG6y/gQNn7fIC1wFepianB?=
 =?us-ascii?Q?LP4y5/rhxKsfz6vnRnYbA5ATqRZbfUIj7uNGFxWIUvaqIHb+A4zFhbYofp4Z?=
 =?us-ascii?Q?I8gdGgnxOpFeCp1mvpmYR7J5nisE88mPaYo5tlhdPKG9tS/RvDMy1WsBx/xH?=
 =?us-ascii?Q?3krkasGOFnUWlIL3kExnLB8wdoN9+4pjra0AKFL1qVfV8Kax3MSFgKim0nE6?=
 =?us-ascii?Q?rVpMjWESaxfWsNn/Z864Qf4a9NYjvn2KBwPSRbG5jipeXbpRYnJrkpm9ryW+?=
 =?us-ascii?Q?syGP4cz++5lbr3zYJLgroml0hlj6fg9E5ztSBEj8y2FxSz5AK0L2+XoPnwm4?=
 =?us-ascii?Q?Qof1ZO1IYfbZgkPGGBFo6dSCNnPk6ZeLy9EkNOveL7dXtRYWT+6E0ulQb6uU?=
 =?us-ascii?Q?7wPeLT22e4O0S2YqgnThfLoziYG5+HWAPnt9wHNdfJvZpuhOQE6L1xcl60Bo?=
 =?us-ascii?Q?iDhl5HuB820t3njn7xjZ6+uUWR96kRr998B46dElaVcZEkzfP73r+WkT6Vsx?=
 =?us-ascii?Q?et/Dse6VDyov1ovmFXLgn+q3q9kUVQOpsYEVtVl8nqmiMMQDDAO+i53WJjIV?=
 =?us-ascii?Q?yqWKbT1Rad4l0FygcDJXuNc+onKnG8jiHLSyyuaKydzHNE1XC3pva4rjPctO?=
 =?us-ascii?Q?afu1hOPOperGz7AwyIHt+Pts47PnGKmz47lCF8X8srs94Zg/4KvUffWJ1yyC?=
 =?us-ascii?Q?tO5plSOKFD1ewRd4UcmgYcD6h+tuDeV7PyWQqA/p+X9JmsCc+0u9KM29xMTN?=
 =?us-ascii?Q?+E6wwC3Yn+xzoNS4k8dpQ9GMLSmmHTa4T8LAeWHPZvkr2ff3hNx47y4PtJ7w?=
 =?us-ascii?Q?AjWqSeqU2E3NiaNWj1XQmm1qGMDaRzhyi9wr1+z/4JrQXTD1lGG55rp6irj0?=
 =?us-ascii?Q?pXZsWnixQDyt2QzO3Z9WI9qz9vQ3dOiVJJKs99ezGFKRvZfF6cafcfhlYLzB?=
 =?us-ascii?Q?+zm1ivysY3Z/lCvCNHDrpLf97zfvPI+W1VjcvBnKKHg+VX5SuoGupUlrE04F?=
 =?us-ascii?Q?QF1zgjkfrrUqIkgL2jXLat7DtYLFF7iR74WlxEcNSYAN3Q4tP8tjIGOL4I9H?=
 =?us-ascii?Q?/KsDZSSOdVdcAcctxakJ3vfcFkDDIB7wGMR3vYFJJBD/WyVMptPw7v7rq2LU?=
 =?us-ascii?Q?sq81HJymFD2N5kmpYDhqYkUf/mXA+MxLc2j9TPAbSZJ1ZUDVCk7XbZQfZXp8?=
 =?us-ascii?Q?iwqe4DL2ikyPPoCk+OIU076RPDqASP7H+RP7LTA7ENAue1iwRnhGBZjB8wRz?=
 =?us-ascii?Q?XcRpARuO14Y4k+PfeclAZwc8YXT+Q8KPSo7cXi25qaVZb8vN2MKtlET5Pgz/?=
 =?us-ascii?Q?GjA3xrI8utSBpck79KHrYGe+4MYJR/kghDJv/k3y5jM/PyeHENkJnV9rWigd?=
 =?us-ascii?Q?c6z8e/7+L/rmgX9N0NsuX6JaOfO810lcOe9scG3PbfeSeDaAWzn8TtiNZWzr?=
 =?us-ascii?Q?uh0ON22HZw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 689179b9-d1dd-4fdd-c0bd-08df398f3535
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:45:34.7465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +AIdVXgaoYpQ7LaV5rEGiRBRw+YjSCWVuHGq/D6vmoWzFDQ5HCKXf1y0zaSN7TV4xojATiDEMmi4At87z9klUvqNGoS8Nh4gR+GMbeNGFvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB3054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249270
Content-Type: text/plain; charset="utf-8"

Extend the lttng-tools recipe with nativesdk support so
that LTTng tools can be built and included in the SDK.

Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb b/meta/recipes=
-kernel/lttng/lttng-tools_2.16.0.bb
index 347bdcc273..060d143d9a 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.16.0.bb
@@ -103,6 +103,8 @@ INSANE_SKIP:${PN}-dbg =3D "libexec"
=20
 PRIVATE_LIBS:${PN}-ptest =3D "libfoo.so"
=20
+BBCLASSEXTEND =3D "nativesdk"
+
 do_install:append () {
     # install systemd unit file
     install -d ${D}${systemd_system_unitdir}
