Return-Path: <danc@opengear.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820081.outbound.protection.outlook.com [40.107.82.81])
	by mail.openembedded.org (Postfix) with ESMTP id 1D52C79B57
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 05:48:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=oQuL4xCkhBAZ2Ykh9AsvhJ0QLlt0AAk6kAgqQqLXEMldw7zRs0hueJ5/pppPjhEmKkrJyS4PzdkyzHGrEhWEa3GSB0dmuqCnDehA24AnhpJ11s2mGcLfmnSaYWjNk5pBSu5AM9aUAiNgr06xH+cLXqxcGscMXUelqjcK47rHz4S+dK2JfIoeKwM4xGl4Gwc8BqKAoPXYz9L0SuH5oKf3Xy8vbLjjmv+6dlA0EttyQYcfPCkX8GLb7jvDywI4ysJVmte1SP3FYSuVJohmGgJfpABfO5KItNWqExS+iPrfyxXpzH38yJa9tIsAl6bZdoMu2QzBrUFZQ41l+DO21s0b+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=FWFOVkZs4z58FZnNt8NgU8AZE4GPs2v60QInw0bqm1Q=;
	b=kjeZjyTHSIkSyW1NW+t61Mx3K43rEzqIkGfXyjmN4V1MJvQ1h27O6DllWSCCfrgcE83Wxp6vwmIVeoioJxSf1eraR60N/5lWiry8XIO5lYeCWWKIbg/XJ9mlqgXPp/J6aU0WxVRhIXrVSqjjqJAeCPwNlQNCqrtozOhLGzAV3xM9mIcLrMoEnmjbeGoaqtlX1vsWRV8iSygz9twLGi/h9a/PRT5/cKfdWPgWczoKphVuqtUnG/CRAM2Yg8nQYS2y7pQx/HCkRSO696JOyFnC6lXAGqnmRLzhbfBRp/SBAxorWkaq5MrRmSPrwpScA6or95Zr8UyX1AzC1WgFkgdn3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=FWFOVkZs4z58FZnNt8NgU8AZE4GPs2v60QInw0bqm1Q=;
	b=l+QXBYUpBTYGiIPYEC1rR6Ae0F44aUl6Z57Xkq6/z2bEGJ7ktRIa/oSk+qAVKof5vP+tuIuChN5sX0fzgzAq7RIl191dH/XzZOP+1UEv9BEp6ASoDQLduhSYCzT51XUipoXbAG6y1e5nQVTgTMUs5PbSDHKUEJAZUiVhnwvNOVs=
Received: from MWHPR15CA0028.namprd15.prod.outlook.com (2603:10b6:300:ad::14)
	by BN8PR15MB3009.namprd15.prod.outlook.com (2603:10b6:408:86::28)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19;
	Tue, 15 Oct 2019 05:48:41 +0000
Received: from BN3NAM04FT030.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4e::202) by MWHPR15CA0028.outlook.office365.com
	(2603:10b6:300:ad::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17 via
	Frontend Transport; Tue, 15 Oct 2019 05:48:41 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	BN3NAM04FT030.mail.protection.outlook.com (10.152.92.164) with
	Microsoft SMTP Server id 15.20.2347.16 via Frontend Transport;
	Tue, 15 Oct 2019 05:48:40 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id E341CE84FC;
	Tue, 15 Oct 2019 15:48:38 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id C5A8F4294606; Tue, 15 Oct 2019 15:48:38 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2019 15:48:27 +1000
Message-Id: <20191015054827.7103-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(136003)(376002)(39840400004)(396003)(346002)(448002)(199004)(189003)(2361001)(2351001)(4326008)(966005)(2906002)(14444005)(2870700001)(48376002)(36756003)(103686004)(47776003)(26826003)(5660300002)(1076003)(50466002)(6666004)(356004)(8936002)(126002)(8676002)(50226002)(478600001)(486006)(476003)(316002)(107886003)(42186006)(426003)(76130400001)(6266002)(2616005)(6306002)(36906005)(246002)(51416003)(305945005)(7636002)(26005)(70586007)(186003)(336012)(6916009)(44832011)(70206006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR15MB3009;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d83db8f9-f6e4-4db8-6bcd-08d751335535
X-MS-TrafficTypeDiagnostic: BN8PR15MB3009:|BN8PR15MB3009:
X-MS-Exchange-PUrlCount: 1
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR15MB30090B4A142B29F827D1E61AB8930@BN8PR15MB3009.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 01917B1794
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KZUtL++rqUJhfsVhb/dQiFWJPsO6BrDW0nASYkWy8bi8WrPsKZ8VzpN/hdF0o9I0VwS83oOAfAnEDo27jcr4c7HctY67mMjOF+xthDJHB2kPziS/PYy8D5Fq+azmc1ruaYd0+AIp6D8XruC8rQSX2+/3aUurkH6oLmtZjy3vmTtUFZZNa0yBzhirDwBCSmTAoqVRStQmqu6vCAWcvbRrmEePv6YdTO5ngNWYtr2A9GGCb6BfBQV84l7XUyC0j3fva8X2gysQjGhOcsvD+0LPYZa6KeYz6Y+OV8JV9UjiyL8v+nXnTbS0MNUSQFExE87LpXvbldyDEIWJtExQQwyXu9FJ9tSxSBG+hViQmPAD8WYISaPcV6cAdy1fyA1T/MFekL9NaUbN5vYnbK72YjMwe3OFMuK3+OeHRmKylr/AVaMuxn/ypws/ALzBjuy03HbdPB1G8Ue0QddefiEho14KWA==
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 05:48:40.6347 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d83db8f9-f6e4-4db8-6bcd-08d751335535
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR15MB3009
Subject: [PATCH] elfutils: add PACKAGECONFIG for compression algorithms
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
X-List-Received-Date: Tue, 15 Oct 2019 05:48:43 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Elfutils has optional support for zlib, bzip2, and xz (lzma). It uses
this for decompressing embedded ELF sections like the .gnu_debugdata
section for "mini debuginfo":

https://sourceware.org/gdb/onlinedocs/gdb/MiniDebugInfo.html

Previously these were unconditionally disabled but the reasons for
disabling them seem to no longer apply. Both the target and native
variants of elfutils can build successfully against all three
compression libraries.

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.177.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.177.bb b/meta/recipes-devtools/elfutils/elfutils_0.177.bb
index 78c3791936..ff033d287a 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.177.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.177.bb
@@ -46,8 +46,13 @@ SRC_URI[sha256sum] = "fa489deccbcae7d8c920f60d85906124c1989c591196d90e0fd668e3dc
 
 inherit autotools gettext ptest
 
-EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
-EXTRA_OECONF_append_class-native = " --without-bzlib"
+EXTRA_OECONF = "--program-prefix=eu-"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
+PACKAGECONFIG[bzip2] = "--with-bzlib,--without-bzlib,bzip2"
+PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
+
 RDEPENDS_${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils"
 
 EXTRA_OECONF_append_class-target += "--disable-tests-rpath"
-- 
2.20.1


