Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.88])
 by mx.groups.io with SMTP id smtpd.web11.1168.1606270026580019855
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2020 18:07:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HRMtYQ+t;
 spf=pass (domain: windriver.com, ip: 40.107.93.88, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8BzLpCLD42F5pw5y+YsHsCTmPXg742ZkMDe4d5vw8TxWt5Hzkeg7+E2kmqgRHEy0v6VWsb6rmqTVAAsByj6qsGH0EKe39127KjGuSG725n/IIdFLb/SzAOfhJoQD+8EkqwCi3b9yTirzdklvk6gm9Y5zsKYSIHmZeqvczSq5jGNdMYWrPJZw1EmoCwL2O3hOyoejYFsOzg6gfee6dNuCZUpd+Z+Vbs8y5zY5zo1ifpjMCtMy7qCl0HWlaKI0kZS1tr7YDcTG2UF9qqwlK6zyGuLPQdK3kBvA1qnQbcm4zEIXN+RLWer/XnSJ9heRqznQ3yyzNRs36oVS4+wgZmsJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Esmk6tZcfAa+zrbGossSTNxjYHLGpWPJ4xNSymtopr4=;
 b=NuOy+CMOcaysccuRUNy4xbtlmW3bZ7HsSeHre7Vzar2nPmz+xR35ryTD3HI0UNUCtfzOA2TYv8T9pIQUDig8gXsKGCc3jplEvAzGotXjJoc3B2g2CEgyVH+SBcqi/u1PdBAY1e44VcNVUmSEmMbnGF4AUbQDlKsNYquKxW4Ar6v9hNVUwrqRu3W8txrJCKRsLlC2c+JPs6+DJRBj8C9njdLuSfloP1qgVKReC2XMiXzhO1knqhH4YxX/ixeHkIx6z8BNgEdpSvIKyEIEZ4nmylgngx65mr0U3o2Z+LbHFgNx6KwAAeNsLWrogCLvBR6h3IEtcVm+bXTRW1gR1f447Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Esmk6tZcfAa+zrbGossSTNxjYHLGpWPJ4xNSymtopr4=;
 b=HRMtYQ+tYAnV1Pr/jUvA7uOaQt9Pze30IsZYo1A80FxhvO4JPPKNFYXozPdTpM/VySncwUTEqvxWi9LBB/gMQWpbl7vh2LyOe13e1v2m4ZFqN7/GR5ZaLcFjKXGPaS58Uf6hmsbu66PjemPRl1fUH9jno52jSEOWYF2eKNfpX+0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA0PR11MB4749.namprd11.prod.outlook.com (2603:10b6:806:9a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Wed, 25 Nov
 2020 02:07:05 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::2906:8fbf:ad33:c618]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::2906:8fbf:ad33:c618%7]) with mapi id 15.20.3589.025; Wed, 25 Nov 2020
 02:07:05 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] buildtools-tarball: add wic dependency into extended buildtools
Date: Wed, 25 Nov 2020 10:02:48 +0800
Message-Id: <20201125020248.4114-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::49) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by YTXPR0101CA0036.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 02:07:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 173c9496-7b6a-4585-c852-08d890e6ce0b
X-MS-TrafficTypeDiagnostic: SA0PR11MB4749:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4749E7DD63775B4C89533CD382FA0@SA0PR11MB4749.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JBrxdaoeFHnZpcrpL3tYhP4UiB5hWjHuOtFQ+6QOxNJd3e+O6BswZfYkbp6UDv4YJTXJ1uHsI2p5V1KO5UJC5pSQhp0lm5JVi27kbN+5n0UyjCD9CaU/cCwp6qDKOX/HBGCD0K2ZQLUmBvpWj2a8nvZQOEjvX5PyealtYml0vmFVjKCNpP3qPbw2xhHN/m+FILAh1meFoNvf9B6fKIvSaAVCFD8mKOGjhlURvQWTqdot84xKs13+RBa1qAJcY8xApbSSuMENKwOsuuR/pTirDjrDpNjIT+9Tmsog2qqBZm5GZ+s04nLyH7Vi4n4jsTAglcnW8N1Rn+OJKWBKR5W8Dg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39830400003)(478600001)(8676002)(6506007)(86362001)(26005)(6916009)(1076003)(16526019)(6512007)(186003)(6666004)(316002)(66946007)(6486002)(5660300002)(44832011)(2616005)(52116002)(66476007)(66556008)(956004)(8936002)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	GDxLVUDdqCU9qdEjxje/tQbNeoUFFmVaDyHU5LorS1Wq4CpAzDJ+2BwwOtfz7pOnKiR9PIifEG/QvioaQV62loiI+YAR9MV/3C/1zHXntp+6yaXj397LUud0NRuucEfXWZhPPzULJ28SZjQsaBdYNak+VfbxOKlkCdufSTRHtb8Q4jasmT8dReyJ+CA8X65sS3BaSS1e1B26ASTt5MZ6bSVECy5jKiV1pRe5T2kD4HaD4gk0FVzE88OulbJWTgkX2wq5UvOjHRvmlHsSm3V/2j0xqJvtqm5U8aZ5666d056AQHEKKuq0EiceRFTjJXBL5bmUHzv6r3E6fiZl2UquKbQrEE9tHs4aOymDVulvEe5VETyISVBazx7ZRkYkRX8k8DDiXwM9H78MuMl/Mp66qUsBMWG1iZCgCHYDOuFLt8FQrGrYruOczsg+6VqqsSmXRyKIO+rpxEgOOAkF7r11M05PdO1oqZB6hlvDtiRY55lG/8CsYbJPcN4QZ/oINHcK69ga4gchoqdJlEQ/7/22QKgZmUqwvNChnceqpCKztXGEnPrWVgMKHS9T40aE7QLhMG5CX2AxcJ5lhEG0byH6BUkp169wN1S+N/Qq/nWtQneVVFgGdnIQcCjdy935VpRf4PxpaBGzI9gpkzLQevEtjMVAF28LvWWCQeU7T5zrV3JRJybadd8+qimc/BerIlTfp51U9Civ3BqTPYvyhZSJQDk3r6ZWMndYy1xzG1e8FaBi0OdNXbNtbQrYL7+urxcu8RQNq4bJcYmwR45jqbcctYcJW/7OHEu9MJBH0m4G024PSGaBrOYl6HsZyxn1wJr/uFKCAZqwv7N+enDz533kg0hROKBlcz84T8dRoNXzD3K1crQmGzh+hDNRNaUO3u2XUYc3c0yTS8Baj4HY34G5pQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 173c9496-7b6a-4585-c852-08d890e6ce0b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 02:07:05.2128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6D6V7hGF6PtGFyfBxWNhDb5vz3K5U9BigoAUyArWXppsWS/o923jCIayd9L3BKDjk487MELD1rlS6KqyOBLToz5eix9jhQQiqkGPif2YVsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4749
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
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index c32d0107c3..0816486754 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -29,6 +29,9 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
     nativesdk-libxcrypt-dev \
+    nativesdk-parted \
+    nativesdk-dosfstools \
+    nativesdk-gptfdisk \
     "
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
-- 
2.17.1

