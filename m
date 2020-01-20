Return-Path: <danc@opengear.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr770047.outbound.protection.outlook.com [40.107.77.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9BB7FD8D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 23:48:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Qnprwlz3dV7z91QlWmrJmFL7UdBXQGqnxFHWUp+lPjwH13EYj+W6gFtA+JbW5RlxwsbYxUJ6kk/drG0pdtqJ5R2jxoevh1L0WFqnct8P0uIfET+JVfRH/4mGOEWL4Im4Y180d5CPwA0H1vHVcWx+SCmUpZIDZI7xV2GL1aEy3FxQ+UqGKCEtBZGALCZm1CRDFQuJGMPXrpq7Muux7sVDzgE8x+bHY0ijnyJEKOgISEJzAVn0ryJJ8+lLigJItG0dt/6IIRklAsC1lFG6EGoi5X9itMjw7f4FtlGMtW9DqQkaTCSUNdUh2OjpqP9GuE+Bu2K+3QcWFvF2w7F08N6qJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1tMNiTnhD45MdOli+4tIENuGwXkTljK5/lbotrzx504=;
	b=RKBfbN9k40C3oyAm72Dh0cerGX2h8kVikPXLzuNq11HK/go8X9JX/2wNA6A5uxTLP8Ji2oKqz660XIzGj59Jo34vn2m2/FxnKdcmsPogdJYqbjHuQphcdJ7DKsFnBdAEs80mU0qr+2h/Mtz7byUnxWMAaop3yyz3sXT30oSLqRQ4UKCmfPKzI+MTbZVLoeRmNiSurhYk58X9cwsXcR9jIXlcdV3iMbSAiZy91sq723rjnPyYEb5H+3OTVR08DA6Pd+zHhtZRxnZJPs/l81EYymkOQ5QyCfviibmFExrMVonq4B4P4IImGz0xgorYhe9o7Kj71UyWSm+PX99E3m9tTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	60.241.24.90) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1tMNiTnhD45MdOli+4tIENuGwXkTljK5/lbotrzx504=;
	b=z1bkB+tuY3rIrzEm8CrUpFoKxIcIYDFkjVOGFwfgdsDn0IDwWVXtaNZPnj5hpYP1/PEov2YNi+iqoYjHnCh86TVT/FsAMzZszEdpWyoq7iQlp0MArqW42vTTGMCqB9SeVeeLLSFpm/e109zZiO/2XzS9I+oBVJ50mR33MDATyUM=
Received: from CO1PR15CA0069.namprd15.prod.outlook.com (2603:10b6:101:20::13)
	by BN8PR15MB2562.namprd15.prod.outlook.com (2603:10b6:408:ce::12)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.24;
	Mon, 20 Jan 2020 23:48:30 +0000
Received: from SN1NAM04FT056.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4c::203) by CO1PR15CA0069.outlook.office365.com
	(2603:10b6:101:20::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.18 via
	Frontend Transport; Mon, 20 Jan 2020 23:48:30 +0000
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
	SN1NAM04FT056.mail.protection.outlook.com (10.152.89.39) with Microsoft
	SMTP Server id 15.20.2644.19 via Frontend Transport;
	Mon, 20 Jan 2020 23:48:29 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id EC82BDEBA6;
	Tue, 21 Jan 2020 09:48:27 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id C9EB842945E4; Tue, 21 Jan 2020 09:48:27 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2020 09:48:18 +1000
Message-Id: <20200120234818.13068-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:; CTRY:AU; EFV:NLI; SFV:NSPM;
	SFS:(10001)(10009020)(4636009)(346002)(396003)(39840400004)(376002)(136003)(189003)(199004)(44832011)(42186006)(1076003)(316002)(426003)(478600001)(186003)(26005)(336012)(356004)(70206006)(70586007)(966005)(6666004)(7636002)(6266002)(5660300002)(107886003)(36906005)(2906002)(8676002)(36756003)(2616005)(4326008)(246002)(6916009)(8936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR15MB2562;
	H:postman.bne.opengear.com; FPR:; SPF:Pass; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef235417-c807-4e00-be00-08d79e034090
X-MS-TrafficTypeDiagnostic: BN8PR15MB2562:|BN8PR15MB2562:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR15MB2562025DDBE0A93B2C5FEC43B8320@BN8PR15MB2562.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0288CD37D9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x0Y2csPyhbfeGWL5dOt4s0u0VNRJO04OU7ViAJJiLpZM3TizdJ59fRfIKyfDIZC0W3r1F6bslugFzEHsY3iyAhw/Qmlvtiu0twCVkHLcHMObEI8HiR8BX8FKJj94cEHHO5EHxHqMuG80M0Ehpr4utXoULcDCEfQmllyxIA29rxI3oOnPRtdbh0oHFnBUxTLaKRD0IW6vKNzeePxYuCarwL67ufDuGLsGOOLq8mh+2Kcde2dotqIu8feC+pAfVGlZpXgGTxx9/bmK9XNJEv+d8cK4hcjXFHgQ6DleOD1Lg4Dkq0+o7nGnW31/7Q5hmrCbcXNeOsgoqjhWpDpl/R09JzjsSWU+yn2C16ntYgaW7eV2lWRasoXgNdSiuOwl4d2RDlTCcgNxjEeYL4WfDfNIJudqtH3AYSwNN8WAVUTjsWjgU7yis8avKUO243AShJlUQL/Bgye7WDVpv9QzaButMKRPB0XPx6CYI5zP9pOO4uh6Xp/GUjfOvUJYFgyCdiRA37+lsHjcfivx5q7PRQ+A0IHa2LdGQWDlpf7q50Ln3t6uc4FEPdN/JmYtZYMzbMsm+uGa6HiUH+pQadDVBroVn3zpM1sv91gzSZKJk9eQmuhvr5u515Q7Y3ENFudY5YSD
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2020 23:48:29.7529 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef235417-c807-4e00-be00-08d79e034090
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR15MB2562
Subject: [PATCH] gdb: add PACKAGECONFIG for xz (lzma) compression support
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
X-List-Received-Date: Mon, 20 Jan 2020 23:48:32 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Similar to elfutils, when xz support is built into gdb it will be able
to read xz-compressed ELF sections containing debuginfo. This is used by
the "mini debuginfo" format:

https://sourceware.org/gdb/onlinedocs/gdb/MiniDebugInfo.html
---
 meta/recipes-devtools/gdb/gdb-common.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 08f615addf..5d670561b0 100644
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
+PACKAGECONFIG[xz] = "--with-lzma,--without-lzma"
 
 GDBPROPREFIX = "--program-prefix=''"
 
-- 
2.21.0


