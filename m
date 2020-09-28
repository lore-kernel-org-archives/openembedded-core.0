Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.41])
 by mx.groups.io with SMTP id smtpd.web11.39261.1601306354074404643
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 08:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=v5uBuGmO;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.237.41, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSraaj6gptxDUkvnVcr4zVg+xVcIcUMJFzV4EJCtQH/7wnoiZXCrtMj6Dcma/VRNrMy/eoAy/vTgNPLrvCOefPVlBKgXUqFUlvgpqIOkVmiN8f/GFXEZVN+Pt0OuPNH98E8AEPZF6iJQ42IPT+JxVu5llbPlTX71Over9Cas7oj9b0FBD3fGWxdsCNmNO90Nao67p9YX/QD9HL5B/WlC2vqr43+uWTs0DP98YXqTSRZV6JQubA0BgFH5NBbEPis1ceLnpuwD+iQLUapQRiCcCr81CN+ofBluP3ijzn05YGuelZEACxbKgaqxXRgYYCA9Ejlnfa5QACGUHZh7THfUcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1s+OzpNAKWzxFP0DwTR48wwJp4Uy1WWIjyYqgFraLoc=;
 b=dn9XzkY5OYojuvmKM8ja4eKvHJ089FXRNfPxJdfRhlDW5M78ZY59czDfc+Cv5eYC2S4MWQnobzglMmZ7yrbXVl+yfxOw1HpW2VpCKDkulzzzo+tiYSp06jSnfjvYwJ7hB1yoNdjkEyMXOygjEIUDBbisih2DD4y3kaZ43zTv7zzc2av7nV3sh9/brI8x5xdAFm8RaZ57Ebsxe4irqkAvAd3v7zMrwxMxRiwPNAxhg74WdS/BCkuseWh0e2bO2oav9MIXFmhLmWFXxecLBe3P8bhGNOK7J4f8ZSJxvZaXT2ybO21TxXvahqC+o23vjStBOXRyPo0jOHyo5ExTIt3bZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.37) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1s+OzpNAKWzxFP0DwTR48wwJp4Uy1WWIjyYqgFraLoc=;
 b=v5uBuGmOe8gPthO6nzpiurxGN8t04cmqDQEqhUpixzsNbtQXl/1IO1OJPuRP6wwyApEfNuQPF5iF2ha2FU23lX/X+kKZqFCUM5Xqjy78r45o72j7D4hGuyUTyrF/HMc/n3Fci18YL6sVdUcYlaMlo3Xzj6KY8zrURMN30inDBf1Jd50Hk+vMu0HhuSUSiUQM5vYOFTKnBV5FgZefVq7twi237FUSCzBwwxQtjsH6+GMxbTdR1SmP1xydOxhUP/TIoiBjoC78zXXU7nb4ZBnVU2712MAETDb8NsBwoG9C/PiOBDZamTqoiSnz6VvmV8Yln3/suSe/6YS6QUiwhwgkEg==
Received: from BN3PR05CA0040.namprd05.prod.outlook.com (2603:10b6:400::50) by
 BN6PR1201MB2481.namprd12.prod.outlook.com (2603:10b6:404:a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.26; Mon, 28 Sep
 2020 15:19:13 +0000
Received: from BN8NAM12FT046.eop-nam12.prod.protection.outlook.com
 (2603:10b6:400::4) by BN3PR05CA0040.outlook.office365.com (2603:10b6:400::50)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.16 via Frontend
 Transport; Mon, 28 Sep 2020 15:19:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.37)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.37 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.37; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.37) by
 BN8NAM12FT046.mail.protection.outlook.com (10.13.183.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.14 via Frontend Transport; Mon, 28 Sep 2020 15:19:12 +0000
Received: from laplante-lm-19.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.37) with Microsoft SMTP Server id
 15.1.2044.4; Mon, 28 Sep 2020 09:18:28 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH] bitbake.conf: add name of multiconfig to BUILDCFG_HEADER when multiconfig is active
Date: Mon, 28 Sep 2020 11:18:53 -0400
Message-ID: <20200928151853.24367-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg1.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 192.25.126.27 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 663eeb55-93d4-4602-3707-08d863c1db18
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2481:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BN6PR1201MB24819491BE0DA40D113865248B350@BN6PR1201MB2481.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Xk9fMwxG+tSeoMJhmbsvdzcXwO6XinUOBd9E74rRf1+f9ZDWjZGgdldgroTs0qe5EKP+B4H2I440/WcXQjLti4Zo713nxEpiILIi9yVsP3lZfP6sQk4drDiJCEEo/Z9g9RBemm/INArM7+K7E3sgcetG33aYCM/UssJgQ/0MFLgF0CF3zgekG9OGLNpo5F/QNhe3i1eHEy8y4/v3F/9e2DNRfMwi8fwjJeOWWQ3/xA8MMjIU8T20Ij6+AYBAi7nyU15Ul/VjQfT0jFtd/dzthoEDK3GPBThtnKCHO63+rvOPrjnuzXh2+xDCp4eMbMjN0mI53gAk4vog7wRN07Othk9gvh+fjRFDFVTC/sxDVtFH8lT1hQjHgw5/ujYyb2ZkYEIeOKbbAajUcWKdS6GSuu25nNLFe6WtMz9ZnDsnmZj11IYP1r3K5fduTBj/lDsAOE8cH1rfMpYX9Rh/rLhRD0t3LNpBrBEFUl5F5Isfvas=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.37;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg1.windmz.agilent.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(29502001)(46966005)(6916009)(26005)(5660300002)(8676002)(956004)(2616005)(2906002)(86362001)(336012)(478600001)(6666004)(316002)(36756003)(4744005)(186003)(8936002)(426003)(1076003)(4326008)(83380400001)(44832011)(82310400003)(107886003)(82740400003)(356005)(7636003)(70206006)(47076004);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 15:19:12.7031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 663eeb55-93d4-4602-3707-08d863c1db18
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.37];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN8NAM12FT046.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2481
Content-Type: text/plain

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a318d1ca58..e6338b0c75 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -701,7 +701,7 @@ PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
 ##################################################################
 
 # Pre-build configuration output
-BUILDCFG_HEADER = "Build Configuration:"
+BUILDCFG_HEADER = "Build Configuration${@" (mc:${BB_CURRENT_MC})" if d.getVar("BBMULTICONFIG") else ""}:"
 BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU"
 BUILDCFG_VARS[type] = "list"
 BUILDCFG_NEEDEDVARS = "TARGET_ARCH TARGET_OS"
-- 
2.17.1

