Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.990.1793898176790299197
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 09:02:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Fp3dTV53;
 spf=pass (domain: est.tech, ip: 52.101.72.26, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLYiSC3vPIbPCEIJwOFVxkPiOPnL6I22sHZScdUZX7ne8AHWw/5W9177F+Muk1o/AgYv61yUChhkZM/J73MW6y+XNaiSM0evV/QJ5WHEdLyeWNQhbCwzLmwA8uqD1ELyGefJyIZNuUd3A5bhFSOvwJPhdwXONLo0OGUkr44kIq4EAN81ZqYgqm2jQmBMYiKyhtbf9MDAXyVXfCiYm4TSy3X9+FZeDUOX+tcEY5c3FzuzJagY0a3/q0tkJpghharha8aajJMUW3qq/bQh52pmTCfsc5LQy2jS9CuRCRrPxUFHoX3KJB4J+08tQRl7lf2uFhqKBPZvhtfItKiaSuJGlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JA48viKTcnUMeCVF7Wc4EndvIgww3d9OHmHg5INxR9w=;
 b=W5Ugtt8+l4XQtVkFjusQCc/NAtKciE3+sW0RwEsPOudoI9qVtQX9bjsQjfW7aQK3ht0PfSHcYyfw5wKqtEMzP3NhZjgcOvbaInyRCut8ngDe/j06fWpyJ1DG6sQiRH6mw7eEFDtfN/EIN+ZAEr1OM2/9l3lVdjujWrhwt7FKL6jAO/x+fs4eyLblz5Yp5jk1Gshk2Qm/aVLNxUaEK6Tua0lwvgk5VzGV/EKSmbKYzDNn7tc5ThPJreDx7XKaMPgpYeasPx2IYSuZVTxr9TCNtCeuAqSnXuwavjaDqLU+3RRqirCoW5K07gj9jBawCuFaxhXTVzrvbAmWzrc5Ypw3og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JA48viKTcnUMeCVF7Wc4EndvIgww3d9OHmHg5INxR9w=;
 b=Fp3dTV53UpW7gsgls84MCJri0/Hxby0GoN7V9E/J1wNo6J92UZx9vl/UJTQZ7f/otOJBrsemvXFnrwwiF1oenMk4er8C3McZRrgHsNavkFf4WQQUOcBhi6QRSzv+t0ho1OxxW91PTS3UbqpXznVXrG6j6JSI82SEoc1dsNlYvx5cDVlmip2Q0QWAUMHUQDNV5k9tMicMsCLUVxx+R+AUzWcAFJiapYFTQHTHF8C+LTM3qIdek2s2z0x6NJ4XC4ox1OHmpO1KGW2aZgCaKrpn5WOIIuGrQAEz74280aC9ojusycmDV9MUMU+rLy2yLtWqvv3h7/wgvpe2T52DtiWcrw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAWP189MB2527.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:358::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 17:02:51 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 17:02:51 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 1/2] perl-cross: add patches for perl-5.42.3
