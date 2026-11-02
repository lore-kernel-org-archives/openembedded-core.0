Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9755.1793615272387184078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 02:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=WAts3IHl;
 spf=pass (domain: est.tech, ip: 52.101.69.70, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mamd4QE8+0tt1ymkpGNmqOyGu+g17Jchml8DfgGtA+KG+SApt4i88jgTOVyIpxw5xrSyV1Qi9JHlZ80g2yWbGqw3UIlWtVWu2YgE4Rg8OksCs27MpXSwnbKp0J5v6H/9A4mGchdrO5RxTq11O2ID4JvtQRuoRmn9PCvWkLM/+sS+Qrle/sNhv9lm+oC9fDZ8HTWmsrt3YP5Kh1qw9ZT30bO/rcl4c2FPQWG31wftVjWtcI3/bAJCBYGzLr9K3fDOBOIJ64A3P9wlP58UvPR1Qtph2WvRuG4Ty0LVjpklu8BJhkM+bkln002yJ+Jl7hsuk5KC+NFfUhbg0eOjeG511Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjGxCvmr0ZSJq+8UJTPBLQFwUUAvCuWrvGQgYOrEarg=;
 b=PwGaOJMaASnWU3W9j8cZ5uGTz3cUIDyPmLbVVcki8RNXmyFI37Sv/bOsekkHyEHqZFQDCG/TCYQ4la4gL2gJOdU4jdBRpVHHJwGkjMli0L5EuGqZF9lhovF/nddSy+oB7XDXANyPOsQq8G9E5fmIwJgh1zOi1azKMVK0n3QD0FlIijMKze2Tdi0gMEhLkCiq1x7n83Pve/EJ7q0O/V3VzRO/hgZ7cGUJCPqupGIOdBxmTzxVuS3BlIVB7tvvBVItt3waYdIqsYJXVUxhaFXimqKf7UzSB+eecZWh0smIK0So+X5skJlKnvNCmE6TSHXIwNAn6mmut06v1Uwo63L1KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjGxCvmr0ZSJq+8UJTPBLQFwUUAvCuWrvGQgYOrEarg=;
 b=WAts3IHl6LZWFW4bgF71/0QnHw1rBDnwG+IOQmxeqPNYPEBf8RU0khFjIr9B0YCzpnAs90iNLQklL+1aou5nKUgbkYmFjESUUzIH+EswZuzPSHB3DLPdd31o2n9teE0p2IjqrcK8SDbYohmWa8wFypCg4FF7VfEQGlv2t+TL6xk441wHRuaMaxrD71OpVgzYRKfDLKWXj1C5f4BFgK+Wa6l2XYer2jSdyWIyaeonjSZ0skmgi3QXMUvB6D6hAer07xe1rrL/HtmgTijmConrYHt1MzBALyPgmu0q2DcazbBKBnj2anskzYnKN3+ByQGfqyqiyhk7I19lhxZcId2t1A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS4P189MB1991.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:506::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 10:27:47 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 10:27:47 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] kmod: upgrade 34.2 -> 34.3
