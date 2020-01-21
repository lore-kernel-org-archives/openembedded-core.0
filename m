Return-Path: <danc@opengear.com>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA017FC4E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 01:24:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=couJzOdBIMjMFgomWXHCDKX2ngeA2lpsGYtF6TVukxsiInIZUO9byTXZvjR2CrXRWJFiPmEipc9F8z9vl3g0UZ/muxTGjH7L/zTY9GLFaftqlSmd8ch+fUsrqKPUcy1YgwB82y5rDm4QpGOQnPdVMC5E+fWKswpIOJLSeELOjHMbUB7J/PuXwQ9s1Wya+fvedd2bej3YDOxRHw4SX4fbTwdrPWjpTLvw76KZwfIbfSTfTNyO8vbVswgATNCA8chuBeZTN3eDh+y/xbgz0+SXMfz/ddSFxhUToZNmIEVVND4d7yJVPrFmu9juc+t6jKxWmVJcGr/tUQMQhfme1QeT2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jElTHFi8AXWJwXLJwagkXW3KxOXaSnsKWYfJG3okdks=;
	b=FcaNzbT2tMQWl6z9d1aYjku2qhM5Jqy9jVehxuTzTgXRakq/Kpt0WhYfEVBTk5QPJ7o43m2OKKS0zWv4Ff3U6mpAOr2hLu9F8tCMsKarg0lAFOPNpbDkUDEt8PBMEm/aN8qP/PiwvSq7qiEyaIhFuF6ROBgarC+1/8O14zTehjTsh5rbnRnSKBahvtZ6KjJrrCnRI8xtQpWzOOgImJQ2REkpPcYNz5krZuDmlMHA8nk7jS4hbSEeREgoqztlZDhHGx2vWS6vJU/HnmtlCKnec64PLtqfdOsA49da0jnB9c+iEoN5PeRMW9/LThvqR4SeoOmiBT0w3CSLFfnc71rXdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	60.241.24.90) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jElTHFi8AXWJwXLJwagkXW3KxOXaSnsKWYfJG3okdks=;
	b=A3Jq8D/KT3f504FyOQWJ0TFpjgo7Bgvt9bVKCsxxbjCP6ECZDs1NyJvydRvOJ4H9OdxfkEevLeW7oVUYxfr8jJaXhk4zN36LEtg2gfO6Z3bkjaM4PJaRx7hLUxorHujroB7x3v12o+AP1jAGkNA35WEVtEmSVpJ5bRI9tK9H3/s=
Received: from MN2PR15CA0060.namprd15.prod.outlook.com (2603:10b6:208:237::29)
	by BN6PR15MB1441.namprd15.prod.outlook.com (2603:10b6:404:c4::21)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20;
	Tue, 21 Jan 2020 01:24:23 +0000
