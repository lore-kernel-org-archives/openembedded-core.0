Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31808.1793876991549491014
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:09:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Gq7BY/tD;
 spf=pass (domain: est.tech, ip: 52.101.69.36, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWkgZmgh7tPaYdqGh/TW9j2f8YC4TR+QxUiSjMqg3EIN56A/TdPVvRqsn56ghSnTTgurb/tNpVvB6j5lB6yksBcsd4HkCjmB1tQVPZYMssp2EyCuBbq24KzipVcv5Xydtn2liNQblpi/6bFDMBX4SBKO3RsUjEbYhmg3rK+lzQPRtLVFvBaej976t27W04HZz0+fiFGpBSKAfLdQiX1N5pz4EQ0SLlmU+PeaMK7pq8XcZVjAkAVSl3YErAoTgSJsXGOc9pMdEIqFPNyUx46+sgdP9lohGUKNF9TqnB11t6zE4Rd8ab7tPAdI7W2kqrQWgHvOF3smNGPugUOvWRej3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfwcHX3jzcE7lPj6snWomSeSUPvgeFSp2iQa6pXjZOQ=;
 b=Gmv6m17E8RyVfTSXozJ2fgL4cTTPUXR0pdpVtdJZWkr6hKo02/A7MMfoFj9Tn7VvrzH+7mMCqNOmKkY2iuD67GKoaHWke+zNAv0rCJq1FNtzNqtBs6A/H9odjZjDys3dncSOK0Ntqou4vFwxOvt5oQdWWwgv/abNsr015Ox/Kc0H+ueNn+VGr0OysdVubmsm0a5jJ0g1ApNFg8suGrMWEG7a+Yqc/AWIkZy7dhIqMWRKS+WKJ2kKl75M2kjXzDIHwbLdk2wXuHzLUCJtxjRuSAlPzzZ2Q92vb+M+d5/c1mybgyNZk5iE0xC2LZvBO9blhyvxvQFwrKvRs3xtHMDSYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfwcHX3jzcE7lPj6snWomSeSUPvgeFSp2iQa6pXjZOQ=;
 b=Gq7BY/tDgQE2SCRP4XdA/S5B1sPHh57MCZpxTfvcInmBh75eZN8RwsBhQafgvQB1uC3xpqqKesihhHvEJMXA4zrYgVlpDFJjasoEq3sw5/7as2kHf40H9o79I+arIYFWfM1nZ3KrrwBxEsdzeofzVfhxMVPbo8W34b+FtACvYTo9MDJnwRGQ02DkNMlDM5uhREXfDvLC/9VGTYdrvo0Nq9PinZnE+mbSY5eyPIlOI36j0Tcx4lPlw56iBdTBKAsYIX+rYcACN3kwafhep2YCBmOy8Z2gyLcNzct5bnzQXbeqXxREHufwsT/qLId5zg/KTpzc/a7rYxnXHGnndoLhYQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2747.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1f0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 11:09:45 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 11:09:44 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 07/10] systemd-tools-native: reduce dependencies, add comments
Date: Thu,  5 Nov 2026 12:09:27 +0100
Message-ID: <20261105110930.52643-8-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261105110930.52643-1-jaipaul.cheernam@est.tech>
References: <20261027110126.9383-1-jaipaul.cheernam@est.tech>
 <20261105110930.52643-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZP191CA0022.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f9::26) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2747:EE_
