Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.85])
 by mx.groups.io with SMTP id smtpd.web11.28731.1604308833451745851
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 01:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OmT/CDH9;
 spf=pass (domain: windriver.com, ip: 40.107.244.85, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PS9b17qAKry1H6vpposfzr4iors+bddTG+DrEO5thfGOD1qpH0vAUBnRXAvbiqP4lpj1uT9INn2FSE2Fd1tKV0Bv17InwKAU2W5xLpyiog2cL9lLxz76R1lijxfVsjjYrBKM6B2+1ikdKRuMR4c2s9iNr9HINkLW1mI51ktborR5u0nIE3R70An1zgpifgfL/Jxbu8b4TFDv2SAZG70oj+DucekXBZTNJ3ps5A1aAobfm8s7n1Pjrg8Z3VLmX3Qnk5rNe8r8EdiX6svslO4iJ5U0RWtlhJUedn1t512kzEpEM5a2mUllforTAEXCoOrJFFMclBWqlZGCYF2VrWQEEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xl9zAeghGViw5Mq24AEfAxDYFfgoYz5A0r2xdrb6KdQ=;
 b=jnX7dwbS1g5kt8B5agmDAxjWl20Gm7ury+yJSI1KGQoLhHfuL0n1URuqizrn65a1tDgiWvGC6vlHPd5TlLh9wxw0I3iKBzJnTAOre2K3FxFqLfXParMOquasiEkJ8F6e5hRplQF2TOb44cLwYmf+aZaAs/qDlWhak5IbPF31FRXwJUrAeeh1TfLEuw7VwGbiFYAi57KEwYru3SgGlX0QlKEoCqyWfjfgyVS5Pt3UOVXW9mRVV4WariYRYRgS/Y4LHwm6bd14LeI/BFL7TSYYUHNhWDgYPapx+PcicSUzVAA9N0TvGsLFBnEn/ElKHiCbyH/HQbcSxLKuJnJd59Ru0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xl9zAeghGViw5Mq24AEfAxDYFfgoYz5A0r2xdrb6KdQ=;
 b=OmT/CDH9Bi7lnVmNozHNCh/nzYrfdYixoaVt62sD9GzUfJNGKr9KAOu4U4hoGLzqFGOea2zMHOcsfTJ3GcDLuhdkHAy6Xq9AFJPQX3T+ruiTPanqXQRxW/3arfbFpJTTnT1YgJj8H4k48g/InIn7QWNVFmcFLgcDdzjI/IClGQk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MW3PR11MB4554.namprd11.prod.outlook.com (2603:10b6:303:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 09:20:32 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98%6]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 09:20:32 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] pulseaudio: unify volatiles file name
Date: Mon,  2 Nov 2020 17:20:11 +0800
Message-Id: <20201102092012.15968-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0199.apcprd02.prod.outlook.com
 (2603:1096:201:20::11) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR02CA0199.apcprd02.prod.outlook.com (2603:1096:201:20::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Mon, 2 Nov 2020 09:20:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d56b4e21-c465-4e0c-0be6-08d87f108c2e
X-MS-TrafficTypeDiagnostic: MW3PR11MB4554:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4554E7C5BFDF3CD9A56544D1F9100@MW3PR11MB4554.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7kHaC9y7YlChGdU57OOx5k+Xa2+N2eF56sEBXlvUrb/7OjG+q/K4XMQs7JIuqK+Z66fnCmCoyF0BcAt7xiG0YGf/Hz8936L5gsw4C2rH8unPYCCOxRYd3ZUkUL4/cAN/BFC5eCJ9fVyqCmSL+xv2P9Gfp22Yy/4Sg77LWaogqJip1HyuHrPAyKvlLuS1s51COQEdfsqoaQfUGAWYzpRe54roMHBAuUaT5IiRqMv41oaJgIMcw5PPgbsXk6gJNxSwEXRbjWaeLpCvFVnrqFTZE6JeoFEBM9exQiE7bk6sfaaS31lRZ6PBqopmGUy/HRsipscCVNfz/YJCrAgeb1oSGQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(39840400004)(136003)(1076003)(83380400001)(6486002)(5660300002)(66556008)(66946007)(86362001)(66476007)(6512007)(6916009)(44832011)(8936002)(36756003)(52116002)(8676002)(478600001)(316002)(6506007)(2906002)(186003)(16526019)(6666004)(26005)(956004)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	pcUACY5c/jriMkKVPj8qMEYjUhuYRYw1NDKKNDsnNY4dYgE82+xfGyi33i82HRIO3xM00IQoWbFN8kJPnVsmSJ+krQ6zm+ORQAobJyJ6Nxi+AwG23iGNYMonGpmKAG7qxH1N3E7UK5CMFd1L1tZ5y/OtndZe+x2HCgOHOeGTiz609pMi+B/9IzO3VOSW/xpNbvKCIzJDap031EDQMJJ3PRd+evoR9/Cettyzci1aZCylFMu9ek6MNVdQ3Ceqy5lFYy+xFd5lsGlNiYAD07ZKXBhLB3Q5e4kllvMaOHSqc9Vt0uxgxLlpVDf0P7QB1AgY8s/38CaK4T73uNj46si5AdDDyubdmWuNKkF4KjUWsoU9gO5cu6C0VQGLsC8oqyBPOV/uSY7SsWQf2/CFcEIkdR2Y5uFKbIPmT6xtxduuiPoOJpm0N1UG0uqXieSKWWkmC7lvf5pgJP4h4p3lLceGX3dLPHiAsdcxdIdGSDVIkKSYAOLejrrXLGVbEYoY1qObmPIxiLt3wD7A304TAYVvwmLiGnBqovmfXJIXMV5G9vepFLfZojF2KAHvQojsEqnKUWPPB28jy2WY8hDlxve00GuAmLVl+45irkC6dklXQ3f0NNKpwyFAu1rhMDX6+OODsxC34qK+85zTIZPwiDpWGg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d56b4e21-c465-4e0c-0be6-08d87f108c2e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 09:20:32.2201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8T1zr+EcdNjPlYsX/gvneCo+wqZC6fsP6yiyJEHVjjJwHCp2gKnlZEREgKkPFY9Rk6gHQxytoIeuiuohDRj5+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4554
Content-Type: text/plain

Make the volatiles file name starts with digital.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 4e32b27087..3a26cb59dd 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -149,7 +149,7 @@ do_compile_append () {
 
 do_install_append() {
 	install -d ${D}${sysconfdir}/default/volatiles
-	install -m 0644 ${WORKDIR}/volatiles.04_pulse  ${D}${sysconfdir}/default/volatiles/volatiles.04_pulse
+	install -m 0644 ${WORKDIR}/volatiles.04_pulse  ${D}${sysconfdir}/default/volatiles/04_pulse
 }
 
 USERADD_PACKAGES = "pulseaudio-server"
@@ -192,7 +192,7 @@ FILES_libpulse-mainloop-glib = "${libdir}/libpulse-mainloop-glib.so.*"
 
 FILES_${PN}-dev += "${libdir}/pulse-${PV}/modules/*.la ${datadir}/vala ${libdir}/cmake"   
 FILES_${PN}-conf = "${sysconfdir}"
-FILES_${PN}-bin += "${sysconfdir}/default/volatiles/volatiles.04_pulse"
+FILES_${PN}-bin += "${sysconfdir}/default/volatiles/04_pulse"
 FILES_${PN}-pa-info = "${bindir}/pa-info"
 FILES_${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules */*/udev/rules.d/*.rules ${systemd_user_unitdir}/*"
 
-- 
2.17.1

