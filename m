Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40072.1793010714082523059
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=XMEDqzS/;
 spf=pass (domain: est.tech, ip: 52.101.65.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOYmz2qa4WLa8t3ECYAMw35z9n2eMP14fZfzbdKlHlX2bs/QmmrUPiuEQI82rmD1JsGQicgS/YjRIFpUU/zasORjul1WCitc0arOD0u4mZ7GIywOTfkGhowDTZhfbn/pCFcBc2+fRGF1hx5iaxn/5+UOZiRyGDnCRSzQ9FF0gq+ENT9MPRhWrfKrG1zxpl79wcvycHYtDlT1FO9BMavI/ya/gMU/FLX3HsN4IH9XdbAUGdDiRbG+2PvBRejc26e8g8jvTYKBEk5o2sJ6lyYBK7FSfwwlif2W3dNWY1KcmiKhen4VYVrXiEAhR0XK4NbkS5400000P2SwYAkpkFohWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwo+dO//WKxGDaylMozsZQlQA1gRZznoGSvT9dEyRzw=;
 b=NSECB4f7VMCmzPTJp2FLoT3XzFmTDAlQqLksaDqBEJo2dPNJyZ6h8j8FD3Q7taLBwtjvg/iohywuIGn1DSnj3lQg32bJyf1I6TwfGhRxsNHKzA/Sxopb0FDAj3fMieFx+siXPPsPRXp0SeIyXkhtKoC1WPbw9OILst4pt4lEfY94bzS/9nF6vU5JgnwTtW8pFUq9mlJwT8quCwNBq2owv2oaiuZ/0R+AKaVn5W7gArGHmYIq48+rIGQLb6l0EsObDcjVoQbdtMHPfutmGYvGPCBX2Pwab7GWepUXTM25R3AxO3Cy3n76/Bussa3HIjWrV7bzvQEQ5TFK4LHGgyGIhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwo+dO//WKxGDaylMozsZQlQA1gRZznoGSvT9dEyRzw=;
 b=XMEDqzS/JWENyMOtdFSOJzTe5dvh+hgiyAmeEzeTbwRNlztlkIkF+pn8TtAmF3Wb/CjWKKU5IfLgyLO0euJTpUDPnXoCu7xaIBqNhjx5GEISoRe3QRxKpRcsZtl78MkrMhvDuoCH4SupDikfN7G9BaEiIkzuCuDrVGtgHy9bfYm20eV7o7Zyad44xvVVKs3OWZxAHzansbpu630EDhEEeN2MPJ8Rsch0fzLYlinaGeE4ZZTC3+YEafbMzZPiW3ldaR6MVMJp9sWKGW/7rspY3nuJhbEGYzGUbA6a8cMtCTUYqj6Pvjh5rqVXiiDADkSSO7qUbEdCMr2+gmyb+BXNfA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA4P189MB1280.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 10:31:51 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 10:31:51 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/12] valgrind: upgrade 3.27.1 -> 3.28.0
