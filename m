Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13305.1795504893140732469
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 23:21:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=DcQ998ZB;
 spf=pass (domain: siemens.com, ip: 52.101.83.50, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXRrQEu1UHhT9b59dNzrgCvDhd4ZfEbB9A1qk6kfRlhuBGXPdYDm0LNuxiXro5ZhsC55e6NtQ2ndlCK6YVpMpjKtHbllrEODLYoFMx682DQsIYe5wwocAUOslj1Pl0w5X4jRNS5p1ASw3rnMVlu/GaKnQd4/wuzHRyUqRFNAYN+kcWXoCSErz+V8DvbgxbgpdFOrDiI4GrQT8sAyv3UE2mT18QIwIWiFQhJvTwY7cwkWm2UAl1F8SyIBbCSveiwMhDhPMtJ1i1onvHec5dPQRbquaoTTWGpDP6GVIof3bAu7hLHbyrmjt1vbG4qnaHQdaUE2IBSkNYcK7KdFMDRN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVsa8mM6iMN7WaoFztahRZ0H1Eb86eHmTr9yfjeMGAY=;
 b=YlNXZ1s2Ga3riR9neMHiJ8yRPIy+80zUyIL1V+HkT02NfvJNLZIGsTrCTzYF/ZMiy0uLXl4OwAh3jpgshkFTbeW9ZKg0vuFulNF/hy9zpvGxgcmR8CkLu3dzlgcrCOuuRagtG+JWaICq9Z2YIisDj4dWeqgCumyJ66iN0CdXsiOqSHTQrCXmY/01iOQwPntECGPPRZF1EoDvsVqcIFKdQPP/iDN+Hntnrdh3uWOsCx7bFom7ThjS/fnouNkjVdjFO+ZrAwlc+7DoRz1VscJ4BMaQj9qp+El3pmljXL9kT2oWcajZPqpy4BsF8rH12tL/HrDnT9WRAEQtq317OdE9pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVsa8mM6iMN7WaoFztahRZ0H1Eb86eHmTr9yfjeMGAY=;
 b=DcQ998ZBtGNGxsCIoN1+8DfTxadAiS9Y/h/F2hSBMoXuVJGtLkFeKzwfjWXp5oO5rV/wMHA9vIvLGMZKERP7wLlsFpVltQpkH3jtscFybP0RO2IVxWoke1DBSKr3whUgaW00Jv7KXaD0AT4mpxCg+VDdxnidscSpTXhRIHzAYZezrPr2VrjaL3wSey7fF7mCIYj/FjupIFJLLKj3HBEyO+fCz5jiCOGhjwgZcYWMikUHghi6UZdfsjXTnXRm8J99zuuNkXPMOi0UodMp6kNdKdzYw5jHpaD4QbelQ1+LeHFFVhXb114lZb1yATDfkH56DWL+ipUbfs7Vxx++Oj2sUQ==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DU0PR10MB7590.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:402::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Tue, 24 Nov
 2026 07:21:28 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%6]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 07:21:28 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "yurade@cisco.com" <yurade@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][wrynose][PATCH 1/1] glibc: Fix CVE-2026-121758
Thread-Topic: [OE-core][wrynose][PATCH 1/1] glibc: Fix CVE-2026-121758
Thread-Index: AQHde9wYpxU+zfWgOECe5IVTJ9HhcLc80JwQ
Date: Tue, 24 Nov 2026 07:21:28 +0000
Message-ID: <AS8PR10MB5073E76DEB08FCF83CDC3FBCFD442@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261124062123.4168678-1-yurade@cisco.com>
 <20261124062123.4168678-2-yurade@cisco.com>
