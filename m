Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5584.1795180501618142653
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:15:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ogoohcpk;
 spf=pass (domain: est.tech, ip: 52.101.70.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3yezA0uWP6bCgNUa/UxtFwyK5m+ld8mYzy14VdO0mKMZuluQjHCTG9SQjACBmlJfohwjK30fyvqkDGLYreyLGBkgwB3LhYFeDWFpVR8+Etk2gs+r+ySHUX3bV1kZoqHn38/ButEinuAiO85My6vjVSNTXzXIL5xStY421JqBYarK2q/NSMzWVS8lNfCC5bPTFctK8IziJ0G5GViy1UaXQln9AOdZ1OMUq3k8oIPQidg+b7Id46SXJFvAjTwmYQj7FH6K8WZ+p5sJBTkR6c8xqO5yBGcC3hczLReVbREbJvsucbTEyqwFk1menPWHC78el9dZrCf//gq6dufHnF50w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyZ3/pdyMfNO9+33WCuqH+qR3M3JwlyoOutEhY6TY4Q=;
 b=UMeVrbaJ17tLVAkMYCfg7a7aUVcZWUimChToU1h15eAa1CaTIHPPI7+QcoVfcrYwo3846Pzs8VZt5B0mJiut61XgK6MkLkjXN1M/ecoZtAKiVxWxiN/x7MUjG//Ej6l3wUfHhGXqtAp24XAukOZ6SCcFQzFwJerzt8fRRj8EVq3mswbHvIX/X5eCuAlK8Rjpd7wXbXXeA//5Y2tcKG7wT0brm67tl8BdR7QpiAnoAD3ic6AihvxTBKiOesmqWT9ej/J9ZsPpbGrlsF/YH7NNDdrh6Ccd1i8g5Vj31bZ7T4X6uyEYEE2FXaAX+v/dVRYYFmeX2jCWwPvoLpKkaoyDYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LyZ3/pdyMfNO9+33WCuqH+qR3M3JwlyoOutEhY6TY4Q=;
 b=ogoohcpk2aE/hy0e1Yg1/ptWKk+l76At99RHEKCcV+F/gEFVzu3MCgIznUM0r9oRDXyx2xFoobmVSBZhPlPjwzFHyOEaB23zxOVNhzrRk79mEen1ihIGfVlgDjxpykbVrScXgcpqqhJQooD8w5aUZZ/IjnynQIHzSW4RLgmzyYEG1/zUb2d57oXsDjYWYwkkhYDVfy5Aytc+zGfMt1fkSFqmiJKEGM4IMqF+2gArsllQOE4gl2rnwrcIOEKuvL8Yj3v+8WjXZ+wlGaKnRRTlbbyz1WB5phjIAWYpYsLCxqIWnNvplayi5z8N5XPNiNZ+y+whiA9fNKKOiJpr3C9wSA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI1P18901MB0815.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:12a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 13:14:56 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 13:14:56 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] Upgrades on 20th November