Date: Mon, 26 Oct 2026 11:31:33 +0100
Message-ID: <20261026103138.3137-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
References: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P123CA0094.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA4P189MB1280:EE_
X-MS-Office365-Filtering-Correlation-Id: 53bf5fca-1102-4001-a7ea-08df334c591a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261009221727099003|261009223327099003|261009221227099003|261009223027099003|261009220027099003|261021130227099003|261021135927099003|261021133027099003|261022113327099003|261022115727099003|261022075727099003|261021121427099003|261021123027099003|261022105027099003|260925022911599003|260925021911599003|260925021311599003|10067099003|56012099006|3023799007|6133799003|12006099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: IxFDCx/AbYzoiyVOcFCEVE9DEteFo0bhAO6XHx4LslyEhaW26g28wE/0brEzOe06c4FVSnC4+8uz4jbANvW2fL7DMDCp06mEzS1Z05aDCccHlAFtCWb0jcbkQQsUySEnZzv8ExYgVnGv3LjMfZvVosDJQNKRC3Mi8CI+9tC5EDYqgjaqK9aZ/QdOx9WbR89hhpjuEhh49Z8NOMdPqJ60Rf8H0x/lGXZQi++Y1fdgp/anJYeIv2mSk/rpilvobymSfNqlQ4snieICs2fMsQG8FHk0tIR2ZCmCPiZtCK6dJ6fZdF0tUGqeGZbPgR3wqV6pTeZsz6JyVmcmuAEVWDUMfxrKck/YG6/LrKWr6TJK78grw0VgDY8XaLqQ1sULIkcf7DzI9FPwysSloXBLLrCE3qPpeCwWFV9k+TyuIESCF1KkjGMGW5B16Z/LlU/9pOzxAhEcpluAkN8J79/8idCxtL+AyjkRH58/z/Wo6pbISDGeaF5Y9iS41SitDbMjtry5K8kg8TnSSrOM7qdQ5xurC0Q/CzxVZTcoBWAjfhmQ1ZNcJQlM9oKrybYxzHvOD8lY51n/B0KXwcfP/3uO8m57YBN2knpzvDhCWjoVtPhWAg8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261009221727099003)(261009223327099003)(261009221227099003)(261009223027099003)(261009220027099003)(261021130227099003)(261021135927099003)(261021133027099003)(261022113327099003)(261022115727099003)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(56012099006)(3023799007)(6133799003)(12006099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vmzc2O59uRg4xAlZAXVNRjFxE5sx44m5tUKQYKuHZpC+KUm/+isEsCSVzuDj?=
 =?us-ascii?Q?OLPJ5iMdjRgx0A6wgCBa1XloyFZVu0LpX/6AlOP9yRVggx+u5lKXTvwoU38T?=
 =?us-ascii?Q?EWWu4i1tuDxoDHB55zvQmRXMz4qAPdrcGMk28sakhoyGuveT4BHuzCZLXgm4?=
 =?us-ascii?Q?FqypXCCBwcoO39yA6jHDj/WTRhIqj7UT1JFKroPOjBjrfQy0pYZv6QmSACFI?=
 =?us-ascii?Q?6dYqj+Ebx7Agm1/E30nWjql9vFRNs0ofGJ+yKVl9H36mez8IMyQK8GLFrDbJ?=
 =?us-ascii?Q?fS2GKOLSS2VQbXU0k75WAzsmy2QeJsOyJlzUbEzpozRjxqyG3/SRrGq/HN7n?=
 =?us-ascii?Q?BAZskci8EHCTMCaxpgjBb/jK2ndJuL7SS59OXrHlN5o3uu0FSlnUAAagTvFh?=
 =?us-ascii?Q?PbwtQvfjVUafBfz9iJTcmpfImxdMQH46DRtt7Kv2GtoUmHhuq43KXAX607KU?=
 =?us-ascii?Q?+8MuXmXfrbeUsX2F87EvDEeLcaEZhb5KzriaWqAP5iJ2fBovFU1d9ab9vVYv?=
 =?us-ascii?Q?Y3s8M+LybHl/kpEk9dyU/CLYwVCNi3IoYYmarbXxt10mA2t8TCKYbN8X59Eb?=
 =?us-ascii?Q?+zrBDJjYBj4tWEelv+gyX4EAKomeX43F6Dkh99hE5qc861I9lGyBhnsw7OZB?=
 =?us-ascii?Q?To3jPvVKS7qt9BplqXWl6SHFDMShKBb/xnPK0O/U1Om8BJITFbI1ZN91KWgL?=
 =?us-ascii?Q?W5UBxGULMUDOxg9xkGOuxixe0Nm2wXXUj2sJKfZRMIv+LzJEY3mMGAnq8J08?=
 =?us-ascii?Q?xU0s11sLiZonq30fz0exVsyu5yJEERGH/BYrmia8Hl5yGdmvhXQqDyjhsKI+?=
 =?us-ascii?Q?CkfG5mz1awj8oV4Xu8G4D2kFkDxVn3HI0+o1qjGgPMC9w9Nrp7xY1lki9nHf?=
 =?us-ascii?Q?EsqIeMqeM5CoSiXL3kHMWeYdct/Rln6WhNQmddVYj8f5w94LhxwDMl2SrAqA?=
 =?us-ascii?Q?pt5Y7l/ECbcbkZMsMmW6FMSAI24Ws8bYtvdPqz5TDk6aTda1fZG7MoqkpUlQ?=
 =?us-ascii?Q?vRpnje132mFHw8lbp9OZfYtqhanIDpBsFd6Q6z29z5EpO+m8VU9EcBb6ENwW?=
 =?us-ascii?Q?AvM7Zv6d3LqlKL92MwP00Z4iL05aITvBfGvkhAY08MxNJ3V4DBlAKICm5VQM?=
 =?us-ascii?Q?QG0FRTRr7WuS5nheG++NGSHXrcMNFPr62y9cFxji/Gs63vF3HvHXN+5trIVq?=
 =?us-ascii?Q?FFIsZrn8XRWXUCl0jMaznepZ25XssfDRfd8rVtfDtYxQLInv565CXV+7pkOu?=
 =?us-ascii?Q?Ty3Hg98k88+ZoAgIaTE9Yzddtf+yzGPDkVtUX7kjjZfKdu5pLeEphXJNgKYk?=
 =?us-ascii?Q?rPSjdyn/bFORsRjAVYbdnpPaS/yXqROY4rOSfzQT/Kyfl+umk9nTe1zv8pa7?=
 =?us-ascii?Q?DJyWc9POrtunvNkjuXuee0vKliMMX3Dk5MrgFnfcbVIPWpJIGDtTuecY+kDA?=
 =?us-ascii?Q?J4u4vuOrQth1vC39+SCqmNrzwNNfLDQge+n5srW4wH/5v4gX6Alk9jCzUAR1?=
 =?us-ascii?Q?NRWNjT1LIgkix6RQLcVgPnASRSVOzMNaJnRSXJxoncCQUpdRCeOHnIt8WQg2?=
 =?us-ascii?Q?un3QcBshvevbeFWT9RSanoQkrKlpjA4WoGDbdkcmfShDN8+gdv/QfOJS1K1C?=
 =?us-ascii?Q?x8PtsmIvMAthNHsssIkDKEjWUXIDuZwyScQjJ9VZhV6Bd6iwiIvOHuc0Tjt2?=
 =?us-ascii?Q?daFXt7mSiND+eGC52sVH98u+P6XaOW4Beg3c+stEypj7BP+tkwN5UE30aEWt?=
 =?us-ascii?Q?or+qk7fuHg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 53bf5fca-1102-4001-a7ea-08df334c591a
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 10:31:51.6971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FjZLxW4as3a6l2nuy4pmK/d/anB4dEjy2v/9BTvELcV4ooURVhtAQQVEcmioxYvaP4fa4tOEBbsFc1UEbTeqGCwYzdo8ulvcROrP6LBRee0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1280
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 10:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248666
Content-Type: text/plain; charset="utf-8"

ReleaseNotes: https://valgrind.org/docs/manual/dist.news.html

- Backport patch to fix  arm64 test probes when cross-compiling
  0001-Bug-5277723-configure.ac-do-not-fail-the-arm64-test-.patch

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...igure.ac-do-not-fail-the-arm64-test-.patch | 49 +++++++++++++++++++
 ...e-Drop-setting-mcpu-cortex-a8-on-arm.patch |  6 +--
 .../0001-docs-Disable-manual-validation.patch |  6 +--
 ...c-workaround-off64_t-not-defined-in-.patch |  8 ++-
 ...etting-mcpu-to-cortex-a8-on-arm-arch.patch | 12 ++---
 ...check-tests-Fix-timerfd-syscall-test.patch | 10 ++--
 ...-vgtests-remove-fullpath-after-flags.patch |  2 +-
 ...eak_cmsg.stderr.exp-adjust-tmp-paths.patch |  2 +-
 ...ame-_sifields-to-__si_fields-on-musl.patch |  2 +-
 .../0001-tests-arm-Use-O-instead-of-O0.patch  |  6 +--
 ...-filter_xml_frames-do-not-filter-usr.patch |  2 +-
 ...-include-directive-path-for-config.h.patch |  2 +-
 ...t-for-PPC-instructions-mfatbu-mfatbl.patch | 10 ++--
 ...n-for-targets-which-don-t-support-it.patch |  2 +-
 .../valgrind/valgrind/fixed-perl-path.patch   |  8 +--
 .../valgrind/valgrind/s390x_vec_op_t.patch    |  6 +--
 ...te-march-mcpu-mfpu-for-ARM-test-apps.patch |  6 +--
 ...-ld-XXX.so-strlen-intercept-optional.patch |  6 +--
 ...{valgrind_3.27.1.bb =3D> valgrind_3.28.0.bb} |  4 +-
 19 files changed, 99 insertions(+), 50 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Bug-527772=
3-configure.ac-do-not-fail-the-arm64-test-.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.27.1.bb =3D> valgrind_3.=
28.0.bb} (96%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Bug-5277723-confi=
gure.ac-do-not-fail-the-arm64-test-.patch b/meta/recipes-devtools/valgrind/=
valgrind/0001-Bug-5277723-configure.ac-do-not-fail-the-arm64-test-.patch
new file mode 100644
index 00000000000..01cc6eec4c4
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Bug-5277723-configure.ac=
-do-not-fail-the-arm64-test-.patch
@@ -0,0 +1,49 @@
+From c40ce55b02b89b31a0bed9e0d2586be80681de64 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sat, 24 Oct 2026 12:00:00 +1100
+Subject: [PATCH] Bug 5277723 - configure.ac: do not fail the arm64 test pr=
obes
+ when cross-compiling
+
+Commit cd8a547aa changed the dotprod probe from AC_COMPILE_IFELSE to
+AC_RUN_IFELSE and commit 938c24838 added the crypto probe as
+AC_RUN_IFELSE, neither with an action for cross-compiling. autoconf
+then aborts configure with "cannot run test program while cross
+compiling" for every target, not just arm64, as the probes are not
+guarded by the architecture.
+
+Both only decide whether the matching regression tests are built, so
+answer no when the test program cannot be run.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dvalgrind.git;h=
=3D74e91f2970fc90a76f616c679a81b98e1f303257]
+
+Notes: Drop NEWS change for backport
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ configure.ac | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 60c3861da..c1dbcbab7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4144,6 +4144,9 @@ AC_MSG_RESULT([yes])
+ ], [
+ ac_have_armv82_dotprod_feature=3Dno
+ AC_MSG_RESULT([no])
++], [
++ac_have_armv82_dotprod_feature=3Dno
++AC_MSG_RESULT([cross compiling, assuming no])
+ ])
+ CFLAGS=3D"$save_CFLAGS"
+=20
+@@ -4164,6 +4167,9 @@ AC_MSG_RESULT([yes])
+ ], [
+ ac_have_armv8_crypto=3Dno
+ AC_MSG_RESULT([no])
++], [
++ac_have_armv8_crypto=3Dno
++AC_MSG_RESULT([cross compiling, assuming no)])
+ ])
+ CFLAGS=3D"$save_CFLAGS"
+=20
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-se=
tting-mcpu-cortex-a8-on-arm.patch b/meta/recipes-devtools/valgrind/valgrind=
/0001-configure-Drop-setting-mcpu-cortex-a8-on-arm.patch
index 3c8bec82b3d..105a2c3995b 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-m=
cpu-cortex-a8-on-arm.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-configure-Drop-setting-m=
cpu-cortex-a8-on-arm.patch
@@ -1,4 +1,4 @@
-From 5a776e61af5ab7f0cfd10cde55c796189686916f Mon Sep 17 00:00:00 2001
+From d8ebc7316648ad5880ef91c58ff88a21bbf33a3b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 10 May 2024 16:27:34 -0700
 Subject: [PATCH] configure: Drop setting mcpu=3Dcortex-a8 on arm
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/configure.ac b/configure.ac
-index 2dfbd1c..b42fdd4 100755
+index 60c3861..fcfe8e2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -251,13 +251,13 @@ case "${host_cpu}" in
+@@ -309,13 +309,13 @@ case "${host_cpu}" in
 =20
       armv8*)
          AC_MSG_RESULT([ok (${host_cpu})])
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manu=
al-validation.patch b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Dis=
able-manual-validation.patch
index fbd799eeea6..0111d5708e4 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-vali=
dation.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-docs-Disable-manual-vali=
dation.patch
@@ -1,4 +1,4 @@
-From 4f674f458b1f0675abdc0ced01239e99bfa40de8 Mon Sep 17 00:00:00 2001
+From b5f080fac99a060ff5bbd97ee6c84e8b92a57365 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 13 Jan 2022 18:26:02 -0800
 Subject: [PATCH] docs: Disable manual validation
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/docs/Makefile.am b/docs/Makefile.am
-index 68a3da5..9833d5c 100644
+index 8b3f55c..61a6e45 100644
 --- a/docs/Makefile.am
 +++ b/docs/Makefile.am
