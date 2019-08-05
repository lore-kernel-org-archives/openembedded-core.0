Return-Path: <danc@opengear.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740070.outbound.protection.outlook.com [40.107.74.70])
	by mail.openembedded.org (Postfix) with ESMTP id 941F06C10F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 01:14:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=XUvxaf12AOMU5Am3kG4PgOWC2mnMnX5AhgFB0rq5q1u1rtRBCpsDz1AMCSMp7H5YiifyoP+IZHmq+57Ry9GOocYfPHjkxOFh9RILvNr1EtkJwy97xhd6ExeuOT2NUrkNwDV1a/iImydkSP/vaOrIm66HJbdNDZWIWH9NgZ9/4834jrc3Ye2NVYn8PTDYV/jkplyFwoHRakRZS13QymNe/8rPFtgrbivXD46gujtcnW6i+rYJt3I//Anm7FyVx+MvS9W8UZX6QgT2s85v2WLKJZDktFVlctHVSHrQVJ8Nf1dMcJxqV7hvf022UzVWbyUxSSpv2KlDsty9bVlMAC3v/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=f1dBDoczXWx1S1B65KwFE5KMksEPAvWAP/GULqD+WOA=;
	b=AAoglYMmawWvoJqzcuDmy/bEjVDtzaAXxIbJaNQG9jDCNvvdmfH7ZUE1kEyllbiXHZYudKLiFnOW8NFk32ykAgjgAKW8YOVEp5BvZCnHc94UwxisdBRvoxaQz1FPuT91f8TqPjKEw+jOpFLdOpYp4Y6pUDRX08NTjbxDBrqfqKDdwQ9+M/tVAoVD5DlodORz9bYDYswc9gwAaZOIC8nYmXnNOcdIzC+B1nAggo+Bbvqo8EC7BKE+rnbdMeHtDTlDPI+ABLYRtov9q2v31qXm1LrzBTvLV2u7LvzKAf8qE9LBW+0xmEuXQuKywm40nfBioQ4EjiZSG3Fn+SMEL3GOjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=permerror (sender ip
	is 60.241.24.90) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=f1dBDoczXWx1S1B65KwFE5KMksEPAvWAP/GULqD+WOA=;
	b=mjYycvJeSiuF2zw9vNR8ueWdxCnAE/U6l7BCHw0dNgxNu5hqESyYDyn/TPIfzrSTW1bNfM3LwpgqCMp3jUv1AWGSEZlH9pMlycwRJNF/T68Aa1/UaWRiIHPcU7krFLc/SlUQEz+z6pL+HCJdeiJRDePLuNC881aNnEMS4k/jdKE=
Received: from BN8PR15CA0021.namprd15.prod.outlook.com (2603:10b6:408:c0::34)
	by CY4PR15MB1944.namprd15.prod.outlook.com (2603:10b6:903:112::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16;
	Mon, 5 Aug 2019 01:13:59 +0000
Received: from CO1NAM04FT061.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4d::201) by BN8PR15CA0021.outlook.office365.com
	(2603:10b6:408:c0::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.17 via
	Frontend Transport; Mon, 5 Aug 2019 01:13:58 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	CO1NAM04FT061.mail.protection.outlook.com (10.152.91.130) with
	Microsoft SMTP
	Server id 15.20.2136.14 via Frontend Transport; Mon, 5 Aug 2019 01:13:58
	+0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id D646FDEB2B;
	Mon,  5 Aug 2019 11:13:56 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id C5C8B42CD5C7; Mon,  5 Aug 2019 11:13:56 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2019 11:13:53 +1000
Message-Id: <20190805011353.15425-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(346002)(136003)(39830400003)(396003)(2980300002)(448002)(189003)(199004)(246002)(48376002)(8936002)(47776003)(316002)(8676002)(305945005)(42186006)(36906005)(50226002)(7636002)(426003)(70586007)(51416003)(76130400001)(50466002)(356004)(5660300002)(26005)(6306002)(6916009)(103686004)(2870700001)(6266002)(486006)(44832011)(26826003)(476003)(2616005)(478600001)(6666004)(1076003)(70206006)(4326008)(36756003)(107886003)(2351001)(2906002)(2361001)(126002)(336012)(186003)(52956003)(966005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR15MB1944;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91cd014a-03ef-494c-bc4d-08d719423172
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
	SRVR:CY4PR15MB1944; 
X-MS-TrafficTypeDiagnostic: CY4PR15MB1944:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <CY4PR15MB1944973DF54803EC31AD96C2B8DA0@CY4PR15MB1944.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 01208B1E18
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: lkWApfK/vOwCMAwEuSGRfCwXuDWVReekoD+uzSuEoqyCVGLcfDfHm4Gc6WgnDiBlTDVGQUNYwHAMNCkIm3aa4Ca0wtt3TrftqzPKGV1t4qlRRvqnRJbtO2gvX6HSglLNLcH3OTuaDk8AHbGl/UAnbmzt8xSNyP0NDlzZ+8cYn+Yhx6djafnmUnaYg7fGZN+97Rxxpl1/erbULs2armkumdjisEThh4jqIeqgDXjPQY85IjwqRj1nH86/2yp7ZYXzbjuo6wWNscwyA3IMEGS7/8D0Amt53NMTm6eWrrzSwosff5XcaGkfGlxt2/vgwGonumK0ptJR7eupBVgxRTyYdzFA5QtZYkl/l5xN/D27TxQ+QqlniA7QoMh48SsK0rqaLBKv7zqIrX9YNKeqDGzwhmQ5VMQ2UIF52VO7JV8Io/E=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2019 01:13:58.0164 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91cd014a-03ef-494c-bc4d-08d719423172
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1944
Subject: [PATCH] autotools: always include config_site.d files in CONFIG_SITE
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
X-List-Received-Date: Mon, 05 Aug 2019 01:14:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13375

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 meta/classes/autotools.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 8768a6ad68..3d22ad0255 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -25,7 +25,9 @@ inherit siteinfo
 
 # Space separated list of shell scripts with variables defined to supply test
 # results for autoconf tests we cannot run at build time.
-export CONFIG_SITE = "${@siteinfo_get_files(d)}"
+# The value of this variable is filled in in a prefunc because it depends on
+# the contents of the sysroot.
+export CONFIG_SITE
 
 acpaths ?= "default"
 EXTRA_AUTORECONF = "--exclude=autopoint"
@@ -132,6 +134,8 @@ EXTRACONFFUNCS ??= ""
 EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
 
 do_configure[prefuncs] += "autotools_preconfigure autotools_aclocals ${EXTRACONFFUNCS}"
+do_compile[prefuncs] += "autotools_aclocals"
+do_install[prefuncs] += "autotools_aclocals"
 do_configure[postfuncs] += "autotools_postconfigure"
 
 ACLOCALDIR = "${STAGING_DATADIR}/aclocal"
@@ -140,7 +144,6 @@ ACLOCALEXTRAPATH_class-target = " -I ${STAGING_DATADIR_NATIVE}/aclocal/"
 ACLOCALEXTRAPATH_class-nativesdk = " -I ${STAGING_DATADIR_NATIVE}/aclocal/"
 
 python autotools_aclocals () {
-    # Refresh variable with cache files
     d.setVar("CONFIG_SITE", siteinfo_get_files(d, sysrootcache=True))
 }
 
-- 
2.20.1


