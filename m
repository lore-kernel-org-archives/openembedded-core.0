Return-Path: <tom.hochstein@nxp.com>
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60085.outbound.protection.outlook.com [40.107.6.85])
	by mail.openembedded.org (Postfix) with ESMTP id 7080560CE8
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2020 03:00:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Oc3tPsfiljh1XtEtDEObkPb1c/mq9Xd9PQn4L08An8cQNH9A6fCfEBLVS7WMXXDmtFNE/qdMeytMe+s9hTsFiNwX8D+jXQsdRTtkc8TxzIyquKS1+pQMf/OCFcekPRz6zWVMRuBtFiQX2FzkuK8gsLOZ8x07KDha2JQvggmI7BuAGgv1uM2oiUgLZOzDxW3i9+kW2BKP91Tp8QTQrpab85IQ4zHtegOrk3rab9rXKz8DtO4IRBZneFHRXqmgXqMfVor5AzNhLJn87Vg1emdCkoYqL9IFa1/arrPaEYu3VXRS7dsLRDI7d4uknxuGhhdXp3EBR/gNBwqj2zOlM76aOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Tuc64ThbBPKlep5fC4CF7hRxehADs9VUf5hGVCe9LZ4=;
	b=bRnqEnUw0+DeDUISBikRtrPjeo16ENfAXhv4HZFKf/HGKUpaIVj70OkDM9gFijCoq5wZNk4/CzTkO1Cg8tLVwlwfVNtemuC4O4ta9WtT2fXB+DjNcTEGRVe0wZOooHNxDD5VXqEsckiyGygOIudSpuQhFMIU0opDpnVIYbweEVg0ay92XwJ5dEYCuScc+Jo/X5A1exfbwvDIUmZDudqOWjssyNRNG5+sp0lrIdhNAGNpuGHZhklIB8JbbkLMld593Sg5vDFfZThbUIhF0lE8oNqD0cL9cchvjaL/a2NLcWGzRNvZ1Kbc+SYAjJpWe/L7lFKCtI8YxcgXd/QCofKkIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Tuc64ThbBPKlep5fC4CF7hRxehADs9VUf5hGVCe9LZ4=;
	b=CZ5PPfhUPE7u0u+ym1h4dUJtmn6DYx4maOi7VLp5PIiAZtMysO09lZWr+u/uVox/AhuFW5u6OUWGGSaNb9F5WGg3P3Stj/P+fWpeYtngjvkO4YuW7xD9zM0bAE1NfIU/xjz+HUsBDZaMqJTrUTGudjkt0mgOaWgWapM0RikfBzs=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com (20.179.234.213) by
	VE1PR04MB6752.eurprd04.prod.outlook.com (20.179.234.205) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2707.23; Sun, 9 Feb 2020 03:00:28 +0000
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com
	([fe80::71aa:4c20:47c4:759a]) by
	VE1PR04MB6621.eurprd04.prod.outlook.com
	([fe80::71aa:4c20:47c4:759a%7]) with mapi id 15.20.2707.028;
	Sun, 9 Feb 2020 03:00:28 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Feb 2020 21:00:07 -0600
Message-Id: <20200209030008.4719-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM5PR11CA0015.namprd11.prod.outlook.com
	(2603:10b6:3:115::25) To VE1PR04MB6621.eurprd04.prod.outlook.com
	(2603:10a6:803:124::21)
MIME-Version: 1.0
Received: from tx30imx-01.am.freescale.net (64.157.242.222) by
	DM5PR11CA0015.namprd11.prod.outlook.com (2603:10b6:3:115::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.21
	via Frontend Transport; Sun, 9 Feb 2020 03:00:27 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [64.157.242.222]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9decc5a1-777a-4079-24b3-08d7ad0c37a6
X-MS-TrafficTypeDiagnostic: VE1PR04MB6752:|VE1PR04MB6752:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB67523DB661D421E3FF895C1DE21E0@VE1PR04MB6752.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 0308EE423E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(189003)(199004)(478600001)(4326008)(6506007)(316002)(2906002)(1076003)(6666004)(86362001)(66476007)(8676002)(36756003)(6916009)(5660300002)(52116002)(66556008)(26005)(8936002)(44832011)(4744005)(66946007)(6512007)(16526019)(6486002)(81166006)(186003)(81156014)(2616005)(956004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6752;
	H:VE1PR04MB6621.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PpL0f1fPAeYHZ1RQ9o7rdLv+WtUcsddYQ9UoFP2mTJEM7N5bbDr+x/7HNFkpK27AY1/BM/Qx1JAfpXuOKfdWE/bSItGZMGopn7O6PqRpniwei04fgYz0SHrPFEez9lKlH0A8HKdTltR4BG5iplOQC9QxCWXQNOIchgJ4FzTK12tsSNkF2M6F+p8K/OtXCuyV2pWVBUwQ66ooU3nV7we+IIgPjypvRd6cEBeXuvo5Giv7hR92IBtLqa4XUbnQH59p36vM/H4sEwRNMuoSEqptfkqHCNsDA8D7YR1CP7eifGk//J9e52vWz0/0dMEsP0oBcb7xG+QQHxiN4sGvpcvPbFt/K1WgpbEMqojs849wiJoZkQGmfs20mgtL2305W5g58H/dPDOZHWvbtSFq4FiHdKPOV0Cz/dMJWGWxYot2+mo+GZJB3bLGZFM9YGC5n5mO
X-MS-Exchange-AntiSpam-MessageData: 4f5ugkopBigopPqSsE8pRyzlxZ9XkbNvGPqv8a5pOO3RRr+F3IOfSA8ThtyLzPe6UPKWZWSK7oiGdRh48595sAXd64CgzceWm0ju7LtZ9W9MVoaXANwgD8wVk5/ilWRuvyDStGsBItNE3V+Cygq7Xg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9decc5a1-777a-4079-24b3-08d7ad0c37a6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2020 03:00:28.3990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmqcvGHshvN8b2QSOz0pxspUESHDKd14MwWYNikartETKY3XEhfWi5BKwW/gxhcv4nPTNa6c+CD+9gp5IaboHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6752
Subject: [PATCH 1/2] bitbake.conf: Add wayland to DISTRO_FEATURES_FILTER_NATIVESDK
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
X-List-Received-Date: Sun, 09 Feb 2020 03:00:30 -0000
Content-Type: text/plain

nativesdk-wayland was not being added to the SDK. This fixes that.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2da7c5849a..a93099bf0c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -826,7 +826,7 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
 DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation wayland"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
-- 
2.17.1


