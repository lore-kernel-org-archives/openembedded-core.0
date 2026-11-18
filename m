Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7167.1794983663812211637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 22:34:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=rchFhYMd;
 spf=pass (domain: est.tech, ip: 52.101.72.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRi/F3Jx7zQQWn3ngz7/L1GVGwmelJ/tDkX7l8TgtlVNilD01ZKCY8hX/2WLa4ppKJAH1zUDGAfMQQfeTzCJV3a9dhpMmxQPbQ7q74i2hX2HpSn7sPDvZN2hi4fAlSUuoVn3gjcWM1PM0pHCaa9UOu0V2Za2NwedpS3eYB3ojS7KEq3AJi3HhwGPJfue/f6aM0ZXq8G0PCqlm/0BPtli1u2i7wwFb+4MXems1mjQ+GbVjf5E1tDUkIgMgR+j7B3R5lMMHnaZiKwB2QVGVZ/BFCbNl91avvR111CMeJPbbCNPmn4CKIo88ZqpnX5myt9OpyfhBLJfrONstsj1VuPY7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICHbM4tg1nzWmz6gI2hyqmggc7cjHnAiK8LasyR+cDA=;
 b=fsWPvoEsA56qp2HQLzvYW9HZ279ExH0H8FUN53mMvue1C08Ch8f5304HsYrAFIC7J+UmoQMMwPfgMH552RVWLnYOuC6PzvSOUxVrBptWAQcSH66OCR2gPn0Qidr3PjFkuxXYy7sJ/LOsyj5A3Y3c6rBcsz1xdzMqc1jKMeS93gCKKJKmEjZ9cl9OdzZWaeDTzn35vyHerQ1mPrjtKmUMfuXtNfCl8R8CB6HSZVcy81DNbgIksuR+wvH+u79eo2C+VFazde8Xorj+BCHGj4eCxClC/FF9lamerX1onfDeUP68D0DL52z4YgROhFBtuDA4PD31n09iONs05YxAF9QvfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICHbM4tg1nzWmz6gI2hyqmggc7cjHnAiK8LasyR+cDA=;
 b=rchFhYMd2nxASmS4SjB/xGICyvXqxg/eVE37FyHzjW28unaHI7iB2ovyJ9lZbl74omqXPyeVzpxdwl5tG/tSW+gGX71SgnCnrZxEk2BlqppGuWDTyJzW95ACZ1G1FvDwlKlSDTz6omXhyvTIDlTDbDIZXZB6Qy8KDtjatELgn7NlkOR23jD1PAECGFQB6IPpeon/dsYShN5IPM+dvZRU55/AssZKra/DW746NOoLnaNG8G6dYGE/pykRSzwgLWzSjjNbEbxSa4m3ARWY4sCGIkXtd4WpNsJEUzeae3BxU6Dh0B31I61dS7uMlLPz+l+3FrdPoCdTAi3144jWG+nT1w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2606.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5f1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 06:34:19 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 06:34:19 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] gstreamer1.0-plugins-rs recipe fixes and upgrade
