Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29317.1793864100662322290
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:35:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CFuHgczm;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4203; q=dns/txt;
  s=iport01; t=1793864100; x=1795073700;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qfe6qRUFXNqmecokHbDf3yDeHIVTefNbaq//8HPahmM=;
  b=CFuHgczmgZTc4qkcAniMPP4lMY+k/Bol4rZLfiqJH9+JibKlXGtnF6EJ
   WGMFJjsu0pc7pckdPdbSN0VbKQt5BEXbgjB/AdLFR8gLepPKrdixCre3l
   Wz3K/tGHBPtu7qNhNl/1fUhSEahrKNzh7YNVWpqMmFJ2FMg9IAYLSrJbl
   NFzOslP8H4Gh1wCy2ZscE6EfeKZCib3rmlxgWnjeYS29phe00yO7MFaqh
   94ZwpO62I0rChjYpsVC9knlGWJpEA4kwQG1vSW3/ESrXmmKRUbj/pvJUh
   7KGpdjiEKm5PkR9VgcO+t1xyeB3iU22oFzyWaHJsXxIhAFU2qIVjPBdhJ
   w==;
X-CSE-ConnectionGUID: dsocN6i3Rn2bKoUwVVsmNA==
X-CSE-MsgGUID: VjhvK9tzQBeBMA2jFT0+9A==
X-IPAS-Result: =?us-ascii?q?A0ADAABOMexq/47/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBgXwFAQEBAQsBglZ1YENJjHKJWYtokjyBfg8BAQEPLg8UBAEBh?=
 =?us-ascii?q?QWOHwImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QE?=
 =?us-ascii?q?gECAQQmCwEYAS0sAwECTwcEIyGDAgGCOgM3AxEGvDaBeTOBAYMpAT8CQ1DYT?=
 =?us-ascii?q?A2CWgELFAGBOAGFP4J/hSRdGAGEfScbG4FygRWDaYEFgRpCAQICgSoLhm4Eg?=
 =?us-ascii?q?iKBDIFaHmWMFQKBUoZxSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHG?=
 =?us-ascii?q?wYFgR2BHoESgQddgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJA?=
 =?us-ascii?q?RMaLAqBGjU8CSY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKGBgNSBEsNxUZB?=
 =?us-ascii?q?D5uB5IvgxF7CQoBKQIXgTakNIIhoCBxCiiDeIwkjT6CAIV8GjOqcQuYfY4Kh?=
 =?us-ascii?q?AqRX2iEaYFoPIEoHwsHcBVIDoJMCUoZD445hWqCWcoDJjICPAEHAgcPAoFzk?=
 =?us-ascii?q?AGBfQEB?=
IronPort-Data: A9a23:aPa6HqhlhWNhe0zu0J17zFytX161MREKZh0ujC45NGQN5FlHY01je
 htvDz+FO6uOYTT9KdB3bdzg9UlQ6sfVnIU1GwRu+H8zRHhjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvrf8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUU4eF8Jz9Pr
 sYecjouaS2cudytxZSSH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg1/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9J4DWGJsLwxrJz
 o7A11r7Ag85ZcCN8BCI2FeF3O3hoXu4CatHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmMHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn288lte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:JU8MjKGK9aboz0tKpLqE3seALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPId+rJBLK8gcaVbSC09QYLcT1X
X-Talos-CUID: 9a23:KW0p/W2ZpgG8El7Md2MsEbxfFtsieVuDzSzqJRWyKmFUV4OrUlq20fYx
X-Talos-MUID: 9a23:b/VtNASwaa9iII7BRXTShjF8F5Z08Z2EBWoouM8ElfXcdn1ZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544566549"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 07:34:55 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 8BCB218000201;
	Thu,  5 Nov 2026 07:34:55 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 355FACC1611; Wed,  4 Nov 2026 23:34:55 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][master][PATCH 1/3] busybox: fix CVE-2026-38752
Date: Wed,  4 Nov 2026 23:34:50 -0800
Message-Id: <20261105073452.890881-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 07:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249456
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix shown in [1].
The advisory identifying the fix is referenced in [2].

