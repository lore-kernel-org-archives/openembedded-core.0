Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.3336.1584768436244436711
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2020 22:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=H9dh72lH;
 spf=fail (domain: nxp.com, ip: <nil>, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVA3w2tDvBeezqxAWgA9i3ADyjdemMMsIRMd4vpsli6uU7N2/SuG10wCaAr/bK6f3yFhTiBXnzisCQ9QMnlMF6DK/AzPdVJhS0xWJnDi3xB9ApXszUkQJYhmqNI9PKgc2/zaWREVq6W0p2mS1wFNfEQ5KpKetnJDsRXLiCQRArH3jRD6zppjKJeFOh5MV5Z4dPpbM5mBk6vNiEVtIFxqNMXSt2uKSw6J49eKdVblJ9h6JHFYb8UmYc/iEtrNWsa3saJp2I0PoYdSDfPChno1bZ1JnWRknQ5SFIDproz3Eof2puHtyPf8oJYy3HRCNZ0gblnX/uS/MeJ6rmjwEX8gvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmRW6xHktVZi9SVZ4EvLdgmC6KOHIsypqB8GENiW+78=;
 b=hSvjjyAMQmwQemMmxhwnU5t3o24DB/KQg+vfNKyJYu/hznaN4hu9G/Ip6H3Xz7OnK69x5yG9OaH1tAgUmYVsls23lw53W3ZWMZ/5xn0FQt+7f5IVnBP2ZLpCJi5WbTxeYtMeAJt2ra3kQ+f8wjUxr8lmxl9yFZyxgnnA7bIr3hZ5EqKjYIe7CvqStalWpFqRNyReNmnLH2oZdLSHTesDUI2Cs7odz+fjgTDJqB2wTBDtf5PejgNw4MsvHXUFLTmLub5oJakYE8KRgSA0tGPN9JIk3N02HlFfrIYJYYhEFrQokCMTKLJD1wDHE2Xz2fXVx9/6tD8hck0EgQRWXTEn1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmRW6xHktVZi9SVZ4EvLdgmC6KOHIsypqB8GENiW+78=;
 b=H9dh72lH/98+gwbt09kxjF4YKpe5TVkLyWUH9R2dQgELctND+5P9OITTlUwd9NYwZ0nr506tM9JGtg3d9+T9Qcn8JkaKamr5kxr0GxIX7qJTWXQF8PxHqthj9asqkn8PraBL6NRxTKMYRqQeb6z5EpzaOavEkDrZPcmWJiom6Wg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com (20.179.234.213) by
 VE1PR04MB6510.eurprd04.prod.outlook.com (20.179.235.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.19; Sat, 21 Mar 2020 05:27:15 +0000
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com
 ([fe80::71aa:4c20:47c4:759a]) by VE1PR04MB6621.eurprd04.prod.outlook.com
 ([fe80::71aa:4c20:47c4:759a%7]) with mapi id 15.20.2835.021; Sat, 21 Mar 2020
 05:27:15 +0000
From: "Tom Hochstein" <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@nxp.com>
Subject: [OE-core][PATCH v2 2/2] wayland: Fix wayland-scanner missing from SDK
Date: Sat, 21 Mar 2020 00:26:50 -0500
Message-Id: <20200321052650.24220-2-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200321052650.24220-1-tom.hochstein@nxp.com>
References: <20200321052650.24220-1-tom.hochstein@nxp.com>
X-ClientProxiedBy: BYAPR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::37) To VE1PR04MB6621.eurprd04.prod.outlook.com
 (2603:10a6:803:124::21)
Return-Path: tom.hochstein@nxp.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tx30imx-01.am.freescale.net (64.157.242.222) by BYAPR02CA0024.namprd02.prod.outlook.com (2603:10b6:a02:ee::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.21 via Frontend Transport; Sat, 21 Mar 2020 05:27:13 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [64.157.242.222]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 37846b62-1c26-4d15-f4d1-08d7cd5883b4
X-MS-TrafficTypeDiagnostic: VE1PR04MB6510:|VE1PR04MB6510:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VE1PR04MB651034FE6238C7B6B18223A2E2F20@VE1PR04MB6510.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 034902F5BC
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(199004)(1076003)(478600001)(66476007)(66556008)(956004)(6512007)(6666004)(66946007)(2616005)(4326008)(6486002)(6916009)(86362001)(81156014)(186003)(2906002)(81166006)(8676002)(16526019)(6506007)(26005)(5660300002)(52116002)(316002)(44832011)(36756003)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6510;H:VE1PR04MB6621.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	w50+Q337EYpKl8AGUERkBuO/ll2fUyoUXVKtiLqCMPT3ngc9+WDsLWcfdtiD47YUJ+PQJnu5ofihCUwUxJhiG3bwu9oytiqKR1xW574DucNuDwNhLWgJotHhr3y7d3vs2jLLKuBzC4DftJgKgtSxaAxfmPeS2Q/OnGgHChZgBksZozZHlftuS73ZwSt4FOUIZDkO0AiWOI+0TRFGJEFIJpDyjjWuBqWxCNysUy82Nz2i1+Mej+XH/hRnmeeishpH9eTb2MUgXCzWRt4R0LQ8bFZfKT4Uai7ETFWHslE/ZirYUnuf1GPxc1eOgxHw0Zaz0YjBTZbbkNTsMi8UfVRvgjB/2II3KJErVKNbp94Hrd67yuIGjVKWLPdK6M6YuC42exmSv/uOkTr3lO3uSq/rNB1877FlDuA2rNWQv2/rgsz8apkqk+eznQmPaqgh0qwc
X-MS-Exchange-AntiSpam-MessageData: 
	/r4AhwA5xMajnlVHZj2bEJWj87o7G1kWrJGEJ+cZqiY5O+9KfBjQ5OfwJZn6WZkA5N251D9M8JktsSTkEauct54nVLBbB+V41hgsBf/I9qN+tZV/++I/I2qBJ4SYoyEWxsFqEnnj2tU21x1LYy5rBQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37846b62-1c26-4d15-f4d1-08d7cd5883b4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2020 05:27:15.0812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmWn2hP9wjjQDEnzQ83DBwg1r7+QWLroyS2oY6nNA8nwdLbZr5HltORXFWT2fp0trf7tEtio1Ar9ov55YZzEMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6510
Content-Type: text/plain

The FILES variable was customized to package wayland-scanner
in the -dev package. However, this is only correct for the
target package and causes wayland-scanner to be missing from
the SDK.

Fix the nativesdk packaging by properly limiting the
wayland-scanner -dev packaging to the target.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/wayland/wayland_1.18.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland_1.18.0.bb b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
index 00be3aac27..4d110a6e1f 100644
--- a/meta/recipes-graphics/wayland/wayland_1.18.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
@@ -54,8 +54,10 @@ sysroot_stage_all_append_class-target () {
 	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR}/${datadir}/aclocal/
 }
 
-FILES_${PN} = "${libdir}/*${SOLIBS}"
-FILES_${PN}-dev += "${bindir} ${datadir}/wayland"
+# Place wayland-scanner in the -dev package for the target.
+# Leave it in the main package for native so it is included
+# in the SDK.
+FILES_${PN}-dev_append_class-target = " ${bindir} ${datadir}/wayland"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1

