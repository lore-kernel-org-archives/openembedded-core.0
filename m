Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.76])
 by mx.groups.io with SMTP id smtpd.web08.4802.1604881932096050637
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 16:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DjCsueLZ;
 spf=pass (domain: windriver.com, ip: 40.107.243.76, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtohVNjAuA5CiFz4tyCN7KVpk2QxxdpveFbtYE6FkGvACWEIq64SZ/TsZfh2RJ+PlppgFISGyWbY6WoCCL+23BbvzqqCLmicTx1t8UUtUXFrEzSNxBovyy6E3uegwaehuLMfNbjbddKJNpdltVc8QuAQA2VNHRXWEbgKT+AOHu/1P+dCQnMUbsyAaB1E+RvGsSpTRuxsbJnqEk06fsF/sV+OpzvrB5ANkQV9v7tRVD6C7ircJdhTIyYrTrjqyjmZ8aEyGAG+z0DT37bs6kOn+uVHZkeY2OGtDBc/QLzVZZRmuH+DFw09V2xK/FgtKZAcgOtTz8Jl5t4CQ9k9SGBB+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylIUe9E11DjiNDVez6cDaNSnoJqCbVJVPI0buLYBjNA=;
 b=WvcZdXjj4oG83gfQbtW2z7mTgvy5GWcyO/RSlw5aVYptWDCB8HAx6Z/g0XJWLkn9yRSpV03JsDVPnie20l9bu+qYl7tu+tZyU/0F6TQHhHdREb6Bja70djo9VxtXuDXv48NBSId8Gr83Vcqk9oIuQ8XA8rZ+si3d6jzrKAmI8xPPVvx9PuLzMGixq57ISvl0vxOwytRGbTVBfvsyoDi7cDK1MK+tyWMlq4KTqKG+6NexVFC8WF7jNQ2irj9M3pTEndkX20eP49YLVmNavhjyROJDLiXYzKmbtjFX0v2/nkOh3sK2LeKJ0zBMhDVTksq3IZM6aLu9+grOvJpoGfxQ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylIUe9E11DjiNDVez6cDaNSnoJqCbVJVPI0buLYBjNA=;
 b=DjCsueLZv7P9Zh8bnLNS1BebuCiR5BYE+3jvBGwsipb2A4/SBYbTcXmmFlERUKzbm4JpMJdO8g62tR88HO2VeC8DEACMQ5OA1E5W1nqLEbeC/vgW6Urc7xyoWFt1WwteFztx5JOwYu1c82TA4pZ5D8fp64uHk2rD4V/LDaIwdKs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB3197.namprd11.prod.outlook.com (2603:10b6:805:c5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 00:32:10 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2%5]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 00:32:10 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] webkitgtk: remove '-fno-omit-frame-pointer' for x86
Date: Mon,  9 Nov 2020 08:31:23 +0800
Message-Id: <20201109003123.31494-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:203:d0::27) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR04CA0017.apcprd04.prod.outlook.com (2603:1096:203:d0::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 00:32:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 291cd60e-31b7-42fd-cdec-08d88446e52a
X-MS-TrafficTypeDiagnostic: SN6PR11MB3197:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3197F0CC7C4D770BABC8DAB095EA0@SN6PR11MB3197.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xyrDdQtw75LnKY5ToChkc9brWRu0AyLMON7WEyxaXyRkwzGDWzkOPNdIvPI+zaS1ccQQbCwKquiTYgvOt5Ow1cZQevbUfNjssiQXQgU5MYHCDi80/mcliJNnZceeN8B+GCiz8I/5UOKftl0YPOoimgtTy5VXVZILd04jzT+tz7DP1DDST1lMgyYLs6RCnrWKlb7r4ZoOZXNoQW6ULrnMPU2HV5HXtme3kRu93u75h1LXcNxmLGJsHYxqWnhXlKgi5SQxuEwq0Im7nVnqTjmrxQ5+Y1XxO54io/Slo+YX7NF5wvwdgMRSKmPSR+ueEukaRMfF5O83A+v49JkdFCak6Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39840400004)(346002)(376002)(366004)(9686003)(316002)(36756003)(6486002)(6666004)(956004)(2906002)(6512007)(186003)(16526019)(6916009)(1076003)(66556008)(66946007)(66476007)(478600001)(2616005)(5660300002)(26005)(6506007)(8676002)(86362001)(8936002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	knhx1opaXcwe9Mu8RScB+PRkkduqjtZYQYzfPkklTpd6eDs2gWMx2NtlrrvDBA1TACMMVSaLC8kZHhrmxmv0J9urZ/oBK5f0/17apg0iiNehSYI7WjjP2XckOtFzGUnKjXlW9VVpQZpK/Cr82aqG1Wzh2Wd7avmR1xcGD+5gTUpRmp4ymPFCM+yObqLnN+k6PyiZztEA9fjRZgJr5wwK+GMeh4lavCL/UymC5GMTJOLpdBnDHwOMCiUy2Suer6fmqkW/72LbG1Cq/3UAcp++zOdKtUBtN7HMhbcw67X9JeOtLhwwqso1Ej0tswF80OJJlYjmsSJ8NaWyYfag2xZQOQnqHsLYHAaKNBDysf8dVG9U1jS1xlmTRPrzqItQiZU2mdheXN4CTwihMW3ouYCJy1gjWgtK354+UWI2LMZSgDcGiGP1aqXJRs4RJXze7RqrOsSQI+4D96T41o5DF7ueYLS+v3dKoDT9Oxq4a4kEFU5pkgzBA/+/tA7COSCyTjbD3GnkWdolqr7P1TOERrPZvCT/DTIQ2q5oPrnK1ZQ8CgsijRfGb2H7AxSTqFQkf79FDuduQFr3h78O4sh2ZwyKgzK9yE4LvBvf7G5aWYziZ8ssIWvUnJHSGPPUfSeT4Wn2IKjIdVgXo/BbT7X1Obp2Jg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291cd60e-31b7-42fd-cdec-08d88446e52a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 00:32:10.4077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ls/pZL4NkDQNMBOxvNR+SYvep4SbcmPnBOHMC0/FPOeM9CyJCtGDXaXn3HPZbtcFAjQwu3F+CqfomJdULOrvnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3197
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to compile webkitgtk for qemux86 if compile option
'-fno-omit-frame-pointer' is applied:

| TOPDIR/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-webkitgtk/2.30.1-r0/webkitgtk-2.30.1/
    Source/JavaScriptCore/runtime/JSFinalizationRegistry.cpp:47:1:
| internal compiler error: in find_oldest_value_reg, at regcprop.c:438
|    47 | }

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.30.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
index 1acba6be1d..11fdb59034 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
@@ -79,6 +79,7 @@ EXTRA_OECMAKE_append_arc = " -DENABLE_JIT=OFF "
 # which is not enough for binaries larger than 32 MiB
 CFLAGS_append_arc = " -mlong-calls"
 CXXFLAGS_append_arc = " -mlong-calls"
+CXXFLAGS_remove_x86 = "-fno-omit-frame-pointer"
 
 # Javascript JIT is not supported on powerpc
 EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
-- 
2.17.1

