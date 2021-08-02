Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.54])
 by mx.groups.io with SMTP id smtpd.web09.22292.1627921264860722058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 09:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=tVX++V2z;
 spf=pass (domain: xilinx.com, ip: 40.107.244.54, mailfrom: ckalluri@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeZilDPLsMwyUAjhwk8Nu+rGSWjhDfaMuuwRwZGf4AHej6K4ehTlHT0ZD4phxtjhn9hb5oyBJIJNtfF1EbyLlKuQbq+5YsbuCsw3pkoo3hsetXelbH5qufsbpWW81TEXdURq1NyK2SP6rbVI9llv6CtKyoL1Xtg2KGUZnaOE7KoppQas2RsGo8iGrvBBype/7Edjfj9ZNM4ZglJUqfU0NzpFA8jKB+yNmrI39plj65J4DTvM9xip2PVvQLjb3ejTfSx3U3yCy1z0Q43iUwHPdVPWNBd9FNcywacs9r71Ub41MedIMsUATeaku4quilmt1xFcWLZ8rXTsqTEyeqIvZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDeWsSov9YBGTzAl2XozpH+ZPqAifl19xvCtUyeJlCM=;
 b=NGFlrNwYRoV1DjhnWdxnbPE9hS3GTaJQi8fKdHpCCizJjv3rJtaRIQJk4YwaoXwU7mIuHJz93slU5YaI1SF/LVjK2XdBE9tNz3eFy/miApzOddZZdQnXpu12Jd4PNzA8EgxMS/NJud/3H2njwEkPF9Y74xD1TT7lVbh1ZyVMtvGq5mulsqoOWf+FkrQ5uD8Rf1JaKB34mvi4dUuoGzGAvocgi4TzqSqSo9rq17nJj9MK8MuHQZGWxjtZaqBtSpe71uV184maSbcDI/WYFpHrv1C7PUmkMT4SYrQ7vWDG7a03Aj4JBjPnlgEXr9g08siCgRUrJ+xx7Nmc61Y8oj4YqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDeWsSov9YBGTzAl2XozpH+ZPqAifl19xvCtUyeJlCM=;
 b=tVX++V2zSYRCvxdy9Bh/zfvXgOhhmCvPW+SXrC4GvN+BSqbY7xqpJemq8ggMCQNeyxllAWxc2Mr6AdGG4LsubDINqClf8wAazvRoqdk/6ZhGNdvMZSv9q/HaAm1JHiiGA2wKv1msAEYOw432StVmr9gSyE4Cpz/LrCRms+Md4jY=
Received: from BN8PR15CA0050.namprd15.prod.outlook.com (2603:10b6:408:80::27)
 by DM6PR02MB5035.namprd02.prod.outlook.com (2603:10b6:5:52::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Mon, 2 Aug
 2021 16:21:02 +0000
Received: from BN1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:80:cafe::94) by BN8PR15CA0050.outlook.office365.com
 (2603:10b6:408:80::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Mon, 2 Aug 2021 16:21:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT053.mail.protection.outlook.com (10.13.2.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 16:21:02 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 2 Aug 2021 09:21:01 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 2 Aug 2021 09:21:01 -0700
Return-Path: ckalluri@xilinx.com
Envelope-to: openembedded-core@lists.openembedded.org
Received: from [172.19.2.12] (port=60922 helo=xsjckalluri50.xilinx.com)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1mAagW-0006cU-UJ; Mon, 02 Aug 2021 09:21:00 -0700
From: "Chandana kalluri" <ckalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
CC: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [OE-core][master][hardknott][PATCH] python3-humanfriendly: Add nativesdk to BBCLASSEXTEND
Date: Mon, 2 Aug 2021 09:20:59 -0700
Message-ID: <1627921259-32710-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d52f5f43-b27b-4c1c-43c0-08d955d18597
X-MS-TrafficTypeDiagnostic: DM6PR02MB5035:
X-Microsoft-Antispam-PRVS: 
	<DM6PR02MB50358758CD61F029FD648F64B0EF9@DM6PR02MB5035.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qQOfjT948WPf9DydK+EeLloa0pRe8Bylr4u035vxEa/qYJJijkhG+55H73/GUM/dALKO8VjT4fdCUfkE2Wd5J9+EQdlc4IY3Hz0hbbwIe9ORx2YB8h/WSe3mjeKFrf6cnFEUl1BuGIqyLvCIUOWPQqcLsXg9Z747OROcp9xHWiytr2IjoW6JIX2rN9/ZnUCYHkoB0cMRbbGdIlMncCAwTu0MYv6JJG+qnW1RtNJgtMtZ/0QRkdGLmdSxmOogzdYirRryVMAxbM1+/MXtOGxi5xkocX+nIoRKHcxDwr8Ifg3lIS8+EkBjRw4g5gNk1v73Y7M+qpN3QGAgaWn/qMsjv8bxEM2X+Zc7gKt7ZcJaP+naTJX8W4qVrdKmcgZFjqtkXPQr5MQVC7kNJ0dpV9+ndmGM1EDTTrc+gLBgJ/vmbyG5/u75EkUURLomEA8NoGyuKRf16/ZmcF6uYXUpnHUYZq6Q1KojGv/Dwz1N7Hz+17PNJU+JZ3ndevITb7+jIOSrFypKp9JHFZVceYD+p2YtKGGOWFyHN2ZLezbvueDNBdQiMyNbiNIE9lWFDxhmwgQAPLaOrB7jAtBh7anPkJzwPQ8nuRSwRJt3172ixTvi+NuXWSnjF/fHcXlpXKVqwDJXyCPl/bSwZpFh8tElW1SP4GDIC3EhwdOImSnmOKDkSp/dX5smDYANonp+8yPFqM+UwIl6Rw9Vr5IoHXG7WvTu5HDPKmZsjaGZ7GR00/a3i6c=
X-Forefront-Antispam-Report: 
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2906002)(47076005)(36906005)(8936002)(83380400001)(26005)(7636003)(508600001)(316002)(36860700001)(8676002)(6916009)(356005)(70206006)(336012)(186003)(70586007)(9786002)(7696005)(5660300002)(2616005)(4744005)(82310400003)(426003)(107886003)(4326008)(36756003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 16:21:02.6095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d52f5f43-b27b-4c1c-43c0-08d955d18597
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1NAM02FT053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5035
Content-Type: text/plain

Add nativesdk to BBCLASSEXTEND to enable recipes that produce files intended
for host portion the SDK

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb b/meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb
index 6be27f7..a6436af 100644
--- a/meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-humanfriendly_9.2.bb
@@ -21,4 +21,4 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-stringold \
 "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4

