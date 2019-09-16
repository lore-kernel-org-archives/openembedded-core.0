Return-Path: <danc@opengear.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr790044.outbound.protection.outlook.com [40.107.79.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2E7867ECCF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 01:14:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=SBw0MaCtcJz4sXL8gZNAme3aHfwR1CN6mHufiuLuJpQnkRZEKz2lVPF0j/0UDu+go5yE+hp8RTzSnOtPzWvqUYSM61NpKeEXk52NNF/Fg8eEMiXWP1XWo8/d0dpNxZ5QPFVhMGLg+0mepsFLswB0T5hOJfhHHFKpnbqcRXLUhmOm3RW5rzkPoZaOnmgvZKvZe2ysnzu6v7WPh6gPpRTYBE0mZ5dZPZmtGNAFJM9bqGd9aelyCzAYd4FSV8Guha6yDgo/p+BShyVjTwM/GtRnNy3mBAjK3VL/rDB7SsRwtb7YjjVh0pcNbzY3j53BPpAngzgg5/6TqcoXqLth/ErIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dCEaXavbSDy/O67Hs5OZRSXcGYgonVD0EdN6bzfr6Ao=;
	b=le3gSe492BkYoc5QvZ2xx1BvnUWwmYhps2BJ/WhLHtnNTxh3NSASMKpGXhNreQJiOcUxbMIErAjf5+EpnYXb3m7MMxRpaX5rLy+07mHNcKL01WOEa/myxkSNXtcE727uZiOyqAWqlylS9hBPijkPa2JY68/47mVGRgggWokidZp4UfA6tJ5ewjOpU5VpaztQt1EJU6asns4tQbket7RQ7kLKVzJRTFdtOb8CI83dUURpWk/sdG5enrBNy6KvefjQ4/ObqNMO4l6ikJioDVyaySIupLSoBEepAjT2dU56KEa5U9RDL1dKivgfCOOKcNBOv8/ZteBDwjxK7jsOnde5WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dCEaXavbSDy/O67Hs5OZRSXcGYgonVD0EdN6bzfr6Ao=;
	b=DMkeu99Bxfn+MDnvHxZ6/5Rqeg9Nx34ilqwuQL3Jaw5FiUj0SrQRYsmtIpxfruUD2r8VUtPqHFrK0o5MRg0+yn6n5bIhdgVVcQG3pswIM2NvMZa2ztWYyD0dC5wyFuIBO9s5OnLRjG7PS7aCyBPh8wFyNvYm2agvB/mQ36vmSkg=
Received: from CO1PR15CA0083.namprd15.prod.outlook.com (2603:10b6:101:20::27)
	by SN6PR15MB2302.namprd15.prod.outlook.com (2603:10b6:805:23::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.15;
	Mon, 16 Sep 2019 01:14:42 +0000
Received: from SN1NAM04FT022.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4c::208) by CO1PR15CA0083.outlook.office365.com
	(2603:10b6:101:20::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2263.17 via
	Frontend Transport; Mon, 16 Sep 2019 01:14:42 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	SN1NAM04FT022.mail.protection.outlook.com (10.152.88.146) with
	Microsoft SMTP Server id 15.20.2263.14 via Frontend Transport;
	Mon, 16 Sep 2019 01:14:41 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 9D0AEE84FD;
	Mon, 16 Sep 2019 11:14:40 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 8DB8844A5606; Mon, 16 Sep 2019 11:14:40 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 11:14:31 +1000
Message-Id: <20190916011431.32587-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(4636009)(396003)(376002)(39830400003)(136003)(346002)(448002)(199004)(189003)(126002)(8936002)(2870700001)(14444005)(6916009)(4326008)(2616005)(476003)(2361001)(2351001)(103686004)(26005)(7636002)(305945005)(36906005)(44832011)(186003)(316002)(42186006)(47776003)(70206006)(6266002)(36756003)(70586007)(51416003)(76130400001)(1076003)(50226002)(5660300002)(2906002)(486006)(246002)(50466002)(478600001)(6666004)(26826003)(356004)(426003)(48376002)(8676002)(52956003)(336012)(107886003)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR15MB2302;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3453c500-3fd8-4c7f-090e-08d73a4340da
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
	SRVR:SN6PR15MB2302; 
X-MS-TrafficTypeDiagnostic: SN6PR15MB2302:|SN6PR15MB2302:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR15MB230291CFCB13257F5AE0FD19B88C0@SN6PR15MB2302.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 0162ACCC24
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: QEj2EknhxJnNptkW1p+7B7u4j2T3IAxrk5ZBbUwcqCXaARXTB7QU1ccW/Fe0mel4qAhI6Ay/lWaabF6v7yILB9FBq7gSy/W/gAuywj2hpZe6fGU8CONmixgFj/y7YJo3XdFzuwY8R4HjnFnZv/DnK16A9YV74YCO1YHvzlCrvTWstuB/WmwREjBrh5z6fCpZf1QXG52zopONe9R0Ju0CNVx4GON/XYKX7jRWNmcuPsaSA/CpevF/pDRn+TcGg1hIlOUANgus1PfKahwEzejPfbHzjUnGy2nbQodEUWjpp4O1qqQHAeDSaIPnYX4UZUpt+PS+6v80V/2AoBMo+LgMQ6YsvxW4aQn6v7HFKiWsZecbnLc+FQSnRyrroVY9AAXNXHdVbcZn6VCULy007ZIQXbHKaTc0iFGS7CDML7aY86k=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2019 01:14:41.7384 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3453c500-3fd8-4c7f-090e-08d73a4340da
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR15MB2302
Subject: [PATCH] grub does not require freetype
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
X-List-Received-Date: Mon, 16 Sep 2019 01:14:43 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Freetype is only needed for the grub-mkfont utility, but that is
disabled at configure time by passing --disable-grub-mkfont.
---
 meta/recipes-bsp/grub/grub-efi_2.04.bb | 2 +-
 meta/recipes-bsp/grub/grub_2.04.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb b/meta/recipes-bsp/grub/grub-efi_2.04.bb
index aaa198ea23..e3a8bf39ab 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
@@ -3,7 +3,7 @@ require grub2.inc
 GRUBPLATFORM = "efi"
 
 DEPENDS_append_class-target = " grub-efi-native"
-RDEPENDS_${PN}_class-target = "diffutils freetype grub-common virtual/grub-bootconf"
+RDEPENDS_${PN}_class-target = "diffutils grub-common virtual/grub-bootconf"
 
 SRC_URI += " \
            file://cfg \
diff --git a/meta/recipes-bsp/grub/grub_2.04.bb b/meta/recipes-bsp/grub/grub_2.04.bb
index 1d1a45670c..3166d1f2fb 100644
--- a/meta/recipes-bsp/grub/grub_2.04.bb
+++ b/meta/recipes-bsp/grub/grub_2.04.bb
@@ -1,7 +1,7 @@
 require grub2.inc
 
 RDEPENDS_${PN}-common += "${PN}-editenv"
-RDEPENDS_${PN} += "diffutils freetype ${PN}-common"
+RDEPENDS_${PN} += "diffutils ${PN}-common"
 
 RPROVIDES_${PN}-editenv += "${PN}-efi-editenv"
 
-- 
2.20.1


