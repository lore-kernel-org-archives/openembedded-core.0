Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2448.1792709583221839501
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 15:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=qTHAtRZV;
 spf=pass (domain: siemens.com, ip: 40.107.159.69, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djTIbGDhb5aeJMxhP3izdZkoBlKyQenOuberAfoRtiXzNrHv7o9bUwdkDWxzvGbw1jXMcJlNR5pXEX2gfJHGfiXP5XLZ3yANrvbGarGiPhYMG+DMKDnenFN1twA5VljdlqYukOQm0mD5uaIpMCpscs36IqG024sKAGl21jd0Yt8Kl8Oq7LL5KfVUnPQYhLbLbuXKFzNhyS1vu/RgAzMlx6BT/T9ITWTCAUHE9m0xcsEviORcSpi+QxQ+YIeremmp9y5AntBHvIVUTlEzgNnRUNPIL7rJq1u1Z3jNvBzvxUsktgazxoFVNijw9+RfycJcQFK53vT8lSxZY5bnutri8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJD6IIXK31DTdNIMvGjO9MIDQT0C2V5k31bPfuX8Plc=;
 b=HbeEfJvA9ereDAlu4XvjUoJ8thNFzlttiZNdWwrA0nQhOdeftLblZoc6twmkujCyxQNOKU0TDGgWKI8QmcTiKu6XQxQoXGgQAh+lJt2Jb7i2GWSuLOFKi4H2lcGaraWqDfDKqU8dYAX7M8f31jJlmHABqC5ZvJIM00irEhWSTwf8itrXdOyK9RyUIEdFCCILGykc2bFqSSFuhcozJM5v3Z+004fDLRxNxR6rWjMpuqV+K1iMpjFKn5NX2nJ/pgQ2qIb32sLQpxDQQno0zxmqC8rw29q4FcWE+TF+8uyiXGJkhzMCgBD+MldGjDQ+h0cG+29sSpsCC0YCxJRPbx/LFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJD6IIXK31DTdNIMvGjO9MIDQT0C2V5k31bPfuX8Plc=;
 b=qTHAtRZVypmchhoRx2JEKjWYXpmdH/v2wA4PTHWY4NberTswiTk6h8VKMxeh5uu7hQgeoXWY65kOUxH5eb2NI7MhNNdDGBpp1ecbd/K7gLDXCcExG27+i36bY7G0BbmlJgHOYeU7aAvMvapicsrx4PvhpfpfrhYxYyjJWFW3SVHETCxCDjUc/O7o8gxXMM5ZRac9a+60N6jHs8Y92AhCturwL37FRUH46NULDrMmI8wEgGLzFJgYEeERb1zILqU8yFLzGOqQXjUTBjQWBzLsdE+x2I3CKSl6bWWLnOwN5gC8vDkueR+6MpifPNpOUAiZ5h+UTTJpoagswuoKYwrckw==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by PA4PR10MB5586.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:260::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 22:52:58 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%6]) with mapi id 15.21.0569.000; Thu, 22 Oct 2026
 22:52:57 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [scarthgap][PATCH 10/15] glibc: patch CVE-2026-18374
