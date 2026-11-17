Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13493.1794903397605191231
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 00:16:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=VbbOLpbO;
 spf=pass (domain: est.tech, ip: 52.101.83.26, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlDyeNlAiXuYincFWhVuLHHYCiqmfKUaJdnQNpbxgZgcyZbMn+UAaVvCUP86gzuuc4yc0yh5jlVjxdeyZIcBIE8KEJ2AGbNx86aDj5+UqFHb4ztkiJzjG1EiVTekPgPKdL7Y9WT0tpbZRjN0boUXdF5a3kCpPAriV1fL9oBb2fFo68GDWGwpB4LBNRFyeuwtpNhAwh4+dhLUkLGDKs6Z+/r7yBKr+SsYUs8uFklQpxf5tePD8zYgZITedPl1Id00A0/oEI97oNVWaGBO1taqyaNvrD9CRuN5Q+pI1OmhNQzq32EelD2xK0HC7gi0eFRSGUl9qqMaf4FkFaGO1ot3RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52ZIqzkMBs6w6XTYLu8BRWH4doQZn/Id7C4addn/qI4=;
 b=TksO6ALLVbFMgwHGa5EmMTL9oVFWIWQcrLsDDBilTBbR1m6t5Ts3CJFE11dOmEHij+TF6LcMeKaRCcOO8YcNKq9iRbGm1+4zeZVhR+9T8C5uky6PdyLW5CkI2/CaM6ch4mrggetiSCndZ2iU9568wSDcxyBl2RkhSOgEHsLdNjCWfkPyKDDnNuL2F79L3xwTJcf+iDGbUS0u4ChI3PhnypjmZCeJ22Ay2qhwRs05/J8DVGqBEaLp2+TdduXnBwXDGIWTG9PQTjw0ASEENjJEfy+PVlbVneHzH4xrkGp1kWfzbKZ22XyOCPBnH82ZY3ilLZHnmgpGiccKzZr6d4zD3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52ZIqzkMBs6w6XTYLu8BRWH4doQZn/Id7C4addn/qI4=;
 b=VbbOLpbOPOwZCf9mP4xlw3wFSMIW3nhzvUjrvWaObZgFe35/qcF4sgsv7QRrYi/NV94kfYJhpsFJYaVwjlknlltchnzy7FfC6xgCHBUNzykLLik6JsARoXaOWzaQnYGQn/jDGSsGM8klK2pmVRaseh2j1QJD8GCNyngOG08CkAq2LHPyjr8hSg4ZGkc8290DRICkrh2R1gNJM5YngkcUIr3VoSfKUD5P7F5b6mamrKRTvtgpsA536Rf+m0ZoWwhAfazwWzuUUrZvghB79mWDiOvgNT+QsHF0xTb19APbkyb6M0WJ7rD8RH2nh7RToHLLt5g8Njl+3skvETMSBhbCdA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI1P18901MB0733.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:16:33 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 08:16:33 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 2/2] perl: upgrade 5.42.0 -> 5.42.3
Date: Tue, 17 Nov 2026 09:16:29 +0100
Message-ID: <20261117081629.12668-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261117081629.12668-1-jaipaul.cheernam@est.tech>
References: <20261105170249.55552-1-jaipaul.cheernam@est.tech>
 <20261117081629.12668-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0065.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::19) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI1P18901MB0733:EE_
