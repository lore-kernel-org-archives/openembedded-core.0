Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.64])
 by mx.groups.io with SMTP id smtpd.web10.7663.1598944353678778118
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 00:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=lCeHOm72;
 spf=pass (domain: arm.com, ip: 40.107.22.64, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWqH63iZ6jXjGkydVgFqLunRpntfcCrV9sTJX4wTSsM=;
 b=lCeHOm72GDkSA9uOcnCsJiel05nPRXdLg1qExfcCBqFtqJFIpZAdFkPPBepeRErmYKVVjiV5Gm47aOgw4yRat0oyRjY+t/Abdqb9Rmb9WS92tOZVkLKoT7Y/cTdRNbymL83mpe22LNsLmDyNflqN7UevUqynMcJsnW1sAzmwV6o=
Received: from AM6P194CA0087.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::28)
 by AM5PR0802MB2482.eurprd08.prod.outlook.com (2603:10a6:203:98::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Tue, 1 Sep
 2020 07:12:31 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::5c) by AM6P194CA0087.outlook.office365.com
 (2603:10a6:209:8f::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.20 via Frontend
 Transport; Tue, 1 Sep 2020 07:12:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Tue, 1 Sep 2020 07:12:30 +0000
Received: ("Tessian outbound a0bffebca527:v64"); Tue, 01 Sep 2020 07:12:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8d5c1a0b3913b203
X-CR-MTA-TID: 64aa7808
Received: from a318f9863760.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1B966A0C-BDC2-43AD-B14B-D53C7E18610F.1;
	Tue, 01 Sep 2020 07:12:30 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a318f9863760.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 01 Sep 2020 07:12:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpMX3UbOB2hOQoZ0EymVFgl3RZqMvZzPrgb1RDak5qoJvaam19xUWZHUnxFTSsDMiWAqE2sEujHxWZoUOPSQfN8Kow8bw7Mvrf4Fyvod0i4IZfGeqNRGsWtm0EuAaF3rPuxjD4IYNTqE7hNMzoT4RHsh7SfCrnwypTwPdDaPhxDD+N2KGy/A3qYodupwRvxaJXgg6WwuC72g3YFHVLzd3ZCPT+u4Kq2icqls/ZfbTTQ+VfTw5kJkT2GEwDy7rVhcWQRNALkZ44I8vK7g2G3ioT6uvMu/IKdXGZt/xD8JP9+a+Qn6wDRRSZhh5kzDZCux0jXn5FYZV+8hmPT/yOtOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWqH63iZ6jXjGkydVgFqLunRpntfcCrV9sTJX4wTSsM=;
 b=XLWf9f5oBkU/Gs7m814ioygdKzuusNZtnCGmFIGo8J7gVWkgVaD0cqHYoxGhJIaggGUlbgNejebXuTJyC/aHSVI3JENwf5B50QR9fcxVnIEADYmJOMzPcF6q6t+TCXwkzcjoUe2u/r1r+Sc8gV65egPaw8XR/FPfJMPauUEe8p5xRFAedw8r5Pgy/5uWTiDT0SEzaJldzWN71cj04oKFrLaxrBjBF5DE2922aytKhqoO7XM1kZKeNz+PWlIdQjqrGiGXas0Ch3rBVe8aUNyhlC6LRayM5XT6sMW2/8HBwbD43jrvVehmJL9iO9BU7M+88iHai3hIVr4j+9CiwOSUxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWqH63iZ6jXjGkydVgFqLunRpntfcCrV9sTJX4wTSsM=;
 b=lCeHOm72GDkSA9uOcnCsJiel05nPRXdLg1qExfcCBqFtqJFIpZAdFkPPBepeRErmYKVVjiV5Gm47aOgw4yRat0oyRjY+t/Abdqb9Rmb9WS92tOZVkLKoT7Y/cTdRNbymL83mpe22LNsLmDyNflqN7UevUqynMcJsnW1sAzmwV6o=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB3317.eurprd08.prod.outlook.com (2603:10a6:209:42::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Tue, 1 Sep
 2020 07:12:29 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3326.025; Tue, 1 Sep 2020
 07:12:29 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] license_image.bbclass: Create symlink to the image license manifest dir
Date: Tue,  1 Sep 2020 08:12:16 +0100
Message-Id: <f7356bb35e2add6d62e7dcc69a7391cfe5d0cb9a.1598944108.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: LO2P265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::28) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.55) by LO2P265CA0088.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3326.19 via Frontend Transport; Tue, 1 Sep 2020 07:12:29 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.55]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 77df43dd-733a-4757-8acf-08d84e466447
X-MS-TrafficTypeDiagnostic: AM6PR08MB3317:|AM5PR0802MB2482:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM5PR0802MB2482BE5B0CD01D1592A8CB5E922E0@AM5PR0802MB2482.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 px4BwQImjOudotgONItX+bPBfjtpI8EQBwinoiMFK2QCdVjNoFdMYYLaYtAwAWUXGu1d4sl8PEbKI4GI62cCFOTbw1Y9c2EzcCzEIGr2/cZRT0pxOLdjRDIMzOuk/osXVDToia+5lB15ZQB9PM1WanmwoapQ6kEDEgrrnZaq4/0d5QuF7vCeN3qdOqdLbQQoWvxT/F1q/wijMSEa5TMZ+X1pHD++sVuofTCHGefufvBSBZg4wmeRL3K8EWl1DebubbwAS3sNwBdcVwYrYXdg2nAtBf2usaXiXepL84G3amvK0VzEcKsO7cDrk17IRdtYZdkZFbIHY7UN7os50ZtV0Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(5660300002)(6916009)(8936002)(44832011)(2906002)(36756003)(26005)(86362001)(66556008)(478600001)(66946007)(956004)(2616005)(66476007)(16526019)(4326008)(316002)(6666004)(8676002)(186003)(52116002)(7696005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 pvbWifM3UD304E8F536Nd5hgbrtsFcFEkAQf9HYaANjXpNIhPhZB9dnwno7HHqwuYuU0j6JmDvkM0yZbPTuAuMnKiDJ2IAx2kMDd/mz4stt8nb5/AeN4JHO16BLuo6vACx4/z7g9qOrA8FQwUVPeG6SUptbeuWZxPd/pjtdPc1meQLVy3Bv/QTCF5NNol9uTM9ZGQ3PgxkLcdSCzDN6vqHgnEKGC5QzIcOXo+6rMI9KHFCp932MN67hXvXff96RjMxS09bj60+Lf8hTp8ayoUU6dcozho/ddQI7c9Ev44JzSy5AzOECNE/SltQPaGcVx3NeTVqLAyaiZeKkyTfdF/pbs3rOJdsM7hhS6JFyPDHojcIz+0g9gt49BYNzZAFjhO9jmp7o38HenEVVpksOdB44XZEVzKQclp3Ya8Fe7YUmLsoyzecSFE4RxKBtM1bwS4gP2itikyMlbJPL8jKK5IaEdC4lkkzCOXDmXMklVMhWj3tUYWtwF0kBvq7UYhPY3/nGa5TEWWJ8LoUttTGzyYyIDSsb46CwSkE7QrMZBs0kfOKmyS16sIr+bv4/+n3n55sSzww1clvkNsOqMVGKLz4ixksYxQ7SI9+d4p3qP/6TDdvCXQu3xzlM0QtjRK2nGJCOu/0wj9CerDsGgbsE45Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3317
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9a3adddf-8ad4-416c-4715-08d84e466324
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bbh5S9Aogf0rCtNxGcVmydF9HpSYnl3Qh6ksa2ZEIdeuH4sBrxSjGc4LFmTrCCKYg83ZQAv7aMmhzt/M0c2BevIG6+KKdbOnuK4Uu4Mb/N+zWAQq7V7M+cL2mVUmM8ZNCrnRvaih6cMV6sJS+dn4SQNW/m9nCwUiUy+8FjCDgfsPLb2541slJUNScSwNQu4+eNM5oXCo3GjK72kjc3kPKF7hbRlX1DViWW4kW+IVuevVoAxDCrRmTD5KyNlKMEPsx90JBQsiiCPlrq1I18D8IiEx5Pvk0FLbxWk1SKq8MdZJL77hn4qJSzk6Kkzp/nfufvSM/vXHENfd2tpzTeWxQ//MSi+w+ap9Sj2SQXjTjYlSDI+eQCNYt8aw8i0vETBdoPJJ6PcPQXbJoDyp7vjVDA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(46966005)(956004)(2906002)(86362001)(8676002)(26005)(8936002)(47076004)(70586007)(36756003)(82740400003)(6666004)(4326008)(36906005)(478600001)(70206006)(2616005)(336012)(356005)(44832011)(186003)(81166007)(16526019)(6486002)(82310400003)(7696005)(6916009)(316002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2020 07:12:30.9512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77df43dd-733a-4757-8acf-08d84e466447
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2482
Content-Type: text/plain

In the LICENSE_DIRECTORY each time an image recipe is built a new directory
is created to hold the image license manifests.

By creating a symlink to the most recent created image license manifest
directory, we make things easier for users to collect and pack the data.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta/classes/license_image.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
index a8c72da..682d462 100644
--- a/meta/classes/license_image.bbclass
+++ b/meta/classes/license_image.bbclass
@@ -200,6 +200,15 @@ def license_deployed_manifest(d):
     image_license_manifest = os.path.join(lic_manifest_dir, 'image_license.manifest')
     write_license_files(d, image_license_manifest, man_dic, rootfs=False)
 
+    lic_manifest_symlink_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
+                                    d.getVar('IMAGE_LINK_NAME'))
+    # remove old symlink
+    if os.path.islink(lic_manifest_symlink_dir):
+        os.unlink(lic_manifest_symlink_dir)
+
+    # create the image dir symlink
+    os.symlink(lic_manifest_dir, lic_manifest_symlink_dir)
+
 def get_deployed_dependencies(d):
     """
     Get all the deployed dependencies of an image
-- 
2.7.4