In-Reply-To: <20261124062123.4168678-2-yurade@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=fab022ab-3123-4ef3-a47c-6b70df6ede7c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-11-24T07:19:38Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DU0PR10MB7590:EE_
x-ms-office365-filtering-correlation-id: bdebde16-d128-4e3e-8aa6-08df49fb8e56
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|55112099003|22082099003|18002099003|38070700021|260925022911599003|260925021311599003|260925021911599003|56012099006|4143699003|5023799004|11063799006|3023799007|261009223027099003|261102123227099003|261021123027099003|261026140227099003|261026121527099003|261021121427099003|261022113327099003|261022105027099003|261028144727099003|261022075727099003|10067099003;
x-microsoft-antispam-message-info: shn2tqR7GRt3j6qQVRtrf8sAD8OaclewWQT3hohHcOLt5osGGW2JMaCEoLr8VIceFWKlpfg+xK9pSpM86sF6QqvJcGaYQGBD/0Jz+do1wAwSofZH6ZdUUc18mxG+0ZKEFmoj7wMHpHQ4laNRx8BkHVnKSRrsZ2qqBpoEoSupX9b6bPPcfdFWBxqLwDUQFeKPwEhARF0rLvKqpXf6DGc05kKAylnlVIh+HybWiQGByoOaT4f4tXHUhZKmBIznbmN+ENlZbPn4vLrydLud8PKqAD33egBnYxKH//N443cZczhtaux1H5FkjI493jct1XkQiUWzZ4JfeH5d0KZwdnj/y1TMkl+XCqNN1/29c5+DkWFTga0qDY4yZH3RmmUYv2yMzFQ6oCv16pQVwo7t6zp7UpCMeqYX6uDvzBxD1GsptR1q8QyQ12RT2vYNA8gHcp0oS3fMtx6+wKIl4e7Jbb8EQGXRsBKwXcyaxVYh1RPf3+8gwj30JZ76wUMlD4Xui4CzsmoQQvkFK39OB0TXqR/tJT6nVvO2AbOUCq6ysiN9IFWhWMxkcnCfgk7JKEd1e8Fak9VFg99cByTfbi8KEqUUXGkJRWcdjk0IF0j6IES1y524esv6tjAjzGIL7Q+WGZuUtPUN5t6jrEZP5tBq7fKnH5/aZhouVt4nb+yaa1Q1wjY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(55112099003)(22082099003)(18002099003)(38070700021)(260925022911599003)(260925021311599003)(260925021911599003)(56012099006)(4143699003)(5023799004)(11063799006)(3023799007)(261009223027099003)(261102123227099003)(261021123027099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022113327099003)(261022105027099003)(261028144727099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Cl6fsVC8TUgD63hmcBCP1sJezllXXGxFv/GfhdyQNyLIkDFqRKolCl8LT71n?=
 =?us-ascii?Q?KXIC0UpPt890gPoJrFHYg3sXX6pAUw9tmmrcbFF90AZPp0YjA0uh8S2a36Mk?=
 =?us-ascii?Q?/Rh1zzZ7gCtTlSatZZ0B9+0drYwRaVuF6BNKAlaN6eww0DqfEwQoSrLk9Uc1?=
 =?us-ascii?Q?ZSwkGlQYRLHIbflFwxAjxNXVxM4DGnIf7C/J3uVR8EnBUafD/LRlSo7/e5oW?=
 =?us-ascii?Q?UtFrWzIM1yKLaOULreEdCwKT7INOTPKdXa7QTuhroQ6muLplDiz/fht3RIY+?=
 =?us-ascii?Q?6plG1wh+27RFDOoFW3bKQdV9MyrSAtkoz7YRGSQS7VDlzNTdxW1CE8Pq8v11?=
 =?us-ascii?Q?uFvEFElkdipiDd7KYpFlrW/WKF6YydII1sveqN+OqJS8aAQLjatFI5IvBrsj?=
 =?us-ascii?Q?gybu0pW8Ib+SW3f01YmzqwuqSD4Mwq3Gx0+0iG46dfsquw+6nLmXESEWLliq?=
 =?us-ascii?Q?z/9k2RumEiAFQi4UpfKMkwYIGoXOHDRjQC5XV3/g/sSGUilMhGZ+VET7ZMtr?=
 =?us-ascii?Q?+ucQoiG0zFpoJ7KISdsNfNXTPvqoODBIoWcXrDkc8dORbLRkK0i8m/ZpHv1N?=
 =?us-ascii?Q?pa5SECEsYff4D5+WtPSBsrnGigRCjoQ0jBo5LnAVBkmSkLfJXO4QvWWrMkUs?=
 =?us-ascii?Q?qO4FZYy8Hp1bOz1RTapTJKUHPKmZXsTL9uT87uIYr7TBF7IHoisVeDXRVWv6?=
 =?us-ascii?Q?ZJ8C49BfQL+guwVISeo4kZVIiWS0SZ2hqGyb9BAp+P/jZVIpjxh44L0KSyCk?=
 =?us-ascii?Q?mJzUrKfJ8N7zCrYll9EAb3ywZ3UyzUkCYmv+471kfjVX69wimrgwAGE/nNse?=
 =?us-ascii?Q?oKDt/Q7556uxV+EIQMT/noeogFllVlwNxSsJhv1QTjoqps135+ZcJUYLqIdN?=
 =?us-ascii?Q?y3+U9xdQEYv7nqlO4LvfDM2yaRLyxwyLfl5tp+GbQ4CFLpzliqnR2HZI0X2t?=
 =?us-ascii?Q?Ml0kNwr41u5TNX41d/F3ULTT3ROgBclJ3Z1RQrni1YVtuHtFqHDFz0XFRFKO?=
 =?us-ascii?Q?RRw2N2m7zqKrSaNlGuPotFevAhQVvOTsUZV9KbeoQh/YJkZ0opZkBFzxenLu?=
 =?us-ascii?Q?MK/0ija25kbfe9/6xt7mBSP1+EjgBhqvzIZ8uUFSrVsTo0Af9DrRekwU3SWx?=
 =?us-ascii?Q?sxPNk1hrO0K0zJlGkdjst+LnplAoJl2DRvSPHhk6BpeVEMA7VXT2rllj0HGy?=
 =?us-ascii?Q?EZNeh65aRBxcOG379HFvUId760viAt5RbLzdQ6tQm1bs99PHyGcPU3zHqMCF?=
 =?us-ascii?Q?Sk0iVERCp+l1Y4DJmeOXzHiZ3Wjxjxi9x3co0PjS3qBR14T/Py0Xs7Conv/t?=
 =?us-ascii?Q?MK7VzL2giSwxn1KLSHVbp4tnJNCV00G3RchRccub1LhiTpTZD71oOGKhx25Q?=
 =?us-ascii?Q?phq+NPDtx/1wPk5iDhnB2LPXJpJMUn28cGcUdz7ug5vUL1L1ikAwwNLguns7?=
 =?us-ascii?Q?LUkZuXDpLGtGyxINR33zRYCNZ55a3aa+yBfzn3PQHVrIZD4H839/jGRtHU7L?=
 =?us-ascii?Q?zAC1o9sjHZp7CIUWaE8+KdIgd4hoUUykSwzErYhtzR5Waf8ON7iV0rHXbjOb?=
 =?us-ascii?Q?dIbezNkb3UASxjm8/ZyFzXI6jSKgxJHxyktt2Df9tvhiaov7/Aey1CTrn3DA?=
 =?us-ascii?Q?OK8+nP/wbiHW3PM7n98gWdEEEojXBRzMV/FBvGRB6DIWn7r6LnEVIih5nZHb?=
 =?us-ascii?Q?LWilACtc66pyuF4NH7/vrWz4FpQIeaUPk14kxkioyT13Wx9BaA/FjM5dhpx9?=
 =?us-ascii?Q?TYG92XvCXQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bdebde16-d128-4e3e-8aa6-08df49fb8e56
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 07:21:28.2594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mx/J0U6nrfxKlAJ//mV2OfKu1QFBCfz2pF5VX3VhlEudchMHLIv7I8maSa40Qyydbhl0/cCa1TLFPx9m5ANK4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7590
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 07:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250962

