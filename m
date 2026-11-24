Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16223.1795520674441760923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 03:44:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=F4n5rVwe;
 spf=pass (domain: est.tech, ip: 52.101.70.6, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tlRyWNaE8ytoDgio+Wc6CIxmVFCnj7XuZm2ZhLED5wOxWjNorMcccWyg4YJHWavSVXvKtem9291MSdAkWN9Guqb/SGfpM0ZfUoaggkOtKYj3lyaNfQZlAeSAJwCHOed3O5wOEelso1aa4zEXd6LIcQ3nuX8P25o5289XKd7md4tbj3bGa1d9I0B4atrS97TC1Q9pZ77C8zwtg8wkhYcjOcY0+phECKMXrmugeLG3SapGx4qtcq49cSp0WWXo07ZoFytchjgX4mTK8B3UszRle9vFFW+OY3Vp4sZiZcH8V/Z0mba/IcK0ATERV/Lqdzk8GJedI0pNBsCecf5RtIVx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j461AdSxj/dvPCsZBmLUfEI4UJ27b+YCqfwb2fgipe8=;
 b=s4WNRaSmv4HjJZ/9hvM1zpqlLk/0MBM8NPMxUewtVZ2o70RidTF2QETa0EW0rP7essaa/oCCM1G4BRm53VfBlfED+z/1yfK8EGGpeyCaS1/8pbvfVLwLg81V/qan9SV9IEXLl66SF6pcKjYTCOD6IK4p2x5WVwvopbRrunBguLpLoP+NHc3yU0giYt8pNlj+5i5HfYK4Asj2ppKESqDg2KuUa3xrRSaBsvKjCaCBeC2Ok3BqNhTeQ1NQbCbsWj0TEIraNTxs9a9YmPMHI4QGrY3XfYGQgUyMF7UespHrqlcaP4Urab7pmomJdY80Yy6ixxj+0gF+3OrX43+4CSV5nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j461AdSxj/dvPCsZBmLUfEI4UJ27b+YCqfwb2fgipe8=;
 b=F4n5rVwe/ok+1eyaf7uiwEtOkToTQ85m5tfhRBQOgCTI0lQViOqit8qXAOMVDWvG5OtFK9l+SCsYa313jjja10yMTwEY/u0T7xaQIFw4fUt9ncqvYS85W5OOn+BO+H7+JSPpXRCNoaco7ym2+zrRq+9x1OSMxEfFQbgAi8zrB9g8xdXj4H3eF7JrISxCKgnMjEBUQ9GxU1B7cZEwWIZcvSPWWnH2t5FsNCrj/WtWfE3V/Nuca4dpwaIZML3k3lx7cFw/oPWu16ckEgp+2hgfSEqCCXGcD8AVvvtJRZxsxxbeauIAcKgqqSba6imtQCXd2jIUqcHFJihKYiyuMNK30g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by ZRWP189MB886491.EURP189.PROD.OUTLOOK.COM (2603:10a6:910:400::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 11:44:33 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 11:44:33 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 2/3] gstreamer1.0-plugins-rs: drop S override and fix LIC_FILES_CHKSUM paths
Date: Tue, 24 Nov 2026 12:44:26 +0100
Message-ID: <20261124114427.70379-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261124114427.70379-1-jaipaul.cheernam@est.tech>
References: <20261124114427.70379-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0585.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|ZRWP189MB886491:EE_
X-MS-Office365-Filtering-Correlation-Id: f24cc379-ead1-4960-1d98-08df4a204ec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|261021121427099003|261026121527099003|261009220027099003|11063799006|56012099006|261021123027099003|261022105027099003|261009223327099003|261009221727099003|261009221227099003|261026140227099003|261102123227099003|261028144727099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: q9/sQxLQVO9iTBxJa7BP7jfHtS91xsSBTB4/H8JXgXJnOEOmPIG1FF8G36qFA+S+JMfAKruA1d6bp1Denb2lGnVmZsauylA46HmeFVIBCWMhbKWp50L7GstnD9TVcajVtB+qgJ3E0OG7C58c3Vri+KF4VVnyfbHpNAe1uDWK7QcKy9cgYQK0HEUZfdW4jM4H8c7AoabHPKe8qxTTtevNeYQJRQEDwk/2qPMtdmMLgBbRLYqXqSu++B7+hcDcA7VqXBgP7QPQuholJLDq+NHybcwez6l2rfnGnW4kGybPmzbJzIk2wQwKOrTDje4SIDT2J/kqB5UKvbm+GVaXHmNyb4ONvMDBCIk6XbYZ9F7oXmT89gMpEAEUlEfwKCfqlkh49CiVViVLzPlS40ytLMtEQSm04Z9or0tRbdpiknfoSu+W950rioK7eT79UcozBmY0IAsoYW5iYPD69j3XR8YtHG3Zn1pCLvVsyBdYz0uKeZcPr8iKeGB6tOxM/W6THASJ5Dp++Vct9LERJ9j/SBdpFzG4kDzFUov33KN0E9Br4GIXukVVxRrP5xnbzAK2b20TFSxuB60XSWWPhnwx/cVrtwKr5IpL/EaZ1wqKrJrMbF0fz7ls6sYSxvsaxB385Y26uIF1ILvSqZqJ21vUvlKCdfTHx+AoeiYdKYdQGzPTX1s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(261021121427099003)(261026121527099003)(261009220027099003)(11063799006)(56012099006)(261021123027099003)(261022105027099003)(261009223327099003)(261009221727099003)(261009221227099003)(261026140227099003)(261102123227099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mrc8FQ1D78R2mKi/i1kGrzyOAnneCz7KYCMn62YsBXdklvBTqpyJM9OZoYci?=
 =?us-ascii?Q?AgnT72XNGDV8VWFpIMr86mju+CtqNwgy5YQqE/JyLEJA/aGnlVwDsBRm9FOS?=
 =?us-ascii?Q?BAWBi0OUopmUbhQnEnJpKt/o39qpsaDiEFLeeI6mn54QK1DVwxCdqRosZj4i?=
 =?us-ascii?Q?obvPFyjISbscUQzRgdeUcov4tiJFtOM4R4JP5SC69Kqaj7+xS5jIjJcymlY2?=
 =?us-ascii?Q?IkY9fw4ISlZ1AR7B5j0AX3OGUDmkjKqmSQp9Lv0mgUJpwyScCVXPaTCNOTzE?=
 =?us-ascii?Q?OQIlSUHTSna72TAYh1ikHS0pnL795EJplBM+b0Qa5c/bj32Z98BX7h4PbWFs?=
 =?us-ascii?Q?sGiA6M7uQVPmV2akeqsAT/JqMWVVsiptQW5ERbSA3ilLNhAFHvYoAz+j74Zl?=
 =?us-ascii?Q?0lUXGJhlDrOj0UYjWefzvis1axQzYo8CiTvR3763+2aQwc9Qznf2LdGtO3aM?=
 =?us-ascii?Q?GeiLtVrDUbhKu7zjRk3V3H77bk4h9NScNCgxp1bT11k5W8MiBbolBGiY0ckE?=
 =?us-ascii?Q?j2opi7P79g3Ei2Gu4NvpfXVd9xoQ37womZA3xUN2ccPJMTbvKxG8kdM0RpKw?=
 =?us-ascii?Q?y6zrm2XUmQK4dwgkQrINWC8gXkDmrQPuOOjgWLdWBcrGOHAuaT4sKdcUYg89?=
 =?us-ascii?Q?lV0DLzfB4lZlNbaMvrztUZ1mQ8jP7ZWECQVMuG+eAYlyMjoa9jbAvHup9gVF?=
 =?us-ascii?Q?hW+6lI6AL2ZGWrJNGaFlWaPsxn5Ijzae/eA9ktsBAmBuwfjwgtBCaWF2KSqL?=
 =?us-ascii?Q?oHsfR0siHyhVRd2nTuFuNzIeH9E1R//UplgVDZtgX5hl4beSQ7EYJFNi0xzu?=
 =?us-ascii?Q?ga0+heDt+Fex1D33+KDdns+B69rHk5GqZ8js/TOY9Ti32UU6+7TxPQxGPtDk?=
 =?us-ascii?Q?BDInjo7Nj2onsMwIPssal5Pz5ZsdcRTPctpih/wbvwHHZceSFliXNJ3lIxJr?=
 =?us-ascii?Q?PRjuwIIm9wnm5HtETUe0pA68fqcU1oLwhWktk7HbMZYKEODs7zaJAspVGjmn?=
 =?us-ascii?Q?RTpKZAKMhUHzNB9C3p9LpVZhdqCVj2PBrR2SIKX/mwHO824LYkVFbnj71HYB?=
 =?us-ascii?Q?mnOThTL4g5E7rLPqtflkbaedpex8DR4Phj0KWpgocydlCMFeHLRil+nQ1nKO?=
 =?us-ascii?Q?Kv9e1r6RDH9k9ypbLUeCDP/Tz4VhmyMu6E/gRFl1oKnfMB57lix1n2p1wzkT?=
 =?us-ascii?Q?Y8TH9Tv/YYPV9LlXlDX6nbwY4ILdxXID/svrTfHBar7+pWQOyfqC6JrHM6NI?=
 =?us-ascii?Q?65bg4/HdCekX6sBLmnBgLKpwaKysDpeZAGx7s07ZQOb88xcM5WW2ykkmtWp3?=
 =?us-ascii?Q?W5wudKAxJjnmJnh9aM5WVyrTScvDEUqRQnogW49I1s9LSZxRFvHMNE4GugVX?=
 =?us-ascii?Q?fTNjWkC52wiHXBAw5De7+t1brmdVbvyaH4wtL30INvjZsGHwJGThFISSII/C?=
 =?us-ascii?Q?WnBjQlgjdbXvu8GyKklTkr78qJO1D1jjmlyJCbyuQL6IisrpYItJhZ8/m/hH?=
 =?us-ascii?Q?IKa1NqBYjK/kZExoLDYTHXPap4H9UUHeS6Ny8ay4NjJ1Kt8ZHZPMfhrBSi5L?=
 =?us-ascii?Q?KduLYtP/rTFm9rDuklpx45Z1NjyyxrgskptRn7Yf0ZpcHZgmztnVlTq9d0yl?=
 =?us-ascii?Q?OLtH33jGgnfh1ChV+eGbXPsjv9jeoFqUPA0dGzSfOP6/nCKdI8p/CUBdpYVJ?=
 =?us-ascii?Q?Pgira3d1geE/agbu+9+SiDjmmkzP81wlOf8/5ojIXnp7r78NugFeJ9lWrzZZ?=
 =?us-ascii?Q?6Q3J/QYqog=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f24cc379-ead1-4960-1d98-08df4a204ec7
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 11:44:33.3412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qyvFFijMfabfnMu0VQCZWz/SMM5DEWnK3o1onhPCgLx0wdLyg0vICQURJJo6Ze4aSGUfLlJWweWM9G2vL7OKRW2M/jbd4M9g4zNbTM+Yjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRWP189MB886491
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 11:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251027
Content-Type: text/plain; charset="utf-8"

S was set to ${UNPACKDIR}, but the sources are unpacked into
${UNPACKDIR}/${BP}. This was likely missed in previous cleanups.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb            | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15=
.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb
index 294e3373437..236b8e8699a 100644
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
@@ -45,11 +45,8 @@ DEPENDS =3D " \
     gtk4 \
 "
=20
-S =3D "${UNPACKDIR}"
-
 # Remove the `flavors` and `ffv1` plugins that are not actively maintained=
 in the
 # gst-plugins-rs upstream
-CARGO_MANIFEST_PATH =3D "${S}/${CARGO_SRC_DIR}/${BPN}-${PV}/Cargo.toml"
 do_configure:prepend() {
     sed -i '/"mux\/flavors"/d' ${CARGO_MANIFEST_PATH}
     sed -i '/"video\/ffv1"/d' ${CARGO_MANIFEST_PATH}
