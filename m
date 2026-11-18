Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7167.1794983663812211637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 22:34:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=VpoYFnGe;
 spf=pass (domain: est.tech, ip: 52.101.72.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhjF7ebjlm15t7K5FAO7AL02I50sRZt6VfdDiEmvOh2BOF3ilpTJjb1nVwyvch75kDj5NVoZO9QIOW5+Q9MIVrAFV0TuTFGTnlH9n+QmQHWM2TYK6Hmaq+clNrDelwMmEWgNdQdoCTf8xe3ecJbLvk/RJ5CtoEPRUrlmDR5JVXpe4dF/M878oFiTBvEwyOCupqMnKaUhgCD448NhoxfxVsqu/0k/xTwwP5y9WyDN7rhsUCIizEuJnssdFBs00khbXsjmYrRcmKo1ssJYc9+l10WsC/5WFiOikyiu6oz05fM0eogqqQr9O0sMpBxJqDqF8COU44lYJRtBApOSsoFoaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=384I5z3a3q5XZL7J4bXHsR3mADAd1kan+4SYqDo7yhc=;
 b=nRvJ6CttS1TUkLUXGmGWe3siGThTXzOQccUlgZQDd0uC+xTi08cvTEbmYNpD3yl5ig2/o5M1FSR1CP83szZ41F8IouYKnxq+nOs+QaMW49cXtrr0KyiFmkCch77jvNMjpHzJhfcHNypk96BAeuNpFRQo9T6YRPLO5HYi48HpmF13q3n2w7HU0laKI7PweEb++3gSLoX9ft8DC4EtaAgb7FhhnuxIRv2zBD7f2/3mKDCPXNsARE0DzdIxkbseIWH4GnpW4geCUHu2NSCmwFBYfp7uBqKiYUq89CFZreQiWwfFMBqP9jQ9zYq9H+m2hMd488/CLQ/NE6LPQkJJ+xg6tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=384I5z3a3q5XZL7J4bXHsR3mADAd1kan+4SYqDo7yhc=;
 b=VpoYFnGeRfVF95y3U7JMz+zlFMwsOpa+Rj4lrOY1i+s5nn3b+xdau9fpJKDPjv+FabZYXfSqeOwOcQzegwl9cc4ZMec66nVx2jlsXDk7/Z2EDIvNnTfpg82J7RRy1Fjp5PX6vjEhNQUSW3sKjqrOufVZwrggoDXQ+P5W01vmkSo1MRII2QMUTKTZB0ZWLBizbw0Y+6cNJsGBZoYbGzbh/mnuNdsW8wew/5G0AB0iWzHekWaWQYIA5inus9yrw4epn+sC7KCj18uwsEKyyrsfhsW9y/jDzGVBmzOyuFm//bLN9lGOTZt05c1QsdkWQFiTDNEdXWyH7M6CSTjErQixkA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2606.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 06:34:22 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 06:34:22 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] gstreamer1.0-plugins-rs: drop S override and fix LIC_FILES_CHKSUM paths
Date: Wed, 18 Nov 2026 07:34:15 +0100
Message-ID: <20261118063416.18496-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261118063416.18496-1-jaipaul.cheernam@est.tech>
References: <20261118063416.18496-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3P280CA0088.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2606:EE_
X-MS-Office365-Filtering-Correlation-Id: eec7c5e4-bee6-419d-225e-08df453dfb6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|22082099003|6133799003|18002099003|11063799006|56012099006|10067099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|261102123227099003|261021123027099003|261009223027099003|261009223327099003|261009221227099003|261009220027099003|261009221727099003;
X-Microsoft-Antispam-Message-Info: C5rpTfPUT3kvuKYGsRQi5twYTLvUX47S47Qysd0pDWEYusa6B+uNzQCYEj6H9dMzS7PcJPnQdfM4NksP+U96jtODUCeyiReptQMXvFA0Lw6V6y0l/xHm739XCjjWeAYn/g49Ep9gMohrXAeJB8OtF6GKRW9FOrPO6I5a4BTj61FP1k0f3upoJBCCy3YAUXA8PyR3LM+nAleRnOFPOFjmD6fMoBZnIqQPzl4gxzcs0kq7uD9/lUgCKUWCnUNQva2/3PFwFvVk78wJD4PxlEI1vaiO+QuCJu8XFqBxs1BuG4YZFUP4PHS8ASnRvdVE1UGMGE7KVD7hIb58TntBg8K9XpHBVipH+5O+MIEA5HNbBJoNrhpz5OWILv8qANJbPJwOZrR82HJ2Ph4YN0oYC4zoXy0s/P3JQYjV8MWpmkze3fb1RWsdQF9zXgXIhbGYZ6CVWDWPbZaCwpoQE4cbJHTK+fTpSLXUEqrmgVLKr7ikCqpOsWNdcOZ9whl/rrgQ2tRUpHL1y8z6sCKXdvtjhptGPZp2g6A06rpY7tIfy4xQss00MUt+2yDEYdjPZNdLay73lfytyXYp3N2A8+nG6V303OlBirrubSJ/ijGpQC/YanaYAQ7WmBTqe6Poe+nQfXhnZAJbfvi6obE6jo4+LDdbJNgkr+NSG02QONUpBXeIdco=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(6133799003)(18002099003)(11063799006)(56012099006)(10067099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261021123027099003)(261009223027099003)(261009223327099003)(261009221227099003)(261009220027099003)(261009221727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OUtF5ddJyG62bxFYVxy3w5KR5tfLF7n7G0cZyX9PYfJGuqiYwt4xn7VA8DEO?=
 =?us-ascii?Q?dMzPqhMnYiXnPh/yCKQa97SqnrFeH77MH5SBUGYOBNaZvmknprArla67nZiB?=
 =?us-ascii?Q?ICRUJUWsVp3MG4r+RNBdbfR6Ipf4qr9Bw7s4lx4lcujCm3zX0lcnZ4qEvVyM?=
 =?us-ascii?Q?qD+WsklXzlg/XV0De1YcfiP0QA60hzVEk6i/kWJ8IuQ8qziRkcZ6/wykUGt4?=
 =?us-ascii?Q?53T4wlx2bgMcNo/syexpV19+y0HHJPldH58mGDRsDDh5RtjGam3dKy1vYhD+?=
 =?us-ascii?Q?bJuoTZGn0kzXN9+eUdDAWmLBxGyNYR9ndVPAcCD+3Y5LN9TffueLXS2nEpzb?=
 =?us-ascii?Q?C1xbhMXK0Btqaa2WmSNb4FAQpWb4OI8tYkMLU+YLYtVsDEt97J2MU2lXnA8e?=
 =?us-ascii?Q?EKYZZ23VEtZhA9WH5ujW4+jAhVjO3VEjkOLg7R4rCI+M55nyE2UIcN/IOKm5?=
 =?us-ascii?Q?VO406Bg6ph2FjmiayhgOr2l/tTXdCHFfGWuzEzB+puecMTfRbki77A0K7kyJ?=
 =?us-ascii?Q?PR4Ax/aIKMyaCtp7a45pDEjedRnH2e4BBjWiA8c0ADh5dona3zVvj7V8R6kg?=
 =?us-ascii?Q?vXaiMIfRdIurSlXVBeipGyXrpoZDnk4YCbta9CVfAf0KcfY/CzAuMqxnKfRO?=
 =?us-ascii?Q?9O1Rn4rYYB0O3PxLnXpRUxu9FWipNrxYRgy8qQYsanAv00C2ndz2mYT6Gcxx?=
 =?us-ascii?Q?XaSUI7x5tr6IKjtaWpOLkGg72biTz7rCgEavHR70/g0tcxrHxLcVmsEmS9qP?=
 =?us-ascii?Q?6JXvryvNFow1J+TKwFkCDIlebdLyfww+vT0J9gItl3qTuKAZ5jAbtDwAc66b?=
 =?us-ascii?Q?oOu34WSlzfrJuwN7ENPqKpslWjFV4cyPRejURHolPwXpaxa7+XS272H5e3gy?=
 =?us-ascii?Q?Sv66T0p3VGox/EMpcdI5o0VqsMbKkvD1Ecljrs/iZi0AOZtiWNWiKaZUoq7M?=
 =?us-ascii?Q?kWPxj40g9x2bxk5zb4VphUlL7XvWex45041MQbifru39gFsF3VIwcet0yPwv?=
 =?us-ascii?Q?lM9vAMv65o4CRyOACYllUZSCN8OsWpVs4Ra1+bHEgUUCALssa5QCKpTgTwvZ?=
 =?us-ascii?Q?qWNl/yk2BSc5WfzumHpRGYwPu3+NR5Qrb7ryJ3gX4cuFTiqPiS9cBYXwMOdB?=
 =?us-ascii?Q?C5kPg8p3Vy0H+eXqqs+rnKlYj8kS7ued3MlUYZcQTnMAlNRebESUr+wSz5Js?=
 =?us-ascii?Q?SYk4w6kGkYW8nBb0lilJO7JuefqsoM+fTrhkZJzv6oGut4lJJWtC4tIk/NAR?=
 =?us-ascii?Q?4oxyxlSw80BvOaeQKlYTyOvYXxIzB+8P2SiRrDjyICQg/PM+yYWdCtKCYgKg?=
 =?us-ascii?Q?E9Z5bBUV0P3mLE8ToRycOTCV6U9vG5P/wcRlZAkAd+Bpkt9XT7GdnqkEFzk9?=
 =?us-ascii?Q?tiUt0QpthVqqe/2efuXENydhzwW1xk57OynosM9ld1tNU2ep2Oy3lQIAF6Ld?=
 =?us-ascii?Q?I/ZcGdGCbcFBHohkVawqbHszdeS7W3zz22s90KBgySCPt7x5N52AGrhk1J0h?=
 =?us-ascii?Q?s6TmhcV8yeH88B8O2VMTXbRedDNCYFS9NJTRKqIIYwKhgKTOub9THXBOUsmd?=
 =?us-ascii?Q?AhHQoR7zXEDgtEZgRYguhICZVX4Swevj2qff+/vdfoU88MiXUxxVgr3hdfl/?=
 =?us-ascii?Q?sVzj2EZPVuWUlZV2b4ohg5/xKurZW3PW7/jqfbVO8cwoKcpSRjKprT4INWcj?=
 =?us-ascii?Q?fzCEt17SwL2uWhgVY32rnGmjnEnj3py+Zt6kXtQ/PnRfbNptqjR8tOpO3Hct?=
 =?us-ascii?Q?z8rJeLxmFw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: eec7c5e4-bee6-419d-225e-08df453dfb6e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 06:34:22.5265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fNywcMFAvfhKSpjDTad+MGTuzyA/L6qoDqL4UxzwUspKbzHf3hTEh0fqV9oi0/fyqVtzJ1y4NXE6BcPWMHVIFDjAAlgI0yj7oqVeGMf8rQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2606
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 06:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250517
Content-Type: text/plain; charset="utf-8"

S was set to ${UNPACKDIR}, but the sources are unpacked into
${UNPACKDIR}/${BP}. This was likely missed in previous cleanups.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb             | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15=
.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb
index 294e3373437..f16e7481dc8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb
@@ -10,8 +10,8 @@ SRCREV =3D "6302bea23b53e6461c104f9543df887a63b2d6ec"
 UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+(\.\d+)+)(\^\{\})?$"
=20
 LIC_FILES_CHKSUM =3D  " \
-    file://${BPN}-${PV}/LICENSE-MPL-2.0;md5=3D815ca599c9df247a0c7f619bab12=
3dad \
-    file://${BPN}-${PV}/LICENSE-APACHE;md5=3D1836efb2eb779966696f473ee8540=
542 \
+    file://LICENSE-MPL-2.0;md5=3D815ca599c9df247a0c7f619bab123dad \
+    file://LICENSE-APACHE;md5=3D1836efb2eb779966696f473ee8540542 \
 "
=20
 inherit cargo_c cargo-update-recipe-crates
@@ -45,8 +45,6 @@ DEPENDS =3D " \
     gtk4 \
 "
=20
-S =3D "${UNPACKDIR}"
-
 # Remove the `flavors` and `ffv1` plugins that are not actively maintained=
 in the
 # gst-plugins-rs upstream
 CARGO_MANIFEST_PATH =3D "${S}/${CARGO_SRC_DIR}/${BPN}-${PV}/Cargo.toml"
