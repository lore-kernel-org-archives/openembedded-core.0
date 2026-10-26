Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40069.1793010707782988464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=zg4Mh5E6;
 spf=pass (domain: est.tech, ip: 52.101.69.18, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiSq/N99hwilI0jHNu1Mjk1cmUsQKK7DID81msMwLn6J6jGWN5AKGtUdGBVfy0Nm1+f41zwrVUv+OPRIRLW5wvsFZAhFvvfoIr3LtN/2+QpPHjbmI7yHGVD3gSAJq/c+s6b0UPz/Lcrhb0wWARI3AMxMqx/tRvwiMyaqJm1pAK10mSBB9Exq8AyWZQqayQvxTrvJajrNhNfz5MLHNk6S6rO4F7M6lDpPjwgRwu3Mo7JhK3Eo7JIvkpEAuKwNXA7rri8lpmPHuktbX5mCyLFtqGkHi9NIvAtY9xj4u85eLfxdnA7LzYkuvdAP5SQsXW3zVKRPdmW96it5kvJCh72lIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOARlSzzKDlyn7dGaN3jSNeousu2AKPWwOuqTenCmhE=;
 b=pMNm5adjczgsB3Xuulnnx7RNdn0Cg/q6/UdYTo9q7XmcKPLf5gblNAsTNAUiBUBfKxdZGbBRfqcMoeN++OdNk9q9aenDdzfmYZHChGGX2bnlab82PKjg03NwpY2If3ZB7z8Pr4zMkepLDM9P6PGAIuRlp56wNbYgHbNZw0bLwYO005Aa8EyW2ZbOTxOa627gZT7PB459wjvhkLEcwMLVsg7eWh4zEDaY0jjrb7BE6oSWJwAqvoyKLdsXGRGH4F5WYN/6lU1RcQwTig2JwpNo+wMVJmc+s8gct+SvF5uBA8rRl+ozUICpLFRbe8m/XW8Bkh9FreabdlPBaYLSjI6R0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOARlSzzKDlyn7dGaN3jSNeousu2AKPWwOuqTenCmhE=;
 b=zg4Mh5E6JPCDC68Cj/ziV/pPWaB5s+9N4F5c6gXECJR7F+KLhSdKsxkyn0nF+dqkJceK8J5SfHWXR92Vg2cgpcyie7izDAMM/R9+WHN8PzObY2ByX2iCmfJEp6DL6igi25Hothw9/0Ys60D2XtsuXoV6BbcQg1d00R/+8f5oYu314wPdlWeubV8dWz2kXwTjAeXfA+xbHu1odakAnbaA6AXVw3qe5KiNfAYuTh8H10pgEvJri7I1Qki0YqjF8F96XiVRWlYod/AtVHPyoy3AQDlg9mNGqfGb0yRQMq4HjygMts7BYOVw2QTiJXnB4GOE8hxjSHAI50AV9Ki5S9I4UA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2020.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3a4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:31:42 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:31:41 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/12] libsoup: upgrade 3.8.0 -> 3.8.1
