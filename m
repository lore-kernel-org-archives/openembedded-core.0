Return-Path: <danc@opengear.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820040.outbound.protection.outlook.com [40.107.82.40])
	by mail.openembedded.org (Postfix) with ESMTP id 9A3C47F4A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 23:33:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=dFqYv04czbYYDp+xkjGMZUGfAcRMlXUKpPocHDs5uSB41cPa/S0spz1oALRAv+ht8Dl3xcDtcH1fOIzS6a7H6fZoEBttJAQJ5Q0PYgNkjgNHXYKeu4QTImFOe3NiOGb4uKIEQkRBXuv8mC3IQjhxLYBUnMX6i54qcXkpNDyIBxRveiriaAxtkt8QmzoZe7ivt59HJ/3W1u/hT+OjcV8SbiCgJ2EoNc/l/Rs2iGv5q4Lmvre9rZTckehWX1eeX5SX6vFtQ5YfEWn1PsnL8I4bzibv0HzIe75XtRnGYpVTrqJfPV4ZijTgO0LS0iXiZ9jU+OQaN3mD+2LBK9c0SMhxGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=I8QtpUPEJLKOKte/hmF8Ep0/SHul48eUgNRzpv4eVSc=;
	b=jkV8tni+bM6O+2QmwUHVVyVaVpZGSLkbYF3uxY4GqIr7kiHNwrBzZeo7w6AHNBbfmC+/iEmPFTvY0/TD7qamNWl2E+LdsLmtaQx3VwuGnLwxAtE/DtZgyLu1+cXwaZS5meMBZjxGfi/6fGxqbOQjyKRaCdVsuo5Ge01pIrbdcEVCeXwRpmM59M3TYKzKznzLobm843rzBYwIPl63pWGoPK7vm2SzxnIUBd0M5nibOe7xvkS3YKbW05YDYUF2gve0lRcnTnyr872hwqMmfhEaesnbF+146QjkwANP5TclzVVDC/GPQ7j9R3F/E8hZVc0WHSaRsjY/SoNb+jy/Xxkzeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
	60.241.24.90) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=none pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=I8QtpUPEJLKOKte/hmF8Ep0/SHul48eUgNRzpv4eVSc=;
	b=gpkt1rhxNlLmPHrZsBxynp/mCTh/6dE95VGxV/N0Qp7idn0wD9N0aZFIkshiaoCG2VJB/V9uQN23GsFYeCbrM9yLubHZqofykKRp6JT7q/trkyumg9cisY9WeRE2/I9WrzurRnPJ9dCPYcEA8aO1Z4u9HGsnhwZQw8DaHFsIg1w=
Received: from MWHPR15CA0049.namprd15.prod.outlook.com (2603:10b6:301:4c::11)
	by DM6PR15MB2251.namprd15.prod.outlook.com (2603:10b6:5:8a::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16;
	Tue, 15 Oct 2019 23:33:12 +0000
Received: from SN1NAM04FT061.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4c::200) by MWHPR15CA0049.outlook.office365.com
	(2603:10b6:301:4c::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via
	Frontend Transport; Tue, 15 Oct 2019 23:33:11 +0000
Authentication-Results: spf=fail (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: Fail (protection.outlook.com: domain of opengear.com does not
	designate 60.241.24.90 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=60.241.24.90; helo=postman.bne.opengear.com;
Received: from postman.bne.opengear.com (60.241.24.90) by
	SN1NAM04FT061.mail.protection.outlook.com (10.152.89.201) with
	Microsoft SMTP Server id 15.20.2347.16 via Frontend Transport;
	Tue, 15 Oct 2019 23:33:11 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id B4E2CE84FC;
	Wed, 16 Oct 2019 09:33:08 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 939754294606; Wed, 16 Oct 2019 09:33:08 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2019 08:44:56 +1000
Message-Id: <20191015224456.22136-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191015061510.21803-1-dan.callaghan@opengear.com>
References: <20191015061510.21803-1-dan.callaghan@opengear.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(39850400004)(376002)(346002)(136003)(396003)(1110001)(339900001)(189003)(199004)(186003)(305945005)(7636002)(336012)(11346002)(105606002)(426003)(6916009)(26005)(107886003)(446003)(6266002)(6306002)(2361001)(2351001)(50226002)(966005)(2906002)(8936002)(26826003)(50466002)(2616005)(70206006)(4326008)(478600001)(70586007)(486006)(51416003)(126002)(14444005)(76130400001)(76176011)(2870700001)(103686004)(36756003)(47776003)(1076003)(246002)(44832011)(356004)(6666004)(476003)(316002)(42186006)(36906005)(5660300002)(48376002)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR15MB2251;
	H:postman.bne.opengear.com; FPR:; SPF:Fail; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01a8a4cd-13a0-49c6-a616-08d751c80aea
X-MS-TrafficTypeDiagnostic: DM6PR15MB2251:|DM6PR15MB2251:
X-MS-Exchange-PUrlCount: 3
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR15MB2251B687A8B47D3827698C01B8930@DM6PR15MB2251.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01917B1794
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzB9qwoN3MMDZI5mZwdnKoFfjfOLCyRZ3zHTRlFSCnyC/e2R4X5RSSTxd0ut/tYnM7CUKojmQEphwiUhgCVanr67p9GAKgW2Hd/nWuDvRZirMjvk/hiLRxeOvBfYrrTWAN0WuHuxFl7AKXMXCspoGuz0Y2uhTbCjzbykPaiarc06luErW4fTXkkg+RNcqdU8m6HEmtpFn8UfYgTOPoxfI/jAB6DvTFORrhdGcI0vYHhGv2qKzQp4nibnAJMazNkaV/SJMG2kdMlCtqRivp3brUO/tWUTw285YDDEO3e7ENTDq8JshAx4+xti0IwtG44Jp9Z+xv5oBIVlx+WQObYIx0MMW50h0Ud3UovdkXBdNsMRQtM6s8gqdmsik0OPp7f4dbTy1c/1xK9ucwKfnWP5YZk+jyCn8X7M09Zdh57Rc8tjP5r4IN3vcP6Y/98Vb+Jz14Cu7uv9CDCWnzAjbvVMXg==
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 23:33:11.0600 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a8a4cd-13a0-49c6-a616-08d751c80aea
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB2251
Subject: [PATCH v3] elfutils: add PACKAGECONFIG for compression algorithms
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
X-List-Received-Date: Tue, 15 Oct 2019 23:33:12 -0000
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
 meta/recipes-devtools/elfutils/elfutils_0.177.bb | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.177.bb b/meta/recipes-devtools/elfutils/elfutils_0.177.bb
index 78c3791936..f050577c0d 100644
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
@@ -46,8 +46,15 @@ SRC_URI[sha256sum] = "fa489deccbcae7d8c920f60d85906124c1989c591196d90e0fd668e3dc
 
 inherit autotools gettext ptest
 
-EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
-EXTRA_OECONF_append_class-native = " --without-bzlib"
+EXTRA_OECONF = "--program-prefix=eu-"
+
+DEPENDS_BZIP2 = "bzip2-replacement-native"
+DEPENDS_BZIP2_class-target = "bzip2"
+
+PACKAGECONFIG ??= "bzip2"
+PACKAGECONFIG[bzip2] = "--with-bzlib,--without-bzlib,${DEPENDS_BZIP2}"
+PACKAGECONFIG[xz] = "--with-lzma,--without-lzma,xz"
+
 RDEPENDS_${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils"
 
 EXTRA_OECONF_append_class-target += "--disable-tests-rpath"
-- 
2.20.1


