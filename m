Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.42])
 by mx.groups.io with SMTP id smtpd.web10.2660.1605747056987945805
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 16:50:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fqhrq9SV;
 spf=pass (domain: windriver.com, ip: 40.107.243.42, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAYxZTgwynAmSJZvxiFulXzVfolXGnefOcLCE31u2o3qW17po9madENvd+/gp+x9yp7AMLKxL9qppKiNhD7m9dJyREOrmU7H79kpfdcmNQzaYoSl9lSGtRZ/kfoVq0qrGM3oSNxaof++V0xzGWs6OcTt6D9JBzWLLhtCOPBEJ8ztmS9pc5BuXasHMB2lbNrGqMOn6ndgOlONTEvqRh8shgsFN+r0Uvpv3LgX9gIFTOsUJJ6sJDUIQsZiMmYCUfRkUnq/hlQDJIHd7Cc4c6l7DYv/1QGKRGpmyGgfGqOdjNzC0b/NV/XuAiNqOE7caaM10698ImYMarU0rGFejzI9jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2pEdOisVqRp+m69NBhtzfvPoxHNg8S4xnD6WTZuquk=;
 b=NRW+rt2+qyyFbAoPnPHn0i14bY6HnkAo0yWnEmyfrlOJ+MjoTYnNptw6UutCNuBIUBfHH06UjgPK/sBPqDP08aGZHs5ekh0/7CKvbqOllMA5zsAMg3CQMuUHlO5n/YC66mUjcwYOaV4iXT2AGWVKJHfb4G3/DdqaNYqPbzw4gehUMfetLyqH7hX83baWd0t0Zk37YyYMPfP62c/tlL/+DYkNHxUCEzn5HXDE3I2d0g9/xXRTlPomTxkhq/J5hHejrrNA4myKokeODViiyoyemhBJAxCoa0OQOACUZNtVdVN/ukdZMyR/57AsYGg5Ui6tD4nIy1Mxac6COeURjFhsIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2pEdOisVqRp+m69NBhtzfvPoxHNg8S4xnD6WTZuquk=;
 b=fqhrq9SVRDaT/OLRj1Oj9hMmmYTSOHxI3T/gYRsaJqZ07FOdBJDwxmBnxz6zceLMNag8eBsiDW0rDyY8zeN/3iVvAX2g1RVN4oELddHgJFOe4tFjLhkbIUrUvGpS1B/wHA2pWR0dLKYlfi+YkYlYkfHynwRjGVk3Khvg/6KvVRU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA2PR11MB5114.namprd11.prod.outlook.com (2603:10b6:806:114::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Thu, 19 Nov
 2020 00:50:55 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::e933:258c:17b3:105]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::e933:258c:17b3:105%6]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 00:50:55 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] buildtools-tarball: add wic dependency into buildtools
Date: Thu, 19 Nov 2020 08:48:32 +0800
Message-Id: <20201119004832.23088-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0002.apcprd04.prod.outlook.com
 (2603:1096:202:2::12) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR0401CA0002.apcprd04.prod.outlook.com (2603:1096:202:2::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 00:50:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed4615cd-0daa-44d9-9e1e-08d88c252bc4
X-MS-TrafficTypeDiagnostic: SA2PR11MB5114:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB51141929A3F113F1E8A9656B82E00@SA2PR11MB5114.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	g4x9CoFKF1gN+U/2UDgYNCmLk4O1zUEK+cI2nnLDRoGInz6cmoqD/E2NIkzRnB4li6xRzItIfSrGzJ5w9+ix7BOfYFrmbhdB82e+tJbjaEjiRuByvvsCe7uTXwzcmz6Rn1uRIg8ZIqDaSBe38/yAfat4u62D79OLSfoCwCzFcuZvCN7/NEnrKl5L6QLd4xYB3sLOA2/jtpfOy2KMnRdwe5dmd1vArycV1AcqUwBfN3LnIamAt6c4gd/COixmjm/YeUg9FGUWuZEai47K+AU1821FvDPLKhsdjkAM3z8wN5muVFlE7biEdCokwLmyTXNi8nhytHI2y163KBq4ap+q5w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(66556008)(2616005)(1076003)(66476007)(66946007)(316002)(956004)(8676002)(16526019)(2906002)(478600001)(6666004)(5660300002)(52116002)(44832011)(6486002)(6512007)(186003)(6506007)(8936002)(36756003)(6916009)(26005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	nl8P3a+vmn07Qx4beGHRQZK9cIbV+OePCohxTVFHSZbm5A8aVEa37524GZXgKzdHclLcR6WsJU5clYpoJtSBzZkK7OxD1QDHnKYXhFoJ0HP+1T+EweQafaeQW2Rxri+xHqe1go9yaoKZcDpbJwpdM+32Ezrqhh6me6JxmNXDkfbetsB0+0Mo5xYwW8NPlPwTb33k92mFoyOSrnA+XaKGI1HK2dBuhfgopIVtqz4B2w5aqTrD0IkeW2sTtLjzESJoK74VAeDyLfGfqSM+fiwtngYq2AqEvedZfJQHm4i6ecZzNxbGRkVpqO4iMQNp7+vym5OYX8xDkv/PIFgAL6yGY7Kdzix6BrE7hrNIfwoK2kQSFkDU3RgbDPm69WdNjw2Izx4NAGcLznDkbvzX8adSgY+8y7YKKS0T7636d8j/MEmHmY/MidfkiiO+Dfdz5UrENtTZgYddBJkkj0Q4/Ny2+pV4TL0ugVmCCXmORVbaDyWFP6oA0QrPD+IjZsbWeCMZwJdcgNA+4HfR9NNJ90OpYFKFKQ7npFV28sN5IkFRtzmGpTr1JlBV4quWrVDG2EEpOXYOkkK6r1VoSyKdewMlN92WrLYTMDll5QghEGxydPeHe6ykrOYm/LMjnplmunLPJ7gabQf0RRH7ITwhmovRlA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4615cd-0daa-44d9-9e1e-08d88c252bc4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 00:50:55.2627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5CMdv5Wxcs7C8K7TYhLW4xRZzGWU3yuMeOtHWR6YcuiCCI7B56Nn+4Jbhma1tI5UrIvnTtPR3kG/cb3PXTALo4fZdq5LWebYcQfhfcFlZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5114
Content-Type: text/plain

fix below error:
wic ls ./core-image-minimal-intel-x86-64.wic

ERROR: Can't find executable parted

wic depend on some tools like parted/mtools/..., and we have those
tools in native_sysroot. so above problem can be avoided by
run command like wic ls imagename.wic --native-sysroot <path>

but this cannot cover condition that usr don't have build the
image, the image just copy from somewhere.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 560b8d67b9..7783fabbf2 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -29,6 +29,9 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-rpcsvc-proto \
     nativesdk-patch \
     nativesdk-mtools \
+    nativesdk-parted \
+    nativesdk-dosfstools \
+    nativesdk-gptfdisk \
     "
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
-- 
2.17.1