Date: Mon,  2 Nov 2026 11:27:41 +0100
Message-ID: <20261102102742.31991-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261102102742.31991-1-jaipaul.cheernam@est.tech>
References: <20261102102742.31991-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR1P264CA0023.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS4P189MB1991:EE_
X-MS-Office365-Filtering-Correlation-Id: b6d742a4-0b56-457a-1d75-08df38cbf060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|11063799006|56012099006|261009223027099003|261028144727099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|12006099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: xgwgvCZD8TpPX9cD96BfMwD6dP5raJ5aYOx+n42Ynt6pUQVK+WzeRA90S08KBn29KZTqfQg3Un3ddj7BS8801b98ePkRDxn1bsnP/jCR4kOnBFK+EsLBtVDw4SQB4Wl99AWN88/lVtpn60OjufA5E1K1jIwgp9ZI0iTU4/P4JRbCKs+SB1vcZwtO9i/gsiXGNu8iO7WIHSfk5LH8yAKsp4qelHQWOTZ9GQ3GdyfOscy6S1DAooBsNudTCcTU3pysqXIgSN31nYZBg1OzTwo4ZXVmAQnjnJDYeMaK+rC6Msw2ml/JhonIQGQoDO2meS7UcTcoLZy1LT2P8cOuayJrNBtNz7aySn7iFktNKyrpPmdUijT4Igc6zHpOGPMl0mnJvxx3smbyoikMV/cv3Ec7cFVM8xlzAFLSkkR07kqPify2tOu3/wTQwdJp1XtI+fG3DFySlijyao5BPWQFoUnR/laLNPogNW02uunJof1Oo3Cr+MFMcBSCxfUGcNcX2JUej0vM5hAdIYpOnI7yBiTjVnB+2jOfY5HdianGwlCLyvhYIrPplBLlRUtUn/yDozrFybdqRuPzXADGHJwRHcWzKFOxYqYQxR0EpqcDGSm0qr7K9CmKOuS2579OiTWdQPGJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(12006099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?woRkvtUDs3Nps6QaP2qqx7SbrSQFuqHTE6akZiTu0FgZVoJZUZDjOtfrDKM8?=
 =?us-ascii?Q?7Mk36WpJf80pZ+MURU4Bd3IHe67pq8qxNIubyixaBtYo/Mxcnb9SV390lCYw?=
 =?us-ascii?Q?vM2eWYUmLw7LtESgLSpTx/nA9Zh+CTtbCTwdwxsCyyGiA8BYJynXvFNzbA5P?=
 =?us-ascii?Q?bBIdupwa2PY+xyWu5/I3B1WfJN92fvz6pFfKFyNJnl0cVFioXQlXXvYpOzFw?=
 =?us-ascii?Q?Sc532ZKWWL2fvXWhx6JWeVoP27bVyFomlX029dvLY7C2lIjM8WWZDehnE0DX?=
 =?us-ascii?Q?1pAMuNdO+4Xwn1ZwZ6EhmFuQsIxlFkSO7bxfzQcA6l5xlnIoQoNydfEeH1U0?=
 =?us-ascii?Q?LFje8P5oplmFEBD7uWGmAWqZley/xl/hvxCeLfdHAj/ToEfnbf8zIXsKR8yQ?=
 =?us-ascii?Q?d/6ZqccF1MvgdoBHsgy9hzzGwt07maQFnJRG3vJ/U3mHXWneuzyuCOn6lHK3?=
 =?us-ascii?Q?Nd0/wBWTjIcqhhzlbwA/hfTPGKA58ILxurM80c7DbhYiSuEB8ZpmFPGKWlqL?=
 =?us-ascii?Q?GAunKqOY9sPweYx7KgDF6IaVkpZJTf13bxoJijkHRNs/RRrAcBzO1aPnxg1M?=
 =?us-ascii?Q?gHz1F8h7TwvOJVZ7Fh+JixEj5eDRHFzkyoK3g4U+2/uOYHHnDGVzkue9kCtJ?=
 =?us-ascii?Q?VXlsvxE18zhXWaNGYle1JsXj7KSuvuwHafDdcJn6ihJfAqGKeIqWoDJK4VhZ?=
 =?us-ascii?Q?SqUyxlicHJcZE2bg+/6TywPwdDd6soNrJRa2bkHzl1wfpZ6aymqVXa78QW8n?=
 =?us-ascii?Q?YcRvrh353igMNCTxVzOUM7SRZf8ninClQ+AVzNI6uKZiYIwlIdgmXE8E6Fg2?=
 =?us-ascii?Q?FhibprsJ/7zEiJrpBwIB5U3Chquka+z+hrMzLAliA5BxzCn/JgRtvkF4n4em?=
 =?us-ascii?Q?5x7DUOcTcz0TkXiPeJYmS7SDyX117/kMInkJWqc/RC6uDW5v89C2yfqnQ14l?=
 =?us-ascii?Q?pJYDTOfVidBveuxbhVDNoZAlHQ965aZw885YEDR1heu3uR5YW2JoZtDVH+jj?=
 =?us-ascii?Q?qDpcS/Yg6W46v6oD8D4U25lqYsxnzpNCcYyhaO9mqIClYWY2FgLYKg9hcE2S?=
 =?us-ascii?Q?JPlexCgYdbZXD6HLxYKh8iHqZhqZMNmYmEIw7LlrsIsJ6miWHYu2dSn0L6VW?=
 =?us-ascii?Q?HBbwrb3PR6f6HYBVXEqZ1ed/cBQ6+wnY6wp58Aq3NB1eLbzBjKK1FhunbGdS?=
 =?us-ascii?Q?pzf95i7cK9+v6tQpl/A+nPpfpvsvBLwvHmFNtvjOz8b24YT5OVLtKmM7QapZ?=
 =?us-ascii?Q?3vXbqoei4JGovU7SnHyk5eFBjqIbU8G58yyl7RWYjScKpTjKOmfbFEQyikiX?=
 =?us-ascii?Q?ClyktCYFDHZJR9/744HI0ZPNOInhvR953wLikV0EuPPxmUMx6VFnMbPkBgSX?=
 =?us-ascii?Q?VGo0OWZPK6TEqfn5Bex/1cixG4B6LCsmNo2SPUJFsQ3MoT48YQ/CwfJosrK0?=
 =?us-ascii?Q?tTYLm91CVs5PQfmfAWrHX1JXrhYofIrsaobVSmAQJ6irsJbCprVs3KX8N27z?=
 =?us-ascii?Q?YoS3nDP5LpltPCh/e4waj/dJYFvM0V54Ea3b+aDTEOdN9Uf1sFCxihZJhbwx?=
 =?us-ascii?Q?enCl5aIAofF+IVwJkpHxQWw0UWLnGPwwySLqQ0XTHcjVa2q2EJXHWw4xUVQP?=
 =?us-ascii?Q?mVwn7yvfxngwAPrKhd3mBWVJaQ+kEOAXxMHd6PkmrRAlbplhvYzApdezsuW6?=
 =?us-ascii?Q?0UbS34SvaDgjwICLj0Hin6ceLfnFhqmylVCcBIIGJ8wLbVMHbPjK3ZjyHlUx?=
 =?us-ascii?Q?kaarhI2Vxg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d742a4-0b56-457a-1d75-08df38cbf060
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 10:27:47.3631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cE7BOXE56stwarMgKtLQQDeXzzBmyFog+FID68pY1jiZSL/6+o7ocUassi9tgiO4ez5pDxWXIutbf/9+IBSj0mhVJVpsYTmxh3upCmlXu6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1991
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 10:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249198
Content-Type: text/plain; charset="utf-8"

git log --oneline v34.2..v34.3
8f674de (HEAD, tag: v34.3) kmod 34.3
516a390 (origin/kmod-34.y) ci: Fix alpine setup
b41275b shared: util.c: fix buffer overflow in alias_normalize()
043f708 util: Use const variable type in mkdir_parents
e695de6 libkmod: fix type confusion in kmod_module_get_sections() error pat=
h
2742f1c man/modprobe.8: document --show-exports
f019fc7 man/modprobe.8: document --remove-holders
4e4b844 libkmod: Fix open file which some char device
f0fce2f scripts/sanitizer-env.sh: remove incorrect $CC quotes
5c69143 testsuite: fix dirty rootfs error message
4692b8b man/modprobe.8: use MODULE_DIRECTORY as applicable
6b93232 tools/modprobe: Fix odd --remove-holders behavior
180335d libkmod: return ENOMEM when strbuf_pushchar(s) fails
6047d8b libkmod: Fix dependency count in kmod_module_parse_depline()
95275d2 tools/rmmod: fix garbled error message

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-kernel/kmod/{kmod_34.2.bb =3D> kmod_34.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/kmod/{kmod_34.2.bb =3D> kmod_34.3.bb} (97%)

diff --git a/meta/recipes-kernel/kmod/kmod_34.2.bb b/meta/recipes-kernel/km=
od/kmod_34.3.bb
similarity index 97%
rename from meta/recipes-kernel/kmod/kmod_34.2.bb
rename to meta/recipes-kernel/kmod/kmod_34.3.bb
index 892468a87e4..435ab4f47cd 100644
--- a/meta/recipes-kernel/kmod/kmod_34.2.bb
+++ b/meta/recipes-kernel/kmod/kmod_34.3.bb
@@ -18,7 +18,7 @@ inherit bash-completion gtk-doc manpages meson pkgconfig =
update-alternatives
 SRC_URI =3D "https://www.kernel.org/pub/linux/utils/kernel/${BPN}/${BP}.ta=
r.xz \
            file://depmod-search.conf \
            "
-SRC_URI[sha256sum] =3D "5a5d5073070cc7e0c7a7a3c6ec2a0e1780850c8b47b3e38922=
26b93ffcb9cb54"
+SRC_URI[sha256sum] =3D "985554de49c21a58abd68c6cda2251384e1e5bb08b3b14c7f0=
2b51f4c90c2958"
=20
 EXTRA_OEMESON +=3D "\
     -Ddistconfdir=3D${nonarch_base_libdir} \
