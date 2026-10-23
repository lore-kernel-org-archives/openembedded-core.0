Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4947.1792755001978535880
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 04:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=IC+hglbH;
 spf=pass (domain: est.tech, ip: 40.107.162.14, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8pPIkao2Sl9PFMvwS1Bz+2FlOPWBQxdVWVih+0Hoc2IDhVxcATz4v1G+4zEtq+1uJBi5HZtxiKL9SOLKyHHTQoh6aS89k58/5LktIT7RM9poayHwuzGlb18aEMpopN02G4K1dC3SwZE+EdMHwlCmju1YQbDtMfNxEOIa4QAifCfR2KKs81Tob0jZYBAx0xe1GoArgcZR9k9EKcQMTy2AmdH48szfjQEKlhiwBqZBkm3BG1/DtseCRO5cF5xmb/RffZ/WAAhiVVAbIn//VKDrpGPnLsWAH2oUuMBTCS74DKt27afwKiADXIGdX+daCavWP+w7PYZCo3F+9TZX+QtPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17JzHUPHJweu34TDzTHiBh5ye8ox+X+o1ugylzRrW7Y=;
 b=NVqcPZK4tZ0wXJj4r9RPcGqLkL/EBdLSf+CjqnNcDs8ClVMk8BGO4v4CBOBC7xN/b5HL0I3L7VnulhopgvqaXNwi8wa9EU9muukm1aviLL7CjFLVfJIgNZJZ+WGT1ny3wadWE5GURyLdgnSB4VwLiYf2D5R+K3SdsUD/eC0kLfKuleH7fvl14vYAirjkg4BVHmbEg3FVDcjwNt52f7MhPxyIiqQXy8RJXw0EtocrT7p0oKvdN0CaJYl1o5hhChzk/cz56YaC1UmwNmcKXkm4RUFTTf3MkdGWXDDRuXa+Nazp621D9Y71SYbjI8gU3kJx0lw+TFWhh6CW6zxdE47TZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17JzHUPHJweu34TDzTHiBh5ye8ox+X+o1ugylzRrW7Y=;
 b=IC+hglbHRlKA59/bstNFVn8b6otROioSmMU9rZcY9i/esm03SyboAJOcC5kLV4YXN+5jDDKaUEsp2CmhFY81vz+hqlbPWDh61Zzm5yCpPh3DxMiEEjX+cTF6F0BHzcEjvYeX6kq2g+0nuEyU2nZePS0thhi8DyBnIC10ZnPMbW4zPutXa08zMLzqxONFd+ZC5XBxIM8BtJzFiTtqpq1VPaOWxSdY/5BhPOU4MMONRrVdh+4e2N7STrH9DbctxlJnpOi4xAZr/YxOePcKUAvVh3L7qFBgBgnd/3BgwQk1Q1rik3E7MpnOoquXdRXRlYfN9LS62DV4noZj6aKBYDU7RA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2091.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 11:29:59 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 11:29:59 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] strace: upgrade 7.2 -> 7.3
