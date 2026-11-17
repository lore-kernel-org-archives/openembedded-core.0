Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16002.1794916293062564636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 03:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=iq9O2Y1V;
 spf=pass (domain: est.tech, ip: 52.101.84.4, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6z4UT/KNmbP19jz1xLHdav0KtJ8MT7W3ff0LMKeGz0nUVg17v8DMIhxeSXwO2aIvE7Do5/vGPWtMGtCHvS615+bvT93T2xKhTtV7Yw7JFiDHS1Rhy4+0BhwLlg2VpeoctLOVG6zFuC0uEIMgMuUEuVUKsAt7uL2i57GX5MAlRloTr+5MsJcXeDLmYerwxTM/9gNkZ42h86KRHDQgd6uNYp+sEl+7UY6QUbQ/rzrFn+NSogLCAbmmJfOZeKGKO8w2LWD+lmHi+mra09LygfLbL1Gc8pqBAUk2+sITpFgKlwgPsvodntt2RDwqNKlpZGu1kFEAj3ma37llk9TuXS82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9yVGVy/6mU/yuSZ3UVdjniW/xxqpDyk3BSd1QIBVpE=;
 b=MpsyNSTxCCNR+HD1hpLjhgQhpchsr6ePGOm6fUah0kAoYq5tDpoaN1o6otCstPh2H//6mesuHCh7e3+s9HD6UGMf21VBexjmBHGiljQoVVZnmZB+nogBtt0RD5+aUeAg+3zaJ1U1Kdqx0ESjQ1CFl1ovQ4Ytq7twIzmntG+QFQ754Nbs7Tp/UXXobR9gExpZJ6eqNz9aa5hMUsOwEAoHY/yxO4Ddu7KS3rtpF0vFVSJ3nfysK+heCa2e+/rNW8NMQU9zvMVjiHMdWtxgY9JHJHRfNm10btSLkGBUPcPM5treSfk0ylevvOu9qAJO9XJER5t3jKMR8HZ2JOgsZwsnrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9yVGVy/6mU/yuSZ3UVdjniW/xxqpDyk3BSd1QIBVpE=;
 b=iq9O2Y1VrEKf/31ON5/hFUPlCkuZ8qQvS5rmytJwblHPXqnqnpC78Jo27AtZZK+9omaemGODr2GOE3ecGggfHeMEBl+7VoUwwkLKqQVLO1BMwWpp6FVSvjG6UeaSBX8zVDvwjCaQoKXc6zdy3GWXyyjarVKUdFqeRTf5Lq9VS9EJmknWR20ze/ElpJmOaoDRG/9BV6HySDlCzEWqPnNKB28tWVNhejVug1gNjlc3v5xLsRbTQ56HWhoYu7fe4WdJoyUtJN5/mYHq2anEFZ3C10C5RhUViJPbf6T7Ssx83wjeZZ8BvbNxE3k21ZIaqK7GQBd3qay0RmNt+jxqILbRHA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0853.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:162::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:51:31 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 11:51:31 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v3 2/8] initscripts: remove obsolete systemd masking
