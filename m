Return-Path: <danc@opengear.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760087.outbound.protection.outlook.com [40.107.76.87])
	by mail.openembedded.org (Postfix) with ESMTP id 4EA6E7D597
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 06:15:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ZZAvgIg2t/iGMaPOyHhNhyB+0wBjC0UiSy6FFfVafWsdfkdSZKZVKIVtxRxBfKjB3dL3YYx9j9YNJ3tYlI58DLeLU9+QD6n1GDT8Nb0KKyp3W9HL81zfo+pbz1DoZskCbWdF+LaJCoO74R/Vwyt0QFIQWb4ijQPOs+UU2r8ywneAaz6xWu23Pj9QqQNchQS3mToRyr4L03M8/OLrwogvu+sJmGYMm4c7b/GiuPgjX4zorbm6vi+lgQHGCIiqIVZWo0lVAD+XEvydn9qz6b0VOaCc5dpec24AgV95XQO2w2LRHY1anE/47ShVM6spuzXnx2M70rCItmvFLuI4ScJa3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mXNsM5G8FoImmrCF6Qn8ZV8+DOXrT+URay/0trunnM4=;
	b=Z+LyLbFWYHzKUKPIgdgb1IbqxZP2lvz9tJWeAtnVWxeL0MRqXdubkmwSXr7zMg7QINr6KdJYdbJLR3/pkJGtqDpuNfbcz91jFoE3Kos7wzd4Pct/IV+wb2oNg6v8mA7aJuhpG0NYqnFOrRedKgR/vkcRra6yLynmNWLTHgT1uSugiEd/AY6ywM8QxF7+zzOc/6j6Be4lh+Ek2u6ZNhssGo8thc2uS6yQsuA2/K3PGxlw7DR/RzSXVGWcwXi9oR7PZzyuqOVqWHwsNGuk3GveCGOVsFHyIwM400EAnyluxQsm6Nh63MvQ9CfYPVu3+3Yj1hGTjm+OO93fPDEPQz0h2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mXNsM5G8FoImmrCF6Qn8ZV8+DOXrT+URay/0trunnM4=;
	b=jqjmIQZtTJk8nbthWB7mMyKIt+k3mK77V6QWw7qoFRVtxpF7q6Lne7eN8WQwhS3ebub4qXpaTexBeqlmdVZNHtgyH9oXrwfBsAiXswEmGc7vRN87cfGRZB1+ybl3IcpalVPj56BdHt3h8vTBlbDiBE9JrnTRwdiZc7Bj5UwOT+8=
Received: from CO1PR15CA0069.namprd15.prod.outlook.com (2603:10b6:101:20::13)
	by MW2PR1501MB2123.namprd15.prod.outlook.com (2603:10b6:302:b::31)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16;
	Tue, 15 Oct 2019 06:15:29 +0000
Received: from SN1NAM04FT010.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4c::204) by CO1PR15CA0069.outlook.office365.com
	(2603:10b6:101:20::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via
	Frontend Transport; Tue, 15 Oct 2019 06:15:29 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	SN1NAM04FT010.mail.protection.outlook.com (10.152.88.129) with
	Microsoft SMTP Server id 15.20.2347.16 via Frontend Transport;
	Tue, 15 Oct 2019 06:15:28 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id AAC92E84FC;
	Tue, 15 Oct 2019 16:15:25 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 7FDDF4294606; Tue, 15 Oct 2019 16:15:25 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2019 16:15:10 +1000
Message-Id: <20191015061510.21803-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191015054827.7103-1-dan.callaghan@opengear.com>
References: <20191015054827.7103-1-dan.callaghan@opengear.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(39830400003)(136003)(396003)(376002)(346002)(448002)(199004)(189003)(316002)(126002)(107886003)(8936002)(486006)(6266002)(44832011)(186003)(6306002)(36906005)(8676002)(26005)(42186006)(36756003)(70586007)(336012)(70206006)(50226002)(446003)(476003)(2616005)(76130400001)(11346002)(1076003)(47776003)(426003)(48376002)(51416003)(305945005)(4326008)(2906002)(6666004)(356004)(2870700001)(2361001)(2351001)(103686004)(14444005)(6916009)(7636002)(966005)(26826003)(50466002)(76176011)(5660300002)(246002)(478600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR1501MB2123;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0995617d-c531-4ab1-310e-08d751371365
X-MS-TrafficTypeDiagnostic: MW2PR1501MB2123:|MW2PR1501MB2123:
X-MS-Exchange-PUrlCount: 3
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR1501MB212309C122D1B776A99F5C34B8930@MW2PR1501MB2123.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01917B1794
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uLATEZ5hv7QfmPgra+pToOFYlQPfsI0D+A34/UkT/we5+84ijdaHfLUNEkV0igi+2OaAS5f+PbZzvlAWGVepOeskSsrfGopteYsOxgo3ZypVhnm6ZKryVEMyk+JuAy0Y5SPGlaNfDjVEIaT1KsbTRDI9mrcJzAGHYDOGusjrirETMMazSzVSlDv6Kih9t1nhO34nwS+xvS6DWHziMvTzUipHE93N+hRCPut+M0bIpaDgpwg868kbKKjSy023N+g5lHUuQj9doI3xPl2oBnibjk1kU9PHjSUVEMgNZ7SuL5ThuLn6+sIYSLkII8Cu0zou6Ewb3TgJ2+pzcoNMZM/lXH8J+3weyQ3HoAwVGAuxD1DbKyoqvNNWgoggkaqdHH7g1bx9fexMfk5NhtBKwmWBPWfu7WaugT0p9LFL29gcZbY8DaoZVRjiWFoaS4GgiV2yO1hVDhHAoCuJOfjQOrnknQ==
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 06:15:28.2578 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0995617d-c531-4ab1-310e-08d751371365
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR1501MB2123
Subject: [PATCH v2] elfutils: add PACKAGECONFIG for compression algorithms
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
X-List-Received-Date: Tue, 15 Oct 2019 06:15:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Elfutils has optional support for bzip2 and xz (lzma). It uses
this for decompressing embedded ELF sections like the .gnu_debugdata
section for "mini debuginfo":

https://sourceware.org/gdb/onlinedocs/gdb/MiniDebugInfo.html

Previously this support was unconditionally disabled but the reasons for
disabling them seem to no longer apply. Both the target and native
variants of elfutils can build successfully against both bzip2 and xz.

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.177.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.177.bb b/meta/recipes-devtools/elfutils/elfutils_0.177.bb
index 78c3791936..86e76d706a 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.177.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.177.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://sourceware.org/elfutils"
 SECTION = "base"
 LICENSE = "GPLv2 & LGPLv3+ & GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS = "libtool bzip2 zlib virtual/libintl"
+DEPENDS = "libtool zlib virtual/libintl"
 DEPENDS_append_libc-musl = " argp-standalone fts musl-obstack "
 # The Debian patches below are from:
 # http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.176-1.debian.tar.xz
@@ -46,8 +46,12 @@ SRC_URI[sha256sum] = "fa489deccbcae7d8c920f60d85906124c1989c591196d90e0fd668e3dc
 
 inherit autotools gettext ptest
 
-EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
-EXTRA_OECONF_append_class-native = " --without-bzlib"
+EXTRA_OECONF = "--program-prefix=eu-"
+
+PACKAGECONFIG ??= "bzip2"
+PACKAGECONFIG[bzip2] = "--with-bzlib,--without-bzlib,bzip2"
+PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
+
 RDEPENDS_${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils"
 
 EXTRA_OECONF_append_class-target += "--disable-tests-rpath"
-- 
2.20.1