Date: Mon, 26 Oct 2026 11:31:27 +0100
Message-ID: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2020:EE_
X-MS-Office365-Filtering-Correlation-Id: 764b2bb6-fe4a-4220-3424-08df334c52ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|56012099006|11063799006|261021123027099003|10067099003|261021121427099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: MHM9wPhgjrgbFEOE4R3ET4/LHeFXfsKus4Sk9zfw5ycZXtAtcc9xkigDSTplPGEhgtkNJosg1nUm9YNFVSmiimSYg6+eF50eJ5dhO7m69zibEEYUmJd/obfYs/ZMiV8aPJghW7UOptZWJ9hqjmvuH0QybpJkbZGQWN1cZfb56a547p7cgmi3QhThZ9DgSvXtXCG0Jp1ZVWD4zC6ZR4CPoZr8MBcUzgfKHds3L2YvCdYfhNKmg/sUKcSuTq4Ov/bez/5aQonQkcJFyluylAlJHB1jdWgiQnzpwCTsD9Ir6Ty0o+w41Z7l4UGTi6gi9Qt5yB+Hfifn8l+xQ2orROZmEIwEt2/VtqV2Md2siHc9AD9xR/xysS3waMLbyg8IIBe9NQygDFiwxW18Tp5KHQLiMNa/+T8ZoGmLqZKAAtOnWz+Mb1ccaryrAKqCMs0RXSrrI+towQRrcyw2XT9tZnsMOYusr5JIy00NUSxR02bLbNbJEuKVZBcFVTBAdL3hyn+Q/qFYErFN5QvxpAoztLkp2JAzeTaQesISikjKOQnZD9hQzqsajgiP5/wN8xf6nZ1zQRNaJ1AB/3RYsf3CRndWIIYNAEgWSDEpkxl6/FbC5pVEoULeXq8NRiaNHWj6N8/bk539WqhlbAnyL7jllI1zA7r+w7sx8yhAXPO747CGs+k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(56012099006)(11063799006)(261021123027099003)(10067099003)(261021121427099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i8scGDz0OtWbBfGRXWmj/FcJvAeX2XMeYYpEyXBCPGtViwDt6AZpWzEGTbh8?=
 =?us-ascii?Q?MwevX2PQEJuwc50+ZtYD68+awVHXsj5Q27MoH8Vj0JANAT81b5AIDBvFraMk?=
 =?us-ascii?Q?MsUJthbvM6ygS01PqcZu+Kn7eqxu4kqH7LVH1t8FNdGHxaKIoE9DNI1XNH4w?=
 =?us-ascii?Q?+Rn87QLMt0nMvy0dX24qRqjtxa8s22Ypfbo+91MbVAgg6xi8uHWbMtnbgP5F?=
 =?us-ascii?Q?rOExmzwKPlaWmr2juzgpV7b4ox0JhxQaBmki/fHg6yR0QeVc9hA9Pcf0Mg6h?=
 =?us-ascii?Q?CEFZpGIoxStgAPi+U32vIkwCagNn8WkyPDlxSywfOSTJ5vyAQ/PtaLJ3QV7I?=
 =?us-ascii?Q?6UpGYwDBQ4grHPXvNquzIvNyL5ZyHt5vUAGtnorGetFzju9/m9c6Ma3Jj+qI?=
 =?us-ascii?Q?RW0LwjwAt1cobLX6tVD2XLmRN5f7Ldai57lVWU8P1tcDH67kaaRchFlgxV8F?=
 =?us-ascii?Q?anu+hXa3CRL7ooXa7P1svYJagenJq5Hwq/6VSWEsO9VC7wRYy78hhz4x8xz6?=
 =?us-ascii?Q?bgceeukYvX/M/dF/2GGgCXxbL91nVb61IXC+4iCXOVYYjaXUhbSNz3E523iV?=
 =?us-ascii?Q?JOwg8lJAUIbfWJExffvx216mZvpumd1LqQiDVbjyRXVPu0iKFOZkRdkUEv+c?=
 =?us-ascii?Q?F8damXnoS6D5SkhSceVi+p7YxATW3CYZKdnyVSt2kq+BOWIHbpX5nPjS4mtg?=
 =?us-ascii?Q?De09xlBuz7jgYZuz4CobhXWZai19wEjTuX4kwLeOCNYyGGqtkUlVmBpIjG0d?=
 =?us-ascii?Q?QaSgVKiFAEtRsRZHptbbNC4i21TDs1PktHUgK58C5O7NEDndM/dl+dcpKUI6?=
 =?us-ascii?Q?ZYGkivOIIgzEQrqA3icnI3EHe+KZO5+RP5l1v0UX4kAaM+00b4N0fYUHbTS6?=
 =?us-ascii?Q?kikb8eSw7xJDcsuNk7XOGCSF7Bu16clnK7cDWHb61cudq5OlQtpHR/arl/ZT?=
 =?us-ascii?Q?UITvTJhgIA7fDbR4v0UAQbjX9qpkSSZjTNHlMRr3PPMfQP3GUnoiHuDN5IyZ?=
 =?us-ascii?Q?kf5P4TAKs8U88CqWPLxe4LRdjoRHbn1iMTlyY7K0TffGEl6JLsp484NNpvam?=
 =?us-ascii?Q?gmrovODPENyLpNP7oxq7tjbl4Av2Yxkee+IiJXAJAlRpvV8305mVrXNDr7YQ?=
 =?us-ascii?Q?OabohWApX3kDHglgpTlc+bEMPZr182dtkDPZoMRKVdR9QawHI4uuhbwlqVIh?=
 =?us-ascii?Q?CS/rCl+6pc4pZpyC5n+gOLmVlG480aHY2g1uNgToOtfrty7uuQKB1VPpBKkM?=
 =?us-ascii?Q?BLwjkE0vJc2FoC63apaBVfNfWgtML19nptdKUMjkBeD9feK8zZU8JIep5wZ5?=
 =?us-ascii?Q?2UYX+S3IH7rAFKs4XuoMcaV/+Zbbo2pSn3+jcvsckqBuPjZ18eFe5xn39rUc?=
 =?us-ascii?Q?CC7Tv93wNnMGpTbYZXscyPT4VhpNZMw4c5CDjxPieb+70E4vCMeRIALcTnpt?=
 =?us-ascii?Q?rJLNz+3JXqZN9ADLCqFik98LLI32YeWpC9iiJDRCBGZFbKCDCYRk6FzcZRlX?=
 =?us-ascii?Q?dFrlXxx6YmDeaRbLyvcAgw2Dw19NXJEEqp7/gSgPuAIvmsOUsscoA10dE/vZ?=
 =?us-ascii?Q?WwhhtOf72Oa5iVhDZ/GhAXVxZOBuTGEZItqe406U6dH8xA6+7/GwjRCo+9jA?=
 =?us-ascii?Q?p0HG4YZENzNcTBZdGZ293969HaJtI1mUVzoj/qt1AImzjY/tgThHBzQXCSow?=
 =?us-ascii?Q?d/laxitlQjYgn9IZ5vTfwv70s6F5l1GdCbWpq38W5J/6VorUM1Gem3QTR3kU?=
 =?us-ascii?Q?IyqL39VhDg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 764b2bb6-fe4a-4220-3424-08df334c52ad
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:31:40.9843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+wYJmfWw6Bj35E8X8jA2H8SfGs6EMiKe2osykjHQ5wnpYgZRl9gdMBlTgt3hk04r6NPBWYiAZh6822m+UjMh7+S/xxRc42Z9oFwQyrFzN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 10:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248660
Content-Type: text/plain; charset="utf-8"

NEWS: https://github.com/GNOME/libsoup/blob/3.8.1/NEWS

Changes in libsoup from 3.8.0 to 3.8.1:

* Limit the size of intermediate (redirect and auth) response bodies [Milan=
 Crha]
* http2: Fix stalls when the reader is slower than the session timeout, and=
 propagate connection errors to response body streams [Patrick Griffis]
* zstd: Support multiple concatenated frames, which previously truncated re=
sponses [Patrick Griffis]
* cookie-jar: Fix a `SoupConnection` leak when using an HTTP proxy [Safeer]
* logger: Fix undefined behavior found by UBSan [Patrick Griffis]
* build: Require brotli >=3D 1.1.0 for brotli support [Chun-wei Fan]
* Fix building the tests on Windows and update README.msvc [Chun-wei Fan]
* Update Romanian translation [Antonio Marin]

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libsoup/{libsoup_3.8.0.bb =3D> libsoup_3.8.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.8.0.bb =3D> libsoup_3.8.1.b=
b} (97%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.8.0.bb b/meta/recipes-s=
upport/libsoup/libsoup_3.8.1.bb
similarity index 97%
rename from meta/recipes-support/libsoup/libsoup_3.8.0.bb
rename to meta/recipes-support/libsoup/libsoup_3.8.1.bb
index 1ca40423f00..3d20b09e5c6 100644
--- a/meta/recipes-support/libsoup/libsoup_3.8.0.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.8.1.bb
@@ -11,7 +11,7 @@ DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 sqlite3 lib=
psl nghttp2"
=20
 inherit gettext gnomebase upstream-version-is-even gobject-introspection g=
i-docgen vala ptest-gnome
=20
-SRC_URI[archive.sha256sum] =3D "bbf08fa3e03a88c31a3d27a0d87cb422e9490f2d08=
e149211103df6d638a2238"
+SRC_URI[archive.sha256sum] =3D "5013dcef9136f6f861e6529fca578af50c1f52a392=
19027fb5aff652d1371a04"
=20
 SRC_URI +=3D "file://run-ptest"
=20
