Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26021.1793126070832048196
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 11:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mMR2n3pf;
 spf=pass (domain: est.tech, ip: 52.101.72.8, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ka0bsaRVOWP5ZFMqiGoAfJbbktgEVr+nVuYL5NwEHLAX+IBLD1D94+EyJvPe/3UMMsn0uVmr9iBquTSLSDTicZLBjuBf27Eq+Kozcu2xQer9VoqHus/YtUPVpKAR5mayo+VPeDOqqVIL87FdB/Mhgniv1fzdjIUyAOlWZBGWdA69GJ9AAJg1ZvDvWytKLAmkpTnd0UflyNBsjBXhaafQBG040mvN+H57mNcBvjN4ctuI8E+B+L56mvtsf9BOsklDPnyfHHVtYEukEot0cCKHRAq514QM2E5W9ThMuNjpDiE4CCqymxTmqJHQBHlxEq0OCJr/VZkD9AgCJZf6S9XNYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLNdxS9mQGL0MAk9QLOWxrxsf+LkmVBf6yX5CKb0HO0=;
 b=PtjNDSkSn7MRaOLLVE3AA+G8FCQqAQuvQz3g4USBEckNnvltN5eNdEKZAU/evTYdT10HpTymnHO3mXdNgABtqeV+6iTAR63r5Sdp4xucaKoqaRVxxB52Uy61qofhRhz9iaeZAtTRJAl3D305QNv5aAgYnTFcB1B8UhYQ4bsGmFOFHUUNhfaedXDSHfMKU5Pg3l63Jw+x6SWiEQdndo9q23zPltxT9C+gFiqFD6yhIHpapdD3pNT453F2c0Y7oNcWSODZ+vBsNy1W1BdT27ARq9DmuNcfbfwiU5A5/lDXeRpFjC+CehT8X4oYm9lozIGrQOdamc5NIyahLYpH9V5NrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLNdxS9mQGL0MAk9QLOWxrxsf+LkmVBf6yX5CKb0HO0=;
 b=mMR2n3pfoOu0UFqqoto7E2qD3aeS7IKNHJmcDs0csNUKpqL21ZkO13kep0dj3w+blL7vas0qLPQnXEc9GhnyArT6RQm8a/uS+7P2FSnQqSgPAIXJW15PBxq21RJWqzQ29QByBEXKzOnL0LlQnprYxoeL5CpaHJKCWvdxkEkZ/vlUT/mLFLwQMdfL1nbhx/Ot31Sh8QV++H5EySwCKSRbYwnGbTukGpa4QMfBGLpoUu/xogWcJpHxHG6o2DCPQL39UXnXcZ8pnVwMaeX1NS96a2FeRoYV8HwSIHw9+tppJoiYQdpGYsbcG4+L3gDLQ+vJ1MjGEgHX0OcT4RsglVqeRA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PR3P189MB1082.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:45::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 18:34:27 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 18:34:27 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] openssl: Upgrade 4.0.3 -> 4.1.0
Date: Tue, 27 Oct 2026 19:34:24 +0100
Message-ID: <20261027183424.11874-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261027183424.11874-1-jaipaul.cheernam@est.tech>
References: <20261026183524.6389-1-jaipaul.cheernam@est.tech>
 <20261027183424.11874-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0292.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PR3P189MB1082:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a3464b-8f63-48b4-4d77-08df3458eec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261026121527099003|4143699003|11063799006|56012099006|261026135527099003|261021123027099003|261022115727099003|261021121427099003|261021133027099003|261022113327099003|261022105027099003|261022075727099003|261021130227099003|261021135927099003|261009223027099003|10067099003|18002099003|22082099003|6133799003|261026140227099003|261026130827099003;
