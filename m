Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.45])
 by mx.groups.io with SMTP id smtpd.web09.6339.1610014049788723828
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 02:07:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=rLUhKSjB;
 spf=pass (domain: kpit.com, ip: 40.107.138.45, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f19B12TNFdolxoGTwJSJcBmTIUb4j/oNGM3yR04W13PnYyq6i3s4UzqJ/5NuXP5PBRCRGf+mhr6G8iCz3MBGJ92388fFM3fYv7GEiswXzAW2mEqXmebOx0uX8ykkAXTfvMQKjMoUhmTKqMBDZdWyODOLA2nrzPQthlXD8jD8HaS2Kv4mRhP/mieIwgQBXAa9w0KPvbqqilrTstpuNou7jwpzyWnF92eMas66SSazFmlZxTs25bzW1/V2MRWbmpxTh3186pQo6q35Cc0OEj8+VLHP278c1T9Yz+Jy2CNrFHSu0240lCle6kmOjKMNcRtQ6J80ApNgogZAK2gI9Ul+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGN+Lz92nP7reVrZWtwVRKg3eRo2AtGmhGmaO1njQg0=;
 b=arMEd4cz/ue2c4iRpBUr0BcdXz0Gk9niR1b7lwgjVQ5EYtSy5P0OWFimtXpMfM25xPunAbc416cNfSlc2Asf58/zaw4fxMjJSif/vTa3mpRYqK+UCMDtbyTw4+g4IBwF4AAdMwj6IfK3SofFfj3tCc9u/AKY6TlKyxnFEDYjt/g9i/6j41cdJsjTJPPyxJoHTFDEVeKDAZM5TBYhQWTN5yM7XDhX4QkRyMox9nBIeqO3Xe2gY0+HW8S2bU3Z6E4XD5iZHsJNi2RMg2BpSugGkbYxB5HRFiNF9bTtTm/nerFLSZiDFt1+TWXspzPsKdvzUKzmuZtpGcpsMDKARhUz0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGN+Lz92nP7reVrZWtwVRKg3eRo2AtGmhGmaO1njQg0=;
 b=rLUhKSjB4CHmgMuq1tXUWVauaKiurKM9D3f73u2cLa9kSrnrC7QkdYulNvZgdSObmyI+bMUUsUD1prOX8ll47o7eJqAxa1uz35c2SoXB5c5BZGzz7LYzCMmbsHigIr4cuSiVVTsYnzxgAbcdehpuyeuKi0QTstRLrlU/z23H4to=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:79::22)
 by MAXPR01MB4030.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:6f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 10:07:24 +0000
Received: from MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c0c3:d811:3987:df57]) by MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c0c3:d811:3987:df57%5]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 10:07:24 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Aditya.Tayade@kpit.com,
	Harpritkaur.Bhandari@kpit.com
