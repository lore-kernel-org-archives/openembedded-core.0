Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15116.1794495476161459955
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 06:57:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=mpGjeKnd;
 spf=pass (domain: siemens.com, ip: 40.107.162.23, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOugn+p+UqLH0b9VdtXXIfZKARHL3qIGwUDvPkekfNw72GiplW7A4oBgEcFCevQawpDVxs+t5T1w9ill69Q4GQoGNull1Zr1cRmpbMU2uj8Ojlt1GY0CPfUWhqct5org6gvysZTXfXkC3ADKkYHXLqdUDngLj0UKYJImSRjw/h98o9sVKxP4PNsDgdOuqWX1z7RF78L+n0BWc95NN6QKvp8foMAcZgHev53TvzZ1k7g/ruYhlsbXILEkeTDtlrA+XQLOmybC4EnKahRpVKzgDRWsLx6AH3B+tnQ9L41tcyIoDP3GVMwaF9mE1ZWdaTFfR0xjhYrNrvW26j9ZphzPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCyPeBCmGbRR5JuHtDggktBqfPL/krmn6VT5V7rQzwk=;
 b=BfIeounXUG+fc2arJIo7tmSBgfoR9k1C2964Hu2jGJ6KEkyGCvg0S5kPy56ZQagNW8uxS96ATf05b98sFO/m8GKhQXLPtHS5pRNUADVN6XANOpeHDO0Z3BXnvsyPclgZuYJvnEGHHOThOebHlc80YHSDIxblHyviE8b42aBAItM6YDhfAgC0EqNHy1Mz6bP6oJnHAqc2SVboyxkAFAF+nMXZBzA6kI/4IeLqGrX7doji11m2/LAO0sCQ/fE46gvs/2b+SNyTTNJQ9vpwCwN31nZCCO41RKUBZzgNvCo/oPSrEDT2TJiHhCCGzfofqGIavVQNFUhQKY5a0GDeNJwflw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCyPeBCmGbRR5JuHtDggktBqfPL/krmn6VT5V7rQzwk=;
 b=mpGjeKndsEDaeo6Kh3o2trfLXasTtc7nwCDOFKjfe8U4lxEKfXyowTc9W6HNhtzB6FVEO3NHPfUfNcOjgQ/pKP6IRounZwaqSRYnFsNHxZliWMhLd3IMwOQYToczQbZ+5uGb3Vx6/txTUS6ixU/V03f0rPyzatLCiFs52wOFRuyptC6DIOZL6C6HAiugfbVNLVw1CY2UN7G4OPaRHn/bnqRbkel7YGwYfa//HkKNWg32potoYqwptywg6VTxPz+ZO1TDBztgtZ8hE/VTBN892YBXOEF4zeARyNe4GgtC0+6kjnUVE2pIAaMRPCNgcq6lMJ/IjtVLVeaBemk1ATOYvg==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DU2PR10MB7814.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:49d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 14:57:51 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%6]) with mapi id 15.21.0615.003; Thu, 12 Nov 2026
 14:57:51 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "UpStream_IP-SP@bmwtechworks.in" <UpStream_IP-SP@bmwtechworks.in>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
Subject: RE: [OE-core] [scarthgap][PATCH v3 2/2] glibc: Fix CVE-2026-5928
Thread-Topic: [OE-core] [scarthgap][PATCH v3 2/2] glibc: Fix CVE-2026-5928
Thread-Index: AQHdcq7IIBCyMJec30uME2b2QczO8rcqhtDw
Date: Thu, 12 Nov 2026 14:57:51 +0000
Message-ID: <AS8PR10MB50737EA73B08977012A90535FD702@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261112115818.76259-1-UpStream_IP-SP@bmwtechworks.in>
 <20261112115818.76259-2-UpStream_IP-SP@bmwtechworks.in>
In-Reply-To: <20261112115818.76259-2-UpStream_IP-SP@bmwtechworks.in>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=32eb6833-b46f-4d96-b1e0-97f0bacc8ed6;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-11-12T14:57:08Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DU2PR10MB7814:EE_
x-ms-office365-filtering-correlation-id: 20614ef8-c085-4e50-0566-08df40cd52ce
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|6133799003|10067099003|55112099003|261026121527099003|38070700021|56012099006|11063799006|4143699003|261009223027099003|5023799004|261021123027099003|261021121427099003|261028144727099003|261022105027099003|261026140227099003|261102123227099003;
x-microsoft-antispam-message-info: PWCvNKei64hFlGCaavtW4aYzcvwz6kbvqo6hcgBo18gi4M4oEzsUppkGMZLXGrAG5DZi8RkNB1SQeT/3VwjgAdY8jvHk1V8l7E5oW8+oqkSajVLE416aaRU/Lpk6OLtMhdTgeJvbBYBncMbUSlcC1VGGlIPFbWN0gCyPRtmLOm0I+hNStUxF1yFEPgad/CBpJYbFi72OhIVRNa3CqiLfYx8EjmwpxeRjvAibeUt3JlYsf0ACXfDWzaW+WnuroKELS+rX/9A1q7tR7dUo0W0e5jpC8WwcN5iHcpBaAGuL4C3+yEvTbWXFnguxJtPgMkBruWYUqSYrMZIXCklcBoBhp9kQk+dqgPXed4B0np8md5SB5188VWQPes8CGfX47jXOCnTigm5pw6DSy71c4koFueDSPEqgi6ihDo+cgd+/LNeg1Nga37NlMLrbeq6haqaukjTwGPCPYUZRpD/PBA6c24kaoKxk+NeBxCKu46Il23KWEjspH7Zmex1A6e5+YnllOGpMkFT8rmCh9wsXq7+VoFm1TawQhL+H71joTst4wcBmY238F/HwgwcQCZaG1Zh3s4EQncWS1bTq1938OwEF+cf1MJDe6SIB+ICnAARs8YmwZid7KV0wID/M8KpSsC/RDxbxC0vV/c8dQKD4jserDsZ95ddNS2vVgRdmZ3KYsOs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(6133799003)(10067099003)(55112099003)(261026121527099003)(38070700021)(56012099006)(11063799006)(4143699003)(261009223027099003)(5023799004)(261021123027099003)(261021121427099003)(261028144727099003)(261022105027099003)(261026140227099003)(261102123227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oir3UG0JFvN/qRYROtVLupUgfsPzswKQwrBue7jvqd/1BbXyvbNIy5c0b6eg?=
 =?us-ascii?Q?9cANmCcJDDqN5+duaFShp04WJockb4emoLo8SPxihBazJIAqm87ak8pKYqP3?=
 =?us-ascii?Q?pSEx1fJlBe3ljJXrwOFd3rz2odRj+jp4lWeqTxQeptZWXo84aO9Us8Yvixd+?=
 =?us-ascii?Q?lQv0s3IG0Ba/h5EvaI4BlcShCoAKdqPxrOpZmYzdkEg9rsaPDP8cD6EQGTay?=
 =?us-ascii?Q?l9mKi1CaI8w4iOKrrWO9UQ6t9oCsoekI3Ath3kVVJCTluNVda/NuI6yt7mNJ?=
 =?us-ascii?Q?XSbyQ8ZIuLJc1JVCv5u0uxjlVKFyDUfymTKmuvzBilwSfpjNlwrd9RcYOqlT?=
 =?us-ascii?Q?gq9Hmz8uen3CgfJh//ZMHRwKRdBoaUnVUz/qcREybNkIqvoTDprifJaPZVly?=
 =?us-ascii?Q?czZvN6qbl6LIgZQGNP6tLjQKhi2JIJ7vajoLGssYbUeoCw0EoCqrR66AK1/Y?=
 =?us-ascii?Q?0kydm437Fmz85r0UQfpLy/9OpjBI+8P+DjwMAexzmS7YjOFJa5L7/5R0ZzEF?=
 =?us-ascii?Q?UXPgCLWTM23QCqsFvbHeVKetaFg7DaXbIqnjRpoyzUNYyvmpg7wv8aRPME9A?=
 =?us-ascii?Q?3NvHxIleDvrjnKVwUIr+F3ibf/ruRws3k6W1Kg9ljeQNbyW1RWDTriTewN5/?=
 =?us-ascii?Q?tIcdBfPFVbF9bYXx0yv24fE0h1LnjIAxHCGE78/UDcRQh+Q39MA7Yx0189i8?=
 =?us-ascii?Q?AkP3x1Nw+y//qgQyJmP6OhzeKLD0ce9CkjuGOtqhYxaBQTEpTDd2VUgyjjMQ?=
 =?us-ascii?Q?UDGIWc5VgKzepq1JNuDmLWi4ZeZ+UuBGoRu5vVQd1sDDxCHPAYx19/kxFyrN?=
 =?us-ascii?Q?9VWz2lTUe8O/0asth6i+zsVtYaOYDJT2Sk7HmW48rINNY7useDRFCb3Tq6B+?=
 =?us-ascii?Q?nHtIeaFKHt44G2iwR5OHj8SbtF1CEtpMwzQof0UJFWv44X8MR7I0XWMzGTRR?=
 =?us-ascii?Q?dL6Rboc4JDcejR2RMxXri97lhOf8QI5reFU3balB44fyX1KheL1d/kMkvhTc?=
 =?us-ascii?Q?8jtNk2vZHSxzCRyCheL53EXfdGYiAgXHVRLcLM1tIixy8Hv9HHezEX+M2G7K?=
 =?us-ascii?Q?CtRTkCTDlLgXj++MaeWxfEI3nvWReKdUMq/jkEnWurZoqRdCwj655nSbApB7?=
 =?us-ascii?Q?T+LnEojVh8xmDTHV7Mvs5B5soyxoVFdI2XkIW1NAmNLiZWBTPM4RnffDuUbs?=
 =?us-ascii?Q?hD0El56f8ei1TyGZKO2W3+flj26PPX0TuAhBiOxXYt1J/Z8XR0/xnysVVXwX?=
 =?us-ascii?Q?D+PVSH0YC47Bv9JXRBPTiyEnqm2bbCVInbHWqt41k2fAZ+zPdXb4KSBI9xLr?=
 =?us-ascii?Q?3oNUVoxUhg+ZOdnEZndl1k5ThcRkqmm9RD/RInmnvvXLHItI8xwocHqmaha/?=
 =?us-ascii?Q?Du+5/f0E+et/nijNt909WKy7GoezlZipLA+1SqEmUgq/gM23n9+jfZy4tNJ8?=
 =?us-ascii?Q?HmH3b9bEjikL+afyBZD2DXc0/btUEoP297KXOqXiKs0Ub1ZC8QscUE+q5nk0?=
 =?us-ascii?Q?No/UZMKn94fdl7HnDAFalnZxv1Cz9DvB2tbqLckBDatyBRNfgj9vkL2OzCFN?=
 =?us-ascii?Q?TXmpG1vMyAIrfkcB5kvOXeQv1wv8/iUEO07pPV0eqP+EScK90tdyO4dB4KQG?=
 =?us-ascii?Q?7sxoVGH7BFwJxrJCgskq0YioMrTqYLp9Yyic+F5vSF0Q6jymxNhRb5bjjCHZ?=
 =?us-ascii?Q?uR3xl1SnDrsY0aXkXj/WCCwH1oXLy0/oJQHhqd9uBm72tThlY9aTATMmdz0P?=
 =?us-ascii?Q?atGANa874Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 20614ef8-c085-4e50-0566-08df40cd52ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 14:57:51.0976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EDCmjcdPnP3l0peoV1lHwIyagVV+Mb3pyi35R4oMGKb+/N9QVqGiwVZ4yrsahkEa1ghAcWOCkGulOwD5tKoHJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7814
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 14:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250101

This is already patched, see https://git.openembedded.org/openembedded-core=
/commit/?h=3Dscarthgap&id=3D3459c342137aea6a59c43b80289d30a84d0a3148
Peter

> -----Original Message-----
> From: Sourav Kumar Pramanik via openembedded-core <UpStream_IP-
> SP=3Dbmwtechworks.in@lists.openembedded.org>
> Sent: Thursday, November 12, 2026 12:58 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
> Subject: [OE-core] [scarthgap][PATCH v3 2/2] glibc: Fix CVE-2026-5928
>=20
> From: Sourav Kumar Pramanik <souravkumar.pramanik@bmwtechworks.in>
>=20
> NVD describes CVE-2026-5928 as a buffer under-read in ungetwc in
> glibc 2.43 and earlier, including the 2.39 version used here. With
> certain character encodings, this can disclose neighboring heap
> data. An uninitialized byte-stream read pointer can also cause a
> program crash.
>=20
> Backport upstream commit ef3bfb5f910011f3780cb06aa47e730035f53285.
> It fixes _IO_wdefault_pbackfail to compare and decrement the wide
> stream read pointer instead of the byte stream read pointer. The
> regression test checks that ungetwc leaves the byte stream read
> pointer unchanged.
>=20
> Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-5928
>=20
> Comment: Refreshed for glibc 2.39[adjusted source hunk locations and
> Makefile contexts]
>=20
> Signed-off-by: Sourav Kumar Pramanik
> <souravkumar.pramanik@bmwtechworks.in>
> ---
>  .../glibc/glibc/CVE-2026-5928.patch           | 112 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.39.bb         |   1 +
>  2 files changed, 113 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-5928.patch
>=20
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2026-5928.patch b/meta/rec=
ipes-
> core/glibc/glibc/CVE-2026-5928.patch
> new file mode 100644
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2026-5928.patch
> @@ -0,0 +1,112 @@
> +From ef3bfb5f910011f3780cb06aa47e730035f53285 Mon Sep 17 00:00:00
> 2001
> +From: Rocket Ma <marocketbd@gmail.com>
> +Date: Fri, 1 May 2026 20:39:07 -0700
> +Subject: [PATCH] libio: Fix ungetwc operating on byte stream [BZ #33998]
> +
> +* libio/wgenops.c: When _IO_wdefault_pbackfail attempts to push back one
> +character, it accidently compare the wchar to push back with the last
> +char from byte stream, instead of wide stream. Under specific coding,
> +attacker may exploit this to leak information. This commit fix bug
> +33998, or CVE-2026-5928.
> +
> +CVE: CVE-2026-5928
> +Upstream-Status: Backport
> [https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Def3bfb5f910011f=
3780cb06aa4
> 7e730035f53285]
> +Comment: Refreshed for glibc 2.39[adjusted source hunk locations and
> +Makefile contexts]
> +
> +Signed-off-by: Rocket Ma <marocketbd@gmail.com>
> +Reviewed-by: Carlos O'Donell <carlos@redhat.com>
> +Signed-off-by: Sourav Kumar Pramanik
> <souravkumar.pramanik@bmwtechworks.in>
> +---
> + libio/Makefile            |  1 +
> + libio/bug-wgenops-bz33998.c | 54
> ++++++++++++++++++++++++++++++++++++++++++++++
> + libio/wgenops.c           |  4 ++--
> + 3 files changed, 57 insertions(+), 2 deletions(-)
> + create mode 100644 libio/bug-wgenops-bz33998.c
> +
> +diff --git a/libio/Makefile b/libio/Makefile
> +--- a/libio/Makefile
> ++++ b/libio/Makefile
> +@@ -83,6 +83,7 @@ tests =3D \
> +   bug-ungetwc1 \
> +   bug-ungetwc2 \
> +   bug-wfflush \
> ++  bug-wgenops-bz33998 \
> +   bug-wmemstream1 \
> +   bug-wsetpos \
> +   test-fmemopen \
> +diff --git a/libio/bug-wgenops-bz33998.c b/libio/bug-wgenops-bz33998.c
> +new file mode 100644
> +--- /dev/null
> ++++ b/libio/bug-wgenops-bz33998.c
> +@@ -0,0 +1,54 @@
> ++/* Regression test for ungetwc operating on byte stream (BZ #33998)
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
> ++#include "support/temp_file.h"
> ++#include "support/xstdio.h"
> ++#include "support/xunistd.h"
> ++#include <stdlib.h>
> ++#include <unistd.h>
> ++#include <sys/mman.h>
> ++#include <stdio.h>
> ++#include <wchar.h>
> ++#include <support/check.h>
> ++
> ++static int
> ++do_test (void)
> ++{
> ++  char *filename;
> ++  int fd =3D create_temp_file ("tst-bz33998-", &filename);
> ++  TEST_VERIFY (fd !=3D -1);
> ++  xwrite (fd, "A", sizeof ("A")); // write "A\0" by design
> ++  xclose (fd);
> ++
> ++  FILE *fp =3D xfopen (filename, "r+");
> ++  TEST_COMPARE (getwc (fp), L'A');
> ++  /* If the bug is fixed, then ungetwc should not touch byte stream.
> ++     If the bug is not fixed, ungetwc firstly match last read char, L'A=
',
> ++     failed, then the pbackfail branch, matching last read char in byte
> ++     stream, that is, '\0' (initialized when setup wide stream). */
> ++  char *old_read_ptr =3D fp->_IO_read_ptr;
> ++  TEST_COMPARE (ungetwc (L'\0', fp), L'\0');
> ++  TEST_VERIFY (fp->_IO_read_ptr =3D=3D old_read_ptr);
> ++
> ++  xfclose (fp);
> ++  free (filename);
> ++
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> +diff --git a/libio/wgenops.c b/libio/wgenops.c
> +--- a/libio/wgenops.c
> ++++ b/libio/wgenops.c
> +@@ -108,8 +108,8 @@ _IO_wdefault_pbackfail (FILE *fp, wint_t c)
> + {
> +   if (fp->_wide_data->_IO_read_ptr > fp->_wide_data->_IO_read_base
> +       && !_IO_in_backup (fp)
> +-      && (wint_t) fp->_IO_read_ptr[-1] =3D=3D c)
> +-    --fp->_IO_read_ptr;
> ++      && (wint_t) fp->_wide_data->_IO_read_ptr[-1] =3D=3D c)
> ++    --fp->_wide_data->_IO_read_ptr;
> +   else
> +     {
> +       /* Need to handle a filebuf in write mode (switch to read mode). =
FIXME!*/
> +--
> +2.43.0
> diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-
> core/glibc/glibc_2.39.bb
> --- a/meta/recipes-core/glibc/glibc_2.39.bb
> +++ b/meta/recipes-core/glibc/glibc_2.39.bb
> @@ -64,6 +64,7 @@ SRC_URI =3D
> "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
>             file://0029-CVE-2026-6238-0005.patch \
>             file://0030-CVE-2026-6238-0006.patch \
>             file://CVE-2026-5450.patch \
> +           file://CVE-2026-5928.patch \
>  "
>  S =3D "${WORKDIR}/git"
>  B =3D "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.43.0