X-MS-Office365-Filtering-Correlation-Id: a8eb5158-23ec-4e3f-40a4-08df44831742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|11063799006|4143699003|260925022911599003|260925021911599003|260925021311599003|261026121527099003|261026140227099003|261028144727099003|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261022113327099003|261102123227099003|261009223027099003|12006099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: VkLfJptHRvhOHKPImhgK3wW1sf2MZxlbV4h10yw3a8bdSPsRHedICXePSdPdgiP3PL6t+DoEA3zHIrSJBGSkZSJeHVATn+QoE+u9KO5rEqYMSEKuMVsKwNcvmLc/IwMPp8tsK8/xItT7w4gv4gw/DeiknjZuF0qojj+Li4zQZ7UwLeEV7wC5AScVPsShnPsjODvxm4eaZCEshqRB70mo1i/PfXpQLIuzRzHMF+k2xWIAVZfjr87RYve2nnL45NobbTkwntBFX1aO2s+Shwy9+cCHg46qttDKMX0b2wFE8I6tW2hr0kt+EErrIa1LJ5gYyUNtTia2Pbdo+9KnU2Snv1T705VrphoKdwLTM7A02M4no47jVB0zA++x28TOMnDyEpbk4TPwTyjaKWq4pOvzGkFt1Qqg7n2mXNhnfoaVP7E/3neFq9Jzq+fjPJGGxGzfxMIzdvEPxQCIxOe0AHvTf2rfiyl31Cl+pgrDsLRNf1y0bAwSnPe17MxfXAPgwgYTzDUkHxzb69rRceTzHELe3nm3FoEpc8+MNx2LIubk6/QMkRk04GeUOMTvAAu2Spmiu7241toyHdrRpZKbq99/yHbaleJnpNHmdxE9A6zXYKXAUr9IwXdwLdx9v0+NlZcK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(260925022911599003)(260925021911599003)(260925021311599003)(261026121527099003)(261026140227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261022113327099003)(261102123227099003)(261009223027099003)(12006099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bpdzx6p0Pia1E4/3TNDTlP4kTRmHKFznYOSpHpVhVSIVZaXOYdhh9YCgsPW0?=
 =?us-ascii?Q?7f8H/UUS+kJ7sLcP2xT0HGJcgBNRsYoBjACZgT91M3NDqE/TBHMdxpdR1QK8?=
 =?us-ascii?Q?wLuf4pSv5wuY6nCJqvc1BnMSgf1DXscBuLRwZQu+zWN+x22tmzeLItOQutHO?=
 =?us-ascii?Q?cgtccCi2v6siOQDVZNHkK5ZsAcQ6jtDLVN1t4VV7gkKImk7AhcK9WH5adnS9?=
 =?us-ascii?Q?1dCZvG8dBnzK0dLu1fR4N/8ype/xj0qdfui2SL5Ug9DS3UDnc0IQsyvbCMlO?=
 =?us-ascii?Q?9APTuZSh3YmTL3TKm0qIKR1jkOzaexKGjy7wiU1vO960B4VcQsMxtnueKq2v?=
 =?us-ascii?Q?879JAcQfdFZH3Fyl2eW6H6dRs6/Vnxps9aB2HLFf2VxDu1yfYrZgufUFrNwk?=
 =?us-ascii?Q?s6b6QVWeuMakb9oAfsDM9GC1MvmWM4M5j542t1Cz8bQeuZ5YGHosR/EVYj7S?=
 =?us-ascii?Q?YwY5pu5qw6TuVLk93vu1tsPJ8Cq+J2yx9RsDJtjzsftcVFsE6fg+zIBC1GnJ?=
 =?us-ascii?Q?IePfW0ZpiiABKb9horNnYKEW4Dm7+mUuB1rve4yGBCtyMLqByIc7UaY3aX4X?=
 =?us-ascii?Q?hO3jDwO7bEOAriZXvBw7VbmyXkuw2IaoJdiyzbSr+unTijFERmRIIpueEy+B?=
 =?us-ascii?Q?z9Xc70Zc1/cjUCh2M/3kMp6OENWWQOddK9eyZ0AUazbmu4splsHGAbpkP9ZC?=
 =?us-ascii?Q?2RMamdJ6wJCQvSYfIbTt6DIoQ+jmTyiEj/XzpnP/RxMGf4pVQx8FOPq1neC1?=
 =?us-ascii?Q?nogvgxGx4tZ/gqNyVgNmPh6Acn/KSLLueiXrSw9nObQ4dLATZKyQZBztyz+O?=
 =?us-ascii?Q?sBzDIL7C0gA5yTKWhsmUKJWfdwwX08Hc0KvPHVJ5rf+6dWZoNgVM9MmhLtg0?=
 =?us-ascii?Q?Sd24lofBKjAzEY6pIVY1g1JyoSMUz65E0JLfD1snFKTAzl6+pfdstn3xdpG8?=
 =?us-ascii?Q?hM3HFC4wCXBHaHdc1UwKDjDC9onxX9nu6K0pUQE84ynOWmkcsRkO3yevFs3h?=
 =?us-ascii?Q?2N7KCELav1gcbLRv2zcpJkprkxuzLihDrIxB1VEqEFGcsw6WvbH77oAVoL+L?=
 =?us-ascii?Q?IIJ61fxqamfxb+U8jerZXAl+OUQmc6eBButco/mRArLMJGEnjWMa2aJB3UJ1?=
 =?us-ascii?Q?F/CJz9Wd71q4QzT+IJRp7i0T7eQTF50Jk6VEb+dWmhNmw4+K24qvGPjmkFf9?=
 =?us-ascii?Q?0WAQuFqKSDk06fecFRfmzElBvkBwVszw+F2illSOSqghQf/wjCcYOaXDRjiq?=
 =?us-ascii?Q?pOjjl5k49+rMKQ6d1GkHLaipVaRSPtjjYvFrgWCJTknCENDuX40QbH9N7PL2?=
 =?us-ascii?Q?C85Q96qdWEX2PH36h+4as8NclzSPMU9MhBLC+K8Bjtpdw/hpv7flp8WwjhJ5?=
 =?us-ascii?Q?EoC4Q2hLu7gvacxLopVDOA50AmUePkc9Eih+jc+mNEvuyWgz0w4mKjTbpV+V?=
 =?us-ascii?Q?7awtdv1eTNDOYKeV4pf++k85lxf6zxtPKLZcRlk/6xD6GokSHDAX8EEsNdhu?=
 =?us-ascii?Q?7qtZSJfGj4CORJFy92RVvdHHd0ryYLUTvs4GMlO0LQQ3QrV91vX5+FHtd2t4?=
 =?us-ascii?Q?HFe3WDQCkaDan7ws9Nq3wJVwKqPw8OAnUx6PcaAaKJK0UjzybXraBOlPg18t?=
 =?us-ascii?Q?PdzZPMFG82bePjQiMFucV5r6ZEXpDA1ng5HkfGbC83z9Hjjq1q37tSaTqfNe?=
 =?us-ascii?Q?3moB2ihN5Fm7ObiRogvgUvcac7mYDrTubTvm22TE9ausHAiT4JPZ8oOizwUM?=
 =?us-ascii?Q?wMO17HFeKQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a8eb5158-23ec-4e3f-40a4-08df44831742
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:16:33.3947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4CX43ocHu3L4m+qgXYCYly1L8h3sg/IrqkfSmLs3WBPbHcXrpcZaMs1HI5rJP6O+BB60XuSg2OldXIViNG/ACfIMFAgITxqrClfqUoQbG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0733
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 08:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250412
Content-Type: text/plain; charset="utf-8"

ReleaseInfo: https://perldoc.perl.org/5.42.3/perl5423delta

- CVE-2026-8376: buffer overflow in Perl_study_chunk (regcomp_study.c)
  from checking substring buffer size in characters instead of bytes
- CVE-2026-57432: buffer overflow in S_measure_struct via pack/unpack
  on an oversized structure
- CVE-2026-13221: regex trie 16-bit field overflow with >~65k
  alternation branches
- CVE-2026-57433: Storable.xs signed int overflow unpacking hook data
- Archive::Tar bumped 3.04 -> 3.12, including symlink/hardlink path
  traversal fix (CVE-2026-42496)

All of the above are fixed upstream in 5.42.3, so the local CVE backport
patches are dropped.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../perl/files/CVE-2026-13221.patch           | 75 --------------
 .../perl/files/CVE-2026-42496.patch           | 99 -------------------
 .../perl/files/CVE-2026-57432-01.patch        | 52 ----------
 .../perl/files/CVE-2026-57432-02.patch        | 34 -------
 .../perl/files/CVE-2026-57433.patch           | 32 ------
 .../perl/files/CVE-2026-8376-01.patch         | 62 ------------
 .../perl/files/CVE-2026-8376-02.patch         | 49 ---------
 .../perl/{perl_5.42.0.bb =3D> perl_5.42.3.bb}   |  9 +-
 8 files changed, 1 insertion(+), 411 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-13221.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-42496.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-01.patc=
h
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-02.patc=
h
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57433.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
 rename meta/recipes-devtools/perl/{perl_5.42.0.bb =3D> perl_5.42.3.bb} (98=
%)

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-13221.patch b/meta/r=
ecipes-devtools/perl/files/CVE-2026-13221.patch
deleted file mode 100644
index 03396f3e43..0000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-13221.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 03f74bbbd3a68350d926ee93d56ee4808c28c4c7 Mon Sep 17 00:00:00 2001
-From: Karl Williamson <khw@cpan.org>
-Date: Thu, 26 Mar 2026 10:13:49 -0600
-Subject: [PATCH] regcomp_study: Don't create a trie that would overflow
-
-This addresses GH #23388
-
-The design of the trie compiling code is to batch extra long tries into
-smaller chunks that fit into whatever limitations there are.  However,
-this ticket shows that that isn't always being done.
-
-In this case, a bunch of branches that have TAIL operands can be
-combined together, and the final TAIL is used.  And the code requires
-that the delta between the first branch and this final TAIL fit into a
-16-bit field.  That is the root cause of this bug.
-
-I'm not familiar enough with the trie construction code to easily
-understand why the final tail needs to be used here.  So this patch
-simply doesn't optimize a sequence of branches into a trie that would
-overflow.
-
-This could be revisited by someone who knows more about this than I, or
-earlier in the development cycle.
-
-CVE: CVE-2026-13221
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/03f74bbbd3=
a68350d926ee93d56ee4808c28c4c7]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- regcomp_study.c     | 10 ++++++++++
- t/re/pat_advanced.t |  9 +++++++++
- 2 files changed, 19 insertions(+)
-
-diff --git a/regcomp_study.c b/regcomp_study.c
-index db7ab3a409..a1b2c3d4e5 100644
---- a/regcomp_study.c
-+++ b/regcomp_study.c
-@@ -1933,6 +1933,16 @@ Perl_study_chunk(pTHX_
-                             tail =3D regnext( tail );
-                         }
-=20
-+                        /* The code below currently saves the difference =
from
-+                         * start to finish in a 16-bit field, causing
-+                         * GH #23388.  This defeats the design of batchin=
g
-+                         * tries into chunks that each fit.  khw thinks i=
t is
-+                         * too late in the 5.44 cycle to relook at the de=
sign,
-+                         * so for now anyway, don't make a trie that woul=
d
-+                         * overflow */
-+                        if (tail - startbranch >=3D U16_MAX) {
-+                            continue;
-+                        }
-=20
-                         DEBUG_TRIE_COMPILE_r({
-                             regprop(RExC_rx, RExC_mysv, tail, NULL, pRExC=
_state);
-diff --git a/t/re/pat_advanced.t b/t/re/pat_advanced.t
-index 398680838d..c9e389ecb3 100644
---- a/t/re/pat_advanced.t
-+++ b/t/re/pat_advanced.t
-@@ -4898,6 +4898,15 @@ EOF_DEBUG_OUT
-         $x =3D~ s/^[\x{0301}\x{030C}]+//;
-     }
-=20
-+    { # GH #23388
-+        fresh_perl_is(<<~'PROG', , "", {}, "Avoid trie overflow");
-+            my $x =3D join "|", "aaa".."mzz";
-+            my $y =3D join "|", "naa".."zzz";
-+            use re 'Debug';
-+            "fnord" =3D~ m/(?:$x)|(?:$y)/;
-+            PROG
-+    }
-+
-=20
-     # !!! NOTE that tests that aren't at all likely to crash perl should =
go
-     # a ways above, above these last ones.  There's a comment there that,=
 like
---=20
-2.43.0
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-42496.patch b/meta/r=
ecipes-devtools/perl/files/CVE-2026-42496.patch
deleted file mode 100644
index ae370340cf..0000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-42496.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From edde2083c6e93e42b979068af5529710b5e2a7ab Mon Sep 17 00:00:00 2001
-From: Stig Palmquist <stig@stig.io>
-Date: Thu, 21 May 2026 19:59:21 +0100
-Subject: [PATCH] Validate symlink and hardlink linkname in SECURE MODE
-
-Archive::Tar before 3.08 passes the tar header's linkname directly to
-symlink()/link() in _make_special_file() without validating absolute
-paths or '..' segments. This allows a crafted tar archive to create
-symlinks or hardlinks targeting paths outside the extraction directory,
-leading to arbitrary file read/write.
-
-Add validation in SECURE EXTRACT MODE (the default) to reject:
-- Symlink/hardlink targets with absolute paths
-- Symlink/hardlink targets containing '..' path traversal
-
-Adjusted patch paths from upstream Archive::Tar standalone repository
-(lib/Archive/Tar.pm) to match perl5 source tree layout
-(cpan/Archive-Tar/lib/Archive/Tar.pm).
-
-Upstream-Status: Backport [https://github.com/jib/archive-tar-new/commit/1=
7c873492a05eddc0de18c1485e0b2cccd5a9158]
-
-CVE: CVE-2026-42496
-CVE: CVE-2026-42497
-
-Signed-off-by: Chris 'BinGOs' Williams <chris@bingosnet.co.uk>
-Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
----
- cpan/Archive-Tar/lib/Archive/Tar.pm     | 30 +++++++++++++++++++++++++
- cpan/Archive-Tar/t/04_resolved_issues.t |  2 ++
- 2 files changed, 32 insertions(+)
-
-diff --git a/cpan/Archive-Tar/lib/Archive/Tar.pm b/cpan/Archive-Tar/lib/Ar=
chive/Tar.pm
-index 2df0931..733feef 100644
---- a/cpan/Archive-Tar/lib/Archive/Tar.pm
-+++ b/cpan/Archive-Tar/lib/Archive/Tar.pm
-@@ -954,6 +954,19 @@ sub _make_special_file {
-     my $err;
-=20
-     if( $entry->is_symlink ) {
-+        if( !$INSECURE_EXTRACT_MODE ) {
-+            my $linkname =3D $entry->linkname;
-+            if( File::Spec->file_name_is_absolute($linkname) ) {
-+                $self->_error( qq[Symlink '] . $entry->full_path .
-+                    qq[' has absolute target. Not extracting under SECURE=
 EXTRACT MODE] );
-+                return;
-+            }
-+            if( grep { $_ eq '..' } File::Spec->splitdir($linkname) ) {
-+                $self->_error( qq[Symlink '] . $entry->full_path .
-+                    qq[' target attempts traversal. Not extracting under =
SECURE EXTRACT MODE] );
-+                return;
-+            }
-+        }
-         my $fail;
-         if( ON_UNIX ) {
-             symlink( $entry->linkname, $file ) or $fail++;
-@@ -967,6 +980,23 @@ sub _make_special_file {
-                 $entry->linkname .q[' failed] if $fail;
-=20
-     } elsif ( $entry->is_hardlink ) {
-+        if( !$INSECURE_EXTRACT_MODE ) {
-+            my $linkname =3D $entry->linkname;
-+            if( File::Spec->file_name_is_absolute($linkname) ) {
-+                $self->_error( qq[Hardlink '] . $entry->full_path .
-+                    qq[' has absolute target '$linkname'. Not extracting =
] .
-+                    qq[under SECURE EXTRACT MODE: extraction itself chmod=
s ] .
-+                    qq[the shared inode.] );
-+                return;
-+            }
-+            if( grep { $_ eq '..' } File::Spec->splitdir($linkname) ) {
-+                $self->_error( qq[Hardlink '] . $entry->full_path .
-+                    qq[' target '$linkname' attempts traversal. Not ] .
-+                    qq[extracting under SECURE EXTRACT MODE: extraction ]=
 .
-+                    qq[itself chmods the shared inode.] );
-+                return;
-+            }
-+        }
-         my $fail;
-         if( ON_UNIX ) {
-             link( $entry->linkname, $file ) or $fail++;
-diff --git a/cpan/Archive-Tar/t/04_resolved_issues.t b/cpan/Archive-Tar/t/=
04_resolved_issues.t
-index b3566a1..08d339a 100644
---- a/cpan/Archive-Tar/t/04_resolved_issues.t
-+++ b/cpan/Archive-Tar/t/04_resolved_issues.t
-@@ -220,6 +220,7 @@ if ($^O ne 'msys') # symlink tests fail on Windows/msy=
s2
- 		}
-=20
-     { #use case 1 - in memory extraction
-+      local $Archive::Tar::INSECURE_EXTRACT_MODE=3D1;
- 			my $t=3DArchive::Tar->new;
- 			$t->read( $archname );
- 			my $r =3D eval{ $t->extract };
-@@ -231,6 +232,7 @@ if ($^O ne 'msys') # symlink tests fail on Windows/msy=
s2
-=20
- 		{ #use case 2 - iter extraction
- 		  #$DB::single =3D 2;
-+      local $Archive::Tar::INSECURE_EXTRACT_MODE=3D1;
- 			my $next=3DArchive::Tar->iter( $archname, 1 );
- 			my $failed =3D 0;
- 			#use Data::Dumper;
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-57432-01.patch b/met=
a/recipes-devtools/perl/files/CVE-2026-57432-01.patch
deleted file mode 100644
index ef92b0d7b2..0000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-57432-01.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 5f7eb6bbbe0510964e3fb1d6bb691e5445913e55 Mon Sep 17 00:00:00 2001
-From: "Paul \"LeoNerd\" Evans" <leonerd@leonerd.org.uk>
-Date: Sat, 9 May 2026 17:18:43 +0100
-Subject: [PATCH] pp_pack.c: Avoid ssize_t overflow when calculating the si=
ze
- of a structure
-
-If the user has requested a size that would overflow a SSize_t, then the
-only sensible thing to do is throw an exception, because the structure
-this implies couldn't possibly fit into memory anyway.
-
-CVE: CVE-2026-57432
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/5f7eb6bbbe=
0510964e3fb1d6bb691e5445913e55]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- pod/perldiag.pod | 6 ++++++
- pp_pack.c        | 4 ++++
- 2 files changed, 10 insertions(+)
-
-diff --git a/pod/perldiag.pod b/pod/perldiag.pod
-index 841e22d580..d9231077363d 100644
---- a/pod/perldiag.pod
-+++ b/pod/perldiag.pod
-@@ -4880,6 +4880,12 @@ mixed-case attribute name, instead.  See L<attribut=
es>.
- (F) You can't specify a repeat count so large that it overflows your
- signed integers.  See L<perlfunc/pack>.
-=20
-+=3Ditem Pack template structure size is too large
-+
-+(F) You called C<pack> or C<unpack> to operate on a structure, whose
-+computed size is too large to fit in memory.  This usually happens as a
-+result of embedding a large number as the repeat count for an item.
-+
- =3Ditem page overflow
-=20
- (W io) A single call to write() produced more lines than can fit on a
-diff --git a/pp_pack.c b/pp_pack.c
-index b5c0b261ef..6075e83aac 100644
---- a/pp_pack.c
-+++ b/pp_pack.c
-@@ -528,6 +528,10 @@ S_measure_struct(pTHX_ tempsym_t* symptr)
-                 break;
-             }
-         }
-+        if ((size > 0) &&
-+                ((len > SSize_t_MAX / size) ||         /* detect overflow=
 of len * size */
-+                 (len * size > SSize_t_MAX - total)))  /* detect overflow=
 of total + len * size */
-+            croak("Pack template structure size is too large");
-         total +=3D len * size;
-     }
-     return total;
---=20
-2.43.0
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-57432-02.patch b/met=
a/recipes-devtools/perl/files/CVE-2026-57432-02.patch
deleted file mode 100644
index 273a247a88..0000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-57432-02.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 40754edc72dd3e513d758153c0e2f0215897740e Mon Sep 17 00:00:00 2001
-From: "Paul \"LeoNerd\" Evans" <leonerd@leonerd.org.uk>
-Date: Mon, 11 May 2026 12:25:33 +0100
-Subject: [PATCH] pp_pack.c: Avoid some other potential overflows when
- calculating sizes
-
-CVE: CVE-2026-57432
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/40754edc72=
dd3e513d758153c0e2f0215897740e]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- pp_pack.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pp_pack.c b/pp_pack.c
-index 6075e83aac..b2019902203a 100644
---- a/pp_pack.c
-+++ b/pp_pack.c
-@@ -515,12 +515,12 @@ S_measure_struct(pTHX_ tempsym_t* symptr)
-                 break;
-             case 'B':
-             case 'b':
--                len =3D (len + 7)/8;
-+                len =3D (len / 8) + !!(len % 8);
-                 size =3D 1;
-                 break;
-             case 'H':
-             case 'h':
--                len =3D (len + 1)/2;
-+                len =3D (len / 2) + !!(len % 2);
-                 size =3D 1;
-                 break;
-=20
---=20
-2.43.0
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-57433.patch b/meta/r=
ecipes-devtools/perl/files/CVE-2026-57433.patch
deleted file mode 100644
index f0ea08b1fe..0000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-57433.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From e4f681784bcdeaa91ff02a2fa4cdcae5c46779d7 Mon Sep 17 00:00:00 2001
-From: "Paul \"LeoNerd\" Evans" <leonerd@leonerd.org.uk>
-Date: Sat, 9 May 2026 16:47:14 +0100
-Subject: [PATCH] Storable.xs: Avoid signed int overflow when unpacking a l=
ist
- of hook data items
-
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/e4f681784b=
cdeaa91ff02a2fa4cdcae5c46779d7]
-CVE: CVE-2026-57433
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- dist/Storable/Storable.xs | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/dist/Storable/Storable.xs b/dist/Storable/Storable.xs
-index 3930db6..62a1a6d 100644
---- a/dist/Storable/Storable.xs
-+++ b/dist/Storable/Storable.xs
-@@ -5035,7 +5035,10 @@ static SV *retrieve_hook_common(pTHX_ stcxt_t *cxt,=
 const char *cname, int large
-         }
-         else
-             GETMARK(len3);
--        if (len3) {
-+        if (len3 =3D=3D I32_MAX)
-+            /* If len3 is exactly I32_MAX it will upset av_extend below *=
/
-+            CROAK(("Invalid count of hook data items"));
-+        else if (len3) {
-             av =3D newAV();
-             av_extend(av, len3 + 1);    /* Leave room for [0] */
-             AvFILLp(av) =3D len3;         /* About to be filled anyway */
---=20
-2.43.0
-
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch b/meta=
/recipes-devtools/perl/files/CVE-2026-8376-01.patch
deleted file mode 100644
index af94eec29c..0000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From fd23f4370d24d00352d1cc09b16687f16da6ae5b Mon Sep 17 00:00:00 2001
-From: Tony Cook <tony@develop-help.com>
-Date: Tue, 12 May 2026 14:47:31 +1000
-Subject: [PATCH 1/2] perl/perl-security#147: test cases
-
-The suggested case from the ticket and an alternative.
-
-(cherry picked from commit e842efdafe7c51a687a4907e4887988fe6a025ef)
-
-CVE: CVE-2026-8376
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/e842efdafe=
7c51a687a4907e4887988fe6a025ef]
-Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.=
com>
----
- t/re/pat_psycho.t | 18 ++++++++++++++++--
- 1 file changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
-index 336039521d..73a7992372 100644
---- a/t/re/pat_psycho.t
-+++ b/t/re/pat_psycho.t
-@@ -10,7 +10,7 @@
- use strict;
- use warnings;
- use 5.010;
--
-+use Config;
-=20
- sub run_tests;
-=20
-@@ -31,7 +31,7 @@ BEGIN {
-=20
- skip_all('$PERL_SKIP_PSYCHO_TEST set') if $ENV{PERL_SKIP_PSYCHO_TEST};
-=20
--plan tests =3D> 15;  # Update this when adding/deleting tests.
-+plan tests =3D> 17;  # Update this when adding/deleting tests.
-=20
- run_tests() unless caller;
-=20
-@@ -211,6 +211,20 @@ EOF
-=20
-=20
-     }
-+
-+  SKIP:
-+    { # sec #147
-+        $Config{ptrsize} =3D=3D 4
-+          or skip "these only fail on x32 and use too much memory on x64"=
, 2;
-+        local $::TODO =3D "This crashes";
-+        # original case
-+        fresh_perl_like('/\x{10000}{1073741824}/',
-+                        qr/Regexp out of space/, {}, "ssize_t overflow");
-+
-+        # synthesized but similar case
-+        fresh_perl_like('/(?:\x{10001}\x{10000}){536870912}/',
-+                        qr/Regexp out of space/, {}, "ssize_t overflow ag=
ain");
-+    }
- } # End of sub run_tests
-=20
- 1;
---=20
-2.43.0
-
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch b/meta=
/recipes-devtools/perl/files/CVE-2026-8376-02.patch
deleted file mode 100644
index 39b3d510fe..0000000000
--- a/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 49c18d4c91d5b49e0a7cbb8277f3149198004c36 Mon Sep 17 00:00:00 2001
-From: Tony Cook <tony@develop-help.com>
-Date: Tue, 12 May 2026 14:51:00 +1000
-Subject: [PATCH 2/2] perl/perl-security#147: test against the actual chara=
cter
- lengths
-
-(cherry picked from commit 5e7f119eb2bb1181be908701f22bf7068e722f1c)
-
-CVE: CVE-2026-8376
-Upstream-Status: Backport [https://github.com/Perl/perl5/commit/5e7f119eb2=
bb1181be908701f22bf7068e722f1c]
-Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.=
com>
----
- regcomp_study.c   | 7 +++++++
- t/re/pat_psycho.t | 1 -
- 2 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/regcomp_study.c b/regcomp_study.c
-index 9106452dd5..05f1b017b1 100644
---- a/regcomp_study.c
-+++ b/regcomp_study.c
-@@ -2770,6 +2770,13 @@ Perl_study_chunk(pTHX_
-                                                (U8 *) SvEND(data->last_fo=
und))
-                                 - (U8*)s;
-                         l -=3D old;
-+
-+                        if (l > 0 &&
-+                            (mincount >=3D SSize_t_MAX / (SSize_t)l
-+                             || old > SSize_t_MAX - mincount * (SSize_t)l=
)) {
-+                            FAIL("Regexp out of space");
-+                        }
-+
-                         /* Get the added string: */
-                         last_str =3D newSVpvn_utf8(s  + old, l, UTF);
-                         last_chrs =3D UTF ? utf8_length((U8*)(s + old),
-diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
-index 73a7992372..9fd764fd5e 100644
---- a/t/re/pat_psycho.t
-+++ b/t/re/pat_psycho.t
-@@ -216,7 +216,6 @@ EOF
-     { # sec #147
-         $Config{ptrsize} =3D=3D 4
-           or skip "these only fail on x32 and use too much memory on x64"=
, 2;
--        local $::TODO =3D "This crashes";
-         # original case
-         fresh_perl_like('/\x{10000}{1073741824}/',
-                         qr/Regexp out of space/, {}, "ssize_t overflow");
---=20
-2.43.0
-
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devto=
ols/perl/perl_5.42.3.bb
similarity index 98%
rename from meta/recipes-devtools/perl/perl_5.42.0.bb
rename to meta/recipes-devtools/perl/perl_5.42.3.bb
index 886eaaaa37..1a8b0e11ee 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.3.bb
@@ -16,13 +16,6 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.tar=
.gz;name=3Dperl \
            file://0002-Constant-Fix-up-shebang.patch \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-deter=
m.patch \
-           file://CVE-2026-8376-01.patch \
-           file://CVE-2026-8376-02.patch \
-           file://CVE-2026-13221.patch \
-           file://CVE-2026-57432-01.patch \
-           file://CVE-2026-57432-02.patch \
-           file://CVE-2026-42496.patch \
-           file://CVE-2026-57433.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://perl-configpm-switch.patch \
@@ -31,7 +24,7 @@ SRC_URI:append:class-target =3D " \
            file://encodefix.patch \
 "
=20
-SRC_URI[perl.sha256sum] =3D "e093ef184d7f9a1b9797e2465296f55510adb6dab8842=
b0c3ed53329663096dc"
+SRC_URI[perl.sha256sum] =3D "1137740985837b5cdf15f0cfab932279dcb4352f912fe=
d6fc144e8b4f0823627"
=20
 B =3D "${WORKDIR}/perl-${PV}-build"
=20
