Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.52])
 by mx.groups.io with SMTP id smtpd.web11.579.1602089144355364849
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 09:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=UjUSX6RZ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.77.52, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arfgKmvXhlGlzLCcs87DKh2K76WZPr8JeDchWuRZbINATLFbBbphtaLTA3XjVELmNxNmAufevcWve+tptwRg960tqI4oGJpaqP0iOz51WWhZiX+pVuxfi6ZBAGJ7eI1oDYmcOUvnl9hsD8GKg+zyuMF+q4szk0D2CfZCNcSSGN8Xlfw1rpPqHN8hgrLdKpw1U3oTfFS2iv+19ZPHTl/KncNI0JGnHHxYe1enCfmz5ByAFUJuXJvXf77cw5O3lyao4nPWI6CAhg/ytWhYJBPcgJziNpRlE1JW3cxRjDS5ZRjyul47JCkaxk5B7ChQ06kT4uH7cn4Kj2Qom6dEwNVjwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaG5cxnXSQHaCpiYEajQYy+/fXqz80ovtroZED9jmwQ=;
 b=eLx5HWqOx+T7foJx83HSToFo1j8Eb54tDysddO/E7r1q4Sst1ibWceYwC8qurdHHv/w0eay8f5k/y03jE9UtY8hB2UAFRv9SVkgiKPivmBymzmP5rbfBH+DwGLYlqGvGUFp+8E455OiO6EhMkumHJdXmjTB5Am7OsY5NtGGKywTgI1bAImIkdzOtQ+LXZumMNMTiME9HIbwrwH/RVBeYo7KfSAI92HKNRQyYxaehMk0uHL5U4din1I2vvBGEBG3aL8tqoUo6bP5XVhiu8MT119uTr1T47tcgwC1clwFW7wyOS4KIAJ2iCQXc1yz9fC4UcPr8/qDjGhfpC3FeX40hRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.37) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaG5cxnXSQHaCpiYEajQYy+/fXqz80ovtroZED9jmwQ=;
 b=UjUSX6RZuGIpyRANn+o9hEBhYPmXnbyIBnL5Cep/9XY/G+OBqy3lbWuhJCuA9ROxn1sSwUwcvzFK0W7iN0bRulszcByK73OYsBXsXMLmmePvcnga7quGgxBeipCj5fjGjVLtcBUtO4BZ9i/43sEhPQsK0oP+PFG9uU4jMbETWUYS1rHMihzHKNxr/7WCyHZzA2nVVPnY5C9a+zSqYJ7UzKQgw/KkKyzuqImSEYJkcoxSyW79k+nVm+Y7Jc9Xci11w6lLqVdonfmUsXg56ubH/ijGIp1W/woB0Xls3N9KnQ3BSZLqhoaHUmHiBQuh8+eoWwkTnaismB2nlaadDjcQPA==
Received: from BN6PR19CA0099.namprd19.prod.outlook.com (2603:10b6:404:a0::13)
 by MWHPR1201MB2494.namprd12.prod.outlook.com (2603:10b6:300:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Wed, 7 Oct
 2020 16:45:43 +0000
Received: from BN8NAM12FT040.eop-nam12.prod.protection.outlook.com
 (2603:10b6:404:a0:cafe::89) by BN6PR19CA0099.outlook.office365.com
 (2603:10b6:404:a0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend
 Transport; Wed, 7 Oct 2020 16:45:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.37)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.37 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.37; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.37) by
 BN8NAM12FT040.mail.protection.outlook.com (10.13.182.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.13 via Frontend Transport; Wed, 7 Oct 2020 16:45:42 +0000
Received: from laplante-lm-19.localdomain (10.46.32.232) by
 edgeappmail.agilent.com (192.25.218.37) with Microsoft SMTP Server id
 15.1.2044.4; Wed, 7 Oct 2020 10:45:28 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH] meson: ensure out-of-tree build when under externalsrc/devtool
Date: Wed, 7 Oct 2020 12:45:34 -0400
Message-ID: <20201007164534.123373-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg1.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 10.46.32.232 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b09b1a78-6152-4f1c-e112-08d86ae06e25
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR1201MB2494A0B4B7EB6D044615875B8B0A0@MWHPR1201MB2494.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aj9/Iq7o3oiBVjdQ6CPP3zJF1b4o8kk1gdw6grnMIDB/PCM5NzEZHuEA7ZIwE6jTk7OhlRtBCLqDxnNwJdUj/HH/8Njvgh6BejRIKPl9ZYhRJet8yKMvSYsGg1P6LDkDNP5O/Ki674qxkn186m/bmTjnNXpBqBg01yCJJvY06/oAdWdmg2HlEwn6AtQD+dSlwuBYrg8IoSqcs5tt0XEJN+GUUsqNtGWnPPVbBCuZwMm+jLFcBHhi/SR1zYOQ3p8PAMDm0GS87TURtYUrgePig3ofHJGLKcJTKPlWoIueroBii3KHSvT1PByNjrFAwDJWUEqOO8Jd5XQkKuP+m/a5bWFi0jT8a/j6Snqvd7zEZ1Z5Gl70f2/veaCrTXCtnHwpZ7Do6KAjDxNfIErLKWqpr77C4/4LgLmOcGzZyc40vT4=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.37;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg1.windmz.agilent.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(29502001)(46966005)(316002)(86362001)(82310400003)(6666004)(426003)(4326008)(47076004)(2906002)(6916009)(356005)(7636003)(44832011)(82740400003)(70206006)(26005)(107886003)(1076003)(4744005)(2616005)(478600001)(5660300002)(336012)(8936002)(186003)(36756003)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 16:45:42.4570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b09b1a78-6152-4f1c-e112-08d86ae06e25
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.37];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN8NAM12FT040.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2494
Content-Type: text/plain

Avoids the error:
| ERROR: Source and build directories must not be the same. Create a pristine build directory.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/classes/meson.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 83aa854b7e..1b4b244018 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -6,6 +6,9 @@ DEPENDS_append = " meson-native ninja-native"
 B = "${WORKDIR}/build"
 do_configure[cleandirs] = "${B}"
 
+CLASSOVERRIDE .= ":class-meson"
+EXTERNALSRC_BUILD_class-meson = "${WORKDIR}/build"
+
 # Where the meson.build build configuration is
 MESON_SOURCEPATH = "${S}"
 
-- 
2.17.1

