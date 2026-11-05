Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29315.1793864096674980855
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:34:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kj/IQ86/;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3330; q=dns/txt;
  s=iport01; t=1793864096; x=1795073696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7cJdLF1gEOr1PUF/4eat7kA2L6XTN5cAzTWchH61Sa4=;
  b=kj/IQ86/a56ZZdy2tV2r4IAxql908Rtl2VPBr4uJ6l5Z4vQnmCJQrthL
   DlU1AOCATepqZei5HuNPgH7BVInxqf1CWVwwhj2UaU0+h+dBNic1YuYh2
   MX2mAr3wmJIB/lwD9eKYKFznHnhDZApxuscx8kx0FSf9p+jRwy0uPzCNl
   bzbsLUqpUYHWy2XsAXo+hr5flmN0HH0nISTWix6rg29LYNKRPhAD+TbnO
   2fDd8qjEXwlP/DksM0PhPjqySAjFSpQ3Ew5305kUIiW++M49P0CdKISFV
   GordyNO8A1o4GT28VElIugtdqiP6Q+lzi/zZZy2lhA1PjO7xsJq4mbfAu
   A==;
X-CSE-ConnectionGUID: MHp/gPP/T3qV3zMvU4r2AQ==
X-CSE-MsgGUID: mZaRnNYQSDa++qVirPk4qw==
X-IPAS-Result: =?us-ascii?q?A0BJAgBVMOxq/5D/Ja1aHgEBCxIMggULgld1YENJlksDi?=
 =?us-ascii?q?2WSPIF+DwEBAQ8uDxQEAQGFBQKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMBMQEYAS0QHAMBAi8gBwQjCBmDAgGCO?=
 =?us-ascii?q?gM3AxEGvECCLIEBgykBPwJDUNhMDYJaAQsUAYE4hUCCf4UkXRgBhH0nGxuBc?=
 =?us-ascii?q?oEVg2mBBYEaQgECAoFHhlwEgiKBDIFaHmWMFQKBUoZxSIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBaAM1EioVbjIdgSM+F4EHGwYFgR2BHoESgQddgSsoXQEhgQiBdgKCUYIAA?=
 =?us-ascii?q?gFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQxyORAwH?=
 =?us-ascii?q?iQvBRwmQBsKGBgNSBEsNxUZBD5uB5IvgxABMV0BExYCpgGCIaAgcQoog3iMJ?=
 =?us-ascii?q?I0+ggCFfBozqnELmH2OCoQKkkeEaYFoPIEoHwsHcBVIDoJMCUoZD445hWqCW?=
 =?us-ascii?q?cl9JjICPAEHAgcPAoFzkAGBfQEB?=
IronPort-Data: A9a23:5nfyDK6dIGs93zJDSSsLQgxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 jYYWm3UPK6ONmP1eoslPY+x9kgP6J7VydNhG1E6/yk9Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztMt/rZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eGK0AvelPOSZyr
 uUmcyIocC3fnbif+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGc+FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkETUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGIeJJ4TXHJQNwy50o
 ErDzW3DBDcrDeezwHnG60ytnNfMwTrkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBbCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:dCok5qtzvle984sNzTxTo2Yn7skDVNV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3AVPuIeGnWA69XNG02+NqsMixT6P3XOVj91DDfG3f?=
 =?us-ascii?q?/NT1wduaHbEGtpLk+uvM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AxFETKg0zwOwdZGH239jiMoxlUTUj5panMkYroKw?=
 =?us-ascii?q?9l8DHdjVOOi2lj2iuXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="545051905"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 07:34:55 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 90C76180003EF;
	Thu,  5 Nov 2026 07:34:55 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 39DBBCBF201; Wed,  4 Nov 2026 23:34:55 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][master][PATCH 2/3] busybox: fix CVE-2026-38753
Date: Wed,  4 Nov 2026 23:34:51 -0800
Message-Id: <20261105073452.890881-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105073452.890881-1-dkelaiya@cisco.com>
References: <20261105073452.890881-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 07:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249454
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix shown in [1].
The advisory identifying the fix is referenced in [2].

[1] https://lists.busybox.net/pipermail/busybox/2026-June/092352.html
[2] https://nvd.nist.gov/vuln/detail/cve-2026-38753

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../busybox/busybox/CVE-2026-38753.patch      | 55 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.38.0.bb   |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-38753.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-38753.patch b/meta/recipes-core/busybox/busybox/CVE-2026-38753.patch
new file mode 100644
index 0000000..5e4cb94
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-38753.patch
@@ -0,0 +1,55 @@
+From 2365a1c6ef6054df297f90887f9ed305041c3675 Mon Sep 17 00:00:00 2001
+From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
+Date: Tue, 16 Jun 2026 12:18:43 +0900
+Subject: [PATCH] awk: fix use-after-free in awk_sub()
+
+awk_sub() receives the replacement text as a pointer into awk variable
+storage. Evaluating the regular expression argument can change that
+storage through as_regex(), leaving the replacement pointer dangling
+before strlen() and the replacement loop use it.
+
+Copy the replacement string before calling as_regex() so substitution
+uses stable storage for the duration of the operation.
+
+CVE: CVE-2026-38753
+Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2026-June/092352.html]
+
+Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ editors/awk.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index f15832b..8a51827 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -2555,6 +2555,7 @@ static char *awk_printf(node *n, size_t *len)
+ static int awk_sub(node *rn, const char *repl, int nm, var *src, var *dest /*,int subexp*/)
+ {
+ 	char *resbuf;
++	char *repl_copy;
+ 	const char *sp;
+ 	int match_no, residx, replen, resbufsize;
+ 	int regexec_flags;
+@@ -2572,7 +2573,9 @@ static int awk_sub(node *rn, const char *repl, int nm, var *src, var *dest /*,in
+ 	resbuf = NULL;
+ 	residx = 0;
+ 	match_no = 0;
++	repl_copy = xstrdup(repl);
+ 	regex = as_regex(rn, &sreg);
++	repl = repl_copy;
+ 	sp = getvar_s(src ? src : intvar[F0]);
+ #if defined(REG_STARTEND)
+ 	src_string = sp;
+@@ -2662,6 +2665,7 @@ static int awk_sub(node *rn, const char *repl, int nm, var *src, var *dest /*,in
+ 	setvar_p(dest ? dest : intvar[F0], resbuf);
+ 	if (regex == &sreg)
+ 		regfree(regex);
++	free(repl_copy);
+ 	return match_no;
+ }
+ 
+-- 
+2.35.6
+
diff --git a/meta/recipes-core/busybox/busybox_1.38.0.bb b/meta/recipes-core/busybox/busybox_1.38.0.bb
index bf78951..108839e 100644
--- a/meta/recipes-core/busybox/busybox_1.38.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.38.0.bb
@@ -60,6 +60,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2025-60876.patch \
            file://CVE-2024-58251.patch \
            file://CVE-2026-38752.patch \
+           file://CVE-2026-38753.patch \
            file://CVE-2026-38754.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
-- 
2.35.6