-@@ -202,7 +202,7 @@ valid-manpages: $(MANPAGES_XML_FILES)
+@@ -225,7 +225,7 @@ valid-manpages: $(MANPAGES_XML_FILES)
  	  fi \
  	fi
 =20
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c=
-workaround-off64_t-not-defined-in-.patch b/meta/recipes-devtools/valgrind/=
valgrind/0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch
index 6afb6d79ded..9889a06c625 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c-workar=
ound-off64_t-not-defined-in-.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c-workar=
ound-off64_t-not-defined-in-.patch
@@ -1,7 +1,7 @@
-From 8c2313226de5171dd6724c1878a679b556b6cab4 Mon Sep 17 00:00:00 2001
+From 286f86a330efc0d38bb60cc47e9163cc2783f310 Mon Sep 17 00:00:00 2001
 From: Alyssa Ross <hi@alyssa.is>
 Date: Sun, 2 Nov 2025 16:43:47 +0100
-Subject: [PATCH v2] Avoid Glibc-specific ino64_t/off64_t
+Subject: [PATCH] Avoid Glibc-specific ino64_t/off64_t
=20
 The *64_t types are transitional APIs for applications that do not yet
 fully support large files on 32-bit platforms.  musl no longer
@@ -21,7 +21,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 3 insertions(+), 2 deletions(-)
=20
 diff --git a/none/tests/linux/getdents_filter.c b/none/tests/linux/getdent=