Thread-Topic: [scarthgap][PATCH 10/15] glibc: patch CVE-2026-18374
Thread-Index: AQHdYnfkncW7TlSY10+us22xoyyp47cKKwcw
Date: Thu, 22 Oct 2026 22:52:57 +0000
Message-ID: <AS8PR10MB507382EED86076A7FABB36E4FD652@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261022225120.3784827-1-peter.marko@siemens.com>
In-Reply-To: <20261022225120.3784827-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ee481a5b-94ed-48a3-b710-11000e9a8dc5;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-10-22T22:52:15Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|PA4PR10MB5586:EE_
x-ms-office365-filtering-correlation-id: 21a27970-39d8-4ba6-2483-08df308f3731
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|55112099003|261021130227099003|261021121427099003|22082099003|18002099003|261022115727099003|261022113327099003|10067099003|261021135927099003|261021123027099003|38070700021|260925022911599003|260925021311599003|261009223327099003|11063799006|260925021911599003|261009221727099003|261009223027099003|5023799004|261021133027099003|261009221227099003|261009220027099003|261022105027099003|56012099006|261022075727099003;
x-microsoft-antispam-message-info: oFFd+LGyL0PmAQRNyx+rr4v8ZsBElvyRLo4tvZGTkKNMToYowDGNvx3vMEwAOWkPAijM9fDpNMKa8ofV/B2KME3U19ducEqNXkKPR0lFVoMYe/8CeZY5rAQILaUbYDNowf/pUJDUBuHFm2Mi+/0FsVhbKPwcLF0tsSd/MlAm2hH+76NLXZ1nSEmN5Mf/g9f20LGGmG4JOgtumPmAActK/tX1Ed5TnN1As63kwLgV8GQ9cc7Zmet652lgbm8JNO5y8RC1o0NHy9dnCKA1UddM03HVilyO5mnq5Mdh4oSLh1zdLyURo2sTjPmUufc8Pca7tiZrH908g9b/0KxSIP1ORuG4xj+wSPb+Uz+r+4lhYKHbOADOqB6caawH2AMUAoOzCZCi8VH66TOtL7qtWGVncqO2K7vIG/JTYsYWK8Mpy8enqlU2lZ2X2JJeeGehh5IxBxgTKm31acQlf73TChZfyCGzEWRhXs7YLkFxiS7Ot3RoBwGskBdMMNrRy6r6JAtkeolsVDB9MAqpJNoHSKZiNwBzCsBAk4gV78pCNchpNMguzrJmoKVC0A4XpgV59JLvVCdUhOczfMQFvk6IBq+izwo1g4Az3cTsD9OzH+xAmagaJa5clhZxh/RYqjxf/IjAU4yBdUUESlP0IUtuSAtMXyEPQ8RFNK/qqU4TBqWd138=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(55112099003)(261021130227099003)(261021121427099003)(22082099003)(18002099003)(261022115727099003)(261022113327099003)(10067099003)(261021135927099003)(261021123027099003)(38070700021)(260925022911599003)(260925021311599003)(261009223327099003)(11063799006)(260925021911599003)(261009221727099003)(261009223027099003)(5023799004)(261021133027099003)(261009221227099003)(261009220027099003)(261022105027099003)(56012099006)(261022075727099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Scbu83CxcCx+kpBZFv5FQ4ybylxtoPmCpveqUMWVPhCStXg5+7RCtPd0ODzE?=
 =?us-ascii?Q?aOrDa859fFKXegMZMQwtgs2Q7Js3pZMkpmt/PB2kru/XRRV3ZveJLpwqWV1g?=
 =?us-ascii?Q?Q0K5mdWk+l51PSnAKbicmLGtWI7BCgR7r+5vwuFVMGvNHNaPwzHIE0FkvKab?=
 =?us-ascii?Q?M7HAhww4wtQ7ETZ4IWi0iep7uWVhNpvF7YC3TgDUkqjw7qLvYv6gmCleHE76?=
 =?us-ascii?Q?LwkTLXMXVQUwgY3IKwHqqN7onmrgWqqkFbkXETXi+JqAGMXkknOH0XvvNNyZ?=
 =?us-ascii?Q?TCYFhuLtwou0tBSkQm8+RgH+8mDgF9XQqfUCB69hDVhFasl2UtymNSjLJqyt?=
 =?us-ascii?Q?jy7nJb160goTiYwsS7g7IMdz0SBBM9aYaGtmjioG+ZZDPRS2irh9q37HhtdX?=
 =?us-ascii?Q?zgLMRR/SQ0i9SzVpmfZtA5MwDiqOwbvIjCgwrhA9Y4tTnEmz1vPxEHcG2dZp?=
 =?us-ascii?Q?MuPJp/T530cXr7A8ipiRrIUUYXL2/u3SWKdnk/2Gw8meXKpCEkq349P+io3z?=
 =?us-ascii?Q?JJJffmmoLQV0Zo4sWS220WhvmbBqC7pNkaNp/r6c4ZXn32NNaJI6jMBLUo6Y?=
 =?us-ascii?Q?eS4nNe0Is7rU0rlyO5J3XQXjHrn+3G2YxVXc7UqhQElbEBKURkHWK+7bve2E?=
 =?us-ascii?Q?dHDKg5ChmkqgksMMFxfFFQVUXxpQXxNXikqZ9DhMyUj9qmqcz9DeHm6PFjaG?=
 =?us-ascii?Q?5eeUkZ3u3lqo4xKTbCGHe8voMWFqRtME6WRujGq9r5mlrALMd+rlAIy3o0oE?=
 =?us-ascii?Q?diQIf4ZcGmeg3zFpum2gIQ4jXppmOdfLL0a4nswY9gT7pVoCDWo+6bHt67It?=
 =?us-ascii?Q?2rW6yXvZaxW55+xBYKjZJUFQcGaR0jlSL8oNMQFxib3LfolDRHCEXARL7ITS?=
 =?us-ascii?Q?EkQJX1P73eRrwZgartcQ2r0IMUQT/Iwwok00idmoHoaKoeIt/vzk5+J3TJP9?=
 =?us-ascii?Q?vQHdS8z4RZzJqOMOxBOe01My7ihHFjd5bglmhK+0grIhD1SXPlVv1NEbQw2J?=
 =?us-ascii?Q?xat538P0eMm7Y49141bvYYo4l3WfytMaOMhb4KW2S0uXCVl6nclWAV5p5qnH?=
 =?us-ascii?Q?A3EImtWtbvIbkNdZYH2NIulPsVrMN5leyw2Dq9UQancLMfQim+NZNOFwWSC4?=
 =?us-ascii?Q?LGlyhNq6M/MeXbBiiVEJTz+yWOqmpw8jW492SFBmNvZYaP3I5yJQ+CfknXOB?=
 =?us-ascii?Q?npE5QbexqZGoJJ8B1Ep6fVgFj+a/S9/Tv91KB0T18ZV2LX0SHZxg/mlvHPYc?=
 =?us-ascii?Q?lIkJaaz1YhDvs7sPWwIiCAd1XrQVvHA+zE1F3W9lNOnYhXCS4MbOOlgB4ogK?=
 =?us-ascii?Q?c55Z7yYDbHWDR9AS/0bg3SL3sPU9sXyNYd8XO+4FurIK0VXWat9i0xK1hFk4?=
 =?us-ascii?Q?o42SjHb7o4rey10gbInvUVSzW/uA+WqQaHSNgRR+qPb8wUpoerZzK55Jk8SI?=
 =?us-ascii?Q?wW2rHwf7cGJSgdhRqGrQws08np2CK8hagZYNzB4aXXrn2/IQUvrlx1/5MTAZ?=
 =?us-ascii?Q?ATr5Bo5o4NzLd3zIC5dgbY5SJTrOT8YebT5It0u/zMkr6XzNJcPAF0yPKWAV?=
 =?us-ascii?Q?qx73Z20DgnYQU3uSQcQ0rvMtq3vRCmvaILkC8jkFIABnyPJ1qO5qdd+gU5z6?=
 =?us-ascii?Q?wUHHBLP0QI9Az8foXg2yTlQYLNX2nu1y2Mii6QMzSx2jEjXYnXM6VqWwdeYi?=
 =?us-ascii?Q?2/loQ5T+2NwmdTAYywZBM0yLeZuxG8RjXTaLu/ZvfqkrKvnKVIybm3nmk9YY?=
 =?us-ascii?Q?UX5KbhaL9Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a27970-39d8-4ba6-2483-08df308f3731
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 22:52:57.3744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HkIPkNAOgnBtSs9t3UXKOkjs9zwBP4BSttZQWCgYeoHNNEdeXNA8sK3JIouCPn/nvLsUaYcb603Os/qqoZU8kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5586
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 22:53:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248472

This is a resend as I got 500 from the server when sending the whole series=
...

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Friday, October 23, 2026 12:51 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [scarthgap][PATCH 10/15] glibc: patch CVE-2026-18374
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Pick patches referencing this CVE from 3.41 branch (oldest release
> still receiving security updates).
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../glibc/glibc/0040-CVE-2026-18374-01.patch  |  53 +++++++++
>  .../glibc/glibc/0041-CVE-2026-18374-02.patch  | 103 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.39.bb         |   2 +
>  3 files changed, 158 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0040-CVE-2026-18374-01.=
patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0041-CVE-2026-18374-02.=
patch
>=20
> diff --git a/meta/recipes-core/glibc/glibc/0040-CVE-2026-18374-01.patch
> b/meta/recipes-core/glibc/glibc/0040-CVE-2026-18374-01.patch
> new file mode 100644
> index 00000000000..a5a71473ab2
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0040-CVE-2026-18374-01.patch
> @@ -0,0 +1,53 @@
> +From f806c45178dbca3be08a25cc5dd6d5542ce84a59 Mon Sep 17 00:00:00 2001
> +From: Dongkyun Son <dongkyun.s@samsung.com>
> +Date: Fri, 4 Sep 2026 21:28:41 +0900
> +Subject: [PATCH] libio: Fix CVE-2026-18374 heap buffer overflow in ccs=
=3D
> + handling
> +
> +When fopen() is called with a ,ccs=3D parameter whose value becomes empt=
y
> +after strip(), the code must reject it with EINVAL instead of attempting
> +to use it.  The original upstr() fallback could read past the ',' delimi=
ter
> +and cause a heap buffer overflow.
> +
> +The fix checks if the charset specification is empty after strip() and
> +returns EINVAL immediately, preventing the overflow and following the
> +approach described in BZ #34574.
> +
> +CVE-2026-18374 - CVSS 4.9 (AV:L/AC:H/PR:N/UI:N/S:U/C:L/I:L/A:L)
> +
> +Reported-by: AISLE in partnership with Red Hat
> +Signed-off-by: Dongkyun Son <dongkyun.s@samsung.com>
> +Reviewed-by: Florian Weimer <fweimer@redhat.com>
> +(cherry picked from commit 9765a538ebf8661a6e5578e01e35a3dd30db7eb4)
> +
> +CVE: CVE-2026-18374
> +Upstream-Status: Backport
> [https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Df806c45178dbca3=
be08a25cc5dd
> 6d5542ce84a59]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + libio/fileops.c | 12 +++++++-----
> + 1 file changed, 7 insertions(+), 5 deletions(-)
> +
> +diff --git a/libio/fileops.c b/libio/fileops.c
> +index 775999deb3..18efe8e0c0 100644
> +--- a/libio/fileops.c
> ++++ b/libio/fileops.c
> +@@ -305,12 +305,14 @@ _IO_new_file_fopen (FILE *fp, const char *filename=
,
> const char *mode,
> + 	  *((char *) __mempcpy (ccs, cs + 5, endp - (cs + 5))) =3D '\0';
> + 	  strip (ccs, ccs);
> +
> +-	  if (__wcsmbs_named_conv (&fcts, ccs[2] =3D=3D '\0'
> +-				   ? upstr (ccs, cs + 5) : ccs) !=3D 0)
> ++	  /* After stripping, ccs[2] =3D=3D '\0' means the charset name is emp=
ty.
> ++	     This is not a valid charset and would cause problems downstream.
> ++	     Reject it with EINVAL (BZ #34574, CVE-2026-18374).  */
> ++	  if (ccs[2] =3D=3D '\0' || __wcsmbs_named_conv (&fcts, ccs) !=3D 0)
> + 	    {
> +-	      /* Something went wrong, we cannot load the conversion modules.
> +-		 This means we cannot proceed since the user explicitly asked
> +-		 for these.  */
> ++	      /* Either the charset name is empty after strip(), or conversion
> ++		 modules cannot be loaded.  This means we cannot proceed since
> ++		 the user explicitly asked for character conversion.  */
> + 	      (void) _IO_file_close_it (fp);
> + 	      free (ccs);
> + 	      __set_errno (EINVAL);
> diff --git a/meta/recipes-core/glibc/glibc/0041-CVE-2026-18374-02.patch
> b/meta/recipes-core/glibc/glibc/0041-CVE-2026-18374-02.patch
> new file mode 100644
> index 00000000000..d653d545f51
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0041-CVE-2026-18374-02.patch
> @@ -0,0 +1,103 @@
> +From 5dd252cf1d113644b3679f5a158e9ef20217865e Mon Sep 17 00:00:00 2001
> +From: Shamil Abdulaev <ashamil435@gmail.com>
> +Date: Thu, 3 Sep 2026 20:19:42 +0300
> +Subject: [PATCH] libio: Add test for fopen with an empty ", ccs=3D" valu=
e [BZ
> + #34574]
> +
> +This goes on top of the fix for CVE-2026-18374.  The test runs the
> +reproducer from the bug report, plus "w,ccs=3D" and "w,ccs=3D,", and
> +expects NULL with errno set to EINVAL.
> +
> +Signed-off-by: Shamil Abdulaev <ashamil435@gmail.com>
> +Reviewed-by: Florian Weimer <fweimer@redhat.com>
> +(cherry picked from commit cca93e5d88d3d4ed073c03100467696f652269e7)
> +
> +CVE: CVE-2026-18374
> +Upstream-Status: Backport
> [https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D5dd252cf1d11364=
4b3679f5a158e
> 9ef20217865e]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + libio/Makefile              |  1 +
> + libio/tst-fopen-ccs-empty.c | 62 +++++++++++++++++++++++++++++++++++++
> + 2 files changed, 63 insertions(+)
> + create mode 100644 libio/tst-fopen-ccs-empty.c
> +
> +diff --git a/libio/Makefile b/libio/Makefile
> +index 43ee8db06d..5b9929c3de 100644
> +--- a/libio/Makefile
> ++++ b/libio/Makefile
> +@@ -99,6 +99,7 @@ tests =3D \
> +   tst-fgetc-after-eof \
> +   tst-fgetwc \
> +   tst-fgetws \
> ++  tst-fopen-ccs-empty \
> +   tst-fopenloc2 \
> +   tst-fputws \
> +   tst-freopen \
> +diff --git a/libio/tst-fopen-ccs-empty.c b/libio/tst-fopen-ccs-empty.c
> +new file mode 100644
> +index 0000000000..64723965e1
> +--- /dev/null
> ++++ b/libio/tst-fopen-ccs-empty.c
> +@@ -0,0 +1,62 @@
> ++/* Test fopen with an empty ",ccs=3D" value in the mode string (bug 345=
74).
> ++   Copyright (C) 2026 Free Software Foundation, Inc.
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
> ++#include <errno.h>
> ++#include <stdio.h>
> ++#include <stdlib.h>
> ++#include <string.h>
> ++#include <support/check.h>
> ++#include <support/support.h>
> ++#include <support/temp_file.h>
> ++#include <support/xunistd.h>
> ++
> ++static void
> ++check_fopen_fails (const char *path, const char *mode)
> ++{
> ++  errno =3D 0;
> ++  FILE *fp =3D fopen (path, mode);
> ++  TEST_VERIFY (fp =3D=3D NULL);
> ++  TEST_COMPARE (errno, EINVAL);
> ++  if (fp !=3D NULL)
> ++    fclose (fp);
> ++}
> ++
> ++static int
> ++do_test (void)
> ++{
> ++  char *path;
> ++  xclose (create_temp_file ("tst-fopen-ccs-empty", &path));
> ++
> ++  /* The value is blank and the mode string continues well past it.  */
> ++  enum { size =3D 1024 * 1024 };
> ++  char *mode =3D xmalloc (size);
> ++  memset (mode, 'X', size);
> ++  mode[size - 1] =3D '\0';
> ++  static const char prefix[] =3D "w,ccs=3D                     ,";
> ++  memcpy (mode, prefix, sizeof (prefix) - 1);
> ++  check_fopen_fails (path, mode);
> ++  free (mode);
> ++
> ++  check_fopen_fails (path, "w,ccs=3D");
> ++  check_fopen_fails (path, "w,ccs=3D,");
> ++
> ++  free (path);
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-
> core/glibc/glibc_2.39.bb
> index 144ce36ccc2..3e95792b359 100644
> --- a/meta/recipes-core/glibc/glibc_2.39.bb
> +++ b/meta/recipes-core/glibc/glibc_2.39.bb
> @@ -72,6 +72,8 @@ SRC_URI =3D
> "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc \
>             file://0037-CVE-2026-77117.patch \
>             file://0038-CVE-2026-80489.patch \
>             file://0039-CVE-2026-77117-CVE-2026-80489.patch \
> +           file://0040-CVE-2026-18374-01.patch \
> +           file://0041-CVE-2026-18374-02.patch \
>  "
>  S =3D "${WORKDIR}/git"
>  B =3D "${WORKDIR}/build-${TARGET_SYS}"
