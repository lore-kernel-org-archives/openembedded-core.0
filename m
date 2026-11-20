Received: from relay-r11-hz12.hornetsecurity.com (relay-r11-hz12.hornetsecurity.com [94.100.138.211])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1517.1795159838522275295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 23:30:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=QokujVYF;
 spf=permerror, err=parse error for token &{10 18 _spf.eolas-services.com}: parse error for token &{10 18 _spf-paas.eolas-services.com}: too many SPF records (domain: witekio.com, ip: 94.100.138.211, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate51-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=40.107.159.109, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=osppr02cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=mqjoDHOwGqGEBvv89krY6geOJ4jW5oWs2zy6+hj1T0I=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=2; s=hse1;
 t=1795159835;
 b=H1999EAw8AWbrdI48YLdm3NadSR2tJmgnkwIfwv4Q/GC3CKxzZhpswGBB3A/NBKePqxjf62l
 Dvda5Ye9/pYcLasbs+LRKZkxntmvXOyteBLV/s5bluWfYXhvqF1xu3WJopBeRp8rcjPtsdJjslV
 jOhzgK2M4686uhfp396obhWN/x83IeJF0lXHkgnwBmYXcsv4imsSsunnz4P5rEopHT53DCsyVlw
 HOarBO0k1WvC7OdvoiDHd6brI1BnXWOGPU+VL1VWdG2vjHPuUnVGwisDq+YHuoN5wQX8xCiAA41
 ghQrMyDxv4rzDDkRdLLaRaHTmUkQIQoGOl/FWKB/ZN72w==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1795159835;
 b=XXiX8fZRr0znsZkMzAP5T38eMNg1kzlZBsDgxEMYurYbiy/xDPaiAO0YRN1t9VU0kawM2/uj
 H9vmxffAdfGGEpi8Ym+M0WKP9+I5q7z3cdjTxuWmthjyR8cycaPnUFCAo+HUt+kjE15ldaI2MNt
 IQLp/EVHsU6ynaZVccFdA69bip79ifFhUs7Xgv7NAYOl5Mv9d27qAFkj++pnsBYTtb0/0Xf3gl6
 03NtgJct6MOybiYpODgJG2iu2O4bBIR4Y7OdN6WFjkndYEqXOkNs5kBZog2kfOQ56+CpH7+jP7k
 DzquWuZBsGWQWIP1SENvxIJk4oqbQ/a1yDAO2EPCJoWfA==
Return-Path: <hsimeliere@witekio.com>
Received: from mail-norwayeastazon11023109.outbound.protection.outlook.com ([40.107.159.109]) by mx-gate51-hz12;
 Fri, 20 Nov 2026 08:30:35 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBs8MwUCbKFHdODzvKQPmw1rmNIPrJZfH1NcWBCtasgdz1SdE/MbowNVieyZHtE8VGlxbNt6m4lMA3FM/xkklgKZB4p2YWonYKnO0/uMBpKFUY64/L3uYXFAfTOR9a/NPL9wQ9izPzQpDHPvhVK/5XMRntIVqNJkEQGmhc705sVVEyljsArjKa4iI/TmvjOiXDi3XoQP50C5OL2xrgP0KX5OULeKNaJRiuevdBdXsqkVU/RQ+xSKS1NuX3OM3pzgOeSpGAB8q7ZK/sAA3TljYShFYscRm6uP5W5Hr4gAlI3iu0OdNs2Mdb1RTHUKnQEfahz7p0dEwgYsONHzt950sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqjoDHOwGqGEBvv89krY6geOJ4jW5oWs2zy6+hj1T0I=;
 b=tBj0saVpKu1GkITOJdI+umgk5H6xOZlAFAIKm7E9xnyq6urcF9D9X4YxZrA7u5oWDoxAYwZwJGcm8aFEnS/Vm+Tka1YCD/XHCHdFwBIunn0J+FYXmBnwSPTSYi4OV7x1r5Ovh/S1krxLxp+cQRa/Ei9gMZPrMobtXbQoUFOMWLztGr9eS18q6okBE4h480xMwHRBomu6X/bIoab48yJplsiZxtQf2es+Gbf431o30YITvhhRWAFwnNa+bBQSvKqjznumk7QFEU5GgjRM/BiM6IALzBRPptQjaIuVZJBKdvjpJH97769DD3Fq7la0+hRCp0HHPkH/aqtJO+4AglyDIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqjoDHOwGqGEBvv89krY6geOJ4jW5oWs2zy6+hj1T0I=;
 b=QokujVYFbAD4ttvgxmxuehi/64z5lbTeQhNaTSKNy2/ceIrriClvnkjNc0RazZD+EG8JQWMqAKmaUydBjRTttP/EmzFp2oBH8mRHEEY5ePhjrvfY9mlr5djcQXJK+WNb5hjU9EgfnjvwBxB+mcQhLdrRj6G0R6jxqgrarqjydi6krqDjhUDMPOqLwBAOsGnpzAWv7yvJsDGr75wPeSBhDeo0E3yvF7iWwXR7rbWtuhE5mYI3aDKATZOZY9jVT3wyPxH7OxdJYfxSt9G7psffLtPFB4GkV8LKEVZcRd6dKBO/Kq8lIUoyayoL5it+zFjoUv3gjl9w/V13Tu6usspPIw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DU4P192MB3423.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:62f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Fri, 20 Nov 2026 07:30:28 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 07:30:28 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com,
	mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org
Subject: Re: [blacksail][PATCH] image_types: keep the rootfs mtimes in ext2/3/4 images
Date: Fri, 20 Nov 2026 08:30:19 +0100
Message-ID: <20261120073019.2732783-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120072149.2725461-1-hsimeliere.opensource@witekio.com>
References: <20261120072149.2725461-1-hsimeliere.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0391.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::18) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|DU4P192MB3423:EE_
X-MS-Office365-Filtering-Correlation-Id: f0164e49-8a03-4652-124a-08df46d8266c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|10070799003|366016|1800799024|376014|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: E2t3jEzGIp8dxCBsdBu5h3jeQfl9YmW53JVCQkATGJey5pGk7OFEvESvgz5YxmxcWLrIH7pBp5I++YVnCuIpTYRlLqFF9HWsML2PqymoSANaQyMUcLyZA1bUTYo0/BjJlY8snf8Yz5xPIyuuDs8l+eKyBXgSMlugFaXuX3UEiUxj1/v4MT2R9wDxxNiTesGNIhnfNlJ4Mlf/bvhK5o/WgbBynINWyUhyYdROTjkarnrtwDpI9azdfCb5vXqAgbGptXAbcIT5nnOZf8b2vV03NffykUDXKGta94pfIDqmUfIQXlIZEOdAYn6xCeooYsjU9c81D8ljjvWgVewUsumrSquajD03/6XF20tqAuPMlwi/4bVDyHXJq8ZsTbRlY9Ty5RN31BDHbB8enxxfVPHoE0dXAlBKDldUxrRGmoRBUUj0h0U8xUdT3NilfzH1vCnIRBiFX2SddhALmm8kivYkMBTCQHF10VSVZYoU4YrEcikO5kkqDv1uYE/E0d0uZPv+0RXr03y1JGQ6R8cFk9iwYkYRCrnGqliYWbhOY1cv1e+9E8WqxtjMZFK5TrNWdHy0FSOEJKGz5y/se7bqKMMl9lUV8lbYD4qgOegesC3Oi1WLh/fYKM6gt7mulCPxfhnjiiSu06wc3cYmsy5UKzozcs9Wd8EE3Qbfi1kh9TzFzUU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wcfO7aSbx42c8OR/pT4zYzvSSVzz9M4atWCaxUKdp8HMRHoth1K1lGAUyEgI?=
 =?us-ascii?Q?L2xUscZPE0Cu6wpTrQpPFCfy/L4/TmxeBn51YtaSoNHOvIGJxNn6pEC7ufFN?=
 =?us-ascii?Q?pYzily5ylbjxgWQtkHKOFzu3jn5FK1b79vdynPn48rGflq8TkdcmSWTVF1t0?=
 =?us-ascii?Q?+SoSTMW1WRV9qAbeb5iIygX7BsyQ/U4E77RHLwwiH/e434F4sx1CcQUt2I/q?=
 =?us-ascii?Q?+E0K5ycYhFsQCfLpTuAZFcTL7fTiJULD1FoNslptv/KP40njAvUPC3BZpb/J?=
 =?us-ascii?Q?EcgbbgEbWPel9TOGynGVg299mFc5whkJW5xN8NFC0Iu+icAFNPFFfiabTu1w?=
 =?us-ascii?Q?Hx/EoYDCOu6Hq4YtBOsWSK3Uj1Bt5QdMmEuiv6Er0kHmn1zHNNPWUCCXC9ll?=
 =?us-ascii?Q?4e7e5hl3tY1jDc2QqoDWHhi9Ze7trC2pfeO0VP7LY96Mlo86hIeQJZ7JBhiF?=
 =?us-ascii?Q?ZRT5Rf5EdcGcMY8NQGhU3ZEmO9f/cRhIP5VbRQQdNfb/LKeY6m1jEWqQ1126?=
 =?us-ascii?Q?ZZJfXxxRgPfR5M3br3EigBfxijPFOd6LkQSnP1HKYZqheCuUNMEzcuzJ/b7s?=
 =?us-ascii?Q?plTZdAkhGqm7Pw5aS+CCMhiddNzs64FbYmYssNB3r71Hjga8mUa5Gr46/U4V?=
 =?us-ascii?Q?Ng38DnE4J17ma/BkiGPqdvxb7/l4KuaNxzk5ArkMQmitTn/ZMj6GnektkzVK?=
 =?us-ascii?Q?khOmVODd9djWAlYJJCPxomOSn/kKYrznklxF1+Py4JSGTc3yo0wLYJF39VqZ?=
 =?us-ascii?Q?GkyZ5MbBrHktTLP9UK4XddMsiQCInqTKtyhcDFr02/8PoTkjJKVz9qBJ4KVF?=
 =?us-ascii?Q?6MOnrOOYMtcL4o7qIZQswbyolPBEwh2Hd+OlM5y0BlzkwMGUhd+NQkTUTLxO?=
 =?us-ascii?Q?Dp0d/paVCMgpevKomIQ0vl7n1kyMP3ApVVfN24L6IDYTe/DBkbVCAq6kSc0j?=
 =?us-ascii?Q?FtIddxokEefju14dgs1059dcvuDSLlfu6QhbMS3UAqJ/ZDuZsPEZqU4UE+Kt?=
 =?us-ascii?Q?vQEqpet0s2JIt9FZ2BsYA9yVe395FDA9ZKCrZgbjdSwmNaueFzSy4wVMYH+t?=
 =?us-ascii?Q?l4fam5uEmFF3CmOA/hN+41LGBqYYdWXTI4yY/CoLAFeIq+YOWJIGEe7MDl+r?=
 =?us-ascii?Q?yXRO9dqIT6yO3aZDoWQJJxJEnVfXKhgFkA+kK20r757paO3t+8g/tV//FyHB?=
 =?us-ascii?Q?dqjS3ezrjG+QPyes1UX1uOlFChJt+ZvRa/9o3QgkeL+cpeQ3f3uPZ0/qaqdg?=
 =?us-ascii?Q?STZhPykA6C2Sbyz44U6L7gmzYPcN0VVgJuzgGyO3jenywCqMDy4DZy5kVpwN?=
 =?us-ascii?Q?5fkRrOfcgYp+hic75BDzj6m7984MRppByNqey0AJvqWSAhH71vv8GIUj2Hqj?=
 =?us-ascii?Q?58EiS0V4+pYBKjIhzwIwVzzK0Gwh2ixjlwMcJvz9vxMJgMq/cb9TixYKP9gF?=
 =?us-ascii?Q?YUS0T1yhcpKcgdLHiBwXxgiNFNdzhuYrYXxNHRSvxASm5Vbvd5HTVc4W7A8h?=
 =?us-ascii?Q?a8hGWFgWSq0fJF7xwv5U5kfhEzReMl+rnnHaTxOCikOPyiMjRg9ZaJNm482e?=
 =?us-ascii?Q?RRu4ALMi8od3j9wwdGT1CGedOCLoZ10qFm0pGMfXdr7VQOgRa2Fxb+QMElcy?=
 =?us-ascii?Q?3j5cH4A1Kz9LotlegPmwizWEXMWO6QkYbnaTK9ExloDK9CsQCf03GSGD1oLr?=
 =?us-ascii?Q?RgyODkAxvc29PKWrJiEVlOcPekVRuihxkjBDvoBbph3wmynwTin+iNnG/jwx?=
 =?us-ascii?Q?GIG3ox7e/VF0PbdXCPOCsXCdh8jZ4IVM5Yj6F23voozBCp1i6kJ2cXp8lrgE?=