Received: from BN3NAM04FT033.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4e::207) by MN2PR15CA0060.outlook.office365.com
	(2603:10b6:208:237::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18 via
	Frontend Transport; Tue, 21 Jan 2020 01:24:23 +0000
Authentication-Results: spf=pass (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=opengear.com;
Received-SPF: Pass (protection.outlook.com: domain of opengear.com designates
	60.241.24.90 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=60.241.24.90; helo=postman.bne.opengear.com;
Received: from postman.bne.opengear.com (60.241.24.90) by
	BN3NAM04FT033.mail.protection.outlook.com (10.152.92.165) with
	Microsoft SMTP Server id 15.20.2644.19 via Frontend Transport;
	Tue, 21 Jan 2020 01:24:21 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 969F7DEBA6;
	Tue, 21 Jan 2020 11:24:20 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 843F842945E4; Tue, 21 Jan 2020 11:24:20 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2020 11:24:12 +1000
Message-Id: <20200121012412.6495-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200120234818.13068-1-dan.callaghan@opengear.com>
References: <20200120234818.13068-1-dan.callaghan@opengear.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:; CTRY:AU; EFV:NLI; SFV:NSPM;
	SFS:(10001)(10009020)(4636009)(136003)(346002)(396003)(376002)(39850400004)(199004)(189003)(5660300002)(478600001)(26005)(186003)(336012)(966005)(6666004)(356004)(1076003)(2906002)(4326008)(316002)(42186006)(107886003)(426003)(6266002)(2616005)(44832011)(70206006)(6916009)(70586007)(36906005)(246002)(7636002)(36756003)(8676002)(8936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR15MB1441;
	H:postman.bne.opengear.com; FPR:; SPF:Pass; LANG:en;
	PTR:brisbane.opengear.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56e0d6f6-1743-44ad-a81d-08d79e10a52b
X-MS-TrafficTypeDiagnostic: BN6PR15MB1441:|BN6PR15MB1441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR15MB144115D8EAF0D05C6FAC75C0B80D0@BN6PR15MB1441.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-Forefront-PRVS: 0289B6431E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nlKorFPE1s52NILoPmze8ToEstUOR8D5H1ug3ZRNzap0L4Nw458l67A5AtQpkO5J29IzQpT5C57xTDMn6MD1Qur5O6OURlz7J5xA2cX0zALC8qvgrKJkJSyRb8PFNIo5dVU+5s5iBwkkiP56FDMazKMDVYF5GpBb2mAyUqi6u8LA7XlPabI3lUVLBQu8nOxJ8doAhaXEjeoECTMB5B3a8YptcOjN5ITELERdsZNPiL4JELSIvk7fB0TPx9anq9NMPOr3tXnJDC8lZ9+3FQ11JYaBVBv4baHj4nYpkT6KZagRMX4o0oO1co6jFqpTpgA7H6zxtmqw8fonAYwtzsi86vRClgFeBOcAtF6wpIJHOl84yubaCK9mntEgBYwE4BdW0POWWy7dS1Dd4NE//kyU7LycZCDbElHcwI4HMhCvUMnwjuAiSbXyt/pJuoxT+L7xRJyC/opnK0AlqlqwLQ5mxdRARAFk7Ry7gpBY+V28icQfubRBcLAjd+2wO7zj5TnwaIexgzEJAe03mUbTmjLBN3CPIsdS2NDB3ZOePhay4ynyLgJZ5jI7dgE/cDV1v2g+wf8Z/z0N71GGlgwtBfxEUXlTZR4HKUhl97QuEofJUfCTPTyPKPJbrxuBZQPxMOUF
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2020 01:24:21.9443 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e0d6f6-1743-44ad-a81d-08d79e10a52b
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR15MB1441
Subject: [PATCH v2] gdb: add PACKAGECONFIG for xz (lzma) compression support
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
X-List-Received-Date: Tue, 21 Jan 2020 01:24:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Similar to elfutils, when xz support is built into gdb it will be able
to read xz-compressed ELF sections containing debuginfo. This is used by
the "mini debuginfo" format:
https://sourceware.org/gdb/onlinedocs/gdb/MiniDebugInfo.html

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 08f615addf..878a03715c 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -21,7 +21,7 @@ EXPAT = "--with-expat --with-libexpat-prefix=${STAGING_DIR_HOST}"
 
 EXTRA_OECONF = "--disable-gdbtk --disable-x --disable-werror \
                 --with-curses --disable-multilib --disable-sim \
-                --without-lzma --without-guile \
+                --without-guile \
                 ${GDBPROPREFIX} ${EXPAT} \
                 ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)} \
                 --disable-rpath \
@@ -37,6 +37,7 @@ PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python
 PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
 # ncurses is already a hard DEPENDS, but would be added here if it weren't
 PACKAGECONFIG[tui] = "--enable-tui,--disable-tui"
+PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
 
 GDBPROPREFIX = "--program-prefix=''"
 
-- 
2.21.0