Date: Fri, 20 Nov 2026 14:14:50 +0100
Message-ID: <20261120131454.45936-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI1P18901MB0815:EE_
X-MS-Office365-Filtering-Correlation-Id: e28518b2-cc25-45ad-fbf9-08df47084585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|11063799006|56012099006|261026140227099003|261102123227099003|261028144727099003|261022105027099003|261021123027099003|261009223027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: CPTGyRMUcUDtqMqzWyf5Fe8qKb7JDCFr7t6St+lpLquGjms0E6xlj2COf1fIHlN3vmp0OAxlojEUuW1xG7jYBpXSqMC9ajdvoouWOV9wPLZotUVLfL1mAJDXFmgVmHgzxjm+dqOO6JzlE4KbFwabFNiafi/DrYGJgk5kpSiL5AlsF5SCyDP4hrbbrDwYJ5WQYsucPAXQ/52hpgG2hMCpu3GDLoA8LcMRU8AygqxWbVn8DQVZA5Kq2u+rf/CW9cKtZp8oFgVtG61h8lfUeStELDItUIoKzWCycUMfx00DKt6DgWEKTXuDWexBuyFLBhVDWgwogY7t6RUXRoD+3tIRzYBVr871l5UAf8B236HO6EyDTBLj7nUdscokTK315jmYfARoNMuzPl4NIWMXbKiQ4qyDhwnXfF7cvkTJvS3nal1LYsaUv3aEQHhHbzqfLIICphXsFqP3Az8FaDQx9GcC4j++vrbERgMaifoZ+Zj5kQYBrpC7OOjxwpt+NFIxWolbxiumZ4lN2bie+fVNNq5EuhZ9bS8v9Vaeqp8pRl5MwezqF82r1sj2KPajNAF8iyjHANyWa1qOtntvfxstQ+WIz+aGVqm12+oZMI8jagB1hkVWwzy6Xem1p2OoMYzdCDyPF+VFdPhuwHJO7UxgJZ53T/VX5CFZgv4sXBTWSeb+RpU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(11063799006)(56012099006)(261026140227099003)(261102123227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261009223027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b+rCk9qCwXiyflrxfhsl/ps6UvoM+4zDAoaTtYdk8tcScKZZhxxcs2bdUtFw?=
 =?us-ascii?Q?CCIXMvjA+Vs4oGW5DZq1rBBovs1y6LXnUvfgSfWYNjvK5rFZxF43zHgMhZKZ?=
 =?us-ascii?Q?77LxQa8O9OVx0rnl76VH9QGERRd9i/G21Xvuz37BmGI4Wg7UR9M1K4IWlRzj?=
 =?us-ascii?Q?aefyvOV7hH0p62M8N5L/E0YOczEQlPmDQpxH8it3ENZP9fy6Eiqc5n8wtV00?=
 =?us-ascii?Q?2BKo2WoONhR2rILXvoScQtvnUijQSrG0vI33rrfP6/aofSL0oxasgyWbzoCB?=
 =?us-ascii?Q?fXt3yPB9a3WWDSLP26LubLAjx3puHVFLsuNdziZn2+yBOJ3xNySEw0tdY33Q?=
 =?us-ascii?Q?MGzvW999+XLLyocAm+52N6gtrrozWhcNm/QcwFTwmqAxbEh9RcNUKz2oA+mW?=
 =?us-ascii?Q?XJcf2+bedDHm88bgYw47VUSv+jxHcu78Cw/avMOFrv0vc4JPxtfpcg8Mau+h?=
 =?us-ascii?Q?R3o9we0VJ7murzm/pZqFOYbp92KJaiipN/CxGkcw304UW9dL8gB5TQ2yoITI?=
 =?us-ascii?Q?yVJsUDqx9Ao9I7EggeEJ4fkBKBhWgOGRofYShwNctjUy4+vNH1uhjutOS+cg?=
 =?us-ascii?Q?XW6dASdXYB+zRXPTd8k5OJ9kq0NrtsmUOppuJMpdP3nhSarA3WV6iImc28BQ?=
 =?us-ascii?Q?SL/SRG/LId6FrUYxc501JXWS597hj1q9Kotk+TnvaLw4XdPGX03cFesdvxxw?=
 =?us-ascii?Q?Xxnl+PRLxzN2xUGc7IOiDxqjKCjuMdaF6JLDO23oBdhI1qq6nyGDayzpzDUi?=
 =?us-ascii?Q?quUUJOOfedKbzGmbvG6FyNUtj+tGU1IMhH5sTk/9I2fqkZVoLMYUYLJ9Q31l?=
 =?us-ascii?Q?WzQxK0tVm01vTnJ+c7B0z3OAGAIoGQRk2uXm9E4JF86tZ8nJb/YuoF8WE8l8?=
 =?us-ascii?Q?of1n/zFCg73/rqQk9CBwnCufSO1K+iVpQx+F1wxIZO9Hcr9SFEc+s6cYyPF8?=
 =?us-ascii?Q?azgdZMJ4fjdDecOoqnMIJbLqV3QV1muAgI6FlAH+FxawpiMCUp/W3GV7bGmx?=
 =?us-ascii?Q?Fe4tEk3NobamyPdd7MZZtX3LKguhbYkH7+aSOJiq8m3kdrsxzQlDtfpFTLCb?=
 =?us-ascii?Q?pW4swjYbMyiLm8mGh+1bShPKQAXoWg7h15RHWnFypw17uVYqbrLTDPxODNKk?=
 =?us-ascii?Q?ZaeV5DmBB/cmGjTFwmqajxUMFJgQ5Ezyw4Nx0UM2/oWq3BN2FOamig+DWGP3?=
 =?us-ascii?Q?rgILiMj/fvbIA2RyUabrecMvZBf//7yFXIlm3/TRGoib7j0vPmU+skTvm6t4?=
 =?us-ascii?Q?CYZbYo3dBUvXHR02TUNCY4RDCXAAEWnswWu7RaXfvzwpyB3ENU+WUOhvQt7w?=
 =?us-ascii?Q?XYKj5HrbP8DQYDECycUl7DTmGSFpebnkK5u2E9vzVkABbWZf4xZuVg2RM/Sp?=
 =?us-ascii?Q?lf2EkIJ4KEMNMG/52LjKxtw4Ckl9OqhAXki21z+lhPL9hVv7qib2ADZypUQV?=
 =?us-ascii?Q?WecmXqdQhihQk+rk8ATyMJeucW6WxQPtADxbQB18NnFnykCS079oA7maEc86?=
 =?us-ascii?Q?zoicPa0QvGZN6oBynb/31QSkaocLyyr0pCNvoXVYS6Ayrk41PqTMhf8H7d06?=
 =?us-ascii?Q?z+QXwrVdvmu7V2II+MJA4st5a3fdde8RH97EYtHpb/FrJeM3206szSy2b1ss?=
 =?us-ascii?Q?osKXsZ5TJG3kyvN23WJZ2DliEWlFhZrT1m8lYDXo53OVpy6JsYLLPVRcLf5A?=
 =?us-ascii?Q?taRFIIjDKWW+h2qaEa9zuCjQWyBZyc95NEQtt3Ugt7l6Q9YtkzMJTornlEAb?=
 =?us-ascii?Q?cwuZ14phqw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e28518b2-cc25-45ad-fbf9-08df47084585
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 13:14:56.3227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQFvbicWl0yAYGWBFtzwnODdOvcZLJrRarL3FUp2lCk3ronapx7PS5+NUCIbbDMQjY8O0OZiJq9rRdiuC0lwQgLJFEctf8K7Gv8XcMAK+Ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0815
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:15:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250785
Content-Type: text/plain; charset="utf-8"

Jaipaul Cheernam (4):
  epiphany: upgrade 51.2 -> 51.3
  harfbuzz: upgrade 15.0.0 -> 15.2.0
  libmicrohttpd: upgrade 1.0.10 -> 1.0.11
  ffmpeg: Upgrade 9.0.2 -> 9.1

 .../{epiphany_51.2.bb =3D> epiphany_51.3.bb}    |  2 +-
 ...-meson.build-disable-the-use-of-yelp.patch |  2 +-
 .../epiphany/files/distributor.patch          |  4 +-
 .../epiphany/files/migrator.patch             |  2 +-
 ...{harfbuzz_15.0.0.bb =3D> harfbuzz_15.2.0.bb} |  2 +-
 ...ak-ensure-target-directories-are-cre.patch | 45 -------------------
 .../ffmpeg/ffmpeg/makerace.patch              | 11 ++---
 .../ffmpeg/{ffmpeg_9.0.2.bb =3D> ffmpeg_9.1.bb} |  3 +-
 ...ttpd_1.0.10.bb =3D> libmicrohttpd_1.0.11.bb} |  2 +-
 9 files changed, 14 insertions(+), 59 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_51.2.bb =3D> epiphany_51.3.bb=
} (94%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_15.0.0.bb =3D> harfbuzz_15=
.2.0.bb} (96%)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-comm=
on.mak-ensure-target-directories-are-cre.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_9.0.2.bb =3D> ffmpeg_9.1.bb}=
 (98%)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_1.0.10.bb =3D> li=
bmicrohttpd_1.0.11.bb} (91%)