Date: Wed, 18 Nov 2026 07:34:13 +0100
Message-ID: <20261118063416.18496-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3P280CA0016.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::26) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2606:EE_
X-MS-Office365-Filtering-Correlation-Id: fe59c7f0-b11e-47fe-72ae-08df453df964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|18002099003|3023799007|11063799006|56012099006|10067099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261021121427099003|261102123227099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: kolV9273Am60xX9RVjf1AGGxZtZFhVwCit7BiQYXHk4b4ojzbz3d0RAuETGRQ04jeixUZ28vZUqlJ/+QNYFAD/GYok32GIkfBTcsurR52SXdkmw7CeCGVnZKxShd8shY/quenrMo6LsygoAjU4PcoQnyk2lcedszeoeynwmq/Mdn3DZVOuF/C8MDt+fAq8mpiguHQj6f4TGcja/OFkkRA77bvZ8Dpuzcmbc0PM1OwhC9H8/9ZZGTeRIWstt9acpo6BGofvOjkf1a9L+nJ3jCnMvJMv7KEHyy6CmAqHK+68xnOfRMbCO1Pskqf8raGkRq9EP5iwvHA2zc/NP6jZs27W7Lb1upcYwN2Efoy5Cr8byf+5fN31TQ6oSczEULC+WcOzbig5FRDUQoGjKtQsA768EWuaGpx7tpCOaTD+kMhS+MpTYo1pxhds+jK7wjJj2Rk7MFv6DFXZUeobdWdqLnpQK+5iv/BK09hTB3Cym8rjd4bLVgNuQzayyYo6kwnAObzkLaCtddUlseXJms6JD+DQqa27EgveouAKG9sfXPMLjzI/oTw0TvlC/NksKb5qIreWi4rA8bRAbgCfG2sDzOW+p9r7ZclU2Mn67Rse5uNuA9l4LUHOKGFC57+NJlOzIJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(18002099003)(3023799007)(11063799006)(56012099006)(10067099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CSagj8mas+B+X5+CIkuU0qtIOtKy7yLLg/mXHK3ImuNRL61RuZaWExgcKM+k?=
 =?us-ascii?Q?5/6w+9f700wz3Hxj/Za9e2qp10zw0Wa+XxtakXtHoASVZ2MUKCPZSjBtwDNE?=
 =?us-ascii?Q?7M1+6ctE5MeSKPXygDPeNgPl38h4X9+57/HFkvDmXnpy/OCq5RosSD1UaXjz?=
 =?us-ascii?Q?+7XsqT4SXwHqx4Lb8IXdHcRZmBvkk4H3cj1CKyYdNtGpasLa+FAFK5Xhg60I?=
 =?us-ascii?Q?7o6zJd5YDqEZNxLZQVhr9Tz4I/bK/yx/kk8Zn7WIwpZ/EfLinIuCbI0mr+v7?=
 =?us-ascii?Q?Xv/k39swIdKz1ui7ipltkpHUdHKeawxzmgMwhbFGGa9ueBNSORXXeJ06TjsW?=
 =?us-ascii?Q?g5HvKYBP/a4kQtiq6UR0IUwyB2gaEK7MQZD2XYZlR9Bp2hyszlZr5oNv0w8Z?=
 =?us-ascii?Q?Li0G0UxY0YR9RyeEhQWAMr248QMQyFhSyOW6clW6qDjqXUhlkBwpKY6EmLWK?=
 =?us-ascii?Q?tHJm+xL2TA5mbzZrLR9fV8U4u5LLuW763OQGwgAaR6Go++jqL5erf9HUPcjR?=
 =?us-ascii?Q?olL1IaceGOjXx5vChbws/vAKkTqjx4TlqLiqNBS4deGqzf1GrbfyVD2r1VpI?=
 =?us-ascii?Q?E63MgX7blJVtXV6e4D1o1B86ZRJjSMHNg8cdwVuiThbsPMSJuO2U5oVDShG4?=
 =?us-ascii?Q?mtMZQFWY6HVk05zcMoYpcRA89QjXhfTYA3CD3yxw9oX8FaSbviFH4xvp7W/u?=
 =?us-ascii?Q?lW4HWvNh855FAUJG3/FJHHw7Tzr8oT0XRCNks7EerBfLgQ/kI4EJ0GX1+ihV?=
 =?us-ascii?Q?sosRIEkGYGhh4E/RFS9HNN1e2X/3uxYPquwaXPeUQpUTDrHCgAa7n5DkX60c?=
 =?us-ascii?Q?IJN8nAayqVyP1VK84ge/+uCblojfJkr/PyWnQUivNE8J9/fInA/ohJtIq4PX?=
 =?us-ascii?Q?0RDs7bA8ygl9UZvu8B0lBSeiPvSwomXWGztQEL9KP4M9zD+FZQm1J53FKHm8?=
 =?us-ascii?Q?sHv/dPNinseTpthgThBImfmzTjxpvhu4Gpmm+FzKzT+0DVLQJ89xpb74RAzZ?=
 =?us-ascii?Q?y/NcXl7KuuxYmdC7SnHNHm7TW0AOHHV2o5mqCKFO11+fhL6GG5EXXEiBFbpG?=
 =?us-ascii?Q?6MtN5WqAE3nx749+34YkuQRiGq39qA9IOQanpq1LwzYKmwsTDxloDTl+RqIb?=
 =?us-ascii?Q?FR+m5af0CbKa4SXAgCYT+xQ4tDRSbbARNmShm0YKI4BP4WjXvGO4kmNS2oGS?=
 =?us-ascii?Q?g/3Bylv2dp/0LDyRWB+dyR1V6onilGiWVNDgwJ/0bDO2sUpVF9Kveh9Ue36+?=
 =?us-ascii?Q?956v6whp8KGPqN2qYGS4K02ftga1EFn35seHCl48yrwJ8x7d6lwZStf6teJJ?=
 =?us-ascii?Q?4uJhIBLDPSVp99/Abyupv1J025/C/80cbIS0rNZp+p6tiPBSgJRaLqChiIz7?=
 =?us-ascii?Q?HVh/nVPXK+Y3vacVP6+Qj1Jpf/g6Rb2dwlz0pP0FUxOrxIBpnY7A50wn2vF5?=
 =?us-ascii?Q?YmkcYx3IcjziX4Mv8sSEzGbL4hZViRhton7Q5TzjXLXb25dqNnuxi5drFauB?=
 =?us-ascii?Q?Jw6CjmPxHuqwQ6So9bjIPCQUq43Sfk/vA4ogvSkWHQZssFvauq76lT1TY2j3?=
 =?us-ascii?Q?4X4zRVWpxFF0sPxudCxRh/IVyP7O6BMkeQsSQv+Y4zzw2TohAnTQZjrn/x3b?=
 =?us-ascii?Q?VuUrnC/mhsntInZsXeqhedxAYTg89Jtaua0udCZJKj/S7IwbJ+x3N7MU9Bf6?=
 =?us-ascii?Q?q8X/uS4ntjuDhbG+at95W/w0czG68dNddagnwIFrtbJDmWwiwNGp4MSfrqgz?=
 =?us-ascii?Q?KGGRJtjYcKsricrEcim9V1SMz35JWz4=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fe59c7f0-b11e-47fe-72ae-08df453df964
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 06:34:19.0795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAfkGHnjor+0If9ausdE8uhnAlgQiCdWCp+PHXfKFx9EPqP2uKVcJQ4ludUvVLXFgI88vDo47aGLNbd9o9FisLuUdFUyuaLxYiOrTz8EaI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2606
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 06:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250515
Content-Type: text/plain; charset="utf-8"

Fixes issue with AUH https://lists.openembedded.org/g/openembedded-core/mes=
sage/249722

Jaipaul Cheernam (3):
  gstreamer1.0-plugins-rs: fix annotated tag match
  gstreamer1.0-plugins-rs: drop S override and fix LIC_FILES_CHKSUM
    paths
  gstreamer1.0-plugins-rs: Upgrade 0.15.3 -> 0.15.4

 .../gstreamer1.0-plugins-rs-crates.inc        | 1174 ++++++++---------
 ...3.bb =3D> gstreamer1.0-plugins-rs_0.15.4.bb} |   10 +-
 2 files changed, 541 insertions(+), 643 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-rs_0.15.3.b=
b =3D> gstreamer1.0-plugins-rs_0.15.4.bb} (96%)

