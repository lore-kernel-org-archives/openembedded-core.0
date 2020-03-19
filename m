Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140089.outbound.protection.outlook.com [40.107.14.89])
	by mail.openembedded.org (Postfix) with ESMTP id 1704060FD8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 18:35:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=P4/oKM/PISfAVa/5J801dd/+pYsUf0EorMIZX8uhG8tw3sCyyWLSfzSZ+qq4asH12xDcenr0HCLbjajY9QsPG3KhPRqH5FXqfB7/QPdk2RUNS4i6Lfe7iDUGP8++0aX+LirQsAnLtBzzRcw6LcTF5ao6yLTUl14n79B4oHkR8cuSl+KIumgBg1gCOotN1XjnY1LJeFTfGSgGh0eiYSC0Ys50JEkzXlUfspbRFMm3dzUZoIU0ifWoSHyuE0gtKOwVsb3P9cRqhAe3VC55F5+YI8GLRzGUdV5X6Ayidrri+b72KisFwe+VR/2XHhrdLkJEJGgNmE1/jCSCDxJvARUFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=oBidiYZWjpFlB079BT0SZeGnYwkG6tj6TUZEEIsDXu0=;
	b=ina/sG78vUrfiOwelFB11+720b7D8hbkiou9IPI2uwsi1evOVZVRKinBLZ37x77ETIKePufxluqPF/vmezXNnymdV/9Wne1FJjNo1vNktmP0l5tBW3gEz6rReKWqgl5GHgQ0IK7Bn61rZGEBlkCUqQ4EPXwV/NvpuraO/uKftqn+/aDrtfIhgloHnxgiE7XT6asfwB29f0Azaqu/5vxZEyA6m78ocOpTmIPGAZ/Qugq2dtmOGeKBfcxfxQt4nrmCajnOG5k90UwOnLNiESG82qzliR6rY30srB99Rv1HzjtpDxJa7C6oow/V4PK8dw80a6vbMmDIdirrQpIDAVU77w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=oBidiYZWjpFlB079BT0SZeGnYwkG6tj6TUZEEIsDXu0=;
	b=b9NgDsIu9vWie0SQqBW/c/i+U1ZuId3G95EJvMIkaDTTU3RRxhceRnjJhalQ2NpBXk2+feebEIVBTQ1gXfdRghErA0WlMvqhljJeiBdqoXDTTuzAdH4KrCIg58fqXI+kfun2lbBBNlOTsGFobX+X2RoXVyFqYfI4TShA//iq2bU=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com (20.179.234.213) by
	VE1PR04MB6542.eurprd04.prod.outlook.com (20.179.234.160) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2835.20; Thu, 19 Mar 2020 18:35:12 +0000
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com
	([fe80::71aa:4c20:47c4:759a]) by
	VE1PR04MB6621.eurprd04.prod.outlook.com
	([fe80::71aa:4c20:47c4:759a%7]) with mapi id 15.20.2835.017;
	Thu, 19 Mar 2020 18:35:12 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2020 13:34:25 -0500
Message-Id: <20200319183425.12294-2-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319183425.12294-1-tom.hochstein@nxp.com>
References: <20200319183425.12294-1-tom.hochstein@nxp.com>
X-ClientProxiedBy: BYAPR07CA0047.namprd07.prod.outlook.com
	(2603:10b6:a03:60::24) To VE1PR04MB6621.eurprd04.prod.outlook.com
	(2603:10a6:803:124::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tx30imx-01.am.freescale.net (64.157.242.222) by
	BYAPR07CA0047.namprd07.prod.outlook.com (2603:10b6:a03:60::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15
	via Frontend Transport; Thu, 19 Mar 2020 18:35:11 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [64.157.242.222]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 788413da-d1c6-47b6-a10e-08d7cc344294
X-MS-TrafficTypeDiagnostic: VE1PR04MB6542:|VE1PR04MB6542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6542AEEBA8672331FEC63C10E2F40@VE1PR04MB6542.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(199004)(26005)(2906002)(2616005)(956004)(6512007)(4326008)(186003)(478600001)(16526019)(1076003)(6506007)(44832011)(66946007)(8936002)(81166006)(66476007)(66556008)(8676002)(81156014)(6916009)(52116002)(6486002)(86362001)(6666004)(5660300002)(36756003)(316002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6542;
	H:VE1PR04MB6621.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2uwmhJKMS+pEI+9ulqK4gqUIeAoWvcVcMmHCTkG94Sw/AZL2rjq2YTWrlmKt5/NxNUnMt2W5Oi1tiT6Wm8DToN7JfEhSMAA4IW8h73MKQvfxZHpPWZRuC893SYTRzZ5gIh63q1JyzVyIO6N/QnDu+/KORiD2m0XJn00UCTr71BYGji2apuxaVoovBq1Ye8vvbosyFFGr82lzMle35PCbcZZnXoWTzoa1BKpswfnvLPlXuWs35wpSr+He6RnRANahe+BvdIjhfTtHDVFtgW+Yj+s4vrYUVQ3LEDXAyfohCR3fTnrHQ1GrZ6yMFQSyG8A1TiuCaeBNd9XeY41Lo+ywoDKXfNRklWA6hJNMFBd7P7kAhDIJwFXsr9YHbYY+8Z+Ue7qvUV2+MM5LzhQn2NGUAuujDzNYrlcNrW9OL1Uvcond1tjKjrCnhjBT0C0bAyYd
X-MS-Exchange-AntiSpam-MessageData: cjtdEgsgWxlJdNFTbm5FsqfEExQj/c6/GrZOIK0a35Jp2ywedMHuXgCuzuHN6bbxqcID/3AqyUD27qtUs7rWx8p7FYED4aAc+Php6xglAdha9oX5EsFXdjhmOdFefwYdU0KRKN5IA6nWSFPUUJ/fRA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 788413da-d1c6-47b6-a10e-08d7cc344294
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2020 18:35:12.7914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MeUVUcdWFFPbj9kevBFekbK7s1oO37PnvmhOQUt8lo2QF4UiIZdYBLeq7aZvuf7u7gzWkMqbxdszGuAa/fiOTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6542
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
X-List-Received-Date: Thu, 19 Mar 2020 18:35:13 -0000
Content-Type: text/plain

The FILES variable is customized to package wayland-scanner
in the target -dev package. However, this is not correct for
the nativesdk packages and causes wayland-scanner to be
missing from the SDK.

Fix the nativesdk packaging by properly limiting the
wayland-scanner target packaging.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/wayland/wayland_1.18.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland_1.18.0.bb b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
index 00be3aac27..c7098483bc 100644
--- a/meta/recipes-graphics/wayland/wayland_1.18.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
@@ -54,8 +54,8 @@ sysroot_stage_all_append_class-target () {
 	cp ${STAGING_DATADIR_NATIVE}/aclocal/wayland-scanner.m4 ${SYSROOT_DESTDIR}/${datadir}/aclocal/
 }
 
-FILES_${PN} = "${libdir}/*${SOLIBS}"
-FILES_${PN}-dev += "${bindir} ${datadir}/wayland"
+FILES_${PN}_class-target = "${libdir}/*${SOLIBS}"
+FILES_${PN}-dev_append_class-target = " ${bindir} ${datadir}/wayland"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1


