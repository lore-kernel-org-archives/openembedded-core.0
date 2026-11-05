Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29315.1793864096674980855
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:34:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=P9lJ0UTo;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3828; q=dns/txt;
  s=iport01; t=1793864097; x=1795073697;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cIhPyYJ/BaH5GStt59R6TgkZF7NX8aSisisjdN7GB60=;
  b=P9lJ0UTo6Zb8XsQqtdQIEE8z6KY51gMkO0hR0gEZBlYXShMGfqhyJZAA
   sy168OxsPcRa9jYlF2mKfQkcKYrfXH3WS2qjzZgz2nnDP2qQlIR/eRVmM
   4oO/khUI3eCs169mMwg6ar28XfJjJ87dvh0JJ29nC+3l1mzZT9XL/kVV4
   ZJDwpQuD6qtdFY8E9Ppe4btPkrbDfMx5VFvXCblqHh+MmCkLT+U50TkVd
   yRk3yveR4XqOwJrzJIFYnJh3jdPRJIWc9QcJziiDMtAZdMJppiAm4z3RG
   YByM1SBrSsk9TIodcj9QQMpS4N/v0cnx9A1QxfZQiwUO97MEqOIQhyyT8
   Q==;
X-CSE-ConnectionGUID: pHDrjCCaSLa7bP0WSh0gGg==
X-CSE-MsgGUID: rBlFCfc3TDOEBPCg9NhmcA==
X-IPAS-Result: =?us-ascii?q?A0AaAABVMOxq/4//Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ1YENJjHKJWQOLZZI8gX4PAQEBDy4PFAQBAYUFAo4dAiY0CQ4BA?=
 =?us-ascii?q?gQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAwEmCwEYA?=
 =?us-ascii?q?S0QHAMBAi8gBwQjCBmDAgGCOgM3AxEGvECBeTOBAYMpAT8CQ1DYTA2CWgELF?=
 =?us-ascii?q?AGBOAGFP4J/hSRdGAGEfScbG4FygRWDaYEFgRpCAQICgSoLhm4EgiKBDIFaH?=
 =?us-ascii?q?mWMFQKBUoZxSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BH?=
 =?us-ascii?q?oESgQddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBG?=
 =?us-ascii?q?jU8CSY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKGBgNSBEsNxUZBD5uB5Ivg?=
 =?us-ascii?q?xF1BhMBKQKBTaQ0giGgIHEKKIN4jCSNPoIAhXwaM6pxC5h9jgqECpJHhGmBa?=
 =?us-ascii?q?DyBKB8LB3AVSA6CTAlKGQ+OOYVqglnJfSYyAjwBBwIHDwKBc5ABgX0BAQ?=
IronPort-Data: A9a23:mhVyU6I+YpKq58IDFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENSgTBRm
 2MZUGzQPqyOZmP8KY8jO4qw8xwFsMeBy9RiTgod+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmYoajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN12LG0sP6Yz891TCD5Ez
 aQnEzBVYT+M0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBU7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME+ojx5nYj/7DLoyn+qsj3juehVTqUmeouw85G27IAlZjeSwaIeMK4TULSlTtlyyo
 kzt8W+iPj09Gfan4jXU1HKpjcaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1jfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:wWXKqK2kOcV880j4QnLp4gqjBJAkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AKLIhLWlP7MTDjyjJ3Xg+Brf7c+bXOWX94G3SCGS?=
 =?us-ascii?q?xMkJgF7etEWCr+PtrvMU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AmAgQ4QxtVGjPikguAUTIZJq2WlaaqL6EDG4mn55?=
 =?us-ascii?q?dh+WjGAZIEDjMqjSySaZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="545051906"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 07:34:55 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 92D81180004B4;
	Thu,  5 Nov 2026 07:34:55 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 3E7DBCBF202; Wed,  4 Nov 2026 23:34:55 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][master][PATCH 3/3] busybox: fix CVE-2026-38755
