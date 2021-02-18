Received: from EUR02-AM5-obe.outbound.protection.outlook.com (EUR02-AM5-obe.outbound.protection.outlook.com [40.92.67.82])
 by mx.groups.io with SMTP id smtpd.web09.1809.1613676628829183693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 11:30:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=d/wyhp+r;
 spf=pass (domain: outlook.com, ip: 40.92.67.82, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1bgg1s7M+XmiqGEo89ScJPJ6BJuAzwsl7omfPV+kLBbeBSDE4074zd3VQ06cM72OzbylDY4B60oandKtVpr4AkfHQwq0oP3+dHA0ebI/7SkVenLSX9kar7KaSrx18b4YYk3R5gD4uv9mhZfhC1pZxs/dvAAqOhW76sICiMYdRtKX9cctA96pHgYuc9getYVK6Lx0M1oFKprKaJBT+yCZHBxAd/qW820LPqVsF5Hznh0E7VrycCVWhRtjtTUBKbYCUs58XNfRLWjgoYbZtvyE31DsdS8yAPhUAyDEl2rl19y7Vt1geM3jF92h6C2cZWDM2cSvYcY3zhtdpb+4r6rjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fl5zSyPnwYztW+A/O3Ys3EhAa4Q3rpXnmyenwuEusAg=;
 b=meubBT6MR3L5QhUIp+CvHmATonoIx5i4lDvwTg8X8cB24BqOTdDObpJ/chjHUW/WQ7KrxS0le9V3AezC99PgMVAn49SMerbu+qiEfxKS21U4fBZFxDQaX2FEJAEosF2P679hf0x/Y+3BanP53RTChPg59Co1gRxoZIsvd4VY1XEMSesrsEERWVHkqF9MvHU02IXlS63VLsrtIWDtgOcpC04K7ggT9KUnAQjWVDxqk4wFxRqinV0R2XH6uCl/QnIBh3CXfwG/ZKe10vSO/CTkFlvZQ6HMDfJy1O0Y40skjN4tRNNsQ6lSJv6Fk6Ib0YPf86uNVGU4aVDvTGOkNIruTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fl5zSyPnwYztW+A/O3Ys3EhAa4Q3rpXnmyenwuEusAg=;
 b=d/wyhp+rckYYTtzuBV+rvSxJRmTJ4xvyu2muzTynd/7WGMMgRTjswzera+ky47m8xYgrPKdZ/sDTQR8BTiYl6arncuDaSwaQ9AAeJb31gpuWtwNuYVaWCHiOGrHfzn8QLBZUEgIaNEBNy8M1kKspSQgRXM8Cn+PTiY+5/B/+jIYktczaS69QqDYmlV/xO5LxULQzqUh3DRAH+f3C5A+zIrcjmQeRj8ETee+pvTJjr/UU2InMCHciDTp+9JX/RGlN6WXGho7NMz/AripmvOp4I+bq2PS59Rk/ycxeLI5WuKZTOePsslUUfOedozt9dpbai2woHEJT9e71PNhQSUtS5Q==
Received: from VE1EUR02FT021.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1e::50) by
 VE1EUR02HT084.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1e::460)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 18 Feb
 2021 19:30:26 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (10.152.12.57) by
 VE1EUR02FT021.mail.protection.outlook.com (10.152.12.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 19:30:26 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:1E1D56642CD1E99421F5FB7D38EB82423965A6D48BE1C172DB3BA37FEFF03DE4;UpperCasedChecksum:BE845DC89EA8A5B9B6D52C05FC564D8AD3544B3D018969E7B5B2A55581455290;SizeAsReceived:7285;Count:45
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::35f3:a85d:b2c5:d4b4]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::35f3:a85d:b2c5:d4b4%4]) with mapi id 15.20.3868.028; Thu, 18 Feb 2021
 19:30:26 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [RFC PATCH] cmake: set CMAKE_EXPORT_NO_PACKAGE_REGISTRY