[1] https://lists.busybox.net/pipermail/busybox/2026-June/092351.html
[2] https://nvd.nist.gov/vuln/detail/cve-2026-38752

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../busybox/busybox/CVE-2026-38752.patch      | 84 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.38.0.bb   |  1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-38752.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2026-38752.patch b/meta/recipes-core/busybox/busybox/CVE-2026-38752.patch
new file mode 100644
index 0000000..1906229
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2026-38752.patch
@@ -0,0 +1,84 @@
+From a8374915ceb752f08385de1eaf1d8782246047ae Mon Sep 17 00:00:00 2001
+From: Sanghyun Park <sanghyun.park.cnu@gmail.com>
+Date: Tue, 16 Jun 2026 12:16:05 +0900
+Subject: [PATCH] awk: fix stack overflow in evaluate()
+
+Recursive awk functions can keep re-entering evaluate() until the
+process stack is exhausted. Track active function-call depth and report a
+normal awk error once the limit is reached instead of overflowing the
+stack.
+
+CVE: CVE-2026-38752
+Upstream-Status: Submitted [https://lists.busybox.net/pipermail/busybox/2026-June/092351.html]
+
+Signed-off-by: Sanghyun Park <sanghyun.park.cnu@gmail.com>
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ editors/awk.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index dd8f4ac..f15832b 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -633,6 +633,7 @@ struct globals {
+ 	smalluint exitcode;
+ 
+ 	unsigned evaluate__seed;
++	unsigned evaluate__func_depth;
+ 	var *evaluate__fnargs;
+ 	regex_t evaluate__sreg;
+ 
+@@ -703,6 +704,7 @@ static const char EMSG_UNEXP_TOKEN[] ALIGN1 = "Unexpected token";
+ static const char EMSG_DIV_BY_ZERO[] ALIGN1 = "Division by zero";
+ static const char EMSG_INV_FMT[] ALIGN1 = "Invalid format specifier";
+ static const char EMSG_TOO_FEW_ARGS[] ALIGN1 = "Too few arguments";
++static const char EMSG_RECURSION[] ALIGN1 = "Recursion limit exceeded";
+ static const char EMSG_NOT_ARRAY[] ALIGN1 = "Not an array";
+ static const char EMSG_POSSIBLE_ERROR[] ALIGN1 = "Possible syntax error";
+ static const char EMSG_UNDEF_FUNC[] ALIGN1 = "Call to undefined function";
+@@ -2988,6 +2990,7 @@ static var *evaluate(node *op, var *res)
+ #define fnargs (G.evaluate__fnargs)
+ /* seed is initialized to 1 */
+ #define seed   (G.evaluate__seed)
++#define func_depth (G.evaluate__func_depth)
+ #define sreg   (G.evaluate__sreg)
+ 
+ 	var *tmpvars;
+@@ -3299,13 +3302,17 @@ static var *evaluate(node *op, var *res)
+ 			var *argvars, *sv_fnargs;
+ 			const char *sv_progname;
+ 			int nargs, i;
++			enum { MAX_AWK_FUNC_DEPTH = 1000 };
+ 
+ 			debug_printf_eval("FUNC\n");
+ 
+ 			if (!op->r.f->defined)
+ 				syntax_error(EMSG_UNDEF_FUNC);
++			if (func_depth >= MAX_AWK_FUNC_DEPTH)
++				syntax_error(EMSG_RECURSION);
+ 
+ 			/* The body might be empty, still has to eval the args */
++			func_depth++;
+ 			nargs = op->r.f->nargs;
+ 			argvars = nvalloc(nargs);
+ 			i = 0;
+@@ -3333,6 +3340,7 @@ static var *evaluate(node *op, var *res)
+ 
+ 			g_progname = sv_progname;
+ 			fnargs = sv_fnargs;
++			func_depth--;
+ 
+ 			break;
+ 		}
+@@ -3690,6 +3698,7 @@ static var *evaluate(node *op, var *res)
+ 	return res;
+ #undef fnargs
+ #undef seed
++#undef func_depth
+ #undef sreg
+ }
+ 
+-- 
+2.35.6
+
diff --git a/meta/recipes-core/busybox/busybox_1.38.0.bb b/meta/recipes-core/busybox/busybox_1.38.0.bb
index a75c639..bf78951 100644
--- a/meta/recipes-core/busybox/busybox_1.38.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.38.0.bb
@@ -59,6 +59,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-busybox-fix-printf-ptest-failure-with-glibc-2.43.patch \
            file://CVE-2025-60876.patch \
            file://CVE-2024-58251.patch \
+           file://CVE-2026-38752.patch \
            file://CVE-2026-38754.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg"
-- 
2.35.6
