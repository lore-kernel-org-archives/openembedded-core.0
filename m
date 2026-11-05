Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27795.1793856714274018828
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iP9lggCg;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10213; q=dns/txt;
  s=iport01; t=1793856714; x=1795066314;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=G9Ptzetucypi2j/0bnrWk+LTsms3+i25fHLL9ASUJ+Q=;
  b=iP9lggCgqIELRS72FIsLAdhQ/r65Zq9+mTXdOUfG6pY6fSASX5izUbWB
   /w1sBWPVM0FuS/kM/bExR5N9qE4ji9aRbqNWBjBQJxGK9i2y58OqUGcHT
   q3RtFC8lgo9Dps06j02pCof8I5fx69YuReh7wBLK4RRWqzWUzsIQS12Ay
   hpsv0AJ+7cNcrfgxEFgL4Q1rZB5acm6EMR3S7xSqNYG/1H/0/o7IgDRac
   EUBX8XOpPekBjxj01RWByRyfVkXom9U7KW1p3d/E3At3DWlyYFm7tZkq9
   5WzFmBS8OZ53pe1MrAe7ZAR2ZLR1JH/1KmuLjDFD/XikWXOOz2okio6j+
   w==;
X-CSE-ConnectionGUID: +4ngag/gRbaIgJKae/LTvw==
X-CSE-MsgGUID: 7dYOCkjTQYyWN279Fy/SeA==
X-IPAS-Result: =?us-ascii?q?A0BFAgASFOxq/4//Ja1aglmCV3VhQkmUKoIhniSBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGEP45lAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAS0LARgBWQMBAlojIR6CZAGCdAIBEbw+gXkzgQGDKQE/AkNQ2?=
 =?us-ascii?q?zMBCxQBgTiFQIgjXRgBhH0nGxuBcoEVg2mBBYFcAQEDiCMEgiKBDIFaHox6A?=
 =?us-ascii?q?oFShnBIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB?=
 =?us-ascii?q?12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmP?=
 =?us-ascii?q?xUMZAsaBWEIAg0McjkQMB4kLwUcJkAbChgYDUgRLDcVGQQ+bgeSL4MKBwFZN?=
 =?us-ascii?q?AEHIwFGf0iTOiSSN6ERCiiDeIwklToaM4QEpm0LmH2CWYE/iXKVN4EahGmBa?=
 =?us-ascii?q?DyBRwsHcBWDIglKGQ+OLgsLg2CBf4MUyUgjNQsyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:fY8wBKtDo+icFnnSQHVTen75E+fnVABfMUV32f8akzHdYApBsoF/q
 tZmKWmCO/nba2L3e9kgbo219BxT7cSAzt5rSlNrqngyHiNGgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb9Es11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwubpxDmhBs
 vMiIjksYTKgju/x5I6lVbw57igjBJGD0II3oHpsy3TdSP0hW52GG/uM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtMYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9J4DWH5gLwxrEz
 o7A1zv1MzYxN96j8AuUzVT22b7hjGTAVatHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmAHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289lte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:ZH4aL667pjuNpBUvCwPXwPjXdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I5+rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfxLqn5SH8ECvj8eMY/6
 Jhf69iTODUNzFB/KPHCM3SKadG/DFBm5rY4dvj8w==
X-Talos-CUID: 9a23:AYAOwm/18YiUtNZCwJOVvw1IHM8sfTrS9n3ZAkCaKm9kD5mpV0DFrQ==
X-Talos-MUID: 9a23:vwOxLQqnQkHfo2k7ONcez25uBeBD4KaSMXEcrrNc5JiqJGtLNh7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544256544"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:31:49 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 5153E1800024F
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 05:31:49 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id EBCF4CC124B; Wed,  4 Nov 2026 21:31:48 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH  1/8] openssh: Fix CVE-2026-106586
Date: Wed,  4 Nov 2026 21:31:41 -0800
Message-Id: <20261105053148.2704106-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249442
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream OpenSSH 10.6p1 backport for
CVE-2026-106586. The fix is referenced in [1] and the advisory in [2].

The upstream test follow-ups in [3] and [4] update the existing
authentication-option tests for the preserved restricted flag.

[1] https://github.com/openssh/openssh-portable/commit/991f1f31dde2797416acaf4319dbebe764446c6f
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-106586
[3] https://github.com/openssh/openssh-portable/commit/ded92bffa2e2f2db9b83245c5061812791bfa47f
[4] https://github.com/openssh/openssh-portable/commit/a30bafcbbd44dc4dc91916240c32ecabff899338

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106586_p1.patch  |  38 +++++++
 .../openssh/openssh/CVE-2026-106586_p2.patch  | 100 ++++++++++++++++++
 .../openssh/openssh/CVE-2026-106586_p3.patch  |  37 +++++++
 .../openssh/openssh_9.6p1.bb                  |   3 +
 4 files changed, 178 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p1.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p2.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p3.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p1.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p1.patch
