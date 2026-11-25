Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36410.1795585635081578386
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:47:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aLhVd572;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9802; q=dns/txt;
  s=iport01; t=1795585635; x=1796795235;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=97eliynm6wjq+jP/mbDPx4LZTdcnxR0chjLqQHnccQU=;
  b=aLhVd572NRFCTocOhB6dME9a8to1AiR+ob6cb2GFTtxVc84ARghMuPQO
   8QpSCHKWilUT32D56JWv+Ph4dK0etOHn71Nz6hqisMcJJQoRqmp8/3KOS
   fDMTaQlaYnYjWoqtLKOcmDWJLrv4N7AuF+brcbs2bqBaJ4nyu2zEst32Z
   h8Gr1X2NrKC8T80l4soG/I8QtVMMZ/rB0QRigwQJIhdbgmlRQbGW3V3go
   3lwCMIkVRPVvNLH61E4FDNQaZsTt689OrQLK8JGKOTC2zsE1G9cNk9qus
   0y5oXSkBf4crrNsFbWVPIJAcBi0LuiUK2rTVwRyoTFtH+ZSjdta0t8WHk
   w==;
X-CSE-ConnectionGUID: zEWJThLrRjKjq0FRADZH8g==
X-CSE-MsgGUID: d/ev+4OSQnKRqCwdvsApbQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgD8dAZr/9FK/pBaglmCV3VgQ0kDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBkegmQBgnQDEblwgXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2zMBCxQBgTiFQoglXRgBhH4nGxuBcoEVg2qBBYFcAgOIIwSCI?=
 =?us-ascii?q?noSgVQejHUCgUmIUkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGB?=
 =?us-ascii?q?YEcgR6BEoEDXYErKF4hgQiBdQKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaL?=
 =?us-ascii?q?AqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHCQvBRkmPBsKgQwnHR4ZDgIpBhYhC?=
 =?us-ascii?q?zQYDUgRLDcVGQQ+bgeUE4MUBwFZNAErRn9IH5M/kjahEQoog3mMJJU6GjOqc?=
 =?us-ascii?q?guYfY4KllGEaoFoPIFZcBWDIglKGQ+OLgsLg2CFE8lIJjILAy8BAQcCBw4DC?=
 =?us-ascii?q?4FokX4BAQ?=
IronPort-Data: A9a23:9zYN+K004BFxeXZqAfbD5YZwkn2cJEfYwER7XKvMYLTBsI5bpz0Fy
 zYbWDqBaauDamvxf9Fzati39UNX7cWBxt83QAQ93Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ef3b9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcubzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGHmwJH7EY3vxNA0JM7
 KQ2EhkhXDDTiLfjqF67YrEEasULJcTxeYdasXZ6wHSBXbAtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NEWojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQviOG9YIGKI7RmQ+1Z2UuG5
 T7hxF3/ISsDH8OT1yGs6niV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIkvqS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:uy//Z67vybMIcyojmAPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3ATVONtGqo0Z2ZJBK6aCcRnhnmUdIITV/hzFPKGU2?=
 =?us-ascii?q?bC38xZoe8ZW2wqKwxxg=3D=3D?=
X-Talos-MUID: 9a23:7wFGJArkYCzQ+ZpuijUezz0lOdkrv4OVMUYuq4wtpMWaLgVoMQ7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60188371"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:47:13 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id D10EF18000189
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:12 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 86C33CBF202; Tue, 24 Nov 2026 21:47:11 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 02/10] openssh: Fix CVE-2026-106586
Date: Tue, 24 Nov 2026 21:47:03 -0800
Message-Id: <20261125054711.2691239-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125054711.2691239-1-hthakar@cisco.com>
References: <20261125054711.2691239-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251139
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/openssh/openssh-portable/commit/991f1f31dde2797416acaf4319dbebe764446c6f
[2] https://ubuntu.com/security/CVE-2026-106586

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106586_p1.patch  |  39 +++++++
 .../openssh/openssh/CVE-2026-106586_p2.patch  | 101 ++++++++++++++++++
 .../openssh/openssh/CVE-2026-106586_p3.patch  |  39 +++++++
 .../openssh/openssh_10.3p1.bb                 |   3 +
 4 files changed, 182 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p1.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p2.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p3.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p1.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p1.patch
new file mode 100644
index 0000000000..a694424cf4
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p1.patch
@@ -0,0 +1,39 @@
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
+- Omitted the upstream OpenBSD revision-only hunk and retained the
+  Wrynose OpenSSH 10.3p1 revision.
+
+(cherry picked from commit 991f1f31dde2797416acaf4319dbebe764446c6f)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ auth-options.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/auth-options.c b/auth-options.c
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
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p2.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p2.patch
new file mode 100644
index 0000000000..10a2abe497
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p2.patch
@@ -0,0 +1,101 @@
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
+- Omitted the upstream tests.c OpenBSD revision-only hunk and retained
+  the Wrynose OpenSSH 10.3p1 revision.
+
+(cherry picked from commit ded92bffa2e2f2db9b83245c5061812791bfa47f)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ regress/unittests/authopt/tests.c | 41 +++++++++++++++++++++--------------------
+ 1 file changed, 21 insertions(+), 20 deletions(-)
+
+diff --git a/regress/unittests/authopt/tests.c b/regress/unittests/authopt/tests.c
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
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p3.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p3.patch
new file mode 100644
index 0000000000..6defa83ec6
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p3.patch
@@ -0,0 +1,39 @@
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
+- Omitted the upstream tests.c OpenBSD revision-only hunk and retained
+  the Wrynose OpenSSH 10.3p1 revision.
+
+(cherry picked from commit a30bafcbbd44dc4dc91916240c32ecabff899338)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ regress/unittests/authopt/tests.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/regress/unittests/authopt/tests.c b/regress/unittests/authopt/tests.c
+--- a/regress/unittests/authopt/tests.c
++++ b/regress/unittests/authopt/tests.c
+@@ -422,10 +422,11 @@ test_merge(void)
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
+ 	} while (0)
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 8bdbdcd6bd..9941487026 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -36,6 +36,9 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-73281.patch \
            file://CVE-2026-123158.patch \
            file://CVE-2026-106584.patch \
+           file://CVE-2026-106586_p1.patch \
+           file://CVE-2026-106586_p2.patch \
+           file://CVE-2026-106586_p3.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6