Date: Fri, 23 Oct 2026 13:29:48 +0200
Message-ID: <20261023112949.77631-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261023112949.77631-1-jaipaul.cheernam@est.tech>
References: <20261023112949.77631-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0067.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2091:EE_
X-MS-Office365-Filtering-Correlation-Id: 2968ea21-c452-4523-9f98-08df30f8f87b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261021121427099003|6133799003|10067099003|22082099003|18002099003|13003099007|3023799007|261022115727099003|261021123027099003|261009223027099003|11063799006|260925021311599003|260925022911599003|261022105027099003|260925021911599003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info: Ewi+U15//St+iK1i7sqxKl2GlpY7krx92ztG1hWEelykJLs5lX78V7Wg+/DXSPFxYmDaojsi8OO7tYjeuFdYOZFVr+grwhwIdlnV4gaAHal0YcX1KkS4RCcL/NerzUXCaky1Ha4zRSSNapGeLC5AacsNcqUsMBny4HNuFEjikz+IWvpBgyL7xLxoim8M+2NyvEg8OKOyUeoAwju3/thLdm+aRD+2LQRiJvCmIQK6S3GxIwopqfLAtyGXghcSQKfygN8rGLRGoPAUZOklezopilcuGwO7qJvxvljbMxPNQYdsYCg9TW+n3QH+y5C3/8aGY0ejTtN7Rij6bUl8aZemQSGw2CIxqhjXqJSm033qvokE9dka4nmJpxrO9ot6GbbfO37RRussLJOIK20q02TZDxrlqirdpC5mKM5q4Fahvh0TPSvOnd/vNKbMemqhawaXvJzKpFeP50w2rbLxLHg/I/rrMJ3lw0Oh2iNYjE0ySIBUpDmFWzlC+4VKlE0GNkHf/fdYzA7066Y5kULpc4n59iucixEZeE69Y0dV6DxaXLhiYs4r7zfYJP4bIU9fRinZEpJwRler6eSoM1J5qSR7O8XHk0s+/cTbGMTjmWk6iR5j1ZfsbghiJdBVaj3WMBfUczmM14ExaXquGbpskXjlJW3ym0UKc3fgd1PppelJNJQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261021121427099003)(6133799003)(10067099003)(22082099003)(18002099003)(13003099007)(3023799007)(261022115727099003)(261021123027099003)(261009223027099003)(11063799006)(260925021311599003)(260925022911599003)(261022105027099003)(260925021911599003)(56012099006)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1O+JxlGMRz+1hj3Ojplp1FTCWiLVspOQTzJJaBw5hcuiqYToL7RATYzW5tqf?=
 =?us-ascii?Q?GVhCnPJ8Ofv94EJcswR4mEZN9iQpUL6+Y7KbXXjLeemLgG+CxReFEybhHXyo?=
 =?us-ascii?Q?OqZF456ageuGHTHHWsyi1KOzuZ50ENLX4+a0zuOrTbIj2vDJe1oYJaWV765b?=
 =?us-ascii?Q?cZDj2PX4P5DwkoKLdjIGchxUX1CSh0g8eOe3gqE1JozrzaJhtY1RMZGhsakV?=
 =?us-ascii?Q?s9n3UwNdwpzLU3KiJwPz0+IfHv4Z1C3boOQt9i5uSmhkSgmYd1ZIMu0efwde?=
 =?us-ascii?Q?n0dXfd12JXoMCSH5+HYvXKu7zYtTWErvSgK7lsDoAJgXmYveo5U2RZVx9epK?=
 =?us-ascii?Q?iPV3gaFkHis1jCXSlEskXEXi5srhQOMSUWSNR8zmRgSZ6Y/03u1i2Z694j8Z?=
 =?us-ascii?Q?t1qHSEGYXwa3p9OOa150Um2OxEosV7MgxuVJr86NQo4P3z/cxyx5J+jshx6y?=
 =?us-ascii?Q?/V+SW5aTu+BDaOt9Yx8Y9KCngD94tUu7AfKmGvzQdsNUCASmfF1t6RR+zajn?=
 =?us-ascii?Q?V3rIyulA7Nc41msyYBeZImpDbCaVDQNkj2zcdgapXZp9gdVHEIddbW8o0Eiw?=
 =?us-ascii?Q?5b/Z8/939Yd5Mu1IWX7mCVvPZ27XrG69g1rjHJxG4fesNB9MhPbpbP//4Xy9?=
 =?us-ascii?Q?4mwv05bZDXtk9ZiN8vXPOZLayzX3w+PmUjeW+ZBAVa2V8yvIcVPf2bMjKaid?=
 =?us-ascii?Q?bYewzEAQAZb7shVLEZjLa0hkX2vRLAIiVUVTrJ/m+RvFzwaHq3oMl/XhQDmh?=
 =?us-ascii?Q?Z3Pjb5fMuHrKZA+z4+MmcLhSZOtxOBLI/5VhC/84gmOGrE6wboT+luID673f?=
 =?us-ascii?Q?r94zoKMikxg5QNQqOWn5Z9Qdl4IOAO0uldf1QZK2P2ehGliBxkhcFnA1+AHP?=
 =?us-ascii?Q?as2LJS+zxLRMhbK/DZPJr/S42iQX/PnAoECCBlWFixLdyZSXjstdelpDjgY9?=
 =?us-ascii?Q?zwhW+FNzQ5QDoUaX44rga7N2buLCgD0lTDPR+t/U47ANtDmteWPhPUNLRnIc?=
 =?us-ascii?Q?rI+uLLk9+sTWg7llDML3/Jb81sVY+0C/8hPePNI8fRXJzP5Yeu77emDIVRnG?=
 =?us-ascii?Q?K6Hdfc9964OEP/uqOkF/l25XZ2JuVBqE/+GGWWewy5mC9JR/kaL/ySM2LE+F?=
 =?us-ascii?Q?zu4i68VeRrAgIgkrRbWJ30tjvZ8P0K3RvSnzqPcyPEU1PtR+FiUcZ/tiNFva?=
 =?us-ascii?Q?oICWBibzg1K+7SCtFqb+UTMU/q0nbkviB0X5fEBzGZHMPBe15D6+UdOdTJRp?=
 =?us-ascii?Q?qh3mwfiNNxRRp303pgBz9l6o/nQtPXliIT5HlFOkOuOqXCGB1MgMZTQRsgOw?=
 =?us-ascii?Q?ybB+vvBIfIBE53UdB1FAqzRBQ2PH7al9EtFP0z6Uuq2kvU9wqd2tLO+/s+wD?=
 =?us-ascii?Q?IiJIdZzkoz4CAyFhPqKfAS8JQzMF7gT685oC7aM+lfTHE9Kmnil25XnUmqER?=
 =?us-ascii?Q?v80Bjl6oGcBJOJjvhIoyoGOkauyLZ4pCxPJOpPy1ICvc9ctFj+yEZ2pFlW7s?=
 =?us-ascii?Q?nfRzRJocy2apRRVAcV/Tc5Rva1lZrQ5Q3D7E7kHdqycIcRQ/2VdCUu5XoNXI?=
 =?us-ascii?Q?7dIEII929GfqlXzIfGVL+P9QCOwPZvMqrsx7kR3oIs265IjXEaucF17hUiuA?=
 =?us-ascii?Q?bB5p/YagVQ2xwRWTiFrjR7nZPA8UEfeTeLKZfApUi5wcDddQ6r8+LAKCtRI2?=
 =?us-ascii?Q?YoA7XDAoVI+3susBk7YYmFDKikuk2OtqwNOu9R4lo09/6jHjLXDAe+W7TNM2?=
 =?us-ascii?Q?Gu2x1eQQOw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2968ea21-c452-4523-9f98-08df30f8f87b
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 11:29:58.9880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9dSSdrY/8CKPSL90EbHe1vTTvQigMMOhArwlZvjmxpNZjRguUGZfhxNhkEM5ZRRSotvnmF2fGeKbrCcR49Am5YMTjtP38qGQgHPY2TFBZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 11:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248546
Content-Type: text/plain; charset="utf-8"

