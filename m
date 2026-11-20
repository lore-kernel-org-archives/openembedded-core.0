Received: from relay-r03-hz12.hornetsecurity.com (relay-r03-hz12.hornetsecurity.com [94.100.138.203])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1456.1795160105010739078
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 23:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=rA914K3f;
 spf=permerror, err=parse error for token &{10 18 _spf.eolas-services.com}: parse error for token &{10 18 _spf-paas.eolas-services.com}: too many SPF records (domain: witekio.com, ip: 94.100.138.203, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate11-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.84.119, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=db3pr0202cu003.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=2SBacGF5y6AGXFEXpXlqO8IRUuMYPVsRX8oZSvRIHA4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=2; s=hse1;
 t=1795160101;
 b=sG8mv4I+w/3r4Qug4fHP/FsykcO0sdz1hHV7shGdINBFWRFWcARDE+J1LMo+I5VZ/Etxe/+v
 o8m+Xq1hHod/4WdBgV0T2vgC+FGzZT4oZPZsWQ+pl2cSjeJHynN9J3HHBOfLUEYRYNPYNBJ0lO/
 U2nbgH1Sk5jicD+su8LgzxPjS33VmqfcCzYNcYPatMbFzxRtvKzmoIhcjcCGIHrPUIO1BQzRSo1
 MtlMWPLLAQcJofIiLDwrTUDsNaQeHj4MJOrQhywJRp0b07yldv9Bxg93LSmToDG+1Cmc/84WJz2
 cVKojteuRQc0Xtpf0pJPwx4gPL03hItxQIafXnrulsAEQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1795160101;
 b=Wf8n57dBxaHhnhiTnwU2lgFPBi0EeSZzOcnlqbhu1FsIKJ3YYA/++wQJfvZjW5tgTMFix1VY
 qIriKI2ikAozuZ8pM74IWVcdZYDG1mibUkbpuSVI7tWQForI26HZRdRUfZtjrq/wLbGiCbwaFn8
 oZztDjik5PzNiXYrDAlnMSg/T2UZ5gbC0z3Q/xnlH+3gGt9gLHh1cnhYxyfwVxQ4gyr0RkDhV39
 5/tw4jZOABcgFDQs0h6BQsXBVrjpXjZXcNwGp9PG+aAZS0eD/BCiyUHrmlGD6k69enwEeXwXu4/
 7VhcRfkjetuyiYT6ZRlVqdhoSPI1qeprN4+04WTwNloqg==
Return-Path: <hsimeliere@witekio.com>
Received: from mail-northeuropeazon11020119.outbound.protection.outlook.com ([52.101.84.119]) by mx-gate11-hz12;
 Fri, 20 Nov 2026 08:35:01 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXZFvSL8CRl0x2370JYPe7O/yMZ8srN3yUuK/lUU94PXUZZyIpsoH8HqRR7R0D8GQd1scqHjYNZw3DsBJTC3dzmHDtdG6zDp5N1ssbh4m+Qpkm2AYkJAJWMtnGTm7MNssLw/PLFXz/10U/AbIDppFc0yH5yUdVCMtWE/PcJN12CmtztlGV981TXNg8DWwQKke9jNFuC7UcrhE67jmU/VI5YwPoOVMqma2NC2Wb39OfZ1brGUwU7O3MYGpKWqYWH9LQkCV46nS8WLbrxbsCLI+EDwOnrWfTnNxshnNufiFjaDpQQI7Lor2Dou/+lAoXnvHwvHoYc5UjIVC4iAPOtZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SBacGF5y6AGXFEXpXlqO8IRUuMYPVsRX8oZSvRIHA4=;
 b=h8N6kFvDo9Buc91MtFJl1Dc7V8ZeEieUw2cFQTeeK4CD2mLrvZUUYZleShT9BV659Vnbz0H/WPi7U/BL7Bs317uQHIsRjjYSKt4j7alsOTuW6yMBIvGrMoCaJVeFxJOVCY/N8Pv7TwrJtZn/XcMm7Rx0w+VlvTK87DT5gXFBCOSsawEH7SaT7306DQanjSNhDk24auvS7ivv0QvWDmnTKkUWmbyk5T8gBQCn+P3HZDz4dv5KB7t5llgG6JaBmzkLwXYZ2PV8gntLpWJSy7H+gKHHq92EQigEya6mcCfvggX7+ZurPJfOntRXfQt4FSb9waGh+k9YUAua7g+1/gd6HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SBacGF5y6AGXFEXpXlqO8IRUuMYPVsRX8oZSvRIHA4=;
 b=rA914K3fkLvnVQc5nTvkygdBmvJFwXM60Wcl65YnbphZ23Ak/mVPnXosyGdOAlyWg2ELKdvTe0jaZvOnFBB0mNnxIgVuVuD9PIE2hsKdcGL+T8OHm7lBeD6vGf+TTOhL4ZLh86cKMbPC5ak1OgXP6ql2aCWAuxpywWwoyO8XVp+PpVAe/UfuUM4XD+dn+XXAoydD0lRGSnfJvOlgKI9nDZsE7FMCaBa2KZcNYn/nsFiI+ewzi8Dj1eCF4S58+vpA3xvkSpHDyIxCNBi/xV/+y3pvIj+DATnHK4m9gBSINc+GA0HA3iEJZ4lYRqYaEpnWg62ruRLS998rplX1FZGJhQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 PA1P192MB2827.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:4e8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Fri, 20 Nov 2026 07:34:53 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 07:34:53 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>
Subject: [blacksail][PATCH v2] image_types: keep the rootfs mtimes in ext2/3/4 images
Date: Fri, 20 Nov 2026 08:34:39 +0100
Message-ID: <20261120073444.2734478-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.56.1
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0032.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::7) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|PA1P192MB2827:EE_
X-MS-Office365-Filtering-Correlation-Id: ef2a88e4-14ce-44f2-9fb8-08df46d8c45f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|10070799003|1800799024|366016|376014|261026121527099003|261026140227099003|261022075727099003|261022115727099003|261022105027099003|261028144727099003|261021121427099003|261102130727099003|261102123227099003|56012099006|10067099003|260925021311599003|260925021911599003|260925022911599003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info: ZhmHA9iUe83DLSusJQrGJg1p8vYzXUbSQmvLGqqZw+70ELPuugwSE1y2C1wiFb6zSRiCi/KrExuhnHg7grooDUSpFw79l1rgq931oFhqrb/lZoWWozYrBiqRv1WOK68k6QE8u8KQS5/jh1uulQS+PgqEpzoDTeyyA+hgaZEmSuTHez0cJpSnGk87YigvBPDb65sljWpff14hB/cCGMjqg35WXVye/xwB8zgOHtCMSSuz45y2Cc+WfWrtEqcAnyP+Y+/vwFzykMoM2Mh4ULXgWfQjkWTcvjuwUZcDHdkMwrB9sG51s5qhyXTFQxpaIxdibRyZa6b0p6MDPeKV8Ynp4QrtC9AFB50NH6YpBzQEc4ab7VX1RRxMAexiVBtpMIu6sBqU7vw6RiACWQJh6wxvABLnAOBnniolbEKqVPLdzGObr9xegDAkMQzb5moV8dgQWOMy8+yLtoKz09BwHmedo9b4fTmARLTpcpiTdQoMWV2Y9+QT0kOT/hNDwchMof0lovTrGybBvE+slNZQ2vKw26kDLmzGxLI+K6/UXgeUDBNUZPUNLC/GcTpFzH65gBKTKffmAnKeItGrbTG1uA+bK4JX5cSRTWattx+2uORdZUYQNQ08AtNVNhtEBi00JUW9HPrM90TPixh57JUClubt0g1NAn5IS9d12iiT0XwiSRE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(261026121527099003)(261026140227099003)(261022075727099003)(261022115727099003)(261022105027099003)(261028144727099003)(261021121427099003)(261102130727099003)(261102123227099003)(56012099006)(10067099003)(260925021311599003)(260925021911599003)(260925022911599003)(261009223027099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EL/Ta6eyQQDqlOZdhxTRdF58Swz6XLi9hz141rKx8qP4j7BWj8ZKyTn698kR?=
 =?us-ascii?Q?4UAdWk+RR1q+8PUCbS0i/kmYGEPWr+s4I6LVu4DlgM6u8oA7va/ellaA1ClB?=
 =?us-ascii?Q?BT3Se5Nnju86y2aH+ISZW+i6YI2E2ZSaJkxxcopqBG3gHORhPQ/57GiomqxU?=
 =?us-ascii?Q?hG0lk5cDdOki3jDT3kv+Mdx7oXe4qN3KQ/otYE37ol+clWAjdG0z96Y1InZO?=
 =?us-ascii?Q?pSboQV+RmCRskIM3MuQJWTXYbP5W/83aMs70iEi47IWMIH+TVFWKXw4w1h2u?=
 =?us-ascii?Q?h7fhcGSU7v63XcYpXptp8BQXhq3ZcbaMeJYXSDk1Uw4v+qCZ0ltdZZWtIMAZ?=
 =?us-ascii?Q?XQDMnN5YmsCW54sHPz2m/U7ei/Xho/Nv6skUwsGxR1hpruyY2Vb5lH71TmyA?=
 =?us-ascii?Q?ERWwJDzVTvk6Kgk1VSbS9DVRNWVEo8LPMax0g3QUaHltWqe1ekyJJBRl7Ive?=
 =?us-ascii?Q?CRPSRtYMNHux+jsxGNhHKNXYgOMTpFKjLQzQZjE1AfNzX+HHP+LltrIe7Ge2?=
 =?us-ascii?Q?U8lP5ErWuaJVxa7xN5eElt93BX7ZMT/8b5yL/v/wDjVg+A/Jw1+bHN8wCCet?=
 =?us-ascii?Q?64sWf7r1VFM37pM8Sxi16fnsKy7WJJszEZIBfa9KIGjWuZzxMy5xTauZeD+9?=
 =?us-ascii?Q?7nKk2MOwWi2G5THhtUKFeM6JEYFkZYiN+XdMmcpuNso1d+YUi7xGWPEHYMBh?=
 =?us-ascii?Q?w4MMk7oaJz949Z43R8euoQtmVsRJ7vHthveoXF2gAGrd2IXjq3U3t+sGrATo?=
 =?us-ascii?Q?zYIcAHHlHYQNM+MYmZ01YyZ50i3Q26rNNbZHpzms3Bs+/wL5KHXydwdaGtuv?=
 =?us-ascii?Q?+Qrsbnqb+BYqyheqDxjcrgto0ixzgOGNevayJpk2TysogZWqlsgGw7hcI7XQ?=
 =?us-ascii?Q?reFLVmR/cwzViEOgDWXSS6XqbKLLl1zIOQ+9L7c2gyWp8hGF/l2jeTd8FiS9?=
 =?us-ascii?Q?64A56SGjQyPqooZh6r1ZNBlttiKbkfmkco2eq6y2pNYxMfCNtu4vS610JAq4?=
 =?us-ascii?Q?lp1EN86mPbueWzuCyNyPjCpDj2D0T0RBJc15/aUn71FWW2f/KorLJUl5eP3T?=
 =?us-ascii?Q?b0XjkzA5CBRdLXNTHzkUxr+dBGjyvtb9D0xJ0cOrq4ZBR5PqLKAeZCnI17ML?=
 =?us-ascii?Q?Qt6sWDRdXjPkkkIRuYrryiObqWktOgUOB6IngNbppSl/yrIe7l1bVnsfbrXD?=
 =?us-ascii?Q?hy0SkBqZErLY7upKrNoyHMiK+TCaVC6IegsE4uiP1UAoYCgHiyspG4cmLfoj?=
 =?us-ascii?Q?5XVgpuPxwRtV1ci55X9r1lf/RXcgn/I9ydu07wgJmjhpWXVg8NvdkICXWrfp?=
 =?us-ascii?Q?RqIhog7cTjzh87d3WCi7OQq949IAla6f2BWOV+ygvULSv+4s/Iye9hfGYF1/?=
 =?us-ascii?Q?x/g4u774lDkqW06bgRUKVL/wUgJxnahv9bp059sAuh/VbJEpMg5ENYUw3Qmk?=
 =?us-ascii?Q?2TuNCk8Aj5uS1OmHUnPTapD4qAnpaJt11kJb4T58IibqoOs2Viq/gBbKIQ0R?=
 =?us-ascii?Q?P8VQsWEgnP1l4EvVT7wx6Vaj3GdjiEE8aqAJYkgFU+lbGpDQcHy6KuoUpxyz?=
 =?us-ascii?Q?vOhcmAhRj2z0/RrlykBJVI7swXgx1fY3VIylFJXh757WHzwMXaho3zbUPPH4?=
 =?us-ascii?Q?w3Kmxcois4K14J5la/EtxOHYnX99kMVHqYX46Asc9mUuJ1Fuf3h3DSYL9pMz?=
 =?us-ascii?Q?sKSR5nrAeE2CF1KxZMpmXJ4qddHX18x39tcKScWIBUwsbanDm7YYwim7Js2u?=
 =?us-ascii?Q?mMUoqtpv1c7ZRBm546ROKlqqb4LcHw3LmrNmXzngq9aKif6ZRT1FuthKTFv6?=
X-MS-Exchange-AntiSpam-MessageData-1: 791bmAVoEI7xdA==
X-Exchange-RoutingPolicyChecked: HdeC5LJVeZP8BstALOfebplZa2riAgcD/DbjuQoPe8mnlS1pdol2bUUToEsEH2E785RgsGJIYJgAPT5nHGwQo0YgReGinNvCMwBpE4J5gOlxKDpG6Hp5D9vcgT100DUUqn/0B1+iMmTtZCevv3nns7SLxxZ9cCoIssvj/hvW1DJyfmJdOTvwys7DY8VXYepM8vmQHKz9Z5ThhxD5iISLkJpPGKCQz9mv2HMtbgiw42NQFniE8CuUSAmEk7FN0xN1c+PSNoWXLMY6KxKvy3rs5UvNmVfdicKNSz99IAGP6mhImxr7SjweKj+t1+d4PqaIBpoYWqAzcNvVbCyNseQLcQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: grFlk0LjH/pTi5wnnBgXVZpRGaLox00p2yPgeWO2egm5Y3XT/pg0RsLAmjIj1EOGA/FcR00l8j7dL+NZHijjEKY7qR3IBdPqlBRmUJLUcTR0qkStoHR7OvvjGVrTbGFVt8mwa7EPYMXM5tUVS97akThDyAUV2B8ahki0+pJZzTtVn+m5ksKsM1PrTTJ+2uqX5CXOgQcFGpFi5cVH9G3WahDTty6HP5IRKmJyf92nAvJ1Od7MY4vtf/WFRP6tiBZbEy4x1Ax6X9vKuXRS/Nqwrl7HIx4T3slVJCSZUvSkTPLbCDD6inBDyStW1wrjKjs7rPCtNsQ2H4z90IDdk9f4x1v6FM+2hkrORl0U+hw/t5oBBYD0P6ErCv2ZKOEQ/ZjXpwIKl7iMFVDvidxhhRk1o0FksBuFXSqHETCuZsr8TU693iruO7IWYiLoVqmKzlUL0st4Gzhm9UVi2/x5Afh956fki3ExVTGTG8ArGqy7VrGeBc6AeSPr+uNK0zRQ9JEviN5tI141ntBS1/UDX2NAtXsNzfphpnRw/w6bQQOwZYHdhydhG9iYHZqQIAtzTbsm1bkvjpPtmIw7lrdS6wFV+/JLOvWSpF4YTAEvgET5E8z53dgmsrKacB8uOYKnwdSv
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2a88e4-14ce-44f2-9fb8-08df46d8c45f
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:34:53.2171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3oDKskY2lWDmpCntSH25BW8KxTCpaof6ylSex1G5aYUYpoQcv4Fl4B1upu5ynD/GC6sAIX9NiFRSFVZaW8oIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P192MB2827
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate11-hz12 with 4jW6YX2R7Tz46VT0
X-cloud-security-connect: mail-northeuropeazon11020119.outbound.protection.outlook.com[52.101.84.119], TLS=1, IP=52.101.84.119
X-cloud-security-Digest: 55c3c1512d435f2a231695bf809ab5d2
X-cloud-security: scantime:1.335
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 07:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250744
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

