Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7328.1793264054725604486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 01:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Xvk0g17M;
 spf=pass (domain: est.tech, ip: 40.107.162.47, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQWCSq5fQZqtuzWVbhz8o7voCAueknsZIg6VVc7FC5HxJEOorDuaRbVEO11IETtG2CaI9HzPKSU+f7iFTlyMbtcvGzizVpch/OP6bEpnx5SAxOkUQg6c3oPsE8KZKwfzcSn4PFDQTDRQ7cjy606HPWz1ulESWFLbNN3AVqJa63UvL3hoO9RWwMQMp0MQFu/Xr5EvZ0QBNxoBnVr+EMNubdKmO0GvTODi/bFrHxySCyXFsAhU5KDaFnZJjOOoWlhWLJ03qPPbxTelING3dSNjGF9dPYthYezQllPG/rn7owamAa5Px8y2IAZbZCZJrgTp8FtJ6+tDav4rg1KfuUP1Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PJM/bWBiXHt/9uYZRCS/UGCACq2L2pNR84lwtlsYEY=;
 b=v/z/UqUaIF1eSGlSZRLwB/e0NxUApP9OF87zPaZNL5TPD0+EgFPK/ayBVwtKULYUIyRSUDVbkDytecHY8mVtudZeUt3AyL/cKIST38B8HR+VQ56WK3k2Bnwj1xEaG7Nk2JURxYMXbSzY29rTUDs5SGLca7OXrUMxKxpmawUn1xyMAk1xkp7pPuCFDPuUlF7zNvKK1v/occI4PqHPzN6Y2IpMaupi3g8vl3/2lAD+GDxcQWPv4t8Yy2AySRfVr8sy8YbKMCV1ttyBuKYwKjf+a1rXTGDcUsM+AxxULuTKVW/ejlBbd7dzYbG8sCRQ+Y81xao8O80CUWJlqIQXyvgSvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PJM/bWBiXHt/9uYZRCS/UGCACq2L2pNR84lwtlsYEY=;
 b=Xvk0g17MXG3VXtjhfFXMNx6j17knLYfc80MRdwWjxHSydzLAyEjuAp5VoRQ6FNKn/9wnKMUZG8wCd9EQPtVwkHZAM7ciiDqRzGhiFcjJ70VLxEeyEP256+Ok8d6CJH/TsH0bscd5imLOrUm262KOcb+Y+PfqVVX6kMKBmSiY3b29IHfWQ/XZLepGvVzH1ku/yTWXo5buncbXrWh3nVmr3tNLK/AwfUWjidRc2hPCIhpXEvU+nUT9D/PSUJ+yoVdpb6bXQBaNzsjUBVxz+XkE10riB0xe86O1B9m42UmXD9dxtb3zayU1SOdneH+3iD41Il8GzGuqjNEAw8Gqv4bAIg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2605.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 08:54:09 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 08:54:09 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 3/3] openssl: Upgrade 4.0.3 -> 4.1.0