s_filter.c
-index 361659f51..4f46a6ea2 100644
+index 361659f..4f46a6e 100644
 --- a/none/tests/linux/getdents_filter.c
 +++ b/none/tests/linux/getdents_filter.c
 @@ -2,6 +2,7 @@
@@ -43,5 +43,3 @@ index 361659f51..4f46a6ea2 100644
      unsigned short d_reclen;
      unsigned char  d_type;
      char           d_name[];
---=20
-2.51.0
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-se=
tting-mcpu-to-cortex-a8-on-arm-arch.patch b/meta/recipes-devtools/valgrind/=
valgrind/0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch
index f8d1e87ba96..866dee3165f 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-m=
cpu-to-cortex-a8-on-arm-arch.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-makefiles-Drop-setting-m=
cpu-to-cortex-a8-on-arm-arch.patch
@@ -1,4 +1,4 @@
-From c878aaacadf8ec723be882f9335cb33240df13d6 Mon Sep 17 00:00:00 2001
+From 95f0afde244178821847030ea3efd1996c9f9142 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Apr 2017 10:11:16 -0700
 Subject: [PATCH] makefiles: Drop setting -mcpu to cortex-a8 on arm
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 12 insertions(+), 12 deletions(-)
=20
 diff --git a/helgrind/tests/Makefile.am b/helgrind/tests/Makefile.am