new file mode 100644
index 0000000000..398fe315cd
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p1.patch
@@ -0,0 +1,38 @@
+From 991f1f31dde2797416acaf4319dbebe764446c6f Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 16 Sep 2026 00:33:44 +0000
+Subject: [PATCH] upstream: Propagate authorized_keys "resrict" keyword
+
+The "restrict" keyword was not pervasively being applied to TunnelForwarding
+connections (which are administratively disabled by default). This is a
+separate problem to the one fixed in openssh-10.5
+
+reported by several people; ok markus, deraadt
+
+OpenBSD-Commit-ID: 8c36c31dc2bdbc0c432d1056496b2f1ce93198d1
+
+CVE: CVE-2026-106586
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/991f1f31dde2797416acaf4319dbebe764446c6f]
+
+Backport Changes:
+- Omitted the upstream OpenBSD RCS revision-only hunk and retained the
+  OpenSSH 9.6p1 revision identifier.
+
+(cherry picked from commit 991f1f31dde2797416acaf4319dbebe764446c6f)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ auth-options.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/auth-options.c b/auth-options.c
+index c89b1ee..0f11269 100644
+--- a/auth-options.c
++++ b/auth-options.c
+@@ -606,6 +606,7 @@ sshauthopt_merge(const struct sshauthopt *primary,
+ 	OPTFLAG_AND(no_require_user_presence);
+ 	/* Restrictive flags are logical-OR (i.e. must be set in either) */
+ 	OPTFLAG_OR(require_verify);
++	OPTFLAG_OR(restricted);
+ #undef OPTFLAG_AND
+ 
+ 	/* Earliest expiry time should win */
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p2.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p2.patch
new file mode 100644
index 0000000000..54478dc5a0
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p2.patch
@@ -0,0 +1,100 @@
+From ded92bffa2e2f2db9b83245c5061812791bfa47f Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 16 Sep 2026 04:51:28 +0000
+Subject: [PATCH] upstream: correctly check sshauthopt->restricted merging
+
+OpenBSD-Regress-ID: e81e9267514338d6cf6bd2f83dcb722538af528e
+
+CVE: CVE-2026-106586
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/ded92bffa2e2f2db9b83245c5061812791bfa47f]
+
+Backport Changes:
+- Omitted the upstream tests.c OpenBSD RCS revision-only hunk and
+  retained the OpenSSH 9.6p1 revision identifier.
+
+(cherry picked from commit ded92bffa2e2f2db9b83245c5061812791bfa47f)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ regress/unittests/authopt/tests.c | 41 ++++++++++++++++---------------
+ 1 file changed, 21 insertions(+), 20 deletions(-)
+
+diff --git a/regress/unittests/authopt/tests.c b/regress/unittests/authopt/tests.c
+index d9e1903..f86423d 100644
+--- a/regress/unittests/authopt/tests.c
++++ b/regress/unittests/authopt/tests.c
+@@ -419,13 +419,14 @@ test_merge(void)
+ 	} while (0)
+ 
+ 	/* Check a single case of merging of flag options */
+-#define FLAG_CASE(keybase, label, keyname, keywords, mostly_off, var, val) \
++#define FLAG_CASE(keybase, label, keyname, keywords, mostly_off, \
++	    rflag, var, val) \
+ 	do { \
+ 		PREPARE(keybase " " label, keyname, keywords); \
+-		expected = mostly_off ? \
+-		    sshauthopt_new() : default_authkey_opts(); \
+-		expected->var = val; \
++		expected = rflag ? default_authkey_restrict_opts() : \
++		    (mostly_off ? sshauthopt_new() : default_authkey_opts()); \
+ 		ASSERT_PTR_NE(expected, NULL); \
++		expected->var = val; \
+ 		CHECK_SUCCESS_AND_CLEANUP(); \
+ 		TEST_DONE(); \
+ 	} while (0)
+@@ -438,40 +439,40 @@ test_merge(void)
+ #define FLAG_TEST(keybase, keyword, var) \
+ 	do { \
+ 		FLAG_CASE(keybase, "keys:default,yes cert:default,no", \
+-		    "no_" keybase, keyword, 0, var, 0); \
++		    "no_" keybase, keyword, 0, 0, var, 0); \
+ 		FLAG_CASE(keybase,"keys:-*,yes cert:default,no", \
+-		    "no_" keybase, "restrict," keyword, 1, var, 0); \
++		    "no_" keybase, "restrict," keyword, 1, 1, var, 0); \
+ 		FLAG_CASE(keybase, "keys:default,no cert:default,no", \
+-		    "no_" keybase, "no-" keyword, 0, var, 0); \
++		    "no_" keybase, "no-" keyword, 0, 0, var, 0); \
+ 		FLAG_CASE(keybase, "keys:-*,no cert:default,no", \
+-		    "no_" keybase, "restrict,no-" keyword, 1, var, 0); \
++		    "no_" keybase, "restrict,no-" keyword, 1, 1, var, 0); \
+ 		\
+ 		FLAG_CASE(keybase, "keys:default,yes cert:-*,yes", \
+-		    "only_" keybase, keyword, 1, var, 1); \
++		    "only_" keybase, keyword, 1, 0, var, 1); \
+ 		FLAG_CASE(keybase,"keys:-*,yes cert:-*,yes", \
+-		    "only_" keybase, "restrict," keyword, 1, var, 1); \
++		    "only_" keybase, "restrict," keyword, 1, 1, var, 1); \
+ 		FLAG_CASE(keybase, "keys:default,no cert:-*,yes", \
+-		    "only_" keybase, "no-" keyword, 1, var, 0); \
++		    "only_" keybase, "no-" keyword, 1, 0, var, 0); \
+ 		FLAG_CASE(keybase, "keys:-*,no cert:-*,yes", \
+-		    "only_" keybase, "restrict,no-" keyword, 1, var, 0); \
++		    "only_" keybase, "restrict,no-" keyword, 1, 1, var, 0); \
+ 		\
+ 		FLAG_CASE(keybase, "keys:default,yes cert:-*", \
+-		    "no_permit", keyword, 1, var, 0); \
++		    "no_permit", keyword, 1, 0, var, 0); \
+ 		FLAG_CASE(keybase,"keys:-*,yes cert:-*", \
+-		    "no_permit", "restrict," keyword, 1, var, 0); \
++		    "no_permit", "restrict," keyword, 1, 1, var, 0); \
+ 		FLAG_CASE(keybase, "keys:default,no cert:-*", \
+-		    "no_permit", "no-" keyword, 1, var, 0); \
++		    "no_permit", "no-" keyword, 1, 0, var, 0); \
+ 		FLAG_CASE(keybase, "keys:-*,no cert:-*", \
+-		    "no_permit", "restrict,no-" keyword, 1, var, 0); \
++		    "no_permit", "restrict,no-" keyword, 1, 1, var, 0); \
+ 		\
+ 		FLAG_CASE(keybase, "keys:default,yes cert:*", \
+-		    "all_permit", keyword, 0, var, 1); \
++		    "all_permit", keyword, 0, 0, var, 1); \
+ 		FLAG_CASE(keybase,"keys:-*,yes cert:*", \
+-		    "all_permit", "restrict," keyword, 1, var, 1); \
++		    "all_permit", "restrict," keyword, 1, 1, var, 1); \
+ 		FLAG_CASE(keybase, "keys:default,no cert:*", \
+-		    "all_permit", "no-" keyword, 0, var, 0); \
++		    "all_permit", "no-" keyword, 0, 0, var, 0); \
+ 		FLAG_CASE(keybase, "keys:-*,no cert:*", \
+-		    "all_permit", "restrict,no-" keyword, 1, var, 0); \
++		    "all_permit", "restrict,no-" keyword, 1, 1, var, 0); \
+ 		\
+ 	} while (0)
+ 	FLAG_TEST("portfwd", "port-forwarding", permit_port_forwarding_flag);
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p3.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p3.patch
new file mode 100644
index 0000000000..da8642ac24
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p3.patch
@@ -0,0 +1,37 @@
+From a30bafcbbd44dc4dc91916240c32ecabff899338 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 16 Sep 2026 04:56:12 +0000
+Subject: [PATCH] upstream: simpler
+
+OpenBSD-Regress-ID: c7f30b865abd0b3e0e5514f861509c32e352a760
+
+CVE: CVE-2026-106586
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/a30bafcbbd44dc4dc91916240c32ecabff899338]
+
+Backport Changes:
+- Omitted the upstream tests.c OpenBSD RCS revision-only hunk and
+  retained the OpenSSH 9.6p1 revision identifier.
+
+(cherry picked from commit a30bafcbbd44dc4dc91916240c32ecabff899338)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ regress/unittests/authopt/tests.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/regress/unittests/authopt/tests.c b/regress/unittests/authopt/tests.c
+index f86423d..63f97ff 100644
+--- a/regress/unittests/authopt/tests.c
++++ b/regress/unittests/authopt/tests.c
+@@ -423,9 +423,10 @@ test_merge(void)
+ 	    rflag, var, val) \
+ 	do { \
+ 		PREPARE(keybase " " label, keyname, keywords); \
+-		expected = rflag ? default_authkey_restrict_opts() : \
+-		    (mostly_off ? sshauthopt_new() : default_authkey_opts()); \
++		expected = mostly_off ? \
++		    sshauthopt_new() : default_authkey_opts(); \
+ 		ASSERT_PTR_NE(expected, NULL); \
++		expected->restricted = rflag; \
+ 		expected->var = val; \
+ 		CHECK_SUCCESS_AND_CLEANUP(); \
+ 		TEST_DONE(); \
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 04595e706f..4266f05dd4 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -44,6 +44,9 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-60001.patch \
            file://CVE-2026-60002.patch \
            file://CVE-2026-60000.patch \
+           file://CVE-2026-106586_p1.patch \
+           file://CVE-2026-106586_p2.patch \
+           file://CVE-2026-106586_p3.patch \
            file://CVE-2026-73283.patch \
            file://CVE-2026-73282.patch \
            file://CVE-2026-73281.patch \
-- 
2.35.6

