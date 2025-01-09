Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BD7E77197
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 17:21:56 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.43])
 by mx.groups.io with SMTP id smtpd.web10.2526.1736443309454763573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jan 2025 09:21:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RdCjwAyx;
 spf=pass (domain: arm.com, ip: 40.107.249.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urv6GZi0JAD/1L7glTZr/hqgslWrVRGTqTbAhSFBwFsAZTnaTmEOTWEPpuwLVwegTahz5k0DzxztTwg6yoN8oZW7KC9dAZAdgKruE7Ij9vBOeK3zV2sdsEKPPZx1564/2oc1lZGxIRnYOizJvAh+QB9Nrgi8OlHbWHRfDnQrKyli51vHKb3LEXW1guBgc3U+noWk7JnmbCQw6hP3AeLjj6u0G9Svk7rlHEzkkHcISx4EVNkm3u18oiyED1zf0tBZHfNjbJ9rQ3xVx1mYyhPWs3e9mR1P9e+g8Ekq92HipoGmqpcpkywiAvcKn0LqQuRNTE68YtgJ84fmiXG3/w8UHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRuM0pbdERGJ8VSffKTYH/4NUF/wX8V2U91aW7gn2ow=;
 b=Is/On8+iDiiQfCp4/TL7N5TPlJ3ztteMJCWkSljb2DESPiTaIAJGHF025ZV1jUNrkDbYmtXs0LsrR4ATuufLk3V9K8Z2OF0Z1cMX5S7MihoGAT6gL61Gx+MZd+zogFtLHgDC0Ma/9fgIpOFld+xwVZwp781JRox0pPerbmepIWUlEDkhgqAHisX1zisW6qSjbTNELayfuQpIr2rzpUIYKrv85ymIXkwoI16V9ccq0oYrrue0OBLlecgpJspl9OgVDJpJhm61ewhv4+sv5urzPGiCa+Y6wdP0brp6E85Ez4Vp3l9iupxFF5nWsI2EHZk1VWLW2TNnq5PzhTY9hkcqHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRuM0pbdERGJ8VSffKTYH/4NUF/wX8V2U91aW7gn2ow=;
 b=RdCjwAyxmsNhiEeONVGc8AC3zsRDwoDmao+FZWH68sjmv8aAUTZ47ZmgC4OaPjCs5tB/7uDdhutIYqgeQYB8N26hI6Iyjc2JdwAQdVohR6VO6MO7hf+30TuGUfKSY5WX9H0QhmS7Bws5/juDG9iy3ifMCwlzWV8hupKPFFxASZ4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6535.eurprd08.prod.outlook.com (2603:10a6:20b:336::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 17:21:46 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8314.015; Thu, 9 Jan 2025
 17:21:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 12/20] libgit2: update 1.8.4 -> 1.9.0
Thread-Topic: [OE-core] [PATCH 12/20] libgit2: update 1.8.4 -> 1.9.0
Thread-Index: AQHbYamQaXyLwMEEiE+RgpGShIjq2LMOsosA
Date: Thu, 9 Jan 2025 17:21:46 +0000
Message-ID: <ABBC5F2A-C656-49D1-BE06-058CEFABF6F5@arm.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
 <20250108084226.117178-12-alex.kanavin@gmail.com>
In-Reply-To: <20250108084226.117178-12-alex.kanavin@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|AS8PR08MB6535:EE_
x-ms-office365-filtering-correlation-id: 609567e0-7e39-4698-8e18-08dd30d2186d
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?buNyhG9C6bP1qa/Kddu9up7BCjwbhj5+rymo2Mj+Ro/xSJ/I7607wR93S9sH?=
 =?us-ascii?Q?c2J7iiZ7NPZN+hKm4/+bSwgLEVyDmjpdz9/d4HKrPZ2g64jL0eKzGtHf+por?=
 =?us-ascii?Q?qwrNTnzcz/Oi7wjBETM1saPps7vrXsb19iMG3Yfl7KGU+lD0srSeZVpZGgpU?=
 =?us-ascii?Q?3O6eYKbqTnxvoErBe2dWlbU6sVFhgDwY6EZKYPvmkjmYfqmZbFPPOtLCeIHh?=
 =?us-ascii?Q?t+IPUaZNiJYuSgRDbkMRc3kWw6TJgOg+b9Uj5rTSAMXrurfnvy5NvFtvJJla?=
 =?us-ascii?Q?vEXvVMOTq1Xc9/ofqWGd109h7LnJt4C+Y+oQCNhgD/N5bac1t+Bw2WqIJLqw?=
 =?us-ascii?Q?fwuCCb32VzDbGED9cgvAMLskqYSOxbi/f3NB6fADnxzSM5lCo8t9Q1PotqvJ?=
 =?us-ascii?Q?mRbQX3EJB254SKBJceezddColuis4UEqwJ8YBVNkKSrB0f3BIcc/Fke5s3hI?=
 =?us-ascii?Q?PfsPChmunz5eYrcs3VFkOCJ+0tjfsnMDheyQkYQvo9LsteKbO6YNkxXwu2WV?=
 =?us-ascii?Q?4UplsMM55MPVL5DCdaHqb89TRcirAc6S2KoHnspy/NYUNnbb4Tx5Wny/elqq?=
 =?us-ascii?Q?hk7FbLRp8DLULL0gutJ4TS3U0uSmHAgtadlWxvE5Z8fT0bn8VeB02JllOORC?=
 =?us-ascii?Q?gEUh05tJQYFJuZaxFbF4CPT2O5uS4tV+Zc/B+A0kkhQ4v3dSpW9xiok4yvTN?=
 =?us-ascii?Q?CqOj5ULhhsZ0ExNixxljjlVpFUumVjXzGy+geL0Ye7WRaxdQ0mX3iQsWPrbS?=
 =?us-ascii?Q?7gjLzmMeRAsFIHqtMjI64Q99WhIwy9sFZ9n2873BsSwaUW7OJDSv5CdGDgWL?=
 =?us-ascii?Q?UwI95LQwFgBHQwLq/1y0d5Qk84qQhPprYSdyMeZDikLNkBuVRbWggAdlP+ES?=
 =?us-ascii?Q?zvL1xCTkCH0fErAfSjMhR3bBHPgsU2R2Mo220K5yuAe/iLfr/f8+xaxzHjnH?=
 =?us-ascii?Q?p92oQMnWUqFjrs0o1pyIBE/dYL49g0i+fi0mNd5MsWNGHtdq/U3fDyoOQtkn?=
 =?us-ascii?Q?oYhsFNax9/4maCp8O5n7G7UflGPrRkt9MQOCdIydxV9SFTfPcFIfNFKWSbNt?=
 =?us-ascii?Q?rClhxC6uXYp3WX3QAfdVSzh4IJru4TDoG3USaN/4nQdHM/IchKgFMG8fPmdN?=
 =?us-ascii?Q?lJs6WeW6Oj1HTkjnCoRsI9pDyOQiPEPexv1kPuv7j7tbAQNEGBIn0PvshPjN?=
 =?us-ascii?Q?loLXuOCAIbC+8iJHRQE9JK1I9lJYDDNWFpnbCZkOy7o7EAsKKlimnyiOeOQx?=
 =?us-ascii?Q?JVLM3gDei02/CZ2qABVjyusnw2SJYJOwpiDHGZeRy1aHPWlu4IQxc9b4CrTQ?=
 =?us-ascii?Q?jRBsjRWK7zuKYoaf1H2hps/Bn07aTXMta22/BYSXNkwtS+7yT3bpxCWXg6rQ?=
 =?us-ascii?Q?TldfCbm5cjuKQcd29nJvirPoIrHGEnvKAZB6AbMARfqy6vVKtnz2qD8X1u9Y?=
 =?us-ascii?Q?Mr3ptmPpeGw0niOS7oG6Lso1N68FCTXJ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?70QhGuMywA7UMMSr618aYaqwkQcZBpwLS3Dce4JXkqfwZNvFQGj/p2yKHuJ3?=
 =?us-ascii?Q?oxNlAZyVaaHgrkxMs2rXsARjs94/Z/NJgFoIGoHVi9zTQ0eyZzAV9FaOeb6G?=
 =?us-ascii?Q?9nRKoWs9/y7S/psx605j18JIWTteatrldv2t6zu4jE8xeN/mbqj/28M3IexW?=
 =?us-ascii?Q?OQk5Ba6q1sJYpH4kpPqypYZeU/vda6XRdEjPdHN1wR87QhDYo0AycZJ0dpRB?=
 =?us-ascii?Q?kXuXkB82sum+wPTisBtqD0jLH9IwtWKkS3QBldql8lM22RirOt2bbMP1XgWU?=
 =?us-ascii?Q?dCRAW2A7tn8dKw2FSYivmqwFLTOtev9Be0GSKRhN5z0MzmBt3a7KftcLeNZP?=
 =?us-ascii?Q?1l1ytOCSgROHYA//OHmI9BxbHls0NHb7b73BLICp1cOMJQ02rRPLWbPb9LRp?=
 =?us-ascii?Q?M2t0m0oUfVbxDQFpZsr2vyaU49+PXobjjkNxMeiBn7+1ZtLuu0rSNpWTXX7O?=
 =?us-ascii?Q?5qIfq8wj4GNmCs1A/HpGbJ0TxkSTp/ORsY0o58XEzkKVr4btkQl0TOwWKTps?=
 =?us-ascii?Q?u/vTFer43iOjY1usNYQnujzQ7djsKfBLspm3l1k5WHKjB85hzQskCMl6NsRQ?=
 =?us-ascii?Q?SdPzPtUYaSqrnaNKLXgfKhYpzpSPk7xZlS6LQsaCFB+o0oL+flX7qy7ifADb?=
 =?us-ascii?Q?aeov9P/p2tLcqA0FqpZ4QmCyGP8bsX/vFmO4SJobIVXFDngWgPQiJrDa/1DO?=
 =?us-ascii?Q?vYoDbbUis5GVWNNAtyMwnLVamTmxrorlU9+zZFspdRedql3+FRfUOC/ihuR/?=
 =?us-ascii?Q?OFiDm2y5o/CYxoJtZGKQljdQ2DA/HUJHO9MftGDgpJWnc4x5C0eIsU9h+ke/?=
 =?us-ascii?Q?Qf8D3HE3V7elMMxMKOj7lv8mYKIXyiXzxLn3KnIv36kNpgxSry+9LPX4IHZK?=
 =?us-ascii?Q?On2Yco87Yje2dBbdBE7kpjxI/YqR+qle4oNpJA+RdMnOxt8AqoL91btbjnuP?=
 =?us-ascii?Q?LEdfOy2FZmsKZ9KGjNxaBlvMDdj7z0/2imAc76ToxuC86ieLHxGUatM1PAwT?=
 =?us-ascii?Q?PrJnhQFRJcm3ur2WaKx5W59x3FK/vQ61NnMnoLUuSJgACxhbJIi3QrCgX9w0?=
 =?us-ascii?Q?aPQFW5LP+S6DQLjg5ucfTEvdG1wPc/IwLW/BbBYhR7Rx5SjbCQCIkJR09yZ9?=
 =?us-ascii?Q?P68a4aQEC1xIEVWJmIuCk+JhxcEKXfJWZulFg9OoKlTo+6m2XByifmn42+QK?=
 =?us-ascii?Q?T+tVj3oAONkLRGulm7xMbtfkPfcg4AbMiJ8gUddCFQ8wSU0C0Jz3gZE9QXbk?=
 =?us-ascii?Q?4iNa0IC7vSaSwg3U+JTfVUjvSbn0jAgOHcowtIB8k9lbP55KYI+olYqShmPk?=
 =?us-ascii?Q?R3KPXsY9bZdN47txiec3gvIOUqK8qPsNaX5y9FXw2BdjO4Qh2h7yzKaCtQC3?=
 =?us-ascii?Q?6xlH3EYQMpzw0gxs/7LX80Mv3n7ywRhB/tbqQnq7m08Po24OClvfo5VEzLSE?=
 =?us-ascii?Q?i5KeDVN3U3t/F/9J2NQZR49RVkWV5UBhd5ItOagGrCvzspmDp86T32SRb3km?=
 =?us-ascii?Q?A28o4m6tqajjK/jnj0NbszChHrPP3H/Y4fScDvlRMTxgRPtWh4/HxV1KopfQ?=
 =?us-ascii?Q?R9hhnCh/CV5KSXWQ0OEuijHgcPmkfAYGRYgNwE8R?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7BDEBC0EC308CB4CB9F6CDDFC3C46088@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 609567e0-7e39-4698-8e18-08dd30d2186d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 17:21:46.6987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A3L1NYb1brxwFBQg7A8Ar8/U9BwoueaX/hzGMC2MitzYhsABDTOBIA0gi3VwNzUgY6Yv6oicV4CkE6TOKznbeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6535
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jan 2025 17:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209629

On 8 Jan 2025, at 08:42, Alexander Kanavin via lists.openembedded.org <alex=
.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

Your commit message says:

> Do not install cmake files; if someone wants them, please make
> them reproducible and not hardcode-installed into /usr/lib.

But then:

> +Subject: [PATCH] src/libgit2/CMakeLists.txt: install cmake files into
> + configured libdir
...
> +do_install:append() {
> +    sed -i -e 's,${RECIPE_SYSROOT},,g' ${D}${libdir}/cmake/libgit2/libgi=
t2Targets.cmake

Guessing the commit message is out of date?

Ross


