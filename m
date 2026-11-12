Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15129.1794495500063670934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 06:58:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=KIPni730;
 spf=pass (domain: siemens.com, ip: 40.107.130.17, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFPBni9vi8JbQPYxtuNBC+jkiSa/t/5sshjyhJWFH6rz/eplOGX/EK7qKHmgXLEnHqEYZYkhJA4BSVNWtXb/7d3yMZdaH7J3oXO9cPLGrVy3LEEeTo3BMi06kCIkYWp67b9HztsvyWUMk/DTa3zPC7X85WzkofazwCR1L1GVTxpCG40YD6KEv5LiSTRLn/VYTHllOrkgsTEjoTSJlKL31J7l15QuEt/fScAj5oZ4Y54/wWX6Bw3QseVp5kwWE8RxQ42S9Zd/4vKyQI2C4pl8+iLFDWoBj6b35SbWgMXCCIL7N306sCt7k/PH63ZDO5fWkfoZ/fkBoz1TnHU5VYQA5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9i+ITsfl51l7nnsIJKliqWplYmbPrRusLJWjXEN29Q=;
 b=cRp29p5dfnI0Nqcxj8cWSgMo5W9UrVsaiG7g9xc0j7gEfMeooXFFM0avbBvOfGlkLhtAdspWn5MWK9sx0aDJA75+pvVm22vljN6RTkXkjJk8OQs3jANb7pKDHZagByTczMmkRfA/4ZjUPPHjqQln27PTj3hmNx7yb6jLD4ChBPNNTpn9joM1VOKWvklwnx+orDemotLRfPE05CfjCovpudel2HUhmh68nS4ZmhjsnUBRu5GunD8NFAKsVZIoIW0Y+6W/w6iPhfPZ/ejRPc39FzHJbEhBw24vzeGkgEv9U2ClEeQo1jIbz0tR5583yOL/G3xmhyUAxMqCrDoykKuhMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9i+ITsfl51l7nnsIJKliqWplYmbPrRusLJWjXEN29Q=;
 b=KIPni7307PRBIpK6Tj1ybApw3z88CQbz+TuwLdbr2jl6Nyy8euWB8VIvX0TXU+LeNDKw+IxGG1t9Hx/dD7Qto6DYf1BsKWYmAjHk5kZ5qDIt1sltLti1JLyhzSs/REKlcVloPoRa3p4TXYfCK21MGXOQl/BmfDrNIVGKz7iLUam6a96GnPYENAgsXH2JtD2UskjmCocj/75B2Q+zMjPS0x5TR5tPqD5We2BC/wL27lAjKuncPG8Zzoi3GVfXjCZavEv9JUexD35DEmDUq3hwrCcI+oi2oBd3fYP8oiaKLAeOi3XvjHCNS9r+A5n/xMZHtU1SS/7VWevz6sRtC9dF/w==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by AS8PR10MB7476.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5af::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.0; Thu, 12 Nov
 2026 14:58:12 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%6]) with mapi id 15.21.0615.003; Thu, 12 Nov 2026
 14:58:12 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "UpStream_IP-SP@bmwtechworks.in" <UpStream_IP-SP@bmwtechworks.in>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
