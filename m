Return-Path: <tom.hochstein@nxp.com>
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60069.outbound.protection.outlook.com [40.107.6.69])
	by mail.openembedded.org (Postfix) with ESMTP id DD5F260F13
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2020 03:00:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ceL/q4BBjMbvmX9JxV1enMILufYH8MfY4IKUk1RA8WzvyhwWjBuD3JVPFzRLJcQdtL4nL77cXMk5iA91T+4u+mxEoBi1MmIp2APUM6Sboq+MD4ABUYrqR/bvMi+L/5X/6G5T3Sj0O/10M7NITDmUr2es0FNtj5cA+thGIWRBPyZHwIjlCJdAXTsIsqqkat3SvPJrMCP2xauGM9AWoCZR6UqVYm3vw7a+XnUrryFloNdPPStRyTL0vJKGWTSq44EESWDO9fmRhEk8uSK/R5zG5bj+6Waxj7sAQTmWblwJuDc9I9y3ObglNZGWFPHLgAyqAoWqZ7FtcVLgxEldMrrO9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=m9duO4KBmujStBIwhy1tYZE+7+rm54OOld+81xwjiBo=;
	b=i5/BUjRafUFLqtVTHKkgQuYWlPpP0quj9kb0YbSH28/RPi6CRzO7zuuuLq5C9FFZoD8IShnpogKRl2Klw9387uGEOP0aCnrX6DtEHQX1k90bLS2NrYjKGaEIxFhj49ZvxLXSB3eLGED4yjsu9OFhL477bCJF0r4v1JT5bMWlvE/fHX5vGN7Lb+OfUccxVlPOFDG5Cif5xBrGWPJuC1G3B3UdnEDzJJvjGvLZMr0u9yi9etDxdGXRYXdBRgiRqB4xbAMnuhPc9QQHoaSnobtb2T9TRqB1AE/ZJEMtOZ4TfsicTQ9kgoMoWAfyvA/oaXcdsr5wfm1svoLuPsf/P/RBkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=m9duO4KBmujStBIwhy1tYZE+7+rm54OOld+81xwjiBo=;
	b=pRsvrXiGOd3xMUdCvjCQGCxErdKYyKDFnbqYfSfuUMBCGg2/NfdKw4Q6JnRh6SWQ+miI1QrHRMi3OHicHBy1y/7EQjqYLkx/CyhMQSyRdwrv4waEBkVrbQihRqucb7tXXK9Pbsm96LRk5z07hmV01XejZ21cS9G2laCYHDAjdSw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com (20.179.234.213) by
	VE1PR04MB6752.eurprd04.prod.outlook.com (20.179.234.205) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2707.23; Sun, 9 Feb 2020 03:00:35 +0000
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com
	([fe80::71aa:4c20:47c4:759a]) by
	VE1PR04MB6621.eurprd04.prod.outlook.com
	([fe80::71aa:4c20:47c4:759a%7]) with mapi id 15.20.2707.028;
	Sun, 9 Feb 2020 03:00:35 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Feb 2020 21:00:08 -0600
Message-Id: <20200209030008.4719-2-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200209030008.4719-1-tom.hochstein@nxp.com>
References: <20200209030008.4719-1-tom.hochstein@nxp.com>
X-ClientProxiedBy: DM5PR11CA0015.namprd11.prod.outlook.com
	(2603:10b6:3:115::25) To VE1PR04MB6621.eurprd04.prod.outlook.com
	(2603:10a6:803:124::21)
MIME-Version: 1.0
Received: from tx30imx-01.am.freescale.net (64.157.242.222) by
	DM5PR11CA0015.namprd11.prod.outlook.com (2603:10b6:3:115::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21
	via Frontend Transport; Sun, 9 Feb 2020 03:00:34 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [64.157.242.222]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0e52c359-10e2-497f-4d1c-08d7ad0c3bba
X-MS-TrafficTypeDiagnostic: VE1PR04MB6752:|VE1PR04MB6752:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB67520636516992544801179BE21E0@VE1PR04MB6752.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0308EE423E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(189003)(199004)(478600001)(4326008)(6506007)(316002)(2906002)(1076003)(6666004)(86362001)(66476007)(8676002)(36756003)(6916009)(5660300002)(52116002)(66556008)(26005)(8936002)(44832011)(66946007)(6512007)(16526019)(6486002)(81166006)(186003)(81156014)(2616005)(956004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6752;
	H:VE1PR04MB6621.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OxruKpCS6VuqoPAVqW5Id+QlSRa4jY8pm9NXFYd0V37/YqQWPnEm8eAMNfa1As9dhrR35dJo4ELsbbrNxe3bBbDKc0m5mnxsXUDY7JNU8F5WCkdD/Au8uf4IkJyqKUnCy/yDNP02qVVbBNCLC7lgDtuCK6cSL0VxR33qbT6B0YRM//WjQGmUBvd578jYm8yDRdJ0amc+9i36KCjLzrIg9lEJEIzY5RpA7oxm0LvssSaQkjU93gmC0AdDuWPExhrAZhzJsjDvi1B3nmmR13oBC5RF7QeP/4PSOODBTPizRMtynNHBVeg+oLYyAChiMa0G2mqjuI406jChvFf9rIhdHNTgHlnpNLwuYsEqXR4lGtgulXtLWpNQ85+SYUjoGJm0Nsr7xmGnO++Y4xSZFVNfB8g1ZOv+88J8FAsJTHN9tIVGLi2fpJp7ETsUAfN0L3Z1
X-MS-Exchange-AntiSpam-MessageData: FWLtFC0AXjf8nVKSAUGpVtnmgna5THTmnzaDS/A7hw5XsedRHZD/rnOO8rs0D3Im99kB2JsTTRvUC64jKGm7PCzt4EwRxVWVmliL1lr/6vHbr2uOh6l+WWbYwFr5JkZfLu0LGTcUUo9fJ6YAu0Dx0Q==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e52c359-10e2-497f-4d1c-08d7ad0c3bba
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2020 03:00:35.1981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93xy/L0Y0C1+OlQxT+WZIR8n0OvahKcNYCNmvHbZRcgIhrho2OMOq/j2K7TK7cY5ZJwbSRfIb8iPYbKZ3bY7DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6752
Subject: [PATCH 2/2] wayland: Fix wayland-scanner missing from SDK
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Feb 2020 03:00:35 -0000
Content-Type: text/plain

The FILES variable is customized to package wayland-scanner
in the target -dev package. However, this is not correct for
the nativesdk packages and causes wayland-scanner to be
missing from the SDK.

Fix the nativesdk packaging by properly limiting the
wayland-scanner target packaging.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/wayland/wayland_1.17.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland_1.17.0.bb b/meta/recipes-graphics/wayland/wayland_1.17.0.bb
index 12916a0c40..cb4ff2c20b 100644
--- a/meta/recipes-graphics/wayland/wayland_1.17.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.17.0.bb
@@ -43,7 +43,7 @@ sysroot_stage_all_append_class-target () {
 	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR}/${datadir}/aclocal/
 }
 
-FILES_${PN} = "${libdir}/*${SOLIBS}"
-FILES_${PN}-dev += "${bindir} ${datadir}/wayland"
+FILES_${PN}_class-target = "${libdir}/*${SOLIBS}"
+FILES_${PN}-dev_append_class-target = " ${bindir} ${datadir}/wayland"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