Date: Thu, 18 Feb 2021 20:29:59 +0100
Message-ID: <AM9PR09MB4642F84D5F9570F929FDB965A8859@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
X-TMN: [4q6ls/g4CTtZUvJMSYeV0iUBF35bEZNE]
X-ClientProxiedBy: AM5PR0701CA0056.eurprd07.prod.outlook.com
 (2603:10a6:203:2::18) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20210218192959.36193-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.86.125) by AM5PR0701CA0056.eurprd07.prod.outlook.com (2603:10a6:203:2::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.9 via Frontend Transport; Thu, 18 Feb 2021 19:30:25 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 6316195f-ae1a-4072-36ab-08d8d443a474
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyJ+TuYVA7D8XrlPj6+t0uRnnwFeSgIzJRF9ZRjnRxFiWrEaGJ+PmbZxGUN3a8WQcj4itS5TkdjCR7NT53hIfd+rl8L8+YM4XWuWyZE0glmxxYM521ArS8x3OVXfU0g9KSVcjKY7HeGSVF6d0AEidmD2WjJkOfvLldHiMJHasV/GmX0Q/dvB9k9qlm05BA7I7zU1QgGtMrkRAJV58cR1/uIsHi20408jPY3zub9lB2p97+fWTOxR6p+vlT6AE/gKMPF4CdDRZEkHhMdtnx/qiT7oOq4j7WuVINLQ+Eji1MKqtfcpUYV+XYwt3duBuYZwEsfzc78tEqxXzEIZw/widgpVLwJ2nogffRY/eb4JSOMkFCwLSgJhkMbf/4ajjjgwtcPQbsP+osfn0p9Rz4//1C3YzkPLrDdniCkM3c3xKzF54G+0s/KHdEHdsjHWcr1gKmA61zJ+JJ9RiduRWySc1rtmhmROUybcV0+JJOtA+uvf50WX5yCggYhYqQGQzvnt9Ow5+kyd1CA/I5ZO+3pxYyqu9L8Zu877i9Eak4HxjZ6Mdi/meRhoMZoEZTOh5PXGYoPe5RabtnG/5/TszYCZNHdAQtZQBcAIOg4Io5o5chKo3Ipb4K3oKblDJ6aPTCAYVfxTYr9YXPf8yZvl0fmN6Vamp3C3RtX2tIX7/4+sQinANo6L0z0ZagfqFTFv+g3Jb+CNpP59KIVyrSy7cPgaqj9gcmdNAWs10npZ4zi1H3o5ZOe2DgdBId3pZA5PK3VWKZM=
X-MS-TrafficTypeDiagnostic: VE1EUR02HT084:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f9oWiomMH9S993bey0gNJRln9CJ1NJbiNj4s+xE6X2P/N9QwzeeC59mebDbc1rH+NAt4kTtUQX7aMCwj1Ef6OLlSnb3oMpkRxXzfrQjvTUR/tMlOluQ3r5u0wtwrWXqw8JzFQdAtVAY9D5UhA7m3f4erF7XaVWqImrlY8CGI80COLXpbO3lYxOtPeUf3mjpnxprk2Smpm8bhKHMoCYVDP0sclwZIxRpdPA3hl5uBShkoJKwGpBclQf5k+yFxo/5IhowlzkTH9+dQs46ColZnIsujO7NXgizNscJzpcS5841jSTNIA9SsD0jBaWwnXQS33CXYXX5heJNre9hH6o3CW2qFdBjQaLJ6eTLLg3uxAPlvMedld/ur9sErAuebGJBZVhGC/PRupjIELqB2JqC0Vg==
X-MS-Exchange-AntiSpam-MessageData: 
	eGVO0+sZCKngax7QxjkHFNVCCHTz2u6SsrR1MN8Bihq7iaQUokgAqu+Nysj+WY35pDRjeyjQaxGl2bYvwrZoHXs3rnYxoHvjF3gH1mDYveDgDYSDsRy5X7kylgxlHLFYXHcJKV8yPxTa2XNp+xLrKQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6316195f-ae1a-4072-36ab-08d8d443a474
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 19:30:26.8305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR02FT021.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT084
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

if a cmake file uses export(PACKAGE) command it creates a
folder ~/.cmake/package/<name> in the current user's
home-dir.
fix this host contermination by setting CMAKE_EXPORT_NO_PACKAGE_REGISTRY
to ON by default, which makes the export() command do nothing

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/cmake.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 7c055e8a3d..4af22268b7 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -187,6 +187,7 @@ cmake_do_configure() {
 	  -DCMAKE_INSTALL_SO_NO_EXE=3D0 \
 	  -DCMAKE_TOOLCHAIN_FILE=3D${WORKDIR}/toolchain.cmake \
 	  -DCMAKE_NO_SYSTEM_FROM_IMPORTED=3D1 \
+	  -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=3DON \
 	  ${EXTRA_OECMAKE} \
 	  -Wno-dev
 }
--=20
2.25.1