Date: Tue, 17 Nov 2026 12:51:20 +0100
Message-ID: <20261117115126.14374-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
References: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO0P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0853:EE_
X-MS-Office365-Filtering-Correlation-Id: 51858b41-1d2d-4451-f1d6-08df44a11f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|6133799003|261009221727099003|261009221227099003|261009223027099003|261009223327099003|261009220027099003|11063799006|56012099006|261028144727099003|261102123227099003|261021123027099003|261022105027099003|261026140227099003|261022075727099003|261026121527099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: VtXlKjrr0AUruID0rqEzxRzSRWzTz1+RO2Yf4PEqdE+d6SpZUWb3uVMQRCJ2TUQIclpDimdYTAD9tpnuYjoKjE/Zx4Pjjn1mM1TLQSxXrTBw578fkAQ9RCRsqyquo+amaDhZoUAEquc3nl0K0HH5qk+F7JPWcrJAun3+mFlluKtT69ydFeD3y4ltVDu9JpRWG3Tj2RPdbgI3II5dDSrJNVYg8Qk0IfnfbF1feUvhxcriJdXq/4EETkGzb/sv0Gxxyef4ZmRFdAjSJ8h0vrCex/kWO25dSqulxT5eRkpQqb/VpuXdCd22GQQv3kaoKlCobYgK/Gujd+AEJ8yKId3nNd3A8g/fimSqJYaWr8B7hPFEGUKaplfLzaM7+OG7eQyrr9fZa3LrDS9J2q9NMhuWwuoEQHt2m+fhkzD5fFw1+QQQKReNvKd2bf/avDxJ9zyRugbNxMkMh2RuwTGTdwg/bpbs80wrcblQ3rl4CPuCJJFG53sKh08OXEnArnpMCWo0yptNjj+KhTMZWH+t6UbH6ADAIkO7rhR6KfNLbe/8NQLCBPHPCg4uvYih73CLtaDW3ZRxZC4G1bb1afcXagEA2rpzjTTDhBofaJdL1EYboEv9wcsHeln0HzHsjzhqh83M4ECBXswN6E/Dv1FeNNbB8LSYlpnXMXiQDyxMPgaMeOc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(261009221727099003)(261009221227099003)(261009223027099003)(261009223327099003)(261009220027099003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261021123027099003)(261022105027099003)(261026140227099003)(261022075727099003)(261026121527099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nlDxV795WlkOfPLHHfPIkFrkZqbzR0gqgQVDR4DjY3wytbQONnBPCCWj5zIH?=
 =?us-ascii?Q?45+te4Rgn8bXxrngk2WNK+LvDe6zK31B19uOR1o1lDvCp08ATVSgyknoFGUg?=
 =?us-ascii?Q?fQdoZVRtB2Sb63d6/pMtJ02/9J/P6Y7CUXocwjfPOSnqbRK+yKKsQJ4lsygn?=
 =?us-ascii?Q?rOuO7oQ1PUUoiC8vLK4JcptewJfTXIxhHhOIWyaJzTpo/J7ExLPV3u7SZmGA?=
 =?us-ascii?Q?YMxorW9gR7lUGey5R3bHLV+KU5wWhNkV5fHb0J3GRRbZbGfiPycBjrOaW4uk?=
 =?us-ascii?Q?kgNfiR/mDknFsUBTCM7852fUR0qY1kfoCBlnFqrboi2V+C+IF2UCpoVZ83fR?=
 =?us-ascii?Q?/v9gf6tR3mrvEIxF/HUyoxKjUAbTDv9XwWzc6byFJPrMzOmZ9JO1yXSBJfJc?=
 =?us-ascii?Q?HDXlen3mTdIGMmzdmCYeZnkQyWy2XnFJgN5fEeFhwGJ0Y95qnqmfIcy1H9xl?=
 =?us-ascii?Q?+am590U5aGsevXGHpMfLMQeSwYjJEDOolGPwVFNTgI7tndXlZg6Wy2lrNE3V?=
 =?us-ascii?Q?4ONfnDUEipYz3N7LwLzFJWVgB8x1EVMcKkjWZwv9vHoE4PKajcKtfcYUxUVR?=
 =?us-ascii?Q?u1+4oQVi+2Zi81rSptf/YnaG2fi4bsmG/FGvmmcZS6XJ7W+ullwgdEzu6iRq?=
 =?us-ascii?Q?hBiBmu/mztxH/sEpfAjIMKcfI/9gKw+388OsZsse7kcWXqr/MqWN0mzpykT8?=
 =?us-ascii?Q?2hXSChMo/5yTbWWNjBbN58WyHT7E2mJf7sOgnTBOZ3WLqj0AgSftov1wdxcc?=
 =?us-ascii?Q?MqfjwQRD9gkEtDSUwOmO5j5Y89gCCA0aNV4GvEaEg1xJydFjpl7JKyR9Aqi6?=
 =?us-ascii?Q?v5RfjdLYQ1LqvpBl2DRJj4ibNiTdz8h1sked1aDn5O1nd862PlGeB3OzwtR5?=
 =?us-ascii?Q?aYfhTYrT1gy/GXAjhFbnuZXZegjJF2D9VcTHE5pP4lFwuFneiH6zcm7lNqAz?=
 =?us-ascii?Q?gg17TkxdQ3fgIH2TBaWNTh8SWDpZVA8HXCRLzYHZGoNgB/YR/gbkV3OB4v1Q?=
 =?us-ascii?Q?IepmERgACRKTjU+97GL8IJ4kqI9sV8m2PI6lb9wyqdXrUbtdb9FXNDmXUGeq?=
 =?us-ascii?Q?JrjIzrJje8+rkrao00pGK/oBLhOa+ywXP/+XLzOX7taGtMdWb9/YBoG66NQk?=
 =?us-ascii?Q?aw2yWdfKaCFIZZ+4e2+8mPozwhvlkC8Jk4LIim0Gn7F2axx4NuOz0hfz3utc?=
 =?us-ascii?Q?pTIiK+XtvnBoF1JYuzSQxCCQ9Q06XuQA5N6sHFMYcePNqesxBjVP58UoHGuQ?=
 =?us-ascii?Q?eQLmCqtlzt9lj3zayJrptsrOtYEAL3vWWhGghCiwVTGX2R2d+Je7KWJ0kBGf?=
 =?us-ascii?Q?BsRuGWlxagDYDqGJtKOJVkqXgCgOsjfvNDj+WX1q3YjyubeSzHi98r4oAwx/?=
 =?us-ascii?Q?PPGXYliIwxo2vJz6D2BYRdc+ubGUf19Kq8ci8jODyNIF6h7yWqLJcfWvGhla?=
 =?us-ascii?Q?9wpiLiqi/QXOfgcK3Gg/YwYzXkGgfca9PjoQYtGKf5/vc2NR9yCK9r+v4w7N?=
 =?us-ascii?Q?/JWPsox6NbWxPryvwLNt259OYRO4Qfy6+oU6zcvhsiZAddKa9BQGkc2hRq5f?=
 =?us-ascii?Q?Mdemc4JZf6IxNCQL4lyZ2wNv0eIvFDLUwgrlEnfvvX4IwT9J+8qh72IgiIZW?=
 =?us-ascii?Q?PkGIkRgaZirl07lfNXW3iaz0qLZ0rqvUyIJt8jW38adL1gxHYMZ8+F4f7O12?=
 =?us-ascii?Q?VMhexG5Nza5gYxWGcvD9aIrd7X1Fle4ifHCI1YSEbuYumoUPpO9vjzSGjRVN?=
 =?us-ascii?Q?3qRRZ3bTzw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 51858b41-1d2d-4451-f1d6-08df44a11f51
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 11:51:31.6951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBBUMVhHwKEbvrE2fUTVp+COZ0YRRfGgzkaQAtXKjLN4Nsynx1WtmmZNmJ6d35sL85oIa67iISQJKoxI/SsCJTn9/GEsgUTmMDajlpIZDuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0853
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 11:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250426
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

systemd no longer has sysvinit compatibility[1], so it won't try and run
the init script in this recipe that is also implemented by systemd.

Remove the explicit systemd unit masking, effectively reverting [2].

[1] oe-core d9ec9e20eeb ("systemd: Stop supporting sysvinit compatibility")
[2] oe-core 844f897710 ("initscripts: mask initscripts from systemd")

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2ace925cc4a23ff33a9bced602212fda06e4c5a9)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../initscripts/initscripts_1.0.bb            | 26 -------------------
 1 file changed, 26 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipe=