Date: Wed,  4 Nov 2026 23:34:52 -0800
Message-Id: <20261105073452.890881-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105073452.890881-1-dkelaiya@cisco.com>
References: <20261105073452.890881-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 07:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249455
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix shown in [1].
The advisory identifying the fix is referenced in [2].

[1] https://lists.busybox.net/pipermail/busybox/2026-June/092354.html
[2] https://nvd.nist.gov/vuln/detail/cve-2026-38755

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../busybox/busybox/CVE-2026-38755.patch      | 71 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.38.0.bb   |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-38755.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-38755.patch b/meta/recipes-core/busybox/busybox/CVE-2026-38755.patch
new file mode 100644
index 0000000..d999a0c
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-38755.patch
@@ -0,0 +1,71 @@
+From 819a0f9ba510c4d9efce0021a0357faa6257b44d Mon Sep 17 00:00:00 2001
+From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
+Date: Tue, 16 Jun 2026 12:19:27 +0900
+Subject: [PATCH] ash: fix stack overflow in evalfun()
+
+Recursive shell functions can repeatedly enter evalfun() until the
+process stack is exhausted. Track active shell function calls and raise a
+normal shell error when the recursion limit is reached.
+
+The counter is decremented through the existing funcdone cleanup path so
+errors raised from inside the function body unwind it correctly.
+
+CVE: CVE-2026-38755
+Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2026-June/092354.html]
+
+Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ shell/ash.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/shell/ash.c b/shell/ash.c
+index b8ff67b..4c7c778 100644
+--- a/shell/ash.c
++++ b/shell/ash.c
+@@ -481,6 +481,7 @@ struct globals_misc {
+ 	int shlvl;
+ #define rootshell (!shlvl)
+ 	int errlinno;
++	unsigned func_depth;
+ 
+ 	char *minusc;  /* argument to -c option */
+ 
+@@ -588,6 +589,7 @@ extern struct globals_misc *BB_GLOBAL_CONST ash_ptr_to_globals_misc;
+ #define rootpid     (G_misc.rootpid    )
+ #define shlvl       (G_misc.shlvl      )
+ #define errlinno    (G_misc.errlinno   )
++#define func_depth  (G_misc.func_depth )
+ #define minusc      (G_misc.minusc     )
+ #define curdir      (G_misc.curdir     )
+ #define physdir     (G_misc.physdir    )
+@@ -10309,6 +10311,10 @@ evalfun(struct funcnode *func, int argc, char **argv, int flags)
+ 	int savefuncline;
+ 	char *savefuncname;
+ 	char *savetrap = NULL;
++	enum { MAX_ASH_FUNC_DEPTH = 1000 };
++
++	if (func_depth >= MAX_ASH_FUNC_DEPTH)
++		ash_msg_and_raise_error("function recursion limit exceeded");
+ 
+ 	if (!Eflag) {
+ 		savetrap = trap[NTRAP_ERR];
+@@ -10327,6 +10333,7 @@ evalfun(struct funcnode *func, int argc, char **argv, int flags)
+ 	exception_handler = &jmploc;
+ 	shellparam.malloced = 0;
+ 	func->count++;
++	func_depth++;
+ 	funcname = func->n.ndefun.text;
+ 	funcline = func->n.ndefun.linno;
+ 	INTON;
+@@ -10348,6 +10355,7 @@ evalfun(struct funcnode *func, int argc, char **argv, int flags)
+ 	}
+ 	funcline = savefuncline;
+ 	lineno = savelineno;
++	func_depth--;
+ 	freefunc(func);
+ 	freeparam(&shellparam);
+ 	shellparam = saveparam;
+-- 
+2.35.6
+
diff --git a/meta/recipes-core/busybox/busybox_1.38.0.bb b/meta/recipes-core/busybox/busybox_1.38.0.bb
index 108839e..2c0b415 100644
--- a/meta/recipes-core/busybox/busybox_1.38.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.38.0.bb
@@ -62,6 +62,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2026-38752.patch \
            file://CVE-2026-38753.patch \
            file://CVE-2026-38754.patch \
+           file://CVE-2026-38755.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
 SRC_URI:append:x86-64 = " file://sha_accel.cfg"
-- 
2.35.6
