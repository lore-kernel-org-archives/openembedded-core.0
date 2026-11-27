Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15945.1795786636947591240
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 05:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=r2C4i4Fz;
 spf=pass (domain: est.tech, ip: 52.101.66.32, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwhc1ql30zOooK9V7Ll8NYf8DZF16NunWNCABtChCL3yIjCa7HPqLVaR+6g3WfKaRcdB7ql0hXtHzhAOu0l5fZAEoElpwl0zpHuT7Q3hsUmqi2j1OuPxp5gZ96OuO70PNK5uj8FOzJ8ETuZdhsFo+s4Vu+iGwlrg3J5sotkrqF+eCsCuRGZ3uAZtP0fCHOdztFPwuD/KB5CZwm9nSUtuMAGqpTijNBbCq7VhlCYfh+9Y+nb9g0aYLfCGaiWtqtanNHTHQFn3/MY/gMa2yMIyuaH3NFjH0SB4aQDrIeXRNk9tbtsolfI50mMeOsa5ylJZJZ9A0WquDsUkgea7DkCLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRtSpvmbDpa+kY1n4qTu2xoMRZl9L8DeDRZo0eUo8bI=;
 b=oDAj9aDSKNBrIKh5coENNh+uohKUB3gfx2ci2zsw8Hj19Fhp55H4xYGg8YpIw/kOSMVDiJPFG2lUBn4juZw93oBphsU8aOPT1fI3435+pKdf7ANz/gVmFf1rP5iz1iw7Jz0rWr5TSRCLlBUdn0DCRgbM/eYJWqhEfpScDB7esAOF9j53JrBLeA7OMAG9rIsmOdVTO3Gjqyyn/AYaeLRQCPtXIFS+EZQNPQbm6KKmzHMgVDm+hI4mopNz7lO6SN+j579z3Us5VSPq9Xo5i1rRCsoBNEeSawQmnBTgNGph+zhg0JkOMmwgEpX/LcsxPIISSmGHr/bWUKmIwzMmtMVXgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRtSpvmbDpa+kY1n4qTu2xoMRZl9L8DeDRZo0eUo8bI=;
 b=r2C4i4Fzac5yN6HWJ5FP9XLLyKzmJHqAU/6XUq4bt20jy4nl/JgnmS/P87pqDCo2CXVe/vJ5MBreDR3/IRWsJyFG06q9y0FXyj61bKKZvM/Hh2wSLNrBOYRdl9D0GsS/6tNqxO40k2EC9PnI6jqrvx3J6dTh0kJp9l2kpdybwjpEPiADC0/qy/N1PmpGqd/1x5/3rMRiyWOvIH5NVCN1dSHoJY7/SvNzsscjIBhYSObMJ7SISiqIv18vZLtId5X3N24myPp3yOsAcL2y9KqXVOB0PHj1iaB0hjH585qox5YS/O+7k0e6UsbusxgNztVYTd0ChY2BG/31cG5Eb4iemQ==
Received: from AMBP189MB3248.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ae::10)
 by VI2P189MB3586.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:29f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 13:37:11 +0000