s-core/initscripts/initscripts_1.0.bb
index 23411b6a71..ae386a6281 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -41,7 +41,6 @@ S =3D "${UNPACKDIR}"
 KERNEL_VERSION =3D ""
=20
 DEPENDS:append =3D " update-rc.d-native"
-PACKAGE_WRITE_DEPS:append =3D " ${@bb.utils.contains('DISTRO_FEATURES','sy=
stemd','systemd-systemctl-native','',d)}"
=20
 PACKAGES =3D+ "${PN}-functions ${PN}-sushell"
 RDEPENDS:${PN} =3D "initd-functions \
@@ -154,32 +153,7 @@ do_install () {
 	update-rc.d -r ${D} dmesg.sh start 38 S .
 }
=20
-MASKED_SCRIPTS =3D " \
-  banner \
-  bootmisc \
-  checkfs \
-  checkroot \
-  devpts \
-  dmesg \
-  hostname \
-  mountall \
-  mountnfs \
-  populate-volatile \
-  read-only-rootfs-hook \
-  rmnologin \
-  sysfs \
-  urandom"
-
 pkg_postinst:${PN} () {
-	if type systemctl >/dev/null 2>/dev/null; then
-		if [ -n "$D" ]; then
-			OPTS=3D"--root=3D$D"
-		fi
-		for SERVICE in ${MASKED_SCRIPTS}; do
-			systemctl $OPTS mask $SERVICE.service
-		done
-	fi
-
     # Delete any old volatile cache script, as directories may have moved
     if [ -z "$D" ]; then
         rm -f "/etc/volatile.cache"