X-MS-Office365-Filtering-Correlation-Id: dce5ca80-19c4-4023-a1ac-08df3b2d4c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|11063799006|260925022911599003|260925021311599003|260925021911599003|4143699003|56012099006|261022075727099003|261021121427099003|261021123027099003|261022105027099003|261009223027099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: /byGBTDhxlB0Zhs+eVpdhUltccGQDMu0zFMQIYBKTfyhtHcwKoSmbKXDXdZDd87cR588xEitNp9jRN7opnZhfbdtt8I6BzMvUhbQkWQPStaGncY7oCVawBccxACVLR77YxjtrF8c0jjBRBp1DOxQAcR3sumNskao6tQx8vOrWeIzZGf7bufiy4WWcNODsMir8Wit0hSpKu6Q/3B00xxVkqIlPn+7wYklhGcKq2y2F4GfOlO4mXMsND4j7oTXGeLT2jDdDDTASax+kfyphXlr7Zg+t0mOMtIrZOZDacGib7SQ/8RWq87gikzKl/VKzjlZ/cjm5R91wTr7jMHe6bhW89RclOdbR510F4XIBGUXbglCAoGkaX1eywmFWwxuiTsm0YooYwqRfyh403b+kyVyVPwcg0kouk/ItpXu4qzfyNVrzVNm8d8FWxXxKF+cUziv51WnSbOSbl9wSNRm1WIUK/gm7ZACJTfP8SvjjHTP4rYsbqu/D6WoA9/Fnr9AMFcYL16p7yHYjcpqq38+cpEh2vjmPEBDDXmdep1CgLPfNA8M8I6EeQQ/VZ7uqMCI4Z3mypdVe5t5SxYIU3uejSj4ohHnuXLKsVS0XD8k06JPzGKjcz6QiQ+ZJqAZK8EBsxvB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(11063799006)(260925022911599003)(260925021311599003)(260925021911599003)(4143699003)(56012099006)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HFpuUaY6xKNQTEYD5VGuJyMcXoLrLtUqOB8igEgiOD10ilx5F51sbhdc2SzP?=
 =?us-ascii?Q?0K4maStM7kXlTjDJmJhF0lSN2SDySFEh5qGQO6x9rlstku2ILy5RqH3NLmjk?=
 =?us-ascii?Q?cxOuDZju/q7KL0+4StkAwMGKWpt5Kw3Q3/rP27/ngJP5LKysjKuUbLzmqOaK?=
 =?us-ascii?Q?We8pk56v6+MO9xfbTgXBUkxQb9QlzBMDS7tBjY14rkkMJwgOKbe6e0nu1exc?=
 =?us-ascii?Q?nbXimRT5w4rvOx0gQFwz/wIDFkIC80ZofFVpxCSwmGbOawFqaXcs+YIKdTFz?=
 =?us-ascii?Q?KqjxNvrHPWrAo1JgFnZ1YRcitd00tOQD8sLvz9zDjDo3fgseVHQQf+HRP3We?=
 =?us-ascii?Q?xXC4iq9xB8ect5w7RgA/90HGj7MaDK+TEEVxSN4Nof9O7Kdj78fhZuF6kpSc?=
 =?us-ascii?Q?7/BNkzn5WOdIKtAVOdunAKBNzIJJ4o/OYEBIJ2ITpsF0ZTknfJSC0nYCKVs5?=
 =?us-ascii?Q?FKZFyw+SV3jpwzka4hWOzhuybm9DFEbXXv8dSxwD/Tqj5u//AN5ugrzXC9Lc?=
 =?us-ascii?Q?3ealwqF744FPCQroI2+aITYcxr4IDADxUehZ4jDWkP3+SKStP4Yji3r9WtJd?=
 =?us-ascii?Q?vd7Gse2APaxO5+pYRw87pAg2Gd5s2m/gleDhMTUcs2IYxUaJskDP0bsjyJnE?=
 =?us-ascii?Q?QZuklKyXA8haR3snMmu1MYvvIxijZy3qnRO6fFA/aBS36s22GOPf8HypbvsX?=
 =?us-ascii?Q?bZl1rmGcgExZkVaB2oBDVP82pyJ3vG7uyJD6UoAlRr/CiA3hCA2iBpH+Nwej?=
 =?us-ascii?Q?KjBEfqRq/muPO2znvZ7mOdTOvY5tzRXQk65JyFVBm9XFc8zbuJp6W/G5pyDz?=
 =?us-ascii?Q?pme3IzmSLhWqkcbEbul/i77s0BYZpOH3MJjw2ZLnkNvE5NjIF68IMlkZwvWd?=
 =?us-ascii?Q?emxomhT70aGNKzwTSGjGb0cUbbTscfvXFemwIDNTitA+iOYIWumsc20p+h/S?=
 =?us-ascii?Q?3Oq2FmSibvZEF68z85fm6GRuHCAx11kvb7ByRv9CrSD7eLiSoyvnv1KsKspc?=
 =?us-ascii?Q?bovmKx8TCioCEoDF4bDzlFh82g2d0lieDmXE4N3TYcvAfDslkfYlEUABk3b/?=
 =?us-ascii?Q?czoWmIT6GTYPp/Gam7SVgvv8vAWJukeIMqwNKeRr4KaNYY3s08Sscvil5lwN?=
 =?us-ascii?Q?FnClisqlcspBdJNLtngSWeFCIBf5R2LiIxQDvh6IIGPNgiFg3QqqGJr+3yxL?=
 =?us-ascii?Q?5AzVbgJO+IwIGCmEV+k9DwUII5woZQAozCN6sbf0S1/P6Gg8nWx4aX3aKJcq?=
 =?us-ascii?Q?g+MYazKmMXJYBLVC39DeRwZhelAD2MCYKVjvrhcOhEDiKWefEUriytE/y3dA?=
 =?us-ascii?Q?KRkRnY9SJS+0fZyWWEvom6cFmsbT7kflmXS6uyWrduQdSWYLz+rfi8QacglG?=
 =?us-ascii?Q?HVgIO7YyFI1V3u59Wjy4pITg84LGGPu5jWswimAobQ56fSC7+ExkslN0KcjO?=
 =?us-ascii?Q?ahkM7wBLE7CfNBtk585ZkvrGIxDvClMsm2M49+c3rlmQm7pgJ8fCpVsJ45z9?=
 =?us-ascii?Q?eKsVz0EPEd31pKQeE9fFixT5EA7HKe+rTlVGW7PA9reo1QOaa+hhCQYvaUgY?=
 =?us-ascii?Q?j9xs5hJVjWYsgNfXDpRBausenTyVSQJqHgf6o330/0VTLzeI6v+UgfYRjOKF?=
 =?us-ascii?Q?zy7YVSBH2KytRHkKRzt5cYN5g1Ng3ZbFEz/xzlw6Rc3+GD5WwIV+vQ0LRPPH?=
 =?us-ascii?Q?ONT3Xp3OBqzbuaUSNbIQnw7NvMnOdq3GzN/0fnX8VSKdKEpAWC4Y8UtreoFw?=
 =?us-ascii?Q?rbCD3h+zFA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: dce5ca80-19c4-4023-a1ac-08df3b2d4c19
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:09:44.7371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oo0gWW/1mOt5s745nWijMe1+VKJIyUAira6cN7rUtyaOfenrbtWlFYASXsbXW4qWHx0qKmo+ZeUOXlLOgZxZDC1Z+WpXq2rMiv43FgXglBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2747
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 11:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249534
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

