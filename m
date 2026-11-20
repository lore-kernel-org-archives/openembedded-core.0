Received: from mx-relay35-hz1-if1.hornetsecurity.com (mx-relay35-hz1-if1.hornetsecurity.com [94.100.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1336.1795159281005018814
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 23:21:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=TPcqpP3h;
 spf=permerror, err=parse error for token &{10 18 _spf.eolas-services.com}: parse error for token &{10 18 _spf-paas.eolas-services.com}: too many SPF records (domain: witekio.com, ip: 94.100.128.45, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate35-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=40.107.162.142, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=pa4pr04cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=2SBacGF5y6AGXFEXpXlqO8IRUuMYPVsRX8oZSvRIHA4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=2; s=hse1;
 t=1795159277;
 b=MGJZmsF2lrsvhDVCTAaoyxd2rxI4VieVcRAHM8f4HCtdujf3Jce9Vnx8K9wyrbTEd9RiwIeG
 cDyLdpdxtaj74LYN4QkBncpZAH9fs+Oh0okYSEkgmwelyJn4n7jnCoITOdn1AB+pAkRpXB7S8hv
 jIFLBOXrr4F4PhcDUI0Jjg8gtw7Vo8p26QGwL9T/QRPFrMRZ2nM0csoJhFaMRP+w3DngzdTupzp
 czuflzT6sU4VlySk6Q8Wwb58lAI6C9Uel1UkWPzPZzsVWTmsSEEdCT2AU0d7M4UTwPQWteHUfUk
 o5btaLWDJuZ8Yn+B0dYR8szScX3tvDxYxwE6kEXIkehOA==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1795159277;
 b=qhEQhWsoC0JM7RBjsCXSPWE4napWA/ErTT9//tVTZjh3n2L4OlUNpSA0sLV3W1Waz5IeNlD9
 fbUT+toqvp8j7cvnEZUmZqGvtGU47hXqZmkLOZxm+mV4dpZQvY4co8sx3z38RWJvMA+4aoGD2vk
 rtI/yH54Zhjp7tHBYfgASAVum1IK7hVwDm3RmHIz5vwapTv8qqtXhZAG4BVALiYCVqxukbmf1cV
 j+NKYZeBOCrkWsOYmFsCoY+ihh+aHZvx4wVrJkkxf83tRbL/xCt67EtSNv8YaQrmsMMF3Fzsgl6
 t7R7rTnzxlItwBw/RI7vVW58Tfph/obFkMAuWm4ekD0mQ==
Return-Path: <hsimeliere@witekio.com>
Received: from mail-francecentralazon11023142.outbound.protection.outlook.com ([40.107.162.142]) by mx-gate35-hz1;
 Fri, 20 Nov 2026 08:21:17 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OtIIILdJryR4axiPYLPebPnwZe67zhl6e9DecJJdXt+MYh+kTT5nTLNT+kzG0IRHhQYYNji9Rv6DBoBte4ZQ34VdISl4t6mjrKe8nLH15YNqP6Rn8WB4LiWTMZPgelEl09jREXCG7EkIbVf3KyKnzKgfnAZWiUbOXoQRSHpOceVp4Y5IQ8i268x3RMatTQzU+Ea5F3a6Wlyl7AcXizjx0lEP2zW5JX2SDm9MFeP3bwEl09YyjResbJQ39NhXWvzle4noMJjNL86PYjp55ZFGOzAPnMeTLrx6Yl5j5NDcHtQJNjcYX/y4AC+OH7pMdz1+IIF2Il6raiD+B9pqFwRApg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SBacGF5y6AGXFEXpXlqO8IRUuMYPVsRX8oZSvRIHA4=;
 b=FtF86K9OIxuJNd7cPvecWxv0rRTNUejUbDnaQ/h4i3khrv3zMitdjptuv4qNIGbnAVDdst4G7mALGzTkaL3f5AtuOJ8lsjy0PGWXfa3LIsfWv8UPnzJDGQnemFWhzJxJ0zJ+hLQDUiDk4Zx4WHfnl6QT4FDoFDgRkIwpw+xSnFkAtrlcb8kVqdQceJ/Xb2Ldb/9TWfcaJkvqTeZB6FBiWT80Prdxyo9lEl0/8xHuFrtaH1BcxYuMsieIDMuN6Etq/5TMt2XwQTRwcH8tJR1FMKYHcyrT2+h5HFj+pHr0d3M5pqTZXOol8A4Pr6iC7X7OfSyoqvej4G5r26Vmsr6PQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SBacGF5y6AGXFEXpXlqO8IRUuMYPVsRX8oZSvRIHA4=;
 b=TPcqpP3hYACINl/F/C6UMD0YxICU1zBlG91wgA6qPhlA2it62ePBkEqDlvyuL1NEU5Kx4P4sDBxNEE5QGLE+5iqEP+cV2IakX9XmU4YZO2DUVZ2aFgF+A6+ssZIuv/yqjZPkzSKM7NBRC+RVXf5kPOG0RBL9LXEbW3xj7AuOIgcVnJSs7mG8LjdUZ97Lo8rm3quoxn6npUSVPQV5axsINgtjuATo5/TX6OkRAv+ENzbpXIFJQKjumVflu5ZqmBrFoI9qIv5JRMouUIcLeGwThXpL8itBPBgE8MQtIkSx8+d6hQko4JvM1bpcP4JuKnxxAFrRtR2/2xxI/rJYDOqomw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 VE1P192MB0829.EURP192.PROD.OUTLOOK.COM (2603:10a6:800:161::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Fri, 20 Nov 2026 07:21:07 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 07:21:07 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>
Subject: [blacksail][PATCH] image_types: keep the rootfs mtimes in ext2/3/4 images
Date: Fri, 20 Nov 2026 08:20:58 +0100
Message-ID: <20261120072058.2724815-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.56.1
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0167.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36f::18) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|VE1P192MB0829:EE_
X-MS-Office365-Filtering-Correlation-Id: cb4dfe2e-14ec-47a2-c4ce-08df46d6d80f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|10070799003|366016|1800799024|10067099003|260925022911599003|260925021911599003|260925021311599003|56012099006|261022105027099003|261022115727099003|261022075727099003|261026140227099003|261026121527099003|261021121427099003|261028144727099003|261102123227099003|261102130727099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: SPwnUc/dyU3mGtAYIcDGW9YkV4bkPgEYl1Y60TBhtzzCEaxpLDta2LOuFybBoJq2v5a9wVFZTD+GO8rYoPsj16N46RAh0d36PG9otULt6Nc3suFLzGXp3lBYgV9jaOm29aOlhGne1NAGXIJZ47nO3o5yhFmzGBVOxSXWcBfHmeQyPfp5Z9OAkgm8ehXdOcaF4E0q6hLlArBf6kdmXb6e6H/E2YpuHUyNjRLQ2mtdzpe6AVlpUXYoiZc4T+O+FWCny8czcT7l2IpGwbwUdQ41sZeJW/GB8VFF2fz+5hQJFKwdWRJbfc5BTBb1wO+f7ByprIzh7fwtoQLioUuc6iV0AoqiiS+B0ioDdSmpb7p1C14eESRFRanOTZF/ZK27exScTqrEmTxP6VTxabb5MAgCuQ5T/2LgrgEdkSGEMWkZdDq6wUVx+4jo52/hOLuNwKmBKwVsAtiGYyNqa0V4yMH5Wzbz9PXjJgYx55qz+MyPnrWqhVtsNia4rt4X+W+J/N/yvuGhfFfrve9Cdspbvi66WUpvQ8YVNgmVPFqQOboAcU2ZQdHBUA+p48l3wyhIKGfMsRUpwJxJRKtUTQxxKqGYsc5yyE1n+irC2iqLurNwQ5guV3LZ9dsAqumtGBEDbVea9jum55E38aWHM6HPMwS5qi6wVekRa9xyj1h13NleQdU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(366016)(1800799024)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(261022105027099003)(261022115727099003)(261022075727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261028144727099003)(261102123227099003)(261102130727099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nCAPtK3Ad/HadXaOL4ar0HPnh9F1swkTvSneA/nEs5tukwWa/p0duX2zppmA?=
 =?us-ascii?Q?beEg8F5MYfvq/JyaSf4Rv1TkiZujfr2rTsPdyBhobFhg2fv8KWH4w4TDMVZo?=
 =?us-ascii?Q?zoMSykR9cDfr2K7bDZX8C5EB5TcO4afEZVxf4aCKPfDsmw2JK8MEWPOQPDbY?=
 =?us-ascii?Q?0vNyG9rliTnLCI4uqhKyu0+7r+prFRRln7Hgp5FhCQiXQJZOiYTyfKnlCQo8?=
 =?us-ascii?Q?kqN0Ua30Fbwo5U41uaHGqZ8G1AZwNgdH+JErpoXf6nGttR2mTf9G1BsrRGdV?=
 =?us-ascii?Q?4Dddom68BkzmdMgWlFJPvDdp/3xfNJ0AEi/4a0DQKqrJ2ybEYFuAdTW2mwJ6?=
 =?us-ascii?Q?D4qwTPE+C8x//84K/HOS8y6p3/E2DmyQvWsQFirezAS4+2NmP5THW71juY/i?=
 =?us-ascii?Q?06v973SBjgYKcp19giD4F0yN15FxmVCWr7tq+FGKGtZR7TB/y85blg1XkLLT?=
 =?us-ascii?Q?luubns+uugCWg7CJl4L/ileldkEJMrC3g5Mdrmyjve3oPHASCfqnyd1VRTMN?=
 =?us-ascii?Q?bomixYszULep9vybYOOC9K4fONH2Qbp1XAbKparzakkqAj4ccJKybjmufb2D?=
 =?us-ascii?Q?Ld0xDMnUfr0qJZcf5bA4wBUkhPbvkeLCSWZOwJ463tdNrhyIvRwYIzKWoyAu?=
 =?us-ascii?Q?1qV49/eRqzAJUnb3SLG1KpHCHoosBSCoKw14Gh2Rr4EakCzHwzPwsPGhOnTg?=
 =?us-ascii?Q?STBtPIkZB/UMPD5JD3eyvravZIu3uaBLJPabMP2hn2kL+JNC5kbOKBoZ6Fpr?=
 =?us-ascii?Q?VA9cmNjog+NKq/Eab6qSX6knAdO2Q9mU8nzAHRRMV/Mzx/DU5iX3R7amgdSo?=
 =?us-ascii?Q?1+yOL36dBbU+HU4NvLMxMY2RhdSPHSgrBzfUU31V0fpaU3ppXvqFAo0Yy9dm?=
 =?us-ascii?Q?8eDHN+CTdizerpStRGwIZ3GOWL9Y0acdS8Ilye/toPC9onZIx41sqrKSfNXo?=
 =?us-ascii?Q?TUkLVfwidfWl65x8d6eGwo8AskD2A0ar/yTCB3aH53OTi8rTUl3sJXM3wsYx?=
 =?us-ascii?Q?76bSpofSJ1r3sMNQCVX/5iL6RzWqenUvdtkJ5Q9NoZUUJhW0REdK+c81gI/4?=
 =?us-ascii?Q?+X+KZiQbM2s8jQvbdYVoQml7e6h/6CojByaWYw+jCOKQvGfeV66dIwWG2idn?=
 =?us-ascii?Q?X0dWaAr/horB/GJc/1zAxRXDq8HS8Pc/6suNjO3UlJqBn0dtByatuZaby8vo?=
 =?us-ascii?Q?s43xIDX88skBtkm4e7mkx4vqfsadJDXFE4EEy1h6jT2aMTfO3+JS0jFndFuI?=
 =?us-ascii?Q?dkKcTV5KhOgQBuJ9Oojh/h+1T9oqBkFpM82N89dLUb9T0YybAnPUuo+KEjyU?=
 =?us-ascii?Q?ZCExLgIYLPDTftobp1WFd+6cNVUOFnV5kxLURKTA65bdPaR+m+dF4tg8MiyY?=
 =?us-ascii?Q?7Bx8AM+fWUoYvkEFNN1YcOQ0q8PgWJL3jg4DWgDPBmyylHn0A2/6TX6mkg6u?=
 =?us-ascii?Q?QQrNewzgPnn9thlpPXoQdBCckT5e0ZWljtAaqZ52WOx+/bGm8ybinlpyg0GC?=
 =?us-ascii?Q?e8GSvFySnhxxg004OflydRvnQ0B161kqkgpmRwMCABhy5dXWOma/f/6/o0VP?=
 =?us-ascii?Q?mGhoToPrbqAtXF16MmV8FjwsJ/Bcxk8I9o0dig1fmgCvWJTo55u469jzleuw?=
 =?us-ascii?Q?u5iLVsuKwyCfa76FLX0zdYzxfi0XxnG9BqjuUCxelCnS6pJBprDF5MZT/QX6?=
 =?us-ascii?Q?clfoLa7Vi+3vR4GHWXgk6w2FMzl7tKy7JsEFp8Ff/DAuErZeFSzKy8HT/qre?=
 =?us-ascii?Q?Nv68cRKIJrMM1SyjpbwtpadUTGwNIVOEkP3fUk/OhRLq1TDHxfhUoRo1oKQ4?=
X-MS-Exchange-AntiSpam-MessageData-1: b9Geu5+2eTIMXA==
X-Exchange-RoutingPolicyChecked: mKlmKxulXtoHnvdRoOh9ML3X7WwyEwnY+6JNuWFrorpJ+kBNwkwG7wV6hluQXnVfe2N6TpAViUnxl3x5ux77hDksacYUzptXuMOmcr8WAuK+rtA8OMPwG6b8vOyMVw2onGSohX6I2ka5+mfJi83+WD08d86vCE2wWg/YgEN4VgodJdwCEsUMdYxL8yCswuR2BWRIUPbwapdaHWXduIdGLTmwrRBBI1ffRAPf+M7kz5PQSQIb/Bm2M0/qlVh7UIg9XxQ9xkLVPHSTTYDzz8zsV8XQ2FCoREGxap9/fedcWQ1qLUWrc6vr8+9m5MxuZSXp7dDnKjPAKpDdElHmtckLjg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: dAEu/4tzWei7P6ZyR05jaq01T09apa990Kz583Il2gcz/FGtWIgDiSdGSdxFGI/tM0b4/O7eyl9EmCR15wKZ4blHZmHGxbhOPiF7muXUSRtr5vl/ieFUFeh1yMMbPfE5y9brGEf/IO9nNzTRyDtES0nByhFCLelI0dkqfs7uMY8OWmKqLWP7Lq4YliBYTQ9FW4V6yCP3x/T04GMbVWgL5K4KezdX8al8RxiSM8UvnWTmsGyEeAw9Hka2t6vNyRqhKUv8vht2JtS4vICJfI9QQAewJ0H3va8Qyf9WniibZHiYFDt+Q1viMIxvbbPMuK/Wr+2txdKVQc6983mCCzib0C4RgrrxIHBfFUXn+f7Dyl8CK4J+Opykdbs2C/M1IABreEMeWLQgLMyjD2hJtj9gKN9XCI+SrGfip9+jzTb2nBVKitSSQnUkvEJFtrEtqx2xUTaWLpiQVsoddM746bx+dFhbW3cmFilJFpAPsdsGwQqXYVi1RGNoFzhi4nwr0Bevcif450hXZ7ZkK8XCkg3p8VDdh3IpoO14OJRZftDJuw1lRNSkzr1zCCagwFsbZrvJXNOB4q8lfS7KH18+3ScKXazC1OW0AfT4RRdqtukrdW/sjyZ6L8GrPumemYWf3+89
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4dfe2e-14ec-47a2-c4ce-08df46d6d80f
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:21:07.2546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bey8i7tmKg2JJkfoEIDJMTV5lbeJgr4j+GM9gc2+PQ8YuN8UB8R9i8A003GEbFBkqxDV70vwmgfNrz2KubRL9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P192MB0829
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate35-hz1 with 4jW6Fj0kxnz17WYD
X-cloud-security-connect: mail-francecentralazon11023142.outbound.protection.outlook.com[40.107.162.142], TLS=1, IP=40.107.162.142
X-cloud-security-Digest: cb811de6c38c0e4dbcf43bb1fdd0a9ab
X-cloud-security: scantime:1.162
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 07:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250739
Content-Type: text/plain; charset="utf-8"

From: Alex Kiernan <alex.kiernan@gmail.com>

mke2fs reads SOURCE_DATE_EPOCH from the environment and clamps the time
of every inode it creates to it. bitbake exports the image's
SOURCE_DATE_EPOCH, which is older than the REPRODUCIBLE_TIMESTAMP_ROOTFS
that reproducible_final_image_task gives every file, so an ext image
carries different mtimes from a tar or squashfs image of the same rootfs,
and anything recorded against the rootfs mtimes, such as the fontconfig
caches, is wrong in it.

Give mke2fs the rootfs mtime instead, as oe_mksquashfs does for
mksquashfs. It is just as fixed, so the image stays reproducible.

This changes the times stamped into an ext image. Every inode's atime,
ctime, mtime and crtime, and the superblock's created, last write and
last checked times, move from the image's SOURCE_DATE_EPOCH to
REPRODUCIBLE_TIMESTAMP_ROOTFS. An image recipe has no source of its own,
so its SOURCE_DATE_EPOCH is SOURCE_DATE_EPOCH_FALLBACK; with the
bitbake.conf defaults for that and REPRODUCIBLE_TIMESTAMP_ROOTFS, the
times move from 1302044400 (2011-04-05) to 1520598896 (2018-03-09).

Where a distro sets REPRODUCIBLE_TIMESTAMP_ROOTFS earlier than
SOURCE_DATE_EPOCH the inode times were not clamped and only the
superblock times change. The directory hash seed is still derived from
SOURCE_DATE_EPOCH and does not change. An ext image therefore differs
from one built before this change.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2096871145c16d3b534a252951b960f1306740c1)
Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
---
 meta/classes-recipe/image_types.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index c0b3a78013..a5637c2226 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -92,6 +92,12 @@ oe_mkext234fs () {
 		extra_imagecmd=$@
 	fi
 
+	# mke2fs reads SOURCE_DATE_EPOCH itself and clamps every inode time to it,
+	# so give it the time the rootfs files carry, as oe_mksquashfs does.
+	if [ -n "$SOURCE_DATE_EPOCH" ]; then
+		export SOURCE_DATE_EPOCH=$(stat -c '%Y' ${IMAGE_ROOTFS})
+	fi
+
 	# For reproducible builds, make mke2fs/e2fsck deterministic: a fixed time and
 	# directory hash seed (the fsck "-D" pass reorders directories using it).
 	# This mirrors what wic does for its ext4 partitions.
-- 
2.56.1

