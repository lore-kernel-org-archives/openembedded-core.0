Return-Path: <chris.laplante@agilent.com>
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680069.outbound.protection.outlook.com [40.107.68.69])
	by mail.openembedded.org (Postfix) with ESMTP id C1D667FC37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 19:05:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=SX+eThyWS/rKR5mrL8xKWWjfhom2vX18+v1sFX5bb76JBp56FHOltqmoqTDf8RxZa/aLQeJg+YklIXirlRoLV/ZB7nMkMytXFXitpz3XDWneULpjrIOIroRhL+phqV4tr20bTa40uZuPvIe1g0SFMc1M4xnzQdViCdekxUTCUaggaJPTbFwScNhcMie95ZtaZbcYxGehR2jM6WHLDzntj8gp8p8nZInAIPHTpzvXPhn1PQa+gwNIMvaDJuRZMLKzf60zw7fi7LKlCorbvcTDVMO0+NHcmaayG9BHdGjzIDyFb4wnNz3VTQHK67lvxPbomNJ/mPCQY+XArLr4R5u8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6okmc00jhBRxVNocen+u7o6ToaqlROcWLjFm+sVpOWo=;
	b=ETClbvYjRPSCbz66KJuBUCJx+dMXnHJrWCQgGA2UmkXeFCpFdPGxA3hw6PuVoeFYcVppjrPLOetY0+rPDSewrCbUUNy+8bcNmeXnReJ1SaJ5wX3Hta1f599h7bbW++he9tQALIbc4vxj9SDTSKMmEBCV2BjIsjqBr0ZT3mW2ts9ItHyaxV/NwB9UiOQr86P5qm9LgswxGasXY9dnrJjbuoTHyGr7UNDX/pGDyyebH8BPcfGcFPM3AcT9cYA7n7SccD5pH2NMNCZbjiPFF72lrY4p1Zoy4Y3y0TJ3pqCwK1WsOG1EDbj06hAYnqsdeJgkGzy7KJRcaAc1JLCz0U0xcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=agilent.com;
	dmarc=pass (p=reject sp=none pct=100) action=none
	header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6okmc00jhBRxVNocen+u7o6ToaqlROcWLjFm+sVpOWo=;
	b=AmjLEHn1wJjIx9oB3rSYnFVq0xTIs74ANVRIAECwv1YCSKQEuK6q0UYJpxTBrEy/VcPnOSqE4NCx7PWiyl5tl1Vyua7ySwFkWFJQBvXHUgTz/uIl+KTbK3N+PjC2IuM6GZJ0Ft0gLY9p35V887Wse2cJ6JqpqkXK9TkxI6Wy8RM=
Received: from BN6PR1201CA0002.namprd12.prod.outlook.com
	(2603:10b6:405:4c::12) by MN2PR12MB3455.namprd12.prod.outlook.com
	(2603:10b6:208:d0::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.17;
	Tue, 10 Dec 2019 19:05:56 +0000
Received: from MW2NAM12FT009.eop-nam12.prod.protection.outlook.com
	(2a01:111:f400:fe5a::207) by BN6PR1201CA0002.outlook.office365.com
	(2603:10b6:405:4c::12) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14 via
	Frontend Transport; Tue, 10 Dec 2019 19:05:56 +0000
Authentication-Results: spf=pass (sender IP is 192.25.218.41)
	smtp.mailfrom=agilent.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
	192.25.218.41 as permitted sender) receiver=protection.outlook.com;
	client-ip=192.25.218.41; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.41) by
	MW2NAM12FT009.mail.protection.outlook.com (10.13.180.76) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2495.18 via Frontend Transport; Tue, 10 Dec 2019 19:05:56 +0000
Received: from localhost.localdomain (192.25.126.27) by
	edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server id
	15.1.1713.5; Tue, 10 Dec 2019 12:05:48 -0700
From: Chris Laplante <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Dec 2019 14:05:29 -0500
Message-ID: <1576004729-18448-1-git-send-email-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Received-SPF: None (wpcosapexchedg2.windmz.agilent.com:
	chris.laplante@agilent.com does not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.25.218.41; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(346002)(136003)(396003)(39860400002)(29502001)(189003)(199004)(336012)(4744005)(246002)(956004)(44832011)(36756003)(6916009)(107886003)(426003)(8936002)(478600001)(2616005)(6666004)(356004)(186003)(7636002)(4326008)(26005)(36906005)(5660300002)(2906002)(316002)(86362001)(70206006)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3455;
	H:edgeappmail.agilent.com; FPR:; SPF:Pass; LANG:en;
	PTR:exch.smtp.agilent.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e365f14-d981-41af-2317-08d77da3fc49
X-MS-TrafficTypeDiagnostic: MN2PR12MB3455:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3455ABE1DFFA89AA3431450E8B5B0@MN2PR12MB3455.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-Forefront-PRVS: 02475B2A01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 62k3pVEhz0ihSrmPc+T+TLJbT716mEn634wsWUv5uwI1MO1NfdvgijhVvEh/VhVM0OnpU2DhlQlgZ3zTJkSXGB1a39xLkyfuITG0FsNwEqauoC6Y+4JlEcnksS/Ld/OylbdQ3iRnKrmQbUJrS1hBjQACdsDdXUgy/iq566UQqu6fV0PhsC1U6t+GQjurvkJ61d1inBq5Z4lRO0v9EdvFJOD1gl3Qxjs/oz9dpfrT03rvLyugS+VwaIY6ws2RkHtJCRGZB0iBNHNrpb/9p4PSiHvkZtMWNufZq6/+LDWu+6nSUUV2jcvNSUh1b8KOvPBlWIypNzj/2LnNjr+Yne6aund0/dRcR113xWqJL/jyfKjJc5EHUs1vprrFi6ImuWC2aL31ovh+zxtgKpehkSCcq20OG33UPXYOvpZLxFRJoCsmbXb9GRviATv6Nf0oPyvoZjqauKlHUY6NhVVLI31THepE8kXvljK4u0ZXWfZ2yQ1ho/U99KrIieJE9S7PgMum
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2019 19:05:56.0796 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e365f14-d981-41af-2317-08d77da3fc49
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
	Ip=[192.25.218.41]; Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3455
Subject: [PATCH] bitbake.conf: add number_threads to BB_SIGNATURE_EXCLUDE_FLAGS
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
X-List-Received-Date: Tue, 10 Dec 2019 19:05:58 -0000
Content-Type: text/plain

Just as BB_NUMBER_THREADS is in BB_HASHCONFIG_WHITELIST.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e75bbce..394484b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -884,7 +884,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
     file-checksums python func task export unexport noexec nostamp dirs cleandirs \
     sstate-lockfile-shared prefuncs postfuncs export_func deptask rdeptask \
     recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename lineno \
-    progress mcdepends"
+    progress mcdepends number_threads"
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
-- 
2.7.4