Date: Thu,  5 Nov 2026 18:02:48 +0100
Message-ID: <20261105170249.55552-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU6P191CA0044.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::24) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAWP189MB2527:EE_
X-MS-Office365-Filtering-Correlation-Id: 167cf859-9710-4d97-bb11-08df3b5ea038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261026121527099003|261026140227099003|261022075727099003|261022105027099003|261102123227099003|261021121427099003|261028144727099003|10067099003|260925021311599003|11063799006|260925022911599003|260925021911599003|261009223027099003|261009221227099003|261009223327099003|261009221727099003|261009220027099003|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: V5ZZIpWehiFj7/4tm/RdX7KmFOj/VLJr9wN/fpwz9b85ZsOQpa2C3hi0AkA8To7lbt9/VtiEpyCTyBQA+jA0EiHthu+5x1SYm7jaEJQTgp1ZCBZQ8U/yk8K3XPFcqezJ+XlN6UQ5oHC+qk2q0aZLgplqSFYQFXKrn/fuwPm13evChXAatg2zEV+LgKHgGy6FjoUtpV+Y0FPkeO32+IR2p5MH+qVnh5y7IMParrgLpY9p6M9uMNj1ORSkY2aS6RGPMnSqIstcOpXJJ7scXDkiRzQ8rUDwSq2cAVSHLgesnaxM23S8gEYo7LdpdW8/JCCaoDR7czQvjc7mBsInrn5BjRkW+XId8lP/F5jI0leH1amutpbIfgsChJt+VwCkPuxLPN4ZyMHKWFFMt8FQQrgR0oI3Vg0FPfBy1q/Ck8/aJBKAfJQLv9jJYnWavP6ehwoOnOaKZjBtPZWQty2T4jantV9pQ4ONvIccMjXJl+EKEtjOzIK16kcR2tiRapWens+dkdSCdzd4kRmTphyFyUNUAmO1qbDmDoOzudUSP9dCdKNdtnF2PZ9tnBatHxyyuAMrboNj9PiGJYdpyvJYCSMH9sHV+axVNbCcmmHKwdnT44Lj1ZZXOhsakENEp8FewlfbPvdrlMulq7nwetdVRDR1P0Oavtpam7tmWJogrWOlPB0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(261102123227099003)(261021121427099003)(261028144727099003)(10067099003)(260925021311599003)(11063799006)(260925022911599003)(260925021911599003)(261009223027099003)(261009221227099003)(261009223327099003)(261009221727099003)(261009220027099003)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RfdIYUrOa5sEAzcCfgadUrGevHLnPOnF/dOv0Gj/6wmwp4CboZ+fvQGDsVoE?=
 =?us-ascii?Q?KuLJo44o8wiWH/BgMiCZzdp28ltQdu1A9T4hvpuCFgyFnkyYg9JeBjWVOiSA?=
 =?us-ascii?Q?9lURRlskjGqPdbx67LvJkXWST3Sn57HfC/6ZhvO3DklvtGqRHiD9r9Bd3yVs?=
 =?us-ascii?Q?DhudpJquIg1CXQsmGAEi/v+BIl2eJg0TUlJSvyBViApcsX+mdUHOCCQcTX4x?=
 =?us-ascii?Q?M90SzwQKfDEHtdwqCCKITkZvUw1iKV0SpspVmWFReddOC4ddHAihQagog87s?=
 =?us-ascii?Q?YkdGCIk2qfP2hnlxgun8hnCJ+cAPVocALu+nmPL9y5mfdq8FHL07SVymRB6c?=
 =?us-ascii?Q?euG0ea4erMhb/cqj6xis1+F3ShDV4taS3gdK7bV5BtcrXnRg32H0zYtqgL7K?=
 =?us-ascii?Q?h+le1UfKJZ0MP6sfBsPpXCEbrb0DE01hJJcavZsI0YJcKOBOpomoRSktOoGy?=
 =?us-ascii?Q?oRXFZ7nNdPdIJqAFHYmxEWqILLDvnv1Bq/LYwlXfrKR2fqN51wT2MMdAoGjw?=
 =?us-ascii?Q?sepjVr8wASH8J7mO0tZnwWoYc/kpLXvnUyh5T5qSkjEibqZFzmrQt5ZBz2sW?=
 =?us-ascii?Q?ubaVT5ZcVS6Fj9UJZGoepcgJ4z/EBhCqftjRWHhjIV607SJDx1GWuRuto17/?=
 =?us-ascii?Q?6IOe1zSJUSQsJhLX/MVU9IZIznXFgjMKKoRqFLvU5beJnBvk/tvDcWZmc7Fm?=
 =?us-ascii?Q?MEdmaOGNYszYw7AWmzDtWTKdC+4chFPRDtOU8upT8heSMmDkuzqaKvMsWuOm?=
 =?us-ascii?Q?TDjIG0B9nE5BZtUwMkxVdRSL3YJAg89/fREyRI3SvTMVFxVJHl2u+4jyo5o/?=
 =?us-ascii?Q?FyHShD/asS8f2I5fW8oPiKrrBmQlnHB88roFZPeQ1vi5o8hsmPk1aStVKjnA?=
 =?us-ascii?Q?RyGoKdhL1amDeFD1P0OQ3Li7l3U9RFPbS+/sVaCKbdZ890FP+giQidfSUjSS?=
 =?us-ascii?Q?i0PaHn8oLBS0d4//e1BJJs1shdD7kKdsu2IZjsH+7ZAGRzi9TLKT3HLi/5Wi?=
 =?us-ascii?Q?X3XCQoMkISeT6/2IUogwESZSP1WZ1XTQyDJp28Zf4hYI43pQakV4+J4Gg63L?=
 =?us-ascii?Q?eTtb28CAj8zloS73Swt1VzyXJtuwUp4XHEV7vTz1WR5O3oYqid9ADhG8oaVa?=
 =?us-ascii?Q?ticihT+ympHn6GV43CgJkZZuOvgOJ6ziNWPF1aS6j7EiPCm0WHpDkVsav7fd?=
 =?us-ascii?Q?tsLK8JXXqaaXim8ikrStAi8J9qbNikIEVcwvOHbZpKVBj2G/vNjk2pxxuD72?=
 =?us-ascii?Q?u2/JizSqKO4rR8bcoxzgDQLdCHR57BFgwS1KIPQiPKrGoaJzrUj6Tj5r9dp9?=
 =?us-ascii?Q?Prugwf0wZon4wZ149TrPhk+lRngddQv5+5EnOoVaBrIEmNFj4w7/syH0aChF?=
 =?us-ascii?Q?VdjUPs9Nnuo5uc6RlLERBQsbhvrSXdmi26mkM8uX4o6ogc1fvMTAHjZHefeV?=
 =?us-ascii?Q?7FcOzUvWDxwhmodKpRrH8/VlmMyjEWBHyg4p5ZIbL8zNESnuPXLKS0dGek5G?=
 =?us-ascii?Q?ZZ9my/IN8ufSVTbHaIC7rnD/xjKN2ySua59KN58DSCNO2mmmoptR15doDu6V?=
 =?us-ascii?Q?fS5NXYhKAIiFNhBpOX0OGUoc7cQOEuZVVbfO90XxXM2qXsOF5ehZqRXAOld7?=
 =?us-ascii?Q?2+uK/T/421Q4TqZH2k2DbTVbiNL9waGzgTX30cM1KXkTA4LZBkOd4E3iGDP/?=
 =?us-ascii?Q?QXEhE9Q4H/QkOSb75H/Rr5s4ktzU8dZJqD1YqMfz47NMGjTDUV8J25y4WwwX?=
 =?us-ascii?Q?/uEmgVxEKtutIr3C3R8PBADr4BOUUik=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 167cf859-9710-4d97-bb11-08df3b5ea038
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:02:51.2429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/s39f8zZ8+QG+B5CzcyzcqO2H+sJoDL0bMxpgbRy4vEyVBFTZdjSpD4tzmeLe9NIUWd5nuwJV+DJ91VV8PnhPPNRQ6AAT0MhsxwWhJiuc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2527
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 17:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249566
Content-Type: text/plain; charset="utf-8"