-index 7adc5c6..cac23c9 100755
+index bfdb3ff..3bd5569 100644
 --- a/helgrind/tests/Makefile.am
 +++ b/helgrind/tests/Makefile.am
-@@ -226,9 +226,9 @@ if ! VGCONF_PLATFORMS_INCLUDE_X86_DARWIN
+@@ -218,9 +218,9 @@ if ! VGCONF_PLATFORMS_INCLUDE_X86_DARWIN
  endif
 =20
  if VGCONF_PLATFORMS_INCLUDE_ARM_LINUX
@@ -36,10 +36,10 @@ index 7adc5c6..cac23c9 100755
  annotate_hbefore_CFLAGS =3D $(AM_CFLAGS)
  tc07_hbl1_CFLAGS        =3D $(AM_CFLAGS)
 diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
-index 41a5a03..a76981e 100644
+index d197575..f452d69 100644
 --- a/none/tests/arm/Makefile.am
 +++ b/none/tests/arm/Makefile.am
-@@ -56,10 +56,10 @@ allexec_CFLAGS		=3D $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
+@@ -55,10 +55,10 @@ allexec_CFLAGS		=3D $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
  # need special helping w.r.t -mfpu and -mfloat-abi, though.
  # Also force -O0 since -O takes hundreds of MB of memory=20
  # for v6intThumb.c.
@@ -53,7 +53,7 @@ index 41a5a03..a76981e 100644
 =20
  v8crypto_a_CFLAGS =3D $(AM_CFLAGS) -g -O0 -mfpu=3Dcrypto-neon-fp-armv8 -m=
arm -march=3Darmv8-a
  v8crypto_t_CFLAGS =3D $(AM_CFLAGS) -g -O0 -mfpu=3Dcrypto-neon-fp-armv8 -m=
thumb -march=3Darmv8-a
-@@ -74,23 +74,23 @@ v8memory_t_CFLAGS =3D $(AM_CFLAGS) -g -O0 \
+@@ -73,23 +73,23 @@ v8memory_t_CFLAGS =3D $(AM_CFLAGS) -g -O0 \
 =20
  vcvt_fixed_float_VFP_CFLAGS =3D $(AM_CFLAGS) -g -O0 -mcpu=3Dcortex-a8 -mf=
pu=3Dneon
 =20
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fi=
x-timerfd-syscall-test.patch b/meta/recipes-devtools/valgrind/valgrind/0001=
-memcheck-tests-Fix-timerfd-syscall-test.patch
index 200b2602cbb..e362ae6f88b 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timer=
fd-syscall-test.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-tests-Fix-timer=
fd-syscall-test.patch
@@ -1,4 +1,4 @@
-From 3a51ed107f67732910dec12279a9279e158afbe7 Mon Sep 17 00:00:00 2001
+From 7676a737160ddd450b2d22f7f96d7f445c65cabb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 9 Mar 2020 16:30:19 -0700
 Subject: [PATCH] memcheck/tests: Fix timerfd syscall test
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 15 insertions(+), 3 deletions(-)
=20
 diff --git a/config.h.in b/config.h.in
-index 00db1a6..23fd77a 100644
+index 7db71e8..8800fc9 100644
 --- a/config.h.in
 +++ b/config.h.in
-@@ -409,6 +409,9 @@
+@@ -442,6 +442,9 @@
  /* Define to 1 if you have the <sys/sysnvl.h> header file. */
  #undef HAVE_SYS_SYSNVL_H
 =20
@@ -30,10 +30,10 @@ index 00db1a6..23fd77a 100644
  #undef HAVE_SYS_TIME_H
 =20
 diff --git a/configure.ac b/configure.ac