NEWS: https://github.com/strace/strace/blob/v7.3/NEWS

- Fix indentation for SRC_URI
- Refresh existing patches
- Add 0001-Handle-both-bpf-link-and-bpf_link-anon_inode-names.patch for pte=
st fix
  PR is still open https://github.com/strace/strace/pull/429

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Testsuite summary for strace 7.3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
 TOTAL: 1525
 PASS:  1172
 SKIP:  352
 XFAIL: 0
 FAIL:  1
 XPASS: 0
 ERROR: 0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...f-link-and-bpf_link-anon_inode-names.patch | 135 ++++++++++++++++++
 ...toconf-macro-to-detect-largefile-sup.patch |   4 +-
 ...kport-ax_prog_cc_for_build.m4-macros.patch |   2 +-
 ...001-strace-fix-reproducibilty-issues.patch |  12 +-
 ...002-tests-Replace-off64_t-with-off_t.patch |   2 +-
 .../strace/strace/Makefile-ptest.patch        |   6 +-
 .../strace/strace/ptest-spacesave.patch       |   6 +-
 .../strace/strace/skip-load.patch             |   2 +-
 .../strace/strace/update-gawk-paths.patch     |   2 +-
 .../strace/{strace_7.2.bb =3D> strace_7.3.bb}   |   5 +-
 10 files changed, 156 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-Handle-both-bp=
f-link-and-bpf_link-anon_inode-names.patch
 rename meta/recipes-devtools/strace/{strace_7.2.bb =3D> strace_7.3.bb} (92=
%)