X-MS-Exchange-AntiSpam-MessageData-1: tuW6p6FaNPw1Mw==
X-Exchange-RoutingPolicyChecked: lpdE6WWxecyYNigtXUDczMA9v28zsGXiaC8QZ4jAb8fI7S/893lPl+4y/JsiT2m7dobEjHsFLOdCky4Ts3OOM7HAMTFK+58uWB/jPi36NDJ77EbRsvXHqChPnHnQ0ZyNsqV+pjBH6iBCK2azRPKRnayeLSjy3eTaSDIDhBb1lRqHIqhtzr4A+95tH1ouG3XWXxMjotEkwo+0ghrSJg23U07c3PGM5WCeXxbO9/pVzXoUtJIIZR+GTfGVh7ZfWPbNyrfmS3ARONNrX4TdIrBE1FgV1Fj0/9sze2wXp+JcGidsorf3+A4tyQ/qWQ93XYLPk78zKIHnyXykXePA8aaPrQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: q749q965RRXfw8svUWRMzYDnoSndoPTZdRsELoS8gpZIeXSjjqfpxEueAyhB7Z4XAbrFkwtw6lug/h9iYxlS5cNJydkY3/F8L6+ffuaOdKq6jW0hVHKIgMe7bYfUhBSgnZqzu8Wwf+CfA5MmoJD2zMkzcfdJdnbaUIafeoki7HFAONUGur8SARVnZTfHaeyZXYzyQDZlsCiR54hqwTflMucVzHcYu5Iv+G0ukG4aCpAEIy1TI/IE2NSjtuGkT4T7Aj2LX4mvdMiJYTDIJ8Lcqib5bipjGemalvSgDiyXBEtBXhhRkUGjDNY8fItv5grRZHVwC4chMcxH93Oucc0qVzio8rpfIyOuhVE1TNYWjAedgdJ13gaA5Ulscrv73il40GjdGLO9rAmPz3LJVHMWr60Y1FAb/d1vud2V8ciAX6Akwm5qdEb7ALzYLamrQny0AR9WCQoLhEhjQm+hFZkkENTDua76eSJNAPV6fgWLLAv7fUrAZi5qy73/b3EXH61s+qwNUvfhrayGFVHTnJiQjfKulUzVu2dc41O/uDd+txMdIlwnGGeR+S/i8pV5GKud69G1W59cTXiXB+3+ZTssK10mFkpB2C3rgeb/9Q7w/VTGgwdhEat4w94ribfhGb4n
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0164e49-8a03-4652-124a-08df46d8266c
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:30:28.2590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JprZye/gPCdNkBWR/mk/ZYUwKAHPzu0bTqktL5AE7fWPdpjdoE1wNSsnM2/zErgAcl5UfrwekLD+zy8u+NOxaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P192MB3423
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate51-hz12 with 4jW6SP6MV3zWpW2
X-cloud-security-connect: mail-norwayeastazon11023109.outbound.protection.outlook.com[40.107.159.109], TLS=1, IP=40.107.159.109
X-cloud-security-Digest: 36d75c03937d0d25b0e94e265ee6009e
X-cloud-security: scantime:1.446
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 07:30:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250741
Content-Type: text/plain; charset="utf-8"

Please ignore, this was meant for wrynose. Resent as "[wrynose][PATCH v2]".
