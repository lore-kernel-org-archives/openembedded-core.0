Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.76])
 by mx.groups.io with SMTP id smtpd.web12.63283.1600097633002530010
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 08:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=mIkKUnwh;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.94.76, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXCiUCRnlmDrkCglE5T/yUB1pjc93H+pJWjfI3798sGPxOW+aMzsSjwprQjpIEEuzg2HXnwyqjk4gbOCRDDg2muRkDFxMfH7KwPkwAYToeEJziuKZsNWmjNDfjO9Axy/2jbtD12hcHar3cFkytNSGgRJIKi5TVHtUPmBBCVx2Kji9TH7bs4d3irE9fQILDRqwmoPJVAFjhQv9nF5qwbBy1qu+ueSdPN1GoSPY3g+627LmSGG1y8if4SF3j/wjlGDPOFBfd/feIckJm8Ht9+wECdnhI+2JX4JcRF1XR2omMP5WD8cZJg3qqfWmeYYT5KPM07r1my0NQITvZDw3RypnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4O2Ewwgv6V4vUB/dS8QdzOno1l4yYNA6XRHu2eq/y8E=;
 b=jvDqDsuu2yK6qMZ6HjrYVeVf7E89IjDjJ6XquITW11gSz/baB3t/cP+x+1lKiiHmUvURPdys3LT/gUVF0xKI1DIBa5zbYA4Aa83LNSZoYfaCBFIJr2eFWT7SPCcVuXebBP7eE8UW0X3zETgevStD9xVGWUGPVwZaz0/ki8EYAMimsEP0VZWyhMNllDhojViYcqYRZzeTrjYIDGyAFajSRZ2bTStzu6nQ7Wez0p+HO+HrNAczgbf1J9HZdTPjy0fmydBWPq2q/nQWHETpvajnNNzLtWn48+QPLc68brObB6VYVh0nnOSrRC3aan4OOcZJWsM4CZNG4dX4R8+4VaOjrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.37) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4O2Ewwgv6V4vUB/dS8QdzOno1l4yYNA6XRHu2eq/y8E=;
 b=mIkKUnwhmnI12U8eBlk9hvhbZX9WsbBuvOwdZI9LfjmW21astUdZn6Jg7EPOWm0PxE8cgrKmbguTtFsQbnfrpDeHhikD18KMq8ErzsZLjsLQcq0O9mYn2FP0oS2xIiFG1bsiEKRHxBzUDWQ2QNUp/8+z/Pj1bWphQHWpK/GFffMnK7RXA0njnrW6p5dMh+OckWAydHes2ApiJ1hsPiVT6VHVpcarX5e70RWJNMSVrNZd/7SMqN3I+WXQvJrVke2yNuJTkTHmGJ2hgCHt/G6lCqCcM/UCY/684V/JkbJjm/Qaq7Eg0TgLN4YrFpc0dG1Wk1JAyfRmPgaRWSC1rFZZ+Q==
Received: from DM5PR18CA0086.namprd18.prod.outlook.com (2603:10b6:3:3::24) by
 MWHPR1201MB0062.namprd12.prod.outlook.com (2603:10b6:301:54::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 14 Sep
 2020 15:33:51 +0000
Received: from DM6NAM12FT055.eop-nam12.prod.protection.outlook.com
 (2603:10b6:3:3:cafe::c1) by DM5PR18CA0086.outlook.office365.com
 (2603:10b6:3:3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Mon, 14 Sep 2020 15:33:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.37)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.37 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.37; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.37) by
 DM6NAM12FT055.mail.protection.outlook.com (10.13.179.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.8 via Frontend Transport; Mon, 14 Sep 2020 15:33:50 +0000
Received: from laplante-lm-19.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.37) with Microsoft SMTP Server id
 15.1.2044.4; Mon, 14 Sep 2020 09:33:40 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 3/3] cve-update-db-native: remove unused variable
Date: Mon, 14 Sep 2020 11:33:20 -0400
Message-ID: <20200914153320.64383-3-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914153320.64383-1-chris.laplante@agilent.com>
References: <20200914153320.64383-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: SoftFail (wpcosapexchedg1.windmz.agilent.com: domain of
 transitioning chris.laplante@agilent.com discourages use of 192.25.126.27 as
 permitted sender)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 167221de-0256-4432-97b1-08d858c3943a
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0062:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MWHPR1201MB006215C41A52C133B54D1C058B230@MWHPR1201MB0062.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7omm7f5t+4Ufv7Tj3xH/AjiGpMcyYTGRV2A1P6hK75irTQ1FuF1Ss6EQGSfcWe0jqojtXF8iqeQFU1ueeezvxMmyjuJdKvL8M5QSOk3m6rkU+GegVSNj/nBGllTN6sbiZkHcJXPJ20SRuBphO/Yi2obTAdeCg0CMPi10bCuLqgExIdJunhBHOsdQYeTtU0cPNZL1wRVhnCI8F4i2LI/xpqHytJodG6VLyeMjns7It2OgKRGyXKLtjPgfX9rc4sx/khejYly1HFEdH2JuwMxKFY9nXkDN+ZjRB2ob6DF3AuacL32hrTupYcZ/WFhsZqwEkzz/A7oS7tbC2tfh/FPN/O1lAyFGjerwKGOeMhGCDSvBqdoCPen53e+wALH4i33Eax9pAJ5ONZnd3zr9h12jFPj0FQLebvyx9vnSqxQ/YMc=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.37;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg1.windmz.agilent.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(29502001)(46966005)(8936002)(2906002)(356005)(4744005)(4326008)(426003)(7636003)(86362001)(6916009)(15650500001)(186003)(47076004)(70206006)(26005)(478600001)(5660300002)(82740400003)(6666004)(44832011)(316002)(83380400001)(107886003)(36756003)(82310400003)(1076003)(2616005)(956004)(8676002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2020 15:33:50.0510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 167221de-0256-4432-97b1-08d858c3943a
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.37];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DM6NAM12FT055.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0062
Content-Type: text/plain

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 242fbc2f30..cf2b251e21 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -33,7 +33,6 @@ python do_fetch() {
 
     db_file = d.getVar("CVE_CHECK_DB_FILE")
     db_dir = os.path.dirname(db_file)
-    json_tmpfile = os.path.join(db_dir, 'nvd.json.gz')
 
     if os.path.exists("{0}-journal".format(db_file)):
         # If a journal is present the last update might have been interrupted. In that case,
-- 
2.17.1