Pass "--auto-features disabled" to disable all optional dependencies by
default, and remove build dependencies that are not needed.

Reorganise the recipe to make logical sense and so that the SUMMARY
isn't overwritten by systemd.inc, and add comments.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 717badf77f4a1f72d885f285a7326a485f9938fe)
Note: kept our MESON_TARGET ":executable", -Dpam=3Ddisabled and the systemd=
-sysv-install do_install
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../systemd/systemd-tools-native_259.5.bb      | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-tools-native_259.5.bb b/meta=
/recipes-core/systemd/systemd-tools-native_259.5.bb
index 5b29babdc7..89b5220e3e 100644
--- a/meta/recipes-core/systemd/systemd-tools-native_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-tools-native_259.5.bb
@@ -1,16 +1,21 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/systemd:"
=20
-SUMMARY =3D "native tools from systemd"
-
 require systemd.inc
=20
-DEPENDS =3D "gperf-native libcap-native util-linux-native python3-jinja2-n=
ative"
+SUMMARY =3D "native tools from systemd"
+
+# We don't actually need jinja to generate code, but it's checked for at c=
onfigure time
+DEPENDS =3D "gperf-native python3-jinja2-native"
=20
 inherit pkgconfig meson native
=20
-MESON_TARGET =3D "systemctl:executable"
-MESON_INSTALL_TAGS =3D "systemctl"
+# Disable everything that is auto-detected by default
+EXTRA_OEMESON +=3D "--auto-features disabled"
+
+# Link systemctl statically
 EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse"
+
+# Ensure unused build paths are not in the binary
 EXTRA_OEMESON +=3D "-Dsysvinit-path=3D -Dsysvrcnd-path=3D"
 EXTRA_OEMESON +=3D "-Dpam=3Ddisabled"
=20
@@ -19,6 +24,9 @@ EXTRA_OEMESON +=3D "-Dpam=3Ddisabled"
 # More details are here https://github.com/systemd/systemd/issues/35897#is=
suecomment-2665405887
 EXTRA_OEMESON +=3D "--sysconfdir ${sysconfdir_native}"
=20
+MESON_TARGET =3D "systemctl:executable"
+MESON_INSTALL_TAGS =3D "systemctl"
+
 do_install:append() {
 	# Install systemd-sysv-install in /usr/bin rather than /usr/lib/systemd
 	# (where it is normally installed) so systemctl can find it in $PATH.
