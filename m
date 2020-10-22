Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.41])
 by mx.groups.io with SMTP id smtpd.web08.9221.1603366940979814116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 04:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=njdfhB5y;
 spf=pass (domain: windriver.com, ip: 40.107.92.41, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbItl5yLtoFHAlQnzjcySoCo3RK7+Dm7AnWYLPRXfAJMJwt4MWPLftc3yNaOHHhV+bKj36vM/0I5TaJyB2PGrLaT4ynbTw3PcPOB6Nidw68vPp745RAuV8F+YBmE9gvFn0lm6Z7RNmTt84GNc+zVFbrj1z30Wjx0shyCAoJOx9Z7YfZdcNVG7qCcwEkgsNPJ0t+j3vVSOaugDyu8HE8IKzk5W6YuGlQBpq+Slub+9sAX7hSpLzCj7yl+6utYlGaXdeDlsjZOIQ+kCJ3SstyJ0B2Q+007fpXYPv4Z+tSBYBr4/Sbn+Qho1XqQBHM7U5O7Z7X/yVYTBIREa5fRMA8IGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpZWEMVGx0s5xRZmqKW0XYASOTnPJuCI1ne26f9txR0=;
 b=DZp3KC3ubi3d5dqNc1tFtnvGRayiSnpjpbVKt4UDXIAr/ZMNl1C/8UL1jTTaePNCsEKHmPHpPblIpNjg9qsdohSbzko1CGpvm0GIPR5iGODhhlb7R7UR7JI8ZarV5bnfQY7XMti2t5uLeD/HUbwSS5/DWYvneOGF2dPcO6gBqjwHx7QUT2LDxYJieuXZb5slE2Bjxeb/BDyJPJPXmE2cEpyLxs5Bt5IoL29g8JKD0JinbMzJ32jTvPXCcB9gyDva5b3qUzwH1ZGmBfvd86KYvinq4fGwiqqKP0cUCaNcmdQndTSx/wJTNfwyYJAZa5v/TLr+TueRrnrWoEzQLjLZJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpZWEMVGx0s5xRZmqKW0XYASOTnPJuCI1ne26f9txR0=;
 b=njdfhB5y+s83VVLjxbdL5lzA2CfxT9VgzYLJla4zgfztdoRUd4hyKL1hHwCXtkUEygox3UVsRUTLy4Ssu2IS3kQsxJC7J9bjxYg+c9D6Ojy6GVVBHoQCqCYm3GVhwYPEk11A/rpX5fxPXH764YpxsfH2mQRCIcOTYCI5j9XyQb4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SN6PR11MB3117.namprd11.prod.outlook.com (2603:10b6:805:d7::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 22 Oct
 2020 11:42:19 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16%7]) with mapi id 15.20.3477.029; Thu, 22 Oct 2020
 11:42:19 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] weston: Fix PACKAGECONFIG for remoting
Date: Thu, 22 Oct 2020 19:58:41 +0800
Message-Id: <83b4a9e791618f1f803a15fb8dd425b9e8aff2ac.1603367872.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603367872.git.liezhi.yang@windriver.com>
References: <cover.1603367872.git.liezhi.yang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0067.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::31) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core1.wrs.com (60.247.85.82) by HK0PR01CA0067.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28 via Frontend Transport; Thu, 22 Oct 2020 11:42:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e85b5d6-4048-4816-7c5c-08d8767f87f2
X-MS-TrafficTypeDiagnostic: SN6PR11MB3117:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3117DD453E6963034A02E011FF1D0@SN6PR11MB3117.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:330;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	udT1xJnbx+JqwYYNtKpO7mt31WuOenUKH+0NADrpBpA+/ockROlk9TgbEKJ2nxqZiM05/SbTFzVVzuaaZqwvjW3/5CkYKuknK60fwGEccJC+qED4k28C+BuBhoQL2v5md4q1rKCI2/1vwtKmIngUXJMLIvBPYNuZZ2SCcQwvjhWDgBRTTpz5+fOIXrX/VQi4aJ/CsfufYJp6NAAJPWJuDHqAOcxB0tIQLyPRDn6ivafR88l1Z+C/h2hkpQ7Yszrjr450gjAjrumw1ypaUplyyBQCAApIw8K/qBVpKHlDUdHVzIEVxJqlBAr6Q4+lrzUf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(366004)(396003)(136003)(8676002)(956004)(316002)(26005)(2906002)(6506007)(4744005)(16526019)(186003)(2616005)(478600001)(66556008)(6666004)(66946007)(36756003)(66476007)(83380400001)(6512007)(52116002)(8936002)(5660300002)(6486002)(6916009)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	2M2KpXAmTQnRBW25bmGxiKLXlhSPWF+Xqp5G0fn+VgJzgNfjQY3YjE5KJfGqSNx40fbHfpoQEfOkA73iXu+gR82o9RQMHfE3iEvPUYHupkN+vyHGQPoKCFcFUPZ05qOxWgLr0Qv4U7Nk38pkow35qwpKUqAOqQm6K5w8YkFY+kRZ1jypLtxhHwEr/Ltb6Cpx9ufGc7StrE7Z3fAkY5jcxYOjNbhpuQgfCHkPSigbLjse+8p63xgKy7Tes4cbWDkCeGqjPpNtlXUvoAMwMoFQCxICCp/86pJ6qCIrB66ZlhrOMxphg3t5X9sprVxViQ9MQmKb9YR0FGWQL7bPyY4cjucrsejz6rrDH0PxsRAdHV3hALvtWxlYaMbHAyHLvOa0FJ4w3JKnDEim0Wq8bnmM6QDpiYPQImatI/bcT9linUrMXl+wT+LGv85LUx0/bwRVPuCnzMjgsgi/4XtgRCIJXls9LvjverzU0K+G2+UpjbRzo0C1kG0TySrqqPUcV/+0IuH4FDbQM7dPx+VjewtpbtWZcU75de6G5DAitv7bMTJljhXFrvgMKSzH+byPVK2pCCFUI70liXIPxUnh75XQg6y/o2SvDFPurAUMU8gS6vGESVQjFwA3zNLvngeaVaxuogKWpZ8FV+KhpUa+kvokDg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e85b5d6-4048-4816-7c5c-08d8767f87f2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 11:42:18.9983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xne/DEG5U0rNqBa6aSK/Um+/K0GqaM2Y0uIYsgustgJp7sWzhFNH06owiBzl630N9Xe/nnKEPSGSG0+FOXoaCwTnfNdmT4euB4KCmzlk8Xo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3117
Content-Type: text/plain

Fix a typo: gstreamer-1.0 -> gstreamer1.0.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/wayland/weston_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recipes-graphics/wayland/weston_9.0.0.bb
index 0b037a3770..75f9fb05fd 100644
--- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
@@ -73,7 +73,7 @@ PACKAGECONFIG[colord] = "-Dcolor-management-colord=true,-Dcolor-management-color
 # Clients support
 PACKAGECONFIG[clients] = "-Dsimple-clients=all -Ddemo-clients=true,-Dsimple-clients= -Ddemo-clients=false"
 # Virtual remote output with GStreamer on DRM backend
-PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer-1.0"
+PACKAGECONFIG[remoting] = "-Dremoting=true,-Dremoting=false,gstreamer1.0"
 # Weston with PAM support
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam"
 # Weston with screen-share support
-- 
2.17.1