diff --git a/meta/recipes-devtools/strace/strace/0001-Handle-both-bpf-link-=
and-bpf_link-anon_inode-names.patch b/meta/recipes-devtools/strace/strace/0=
001-Handle-both-bpf-link-and-bpf_link-anon_inode-names.patch
new file mode 100644
index 00000000000..4e5235b9683
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-Handle-both-bpf-link-and-bpf=
_link-anon_inode-names.patch
@@ -0,0 +1,135 @@
+From fa20cc5e8c736ec606efaa18427f0fd49cc45d12 Mon Sep 17 00:00:00 2001
+From: Zkingom <15024777017@163.com>
+Date: Thu, 22 Oct 2026 19:20:15 +0800
+Subject: [PATCH] Handle both "bpf-link" and "bpf_link" anon_inode names fo=
r
+ BPF links
+
+The kernel uses two different anon_inode name strings for BPF link file
+descriptors due to an inconsistency introduced across two commits:
+
+- commit 70ed506c3bbc ("bpf: Introduce pinnable bpf_link abstraction")
+  introduced bpf_link_new_fd() with anon_inode_getfd("bpf-link", ...),
+  matching the naming convention used by other BPF objects ("bpf-map",
+  "bpf-prog", "bpf-stats").
+- commit babf3164095b ("bpf: Add bpf_link_new_file that doesn't install
+  FD") added bpf_link_new_file(), later renamed to bpf_link_prime(),
+  with anon_inode_getfile("bpf_link", ...), using an underscore instead
+  of a hyphen.
+
+As a result, BPF link file descriptors appear as anon_inode:bpf-link
+when obtained via BPF_LINK_GET_FD_BY_ID or BPF_OBJ_GET from bpffs, and
+as anon_inode:bpf_link when returned by BPF_LINK_CREATE.
+
+Recognize both names to correctly identify BPF link descriptors
+regardless of how they were obtained.
+
+* src/bpf.c (print_bpf_obj_info): Recognize anon_inode:bpf_link.
+* tests/bpf-obj_get_info_by_fd-link.c (main): Obtain the link fd
+path dynamically and skip when procfs is unavailable.
+* tests/gen_tests.in (bpf-obj_get_info_by_fd-link): Filter out
+setup calls preceding the information query.
+* NEWS: Mention the fix.
+
+Signed-off-by: Xu Zhou <15024777017@163.com>
+Signed-off-by: Zkingom <15024777017@163.com>
+Assisted-by: Codex:GPT-6.1-Sol
+
+Upstream-Status: Submitted [https://github.com/strace/strace/pull/429]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ NEWS                                |  8 ++++++++
+ src/bpf.c                           |  3 ++-
+ tests/bpf-obj_get_info_by_fd-link.c | 11 ++++++++---
+ tests/gen_tests.in                  |  2 +-
+ 4 files changed, 19 insertions(+), 5 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index eb5465a66c..da93026b4f 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,3 +1,11 @@
++Noteworthy changes in release ?.? (????-??-??)
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
++
++* Bug fixes
++
++  * Fixed decoding of BPF_OBJ_GET_INFO_BY_FD for BPF links created by
++    BPF_LINK_CREATE.
++
+ Noteworthy changes in release 7.3 (2026-10-22)
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=20
+diff --git a/src/bpf.c b/src/bpf.c
+index 3b09f45955..1498d5c0f2 100644
+--- a/src/bpf.c
++++ b/src/bpf.c
+@@ -1662,7 +1662,8 @@ print_bpf_obj_info(struct tcb * const tcp, uint32_t =
bpf_fd, uint64_t info,
+ 	} obj_printers[] =3D {
+ 		{ "anon_inode:bpf-map", print_bpf_map_info },
+ 		{ "anon_inode:bpf-prog", print_bpf_prog_info },
+-		{ "anon_inode:bpf-link", print_bpf_link_info }
++		{ "anon_inode:bpf-link", print_bpf_link_info },
++		{ "anon_inode:bpf_link", print_bpf_link_info }
+ 	};
+=20
+ 	if (entering(tcp)) {
+diff --git a/tests/bpf-obj_get_info_by_fd-link.c b/tests/bpf-obj_get_info_=
by_fd-link.c
+index 9536f0222f..c5f60ffc95 100644
+--- a/tests/bpf-obj_get_info_by_fd-link.c
++++ b/tests/bpf-obj_get_info_by_fd-link.c
+@@ -14,6 +14,7 @@
+ #include <stddef.h>
+ #include <stdio.h>
+ #include <stdint.h>
++#include <stdlib.h>
+ #include <string.h>
+ #include <unistd.h>
+=20
+@@ -43,6 +44,8 @@ sys_bpf(kernel_ulong_t cmd, void *attr, kernel_ulong_t s=
ize)
+ int
+ main(void)
+ {
++	skip_if_unavailable("/proc/self/fd/");
++
+ 	static const struct bpf_insn cgroup_prog[] =3D {
+ 		{ /* r0 =3D 1 (allow) */
+ 			.code    =3D BPF_ALU64 | BPF_K | BPF_MOV,
+@@ -97,10 +100,11 @@ main(void)
+ 	if (ret < 0)
+ 		perror_msg_and_skip("BPF_OBJ_GET_INFO_BY_FD");
+=20
++	char *link_fd_path =3D get_fd_path(link_fd);
+ 	printf("bpf(BPF_OBJ_GET_INFO_BY_FD"
+-	       ", {info=3D{bpf_fd=3D%d<anon_inode:bpf-link>"
++	       ", {info=3D{bpf_fd=3D%d<%s>"
+ 	       ", info_len=3D%zu",
+-	       link_fd, LINK_INFO_SZ);
++	       link_fd, link_fd_path, LINK_INFO_SZ);
+ 	if (get_info_attr.info_len !=3D LINK_INFO_SZ)
+ 		printf(" =3D> %u", get_info_attr.info_len);
+ 	printf(", info=3D{type=3D");
+@@ -110,8 +114,9 @@ main(void)
+ 	printf(", cgroup=3D{cgroup_id=3D%" PRIu64, link_info->cgroup.cgroup_id);
+ 	printf(", attach_type=3D");
+ 	printxval(bpf_attach_type, link_info->cgroup.attach_type, "BPF_???");
+-	printf("}}}, %zu) =3D %s\n", sizeof(get_info_attr), errstr);
++	printf("}}}}, %zu) =3D %s\n", sizeof(get_info_attr), errstr);
+=20
++	free(link_fd_path);
+ 	puts("+++ exited with 0 +++");
+ 	return 0;
+ }
+diff --git a/tests/gen_tests.in b/tests/gen_tests.in
+index 71393c72a6..6bf0e91db9 100644
+--- a/tests/gen_tests.in
++++ b/tests/gen_tests.in
+@@ -31,7 +31,7 @@ arch_prctl-success-Xverbose	+prctl-success.sh ARCH_PRCTL=
_INJECT_RETVALS=3D"0 1 2 3
+ at_fdcwd-pathmax	-a36 --trace=3Dopenat -y -P sample
+ bpf	-a20
+ bpf-obj_get_info_by_fd	-a20 -y -e trace=3Dbpf
+-bpf-obj_get_info_by_fd-link	-a20 -y -v -e trace=3Dbpf
++bpf-obj_get_info_by_fd-link	-a20 -y -v -e trace=3Dbpf "QUIRK:START-OF-TES=
T-OUTPUT:bpf(BPF_OBJ_GET_INFO_BY_FD"
+ bpf-obj_get_info_by_fd-prog	-a20 -y -e trace=3Dbpf
+ bpf-obj_get_info_by_fd-prog-v	-a20 -y -v -e trace=3Dbpf
+ bpf-obj_get_info_by_fd-v	-a20 -y -v -e trace=3Dbpf
diff --git a/meta/recipes-devtools/strace/strace/0001-configure-Use-autocon=
f-macro-to-detect-largefile-sup.patch b/meta/recipes-devtools/strace/strace=
/0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch
index 25f32d17348..ebcd316e9fb 100644
--- a/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro=
-to-detect-largefile-sup.patch
+++ b/meta/recipes-devtools/strace/strace/0001-configure-Use-autoconf-macro=
-to-detect-largefile-sup.patch
@@ -1,4 +1,4 @@
-From 334b66af1329bc6970c9ff9ee668af6cc2133b8f Mon Sep 17 00:00:00 2001
+From dff502ff4ae95a310ea10eeda0aaf5626de3890b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:54:27 -0800
 Subject: [PATCH] configure: Use autoconf macro to detect largefile support
@@ -13,7 +13,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+)
=20
 diff --git a/configure.ac b/configure.ac
-index 956bb85..0812725 100644
+index 9bec14b..57406f5 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -43,6 +43,8 @@ AC_PROG_INSTALL
diff --git a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_c=
c_for_build.m4-macros.patch b/meta/recipes-devtools/strace/strace/0001-m4-B=
ackport-ax_prog_cc_for_build.m4-macros.patch
index 60e51411973..478bb7b9d9b 100644
--- a/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_b=
uild.m4-macros.patch
+++ b/meta/recipes-devtools/strace/strace/0001-m4-Backport-ax_prog_cc_for_b=
uild.m4-macros.patch
@@ -1,4 +1,4 @@
-From b402cfcdfb782ab3a8b264b23536a4de5f709746 Mon Sep 17 00:00:00 2001
+From de4d51c010e12a8c843dd3e241e392cd8cbcc6ca Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:39:47 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducib=
ilty-issues.patch b/meta/recipes-devtools/strace/strace/0001-strace-fix-rep=
roducibilty-issues.patch
index 4907b16a1c7..8a8b18d698e 100644
--- a/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-is=
sues.patch
+++ b/meta/recipes-devtools/strace/strace/0001-strace-fix-reproducibilty-is=
sues.patch
@@ -1,4 +1,4 @@
-From 5905b406c5325442f2001339937ad22b2d068b15 Mon Sep 17 00:00:00 2001
+From a99f2283ed13b03185b67ddda507aed3aa0f595e Mon Sep 17 00:00:00 2001
 From: Jeremy Puhlman <jpuhlman@mvista.com>
 Date: Wed, 11 Mar 2020 19:56:55 +0000
 Subject: [PATCH] strace: fix reproducibilty issues
@@ -13,19 +13,19 @@ Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/tests/gen_tests.sh b/tests/gen_tests.sh
-index 3c6228a..43b94ea 100755
+index d71e1c1..c191673 100755
 --- a/tests/gen_tests.sh
 +++ b/tests/gen_tests.sh
-@@ -46,7 +46,7 @@ while read -r name arg0 args; do {
+@@ -52,7 +52,7 @@ while read -r name arg0 args; do {
 =20
  	hdr=3D"\
  #!/bin/sh -efu
 -# Generated by $0 from $input ($name $arg0 $args); do not edit."
 +# Generated by $(basename $0) from $input ($name $arg0 $args); do not edi=
t."
 =20
- 	case "$arg0" in
- 		+*)
-@@ -102,7 +102,7 @@ while read -r name arg0 args; do {
+ 	# A generated test may be sourced while another build regenerates it.
+ 	# Replace the file atomically so the reader keeps its original contents.
+@@ -112,7 +112,7 @@ while read -r name arg0 args; do {
 =20
  if [ -n "$names" ]; then
  	{
diff --git a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t=
-with-off_t.patch b/meta/recipes-devtools/strace/strace/0002-tests-Replace-=
off64_t-with-off_t.patch
index e7842688550..88a81519bf9 100644
--- a/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-o=
ff_t.patch
+++ b/meta/recipes-devtools/strace/strace/0002-tests-Replace-off64_t-with-o=
ff_t.patch
@@ -1,4 +1,4 @@
-From bcca8619f749ba78a4ce78d39c603e2606175175 Mon Sep 17 00:00:00 2001
+From 85eb02371ea47e79f912fa03dbe03c849c093b36 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 15 Dec 2022 15:56:13 -0800
 Subject: [PATCH] tests: Replace off64_t with off_t
diff --git a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch b/met=
a/recipes-devtools/strace/strace/Makefile-ptest.patch
index 1e3c8ee2aa8..0352a82234b 100644
--- a/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
+++ b/meta/recipes-devtools/strace/strace/Makefile-ptest.patch
@@ -1,4 +1,4 @@
-From 2749699b77b4fcce7e6e960f246259b05f3dafcc Mon Sep 17 00:00:00 2001
+From f7ad423f864c5f882c7e220f564a21e9421ac73b Mon Sep 17 00:00:00 2001
 From: Gabriel Barbu <gabriel.barbu@enea.com>
 Date: Thu, 25 Jul 2013 15:28:33 +0200
 Subject: [PATCH] strace: Add ptest
@@ -13,7 +13,7 @@ Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
  1 file changed, 20 insertions(+)
=20
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 84a9638..23fd218 100644
+index 12b63b2..1ddf782 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -18,6 +18,7 @@ SIZEOF_LONG =3D @SIZEOF_LONG@
@@ -24,7 +24,7 @@ index 84a9638..23fd218 100644
  AM_CFLAGS =3D $(WARN_CFLAGS) $(TEST_WARN_CFLAGS)
  bundled_CPPFLAGS =3D
  if USE_BUNDLED_HEADERS
-@@ -968,3 +969,22 @@ check-valgrind-local: $(check_LIBRARIES) $(check_PROG=
RAMS)
+@@ -982,3 +983,22 @@ check-valgrind-local: $(check_LIBRARIES) $(check_PROG=
RAMS)
  CLEANFILES =3D ksysent.h
 =20
  include ../src/scno.am
diff --git a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch b/me=
ta/recipes-devtools/strace/strace/ptest-spacesave.patch
index 00f404c0036..3f6289d3a1a 100644
--- a/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
+++ b/meta/recipes-devtools/strace/strace/ptest-spacesave.patch
@@ -1,4 +1,4 @@
-From ae538d4dcb0ea7265d72671b7dd3537ca1356437 Mon Sep 17 00:00:00 2001
+From 0bcea4d97bdbfba5920ceb56215a911c9d529dc6 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 29 May 2019 00:10:32 +0100
 Subject: [PATCH] strace: Tweak ptest disk space management
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [specific to OE image sp=
ace issues]
  1 file changed, 1 insertion(+)
=20
 diff --git a/tests/gen_tests.sh b/tests/gen_tests.sh
-index f22ad08..3c6228a 100755
+index 2a7fada..d71e1c1 100755
 --- a/tests/gen_tests.sh
 +++ b/tests/gen_tests.sh
-@@ -84,6 +84,7 @@ while read -r name arg0 args; do {
+@@ -93,6 +93,7 @@ while read -r name arg0 args; do {
  		$hdr
  		. "\${srcdir=3D.}/init.sh"
  		run_strace_match_diff $arg0 $args
diff --git a/meta/recipes-devtools/strace/strace/skip-load.patch b/meta/rec=
ipes-devtools/strace/strace/skip-load.patch
index 610dd94fe9d..cab890f1482 100644
--- a/meta/recipes-devtools/strace/strace/skip-load.patch
+++ b/meta/recipes-devtools/strace/strace/skip-load.patch
@@ -1,4 +1,4 @@
-From 2653515537b66a4b1286be107e9ef406c55040b4 Mon Sep 17 00:00:00 2001
+From 5c9048988e5000fb0f175afde05a23be2ef0fa15 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Sat, 30 Aug 2025 00:47:03 +0200
 Subject: [PATCH] strace: skip a number of load-sensitive tests
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/=
meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index 8895b0ff9e2..764f0af1163 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -1,4 +1,4 @@
-From be1b3d74ca4ffb3c8d3e38fdb96f23d5920f8ef1 Mon Sep 17 00:00:00 2001
+From 3c4da31783f127d18cf1b64ca33ac46a512da2cb Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Mon, 18 Jan 2016 11:01:00 -0800
 Subject: [PATCH] update gawk paths, /bin/gawk -> /usr/bin/gawk
diff --git a/meta/recipes-devtools/strace/strace_7.2.bb b/meta/recipes-devt=
ools/strace/strace_7.3.bb
similarity index 92%
rename from meta/recipes-devtools/strace/strace_7.2.bb
rename to meta/recipes-devtools/strace/strace_7.3.bb
index 3f7aaab3e6c..61c8b744b5e 100644
--- a/meta/recipes-devtools/strace/strace_7.2.bb
+++ b/meta/recipes-devtools/strace/strace_7.3.bb
@@ -14,12 +14,13 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/strace-=
${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-su=
p.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
-		   file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
+           file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
+           file://0001-Handle-both-bpf-link-and-bpf_link-anon_inode-names.=
patch \
            "
 SRC_URI:append:libc-musl =3D "\
            file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
            "
-SRC_URI[sha256sum] =3D "4bde6246926890dcee824f6e6ac42a06752f47d77e5097d86e=
3c0d6d4b709fe5"
+SRC_URI[sha256sum] =3D "529634c40910895a9a1f3c5c1e65da2ca9ed72fb158dfc4bcc=
89efdf05e39b72"
=20
 inherit autotools github-releases ptest
=20