Received: from AMBP189MB3248.EURP189.PROD.OUTLOOK.COM
 ([fe80::6d90:c2bd:e57d:e6a6]) by AMBP189MB3248.EURP189.PROD.OUTLOOK.COM
 ([fe80::6d90:c2bd:e57d:e6a6%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 13:37:11 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: Re: [OE-core] [PATCH 2/2] libpcap: upgrade 1.11.0 -> 1.11.1
Thread-Topic: [OE-core] [PATCH 2/2] libpcap: upgrade 1.11.0 -> 1.11.1
Thread-Index: AQHdfcLcCskew0cDLEmSdg4N8V6VULdB2/gAgAAPi7U=
Date: Fri, 27 Nov 2026 13:37:11 +0000
Message-ID: <AMBP189MB3248F365701FAD07ABCCF63DFE412@AMBP189MB3248.EURP189.PROD.OUTLOOK.COM>
References: <20261125090627.78976-2-jaipaul.cheernam@est.tech>
 <20261126162516.93141-1-jaipaul.cheernam@est.tech>
 <20261126162516.93141-3-jaipaul.cheernam@est.tech>
 <DN5ZWX2YIK10.2DW3CFLX8BL08@bootlin.com>
In-Reply-To: <DN5ZWX2YIK10.2DW3CFLX8BL08@bootlin.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBP189MB3248:EE_|VI2P189MB3586:EE_
x-ms-office365-filtering-correlation-id: e64686ad-685a-44f6-3863-08df4c8b8a76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261022115727099003|261009223027099003|22082099003|18002099003|11063799006|4143699003|6133799003|13003099007;
x-microsoft-antispam-message-info: VSUI3ZbugWoA991qk95NNyHkTz7P/T9DM12yKDhS3tu02Pl7is7HSnj9ffN6bbvD9xp13X7AMJ5Jd/UEYLGrZBd4+inR9M/ABagWK+w1+uqmOtYtVgDrWhT+gh82fgZ2/BARog2PNm/PXRs8W7PeUFpvlq6tPiPECSDl227E3rFUoAw3w8PWw6AXXOtqt6WGSxGv8H5L/+imTSQg/Zuu1lEOKnYUT3jaKNqZOyphHxmE3bSnL+2CoIixTBjVgwG5eMxplkPdxsZ09dv3nhluKlZdLhz8kw0++hC/hjtmxfUEl2SV3+HZcU29QA7v7QtenVrL8HVitrdpH32vlCsOW/oFwLEWM7jBgycycJpUr2ZUeJd2VRX75dTbXU/Cp3rYb4gratti+WB2PDAKL0tlhP3T4zYvw3pMN4u0qkotDeZD4/Gc8trD4DBNHXuIWBYR+BbWQHfbTHB066Aa1Gl2MPsJqbaZjVz+ZQ6atVjajFYL5f08xOM22OxW6MQCWGidQFgkL1BLZVIVsLH3ojM2OKEDTkuIA6180zUse1Oz0QGK3/PgIPHRAcASjwLyTStjnUfIiyuZLTLjBGiznJilsYbYfyFYXRcpMO7pET4anH0LA1tjzimTAEVCfSpgTLX5MTkdaUqdrBXERyYWZc4EBI09JTj/331ekvuGU19iPOo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3248.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261022115727099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(4143699003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vG6uwzW3AHNcVe4bdpf0NB7JHxukS3paE4YT7n3AtVdw9SB7dRNbdf9VO/Mo?=
 =?us-ascii?Q?y0BMNTDdq1OLr5I7IKgWOrxn3o0+4yPms0CCV9MoJIM5KP4dm29jJ2w3bkYJ?=
 =?us-ascii?Q?r68KaDmdXiW24aD694oQd1hpQu0vdH3zZw6H4ORQunmVnUXAgHJItdJyy8Qs?=
 =?us-ascii?Q?JNHqtTGnIl2i81oU2VHOqEnXrrA1Gg/NFwDmnBqLdDDUZgYi1ibpCfZvpk8q?=
 =?us-ascii?Q?oOTav8hNRHpQrN7mT1p1bX+4I8YNJAZQ6js+jXQgMBHqrmTnkLp3AWOBv1MA?=
 =?us-ascii?Q?5jlOpKd4l6u4GGB9u0fSFh7Y3KOl6ezr+Y3Y0wdhEywQSWzA0RPyZXyN5bo+?=
 =?us-ascii?Q?CEoIg598qXZlLkGECM2TbV+wcZaGaJ6AqoKNXrqyE+Qe8d951IcAVKOBVzlz?=
 =?us-ascii?Q?All6MT9cRTOoaJMbhThkuT9egJa6JcSh4Qu71ntpOmOnTo17EscporATA4P7?=
 =?us-ascii?Q?wkOHCaYdTGwGqL6mzaeeUbMyN7cJ19PVD2T8UpB/VUcoZ1Cqi4w0OlPC22l6?=
 =?us-ascii?Q?XaMakoWi5OFE4Goqh3A5JyH1TT5E78iC8qLvrwN7kkAqq0sdsM1fHXsMG4l9?=
 =?us-ascii?Q?uA+jk0toN2sDQMgQ8fGIBd3gkKrREK7TncgF7Skeg8n7fBPL5XrLEyUiKnkl?=
 =?us-ascii?Q?voADZ/mAVYz3jpkZ9XtcPOV+LBPqnK/TL+WM8uuE5Y/+8cf60QPoqzs65W4o?=
 =?us-ascii?Q?UTBVKD5JGA27C1t3OaeRH5rR+esYY6uzb2WpDuFS6P/bu2x9wlOBCPiGdZnm?=
 =?us-ascii?Q?Uj1LCKCJF21HnYQ8+njlyYGqdmllP7iqtxrbnRf5FiDvnux8IduFfRF8ARKl?=
 =?us-ascii?Q?gpDciRrin07J6vbOny7IjeeRjKlGcMaXGWULmH1Kt9jilfK0685ifCL0UQUF?=
 =?us-ascii?Q?IKVDK8BExjsUAWYePPRi46Ahkuv6OQdzaJByZ0jzJMJ6nn8dx1MEFjKWGF5+?=
 =?us-ascii?Q?kElaL5cex9XLkHmtpfzXk9zvDEoME7zepmwU9LtLZZ5jrMfMC9vCsE1upmva?=
 =?us-ascii?Q?/u0YCvn1dNKmyQMTMR6TxmAXgKEtBFVFG7Kx8tRyXkjWuUBPn3qd9A746dNe?=
 =?us-ascii?Q?Ibbd4myYaIfQSDP484rMT4zua5afhF1ifTAW0lusse6R7AS0FLcOwZwjJPUj?=
 =?us-ascii?Q?7ZKPl/FcwuvoHJEQj78LXYMQ6jmO0C2KNqptDjn9OlIaHsBuwzsXlh/B9uGv?=
 =?us-ascii?Q?RDbWKQgS5zy04dvxKI2WzsnvNrV1x7kRhgY1e0uHCkqYdCHochMl/M6HRk4u?=
 =?us-ascii?Q?N+ndRYFhOEOq63AGS5RM7XyBY+NP0M14+EoXYCE9kjCxTGac3ib3JKWDwlVe?=
 =?us-ascii?Q?MZu5sxJ9oxCkNPko9BQuhBjFtp2RkffhjkrzAdd3KRXCeyAlUYcxjlU1NVUr?=
 =?us-ascii?Q?3mQTO0FtNatI88h9iKcSa3iP+EkaBgmeIcjMnWLNcX6qlTdy2UF81BLRVYjO?=
 =?us-ascii?Q?tgO7avmW5dzLvvipZl68943Zo0Q9jIphA66wxFPRsnjKUbtppXLn2A25Aoze?=
 =?us-ascii?Q?4zV4XA/K55INT9AmFCjpn6lWE7urg2Gc2FstCadCmPLl/4dfd2tQx0YsOfEJ?=
 =?us-ascii?Q?Vsu+Q6bp6bxFEZuTUapNUWyFTFOn0oAnu6d0oj8Lo+s8tPydAY5ZeS3WOhFv?=
 =?us-ascii?Q?3v4DNnNB0EANZhh3uwJTxMKZTkO6YYFV7adeLYm/dvkVEslk9WWFJ3kVy6mZ?=
 =?us-ascii?Q?XoiUXDGAQ8EPvUsC9xN/OVddgsbgnTxylzw3Xi2u9URAHSjtyZn+1FKETkCH?=
 =?us-ascii?Q?1ZLdRcV+Ow=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3248.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e64686ad-685a-44f6-3863-08df4c8b8a76
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 13:37:11.6851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yampibtjvt1FgfXlMGL+1woFqdXQZpZSdjpLY60ARxLsYspOOt69LDOMwlrM63Ue1J11aHyUONRVe7V5vzRrCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2P189MB3586
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 13:37:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251388

Hi Mathieu,

 The failing build couldn't find the new fcodetest program, which patch 2/2=
 adds. So the build
  probably used Jaipaul's older 25 November "[PATCH 1/3] libpcap: upgrade 1=
.11.0 -> 1.11.1" instead
  of this series' 2/2.

  I tested this series on its own on master with testimage on qemux86-64, a=
nd it passed: 16043
  passed, 0 failed.

  Could you drop the 25 November patch? Both patches of this series are alr=
eady together on
  master-next-tests, so that run should confirm it:

  https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dmathie=
u/master-next-tests&id=3D48ef02b293f08e50cbf7cc9aa04aa01f847859f7
  (https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dmathi=
eu/master-next-tests&id=3D48ef02b293f08e50cbf7cc9aa04aa01f847859f7)
  https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dmathie=
u/master-next-tests&id=3D9c327381803f149533032e5551e609dde1c9e3a4
  (https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dmathi=
eu/master-next-tests&id=3D9c327381803f149533032e5551e609dde1c9e3a4)

Best Regards,
Pratik

________________________________________
From: Mathieu Dubois-Briand via openembedded-core <mathieu.dubois-briand=3D=
bootlin.com@lists.openembedded.org>
Sent: Friday, November 27, 2026 1:35 PM
To: Jaipaul Cheernam; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] libpcap: upgrade 1.11.0 -> 1.11.1

On Thu Nov 26, 2026 at 5:25 PM CET, Jaipaul Cheernam wrote:
> Changes: [1]
>
> Tuesday, November 24, 2026 / The Tcpdump Group
>   Summary for 1.11.1 libpcap release
>     Source code:
>       Fix function names in two error messages.
>       Have pcap_fileno() return -1 rather than PCAP_ERROR if the HANDLE
>         is invalid, as the return value isn't a general error.
>       Indicate no-capture and no-inject devices.
>       Require libpcap [internal-only] config.h in [internal-only] pcap-in=
t.h.
>       Use more parentheses in BPF_STMT() and BPF_JUMP().
>     General:
>       Set all the file descriptors/HANDLEs to an invalid value in
>         pcap_open_dead().
>     Building and testing:
>       At the build time require atexit(3) not to crash.
>       Require config.h to be from the libpcap build.
>       Test for <sysexits.h> instead of specific OSes.
>       mkdep: Use mktemp(1) if it is available.
>       mkdep: Propagate compiler errors.
>       Enable out-of-tree invocation of autogen.sh.
>       testprogs: Factor fcodetest out of filtertest.
>       Avoid some compiler builtins in Clang < 9.0.0.
>     Packet filtering:
>       Fix validation of "/", "%", "<<" and ">>" 2nd operand.
>       Fix a dangling register index in "proto[expr]".
>       Fix a register index leak in "protochain".
>       Fix the skipping of AH in "protochain".
>     Haiku:
>       Fix a compiler warning. (Issue #1738)
>     rpcap:
>       Properly check for a network error in one case. (Pull request
>         #1793)
>     Documentation:
>       Note in pcap_fileno(3PCAP) and pcap_get_selectable_fd(3PCAP) that
>         the descriptors returned by those routines must not be
>         closed. (Issue #1722)
>       Update a few OS-specific README files.
>     Linux:
>       Include sysfs rx_dropped in pcap_stat.ps_ifdrop (GH bug 1328).
>     QNX:
>       Fix DLT_PFSYNC definition on QNX 8.0.
>     Link-layer types:
>       Add LINKTYPE_ETW2/DLT_ETW2.
>
> - Adapt ptest to "testprogs: Factor fcodetest out of filtertest." change =
[2]
>
> ptest-summary:
> INFO:  6580 tests skipped
> INFO:     0 tests failed
> INFO: 16043 tests passed: T min/avg/max =3D 0.001184/0.002512/0.022410s
> INFO: Testing time =3D 42.74 seconds.
> INFO: Executed test rate overall =3D 375.35 per second.
>
> [1] https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.11.1/CHAN=
GES
> [2] https://github.com/the-tcpdump-group/libpcap/commit/fd4ece414c8c
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

You can find a new failure below:

Failed ptests:
{'libpcap': ['libpcap']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1657
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1638
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/5021
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4989

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

