Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web10.7871.1585061087130328183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 07:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@criticaltechworks.onmicrosoft.com header.s=selector2-criticaltechworks-onmicrosoft-com header.b=s5XXA6Tb;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.22.84, mailfrom: luis.martins@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNK19/AkgY1L0C3iQrKFI8/Uy7gFdACqLT0G1buFbTFXYPkcI9aqT5H4r5ORhbNu9pMw5PMsldk3eveQyXKdNPzcWiN8ltQb0H5Cwx0/RoFg9FmzVO5d859uxya2ZqoSSuxKpegee4TTekJz6NPjeZt5i+sXsB2vE3bBdkmCpCt3r91BRrvZozdz1dWQH4GV0tVifjCxGTFpCOdB8Lc8tjN921qvUypWlC4APGIaCQJ39ArX+aRnyd0yNGrgOLwxi0L9oj7AiOq1zCM77daqRWGz8zi1UBPkKnAHHHE+MnSwPU/yx/Lx7eIPDLCdhcvp2uovcvaqiP0snw057eO63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1s1hgjXDozDxKF3nqskBNknofLmBnnl57jXeNe/Qc4=;
 b=gwhlsmHReZCjVRzFNUHTUU17fq2jRMk2xtDAmX7R8nh3/x7bMw5lVGGZA7LBgPry4tFHuQqWZwVqXV0kacllR6/yR4pkCzFCVN8/UftxdnaylzIQwhxrDClCtV5bS+jSxT1YptHS754Wozl/WyFRvg2SueU4bZ8xDlkbKQSFhTrxzEFiLLSnB5GO0HopW2q1UNAP+WU5idh2FurSE/2kV8uCAFxEoO9vtMzOFvSnAUniN53It3p7xcs8hIEu1AIjD2k81DGRKfBHk4dNZbNTWrV3nLNZMs7PYXxY9a5omM3VZ4i0StNsZZgr3PiJ4xSixU3oPb67BMI5/PoFTeFF4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticaltechworks.onmicrosoft.com;
 s=selector2-criticaltechworks-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1s1hgjXDozDxKF3nqskBNknofLmBnnl57jXeNe/Qc4=;
 b=s5XXA6TbAJRqr6hCiuOOkqsxOWFt29MAubu9TfXrjq4WZAcl1KmMlrT2DyETDRdN+seilecm4AvlNQKCAF8WOTwoNTJSNsKONmnLzausNFh5NGnnoGyz82bmpNIK34SA5EDn/+lasXjJHhms/YQwboJzIkFNoPDGImjGgYDbOQY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luis.Martins@criticaltechworks.com; 
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM (52.134.109.21) by
 DB7P193MB0332.EURP193.PROD.OUTLOOK.COM (52.134.108.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Tue, 24 Mar 2020 14:44:44 +0000
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1]) by DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1%3]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 14:44:44 +0000
From: "Luis Martins" <luis.martins@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/5] improvements to buildstats scripts
Date: Tue, 24 Mar 2020 14:44:36 +0000
Message-ID: <20200324144441.41230-1-luis.martins@criticaltechworks.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200324113313.39528-6-luis.martins@criticaltechworks.com>
References: <20200324113313.39528-6-luis.martins@criticaltechworks.com>
X-ClientProxiedBy: LO2P265CA0283.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::31) To DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:5:1b::21)
Return-Path: luis.martins@criticaltechworks.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (213.205.68.220) by LO2P265CA0283.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a1::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 14:44:43 +0000
X-Mailer: git-send-email 2.25.2
X-Originating-IP: [213.205.68.220]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ce38035-154c-4929-08d4-08d7d001e429
X-MS-TrafficTypeDiagnostic: DB7P193MB0332:
X-Microsoft-Antispam-PRVS: 
	<DB7P193MB03325CA9A3717F514C2044A485F10@DB7P193MB0332.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(316002)(6486002)(6666004)(16526019)(6506007)(4744005)(26005)(36756003)(186003)(69590400007)(66946007)(66556008)(66476007)(86362001)(6916009)(478600001)(8676002)(6512007)(956004)(44832011)(2616005)(5660300002)(52116002)(2906002)(81156014)(1076003)(81166006)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7P193MB0332;H:DB7P193MB0282.EURP193.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: criticaltechworks.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NApU5HonRZ8WMezrAVuyyipoyLgqHCIRqOGpFCKyb1PSsqNghv38dVGQeUGWYcT3W2sGrxukBcFxSA6eL0hOIXwHDUat4+Xm8QdQGu3FRB7CPgGdtCnDWz1lnKlmdgn0W1xhcVOuEMCocPLsCyfsjrU3o75fgCHHcts57myz36rd7UT6pcfOv4aU+Zafe1Wvzc1UVsPxdxcqfh8dD+TfXTuutTmr961kbxLdwRG7EbcRoIPOxxHs+TKD+qbxuz4woffh8jrfLKrnGqFKXx36Iz1C4g51SXAx4jI/xzGKRaXDnBT4IxEXlpLsjO5PQP6Irm4+bQJKmWxZ4yA6CZCs7Bgr+vxktcdZlXRyF08p4EgZRGxzrHFOMcJCl+ss6B96hKllt7aR4DqBI0P9/8cP1MVWTIwbkqYFQYEogoJUHO8F2Dvvs7A6v6e6diFzN0u8HFivPbz3aS4+vjn8exuV7X//ms4TMs/ceUdIv5F7lrVeyQQjEN8BMCWwixGqLYCy
X-MS-Exchange-AntiSpam-MessageData: 
	MWTKHFQSQdiIkYQAqSbsQejDxTQSkF9f6LOy27TTW3ccrfbsvPjG9inU2+HobE3SmthuQ8ceOpMoCCxmsXt6MvnwCZWGPxHMlH30ss8CewZd9WMPeEisvO0goIbVzBl6NuIPkh4CBYDQJuGCoQ9Stg==
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce38035-154c-4929-08d4-08d7d001e429
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 14:44:44.0302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmQKabHSGC3rwO3HMPcCnluoepuwOqo/hQDXhKVVOevrA24FpVwtonrrQRA2wa0TRLrEuenFdsUTQOaibzOfTU9tj0P3EWA61NTk2A1YlHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7P193MB0332
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This patches add some new functionalities to the buildstats
scripts to allow easier debugging of the bitbake performance.
Some new features like accumulating the stats values allow
to compare the total amount of memory used by a single task
(main process + child processes) and other features allow
convenient analysis of task performance per recipe.

changes from v1
* removed unecessary "Upstream-Status: Pending" line

Luis Martins (5):
  buildstats-plot.sh: fix invoking buildstats.sh
  buildstats-plot.sh: filter by task
  buildstats*.sh: add accumulate parameter to scripts
  buildstats*.sh: add recipe parameter to scripts
  buildstats*.sh: fix spacing indentation in the files

 scripts/contrib/bb-perf/buildstats-plot.sh |  74 ++++++-----
 scripts/contrib/bb-perf/buildstats.sh      | 139 ++++++++++++---------
 2 files changed, 127 insertions(+), 86 deletions(-)

--=20
2.25.2

