Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14508.1793090743925902560
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 01:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=cDoJ+OJd;
 spf=pass (domain: est.tech, ip: 52.101.70.46, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3H65hDlVWMbwirI+IiILJqEdPseSXqsuitNl8ndrf0lAUWCZN2nfBati0kRIovFgZxJHhljjh+JwousMnCAWl4j/9kp3Hw+cwRiV6D3WyH01aIpaD8l8X3sOo2y0g70RUg6rsGy/Gcplaw6QulHYmKaRH84sm9fxHeQ4g/05+gWLlScBrEzVBmTu0+GLP7ThNdf4+UZRRw3VhEwqhJbMBEBlasFvPHRbNsMvJfXbqn49zYu+5IalCKufP4WylFW6q+lQYYj1cY8kDFwJbHAioP+Q8jCX24ekAD/frpyKa38XT2k9GX0VyFVWuTPZ2QKWjEUyClTCoM1gHohfvAEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKFPwi6/GhBHFxGj2izg4smCd5dPstii1G1aNH83KZQ=;
 b=fWIn/wOi0DhzLmmlixKD/2sSn0lUN6lqum5pXWvKTL3Vy3GSvizAkZdHgUcgXHcmq2c6iV+VCtWlYrDY1JdmMbDum4VajQ29F+CMjPhhFme8lhih7jxEkgHrY0G5W3jZPMXCgzQvSIN2Ps+tLJrjc9U87rqvCl30dWG0LJdBVX8/FK1wZZjjTxgZmF8oXyMpg2ZOFVlc4qKn2+yeb92OqZ02861hACgoPx7CX+9QAUAjW6rBSgyD/yvvUZ7SnK9fM2CYt9EtVSq6qWiF0o9tkLURRtJTyPzSOl6JGsdkZjmOJnESUaqNonQInAcud3Os3VPLVExgg0JWBUre9sfRgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKFPwi6/GhBHFxGj2izg4smCd5dPstii1G1aNH83KZQ=;
 b=cDoJ+OJd2AsxcGfXpkkrxYDB5EUofoj1EcAgQo1QcND3OU4O3nZN/Bh6toXjFucZTmtsE/4CPmyCuzp3cneX5JXbhfk6Aan6YUZnHKNHStDHSfiPYfIsoIC6Oj9PBIxD/BgXaM6FgHhutmvfzMWiPbf5uWWz11Pq8eOAjSuihF3Gs+Qu3Fd4kmxGbHOdaR32WiYrzRt5pAet+/igXPwri1mQstxsJS9iYGENt5h5pKddyn3Chw1gbPST6Hs6C8qtnC9ixII+7ljc/XtAXQyuS2YSmHDffK7acZyysrZwIMCSE2syPkWQk2UNHD3vcZJifyiegertnT4GnKacnF8pgg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by FRWP189MB3456.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:1a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.21; Tue, 27 Oct
 2026 08:45:38 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 08:45:38 +0000
Message-ID: <1ee123e0-9279-4e84-8e98-c1e35a6f276a@est.tech>
Date: Tue, 27 Oct 2026 09:45:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 11/12] python3-pycryptodome: upgrade 3.24.1 ->
 4.2.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
 <20261026103138.3137-11-jaipaul.cheernam@est.tech>
 <DMFH04O6U4SD.23GTK0R8VRCA2@bootlin.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DMFH04O6U4SD.23GTK0R8VRCA2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO3P123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|FRWP189MB3456:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a9a6d4-2be4-469e-4552-08df3406acf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261026121527099003|4143699003|11063799006|56012099006|261022075727099003|261022105027099003|261009223027099003|10067099003|22082099003|18002099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: YtctSxGNFAfFJSTn4RCxtPE0d+7J7e+btWQgGU2kgZ3jxv4j+6Ah4rKqmmqSzGlVYI79359vXsbU4THQyZFrEnjNGjPQwAzlqydNAcdWd87skfchA+r84hHNce6JhXwIKlMC1iyToH+TRpxYO2MVhAzw8GyOkNuyF36Ovbx7mDWEluZcvP7VqPNs6z3XO6WwI2zHVrdOVgeKFwSCG/Cx903e6L6eflIIYBluWl/Gfau8nVR/J4NwGJvcXOGrbVBqZ+ExQrFcgLQ2uGuRb+MIzcUTtxym4JCSeQCX79jnqGOTzEqL8EYVXmh0Hqs6o8ImO6UBLX+1H65hoieFCHnrzqx2+BtNVm2ERQNuSot0YafcmPC1OXs2PcmwcD9hhrlzKXaW+q17Jki/rRKdPHBGrOe9TdF+UVjukxcej0bd732lxRDECL8EGABPpncxDsyB4rHrR/EjpSjwjIVCktPKLlRDHb++/iqfG3WBMIcDZdCmvN7ECA3plS6fk9N8KfigV8PauyTksL0kQGaZ42qQhOWf+uXEc6BmFXmloSM1SooECsKLWafGhMlhFbRpB13ww+jR0HlcvXXzbq1pbc+1p4gU2gFUf5D+tQ1VD3gWMZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261026121527099003)(4143699003)(11063799006)(56012099006)(261022075727099003)(261022105027099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fbgQn0i7LbL98AVLri3Sohmat/GaIiDCvKJyqa7+nRppeS40mDW3q8Oez68X?=
 =?us-ascii?Q?R+gn6CP7G64o734a/8EAL9K3Sdeub5Vf9IcYsM8LNxfX/6uaK4CugvaoDpsm?=
 =?us-ascii?Q?Pemw6c1xEfss+uT1MCHJ7yKIMUr0t6lNQz7P2YAyYFyIdbPbHZTyRvTvt8B4?=
 =?us-ascii?Q?aWVm0HUNccQTKqa1gsqq0UrYmBRCuJGZfX2+rwpXULZzlwyJv4+sXpR68nWO?=
 =?us-ascii?Q?N3QTJII5FcdyaDHhVmlulOOCiczWyZTPUt1Ub6B/6YYgxQg2Z4HGqXYgddPB?=
 =?us-ascii?Q?RRWbrjTfrK0yki2upnHKIHweD59DZyZ4b4IAHyqggochrKNsaBJDQYhjqHu/?=
 =?us-ascii?Q?9bChmkp1W39An2tp0lUkfNnAIBkyUkcOgqJ2xJOqOpc83AyXBTVWBpXiLXkY?=
 =?us-ascii?Q?o7PWXhHUkPJd4V3OVqD96nHZryL6COxoNCw6J+i355SpM98A50ktfiTRgPoV?=
 =?us-ascii?Q?dafJydm0TUfJsLZjpaO6+G8KD1J9mOGow5IQS6Y3O0CSPDurC0xStWLpHIWn?=
 =?us-ascii?Q?jbkYQNCkccy/BtsZOr4viCJSaWes0QGDZa3sgjZUM0iZnsXLZuRz6yPM6sVQ?=
 =?us-ascii?Q?Pm+kz0pskoi+ks6w5ZqTWtB3FHRZYPRkhFtHg0Qp9ET96rvWz+ufnex/7TJZ?=
 =?us-ascii?Q?vIXrfY5Ns6VgTJBzZSiaBvsUH3tlsmSEZz8OFOaD2+VN3LruugURZfcBZiIc?=
 =?us-ascii?Q?BRIXvciLUAz8N5xZn5KOwdnFfV7+sSzXUdlziFCqfXNA73rRcZ/yRru537xY?=
 =?us-ascii?Q?0T9fQYReW2tbmw4KpQ1gFEYJsvgfaEVFaqqHjspUYTCnQkNL8KqSZ79ZyHiY?=
 =?us-ascii?Q?B2nsfbaUnTRCpD061vm7udvFAscwS/G/UJjsgzwzhZPQZn1M3hSSfPaaSev+?=
 =?us-ascii?Q?gh0ZdFrUWoKz5UHLIMJak1NRx4TJF2ppRGT+MNacQ6ogUag8wMTiaz4OJ9eZ?=
 =?us-ascii?Q?hN2uVGt1BO9uEMYYVHSJqdrCrzs7Bet3vrF8b9iad3yHc/n5gwr3iNjZKJhB?=
 =?us-ascii?Q?1PtSC8ZH5eoyqB0BKI3BlbHNlgKYC38QnP10Iav6QmKjg86s/vgr36EZrocH?=
 =?us-ascii?Q?LVWNl1tT+Cv3a2zTy+WdHv5fw78GCJi+DqUZbq352evfYzjbHp/ahH9lA81y?=
 =?us-ascii?Q?Fy9QVsLuHAYdrntwFm9fxqSFaFr2If+TOTdc44xiKARPhKPGWLO2wJ4QQB5d?=
 =?us-ascii?Q?GQZlARAOP632IfRqo4c+c1r6wCNjRUtplCGWA2m90ecExQmGnKFU3pJ4xcKG?=
 =?us-ascii?Q?bgLBOy4q/b8rcGPSYMUPByWLhVSK0XecseMYPXzrdiQ4na5AqQGrVbGp7M3L?=
 =?us-ascii?Q?qkMaYpPca+9Ixhyvd6vwBgb5ZwT5SLnsPlQ3KmAV3TExdJ1FOUsoRy65jY3z?=
 =?us-ascii?Q?dREAVlQIeUA7qZEEKpIsfXEG9QfQC0u9HqDlHaA3AT3gv9NoGVDIAZ/4C4Pf?=
 =?us-ascii?Q?oE+id26/mLr3ibQVvPJEBEOfU6pxdEAnQJ9tck4gBpK3wZtLWBnN9n0RjUXb?=
 =?us-ascii?Q?QyXXNApEW6uo7kOlCas0nmYlJNEQf42elWcwn5g3Ctke3qNvYoCFapHB10Hc?=
 =?us-ascii?Q?ElfGXXfNfV0Wbn3tkitkwtf8y9gcqpoDjKo+E5FBPCZt/StK68i1GTXOlM1X?=
 =?us-ascii?Q?yBh3PoMWWP4HEDiOQE6inIONoY+xrynami/jivvBmSEI92NIJEJPXY5fJT6v?=
 =?us-ascii?Q?tBmuqaPrrMsMI0jEQt1CxZeNMeCgXXplzTcYWYSIfWGTnnH8jF73JBsK4rTV?=
 =?us-ascii?Q?+sQ8Zw0tFKyAvtyXps0apdFEFeQkiHE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a9a6d4-2be4-469e-4552-08df3406acf1
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:45:38.6774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0huc7tWlpLfH8zVY98ml3xHmgtP16uSN6gP3ZBMV7wjMAGgjPm+WyEgjkB3PPI8VpcUhXPSof1y7C4wdg3klOYp2RnvSIUyI7U9PA02aG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3456
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 08:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248721


On 2026-10-27 09:16, Mathieu Dubois-Briand wrote:
> ERROR: python3-pycryptodomex-3.24.1-r0 do_populate_lic: QA Issue: python3=
-pycryptodomex: The LIC_FILES_CHKSUM does not match forfile://LICENSE.rst;m=
d5=3Da514b4a7ad24677ae50f3becb03404e3
> python3-pycryptodomex: The new md5 checksum is 29242a70410a4eeff488a28164=
e7ab93
> python3-pycryptodomex: Here is the selected license text:
> vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4922
>
> Can you have a look at the issue?

Hi Mathieu,

Thanks for checking .

Seems pycryptodomex=C2=A0is not released=C2=A0 4.2.0 version yet.

https://pypi.org/project/pycryptodomex/#history

So, may be we need to wait for 4.2.0 release.

Regards,

Jaipaul