Subject: [poky][sumo][PATCH 3/4] libsndfile1: update security patches
Date: Thu,  7 Jan 2021 15:37:01 +0530
Message-Id: <20210107100701.10285-1-sanak@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [2401:4900:5194:2007:f9cf:4c7f:ce96:878]
X-ClientProxiedBy: BM1PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::14) To MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:79::22)
Return-Path: sanak@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2401:4900:5194:2007:f9cf:4c7f:ce96:878) by BM1PR01CA0144.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:68::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 10:07:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cfd925ff-490d-4ad9-00d6-08d8b2f40781
X-MS-TrafficTypeDiagnostic: MAXPR01MB4030:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<MAXPR01MB40308CEB9BFC96F629178CEC99AF0@MAXPR01MB4030.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kVI3KpClU8B0UF4qwvtzw5xDjceEawIamLVXQz4cLFar3uOppcsFvzmuiGtkbnyfaLnHA3ddf0iAZfmMgDem1N0/V86iPmk09KdAwV15wLjCspzwI2qV4vM2g9qTZf4b/HCJPZ6EBfxEi99LoIweKDs3x0DFz15LlaJAWKcB/sKmmssymRASe8LG+oQXg8A9GALpG+c/jl4lVzqWh03G327oH7FHyny5bisrZ+u5aa92gb/jP580yE+ziN+Ad65n8eKeeS3usBaCB53yfto8HtA0AiwwtCcpBZWyPfydrPD4a33+yUABTnInoRhVG0Akc35ZeN7YrMOQnggfESF3Ax5u/0yZkaL6v5Vl1GbRaMtxwayHcUtGdoCpW7fBekLrqJna1NaBmjzdlxNC/MDQUNbC3Bur4VPlQh877SJHLs1LgYvOtfjIycAx8/AVbLxQbKoKZ0XmB6DB9KXs93bZurbLvF7ewlF4xgIT1i99/MomGlAgYnbXwqn8fkc6dW2ndX3gw+IsrphNfiRdMjvT5w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(366004)(39850400004)(346002)(107886003)(66556008)(5660300002)(66946007)(66476007)(2906002)(15650500001)(30864003)(4326008)(2616005)(186003)(36756003)(6506007)(16526019)(6666004)(316002)(52116002)(1076003)(478600001)(8676002)(8936002)(966005)(69590400011)(66574015)(83380400001)(6512007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?yMpthg9egaYG4wVNYrIRhW7p9aprwvHGiS67bl6zJdOWvSpY0P6VEVdYZonc?=
 =?us-ascii?Q?61usnWhtDSUG2NCbGjZrUUtJOL1nIcYLnXx3IM95ILRw0vnsqu9Rj//FmA6M?=
 =?us-ascii?Q?h0YpeAG+OFdqy90C5uRbkTL7AB110RX4fIw8UhNBALB9/d6xmygBBF9+BtX/?=
 =?us-ascii?Q?nc5aly2JqgvP/U7JA+sdq1BL90XBGMFc0XhaBTeF1ars0KmLE3YLyDCQcliy?=
 =?us-ascii?Q?FgZpFOA8dQ9Ci9P5+Qa3paIF15vN6lE9waT7RnUFBfiSNCXpIJW3cCsrfdtL?=
 =?us-ascii?Q?mI18TY4OwjDMLGs2nBcS0Bik62fZBxPgvHRC/c6fq+YvsDGgt5UA/DvZ/KLu?=
 =?us-ascii?Q?1gusTu41oRVxhxHbTmXdG/pY1Aa3nzvHGe/e6ylj7WZc03cYWc47k8atQyBO?=
 =?us-ascii?Q?VqnRmg2vJXg29zeH01R/Fv6CKRONBqF42ovDDq5YVj9HbhTD9zXtQdNgY70q?=
 =?us-ascii?Q?WsdN21F0rrwApFeF4VupBqqR5gDNVUia+F1WB0F5qbtf4CoRos1eej8oIo0m?=
 =?us-ascii?Q?oeR/qobAuq9+byTDcqqBRMFr2ksC5fH+9ZjDJHi0ytJvqHHyYrSPfbAbTraf?=
 =?us-ascii?Q?8CRo8BN1Zv3F5izeeGwHoQyu5Vq0e+zGvFOjj+UrRahxC8kIyWE80N76fljZ?=
 =?us-ascii?Q?G76Md6nZv8tuBaXzDa+peQviI+YWy8s6pwU4h1SvgFhYNCcz6dP08ujhvjht?=
 =?us-ascii?Q?+LrgRw9J6HDhEiJjubg3OWpPeR7CuAg9KqURU5g3hANxiAElt4FgWGvuVMI5?=
 =?us-ascii?Q?7JVDByRQ/ARqd3wM6TBWSlc6WPNrx7etEM0TcbIPe4T9PegXyv0NQNhGCc+/?=
 =?us-ascii?Q?BJbzLoRRxPcbVXeyXEtgkV0ZmAvqZY69lj7yiuMUDYeuvFlgA0S5E4De6LWA?=
 =?us-ascii?Q?Ms3E00lSM/gY6UppxUfqKC2SCxmp2aTiTBG44G+lYzz9lfoTG2qgb5fTCOjW?=
 =?us-ascii?Q?f6YB1WZjdirnwASUPwcvTtCEqURr6yHWov4Bti/ZdPbsOLEJAsy7k5YFu2e2?=
 =?us-ascii?Q?nIjioO2x1Ogwd7xZH8kIYqtTWjrshR3maTsXORCoJyyjHm2SAG3e38s3S4eU?=
 =?us-ascii?Q?A/bnLx9/?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3228.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 10:07:23.4198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd925ff-490d-4ad9-00d6-08d8b2f40781
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQNOEWuWtHy6pBYN0fouTNGNlxsfGDX+KOuxqWdplhvznrqfcnjdSngrKyy+hQ8k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB4030
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@intel.com>

Remove CVE-2017-14245-14246.patch, fix rejected upstream as it doesn't solv=
e the
underlying issue.

Instead 0001-a-ulaw-fix-multiple-buffer-overflows-432 also solves CVE-2017-=
14245
and CVE-2017-14246 properly.

Add patches for CVE-2017-12562 and CVE-2018-19758.

Refresh CVE-2018-13139.patch.

(From OE-Core rev: a5625df8031985e9c60c34068a4a01c36da40eec)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 ...aw-fix-multiple-buffer-overflows-432.patch | 107 ++++++++++++++++
 .../libsndfile1/CVE-2017-12562.patch          |  96 ++++++++++++++
 .../libsndfile1/CVE-2017-14245-14246.patch    | 121 ------------------
 .../libsndfile1/CVE-2018-13139.patch          |  30 +++--
 .../libsndfile1/CVE-2018-19758.patch          |  34 +++++
 .../libsndfile/libsndfile1_1.0.28.bb          |   5 +-
 6 files changed, 257 insertions(+), 136 deletions(-)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/0001-a-u=
law-fix-multiple-buffer-overflows-432.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017=
-12562.patch
 delete mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017=
-14245-14246.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018=
-19758.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/0001-a-ulaw-fix=
-multiple-buffer-overflows-432.patch b/meta/recipes-multimedia/libsndfile/l=
ibsndfile1/0001-a-ulaw-fix-multiple-buffer-overflows-432.patch
new file mode 100644
index 0000000000..a4679cef2a
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/0001-a-ulaw-fix-multip=
le-buffer-overflows-432.patch
@@ -0,0 +1,107 @@
+This patch fixes #429 (CVE-2018-19661 CVE-2018-19662) and #344 (CVE-2017-1=
7456
+CVE-2017-17457). As per
+https://github.com/erikd/libsndfile/issues/344#issuecomment-448504425 it a=
lso
+fixes #317 (CVE-2017-14245 CVE-2017-14246).
+
+CVE: CVE-2017-14245 CVE-2017-14246
+CVE: CVE-2017-17456 CVE-2017-17457
+CVE: CVE-2018-19661 CVE-2018-19662
+
+Upstream-Status: Backport [8ddc442d539ca775d80cdbc7af17a718634a743f]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 39453899fe1bb39b2e041fdf51a85aecd177e9c7 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 7 Jan 2019 15:55:03 +0800
+Subject: [PATCH] a/ulaw: fix multiple buffer overflows (#432)
+
+i2ulaw_array() and i2alaw_array() fail to handle ptr [count] =3D INT_MIN
+properly, leading to buffer underflow. INT_MIN is a special value
+since - INT_MIN cannot be represented as int.
+
+In this case round - INT_MIN to INT_MAX and proceed as usual.
+
+f2ulaw_array() and f2alaw_array() fail to handle ptr [count] =3D NaN
+properly, leading to null pointer dereference.
+
+In this case, arbitrarily set the buffer value to 0.
+
+This commit fixes #429 (CVE-2018-19661 and CVE-2018-19662) and
+fixes #344 (CVE-2017-17456 and CVE-2017-17457).
+
+---
+ src/alaw.c | 9 +++++++--
+ src/ulaw.c | 9 +++++++--
+ 2 files changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/src/alaw.c b/src/alaw.c
+index 063fd1a..4220224 100644
+--- a/src/alaw.c
++++ b/src/alaw.c
+@@ -19,6 +19,7 @@
+ #include      "sfconfig.h"
+
+ #include      <math.h>
++#include      <limits.h>
+
+ #include      "sndfile.h"
+ #include      "common.h"
+@@ -326,7 +327,9 @@ s2alaw_array (const short *ptr, int count, unsigned ch=
ar *buffer)
+ static inline void
+ i2alaw_array (const int *ptr, int count, unsigned char *buffer)
+ {     while (--count >=3D 0)
+-      {       if (ptr [count] >=3D 0)
++      {       if (ptr [count] =3D=3D INT_MIN)
++                      buffer [count] =3D alaw_encode [INT_MAX >> (16 + 4)=
] ;
++              else if (ptr [count] >=3D 0)
+                       buffer [count] =3D alaw_encode [ptr [count] >> (16 =
+ 4)] ;
+               else
+                       buffer [count] =3D 0x7F & alaw_encode [- ptr [count=
] >> (16 + 4)] ;
+@@ -346,7 +349,9 @@ f2alaw_array (const float *ptr, int count, unsigned ch=
ar *buffer, float normfact
+ static inline void
+ d2alaw_array (const double *ptr, int count, unsigned char *buffer, double=
 normfact)
+ {     while (--count >=3D 0)
+-      {       if (ptr [count] >=3D 0)
++      {       if (!isfinite (ptr [count]))
++                      buffer [count] =3D 0 ;
++              else if (ptr [count] >=3D 0)
+                       buffer [count] =3D alaw_encode [lrint (normfact * p=
tr [count])] ;
+               else
+                       buffer [count] =3D 0x7F & alaw_encode [- lrint (nor=
mfact * ptr [count])] ;
+diff --git a/src/ulaw.c b/src/ulaw.c
+index e50b4cb..b6070ad 100644
+--- a/src/ulaw.c
++++ b/src/ulaw.c
+@@ -19,6 +19,7 @@
+ #include      "sfconfig.h"
+
+ #include      <math.h>
++#include      <limits.h>
+
+ #include      "sndfile.h"
+ #include      "common.h"
+@@ -827,7 +828,9 @@ s2ulaw_array (const short *ptr, int count, unsigned ch=
ar *buffer)
+ static inline void
+ i2ulaw_array (const int *ptr, int count, unsigned char *buffer)
+ {     while (--count >=3D 0)
+-      {       if (ptr [count] >=3D 0)
++      {       if (ptr [count] =3D=3D INT_MIN)
++                      buffer [count] =3D ulaw_encode [INT_MAX >> (16 + 2)=
] ;
++              else if (ptr [count] >=3D 0)
+                       buffer [count] =3D ulaw_encode [ptr [count] >> (16 =
+ 2)] ;
+               else
+                       buffer [count] =3D 0x7F & ulaw_encode [-ptr [count]=
 >> (16 + 2)] ;
+@@ -847,7 +850,9 @@ f2ulaw_array (const float *ptr, int count, unsigned ch=
ar *buffer, float normfact
+ static inline void
+ d2ulaw_array (const double *ptr, int count, unsigned char *buffer, double=
 normfact)
+ {     while (--count >=3D 0)
+-      {       if (ptr [count] >=3D 0)
++      {       if (!isfinite (ptr [count]))
++                      buffer [count] =3D 0 ;
++              else if (ptr [count] >=3D 0)
+                       buffer [count] =3D ulaw_encode [lrint (normfact * p=
tr [count])] ;
+               else
+                       buffer [count] =3D 0x7F & ulaw_encode [- lrint (nor=
mfact * ptr [count])] ;
+--
+2.7.4
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-12562.=
patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-12562.patch
new file mode 100644
index 0000000000..491dae3114
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-12562.patch
@@ -0,0 +1,96 @@
+Heap-based Buffer Overflow in the psf_binheader_writef function in common.=
c in
+libsndfile through 1.0.28 allows remote attackers to cause a denial of ser=
vice
+(application crash) or possibly have unspecified other impact.
+
+CVE: CVE-2017-12562
+Upstream-Status: Backport [cf7a8182c2642c50f1cf90dddea9ce96a8bad2e8]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From b6a9d7e95888ffa77d8c75ce3f03e6c7165587cd Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?J=3DC3=3DB6rn=3D20Heusipp?=3D <osmanx@problemloesungsmas=
chine.de>
+Date: Wed, 14 Jun 2017 12:25:40 +0200
+Subject: [PATCH] src/common.c: Fix heap buffer overflows when writing stri=
ngs
+ in binheader
+
+Fixes the following problems:
+ 1. Case 's' only enlarges the buffer by 16 bytes instead of size bytes.
+ 2. psf_binheader_writef() enlarges the header buffer (if needed) prior to=
 the
+    big switch statement by an amount (16 bytes) which is enough for all c=
ases
+    where only a single value gets added. Cases 's', 'S', 'p' however
+    additionally write an arbitrary length block of data and again enlarge=
 the
+    buffer to the required amount. However, the required space calculation=
 does
+    not take into account the size of the length field which gets output b=
efore
+    the data.
+ 3. Buffer size requirement calculation in case 'S' does not account for t=
he
+    padding byte ("size +=3D (size & 1) ;" happens after the calculation w=
hich
+    uses "size").
+ 4. Case 'S' can overrun the header buffer by 1 byte when no padding is
+    involved
+    ("memcpy (&(psf->header.ptr [psf->header.indx]), strptr, size + 1) ;" =
while
+    the buffer is only guaranteed to have "size" space available).
+ 5. "psf->header.ptr [psf->header.indx] =3D 0 ;" in case 'S' always writes=
 1 byte
+    beyond the space which is guaranteed to be allocated in the header buf=
fer.
+ 6. Case 's' can overrun the provided source string by 1 byte if padding i=
s
+    involved ("memcpy (&(psf->header.ptr [psf->header.indx]), strptr, size=
) ;"
+    where "size" is "strlen (strptr) + 1" (which includes the 0 terminator=
,
+    plus optionally another 1 which is padding and not guaranteed to be
+    readable via the source string pointer).
+
+Closes: https://github.com/erikd/libsndfile/issues/292
+---
+ src/common.c | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/src/common.c b/src/common.c
+index 1a6204ca..6b2a2ee9 100644
+--- a/src/common.c
++++ b/src/common.c
+@@ -681,16 +681,16 @@ psf_binheader_writef (SF_PRIVATE *psf, const char *f=
ormat, ...)
+                                       /* Write a C string (guaranteed to =
have a zero terminator). */
+                                       strptr =3D va_arg (argptr, char *) =
;
+                                       size =3D strlen (strptr) + 1 ;
+-                                      size +=3D (size & 1) ;
+
+-                                      if (psf->header.indx + (sf_count_t)=
 size >=3D psf->header.len && psf_bump_header_allocation (psf, 16))
++                                      if (psf->header.indx + 4 + (sf_coun=
t_t) size + (sf_count_t) (size & 1) > psf->header.len && psf_bump_header_al=
location (psf, 4 + size + (size & 1)))
+                                               return count ;
+
+                                       if (psf->rwf_endian =3D=3D SF_ENDIA=
N_BIG)
+-                                              header_put_be_int (psf, siz=
e) ;
++                                              header_put_be_int (psf, siz=
e + (size & 1)) ;
+                                       else
+-                                              header_put_le_int (psf, siz=
e) ;
++                                              header_put_le_int (psf, siz=
e + (size & 1)) ;
+                                       memcpy (&(psf->header.ptr [psf->hea=
der.indx]), strptr, size) ;
++                                      size +=3D (size & 1) ;
+                                       psf->header.indx +=3D size ;
+                                       psf->header.ptr [psf->header.indx -=
 1] =3D 0 ;
+                                       count +=3D 4 + size ;
+@@ -703,16 +703,15 @@ psf_binheader_writef (SF_PRIVATE *psf, const char *f=
ormat, ...)
+                                       */
+                                       strptr =3D va_arg (argptr, char *) =
;
+                                       size =3D strlen (strptr) ;
+-                                      if (psf->header.indx + (sf_count_t)=
 size > psf->header.len && psf_bump_header_allocation (psf, size))
++                                      if (psf->header.indx + 4 + (sf_coun=
t_t) size + (sf_count_t) (size & 1) > psf->header.len && psf_bump_header_al=
location (psf, 4 + size + (size & 1)))
+                                               return count ;
+                                       if (psf->rwf_endian =3D=3D SF_ENDIA=
N_BIG)
+                                               header_put_be_int (psf, siz=
e) ;
+                                       else
+                                               header_put_le_int (psf, siz=
e) ;
+-                                      memcpy (&(psf->header.ptr [psf->hea=
der.indx]), strptr, size + 1) ;
++                                      memcpy (&(psf->header.ptr [psf->hea=
der.indx]), strptr, size + (size & 1)) ;
+                                       size +=3D (size & 1) ;
+                                       psf->header.indx +=3D size ;
+-                                      psf->header.ptr [psf->header.indx] =
=3D 0 ;
+                                       count +=3D 4 + size ;
+                                       break ;
+
+@@ -724,7 +723,7 @@ psf_binheader_writef (SF_PRIVATE *psf, const char *for=
mat, ...)
+                                       size =3D (size & 1) ? size : size +=
 1 ;
+                                       size =3D (size > 254) ? 254 : size =
;
+
+-                                      if (psf->header.indx + (sf_count_t)=
 size > psf->header.len && psf_bump_header_allocation (psf, size))
++                                      if (psf->header.indx + 1 + (sf_coun=
t_t) size > psf->header.len && psf_bump_header_allocation (psf, 1 + size))
+                                               return count ;
+
+                                       header_put_byte (psf, size) ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14245-=
14246.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14245=
-14246.patch
deleted file mode 100644
index a17ec21f98..0000000000
--- a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14245-14246.p=
atch
+++ /dev/null
@@ -1,121 +0,0 @@
-From 2d54514a4f6437b67829717c05472d2e3300a258 Mon Sep 17 00:00:00 2001
-From: Fabian Greffrath <fabian@greffrath.com>
-Date: Wed, 27 Sep 2017 14:46:17 +0200
-Subject: [PATCH] sfe_copy_data_fp: check value of "max" variable for being
- normal
-
-and check elements of the data[] array for being finite.
-
-Both checks use functions provided by the <math.h> header as declared
-by the C99 standard.
-
-Fixes #317
-CVE: CVE-2017-14245
-CVE: CVE-2017-14246
-
-Upstream-Status: Backport [https://github.com/fabiangreffrath/libsndfile/c=
ommit/2d54514a4f6437b67829717c05472d2e3300a258]
-
-Signed-off-by: Fabian Greffrath <fabian@greffrath.com>
-Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
----
- programs/common.c          | 20 ++++++++++++++++----
- programs/common.h          |  2 +-
- programs/sndfile-convert.c |  6 +++++-
- 3 files changed, 22 insertions(+), 6 deletions(-)
-
-diff --git a/programs/common.c b/programs/common.c
-index a21e62c..a249a58 100644
---- a/programs/common.c
-+++ b/programs/common.c
-@@ -36,6 +36,7 @@
- #include <string.h>
- #include <ctype.h>
- #include <stdint.h>
-+#include <math.h>
-
- #include <sndfile.h>
-
-@@ -45,7 +46,7 @@
-
- #define       MIN(x, y)       ((x) < (y) ? (x) : (y))
-
--void
-+int
- sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int channels, int no=
rmalize)
- {     static double   data [BUFFER_LEN], max ;
-       int             frames, readcount, k ;
-@@ -54,6 +55,8 @@ sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int=
 channels, int normalize
-       readcount =3D frames ;
-
-       sf_command (infile, SFC_CALC_SIGNAL_MAX, &max, sizeof (max)) ;
-+      if (!isnormal (max)) /* neither zero, subnormal, infinite, nor NaN =
*/
-+              return 1 ;
-
-       if (!normalize && max < 1.0)
-       {       while (readcount > 0)
-@@ -67,12 +70,16 @@ sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, i=
nt channels, int normalize
-               while (readcount > 0)
-               {       readcount =3D sf_readf_double (infile, data, frames=
) ;
-                       for (k =3D 0 ; k < readcount * channels ; k++)
--                              data [k] /=3D max ;
-+                      {       data [k] /=3D max ;
-+
-+                              if (!isfinite (data [k])) /* infinite or Na=
N */
-+                                      return 1;
-+                              }
-                       sf_writef_double (outfile, data, readcount) ;
-                       } ;
-               } ;
-
--      return ;
-+      return 0 ;
- } /* sfe_copy_data_fp */
-
- void
-@@ -252,7 +259,12 @@ sfe_apply_metadata_changes (const char * filenames [2=
], const METADATA_INFO * in
-
-               /* If the input file is not the same as the output file, co=
py the data. */
-               if ((infileminor =3D=3D SF_FORMAT_DOUBLE) || (infileminor =
=3D=3D SF_FORMAT_FLOAT))
--                      sfe_copy_data_fp (outfile, infile, sfinfo.channels,=
 SF_FALSE) ;
-+              {       if (sfe_copy_data_fp (outfile, infile, sfinfo.chann=
els, SF_FALSE) !=3D 0)
-+                      {       printf ("Error : Not able to decode input f=
ile '%s'\n", filenames [0]) ;
-+                              error_code =3D 1 ;
-+                              goto cleanup_exit ;
-+                              } ;
-+                      }
-               else
-                       sfe_copy_data_int (outfile, infile, sfinfo.channels=
) ;
-               } ;
-diff --git a/programs/common.h b/programs/common.h
-index eda2d7d..986277e 100644
---- a/programs/common.h
-+++ b/programs/common.h
-@@ -62,7 +62,7 @@ typedef SF_BROADCAST_INFO_VAR (2048) SF_BROADCAST_INFO_2=
K ;
-
- void sfe_apply_metadata_changes (const char * filenames [2], const METADA=
TA_INFO * info) ;
-
--void sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int channels, i=
nt normalize) ;
-+int sfe_copy_data_fp (SNDFILE *outfile, SNDFILE *infile, int channels, in=
t normalize) ;
-
- void sfe_copy_data_int (SNDFILE *outfile, SNDFILE *infile, int channels) =
;
-
-diff --git a/programs/sndfile-convert.c b/programs/sndfile-convert.c
-index dff7f79..e6de593 100644
---- a/programs/sndfile-convert.c
-+++ b/programs/sndfile-convert.c
-@@ -335,7 +335,11 @@ main (int argc, char * argv [])
-                       || (outfileminor =3D=3D SF_FORMAT_DOUBLE) || (outfi=
leminor =3D=3D SF_FORMAT_FLOAT)
-                       || (infileminor =3D=3D SF_FORMAT_DOUBLE) || (infile=
minor =3D=3D SF_FORMAT_FLOAT)
-                       || (infileminor =3D=3D SF_FORMAT_VORBIS) || (outfil=
eminor =3D=3D SF_FORMAT_VORBIS))
--              sfe_copy_data_fp (outfile, infile, sfinfo.channels, normali=
ze) ;
-+      {       if (sfe_copy_data_fp (outfile, infile, sfinfo.channels, nor=
malize) !=3D 0)
-+              {       printf ("Error : Not able to decode input file %s.\=
n", infilename) ;
-+                      return 1 ;
-+                      } ;
-+              }
-       else
-               sfe_copy_data_int (outfile, infile, sfinfo.channels) ;
-
---
-2.7.4
-
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-13139.=
patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-13139.patch
index 4ae3674df1..707373d414 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-13139.patch
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-13139.patch
@@ -1,23 +1,25 @@
-From 5473aeef7875e54bd0f786fbdd259a35aaee875c Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 10 Oct 2018 08:59:30 +0800
-Subject: [PATCH] libsndfile1: patch for CVE-2018-13139
+CVE: CVE-2018-13139
+Upstream-Status: Backport [9dc989eb89cd697e19897afa616d6ab0debe4822]
+Signed-off-by: Ross Burton <ross.burton@intel.com>

-Upstream-Status: Backport [https://github.com/bwarden/libsndfile/
-commit/df18323c622b54221ee7ace74b177cdcccc152d7]
+From 9dc989eb89cd697e19897afa616d6ab0debe4822 Mon Sep 17 00:00:00 2001
+From: "Brett T. Warden" <brett.t.warden@intel.com>
+Date: Tue, 28 Aug 2018 12:01:17 -0700
+Subject: [PATCH] Check MAX_CHANNELS in sndfile-deinterleave

-CVE: CVE-2018-13139
+Allocated buffer has space for only 16 channels. Verify that input file
+meets this limit.

-Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Fixes #397
 ---
- programs/sndfile-deinterleave.c | 6 ++++++
- 1 file changed, 6 insertions(+)
+ programs/sndfile-deinterleave.c | 7 +++++++
+ 1 file changed, 7 insertions(+)

 diff --git a/programs/sndfile-deinterleave.c b/programs/sndfile-deinterlea=
ve.c
-index e27593e..721bee7 100644
+index e27593e2..cb497e1f 100644
 --- a/programs/sndfile-deinterleave.c
 +++ b/programs/sndfile-deinterleave.c
-@@ -89,6 +89,12 @@ main (int argc, char **argv)
+@@ -89,6 +89,13 @@ main (int argc, char **argv)
                exit (1) ;
                } ;

@@ -26,10 +28,10 @@ index e27593e..721bee7 100644
 +                      argv [1], sfinfo.channels, MAX_CHANNELS) ;
 +              exit (1) ;
 +              } ;
++
 +
        state.channels =3D sfinfo.channels ;
        sfinfo.channels =3D 1 ;

 --
-2.7.4
-
+2.11.0
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19758.=
patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19758.patch
new file mode 100644
index 0000000000..c3586f9dfc
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19758.patch
@@ -0,0 +1,34 @@
+There is a heap-based buffer over-read at wav.c in wav_write_header in
+libsndfile 1.0.28 that will cause a denial of service.
+
+CVE: CVE-2018-19758
+Upstream-Status: Backport [42132c543358cee9f7c3e9e9b15bb6c1063a608e]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From c12173b0197dd0c5cfa2cd27977e982d2ae59486 Mon Sep 17 00:00:00 2001
+From: Erik de Castro Lopo <erikd@mega-nerd.com>
+Date: Tue, 1 Jan 2019 20:11:46 +1100
+Subject: [PATCH] src/wav.c: Fix heap read overflow
+
+This is CVE-2018-19758.
+
+Closes: https://github.com/erikd/libsndfile/issues/435
+---
+ src/wav.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/wav.c b/src/wav.c
+index e8405b55..6fb94ae8 100644
+--- a/src/wav.c
++++ b/src/wav.c
+@@ -1094,6 +1094,8 @@ wav_write_header (SF_PRIVATE *psf, int calc_length)
+               psf_binheader_writef (psf, "44", 0, 0) ; /* SMTPE format */
+               psf_binheader_writef (psf, "44", psf->instrument->loop_coun=
t, 0) ;
+
++              /* Loop count is signed 16 bit number so we limit it range =
to something sensible. */
++              psf->instrument->loop_count &=3D 0x7fff ;
+               for (tmp =3D 0 ; tmp < psf->instrument->loop_count ; tmp++)
+               {       int type ;
+
+--
+2.11.0
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/met=
a/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index b28f675286..eb2c719d8d 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -10,9 +10,12 @@ SRC_URI =3D "http://www.mega-nerd.com/libsndfile/files/l=
ibsndfile-${PV}.tar.gz \
            file://CVE-2017-8361-8365.patch \
            file://CVE-2017-8362.patch \
            file://CVE-2017-8363.patch \
-           file://CVE-2017-14245-14246.patch \
            file://CVE-2017-14634.patch \
            file://CVE-2018-13139.patch \
+           file://0001-a-ulaw-fix-multiple-buffer-overflows-432.patch \
+           file://CVE-2018-19432.patch \
+           file://CVE-2017-12562.patch \
+           file://CVE-2018-19758.patch \
           "

 SRC_URI[md5sum] =3D "646b5f98ce89ac60cdb060fcd398247c"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
