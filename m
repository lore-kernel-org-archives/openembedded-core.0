Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.83])
 by mx.groups.io with SMTP id smtpd.web11.3768.1596710283911958526
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2020 03:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ll1M9r5n;
 spf=pass (domain: arm.com, ip: 40.107.14.83, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxRBLjawmxNDSHlca4AArW8cFYKmHo6y5zvyTNfJTn4=;
 b=Ll1M9r5nNHyl47LV3kEm1S32N9XQritV1ovQIi/aa0DvRrjLJqcTVyqRnEyyEunuFPiTTTmz+He51hnM+4heUgSFeAU2vBLvmIDWY+rIxr1iROx8V+jqdS3xwj5BvNXX2Rv5XTdeC/kWFB22TO3juW6gHF1fTVBOMxQ/9bJ6EGg=
Received: from AM0PR10CA0101.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::18)
 by AM5PR0802MB2610.eurprd08.prod.outlook.com (2603:10a6:203:97::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Thu, 6 Aug
 2020 10:38:01 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:e6:cafe::43) by AM0PR10CA0101.outlook.office365.com
 (2603:10a6:208:e6::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15 via Frontend
 Transport; Thu, 6 Aug 2020 10:38:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Thu, 6 Aug 2020 10:38:00 +0000
Received: ("Tessian outbound 34b830c8a0ef:v64"); Thu, 06 Aug 2020 10:38:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0603b1bd7d1aca12
X-CR-MTA-TID: 64aa7808
Received: from d6e1ce982886.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CE57E833-B9F7-4223-ACAE-05A75850D37D.1;
	Thu, 06 Aug 2020 10:37:53 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d6e1ce982886.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 06 Aug 2020 10:37:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LT+hbQIM+AZfIkk8OnfaH4nlTsxL7SF88JULx7WNVB/d5UexxJfkOGmE2HTK0S1/HRuAyvCrQo0HGJJRszRr4CQjf9wDXSRIYhIK58O65KLka3t73AX970p87Raooe8bisHHUQ4osSfL0SnGXLOGGQGyOJXm4NxGuaJWjMUwe9IZ8TESUkTmuqnxWqCLlMwooATlynquKzVZYwNlphhVrb+jUVwTEfi23JoymJoaJycVATUJG3LND89XGSR9jJRGuk6/3z8de//+xj1KY/PBveUIy9xgFAZfk2GR5/GpOUQbdyoRNCIdp/kZ+4QgttfT0bg1YQGoPqLDThrzUfnmdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxRBLjawmxNDSHlca4AArW8cFYKmHo6y5zvyTNfJTn4=;
 b=O+7GOw+UDu0n4KUnThVUTd/H8GWsmewwxE7LKdXPhTkFabVqcx5R6cj8KLIiPSsEW+aaqNJqIqo235M+Jtywoorqrkbcf3zjaTDtfQycrHe7Sc7pHvhF4yrAfX4Whjl9eeqzMAetaToowOni8H2ZOyKfvi7b6oQzTKUP4lqUz59QqEwmrHPHFfO6iY1JezcWiioeALcqPpDjn4+UjCwxNJNYHB1XPp/PEc2spgqA2FznBhwrPl/Sua3/HYa/uYE9QJar3eycm5Vd4nRkbzaeuclusRrsa6xnE+0S2vIWLlXTaZh8yh5G3qfELMzkpfHGUPj1VDddq20zog4g2GMu5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxRBLjawmxNDSHlca4AArW8cFYKmHo6y5zvyTNfJTn4=;
 b=Ll1M9r5nNHyl47LV3kEm1S32N9XQritV1ovQIi/aa0DvRrjLJqcTVyqRnEyyEunuFPiTTTmz+He51hnM+4heUgSFeAU2vBLvmIDWY+rIxr1iROx8V+jqdS3xwj5BvNXX2Rv5XTdeC/kWFB22TO3juW6gHF1fTVBOMxQ/9bJ6EGg=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3878.eurprd08.prod.outlook.com (2603:10a6:20b:8b::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.18; Thu, 6 Aug
 2020 10:37:52 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3261.018; Thu, 6 Aug 2020
 10:37:52 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] cml1: Add the option to choose the .config root dir
Date: Thu,  6 Aug 2020 11:37:51 +0100
Message-Id: <1596710271-46786-1-git-send-email-diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0223.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::19) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.54) by LO2P265CA0223.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:b::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3239.18 via Frontend Transport; Thu, 6 Aug 2020 10:37:52 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 78653be4-de81-47bd-2e7b-08d839f4ca45
X-MS-TrafficTypeDiagnostic: AM6PR08MB3878:|AM5PR0802MB2610:
X-Microsoft-Antispam-PRVS: 
	<AM5PR0802MB261051E2C7D261C34CED353D92480@AM5PR0802MB2610.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7II0EVlUmY6KP0m/r8rGzbq3Qg/AQgaP5aiEeMJua9g0Ad3lRF9ElDZy3vSzGCZ9ESu8jwTiB8GeSiPMK05ihaz1kgm/eFFyBVlXbuNGnkkARyinyC+04uVLDM1XPIfRdFUZJc+0xxCTRaQogP2vCrmpzD2aQWAqFEE0rmmp2plbvX6AAFuFIYGpwtzzExYZ8VcqdYkF8wWLV4HQUa8x/xUTmS4TkyDqi3x2fMA45KOJ5mlkTwsi6UnXTGKkj/wlhFTLUSBQp9zkivWqFJzZnVBv+FR90czcggrRNkROQx3+n9SmGPh/68LiR5PhW3Tn0Bdr+u3I7Gi8KqqZCcgjLG5wRWn1xx5icpN0NfPwLT4Lqg5BTyZAFWu5ydlfQYxr
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(86362001)(478600001)(8676002)(316002)(44832011)(2906002)(83380400001)(36756003)(4326008)(6916009)(66476007)(66946007)(2616005)(66556008)(956004)(26005)(16526019)(186003)(8936002)(6486002)(5660300002)(52116002)(7696005)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 zyCJrVipgJLmpuoyY91i+WcasbNd7D4puGsTY3I0rhufled/dseJjPnp6dGIlV7ckdR+qBxEbq0SPPvV2KT6G0A1R7r8kiBEfBW7QXWpO2lHLfQYHUGAoGP+u5icppBBfcerrgZctHpNNCBl4YLO0TMwCwSkzZtMMt44L7+cK9MVRVDyaLblCrmk9c2vYem+3OWujadS1PldRkeJnw9i9n6FAVJY76+/al4ElOtkw+jdet+yi9p5IObtrW1wxWEI0CTEA3nxOE6XpcfN5SkK2j1cYaaXccC2dIj0IreMbBgYpmPNioBo6PpiLqc25ounEk5W5jzm1xAejZNUbu57Vtw+rFEKck2zx3QGbyP65k7Vy2xAge8RRjS0Cfap9ZRQhBIoH7w6e5BZ+1PgwelPGbdeXBkEhmsjus1SmLOXQ9otkCRmIVNMw/q7BHMDlwkhh8teuRvJV2RZuFJAxhJHyvfLxNfp6LVf+Id5+D3jPPO7INskcFw3RnpmNzdinzc8DP5zqco7In+rFKwt6shS1Sp7cD/axAuHXPMSXK+i/Ix6aTjX2CFfyO7HwlWsCxdgrcDzasIxcA2/N955nRZG6AuZvS1LhuTWXGISBdqHq+fGc6gSJFT4qhRRCAjdUR7e8pndEcU+brZ9wAq8kgy69w==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3878
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	087cd218-a28e-450f-d622-08d839f4c57d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hBc7g7txAK/u9dhLsY9bSSjDhTjnf8wYoMBje7WKW1Bs0GXy/B4azddyHAlvqgZ97tS1oUH/Wb6wZy6fp+X7bYKIi9WanF+J73E01sIM9LUU6LomRTOFnA5K3hVI8tHOBJJw4gMD4HY8DjtVfigLomGw4pQqkpFoY78BjkM8hwPpdGxUuHwhPuJ5Qlkn1w6Qx0Er66g8tvvm5HMvVkQO5S3KDHRX1a7gaCIvJ+nmuJ12xkakwk3mZlLwrkpvythgP+eZ/BY5WB5i+LSEjpY05Z637asHXtjYibizjg9iTYbkXQMu5c24gBOZC/nQXbcQ+7sfc25P7RFfHOWDRI6DOq75U2B7tdpnWoiCH5bAAuA5SOW7PV6UbQE6oKIRPcsPUGTXT6GqlUk+fsqlTrBu3fEdTKTLKibguRocfFkY4EY=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(46966005)(478600001)(70206006)(2616005)(4326008)(86362001)(36906005)(186003)(16526019)(336012)(956004)(70586007)(26005)(6916009)(6486002)(44832011)(36756003)(7696005)(82310400002)(81166007)(356005)(5660300002)(83380400001)(8676002)(8936002)(316002)(47076004)(82740400003)(2906002)(142923001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 10:38:00.0660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78653be4-de81-47bd-2e7b-08d839f4ca45
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2610
Content-Type: text/plain

Introduce the KCONFIG_CONFIG_ROOTDIR variable to allow recipes
which the .config file is not under the ${B} to select the root
directory location for the config file.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta/classes/cml1.bbclass | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 8ab2405..9b9866f 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -27,12 +27,16 @@ CROSS_CURSES_INC = '-DCURSES_LOC="<curses.h>"'
 TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
 
 KCONFIG_CONFIG_COMMAND ??= "menuconfig"
+KCONFIG_CONFIG_ROOTDIR ??= "${B}"
 python do_menuconfig() {
     import shutil
 
+    config = os.path.join(d.getVar('KCONFIG_CONFIG_ROOTDIR'), ".config")
+    configorig = os.path.join(d.getVar('KCONFIG_CONFIG_ROOTDIR'), ".config.orig")
+
     try:
-        mtime = os.path.getmtime(".config")
-        shutil.copy(".config", ".config.orig")
+        mtime = os.path.getmtime(config)
+        shutil.copy(config, configorig)
     except OSError:
         mtime = 0
 
@@ -42,7 +46,7 @@ python do_menuconfig() {
     # FIXME this check can be removed when the minimum bitbake version has been bumped
     if hasattr(bb.build, 'write_taint'):
         try:
-            newmtime = os.path.getmtime(".config")
+            newmtime = os.path.getmtime(config)
         except OSError:
             newmtime = 0
 
@@ -52,7 +56,7 @@ python do_menuconfig() {
 }
 do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
 do_menuconfig[nostamp] = "1"
-do_menuconfig[dirs] = "${B}"
+do_menuconfig[dirs] = "${KCONFIG_CONFIG_ROOTDIR}"
 addtask menuconfig after do_configure
 
 python do_diffconfig() {
@@ -61,8 +65,8 @@ python do_diffconfig() {
 
     workdir = d.getVar('WORKDIR')
     fragment = workdir + '/fragment.cfg'
-    configorig = '.config.orig'
-    config = '.config'
+    configorig = os.path.join(d.getVar('KCONFIG_CONFIG_ROOTDIR'), ".config.orig")
+    config = os.path.join(d.getVar('KCONFIG_CONFIG_ROOTDIR'), ".config")
 
     try:
         md5newconfig = bb.utils.md5_file(configorig)
@@ -85,5 +89,5 @@ python do_diffconfig() {
 }
 
 do_diffconfig[nostamp] = "1"
-do_diffconfig[dirs] = "${B}"
+do_diffconfig[dirs] = "${KCONFIG_CONFIG_ROOTDIR}"
 addtask diffconfig
-- 
2.7.4