X-Microsoft-Antispam-Message-Info: eWQfdGSoS7/gt/PHL4SwCryk58rORcL8X8CoP8Vw4mRnKWoAgz3E41/VeTERreg76Dqxw670xUQ9KI6KsSewuHxCjhtHwViNtvKTLdyClzUvJmKPHU2CRULLtyqKEBD+O4CDEcRG5KJHCkIRH/wm0NtHoQwtBzXzHZm6vmNnBmxyl+5pCIv5ZDtGClNtI98+s9rIMqzCgQEVbHJJEyq8FfmNb6kfojr28fwnDme9F6qGKLEIALD9lTOs+1cP6fCJQ6z15feJlhqVau1BU4M9bXZB3rXh4aW5AYfgtAglyvq/lOgxDMU9/f0cBoFA/xc/SeSL6Aj+XECRn14n0vANDCJA9T81r6T+qgKFAE5pvEOuGJ8EKkwHtY7MfEhEwbfbxdYX9gLn1BcHjLUyQTcKk72SIeN209vShPPGtSMxrngh8jbfaVP2cr7ctXcXkvJu5c80MFtGmG2KLszNHLpOP8gIsGjCGU+kzNQcaCs0T+dhkFVg5M9vBE+ptseB4aKzHdLHUwiQYwkITxU7ZwES+yfAoQcWs/TPqmyGi2Mbi+OdnqBrjSrRMg1Kccpx6YC1ZSFm++aJ9ixPGsDz9AX7uuNe4SWbJyBFbKIzFNI53RJtmN8hB7NVij1KyZ33MwP/ZtpiYM0pRsK9tCIsm1HmV6a/EdWyALw1Awfw0KguljI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261026121527099003)(4143699003)(11063799006)(56012099006)(261026135527099003)(261021123027099003)(261022115727099003)(261021121427099003)(261021133027099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021130227099003)(261021135927099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(261026140227099003)(261026130827099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A3ciBuGBpx3BDFkZTiJzsGvtFlYPhTD6rDuTxa9PmE1LZ/6LaW9UNPTRRiR3?=
 =?us-ascii?Q?WbzVcelEip7bphtG5ZiMGfQT0qVTixblDvV0qKarmzNor1ICbbgwSDPd4GEv?=
 =?us-ascii?Q?7+y8135GNxckJGZvlfd3e6aHNz3nM4JYqY2cF8i/A96O/UojY8lXtNNmy+3j?=
 =?us-ascii?Q?af9SbcOvYn2CpuGQa3aaZvV36R/GAIwyaZxdXgOkoDMuh+RzLa4UJgU4yYTj?=
 =?us-ascii?Q?vwQN/ldGCWdEeK9+S0iciJxju7MPoP4UXOdjGzQpbGyHBpkIgLqK6LfggSPU?=
 =?us-ascii?Q?D/YXKG+rGp1LCeqMEDsAD4LygTXygl0rI7ca9Mhud5nGdaWUbJl3laeeNSxs?=
 =?us-ascii?Q?LyWfPxnt1DlAxJ8qLW+gx8JJKL6mjsmdwoFOyfrHjU+B/y8OAz30kl7UFQzW?=
 =?us-ascii?Q?i4tGWNrvbQD6uuVtzL5WACTLKY//kf3bZRfTrjO4fDehbSK6A/JY0/AyNAeB?=
 =?us-ascii?Q?jn6oogyQsTKszM4FnovAjnBaIz7dbBbVcVWPNB4U2NyK+7jyVHi2dJLa5LP8?=
 =?us-ascii?Q?hYd2MA8phnToQEdoTMuRnV83/WZZldJ8had9XxAVyLdjaLPU6tWU9PdkZdo+?=
 =?us-ascii?Q?Ub/NkukbT17vvgMX2Rwx6qgZp9gQYmgWNHUIWzmcyrTFisPJfsndGP7/RbWF?=
 =?us-ascii?Q?f7NMRniBR0pS/uzWVx4YOXDCg0Uh3A1kqQKPKlfPZXv6ni4Zv+deqPdoozIx?=
 =?us-ascii?Q?nPizFI5/J/l9hPgz8l2XqkxK/bC/EUtT2uub3U15Yr5jVEnBwbeq0kuoeXwm?=
 =?us-ascii?Q?7nkr5Os7HtwLKiousQnnZ5Xk+xDv/mYsNXfjVq8PePxwRLsMflPGdBeY3W4M?=
 =?us-ascii?Q?/7vhtaRioNlLMWdJ2CxBv/hOMVZ5Cr4o0AkhK2uMLpdU/B+ICDWc4CM3lhZ+?=
 =?us-ascii?Q?NWwrk7oX/6CEt4AW7nCYg2+yOEO1Cb2cuNJNszkYMuusogG79bwErhYN53Bm?=
 =?us-ascii?Q?cpaMhOkxzuu88dn/fwiXRp91E9UoOmxbxd+v8SdlDziEfgtX6aMVhWLSiF/u?=
 =?us-ascii?Q?EJngzd32yNYF94rkAkn/PbMjfWlwVtkiaiIbAecGeQbUkd5OdKR2Het6jM/E?=
 =?us-ascii?Q?/codMbx8yRAF4A6+kZ9cXzaRCwKNDXbwNaScktDQ04NbgHQfnWdJU0KXzK+F?=
 =?us-ascii?Q?YWS/rLkhACITkL4/EsS77Ot4PFqvtayZLxSVtvcgmnE3B/9ZJNlAJM+Extbt?=
 =?us-ascii?Q?VG69OksYG8WHC7dbsKzA1XG3pDn5gWJW6feTF250WULivtAa0KWg/JlukIc/?=
 =?us-ascii?Q?8pCtsyVDXglk0u7wQBKvryfCjRZFp92nMjUOAuxdHRjK9D4xOZrUYtT5RVtZ?=
 =?us-ascii?Q?Az9nhKh211uUXqNwPk/AdhMyBF2UOegjZ1XWphgvmFO7ojMndEgEYCMKBfTe?=
 =?us-ascii?Q?qLnMVmUqmxHFVATkCMD/SO2su6n5vl7lGWMeBjGH3iSB2ICKookgLou9P9fh?=
 =?us-ascii?Q?QPjEwo3fFFjYVIUo4BwVWMSJhTTBsqONpO03mDwwcc0bap+bSOtJUIMuijyz?=
 =?us-ascii?Q?YrCeplZwZ8zGank1gCIZM44Bpyu605YIZeUdxpig3SeewXP+czV8yc7Y/9gK?=
 =?us-ascii?Q?iA3tRkBPmomOyZBNe9fSo1TB+Fs+Q/XP3BL2zLNiFEkOH8kmslKrYUhA856+?=
 =?us-ascii?Q?sb8sQqQASM/CqyF4HT9qxA7c91P+JF7uGalKsoqGdBww5FPL8Oo/KM3f7/XG?=
 =?us-ascii?Q?+l8KxWbIHT454CNWtgk4410iPf+jvjWAvmtbHWMP0q7RfYNg6lrBRGeoy5qe?=
 =?us-ascii?Q?dPygRXfjQg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a3464b-8f63-48b4-4d77-08df3458eec5
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 18:34:27.8692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wT5ctFJC+quJft04ARxhiXH4SJdfRzEUvaqAVjFnnv6J4ORGzMTiTFDOCg3Cwgp4aP5YIHioG6QyFh212AuTWkX3O3xV+sR9TSLw2fHroU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 18:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248760
Content-Type: text/plain; charset="utf-8"

  Release information [1]:

  OpenSSL 4.1.0 is a feature release adding significant new functionality t=
o OpenSSL.

  This release incorporates the following potentially significant or incomp=
atible changes:

  - Added VC-WIN32-MSVC2013 and VC-WIN64A-MSVC2013 build targets to provide=
 internal functions for bridging the gaps in C99 standard support that are =
present in MSVC 2013.
  - Added optimized ML-DSA and ML-KEM NTT operations on ppc64le; optimized =
ML-DSA operations on x86_64; AVX-512-optimized SHAKE x4 operations for ML-D=
SA on x86_64; AVX-512 and VAES optimizations for AES-CBC
  decryption on x86_64.
  - Changed tsget utility to use Net::Curl::Easy (from the Net-Curl CPAN di=
stribution) instead of the abandoned WWW::Curl::Easy. Users who rely on tsg=
et should install Net::Curl::Easy before upgrading.
  - Dropped Windows-on-Itanium (VC-WIN64I) and Windows CE (VC-CE) targets f=
rom Configurations.
  - Dropped no-ecdsa and no-ecdh options from Configure, as these options d=
id not really disable the implementations. Use no-ec to disable the ellipti=
c curve support.

  This release adds the following new features:

  - Support for DTLS 1.3 (RFC 9147). Refer to the ossl-guide-dtlsv13(7) man=
ual page for details.
  - Support for RFC 8701 GREASE (Generate Random Extensions And Sustain Ext=
ensibility).
  - DTLS support in the SSL listener API.
  - Support for IKEV2 KDF.
  - Initial support for the Elbrus2000 (e2k) architecture.

  [1] https://github.com/openssl/openssl/blob/openssl-4.1/NEWS.md#major-cha=
nges-between-openssl-40-and-openssl-410-23-oct-2026

- Refresh existing patches
- Verified with world
- Verified ptest python3-cryptography
   TOTAL: 4650
   PASS: 4443
   FAIL: 0
   ERROR: 0
  TOTAL: 1  FAIL: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-Configure-do-not-tweak-mips-cflags.patch  |  6 +++---
 ...trip-sysroot-and-debug-prefix-map-from-co.patch | 14 +++++++-------
 .../0001-extend-check_cwm-test-timeout.patch       |  2 +-
 .../openssl/{openssl_4.0.3.bb =3D> openssl_4.1.0.bb} |  2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_4.0.3.bb =3D> openssl_4.=
1.0.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-no=
t-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-=
Configure-do-not-tweak-mips-cflags.patch
index 77bfe4e4e5..2991082a5f 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak=
-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak=
-mips-cflags.patch
@@ -1,4 +1,4 @@
-From b5cee0cb0f14a78056ef7722a34b361491f1fdda Mon Sep 17 00:00:00 2001
+From 89d2702e00b0826fded82b06a9866e0fe7380540 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 30 May 2023 09:11:27 -0700
 Subject: [PATCH] Configure: do not tweak mips cflags
@@ -17,10 +17,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 10 deletions(-)
=20
 diff --git a/Configure b/Configure
-index c05a30b..db8adee 100755
+index e66424a..62141fe 100755
 --- a/Configure
 +++ b/Configure
-@@ -1575,16 +1575,6 @@ if ($target =3D~ /^mingw/ && `$config{CC} --target-=
help 2>&1` =3D~ m/-mno-cygwin/m)
+@@ -1617,16 +1617,6 @@ if ($target =3D~ /^mingw/ && `$config{CC} --target-=
help 2>&1` =3D~ m/-mno-cygwin/m)
          push @{$config{shared_ldflag}}, "-mno-cygwin";
          }
 =20
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip=
-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/ope=
nssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patc=
h
index 1d9e7539f6..04f46a3d3e 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroo=
t-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroo=
t-and-debug-prefix-map-from-co.patch
@@ -1,4 +1,4 @@
-From 6df53bfebcf8ca65910a18220a6576fb110918a5 Mon Sep 17 00:00:00 2001
+From 4df92463252f8f0695db0143d3a26566a1736b2c Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Martin=3D20Hundeb=3DC3=3DB8ll?=3D <martin@geanix.com>
 Date: Tue, 6 Nov 2018 14:50:47 +0100
 Subject: [PATCH] buildinfo: strip sysroot and debug-prefix-map from compil=
er
@@ -34,12 +34,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 16 insertions(+), 2 deletions(-)
=20
 diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makef=
ile.tmpl
-index eff66e5..bc48f51 100644
+index f8a5b16..807439f 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
-@@ -503,13 +503,27 @@ BIN_LDFLAGS=3D{- join(' ', $target{bin_lflags} || ()=
,
-                          '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
- BIN_EX_LIBS=3D$(CNF_EX_LIBS) $(EX_LIBS)
+@@ -532,13 +532,27 @@ BIN_EX_LIBS=3D$(CNF_EX_LIBS) $(EX_LIBS)
+ CMOCKA_LIBS=3D{- $config{cmocka_libs} // '' -}
+ DETOURS_LIBS=3D{- $config{detours_libs} // '' -}
 =20
 -# CPPFLAGS_Q is used for one thing only: to build up buildinf.h
 +# *_Q variables are used for one thing only: to build up buildinf.h
@@ -67,10 +67,10 @@ index eff66e5..bc48f51 100644
 =20
  # For x86 assembler: Set PROCESSOR to 386 if you want to support
 diff --git a/crypto/build.info b/crypto/build.info
-index 8e4a885..95b0902 100644
+index 422f4aa..3573af9 100644
 --- a/crypto/build.info
 +++ b/crypto/build.info
-@@ -114,7 +114,7 @@ DEFINE[../libcrypto]=3D$UPLINKDEF
+@@ -113,7 +113,7 @@ DEFINE[../libcrypto]=3D$UPLINKDEF
 =20
  DEPEND[info.o]=3Dbuildinf.h
  DEPEND[cversion.o]=3Dbuildinf.h
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cw=
m-test-timeout.patch b/meta/recipes-connectivity/openssl/openssl/0001-exten=
d-check_cwm-test-timeout.patch
index 26622fd1b1..29b9728479 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-=
timeout.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-=
timeout.patch
@@ -1,4 +1,4 @@
-From 07bbd037ca61264bcc311856a119b664ce13f586 Mon Sep 17 00:00:00 2001
+From ff0de34474c0dfec4f13dfb4079689c8731bf6ce Mon Sep 17 00:00:00 2001
 From: Gyorgy Sarvari <skandigraun@gmail.com>
 Date: Thu, 23 Oct 2025 11:24:36 +0200
 Subject: [PATCH] extend check_cwm test timeout
diff --git a/meta/recipes-connectivity/openssl/openssl_4.0.3.bb b/meta/reci=
pes-connectivity/openssl/openssl_4.1.0.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_4.0.3.bb
rename to meta/recipes-connectivity/openssl/openssl_4.1.0.bb
index 122bf61f59..1e47c3cf34 100644
--- a/meta/recipes-connectivity/openssl/openssl_4.0.3.bb
+++ b/meta/recipes-connectivity/openssl/openssl_4.1.0.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk =3D " \
            file://environment.d-openssl.sh \
            "
=20
-SRC_URI[sha256sum] =3D "325b5c806167c13b40b1ffeadfe0248197c00eccc4cf123ec1=
e28d2d2fd216d9"
+SRC_URI[sha256sum] =3D "50c17baf54cb008f6ce42d50deb4b28050a1aad711636cabd4=
b241c7e90cc2fd"
=20
 inherit lib_package multilib_header ptest perlnative manpages
=20
