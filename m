Received: from relay-r26-hz12.hornetsecurity.com (relay-r26-hz12.hornetsecurity.com [94.100.138.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1424.1795159875478034099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 23:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=DQ3K+eka;
 spf=permerror, err=parse error for token &{10 18 _spf.eolas-services.com}: parse error for token &{10 18 _spf-paas.eolas-services.com}: too many SPF records (domain: witekio.com, ip: 94.100.138.226, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate129-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.69.137, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=am0pr83cu005.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=pMZC7bW10QqINpKz9JgsA1BkmBitvXGZ9ZiyfDjyTf0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=2; s=hse1;
 t=1795159871;
 b=CdfNlefNDbvx3FMwch0flTFcAwrOrWsaHeqpYxxb+U6NMB/2X/mKv4bQWMhWnO1q8ojGcfGC
 0tHLHky/bi+OMheV1FPY1sfylSRH8lNfCc4DVxERVPsAFRPOvb9y0BCtHf/Jjdo7F619LZEFBvh
 t+QBweObq7vRc/vFMhY9yQg4IN2RvwruZHJ6pzJhaRwd5vHZsQBoGWMJ2flFliYPLHATDOwuylU
 1554isSefaFy8Y9o5oCY9llfVpdNM2QbQBkmnz94XKQUQDFgEsHvgQh9etRKAKCrt302GjiMopk
 rzfHK/5/hP36Kajl+5jBc52zd6ZGn583NYPr/GMvWlKsQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1795159871;
 b=f0Xw8gtYp7hfpgiFrj4JlGZNC9hArY0Pyyr40ri3GWDdH2X8OZr38qMbLcNtlDM7ObzvW8PQ
 yJHyxqDgfXndxNZ4RPmEOJKMh00wFZO2alYDLgFjHYk5DMi160CzbGO5ZC73bbrd6l3qVGVhrOY
 +erejReZ0YOeP8FlS+SLApx2znTfqh8LcSNiZ5vhFig3nKD+McvtynKNsz2HPmB4OVpznezG9VP
 DTRGFbP+I71JtK72YQAEXxxWpcUW9V/jz4/wVdnyXOX7mKvdgANrsEBYr2jmaRn8VuyfkPqzox8
 l0uQx9sC3QqDfM8mZjtQrTU05qYHzfkD843f9v2xFVtCA==
Return-Path: <hsimeliere@witekio.com>
Received: from mail-westeuropeazon11020137.outbound.protection.outlook.com ([52.101.69.137]) by mx-gate129-hz12;
 Fri, 20 Nov 2026 08:31:11 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qr7R12nRunCUead+/BOxgODmgcKZl+g+E+rrLBPY+KeUeGde4He+auXaWpUHBgPES1X1W/fSN2Rn65b7Pj9EaVeyNomDodUnuAOW4A71+F/o+MJGXlehFF7iGiZNxWn4N5tXEvCj8qsMAKlKpDqW7f2K8lZB5Qe7XGp4reaxHa3gTTy2RwRBL9eeBQzeuRw1hbYQBT9EWMCaMdhNu1iWz2kDSfZCylOeh4SSvil3VaeADX8+RJctNI0B5yS13N7KrytimDOkXQsPbUiLZLhAviLzXJkpIKIpJ2KSvwDzAXGZlHM/1WrIuiwXOLeNn4zZ+sTXUqeS16MrD5CniObwwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMZC7bW10QqINpKz9JgsA1BkmBitvXGZ9ZiyfDjyTf0=;
 b=tHlFtid01ix4/2CJmdW0u9rOtTtdnOxxiriYMHeWnYskpZJEPPunV6ApLOf/21ykLPSaKD+6EinXmX4HhlFWrEio6asmPWVSrNxgB+rXe7W/7k1gV48SkLehoQj8FMtXO6thRt860TfcANJahbHDF2IpGeWshE3qc7LYKuIcLqEgA1Now/TXSI6rTwxr98/0itjZ4Hu2o+g4vb30oPvXMHKAq6RGgWRxcA+s8sy4jKya3Reh51DIhW72oyYlz13zFqk8/S7AaZls7d0gb9wNrE+lRh4woojCIQqz5z8bNAxbCOAyZWnRmDQDNvCXCHx5DamMS8ilqMkg4ne83cA0lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMZC7bW10QqINpKz9JgsA1BkmBitvXGZ9ZiyfDjyTf0=;
 b=DQ3K+ekawZI+hpMEnCcGyGBKiI0IX/A/fpcfiRUPo0vVKfAQgkthAnI3c84MQFdge12UHLhrCDNJme5TfPqK3HZYTFqEM9uqFfI4PuXNMGZYdXQwjndvWc8FiraDOywrddf13nCxqElkru+GpatuIXMVlWZShA6nkAJk7L0fYHFuGP8gdAtpr04eZaxielRysjoM2N9SqscrrBiuhEFysweYk5a6x852S78NCzgRd75bY2uYaQLUFjhUhiGMJd7sSn79A/ribmVuLjnnKAhn653A480dHHtMtt15NKEY/mFxSN17JBk4lTUyjmWHrgY/kg4fDXIR4lp/sPM05yH2OA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DU4P192MB3423.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:62f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Fri, 20 Nov 2026 07:31:05 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 07:31:05 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>
Subject: [wrynose][PATCH v2] image_types: keep the rootfs mtimes in ext2/3/4 images
Date: Fri, 20 Nov 2026 08:30:44 +0100
Message-ID: <20261120073056.2733080-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.56.1
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0044.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::20) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|DU4P192MB3423:EE_
X-MS-Office365-Filtering-Correlation-Id: f0674f3d-53c3-4706-76fb-08df46d83cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|10070799003|366016|1800799024|376014|18002099003|261009223027099003|56012099006|260925021311599003|260925021911599003|260925022911599003|10067099003|261102130727099003|261102123227099003|261028144727099003|261022115727099003|261026121527099003|261022075727099003|261026140227099003|261022105027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: qdIC05buEynTCyJGpQutVt/ydMcFoFpbYIIn9RJ0rlxL9vGTnsi7djbefENOLwk/JvSk18yRmIPrzEPSQ6OV8bzjzrxshM7mU1IZ5l8xke5X/oFD0NUbxULSOkrsTJFuMzhQyVGrN5so0rwdM4HBEZvrmKqAc4pD5dlEHKGEfryhs32bZOnxuT4RIVcm+xVxMcDGfa4gloSYOzobiVvBy/l0aVWSd1U3f1rhxrc5JgG4rSEub0WnRweDBYCCeM+jkDQ3BGq+m6vtBni+YbYi3bUKxSKyJlzkx1DsQmI8lgZmWfG7UoYIpCt0VgYuFfrL9G66f8quNyfl6ZnZNYBb1h1AgIahXHxsK6q6MYhjfDhTYEGnNixFZOVsEqsz0xFURRwzzlaCGYMT6anyHmXqzS8o+npnSXhIEIRUdsf2ChaoH4swMQZ0OgeLwL/eT4C5NacwkqZvI1uMXKhCjeCfm/kfmqXT5Bq3T9Hjp7XL10vP5PWVSsOF1b0fny8KWnzWgJNZzUtGjrhkGz5vz0eBXcTlDmng3oSc/nWbF/m1/nTeUJ7AQ7SFuGs6kZMRihDfaRIy8niO64H+eovAuolfF34Bq0GdRyCq4qhaXLShtRXGSkNZDe9WeKpllBH4HEqY14kQSNz1+JXZz1ER/BrjdfQCsMEWZHGrFunP9R2KAAk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(1800799024)(376014)(18002099003)(261009223027099003)(56012099006)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(261102130727099003)(261102123227099003)(261028144727099003)(261022115727099003)(261026121527099003)(261022075727099003)(261026140227099003)(261022105027099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YmuKk8fy0fpBE7oOB452CiyXt99/w4XzEC4KSyBYH98SAGGMwlVBXr4pjQzL?=
 =?us-ascii?Q?+fMdwAuNJFj/QWTGxgipARK+zOEh70MO2FoUW1zsQ3rc5IU7VAHPQIGP28qJ?=
 =?us-ascii?Q?o2ikSBh5qfwypugy8yxbVRa7BQ7zIMhxJTPwjh3c7orvB8nn/WnpejgouqFl?=
 =?us-ascii?Q?bDRvrXpVAv/k179YfTnzDnRxhz8bMFQWURW3FdJyNKcN+kaQ58fmdkitOXCz?=
 =?us-ascii?Q?14IzgeF8vNr93+5XpBd9HRrkvcRlSme87RCXaCC21QJt/JIiUYEKmJN0Mc4y?=
 =?us-ascii?Q?HjmgiRrLjosQhvwXJtxJir6mxtr6peqzrS7t3jsE65uSiSL3aIy9cq0vxRWu?=
 =?us-ascii?Q?J3+fzCZMRmYA8mazmXlgt091SeBhIcpkGW5R3AsPVDHrhxyyPgKr2qUjDKIJ?=
 =?us-ascii?Q?wbmfIuUXGFIafY+6T/lXe/a3QfwWdYJjrvv7n7oA3FcEgY6h/bpPsw4BbJPz?=
 =?us-ascii?Q?Jmjye4Qrj3k6Q1/jyELgaI1BCoex9mYQg5oU3E2qhLC7SkJkE45vBLgA/JmC?=
 =?us-ascii?Q?S9RnbsG/APfrqdC4yoY2swMOxOOxEhKzSPn2qKwWumcPEXkvh6vVzM7PTIGz?=
 =?us-ascii?Q?Wpd/qu2WNEKv4m7AB5Qym1AbrP4ibVepcjPbohllEDlRLSOJY0SQZCvGG2p8?=
 =?us-ascii?Q?tONnxXqC3h5HqTKD6BbkocDtKW+SlUtFgoeqoTigEpuk9+1mFLbHIjcCUW/n?=
 =?us-ascii?Q?8HXwHSD2tFVOm7opSfx1NOtl7SHEB9k2CjohbgBfkJgOe4AQXmz5dRSEIV+R?=
 =?us-ascii?Q?deI/FTDqGxBf+vXD+8KABvRwUN0lhp5ccKRd4HIvLx6jq1ezFlH5/m9XbuOo?=
 =?us-ascii?Q?n/wzOo3QQGDSZC17FD5qjFgjXLCX4PYPZf/mgHZO3OicUjaxj8xbF3pxHGLC?=
 =?us-ascii?Q?eaxiP8Wr9fT49kKxGKcR3CPagyn13kQ/nJU4FZ4lC1wr3PSnpQjKfgJN0jpS?=
 =?us-ascii?Q?r+AT09OawS8iNizMjwBwY+9iyBpJ0hbq9hA6p3Vk2dHF5/NqAeCeTFvSQpU9?=
 =?us-ascii?Q?a6aQni3rpcjP4LR43H5g9xD90YFVEBwQ19Yj4dXADl1aSkV1DBHv9mTTzhaN?=
 =?us-ascii?Q?Tw9YPhhJk2IsYeW80y1gRSrYR82StG5Gg+AlNWJcydVwWONngyxxP09odXM4?=
 =?us-ascii?Q?7PAELZ8uwxHLAyDqRNx/jTXzFOtaO6ql7GsDrzQwLNx7fU4WuVbTAaDtoGUl?=
 =?us-ascii?Q?sX+QkAfblInpubRBBgXaaIwmJ2Y5UVYkHVaxg5VA0fxod2NzK0GfEzN97VxG?=
 =?us-ascii?Q?jbPAGz8Gfdu05Ch9wwLaTEg8Ln2Q5HRLC+5ltXCtBNjzvtdyQ8DLq+wbDFwI?=
 =?us-ascii?Q?Qlik/UucrsqSnxbLt3AFT1jSuVDL1nQS9hVzkm4mvM/Lcr9ckddWQZow4nnW?=
 =?us-ascii?Q?aqCGP0dYNMS5n3LvagvxeAK0zkYpcir0RQnAnsbu7sB2lwOKIT7fOUclxC95?=
 =?us-ascii?Q?zDX7cqd6CNjIJF8hWzXOK+oRctsFyRYR/QTW4KY11DrJOKM62WrXGxm0Cgi6?=
 =?us-ascii?Q?o0jStjbrm0ylFO2nW2BXtG1rDWm6Wb47OASw0J7swaQ5Vjvt9xZo297+06cL?=
 =?us-ascii?Q?8LyyB/nHzS2jA8l5Fou4ah1H+e5/v7FSJeEPubBzULsAwBw7T8w+dVIbUaHn?=
 =?us-ascii?Q?7J8Ia2pVuSVkOXiYd9YN+9+AAZYJ7mKQn7nMM4DzgSmY7bioUDne9F4Syidf?=
 =?us-ascii?Q?0CUIvw50reI0OwG9C1kbxeLY03M93+ArEZy1j8WBimNp5JOSTvZt1nBkH8rD?=
 =?us-ascii?Q?lv9zLG1jSkUa+YaZSNxjzyUgYIa4L3X+IHAoGnYbS+jiAjCjG0Lk2URmz2K+?=
X-MS-Exchange-AntiSpam-MessageData-1: DMU+FlUzq/Vwnw==
X-Exchange-RoutingPolicyChecked: B/W9F+dYD81ebnhJRQgr7Bm+JpcoW1iCLc9HBRNsBwM06x5osnYwLeVmu2kuXloc4Q2eo/zHtWw0P63cVhulpBFjOKmUBlo//ZxfMFwQkdihvxGKYd4hY0c3MNbHjKgbdLoUyqcMfVlImUnDNH5Xh/OaWDiX0rH0FAtLR45hooneQopWGIsyxfKl0m25vqrppM5oeiyMXO0DAEEziRbRRa+jDUvuKj00DNs8vQEDNUN/6ZiczdylhxNhySHALoH2XMmZVCOAjdUg9m0ojpMo5nob+HeCNcULN2oKkWLXfy5v3KiF1MZ7x9SvxsGTHuzSLWiFelkNgWTFLypbkoRunQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: rlfAlDs8mf9LIGgkF5T11JO9rwhBNli+QjihZyQp+WTt7AC7INEK16qp0zAmqF5p6NXygp8btlIwZzdYNMoAnaGCd4TP0bVCLaWswcTPdPMO7fswsal0cu7OHgidDTL3/djMpdqZJ2abXKJq3SOj9IrB23Aoef6KuWQiJGKQOdhyykfmtL6+fGF+I8ihny5YNeKMUjoox0mUjbEsc3bKku7y6s8QUpQhrT3vh0FCeill1KMn8vuFoyalXX1BmA9zc9XBBbT21k9xWcZ04Eqx14ceQpqG5L202mkLI8kKjF3as3zksGkUofiD/RQOnTJRTCyqOh9BYDuQQfkqcsFSKpE60SKlaaPRxu7PFg4vAZvIAsQtuH3A7HcPzt0xHPqTFSbeCRkxp0/MEfQwwqdfzve52uVvf3B8VW98JU7+dhBdl7Y0gIPzO2UDqAeS2xxjI7DBzH2+CG590ZrIXeEQ/9G8xvzcfSo1oooxgiNXrGecjIO/6kNSa4LLIWuyaTmohFfJGs6tB3MjRuVGZjed4lbYSl4lR/oMTSw1LW5G3CMcF6N/PG8kkAgwigbgr0nJVu5vWkHRkZ38G2s89EL1OJeN/cqWYlAhdLsQ9SNeG7+PdeaFsm5lfFEBObbNKQWc
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0674f3d-53c3-4706-76fb-08df46d83cbb
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:31:05.6551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QD0IooUemdz9iwk8504Os6SqLQsKHXunGZcOPFx9OM683txIm0Bbh8efctQwCuQFJ0Qt81JyjvFYCRAFpoAnog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P192MB3423
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate129-hz12 with 4jW6T64WpCz3C6FZ
X-cloud-security-connect: mail-westeuropeazon11020137.outbound.protection.outlook.com[52.101.69.137], TLS=1, IP=52.101.69.137
X-cloud-security-Digest: 0c941a9b71496d324c1e718f95a2189b
X-cloud-security: scantime:.9262
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 07:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250742
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
index 326602d960..79b9ffb9dd 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -81,6 +81,12 @@ oe_mkext234fs () {
 		extra_imagecmd=$@
 	fi
 
+	# mke2fs reads SOURCE_DATE_EPOCH itself and clamps every inode time to it,
+	# so give it the time the rootfs files carry, as oe_mksquashfs does.
+	if [ -n "$SOURCE_DATE_EPOCH" ]; then
+		export SOURCE_DATE_EPOCH=$(stat -c '%Y' ${IMAGE_ROOTFS})
+	fi
+
 	# If generating an empty image the size of the sparse block should be large
 	# enough to allocate an ext4 filesystem using 4096 bytes per inode, this is
 	# about 60K, so dd needs a minimum count of 60, with bs=1024 (bytes per IO)
-- 
2.56.1