perl-cross 1.6.4 has no patchset for the 5.42.3 point release and aborts
configure on unknown versions. Reuse the 5.42.0 patchset, as its
cnf/diffs/README advises ("Copy the closest available version").

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...rl-cross-add-patches-for-perl-5.42.3.patch | 226 ++++++++++++++++++
 .../perl-cross/perlcross_1.6.4.bb             |   1 +
 2 files changed, 227 insertions(+)
 create mode 100644 meta/recipes-devtools/perl-cross/files/0001-perl-cross-=
add-patches-for-perl-5.42.3.patch

diff --git a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-pat=
ches-for-perl-5.42.3.patch b/meta/recipes-devtools/perl-cross/files/0001-pe=
rl-cross-add-patches-for-perl-5.42.3.patch
new file mode 100644
index 0000000000..a7fbd116f1
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-patches-fo=
r-perl-5.42.3.patch
@@ -0,0 +1,226 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 5 Nov 2026 14:00:00 +0000
+Subject: [PATCH] perl-cross: add patches for perl-5.42.3
+
+Reuse the perl 5.42.0 patchset for the 5.42.3 point release.
+
+Upstream-Status: Inappropriate [oe-specific; perl-cross goes 5.42.0 -> 5.4=
4.0]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ cnf/diffs/perl5-5.42.3/constant.patch       |  1 +
+ cnf/diffs/perl5-5.42.3/dynaloader.patch     |  1 +
+ cnf/diffs/perl5-5.42.3/findext.patch        |  1 +
+ cnf/diffs/perl5-5.42.3/installscripts.patch |  1 +
+ cnf/diffs/perl5-5.42.3/liblist.patch        | 70 +++++++++++++++++++++
+ cnf/diffs/perl5-5.42.3/makemaker.patch      |  1 +
+ cnf/diffs/perl5-5.42.3/posix-makefile.patch |  1 +
+ cnf/diffs/perl5-5.42.3/test-checkcase.patch |  1 +
+ cnf/diffs/perl5-5.42.3/test-makemaker.patch |  1 +
+ cnf/diffs/perl5-5.42.3/xconfig.patch        | 48 ++++++++++++++
+ 10 files changed, 126 insertions(+)
+ create mode 120000 cnf/diffs/perl5-5.42.3/constant.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/dynaloader.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/findext.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/installscripts.patch
+ create mode 100644 cnf/diffs/perl5-5.42.3/liblist.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/makemaker.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/posix-makefile.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/test-checkcase.patch
+ create mode 120000 cnf/diffs/perl5-5.42.3/test-makemaker.patch
+ create mode 100644 cnf/diffs/perl5-5.42.3/xconfig.patch
+
+diff --git a/cnf/diffs/perl5-5.42.3/constant.patch b/cnf/diffs/perl5-5.42.=
3/constant.patch
+new file mode 120000
+index 0000000..065e198
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/constant.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/constant.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/dynaloader.patch b/cnf/diffs/perl5-5.4=
2.3/dynaloader.patch
+new file mode 120000
+index 0000000..ffb73eb
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/dynaloader.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/dynaloader.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/findext.patch b/cnf/diffs/perl5-5.42.3=
/findext.patch
+new file mode 120000
+index 0000000..9efbe5b
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/findext.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/findext.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/installscripts.patch b/cnf/diffs/perl5=
-5.42.3/installscripts.patch
+new file mode 120000
+index 0000000..1c05e0f
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/installscripts.patch
+@@ -0,0 +1 @@
++../perl5-5.36.0/installscripts.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/liblist.patch b/cnf/diffs/perl5-5.42.3=
/liblist.patch
+new file mode 100644
+index 0000000..1dae0bb
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/liblist.patch
+@@ -0,0 +1,70 @@
++diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm b/cpan/E=
xtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
++index fbdc79aea2..976fd268aa 100644
++--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
+++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
++@@ -20,9 +20,10 @@ use File::Basename;
++ use File::Spec;
++=20
++ sub ext {
++-    if    ( $^O eq 'VMS' )     { goto &_vms_ext; }
++-    elsif ( $^O eq 'MSWin32' ) { goto &_win32_ext; }
++-    else                       { goto &_unix_os2_ext; }
+++    if    ( $Config{usemmldlt} ){ goto &_ld_ext;       }
+++    elsif ( $^O eq 'VMS' )      { goto &_vms_ext;      }
+++    elsif ( $^O eq 'MSWin32' )  { goto &_win32_ext;    }
+++    else                        { goto &_unix_os2_ext; }
++ }
++=20
++ sub _space_dirs_split {
++@@ -643,4 +644,51 @@ sub _vms_ext {
++     wantarray ? ( $lib, '', $ldlib, '', ( $give_libs ? \@flibs : () ) ) =
: $lib;
++ }
++=20
+++# A direct test for -l validity.
+++# Because guessing real file names for -llib options when dealing
+++# with a cross compiler is generally a BAD IDEA^tm.
+++sub _ld_ext {
+++    my($self,$potential_libs, $verbose, $give_libs) =3D @_;
+++    $verbose ||=3D 0;
+++
+++    if ($^O =3D~ 'os2' and $Config{perllibs}) {=20
+++	# Dynamic libraries are not transitive, so we may need including
+++	# the libraries linked against perl.dll again.
+++
+++	$potential_libs .=3D " " if $potential_libs;
+++	$potential_libs .=3D $Config{perllibs};
+++    }
+++    return ("", "", "", "", ($give_libs ? [] : ())) unless $potential_li=
bs;
+++    warn "Potential libraries are '$potential_libs':\n" if $verbose;
+++
+++    my($ld)   =3D $Config{ld};
+++    my($ldflags)   =3D $Config{ldflags};
+++    my($libs) =3D defined $Config{perllibs} ? $Config{perllibs} : $Confi=
g{libs};
+++
+++    my $try =3D 'try_mm.c';
+++    my $tryx =3D 'try_mm.x';
+++    open(TRY, '>', $try) || die "Can't create MakeMaker test file $try: =
$!\n";
+++    print TRY "int main(void) { return 0; }\n";
+++    close(TRY);
+++
+++    my $testlibs =3D '';
+++    my @testlibs =3D ();
+++    foreach my $thislib (split ' ', $potential_libs) {
+++        $testlibs =3D join(' ', @testlibs);
+++	if($thislib =3D~ /^-L/) {
+++		push(@testlibs, $thislib);
+++		next
+++	};
+++	my $cmd =3D "$ld $ldflags -o $tryx $try $testlibs $thislib >/dev/null 2=
>&1";
+++	my $ret =3D system($cmd);
+++	warn "Warning (mostly harmless): " . "No library found for $thislib\n" =
if $ret;
+++	next if $ret;
+++	push @testlibs, $thislib;
+++    }
+++    unlink($try);
+++    unlink($tryx);
+++
+++    return (join(' ', @testlibs), '', join(' ', @testlibs), '');
+++}
+++
++ 1;
+diff --git a/cnf/diffs/perl5-5.42.3/makemaker.patch b/cnf/diffs/perl5-5.42=
.3/makemaker.patch
+new file mode 120000
+index 0000000..d7bd609
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/makemaker.patch
+@@ -0,0 +1 @@
++../perl5-5.38.0/makemaker.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/posix-makefile.patch b/cnf/diffs/perl5=
-5.42.3/posix-makefile.patch
+new file mode 120000
+index 0000000..29463b7
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/posix-makefile.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/posix-makefile.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/test-checkcase.patch b/cnf/diffs/perl5=
-5.42.3/test-checkcase.patch
+new file mode 120000
+index 0000000..36c5186
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/test-checkcase.patch
+@@ -0,0 +1 @@
++../perl5-5.22.3/test-checkcase.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/test-makemaker.patch b/cnf/diffs/perl5=
-5.42.3/test-makemaker.patch
+new file mode 120000
+index 0000000..4e970ff
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/test-makemaker.patch
+@@ -0,0 +1 @@
++../perl5-5.34.0/test-makemaker.patch
+\ No newline at end of file
+diff --git a/cnf/diffs/perl5-5.42.3/xconfig.patch b/cnf/diffs/perl5-5.42.3=
/xconfig.patch
+new file mode 100644
+index 0000000..a65609b
+--- /dev/null
++++ b/cnf/diffs/perl5-5.42.3/xconfig.patch
+@@ -0,0 +1,48 @@
++perl-cross assumes the sources use xconfig.h with -DUSE_CROSS_COMPILE
++With perl 5.20.0, it's no longer true. Regardless of what mainline perl
++uses, let's stick with the old xconfig.h way for now.
++
++--- a/perl.h
+++++ b/perl.h
++@@ -43,7 +43,11 @@
++  */
++ /* #define PERL_RC_STACK */
++=20
++-#include "config.h"
+++#ifndef USE_CROSS_COMPILE
+++#  include "config.h"
+++#else
+++#  include "xconfig.h"
+++#endif
++=20
++ /* This fakes up using Mingw for locale handling.  In order to not defin=
e WIN32
++  * in this file (and hence throughout the code that isn't expecting it),=
 this
++--- a/perl_langinfo.h
+++++ b/perl_langinfo.h
++@@ -4,7 +4,11 @@
++ #ifndef PERL_LANGINFO_H
++ #define PERL_LANGINFO_H 1
++=20
+++#ifdef USE_CROSS_COMPILE
+++#include "xconfig.h"
+++#else
++ #include "config.h"
+++#endif
++=20
++ #if defined(I_LANGINFO)
++ #   include <langinfo.h>
++--- a/locale.c
+++++ b/locale.c
++@@ -327,7 +327,11 @@
++  * initialization.  This is done before option parsing, and before any t=
hread
++  * creation, so can be a file-level static.  (Must come before #includin=
g
++  * perl.h) */
++-#include "config.h"
+++#ifndef USE_CROSS_COMPILE
+++#  include "config.h"
+++#else
+++#  include "xconfig.h"
+++#endif
++=20
++ /* Returns the Unix errno portion; ignoring any others.  This is a macro=
 here
++  * instead of putting it into perl.h, because unclear to khw what should=
 be
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb b/meta/rec=
ipes-devtools/perl-cross/perlcross_1.6.4.bb
index 3c544c9746..584c08defa 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.6.4.bb
@@ -15,6 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/perl-cross=
-${PV}.tar.gz;name=3Dperl-c
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://determinism.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
+           file://0001-perl-cross-add-patches-for-perl-5.42.3.patch \
            "
 GITHUB_BASE_URI =3D "https://github.com/arsv/perl-cross/releases/"
=20