Date: Thu, 29 Oct 2026 09:54:01 +0100
Message-ID: <20261029085401.9109-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261029085401.9109-1-jaipaul.cheernam@est.tech>
References: <20261029085401.9109-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2605:EE_
X-MS-Office365-Filtering-Correlation-Id: a070c43a-f54b-414f-72ae-08df359a318e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|11063799006|56012099006|261009223027099003|261026130827099003|261026121527099003|261026135527099003|261026140227099003|261022105027099003|261021123027099003|261028144727099003|261021135927099003|261022115727099003|261021133027099003|261022113327099003|261021121427099003|10067099003|261022075727099003|261021130227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: Yq+8sLsn1gYd/NFR92nl77NNrMSO7vJ39+QvFZ75oZj3HOykm7oBrySR990y6OC7uJIhgoKMmNspvOQQ27KpDUvtT+N9yZ+ADInMBGNLrFRWrWJRBnqHhUAZDB1cviuugZO+MRDZqyzqLVEB8JdGVVz7gCiOXsQ/i4TypQVMclEZFp9vCAr8aNZF0Oxc714BMJ1HKWcxER9qEQnUWw6LjF+6iv76KmVBbbiVKFQKGCAQ77h1+Ykr4fDifR2jJBvRyQpYt3PJigRHGny6XyGLOMVcOBetaq7+zN6ifM3kqXmuufS42WIzHZvTaSSIWq/UJgfbDOuGSuWMlRfN84S4ZdFWqfnZnYAp3OEzYvI52gq1dR8ERRPPXHVIYnIRDjO00yqxLjpl96xNshgtiiga8pnPJEiZeZiLWPk1ve5OQ18IBlLsX9e+fg01D6xLgCg9I3VGEmERe/M7AXZShSTAg6nHesRHK4GzspcuUB6i9zCPW3h6IJ2rmJ89wGn1aCQ5NFSP1rEAtiUa1ufWpiP3uaRWisw3YANG3No+BXdSrrj4LtGQPufPirvYlM1L5A2+nXckPavd0ioRaZXrYJd5odhqbHHPuTSmKFhC6BpAgyblQmnBwLFuW4I/di2pYftK/GVjpxshBY3JicbScUlfnhC0iU4BQLQixw9yoWTQggo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(56012099006)(261009223027099003)(261026130827099003)(261026121527099003)(261026135527099003)(261026140227099003)(261022105027099003)(261021123027099003)(261028144727099003)(261021135927099003)(261022115727099003)(261021133027099003)(261022113327099003)(261021121427099003)(10067099003)(261022075727099003)(261021130227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YrtVgEVK9EBgGzNOd9l8jOexqg68KWZ5XVj2iyZ8aHEcLWJxNnO0N2CDCWqv?=
 =?us-ascii?Q?dS2Q4w0GhG32vsWfrbpCLsFz1Gh6upPMLFHYHDW3yVYQcq/bG4mKLeM59Mb0?=
 =?us-ascii?Q?C2G2xnUIi2PucvEeffxixIrhujIDO16NTznga059R7J2PU6ztbeVUxLqbKuw?=
 =?us-ascii?Q?L7TAEotybW+AIFdurl2Xurye0I3UCE3dFbI2/EEmYe2Xj4MoHWlgW1np7Eh8?=
 =?us-ascii?Q?/IXWY30NJjK960vi65nA0us3rHiLdKrAnzwpfsn+RRyCvdaYSnNQEUkihO2E?=
 =?us-ascii?Q?vbLjjrc6FiBoc97M3iavpr8Q3O83q5JbMFeMq/f+pdLe3GgVqu9gi2R8QxRw?=
 =?us-ascii?Q?oIFaqYKuqSpumAlVkhaQ+zdibUPElX7AA71xdD9wYgUPay4dF2YBUNsFUj6A?=
 =?us-ascii?Q?WkpdXq+nRBugsUIelxnq7yjt59qfBiV3yv7QAYcq2R9hdjLEA/OMgwlploiv?=
 =?us-ascii?Q?4WsbzmrHQq3XkW+kld8tHFfhkYg9FGRUGtngbEQg/6fVMsgc2jY8UPC6NNtg?=
 =?us-ascii?Q?UXsiQgJXNU3IA57+z8vxtGPExpvUCLOSvTM0VRcW8QQjfObHQUrc9bVvx5Pr?=
 =?us-ascii?Q?dfJieExxSfc01dq42K5Rii8/zJunm8VgjVHTyw2TSJ3HFSkB7E/pqkToldS8?=
 =?us-ascii?Q?ESads5d6upmQpGRZWHJoLsP/mqLI5/aRkOjNF9xga0NoqkCk9p7U3fe2xm5Y?=
 =?us-ascii?Q?vkMWhkW9KMUjnHroW28SB1mUd4WyNgpn8AiZXxvRhJ+jUJ9/EdrNj1Rts3Az?=
 =?us-ascii?Q?QpUVmnsfd+078qk4cTBzBazROCV+ECO0waun6BQ/5plQ1VvoTniMsU4Nyahi?=
 =?us-ascii?Q?+incYvJAvsH98IGc9KDIFsbZWaxSq6d9tYcLG/T0sGJKCs5H+lmmK0e+dSFb?=
 =?us-ascii?Q?mHV747RI3ENXs4lq0ztT9uidJqW3riG4ewAYEPXf+d1O34YOQgni8edLEvCu?=
 =?us-ascii?Q?FbygL7oFEqwZPz9tJX6qb5NMiNcxXNo4sudEK9xOohI+8wJzAhL+NqLWomhZ?=
 =?us-ascii?Q?0vd5rc+cx/0PK/RywlsDG/GQZQ1ulF6psWeoUzVNQ2w27Npumnmo1Fa5BLJz?=
 =?us-ascii?Q?WxsLjKjnb7aDq1PxLfBnCtPUC+0EhRWY6V+PG45PbBvQd0+2plfQs1ojdOmi?=
 =?us-ascii?Q?zT4B/zBUtcRpUStl2RFrr/LHz9Mw7uePGs7/JDWBiM7cBdqnDu0P+Trr7Q5e?=
 =?us-ascii?Q?J6oglkybm0l3e60c9GwFIFN6wqXV42pbq6IXGx2XrDi3Psja+Bl2fem2YoQH?=
 =?us-ascii?Q?v6Yk5dA+wNBKiMaciwQAnP8thNpHsp5gikbkRegPPzrmnCgEGYcTJk3kSyvu?=
 =?us-ascii?Q?zUDr6iBSm9M9tWBYhnKh9OrItiGKP7PDf+jYflP3dLIRAUPs4yHBNY/xeUcU?=
 =?us-ascii?Q?p7mlqMHmmFxuq7RPIsPhF9VmXmXCNlicXHC3hUIVguYggPj/t1HlSH2EZ3oC?=
 =?us-ascii?Q?vdr/b4A9qlD5V89ku/FIwud7AEBom/+PIJnyyYKyYlkKYIBHCYOLy4rfRYQk?=
 =?us-ascii?Q?jdXgi+t3ijM+0E4l5gUbvB8B8qzO6FlgNBHd3MGev2yqNUnSOgLx+EOkmVDf?=
 =?us-ascii?Q?9C3Kr/lZCyQYoy8Ou3RUWP4T8g+1YpTmn93ulgT9IRFlfmFul4FbUewGMuE6?=
 =?us-ascii?Q?l3yENVchVIQxPyyUxRZMU+Zf4v284Okly2mxC1iEMt/sE8VxUhX9t9fPLoQZ?=
 =?us-ascii?Q?vgImsVBclcJq746luOL5Y0pGqJLHLoKnoux1MVdk+NVpXKS8ShLdwTzidxIC?=
 =?us-ascii?Q?vfxwfSy51w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a070c43a-f54b-414f-72ae-08df359a318e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:54:08.3789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zoCbqRaXVmOOYl1GwRaOt9lXkTikvhtIZLwKadD1MKepIx282lAaThRiJpHRQlTYswqA3X+KN1mxdZhDAzQYINpUlL1FXwkTTaXq68WtUF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2605
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 08:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248912
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
Changes since v2:
- Add patch for python3-pyopenssl

Changes since v1:
- Add patch for python3-cryptography

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