Subject: RE: [OE-core] [scarthgap][PATCH v3 1/2] glibc: Fix CVE-2026-5450
Thread-Topic: [OE-core] [scarthgap][PATCH v3 1/2] glibc: Fix CVE-2026-5450
Thread-Index: AQHdcq7AvOaYtJpdaEiGg2xKctbvVrcqhwhQ
Date: Thu, 12 Nov 2026 14:58:12 +0000
Message-ID: <AS8PR10MB507368C695FA99B19FDB36A1FD702@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261112115818.76259-1-UpStream_IP-SP@bmwtechworks.in>
In-Reply-To: <20261112115818.76259-1-UpStream_IP-SP@bmwtechworks.in>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=81de5c48-ae24-4af6-9a15-4c5e5c1c80a3;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-11-12T14:57:55Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|AS8PR10MB7476:EE_
x-ms-office365-filtering-correlation-id: b16e674f-5124-4492-15dc-08df40cd5f93
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|55112099003|5023799004|11063799006|261026121527099003|261022105027099003|261026140227099003|261009223027099003|261028144727099003|56012099006|261021123027099003|261021121427099003|261102123227099003|38070700021|10067099003;
x-microsoft-antispam-message-info: u6GQ6+jIzHD4/oe9rHU+IRknZVWPsePUWa0P+PuYEHHUmGn0+qjS2dEaW/Qb2lWMdZQV1eHVW83T9FBmkbVCZsaaFhjQCyJHTbKiTsVNRbo49NHg+URLy94TLnE+DsLj5R2L12Ua+V4ysimYeHF1bg/JLcB/G7y+oDfmOmGIBAukchgOxnEIGZd/iXQwYtDx1AYN1ZDmefdZNyjB3pegpFRsrQVCVbmjEkocz5oM8KZMpfhoV+6wEDCpE6HNM5Mtk679kneEgUylRhrfvfqGer3rp4HOYCKvwBOkO4bwc0LozJfjg+bsqAs5CDclryppB0tdYHerCenlG9JoRqAyE3CxvR03na2z+bLO8YStd4OaS34Y0pwnJSfZyvpysmvkMypwgDMIhPcIofXdIwr2kUeQapkksNTCkuhgBNSo8GvC2/UOL+w6jPjKZERZFNnTP54tEvVKioybR+k8xJ02y/a9zt0lsjiOfRWER2TT2vz6KY0hqUc7vvUlrWgByifZGqGlEmvwWlyGBIJCtecdiS806GuAxSVdFBivf1BVNn9hlPGaNEv+B3pv6kZFJXT/P4yr0ejrnTPk9jHUwlAyPAyB+Y6wMSqjMmWkAcTCvD5cVKNDzilxMle7khohSLi4czszxi/xZSjiSxNn0F74qo0VxOHlBcOPOIHyEg9ZwuI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(55112099003)(5023799004)(11063799006)(261026121527099003)(261022105027099003)(261026140227099003)(261009223027099003)(261028144727099003)(56012099006)(261021123027099003)(261021121427099003)(261102123227099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?siLQ+IBRc+DScJ8gxrCw+ofE8SMTXx5jIL7hOPJ/7QeQmIJaJ1KVLu6ZGgWV?=
 =?us-ascii?Q?QAT6xYKIiqk/S/YBnq/FWEuutBsbp9B0/nnd4VqOCVQzkneoAw84VVNh/y0y?=
 =?us-ascii?Q?iCHl3kbMzmV81jmYFb1JNYziRxdvQqGBcsuntcBoSC8JFGYA0P+Ql+Tqqx84?=
 =?us-ascii?Q?nrjzdIb2VTlGwtEfUBpLrMie36wGx5ruTCCvSlGtHdUDc2xQlnWeqWp4rpdA?=
 =?us-ascii?Q?DPbLjnKvlpAHGq9uvQdNbdzzdvQ54UIyAHFfS20sWzIOJjy7gi0qfrC8x+eD?=
 =?us-ascii?Q?D1EFLvhSoLzw2/GP+WIQUZfkvCpj20GiRgQn7ae5Wc8+wXtnlMnqGcyA8G+v?=
 =?us-ascii?Q?nD3z2xYa83LNpx/kFIlRU03752Kj5AXbsCWzgE/vo85V3JIulISnbRhjpOQc?=
 =?us-ascii?Q?2aVNyuoboeeRWZi6/BFTmTlH/0MFBNd/nyyLs/EXxU4eHFe8+AkeSIt69The?=
 =?us-ascii?Q?f3rliyO/l37Dji6z01AGVgfWYB3eqQ8B83aRoEN/p0VBnBfg2J/VATdp1uVb?=
 =?us-ascii?Q?fYuMhgbN4RaYLe3z0TPwIGCDBFrDA8NnuNV+3EvMOEfvGCAIuptXyJhu9PdX?=
 =?us-ascii?Q?UUal2Pc1Do5cxgj77RLNfbezqjPLen/XbzimPtS62nAsD9dArt7EAGyBhXUb?=
 =?us-ascii?Q?fdDWLyGUEh4bX+MFgmIIAxwb1v2KP6LIVR1mz+ZwCH/d4Cxw9T3QJxnbGtwP?=
 =?us-ascii?Q?wMNWPWqKyNUceTPZqgIxUGXtrSIHYjUbOH/eOpb0oONziNF9sibyn57vW2gj?=
 =?us-ascii?Q?FRZBQYasRMCob5TFH8hJVQwonmbCvwOtZ6s4UQHOLGSzB3Z3lSydCi9yckiS?=
 =?us-ascii?Q?DqM6w5hpk9T6c+kamf3iJdMKSuPxcJgF2PmS0zOnDJdf/UUcyT3n3VqzWB0K?=
 =?us-ascii?Q?RY7YiJQO83zkYPmr02kyPxNu6vOhUydA2KPrl0nsPcaBYGDwg4AOkzxGpIwx?=
 =?us-ascii?Q?4s8gpVEiwObkCW5Tysz0KW73OwrBmgWlICf64ym5FjXDYKz9EzYM002DUIti?=
 =?us-ascii?Q?shQV0JEGbeno4RmCysCCMQ04llJETlpJjVwQ4atbYdJPdcBXCQ/NDdfG2i2F?=
 =?us-ascii?Q?l3w8maqNI5SEsFLmVeetkv1aWMVfj4nW6Jsl1hkxn4/S9uNCLBMsHoasZhq7?=
 =?us-ascii?Q?u0Sy1lN2b2CuhgjLzxn7+FUclvpWA6xDobfDthhxYsgmu7tFTJL8NP60KKI0?=
 =?us-ascii?Q?a3yBupu12ApeWkfjJ7V3npkQG4SpM8pM235IunPZS9I1VSlSGyXaIgQtdP21?=
 =?us-ascii?Q?VTIom9HbcpEO3XI/PduohIlb2DPvW8x1X8dGtAi1NusxOsUn3fzskIBtDN6b?=
 =?us-ascii?Q?zpQa7sZL4Ccqi2ovkcCkEf/1AXc7VPW3BXlM/ob66+o/ZiDF+91/gKUms39W?=
 =?us-ascii?Q?nLJM+Elie5+qECx/8DsDiD8BalJu1GmG9ByYMeIW68XuusvSNuLHrYQ26EPw?=
 =?us-ascii?Q?A5cEVQ5eu+xHJqkbxvlog7G62nFx8RIe2HBpnX4gbg6BUg5HlDNxcm+6Xt/f?=
 =?us-ascii?Q?s8ZByBGP+UY1ae+y34Hg8ZSIPGppefyoElQ6DZJQqeg9Su8rYqt65i85iEZQ?=
 =?us-ascii?Q?bxdobg8PBOzg06zHpglq+xoi6m0Gy1lYz5UFAxb4tGj0nareittOS3GvyRGW?=
 =?us-ascii?Q?m1yB1WF2LRct+XN8uZpU+H5z3Ay/+G9NYHXbVLkRjlBybM4xEKa9FW6gs5pF?=
 =?us-ascii?Q?i6alnOTxv+Bz5WOrwgf5KyQKikX+wgTxFw/s/bDazBNaB04nhucECPnQ8OvG?=
 =?us-ascii?Q?DHQlqfBWbA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b16e674f-5124-4492-15dc-08df40cd5f93
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 14:58:12.5139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 51d/6KBeXUjGgQ+ANGiViyB37nV+3vfOOWbt3LjUDMk37rqkQyQgtA+bxY5zs9VU1rE0tQbJaP04XxMNh+c7lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7476
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 14:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250102

This is already patched, see https://git.openembedded.org/openembedded-core=
/commit/?h=3Dscarthgap&id=3D3eb9b43fb0bcfc2c49aa884f1e7cde8a1f032dd8
Peter

> -----Original Message-----
> From: Sourav Kumar Pramanik via openembedded-core <UpStream_IP-
> SP=3Dbmwtechworks.in@lists.openembedded.org>
> Sent: Thursday, November 12, 2026 12:58 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
> Subject: [OE-core] [scarthgap][PATCH v3 1/2] glibc: Fix CVE-2026-5450
>=20
> From: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
>=20
> NVD describes CVE-2026-5450 as a one-byte heap buffer overflow in the
> scanf family when using %mc with an explicit field width greater than
> 1024. The affected versions are glibc 2.7 through 2.43, including the
> 2.39 version used by this recipe.
>=20
> Backport upstream commit 839898 fixes the buffer-growth calculation
> in vfscanf-internal.c, which can allocate one element too few,
> and adds a regression test using %1040mc with malloc
> checking enabled.
>=20
> Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-5450
>=20
> Comment: Refreshed for glibc 2.39[adjusted source hunk locations and
> Makefile contexts]
>=20
> Signed-off-by: Sourav Kumar Pramanik
> <souravkumar.pramanik@bmwtechworks.in>
> ---
>  .../glibc/glibc/CVE-2026-5450.patch           | 132 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
>  2 files changed, 133 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-5450.patch
>=20
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2026-5450.patch b/meta/rec=
ipes-
> core/glibc/glibc/CVE-2026-5450.patch
> new file mode 100644
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2026-5450.patch
> @@ -0,0 +1,132 @@
> +From 839898777226a3ed88c0859f25ffe712519b4ead Mon Sep 17 00:00:00
> 2001
> +From: Rocket Ma <marocketbd@gmail.com>
> +Date: Fri, 17 Apr 2026 23:48:41 -0700
> +Subject: [PATCH] stdio-common: Fix buffer overflow in scanf %mc [BZ #340=
08]
> +
> +* stdio-common/vfscanf-internal.c: When enlarging allocated buffer with
> +format %mc or %mC, glibc allocates one byte less, leading to
> +user-controlled one byte overflow. This commit fixes BZ #34008, or
> +CVE-2026-5450.
> +
> +CVE: CVE-2026-5450
> +Upstream-Status: Backport
> [https://sourceware.org/cgit/glibc/commit/?id=3D839898777226a3ed88c0859f2=
5ffe7
> 12519b4ead]
> +Comment: Refreshed for glibc 2.39[adjusted source hunk locations and
> +Makefile contexts]
> +
> +Reviewed-by: Carlos O'Donell <carlos@redhat.com>
> +Signed-off-by: Rocket Ma <marocketbd@gmail.com>
> +Reviewed-by: H.J. Lu <hjl.tools@gmail.com>
> +Signed-off-by: Sourav Kumar Pramanik
> <souravkumar.pramanik@bmwtechworks.in>
> +---
> + stdio-common/Makefile             |  4 ++++
> + stdio-common/tst-vfscanf-bz34008.c | 48
> ++++++++++++++++++++++++++++++++++++++++
> + stdio-common/vfscanf-internal.c   |  6 ++---
> + 3 files changed, 55 insertions(+), 3 deletions(-)
> + create mode 100644 stdio-common/tst-vfscanf-bz34008.c
> +
> +diff --git a/stdio-common/Makefile b/stdio-common/Makefile
> +--- a/stdio-common/Makefile
> ++++ b/stdio-common/Makefile
> +@@ -266,6 +266,7 @@ tests :=3D \
> +   tst-vfprintf-width-i18n \
> +   tst-vfprintf-width-prec \
> +   tst-vfprintf-width-prec-alloc \
> ++  tst-vfscanf-bz34008 \
> +   tst-wc-printf \
> +   tstdiomisc \
> +   tstgetln \
> +@@ -401,6 +402,9 @@ tst-printf-bz18872-ENV =3D
> MALLOC_TRACE=3D$(objpfx)tst-printf-bz18872.mtrace \
> + tst-vfprintf-width-prec-ENV =3D \
> +   MALLOC_TRACE=3D$(objpfx)tst-vfprintf-width-prec.mtrace \
> +   LD_PRELOAD=3D$(common-objpfx)/malloc/libc_malloc_debug.so
> ++tst-vfscanf-bz34008-ENV =3D \
> ++  MALLOC_CHECK_=3D3 \
> ++  LD_PRELOAD=3D$(common-objpfx)/malloc/libc_malloc_debug.so
> + tst-printf-bz25691-ENV =3D \
> +   MALLOC_TRACE=3D$(objpfx)tst-printf-bz25691.mtrace \
> +   LD_PRELOAD=3D$(common-objpfx)/malloc/libc_malloc_debug.so
> +diff --git a/stdio-common/tst-vfscanf-bz34008.c b/stdio-common/tst-vfsca=
nf-
> bz34008.c
> +new file mode 100644
> +--- /dev/null
> ++++ b/stdio-common/tst-vfscanf-bz34008.c
> +@@ -0,0 +1,48 @@
> ++/* Regression test for vfscanf %Nmc out-of-bound write (BZ #34008)
> ++   Copyright (C) 2026 The GNU Toolchain Authors.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <https://www.gnu.org/licenses/>.  */
> ++
> ++#include "malloc/mcheck.h"
> ++#include <stddef.h>
> ++#include <stdio.h>
> ++#include <string.h>
> ++#include <wchar.h>
> ++#include <stdlib.h>
> ++#include <malloc.h>
> ++#include <support/check.h>
> ++
> ++#define WIDTH 0x410
> ++#define SCANFSTR "%1040mc"
> ++static int
> ++do_test (void)
> ++{
> ++  mcheck_pedantic (NULL);
> ++  char *input =3D malloc (WIDTH + 1);
> ++  TEST_VERIFY (input !=3D NULL);
> ++  memset (input, 'A', WIDTH);
> ++  input[WIDTH] =3D '\0';
> ++
> ++  char *buf =3D NULL;
> ++  TEST_VERIFY (sscanf (input, SCANFSTR, &buf) !=3D -1);
> ++  TEST_VERIFY (buf !=3D NULL);
> ++
> ++  free (buf);
> ++  free (input);
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> +diff --git a/stdio-common/vfscanf-internal.c b/stdio-common/vfscanf-inte=
rnal.c
> +--- a/stdio-common/vfscanf-internal.c
> ++++ b/stdio-common/vfscanf-internal.c
> +@@ -854,7 +854,7 @@ __vfscanf_internal (FILE *s, const char *format, va_=
list
> argptr,
> + 			  /* Enlarge the buffer.  */
> + 			  size_t newsize
> + 			    =3D strsize
> +-			      + (strsize >=3D width ? width - 1 : strsize);
> ++			      + (strsize >=3D width ? width : strsize);
> +
> + 			  str =3D (char *) realloc (*strptr, newsize);
> + 			  if (str =3D=3D NULL)
> +@@ -925,7 +925,7 @@ __vfscanf_internal (FILE *s, const char *format, va_=
list
> argptr,
> + 		      && wstr =3D=3D (wchar_t *) *strptr + strsize)
> + 		    {
> + 		      size_t newsize
> +-			=3D strsize + (strsize > width ? width - 1 : strsize);
> ++			=3D strsize + (strsize >=3D width ? width : strsize);
> + 		      /* Enlarge the buffer.  */
> + 		      wstr =3D (wchar_t *) realloc (*strptr,
> + 						  newsize * sizeof (wchar_t));
> +@@ -980,7 +980,7 @@ __vfscanf_internal (FILE *s, const char *format, va_=
list
> argptr,
> + 		    && wstr =3D=3D (wchar_t *) *strptr + strsize)
> + 		  {
> + 		    size_t newsize
> +-		      =3D strsize + (strsize > width ? width - 1 : strsize);
> ++		      =3D strsize + (strsize >=3D width ? width : strsize);
> + 		    /* Enlarge the buffer.  */
> + 		    wstr =3D (wchar_t *) realloc (*strptr,
> + 						newsize * sizeof (wchar_t));
> +--
> +2.43.0
> diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-
> core/glibc/glibc_2.39.bb
> --- a/meta/recipes-core/glibc/glibc_2.39.bb
> +++ b/meta/recipes-core/glibc/glibc_2.39.bb
> @@ -63,6 +63,7 @@ SRC_URI =3D
> "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
>             file://0028-CVE-2026-6238-0004.patch \
>             file://0029-CVE-2026-6238-0005.patch \
>             file://0030-CVE-2026-6238-0006.patch \
> +           file://CVE-2026-5450.patch \
>  "
>  S =3D "${WORKDIR}/git"
>  B =3D "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.43.0

