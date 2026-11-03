Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7216.1793698094554339183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Owt2e325;
 spf=pass (domain: est.tech, ip: 52.101.72.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XrtjAPsz/xEq1keqHX0+PuJ6hDYrPA7M3IqFG48h086i381OaCqYzSteNGZwRitpY9yS/VFgTukbwmRpsYQZyPJXLjEH25EBD3R0PDhxShiB/XDv5xBOCsm3u/p2TvADBrakwj+/vsvlAajsUlLUeEbNxFGJKxNsGcpgESrhxGdi/nEgYQmlLNlDSxL1rQF7/WrGiaFrD5rdmZ+BMJx1Tgi5SlJ/5z8p9RQnjeIzFIu+4eUJoUhThhDBT4cchT7Qs29qzyOUn3mnLAHi7PGaHLtRmWyyBln32UoAV+jwKSZV88aO8ISI4vtVb/jc897WpKPV8f9OCcXgh78rzmqZDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wC8vRyG6VmuofRZRlsLEtOKJpJTWBkdp/FFh2G0uLZc=;
 b=i0c/Ol4Os/M60N967pQil+amBHp98N9rSU0xQRMKXVxLnfb8yeOPwlxNY4EAHeEw/XbkKe+slP+nF7HlGOJT1Q0hmDri/VXRW7pozpApXo5h0nuQybh0poNZifkK9Xa/DnS5NRtqB9+yp+eIMrDQru9pbQ+l22UOGGdyoXq8/Y2wYJ6phsHd5od9Jnt9nY7TRQc0EJNe66XpAfDm2hjvCGE2dPIbtDoGAhxp0UQ2zLAN1Uf5P3TZUcoZJr0S7I92GVF8s6Tg0DxCfD+Pc6FzEipP/wD7pcUfE6mviEvYuOHSqAAC19dqRYMDFdfjzEhesP/XvE/yWSYBtV8zTikU/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wC8vRyG6VmuofRZRlsLEtOKJpJTWBkdp/FFh2G0uLZc=;
 b=Owt2e3252MVtqeLm67PhFOilSQMqnYT08dr30k+xlfsZ88ZRWQC9Anxxw9Uh7UfV34V4q34zAO6m7HQwJWBBh8z6TyQBo2T9JaJOCyVAgJvqPpOjX2Tq0CoihBmmCbZcFfPYDA5ww5tuy5T8rdkbBp/vIJixxcDD7c/dHHD3WK5a5F6jqnFKbgWBBDzL/+af8O2QEWQXLc0XKT4pEPvYZCdNahKI/Wml0mvT6iMXy1GNNSh2CwM8EK/ZWrJ6dquC343Q7YCfWTS1SP135PTQFNSSlwH0H1ug8FsD6G7ewbWIPBstDpqwRx1wEwpEdrNoY0SJNPXdB4GmOdoXj75BvA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAXP189MB1951.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:277::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 09:28:06 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 09:28:06 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/12] nghttp2: upgrade 1.70.0 -> 1.71.0
