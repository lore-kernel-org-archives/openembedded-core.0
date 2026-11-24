Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15270.1795517771043183993
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:56:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CbzUVRp+;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9516; q=dns/txt;
  s=iport01; t=1795517771; x=1796727371;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ODlc961nJRjIcNA1EDIr86x6iby6YIoTuuCjuo0BU+c=;
  b=CbzUVRp+qyAwkATUggffpzBTg1YnFhpOv5ivH7mpYj3LWrGgx7Aq7XDD
   lBJQIL7hs/4opHwmUHEA+kLMYrebCR3okEMiMBQps8ROCvpnmB0Xv4Y21
   x8V8VM6PmZG7f6Ib3K5NEUu/6XoaiBDpdve7vljFkxDXfxWWLgY8UxB8b
   OIclYl0ywGaC8ix0C+wpQUe9E3wNQS5reKtdV8Ht457DiV4b4dxj80t2U
   yyWCSHETKoJ6nEhDINNYivgPppankoP2MTqLEEebwGSaBNT9ls1vZAK++
   9bIpgsXRiNZga9ZI+mxPdpQ9T82wmYSw2tyurBRWjaI3tI2siU452C//f
   g==;
X-CSE-ConnectionGUID: raMgy34hSr+CI6CcHqkHDA==
X-CSE-MsgGUID: 3phb1JZnSOW8aMDJqPWAsw==
X-IPAS-Result: =?us-ascii?q?A0BJAgD3awVr/8tK/pBaglmCV3VhQkkDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBkegmQBgnQCARG6WoF5M?=
 =?us-ascii?q?4EBgykBPwJDUNszAQsUAYE4hUKIJF0YAYR9JxsbgXKBFYNqgQWBXAIDiCMEg?=
 =?us-ascii?q?iJ6EoFUHox5AoFPiElIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbB?=
 =?us-ascii?q?gWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETG?=
 =?us-ascii?q?iwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGF?=
 =?us-ascii?q?iELGxgNSBEsNxUZBD5uB5QUgxMHAVk0AStGf0gfkz+SNqERCiiDeYwklToaM?=
 =?us-ascii?q?6pyC5h9jgqWUYRqgWg8gVlwFYMiCUoZD44uCwuDYIUTyUgjNQsDLwEBBwIHD?=
 =?us-ascii?q?gMLgWiRfgEB?=
IronPort-Data: A9a23:ZYKoXK0pIHzi0e9YSPbD5Ydwkn2cJEfYwER7XKvMYLTBsI5bpzRVm
 2EfCj3Xbv6MZmqgLdonb4q3/EgA6JXRz9MyQVFk3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ef3b9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcuaTpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGFkgTMpxDpuZMGyJl1
 KIzIxAUbTCvrrfjqF67YrEEasULJcTxeYdasXZ6wHSBV7AtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NE+ojx5nYj/7DLo3h/+hnHz2aRVTqUmeouw85G27IAlZjuOxboePI43iqcN9xV6Yr
 DvkzWLCJS5KPfmz6yO9zVu3mbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVVsAVF6gx7xuAj/KOpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:kztyRKF9nHj0zc+TpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:C1pvzmBtd0oCuer6EzNu0UEFQZwlSWee51aOCESYEGVJZJTAHA==
X-Talos-MUID: 9a23:mirWEQos6KRAdH3et5kez2p6NM0xwZaoM2cywZwjl+udDRNZICjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="63465219"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 10:56:08 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id 5D8071800017C
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:08 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 0FAB3CBF221; Tue, 24 Nov 2026 02:56:07 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail][PATCH 02/10] openssh: Fix CVE-2026-106586
Date: Tue, 24 Nov 2026 02:55:25 -0800
Message-Id: <20261124105533.348654-3-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124105533.348654-1-asparmar@cisco.com>
References: <20261124105533.348654-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251010
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/openssh/openssh-portable/commit/991f1f31dde2797416acaf4319dbebe764446c6f
[2] https://ubuntu.com/security/CVE-2026-106586

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106586_p1.patch  | 36 +++++++
 .../openssh/openssh/CVE-2026-106586_p2.patch  | 98 +++++++++++++++++++
 .../openssh/openssh/CVE-2026-106586_p3.patch  | 35 +++++++
 .../openssh/openssh_10.5p1.bb                 |  3 +
 4 files changed, 172 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p1.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p2.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p3.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p1.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p1.patch
new file mode 100644
index 0000000000..766cc6ed63
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p1.patch
@@ -0,0 +1,36 @@
+From 0c9bb7c4194c04a5c4bb7a8480eedaa2d6a92933 Mon Sep 17 00:00:00 2001
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
+- Omit the upstream OpenBSD revision-only hunks.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ auth-options.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/auth-options.c b/auth-options.c
+index e15f600..38b7802 100644
+--- a/auth-options.c
++++ b/auth-options.c
+@@ -604,6 +604,7 @@ sshauthopt_merge(const struct sshauthopt *primary,
+ 	OPTFLAG_AND(no_require_user_presence);
+ 	/* Restrictive flags are logical-OR (i.e. must be set in either) */
+ 	OPTFLAG_OR(require_verify);
++	OPTFLAG_OR(restricted);
+ #undef OPTFLAG_AND
+ 
+ 	/* Earliest expiry time should win */
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p2.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p2.patch
new file mode 100644
index 0000000000..587a92b7c7
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p2.patch
@@ -0,0 +1,98 @@
+From 44a9ef3a18d4a3bf4a5c720c1841d73130478095 Mon Sep 17 00:00:00 2001
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
+- Omit the upstream OpenBSD revision-only hunks.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ regress/unittests/authopt/tests.c | 41 ++++++++++++++++---------------
+ 1 file changed, 21 insertions(+), 20 deletions(-)
+
+diff --git a/regress/unittests/authopt/tests.c b/regress/unittests/authopt/tests.c
+index 2376b47..fa836e0 100644
+--- a/regress/unittests/authopt/tests.c
++++ b/regress/unittests/authopt/tests.c
+@@ -418,13 +418,14 @@ test_merge(void)
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
+@@ -437,40 +438,40 @@ test_merge(void)
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
index 0000000000..4bcd20c088
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p3.patch
@@ -0,0 +1,35 @@
+From ae2f6b84f35744066ad02ac1716b17b8ba1ded0e Mon Sep 17 00:00:00 2001
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
+- Omit the upstream OpenBSD revision-only hunks.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ regress/unittests/authopt/tests.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/regress/unittests/authopt/tests.c b/regress/unittests/authopt/tests.c
+index fa836e0..609fab2 100644
+--- a/regress/unittests/authopt/tests.c
++++ b/regress/unittests/authopt/tests.c
+@@ -422,9 +422,10 @@ test_merge(void)
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
diff --git a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
index dc1dc8e3ef..5b546e4b53 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
@@ -26,6 +26,9 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://CVE-2026-123158.patch \
            file://CVE-2026-106584.patch \
+           file://CVE-2026-106586_p1.patch \
+           file://CVE-2026-106586_p2.patch \
+           file://CVE-2026-106586_p3.patch \
            "
 SRC_URI[sha256sum] = "d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11"
 
-- 
2.35.6