Please update git hash instead of backporting patch.
This commit is included in https://sourceware.org/git/?p=3Dglibc.git;a=3Dsh=
ortlog;h=3Drefs/heads/release/2.43/master

Peter

> -----Original Message-----
> From: Yogita Urade -X (yurade - E INFOCHIPS PRIVATE LIMITED at Cisco) via
> openembedded-core <yurade=3Dcisco.com@lists.openembedded.org>
> Sent: Tuesday, November 24, 2026 7:21 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core][wrynose][PATCH 1/1] glibc: Fix CVE-2026-121758
>=20
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>=20
> [1]
> https://repo.or.cz/glibc.git/commit/170ee485fa89b95c3bb7d5606c9812c6c100c=
9b
> e
> [2] https://ubuntu.com/security/CVE-2026-121758
>=20
> Signed-off-by: Yogita Urade <yurade@cisco.com>
> ---
>  .../glibc/glibc/CVE-2026-121758.patch         | 281 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.43.bb         |   1 +
>  2 files changed, 282 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2026-121758.patch
>=20
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2026-121758.patch b/meta/r=
ecipes-
> core/glibc/glibc/CVE-2026-121758.patch
> new file mode 100644
> index 0000000000..6a01b903c5
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2026-121758.patch
> @@ -0,0 +1,281 @@
> +From 170ee485fa89b95c3bb7d5606c9812c6c100c9be Mon Sep 17 00:00:00
> 2001
> +From: JT Wang <skyman-wftw@hotmail.com>
> +Date: Thu, 12 Nov 2026 05:08:42 +0000
> +Subject: [PATCH] iconv: ISO-2022-CN-EXT: fix SO handling without a
> designation (bug 34774)
> +
> +In the FROM loop, the SO (0x0e) handler advances inptr before
> +checking whether an SO designation had been announced.  Without a
> +designation the SO byte is an error, but by the time the error is
> +reported the byte has already been consumed.  Consequences:
> +
> +* With //IGNORE, STANDARD_FROM_LOOP_ERR_HANDLER skips one more
> byte
> +  after the already-consumed SO.  If the SO is the last input byte,
> +  inptr ends up one past inend; the loop condition inptr !=3D inend
> +  then no longer terminates the loop, and the converter keeps
> +  reading past the end of the input buffer and may convert
> +  out-of-bounds bytes into the output, in addition to the
> +  *inbytesleft wraparound described in the report.  This is also
> +  the path taken by iconv -c, which sets the ignore flag for the
> +  conversion.  If the SO is not the last byte, the byte following
> +  it is silently dropped.
> +* Without //IGNORE there is no out-of-bounds access, but iconv()
> +  returns EILSEQ with the SO already consumed, so *inbuf does not
> +  point at the offending byte and the reported remaining length is
> +  one byte short (or exhausted when the SO is the last byte).  A
> +  caller that skips the offending byte on EILSEQ and calls iconv()
> +  again then decrements an already-exhausted length.
> +
> +Move the increment after the error handler: the ignore path skips
> +the SO exactly once, and the non-ignore path leaves the input
> +pointer on the SO byte as POSIX expects.  Sequences with an
> +announced designation are unaffected.
> +
> +Also update the stale comment in that branch, and extend
> +tst-iconv-iso-2022-cn-ext with FROM-direction regressions covering
> +the error paths, a trailing SO with //IGNORE placed next to an
> +inaccessible page, and a designated-SO positive case.
> +
> +CVE: CVE-2026-121758
> +Upstream-Status: Backport
> [https://repo.or.cz/glibc.git/commit/170ee485fa89b95c3bb7d5606c9812c6c100=
c9
> be]
> +
> +Signed-off-by: JT Wang <skyman-wftw@hotmail.com>
> +Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
> +Signed-off-by: Yogita Urade <yurade@cisco.com>
> +---
> + iconvdata/iso-2022-cn-ext.c           |  10 +-
> + iconvdata/tst-iconv-iso-2022-cn-ext.c | 180 ++++++++++++++++++++++++++
> + 2 files changed, 184 insertions(+), 6 deletions(-)
> +
> +diff --git a/iconvdata/iso-2022-cn-ext.c b/iconvdata/iso-2022-cn-ext.c
> +index cce29b19..a8fe5522 100644
> +--- a/iconvdata/iso-2022-cn-ext.c
> ++++ b/iconvdata/iso-2022-cn-ext.c
> +@@ -248,12 +248,9 @@ enum
> +       }									      \
> +     else if (ch =3D=3D SO)							      \
> +       {									      \
> +-	/* Switch to use GB2312, GB12345, CNS 11643 plane 1, or ISO-IR-165,   =
\
> +-	   depending on which S0 designation came last.  The only problem     =
\
> +-	   is what to do with faulty input files where no designator came.    =
\
> +-	   XXX For now I'll default to use GB2312.  If this is not the	      \
> +-	   best behavior (e.g., we should flag an error) let me know.  */     =
\
> +-	++inptr;							      \
> ++	/* Switch to the character set designated last for SO.  A faulty      =
\
> ++	   input file may contain an SO byte without a prior SO               =
\
> ++	   designation; treat such a lone SO as an illegal sequence.  */      =
\
> + 	if ((ann & SO_ann) !=3D 0)					      \
> + 	  switch (ann & SO_ann)
> \
> + 	    {								      \
> +@@ -276,6 +273,7 @@ enum
> + 	  {								      \
> + 	    STANDARD_FROM_LOOP_ERR_HANDLER (1);
> 	      \
> + 	  }								      \
> ++	++inptr;							      \
> + 	continue;							      \
> +       }									      \
> +     else if (ch =3D=3D SI)							      \
> +diff --git a/iconvdata/tst-iconv-iso-2022-cn-ext.c b/iconvdata/tst-iconv=
-iso-2022-
> cn-ext.c
> +index 96a8765f..ff5f22c7 100644
> +--- a/iconvdata/tst-iconv-iso-2022-cn-ext.c
> ++++ b/iconvdata/tst-iconv-iso-2022-cn-ext.c
> +@@ -25,6 +25,7 @@
> +
> + #include <support/xunistd.h>
> + #include <support/check.h>
> ++#include <support/next_to_fault.h>
> + #include <support/support.h>
> +
> + /* The test sets up a two memory page buffer with the second page marke=
d
> +@@ -37,6 +38,177 @@
> +    character sets and may run out of buffer space while doing the
> +    operation.  */
> +
> ++/* FROM-direction regression tests for bug 34774: a lone SO (0x0e)
> ++   without any announced SO designation.  The error paths must leave
> ++   the input pointer on the offending SO byte, and //IGNORE must skip
> ++   it exactly once.  */
> ++
> ++static void
> ++test_lone_so_plain (void)
> ++{
> ++  iconv_t cd =3D iconv_open ("UTF-8", "ISO-2022-CN-EXT");
> ++  TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);
> ++  char in[] =3D { 0x0e };
> ++  char out[8];
> ++  char *ip =3D in, *op =3D out;
> ++  size_t il =3D sizeof in, ol =3D sizeof out;
> ++  errno =3D 0;
> ++  TEST_COMPARE (iconv (cd, &ip, &il, &op, &ol), (size_t) -1);
> ++  TEST_COMPARE (errno, EILSEQ);
> ++  TEST_VERIFY (ip =3D=3D in);
> ++  TEST_COMPARE (il, (size_t) 1);
> ++  TEST_COMPARE (iconv_close (cd), 0);
> ++}
> ++
> ++static void
> ++test_so_after_ascii (void)
> ++{
> ++  iconv_t cd =3D iconv_open ("UTF-8", "ISO-2022-CN-EXT");
> ++  TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);
> ++  char in[] =3D { 'A', 0x0e, 'B' };
> ++  char out[8];
> ++  char *ip =3D in, *op =3D out;
> ++  size_t il =3D sizeof in, ol =3D sizeof out;
> ++  errno =3D 0;
> ++  TEST_COMPARE (iconv (cd, &ip, &il, &op, &ol), (size_t) -1);
> ++  TEST_COMPARE (errno, EILSEQ);
> ++  TEST_VERIFY (ip =3D=3D in + 1);
> ++  TEST_COMPARE (il, (size_t) 2);
> ++  TEST_VERIFY (op =3D=3D out + 1);
> ++  TEST_COMPARE_BLOB (out, op - out, "A", 1);
> ++  TEST_COMPARE (iconv_close (cd), 0);
> ++}
> ++
> ++static void
> ++test_lone_so_ignore (void)
> ++{
> ++  iconv_t cd =3D iconv_open ("UTF-8//IGNORE", "ISO-2022-CN-EXT");
> ++  TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);
> ++  char in[] =3D { 0x0e, 'A', 'B' };
> ++  char out[8];
> ++  char *ip =3D in, *op =3D out;
> ++  size_t il =3D sizeof in, ol =3D sizeof out;
> ++  errno =3D 0;
> ++  /* With //IGNORE the offending SO must be skipped exactly once and th=
e
> ++     following ASCII must be converted.  Note that glibc still reports
> ++     EILSEQ here: the ignore arm of
> STANDARD_FROM_LOOP_ERR_HANDLER does
> ++     not reset result, which stays __GCONV_ILLEGAL_INPUT, and the
> ++     iconv() wrapper maps that status to -1 plus EILSEQ
> ++     unconditionally (iconv/iconv.c).  */
> ++  TEST_COMPARE (iconv (cd, &ip, &il, &op, &ol), (size_t) -1);
> ++  TEST_COMPARE (errno, EILSEQ);
> ++  TEST_VERIFY (ip =3D=3D in + 3);
> ++  TEST_COMPARE (il, (size_t) 0);
> ++  TEST_COMPARE_BLOB (out, op - out, "AB", 2);
> ++  TEST_COMPARE (iconv_close (cd), 0);
> ++}
> ++
> ++static void
> ++test_caller_skip_no_underflow (void)
> ++{
> ++  /* A caller that skips the offending byte on EILSEQ and calls
> ++     iconv() again.  With the fix, the first call reports the SO as
> ++     unconsumed input, so the skip drops the SO itself and the rest of
> ++     the input still converts.  */
> ++  iconv_t cd =3D iconv_open ("UTF-8", "ISO-2022-CN-EXT");
> ++  TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);
> ++  char in[] =3D { 0x0e, 'A' };
> ++  char out[8];
> ++  char *ip =3D in, *op =3D out;
> ++  size_t il =3D sizeof in, ol =3D sizeof out;
> ++  errno =3D 0;
> ++  TEST_COMPARE (iconv (cd, &ip, &il, &op, &ol), (size_t) -1);
> ++  TEST_COMPARE (errno, EILSEQ);
> ++  /* The SO is the offending byte and must still be unconsumed; do not
> ++     run the caller-side skip unless this precondition holds, or the
> ++     test itself would advance past the end of the input.  */
> ++  TEST_VERIFY_EXIT (ip =3D=3D in);
> ++  TEST_VERIFY_EXIT (il =3D=3D 2);
> ++  ++ip;
> ++  --il;
> ++  op =3D out;
> ++  ol =3D sizeof out;
> ++  errno =3D 0;
> ++  TEST_COMPARE (iconv (cd, &ip, &il, &op, &ol), (size_t) 0);
> ++  TEST_COMPARE (il, (size_t) 0);
> ++  TEST_COMPARE ((size_t) (op - out), (size_t) 1);
> ++  TEST_COMPARE_BLOB (out, op - out, "A", 1);
> ++  TEST_COMPARE (iconv_close (cd), 0);
> ++}
> ++
> ++static void
> ++test_lone_so_tail_caller_skip (void)
> ++{
> ++  /* A lone SO at the end of the input.  Before the fix the first call
> ++     consumed the SO and left the remaining length at 0, so a caller
> ++     skipping the offending byte decremented that length to
> ++     (size_t) -1.  */
> ++  iconv_t cd =3D iconv_open ("UTF-8", "ISO-2022-CN-EXT");
> ++  TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);
> ++  char in[] =3D { 'A', 0x0e };
> ++  char out[8];
> ++  char *ip =3D in, *op =3D out;
> ++  size_t il =3D sizeof in, ol =3D sizeof out;
> ++  errno =3D 0;
> ++  TEST_COMPARE (iconv (cd, &ip, &il, &op, &ol), (size_t) -1);
> ++  TEST_COMPARE (errno, EILSEQ);
> ++  TEST_VERIFY_EXIT (ip =3D=3D in + 1);
> ++  TEST_VERIFY_EXIT (il =3D=3D 1);
> ++  ++ip;
> ++  --il;
> ++  op =3D out;
> ++  ol =3D sizeof out;
> ++  errno =3D 0;
> ++  TEST_COMPARE (iconv (cd, &ip, &il, &op, &ol), (size_t) 0);
> ++  TEST_COMPARE (il, (size_t) 0);
> ++  TEST_COMPARE (iconv_close (cd), 0);
> ++}
> ++
> ++static void
> ++test_designated_so (void)
> ++{
> ++  /* Positive case: with an announced designation the SO switches to
> ++     the designated set, consumes exactly one byte, and the following
> ++     7-bit GB2312 pair converts.  ESC $ ) A designates GB2312;
> ++     0x52 0x3b is the 7-bit form of the GB2312 code for U+4E00.  */
> ++  iconv_t cd =3D iconv_open ("UTF-8", "ISO-2022-CN-EXT");
> ++  TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);
> ++  char in[] =3D { 0x1b, '$', ')', 'A', 0x0e, 0x52, 0x3b, 0x0f, 'Z' };
> ++  char out[16];
> ++  char *ip =3D in, *op =3D out;
> ++  size_t il =3D sizeof in, ol =3D sizeof out;
> ++  errno =3D 0;
> ++  TEST_COMPARE (iconv (cd, &ip, &il, &op, &ol), (size_t) 0);
> ++  TEST_COMPARE (il, (size_t) 0);
> ++  TEST_COMPARE ((size_t) (op - out), (size_t) 4);
> ++  TEST_COMPARE_BLOB (out, 4, "\xe4\xb8\x80Z", 4);
> ++  TEST_COMPARE (iconv_close (cd), 0);
> ++}
> ++
> ++static void
> ++test_trailing_so_ignore (void)
> ++{
> ++  /* The shape from bug 34774: a lone SO as the last input byte with
> ++     //IGNORE.  Place the input right before an inaccessible page so
> ++     that a read past the end faults.  */
> ++  struct support_next_to_fault ntf =3D support_next_to_fault_allocate (=
2);
> ++  ntf.buffer[0] =3D 'A';
> ++  ntf.buffer[1] =3D 0x0e;
> ++  iconv_t cd =3D iconv_open ("UTF-8//IGNORE", "ISO-2022-CN-EXT");
> ++  TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);
> ++  char out[8];
> ++  char *ip =3D ntf.buffer, *op =3D out;
> ++  size_t il =3D 2, ol =3D sizeof out;
> ++  errno =3D 0;
> ++  TEST_COMPARE (iconv (cd, &ip, &il, &op, &ol), (size_t) -1);
> ++  TEST_COMPARE (errno, EILSEQ);
> ++  TEST_VERIFY (ip =3D=3D ntf.buffer + 2);
> ++  TEST_COMPARE (il, (size_t) 0);
> ++  TEST_COMPARE_BLOB (out, op - out, "A", 1);
> ++  TEST_COMPARE (iconv_close (cd), 0);
> ++  support_next_to_fault_free (&ntf);
> ++}
> ++
> + static int
> + do_test (void)
> + {
> +@@ -122,6 +294,14 @@ do_test (void)
> +
> +   xmunmap (ntf, ntfsize);
> +
> ++  test_trailing_so_ignore ();
> ++  test_lone_so_plain ();
> ++  test_so_after_ascii ();
> ++  test_lone_so_ignore ();
> ++  test_caller_skip_no_underflow ();
> ++  test_lone_so_tail_caller_skip ();
> ++  test_designated_so ();
> ++
> +   return 0;
> + }
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-
> core/glibc/glibc_2.43.bb
> index 5d2344389f..09e4e0b837 100644
> --- a/meta/recipes-core/glibc/glibc_2.43.bb
> +++ b/meta/recipes-core/glibc/glibc_2.43.bb
> @@ -61,6 +61,7 @@ SRC_URI =3D
> "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
>             file://0020-fix-create-thread-failed-in-unprivileged-process-=
BZ-.patch \
>             file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selft=
est.patch \
>             file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS=
.patch \
> +           file://CVE-2026-121758.patch \
>  "
>  B =3D "${WORKDIR}/build-${TARGET_SYS}"
>=20
> --
> 2.53.0