Date: Tue,  3 Nov 2026 10:27:51 +0100
Message-ID: <20261103092800.39286-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
References: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0173.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAXP189MB1951:EE_
X-MS-Office365-Filtering-Correlation-Id: 46044747-82d4-48d2-a0ec-08df398cc47d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261102123227099003|11063799006|261022075727099003|56012099006|261028144727099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003|10067099003|18002099003|22082099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: acbHd/JzjjIU18OOIrky1cSO8T/2DNi8PgYlm21qhtSWAWdLANL4y4eQkdA0UUVXLh0qsnCuYOyecxOH+RcniGR/Ovk8vHNHcrAUi+ZqASWtR3DtEH8yoLzPt9DIJQx77697AFCgKPloY1Bx8rml8eg9VJ04WofKeUcx/YFrsG+ucUB9El4EUMccgFAyTBqx/FZZQGhTBKQByp9P8QGvRu37d927j+42g6vNth9Gxay4Sm99FsEIvPks04OatTRwY7Z+cqz/+8o6FNHTBo6NXWrbjIo9/CpgpvrwWxbQxEkUV9DVnz9Z2xqxzAVQySsxYzx1RKki5uteDiyubOWQCTmXVCkqAOtwPKvZ353iEQEJUzakLkjBpVMeQtbqyL68lqsxfYzB5g9btwAWFb5sb5GWkH0fBWtwyjQpS7vKXgglt9axnzs/fienyRmWmO8D8jdeFwDLXtmD7cHIpE+BwrUDgoY0HO7BHZqMdjmh2JROwkZJlqeq7JxftT/D6YfsT8sZlkckJorGqTHR0QPiviZFpBHv0fOUG8XtDgZlK68BsqJciFDMS7m1IpinRSZDeYXWt0zuAYBxMa3WVAC+mQGBiGeFuiod5pkE6wfgUdbrZHlzF4BipaExrdN3YQO/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261102123227099003)(11063799006)(261022075727099003)(56012099006)(261028144727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z7KSbM+SzLoA/wMmc0Ca1e30gQnC5y9DBo+JPGI6eL2Fcig2Hf3Qi6K3MqcX?=
 =?us-ascii?Q?joHOzPMmyQLepHLVmaJ7oeu5yXB384K+op7FFjKYV7TBuKdHcNgc7zaTLhbr?=
 =?us-ascii?Q?PssCzPK7ykCPjiHecAimWGZl88EFZhqEMu4GL/bg7N7hcepBdB/jpaWfD8GG?=
 =?us-ascii?Q?csESJap8bqnYZ91iI1pywx366CmMpLfRVo+6K04h+X//0kvfBEzzMFKfi6RI?=
 =?us-ascii?Q?3J4LzVQHDR/zkKoOsSTLc9FPpFLsGSstOohhhJwux4B4dO++ioRHCp/Im0kf?=
 =?us-ascii?Q?Sfpbp3PKhTVtxB1Vo9tSIrgAE/y79QF/nwbQ+pW6nL491d27Llk9Hqezy5tf?=
 =?us-ascii?Q?kmvTkhNn/6+bzyIPoLThSrq4HhsBoWex5MVUnDxOWYjTuOLp61rF3SxciKXd?=
 =?us-ascii?Q?uQBoHgPHHJH9/DYAhwg9VYXFIIW7Lftztnwt8EEbtFvOtaDqUrwUVDEdHRld?=
 =?us-ascii?Q?FzxyWrV7RjNszHatZ/XGXOYyowKYVdbOwVJoDMBhQdQtGIAV++2Q3cF7SYZ0?=
 =?us-ascii?Q?odAdiIh21PgS49Dp/ONjCS2rpIQYOGxm60UcYGbWKimmhfIrMoFjC56EEbea?=
 =?us-ascii?Q?of1uRyxx0COaYAg2rVQzfCcVRBWPcOIa+UeVJbtbjCCDs7dYKSx4h0R+eTIL?=
 =?us-ascii?Q?Wm61n+1Jl3dK/iovZblqQVVVnheRz0Mg7PwzUczcw9MjFqFb2zCPHIkMZ3cR?=
 =?us-ascii?Q?bfiYBc/KwTvdgQmUSDUBQp8436gngHyZmV9wY2v9DLcbgwXk4yWxzlbUl0WU?=
 =?us-ascii?Q?kDtOBnzvPFItMcP+l1NblQNGslEtRDGo3NF/VJU+2heKJGRbzgfthKwKdO40?=
 =?us-ascii?Q?hldSchLjyQCj4YNVtAdK0JCsw+nUaiueFp9eODksyhCskSdvaEWowjEfGcuW?=
 =?us-ascii?Q?pCey1/viMZMQTxJFdAHrZ8wM40HcVai894b40wpe447HHIkhhizNKBvGdFz9?=
 =?us-ascii?Q?aMHkyOMdW8n32bsY50dfZh9iru4JMUoX2T58ngFpdViOXJsmcYcl8zDIeJMi?=
 =?us-ascii?Q?TKZCTXi5okaXvFsQjrooysCF3jYGQiYCPsWIaI0QFF4nI3nxtnrG1A9IvtOG?=
 =?us-ascii?Q?U0/IafDd071fYOjo/NjbftL0F+t49SprvkMkNemOaDov45Wtg91C/TZxn+9l?=
 =?us-ascii?Q?Ss700sMhXIF5/i23c0pQXTFExrW+7Bp2uel1F9ulj+a+t24by/6NrXLN9sYV?=
 =?us-ascii?Q?QkP84KiKeakfsHR0m5SKY1HOkfLBj2wj2XnGYvTtRAggmHyCa2sG19Qhgz45?=
 =?us-ascii?Q?xNZ5mHjB/MEUXJfJ7Kx6vFkm2szaFOj7giYrBrvdh/j9oU0x0xyZApqO+LoH?=
 =?us-ascii?Q?t93CRJlEsAVLOnMnmEv5OwWHtB89HdGjw+FG1F13CcJbZHtS8Tn7+xkOvd6l?=
 =?us-ascii?Q?xcn67y6a2jyvH/tYTIDXH37LMtF2aqj38yDWLroOL8C+8rHStpECI6/fe4xF?=
 =?us-ascii?Q?QXmSrh6dvNBiPBDhvG+a8H2JbT+hG/aeXa/sMc7XjKQ4Fjzz6+48pJ8KAP1J?=
 =?us-ascii?Q?oZQTfOpylCpY76Ebup5CyjKeKLF0hjpZpdQ5zJWeb5Z5ZNSL4eHTlg6q9G4p?=
 =?us-ascii?Q?ZJixvwNWXDJOPjFKAMXvZcVRHoDi2MUchoxLLnUjyVeAscuXeOyQGapfdN0e?=
 =?us-ascii?Q?n8OVTuZRpfuohpWFKYHfhGJEnVoUGioXG7hws2NpVfjxa4nyj+4YIy9Sp5Kp?=
 =?us-ascii?Q?KlxNA+WLctyJSCrDsvSTG8EgdCNKfkP9iFO4eK2QQ+M5pA2d4MH27Q6wikqx?=
 =?us-ascii?Q?M/2mbh9LDw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 46044747-82d4-48d2-a0ec-08df398cc47d
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:28:06.6712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OimwCpuPMulaNtcU7/uJUX3vkT+YDqke7ytE5La4NaKq3HkoMm5SGMPy5nhE7/hBSnV2ufrtHDAi2zuu/60yh8C1O1kD0uV53PgubwzjKlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1951
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249255
Content-Type: text/plain; charset="utf-8"

Update bash_completion
Update manual pages
Bump package and library versions
Update AUTHORS
Bump ngtcp2 and nghttp3
GHA: Remove macos-15
Remove public server text
Update window upfront
Update remote window upfront when DATA is sent
Increase recv window when DATA frame header is received
Bump deps
Fix docker build
Bump wolfssl to v5.9.4-stable
Bump aws-lc to v5.12.0
Bump boringssl
Bump libbpf to v1.8.0
Simplify map insertion
Fix priority update
Simplify map insertion
build(deps): bump github.com/quic-go/quic-go from 0.64.0 to 0.64.1
Remove LICENSE file
Add oss-scanner files
Better map hasher
build(deps): bump github.com/quic-go/quic-go from 0.64.0 to 0.64.1
nghttp2_nv_array_copy: Detect size_t overflow
Update doc
Fix signed integer overflow in nghttp2_session_get_stream_local_window_size
Deal with too large window size when consuming data
build(deps): bump github.com/quic-go/quic-go from 0.63.0 to 0.64.0
GHA: Use aws-lc instead of openssl for macos build
build(deps): bump golang.org/x/net from 0.59.0 to 0.61.0
Update doc
bpf: Avoid verifier instruction limits
nghttpx: Fix the bug that GSO on QUIC connection is disabled
Update GitHub funding configuration
build(deps): bump github.com/quic-go/quic-go from 0.62.0 to 0.63.0
build(deps): bump golang.org/x/net from 0.58.0 to 0.59.0
GHA: Reduce cmake and macos jobs
GHA: Remove cygwin build because it stopped functioning
GHA: Reduce openssl1 jobs
GHA: Use packaged OpenSSL
Bump ubuntu
Bump ubuntu to 26.04 for android Dockerfile
GHA: Bump ubuntu to 26.04
GHA: Bump clang to 21
Bump neverbleed
nghttpx: Remove server push
Bump clang-format to 21
lib: Disallow HEADERS and PUSH_PROMISE in CONNECT stream
nghttpx: Rewrite CertLookupTree based on RFC 9525 rules
nghttpx: Client TLS certificate validation based on RFC 9525
nghttpx: Refactor Router
build(deps): bump github.com/quic-go/quic-go from 0.61.0 to 0.62.0
Bump go to 1.26
Munit cxx assertions
src: Use munit C++ assertions
tests: Bump munit
GHA: Use g++-15
Gha bump ubuntu
GHA: Disable examples with aws-lc as well
GHA: Bump ubuntu to 26.04
build(deps): bump golang.org/x/net from 0.57.0 to 0.58.0
nghttpx: Check QUIC version
Add length check for CONTINUATION
util: add <fstream> include
build(deps): bump actions/stale from 10 to 11
Revert "Take into account idle streams"
Add option to limit the maximum outbound queue size
Take into account idle streams
build(deps): bump actions/stale from 10 to 11
Bump package version

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../nghttp2/{nghttp2_1.70.0.bb =3D> nghttp2_1.71.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.70.0.bb =3D> nghttp2_1.71.0=
.bb} (84%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb b/meta/recipes-=
support/nghttp2/nghttp2_1.71.0.bb
similarity index 84%
rename from meta/recipes-support/nghttp2/nghttp2_1.70.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.71.0.bb
index 1b09f91ce6..214545ab81 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.71.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D764abdf30b2eadd3=
7ce47dcbce0ea1ec"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
=20
-SRC_URI[sha256sum] =3D "e05cb1388eaca3830aded4ccf20044b6e1ac1a61411dcca11b=
0437c4285c8bc2"
+SRC_URI[sha256sum] =3D "c0f55121d88650e4b9227aec28cebaf664d2417ca60fe70be0=
f8d38829f52116"
=20
 inherit cmake manpages python3native github-releases
=20
