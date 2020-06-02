Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.103])
 by mx.groups.io with SMTP id smtpd.web11.611.1591130704063108388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 13:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=DfYsTpzs;
 spf=pass (domain: outlook.com, ip: 40.92.90.103, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJU1oLwQxHOqfJc2cPvPZu387eTiGYl2GuL0IBkRafi8p3t6sCL8vDY8cDHZh0Y4fAcfJXnc39GUA0V6PeeNBLTSyDDwBjnB4Qy8LjgvHEIoeLxPCsDWZRwXQkKbfRDi12688rVscu4HDsBN/4wrcPmgA/ygYMxEflPNluKHqVWKJ9kEHDoicFgD90c/PwB3JWED0ng/M8SW+lQQXUEgpy7/xb2DNrcjfB/tgV4yygRFJwk+IwK00xQv14YHT0cIb6o1bi3toLK6jwu9Ajnh5bnOCqlwj5eaMbOdnuMzPkcUAnrQ9BvrEkg8sXf5dDB0Ikx/Om0aN5CF66fs/iR6xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJRaE/fmHg39lqMd2cieMWuBMYWCYts04SRMbCVa2zQ=;
 b=TmUdGUcgsUKilwgHZlijS32GicHClJVi8/cOT7yfK3rFd5PHzehCdCI/LJHWfQXwUvwOHyGv06vemp3XQ5hFMM+ZdI6n3Ra/2Y90zs0bY9hBciSG831FUMlCSOs5nQWbuPjQGbNJNpp4mgAd8GEjiFvY3To5r36r0SGspBvIiKzocWohL4JXceS9YF9KkCLbGBAn1aXT5iD5lqwlCBi2ch+VodIBkzEcouqk+T0Gu7GMJ5E8RAjSljWLmHz4DVRgmlz4E6bkWyBlOYmNUUsKY5H1mzqdVlAMfmfBTDE2C4vt1fHt+0cN28fqdDJbJffyAvvnJ07xb2DmJXRWlyeIqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJRaE/fmHg39lqMd2cieMWuBMYWCYts04SRMbCVa2zQ=;
 b=DfYsTpzsC/Usiy2WjJKFyrEDjLyfR9YDO9Wb5reZYaScHDpFR1EwjrD+spcBL/qffr0hNxSdq2iGkB5rF7Rz1zFGgfuCSSu7WP9nFmIgpTlRPTt3ZReUki2OZyiu3jy4rU+FCm1lrgz1XKZQq7ST1zwmN2CuHdLxg+KG96EhG4LP/6rK8ApAE2G5xKFC7+CyLR9UhKUY3XGKFhii+pv7sow0ito5TKYVxaHxe08OIVnZBWuBOnlKulK894tgMLt9RgQy2k+YVXutiIG7B9VN+pZONb7vuGEAM+Y3J4kgJrsE2Ls9LdHt5Em9KFd0kHPBonoqHlhBYynTTeqwlJ6eYw==
Received: from VI1EUR05FT040.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::52) by
 VI1EUR05HT232.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::417)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21; Tue, 2 Jun
 2020 20:45:01 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc12::48) by VI1EUR05FT040.mail.protection.outlook.com
 (2a01:111:e400:fc12::442) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Tue, 2 Jun 2020 20:45:01 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:65EDCC5E69AE171FEADB5BC3CE9D66941A9F72A4266ADE3BC9035429794C2D3A;UpperCasedChecksum:EB609C98B0139F2304AB8D527DB69DB27CB8C239FA9DDD7BE39E806260C10042;SizeAsReceived:7577;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3066.018; Tue, 2 Jun 2020
 20:45:01 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] cairo: remove trailing whitespace
