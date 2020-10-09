Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.42])
 by mx.groups.io with SMTP id smtpd.web12.1906.1602276772015699182
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 13:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FbhjWf+I;
 spf=pass (domain: windriver.com, ip: 40.107.94.42, mailfrom: stacy.gaikovaia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ap8Lsussz4av1pYc4qeC4NH562yB6kFheRDgwpVyzZnc6cq5aIS1T++1GvMHkhv+1q3Khu09bj4FySHyGOkgKZo10bk/+b9PfeUtJt5FOIBbsbF33uwEhk+2U8ELlIyCEDx6EDsklrjVRvSKeAn7b7BwLNsU/o0Ek/NojFSlUfsEWUCiQBf2MpfvqT7qpjSRtBhapcb4bATod3t4LMnEqOVooVmIbspfImF9vsWyXe5caxW+ZGTVrz+kzrGRyKlVWi9bJkt/xSwrj6IZbA/873l4oU8eA85UM8JZxhYbp64IvdnGHNIXHSvSX5XoKUOIgXeVm8ksKxv2adHlaSbVQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upl8agZRsLriEPEHW4gCfbUSTAx8GjevniZZNjVpJ5k=;
 b=KyaXIHhFtDdm/JHo9FexOb4kQzSbamZ8sgztDy9NkRCb8GukZC1tu4RNNZW1nbhRMcqZiaIvO9KAUlLHPZahgA7qko7w+kh9L3YARv0OtLlsG9ts2tfg68fywiN7HXXP4cvXv4hxdWdPJ/5y37/BDPi+yJ9vRfKM1Hqx+oHhljFSh92D4e0dOscZ4Te+yTZNty+WDOPxGY85aMFG0tJjaAwb2UtHe1HHt5utzvQWTU36R2rG7oFWv4xx1uNWTXs/CY0mdmxEYwqdTN9N7By2GoD7NE1sz6MrLTwHnartiOWPX7XTvxfc0z+ef9jPGwk3dRtfVk0vzNK8j74bzFwAlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upl8agZRsLriEPEHW4gCfbUSTAx8GjevniZZNjVpJ5k=;
 b=FbhjWf+IrzQTkCKTbynDNPCP8oFJGJFlM4lEzeiI1UFFJ4Xn7ib98BYNi9Xizr44I5dvnCijsuuccsN3fc+a41FjJsICm0tOkob7ytbCxCRANO52OdwHYmQXQQTF/bTp054oQ1mLnMNOwHq/G6rDNQylfB2WTwIZCoGoRzX2x9E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3127.namprd11.prod.outlook.com (2603:10b6:a03:91::32)
 by SJ0PR11MB4798.namprd11.prod.outlook.com (2603:10b6:a03:2d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Fri, 9 Oct
 2020 20:52:50 +0000
Received: from BYAPR11MB3127.namprd11.prod.outlook.com
 ([fe80::b1c4:b8ce:3c62:2b94]) by BYAPR11MB3127.namprd11.prod.outlook.com
 ([fe80::b1c4:b8ce:3c62:2b94%4]) with mapi id 15.20.3455.027; Fri, 9 Oct 2020
 20:52:50 +0000
From: "Stacy Gaikovaia" <Stacy.Gaikovaia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssh: Upgrade 8.3p1 -> 8.4p1
Date: Fri,  9 Oct 2020 16:52:37 -0400
Message-ID: <20201009205237.682068-1-stacy.gaikovaia@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::7) To BYAPR11MB3127.namprd11.prod.outlook.com
 (2603:10b6:a03:91::32)
Return-Path: stacy.gaikovaia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-sgaikova-lx.wrs.com (128.224.252.2) by YT1PR01CA0068.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend Transport; Fri, 9 Oct 2020 20:52:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de1004e7-8afb-4606-3429-08d86c954887
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4798:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB47984E127D05CF7D96FCD25EFD080@SJ0PR11MB4798.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KK+rGlTYMrrjkQ5UCiNXEIzBJmIKCprPAIWTH0qiz8N0//vocWaPWhSiUIdE1w3jIs/SgsMPtpMFK0wnWwC3lsydcy9EIjEwTcJqQzRsWH7RrV4xqoijAD0KUdDyBDCF/U0SkpuTRpiek4rTuagBp7Iteyl2mrQW84UtlzSFtxBbAagX1a4S3xF3jTWG03rwxjLXR2wuycSzeyHeIM4NYIMlRFY5BUzVB1U/HSyyOOduWwo0IJbRkXHYOPIwXZpGCCTHWK1ReeO7+/K4jl+5+IwVK3bXlz3Z2PFOWjD4O1e+hoC+JoRPRLMBBAnJf5efPVn2uLwoiS4nolBC1DupjwwLdIXBt4k0dczFPfPVtIQ0/3/qewGojzVgrHlWxaZpuPBT4468T3CSQJk0l2sL8g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3127.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(366004)(376002)(346002)(16526019)(6916009)(36756003)(83080400001)(478600001)(8936002)(186003)(6512007)(86362001)(8676002)(1076003)(6486002)(956004)(26005)(44832011)(316002)(83380400001)(6666004)(2616005)(66476007)(66946007)(6506007)(5660300002)(2906002)(66556008)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	CPOUSMbmmX0JewErVzi3DpR9nNgUdEH+35GNY0mliNe0p6ROTBm56MpRf8scsaC9s3vBuisYAVlYyqpGKsPzS4wx9o4gsqAyrzV7xtUg9M5PSmRYJ2O5nHE3jbUEDIBuc3egA8l6BNuDzWMouQTqkTxzViHQNFVzy80dCEDwhwVJ/U9wOcIx+Wufp6t0axzyKgxU1YIkE/HJI4pgfENU3Q4UgokZfTipqf5Tj1I7qrY6hkOr6wbaUsrbdinsEeqbGBVShHs5jyqyNk+SI89RxO/l1PMQJ6J7pp2e051hl3hqbvYo8AincIoKTjoTazDAXNzKqneT+TcBJAmWhOwh1uvj4APnjHHBYgmtgJFdiAizNWVFPnP6aOXdpRnx1ZtlpbM44m0zVGRRHBP6V83+AQqf0nwHMi+uTL69uAXYPRfxaNBJz6a/fEc1V91iorOueIrkHPvAtS1J9S2ivohC2BLE+QtVM1Ua+3CUSGIPUia666LIbWGl7rLBJhVpX+ZliCauscCr8c5wHlFy1iZAAWgQe6RaslUGGNkzViAhWkIm2jOQ/ws5IixMTQWfPldEIGLuvIORMfXbHRLWC5l/yEdO8qPgPigJcmgM5wasR+586y0J8ti8gN+tfDOhQ2RSfgGqXG7ZBnXe+A6XvF0TXQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de1004e7-8afb-4606-3429-08d86c954887
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3127.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2020 20:52:50.1139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j6NHZerXv6/M56Lu3AR1I33uNQV+QJubI9rcI6Tllm7ThLMWj7Hw5EQqHTfLwbtNbNv98LRLIt6r+jeZaBenOt7Of7XWyvX7fYFK4BzKPtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4798
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>

Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
---
 .../openssh/{openssh_8.3p1.bb =3D> openssh_8.4p1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssh/{openssh_8.3p1.bb =3D> openssh_8.=
4p1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb b/meta/reci=
pes-connectivity/openssh/openssh_8.4p1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssh/openssh_8.3p1.bb
rename to meta/recipes-connectivity/openssh/openssh_8.4p1.bb
index e007328704..720b238e71 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
@@ -25,7 +25,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/p=
ortable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            "
-SRC_URI[sha256sum] =3D "f2befbe0472fe7eb75d23340eb17531cb6b3aac24075e2066b=
41f814e12387b2"
+SRC_URI[sha256sum] =3D "5a01d22e407eb1c05ba8a8f7c654d388a13e9f226e4ed33bd3=
8748dafa1d2b24"
=20
 PAM_SRC_URI =3D "file://sshd"
=20
--=20
2.25.1