-index b42fdd4..ec95146 100755
+index fcfe8e2..33acca6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4892,6 +4892,7 @@ AC_CHECK_HEADERS([       \
+@@ -5334,6 +5334,7 @@ AC_CHECK_HEADERS([       \
          sys/syscall.h    \
          sys/sysnvl.h     \
          sys/time.h       \
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-=
remove-fullpath-after-flags.patch b/meta/recipes-devtools/valgrind/valgrind=
/0001-memcheck-vgtests-remove-fullpath-after-flags.patch
index 9a3596cac1a..3d6f80c6c2e 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-=
fullpath-after-flags.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-memcheck-vgtests-remove-=
fullpath-after-flags.patch
@@ -1,4 +1,4 @@
-From b703b0d11adc9147a7d97817bd771ac40b8c4d39 Mon Sep 17 00:00:00 2001
+From 2ebd36d1190bb16ff537ab2189802c025803b116 Mon Sep 17 00:00:00 2001
 From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
 Date: Wed, 16 Sep 2020 13:45:07 -0400
 Subject: [PATCH] memcheck vgtests remove fullpath-after flags
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak=
_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgrind/va=
lgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
index 7deca99202c..9e2f1792526 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.s=
tderr.exp-adjust-tmp-paths.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.s=
tderr.exp-adjust-tmp-paths.patch
@@ -1,4 +1,4 @@
-From bbb5e8a6fc5eec178f8077ab006ab42c009528d4 Mon Sep 17 00:00:00 2001
+From e0efed171478290f06a186b809b4de1d30b69035 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 24 Jan 2020 17:55:39 +0100
 Subject: [PATCH] none/tests/fdleak_cmsg.stderr.exp: adjust /tmp paths
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_=
sifields-to-__si_fields-on-musl.patch b/meta/recipes-devtools/valgrind/valg=
rind/0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch
index efa6c2c8950..a020d30ec8d 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifield=
s-to-__si_fields-on-musl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-sigqueue-Rename-_sifield=
s-to-__si_fields-on-musl.patch
@@ -1,4 +1,4 @@
-From c287382a1f3dd9f2db3df54dde54b4b266791bb9 Mon Sep 17 00:00:00 2001
+From 951319748b6e60615fdf12a59c6df56a25e39cdd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 00:46:39 -0700
 Subject: [PATCH] sigqueue: Rename _sifields to __si_fields on musl
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-i=
nstead-of-O0.patch b/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm=
-Use-O-instead-of-O0.patch
index 3eea1955793..b1a27dfee30 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-=
of-O0.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-tests-arm-Use-O-instead-=
of-O0.patch
@@ -1,4 +1,4 @@
-From 8087ae8dcc46f3f81af58ed9b7176761b988ee61 Mon Sep 17 00:00:00 2001
+From 12fec29880ae4b1ce8ac98f6fa54323264ecdd11 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 10 May 2024 17:44:47 -0700
 Subject: [PATCH] tests/arm: Use -O instead of -O0
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
-index a76981e..a198f73 100644
+index f452d69..fbd9416 100644
 --- a/none/tests/arm/Makefile.am
 +++ b/none/tests/arm/Makefile.am
-@@ -57,9 +57,9 @@ allexec_CFLAGS		=3D $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
+@@ -56,9 +56,9 @@ allexec_CFLAGS		=3D $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
  # Also force -O0 since -O takes hundreds of MB of memory=20
  # for v6intThumb.c.
  v6intARM_CFLAGS   =3D $(AM_CFLAGS) -g -O0 -marm
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_x=
ml_frames-do-not-filter-usr.patch b/meta/recipes-devtools/valgrind/valgrind=
/0001-valgrind-filter_xml_frames-do-not-filter-usr.patch
index c64c2afd3f0..686f6b26921 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_fram=
es-do-not-filter-usr.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-valgrind-filter_xml_fram=
es-do-not-filter-usr.patch
@@ -1,4 +1,4 @@
-From f8fbebcf69e4a8bf2122b7c55f2ce372377af1bc Mon Sep 17 00:00:00 2001
+From 0965cb629d9fe745e4b903510345178c81523118 Mon Sep 17 00:00:00 2001
 From: Randy MacLeod <Randy.MacLeod@windriver.com>
 Date: Mon, 13 May 2019 17:12:21 -0400
 Subject: [PATCH] valgrind: filter_xml_frames: do not filter /usr
diff --git a/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-d=
irective-path-for-config.h.patch b/meta/recipes-devtools/valgrind/valgrind/=
0003-correct-include-directive-path-for-config.h.patch
index 3acb5a28f48..71196df8a34 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directiv=
e-path-for-config.h.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0003-correct-include-directiv=
e-path-for-config.h.patch
@@ -1,4 +1,4 @@
-From de4d7e478515b63f049b211266d9b946c15cc0b9 Mon Sep 17 00:00:00 2001
+From 3dcfafff80f37b65153f100bccf09ac8092dced1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 10 Jun 2017 01:03:17 -0700
 Subject: [PATCH] correct include directive path for config.h
diff --git a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-=
instructions-mfatbu-mfatbl.patch b/meta/recipes-devtools/valgrind/valgrind/=
Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
index 109caf76abe..f6589fffdb2 100644
--- a/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instruc=
tions-mfatbu-mfatbl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/Added-support-for-PPC-instruc=
tions-mfatbu-mfatbl.patch
@@ -1,4 +1,4 @@
-From 85bff993087cd7367ffc35de525c2bf6162398d2 Mon Sep 17 00:00:00 2001
+From 492d4c3cfcd57edd5610ab355ab9f9ba901c6edc Mon Sep 17 00:00:00 2001
 From: Aneesh Bansal <aneesh.bansal@freescale.com>
 Date: Mon, 21 Nov 2011 17:31:39 +0530
 Subject: [PATCH] Added support for PPC instructions mfatbu, mfatbl.
@@ -17,7 +17,7 @@ Signed-off-by: Aneesh Bansal <aneesh.bansal@freescale.com=
>
  3 files changed, 42 insertions(+)
=20
 diff --git a/VEX/priv/guest_ppc_defs.h b/VEX/priv/guest_ppc_defs.h
-index 220fbf1..cd259f3 100644
+index f5571c4..7b80c96 100644
 --- a/VEX/priv/guest_ppc_defs.h
 +++ b/VEX/priv/guest_ppc_defs.h
 @@ -233,6 +233,8 @@ extern UInt ppc32g_dirtyhelper_MFSPR_268_269 ( UInt );
@@ -30,7 +30,7 @@ index 220fbf1..cd259f3 100644
                                       UInt vD_idx, UInt sh,
                                       UInt shift_right );
 diff --git a/VEX/priv/guest_ppc_helpers.c b/VEX/priv/guest_ppc_helpers.c
-index 2611e52..72c349b 100644
+index a48164a..229b5a8 100644
 --- a/VEX/priv/guest_ppc_helpers.c
 +++ b/VEX/priv/guest_ppc_helpers.c
 @@ -118,6 +118,24 @@ UInt ppc32g_dirtyhelper_MFSPR_287 ( void )
@@ -59,10 +59,10 @@ index 2611e52..72c349b 100644
  /* CALLED FROM GENERATED CODE */
  /* DIRTY HELPER (reads guest state, writes guest mem) */
 diff --git a/VEX/priv/guest_ppc_toIR.c b/VEX/priv/guest_ppc_toIR.c
-index 18716dd..b2e72a0 100644
+index dbeba05..1e51b40 100644
 --- a/VEX/priv/guest_ppc_toIR.c
 +++ b/VEX/priv/guest_ppc_toIR.c
-@@ -11875,6 +11875,28 @@ static Bool dis_proc_ctl ( const VexAbiInfo* vbi,=
 UInt prefix, UInt theInstr )
+@@ -11864,6 +11864,28 @@ static Bool dis_proc_ctl ( const VexAbiInfo* vbi,=
 UInt prefix, UInt theInstr )
           break;
        }
 =20
diff --git a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets=
-which-don-t-support-it.patch b/meta/recipes-devtools/valgrind/valgrind/avo=
id-neon-for-targets-which-don-t-support-it.patch
index 1597b3a021b..57c242dddc6 100644
--- a/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-=
don-t-support-it.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/avoid-neon-for-targets-which-=
don-t-support-it.patch
@@ -1,4 +1,4 @@
-From 596372bc9b4d31bc9811881cfa747d99a8c25141 Mon Sep 17 00:00:00 2001
+From 0bd621fdd5a211369c30136b4b1408e5ea3748d3 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 19 Jan 2016 16:42:36 -0800
 Subject: [PATCH] avoid neon for targets which don't support it
diff --git a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch =
b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
index 6bfc6035ed6..4f9c74efdb6 100644
--- a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
@@ -1,4 +1,4 @@
-From 408f9b39ca4f5709b668f13829a94c4cae855006 Mon Sep 17 00:00:00 2001
+From d39ee9960e306aabe707f3a8a1416e39b983ab79 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 31 Aug 2010 22:51:58 +0800
 Subject: [PATCH] valgrind: fix perl scripts
@@ -24,7 +24,7 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
  3 files changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/massif/ms_print.in b/massif/ms_print.in
-index a206ce4..df1bc31 100755
+index d97b878..b4a762f 100644
 --- a/massif/ms_print.in
 +++ b/massif/ms_print.in
 @@ -1,4 +1,4 @@
@@ -34,7 +34,7 @@ index a206ce4..df1bc31 100755
  ##--------------------------------------------------------------------##
  ##--- Massif's results printer                         ms_print.in ---##
 diff --git a/perf/vg_perf.in b/perf/vg_perf.in
-index 90ee1d2..c585096 100644
+index cc27834..0e49550 100644
 --- a/perf/vg_perf.in
 +++ b/perf/vg_perf.in
 @@ -1,4 +1,4 @@
@@ -44,7 +44,7 @@ index 90ee1d2..c585096 100644
  ##--- Valgrind performance testing script                  vg_perf ---##
  ##--------------------------------------------------------------------##
 diff --git a/tests/vg_regtest.in b/tests/vg_regtest.in
-index 3471322..49e1114 100755
+index 2c4fe8c..2017841 100644
 --- a/tests/vg_regtest.in
 +++ b/tests/vg_regtest.in
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch b=
/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
index 19690e5ebbd..9b4bfd2a876 100644
--- a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
@@ -1,4 +1,4 @@
-From 8c92089741d809cfd18354f1b4df18cd28398a20 Mon Sep 17 00:00:00 2001
+From dcb40da8ebf6ad6fe1ab308973c7896717f7e199 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Wed, 17 Mar 2021 12:16:31 -0400
 Subject: [PATCH] remove s390x_vec_op_t
@@ -18,10 +18,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/VEX/priv/guest_s390_defs.h b/VEX/priv/guest_s390_defs.h
-index 29efa01..3a8f0a0 100644
+index 5c87d2b..9210822 100644
 --- a/VEX/priv/guest_s390_defs.h
 +++ b/VEX/priv/guest_s390_defs.h
-@@ -285,7 +285,7 @@ typedef enum {
+@@ -281,7 +281,7 @@ typedef enum {
     S390_VEC_OP_VCLFNL,
     S390_VEC_OP_VCRNF,
     S390_VEC_OP_LAST             // supposed to be the last element in enu=
m
diff --git a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-=
mcpu-mfpu-for-ARM-test-apps.patch b/meta/recipes-devtools/valgrind/valgrind=
/use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch
index 0c18a63c2ba..a258eba914d 100644
--- a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mf=
pu-for-ARM-test-apps.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-march-mcpu-mf=
pu-for-ARM-test-apps.patch
@@ -1,4 +1,4 @@
-From a5cd00f1c2d78e2a15f4a0c595f5ac10ca4c3290 Mon Sep 17 00:00:00 2001
+From 9578dae640073ae06df6a1c2c77c9263f2d0b85b Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 19 Jan 2016 16:00:00 -0800
 Subject: [PATCH] use appropriate -march/-mcpu/-mfpu for ARM test apps
@@ -23,10 +23,10 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
=20
 diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
-index 79b957c..41a5a03 100644
+index 5241bbd..d197575 100644
 --- a/none/tests/arm/Makefile.am
 +++ b/none/tests/arm/Makefile.am
-@@ -87,8 +87,10 @@ neon64_CFLAGS     =3D $(AM_CFLAGS) -g -O0 -mcpu=3Dcorte=
x-a8 \
+@@ -86,8 +86,10 @@ neon64_CFLAGS     =3D $(AM_CFLAGS) -g -O0 -mcpu=3Dcorte=
x-a8 \
  			-mfpu=3Dneon \
  			-mthumb
 =20
diff --git a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.s=
o-strlen-intercept-optional.patch b/meta/recipes-devtools/valgrind/valgrind=
/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
index ca7f721d9c0..73c386ce449 100644
--- a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strle=
n-intercept-optional.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strle=
n-intercept-optional.patch
@@ -1,4 +1,4 @@
-From b407514aa1a4fd3667b30527260e271da34ce4a7 Mon Sep 17 00:00:00 2001
+From 5726038404bbfd795d4878a77b07f5154bede977 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 13 Dec 2016 11:29:55 +0800
 Subject: [PATCH] make ld-XXX.so strlen intercept optional
@@ -17,10 +17,10 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com=
>
  1 file changed, 12 insertions(+), 1 deletion(-)
=20
 diff --git a/coregrind/m_redir.c b/coregrind/m_redir.c
-index 63172b9..1b5bf95 100644
+index 0c43731..1bafb47 100644
 --- a/coregrind/m_redir.c
 +++ b/coregrind/m_redir.c
-@@ -1321,7 +1321,18 @@ static void add_hardwired_spec (const  HChar* sopat=
t, const HChar* fnpatt,
+@@ -1349,7 +1349,18 @@ static void add_hardwired_spec (const  HChar* sopat=
t, const HChar* fnpatt,
     spec->to_addr     =3D to_addr;
     spec->isWrap      =3D False;
     spec->isGlobal    =3D False;
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.27.1.bb b/meta/recip=
es-devtools/valgrind/valgrind_3.28.0.bb
similarity index 96%
rename from meta/recipes-devtools/valgrind/valgrind_3.27.1.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.28.0.bb
index 829b6c96a86..8c4e2f5aff1 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.27.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.28.0.bb
@@ -26,8 +26,10 @@ SRC_URI =3D "https://sourceware.org/pub/valgrind/valgrin=
d-${PV}.tar.bz2 \
            file://0001-docs-Disable-manual-validation.patch \
            file://0001-tests-arm-Use-O-instead-of-O0.patch \
            file://0001-getdents_filter.c-workaround-off64_t-not-defined-in=
-.patch \
+           file://0001-Bug-5277723-configure.ac-do-not-fail-the-arm64-test=
-.patch \
            "
-SRC_URI[sha256sum] =3D "5d589152eb8071c02feab8ce6ab719e431a1fbc3e2b1700f54=
32632a8b9264dc"
+
+SRC_URI[sha256sum] =3D "9f7a18d128f05d3a80fea53e6953f34aad7200a425ceaee460=
99a8a798a7dd9c"
 UPSTREAM_CHECK_REGEX =3D "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
=20
 COMPATIBLE_HOST =3D '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64|riscv=
64).*-linux'