Date: Tue,  2 Jun 2020 22:44:13 +0200
Message-ID: <AM7PR05MB6881F274EB22537D4979AE2CA88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200602204418.26224-1-kweihmann@outlook.com>
References: <20200602204418.26224-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM6P194CA0019.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::32) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200602204418.26224-4-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.251) by AM6P194CA0019.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Tue, 2 Jun 2020 20:45:01 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200602204418.26224-4-kweihmann@outlook.com>
X-TMN: [lw6J15cxMx+m336/8fvqPTzv96jAH9C2]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 86ed4b59-d558-4722-547d-08d80735d20d
X-MS-Exchange-SLBlob-MailProps: 
	lHNTL7xaWTiHmuVo1ULMIOcDZ3brmOaHJLvyNn7gAJWB+0yQOe0FprCjB/c9k+tdNpx/0EmlW0f1aC2JjAHteYBJ5IIiS3bLxdvJhUcpBfaUfpoCzwLW7skbBLhVNEMXlorvAmSTATZUaCiIkLnAHpOB+VVU2c7be4f833dYNsQWeoEE/aO+CSd7Sw3YqclTWtdaR9Ic6RRekuFxMZhVa8s5JNQKapxsv9CnGsDy5UspryNsVu/SSSkiEZIoV6NoT7k3JguJyQfwrbQb0+8mpaLF8wTwATjEG9hQQITNaDf32gdqyC29DxrkIuJ2HP+1Xq/jHnc6WGcgySSa1q1Bruw9J/E+xvmQux/0G1P10BSDMO6T34bEZPovwG0pHAy4VUQx7W1JwrmjLHpRcdI/O824a0KcGx8ymI3wgFubEvNdrb80IDk44Fm0c1sVD/RNDMJtVHudurlthoFymsMlTduNJxPR/Fzld73jRQUcOnlQOMZwTTPKvo6LHTu0S8ygwYWnGZ7hgLvfay1i6vlZD3/0pooEmXmyYtp13XxLU3PFkFmtiXpYMh/4hrMvuVDUsUg8zTI5tz/Ypw0x/AZJbxfJ4JvgJ207/AOACsDKjq0Asthejc7WgJPOtq8+Y43tYlqYWFc5AjhPw830VNil0GDZ0Xe/uq3I9QErwO9ix06sqqFv6PLTd9NyZIvxpq4Iy+pXT4+dXMTbv+WSs+WeQSWR8eQbB7ZuXxlzNpk+l4s4arw3hY57aD0MyM9FcwIWh/qKXZ1rc9abcmtmaCaC1+Cd6pswbdnnK9YN+7tNhFrKFcj99lJ1En78C9iUIgqEjUtGjJ1pKgGqt11o30iIRyTO8HHXwyhjpA9eimwHziqDOAkPQvpbQdf5MB4170NC3ggrRcgewmsOmkApS0xeEpnJ5VoJ2IDIBo/p1H9bLBP4MqL/6YCm7igkf49hf473PMKG3WDB8PI=
X-MS-TrafficTypeDiagnostic: VI1EUR05HT232:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7n0jHpT8p0JgU9RXbYBP+BMC9YtgItphU8egNZeQgqmZYnrdZkjDs0Mxd1qmFK1n5Q+wbgyRUWId8OMQbjQisyTAtVZ/0GNA2qSB3R48qFoG5WgOm+OLToDv9QWQ+E9o/2U68nVr18DhTx6pFfleLFbB+bdJRqT89+FgZfP89qDY4bF4fCJIu2tWOS2PIaY7c/6w12uc7XkXAlm3qbuW9gJc06/xoiMQ7UnwFiPX62k44CuwcEErNk0cFfLMB1vN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	L2teBh6141dAH7R4nfZEIInauhHrIOcfdkcPw3+EBm13QcF9Rz5g/mhH1QzKiYETVT/zZiy8TPBoArQf4cwLdI9epTxe+cSpCwJYfZ22HpdJy4bgF0V2pDXvbdKQVJNeetTMPHt0Sc0usyUE/OEoJQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ed4b59-d558-4722-547d-08d80735d20d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 20:45:01.3766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT232
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Remove trailing whitespaces after line continuation

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-graphics/cairo/cairo_1.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-gra=
phics/cairo/cairo_1.16.0.bb
index 092c77b826..71d1cb4ac6 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De73e999e0c72b5=
ac9012424fa157ad77"
 DEPENDS =3D "fontconfig glib-2.0 libpng pixman zlib"
=20
 SRC_URI =3D "http://cairographics.org/releases/cairo-${PV}.tar.xz \
-           file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \=
=20
+           file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \
            file://CVE-2018-19876.patch \
            file://CVE-2019-6461.patch \
            file://CVE-2019-6462.patch \
--=20
2.20.1

