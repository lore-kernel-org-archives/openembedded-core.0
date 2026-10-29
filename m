Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8730.1793269814735903056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 03:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AAoD9dMf;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5202; q=dns/txt;
  s=iport01; t=1793269814; x=1794479414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2mjoNzHsHFVo0MyhDHqLlq/XYB6dKQkDj/Q2JQkvebE=;
  b=AAoD9dMf6yVrcT2gKuyf7aOEHlxwdw3yjQrLSaBvavsHIY1dP/Rhp155
   X56IoZyljnsRl9Ar6lqwfJz7yBbMQbnLdK5dF4a03sAoggH989cjf82Pa
   HLIYM240UtiCk1Ld+KUuTiHXcHZ/Q/oRmsmKlE3q9ZfT9TFqXpGMfr2Sf
   DxsE+vl1c76ekMnar20LWUYxO/TVYNZ1eRf5aIzj3IBpnUMmL7RrwY05e
   aX92kNw9+qRhi5o40na1QbuKcxKuVtEncI5mSpOJaK7n867SsV67i8v8a
   F7UjcGSSBXI8BDMgQRuuo1yzVXQOW4t6JKGW8lky9ef/XNxY8wVYf2URj
   g==;
X-CSE-ConnectionGUID: uY8RN4L6TryLbseMla6b3Q==
X-CSE-MsgGUID: LF6pIOOJQJ6ULred4UcLZw==
X-IPAS-Result: =?us-ascii?q?A0BIAgAiH+Nq/5D/Ja1aHgEBCxIMggULgld1YENJA5ZIA?=
 =?us-ascii?q?54cgX4PAQEBD0QNBAEBhQUCjhwCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NkBIBAgEDMgEYAS0QHAMBAi8rIwgZGoJoAYJ0AxG0T?=
 =?us-ascii?q?IIsgQGDKQE/AkNQ2zMBCxQBBYEzhUCII10YAYR9JxsbgXKBFAGDaYEFgVwCg?=
 =?us-ascii?q?gaGHwSCInoSgVoehjKGXgKHU0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBBxsGBYEdgR6BGYEHXYErKWABIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckI?=
 =?us-ascii?q?ggSCQETGi4LgRo1PAkmQRUMZAsaBWIIAg0MdjkQMSAmMgQDHRgNSBEsNxUZB?=
 =?us-ascii?q?D5uB5Fdgw0BPRwiEwErgWgBFBAfEQsyknGQFoIhoQ8KKIN2jCKVOhozhVulF?=
 =?us-ascii?q?AuYfY4KllCEaYFoPIFZcBWDIglKGQ+OLgsLgVGCDzOCI4I9yUcnMgIJAy8BA?=
 =?us-ascii?q?QcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:B531DaJyJW0IHytPFE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENS0DRWm
 GUaC2rQPfaLYmvzeNEiaoXjo05X68CHztdrSQcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2Qlajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1zPREMG9E8pNptEEVE7
 vE9LDlTZEu60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUrAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEiojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQsi+OwaoqPJILiqcN9umjGv
 kPh2EbAIE8nEMaSxWa4+Vaembqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXOIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:0PU4QKwX41mwtDuC9cZ7KrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: =?us-ascii?q?9a23=3ApKX2K2ovTmkhh6/A6je6EZXmUd0UIkf7kFOOH1W?=
 =?us-ascii?q?pLWxyRZiRQAGao5oxxg=3D=3D?=
X-Talos-MUID: 9a23:q5iiIgjNnYzdOwrhw1kjAsMpEOk2+4WJL2I0s8s7n9OJOXBNMBOvk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,184,1787011200"; 
   d="scan'208";a="533528266"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Oct 2026 10:30:13 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id CD1D918000228;
	Thu, 29 Oct 2026 10:30:12 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 73C29CBF201; Thu, 29 Oct 2026 03:30:12 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH v2 2/3] lrzsz: fix CVE-2026-105840
Date: Thu, 29 Oct 2026 03:30:11 -0700
Message-Id: <20261029103012.2335950-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261029103012.2335950-1-hthakar@cisco.com>
References: <20261029103012.2335950-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 10:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248932
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

When built without PUBDIR support, lrz does not reject absolute
pathnames in restricted mode. A malicious sender can therefore
write outside the receive directory, subject to the receiving
user's filesystem permissions.
Backport upstream commit [1], which removes PUBDIR support and
makes absolute-path rejection unconditional in the restricted-mode
checks, addressing the vulnerability described in [2].

[1] https://github.com/UweOhse/lrzsz/commit/b1fc8a01e3a074f8462a29dca45ed7c8fd2ef665
[2] https://security-tracker.debian.org/tracker/CVE-2026-105840

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
Changes in v2:
- corrected the advisory reference in commit messsage
---
 .../lrzsz/lrzsz-0.12.20/CVE-2026-105840.patch | 106 ++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105840.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105840.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105840.patch
new file mode 100644
index 00000000000..1bf5eae803c
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105840.patch
@@ -0,0 +1,106 @@
+From b1fc8a01e3a074f8462a29dca45ed7c8fd2ef665 Mon Sep 17 00:00:00 2001
+From: Uwe Ohse at akiar <uwe@ohse.de>
+Date: Mon, 10 Aug 2026 18:09:20 +0200
+Subject: [PATCH] remove PUBDIR, fix the 2nd security hole found by
+ tristaninsec
+
+CVE: CVE-2026-105840
+Upstream-Status: Backport [https://github.com/UweOhse/lrzsz/commit/b1fc8a01e3a074f8462a29dca45ed7c8fd2ef665]
+
+Backport Changes:
+- Applied the configure.ac change to configure.in, which is the build
+  configuration filename used by lrzsz 0.12.20.
+- Omitted NEWS because its 0.13.0 release-note hunk conflicts with the
+  0.12.20 release history and is not needed for the security fix.
+
+(cherry picked from commit b1fc8a01e3a074f8462a29dca45ed7c8fd2ef665)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ configure.in |  7 -------
+ src/lrz.c    | 16 +++++-----------
+ src/lsz.c    |  9 ++-------
+ 3 files changed, 7 insertions(+), 25 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index b7c3c31..504bd32 100644
+--- a/configure.in
++++ b/configure.in
+@@ -37,13 +37,6 @@ AC_ARG_ENABLE(timesync,
+ 	  fi],
+ 	[AC_DEFINE(ENABLE_TIMESYNC)])
+ AC_SUBST(ENABLE_TIMESYNC)
+-AC_ARG_ENABLE(pubdir,
+-	[--enable-pubdir=/path   include support for a public writeable directory],
+-	[if test "$enableval" = "no" ; then 
+-		: 
+-	  else 
+-	    AC_DEFINE_UNQUOTED(PUBDIR,"$enableval")
+-	  fi])
+ AC_ARG_ENABLE(mkdir,
+ 	[--disable-mkdir   disable support for creating directories (lrz)],
+ 	[if test "$enableval" = "no" ; then 
+diff --git a/src/lrz.c b/src/lrz.c
+index 9c08a3d..168636e 100644
+--- a/src/lrz.c
++++ b/src/lrz.c
+@@ -1553,12 +1553,10 @@ chkinvok(const char *s)
+ }
+ 
+-/*
+- * Totalitarian Communist pathname processing
+- */
+ static void 
+ checkpath(const char *name)
+ {
+ 	if (Restricted) {
++                FILE *noleak = NULL;
+ 		const char *p;
+ 		p=strrchr(name,'/');
+ 		if (p)
+@@ -1595,20 +1593,16 @@ checkpath(const char *name)
+ 			p=name;
+ 		/* don't overwrite any file in very restricted mode.
+ 		 * don't overwrite hidden files in restricted mode */
+-		if ((Restricted==2 || *name=='.') && fopen(name, "r") != NULL) {
++		if ((Restricted==2 || *name=='.') && (noleak = fopen(name, "r")) != NULL) {
++                        fclose(noleak);
+ 			canit(STDOUT_FILENO);
+ 			vstring("\r\n");
+ 			vstringf(_("%s: %s exists\n"), 
+ 				program_name, name);
+ 			bibi(-1);
+ 		}
+-		/* restrict pathnames to current tree or uucppublic */
+-		if ( strstr(name, "../")
+-#ifdef PUBDIR
+-		 || (name[0]== '/' && strncmp(name, PUBDIR, 
+-		 	strlen(PUBDIR)))
+-#endif
+-		) {
++		/* restrict pathnames to the current tree */
++		if ( strstr(name, "../") || name[0] == '/') {
+ 			canit(STDOUT_FILENO);
+ 			vstring("\r\n");
+ 			vstringf(_("%s:\tSecurity Violation"),program_name);
+diff --git a/src/lsz.c b/src/lsz.c
+index 69f4fb8..3dd91b1 100644
+--- a/src/lsz.c
++++ b/src/lsz.c
+@@ -1009,13 +1009,8 @@ wcs(const char *oname, const char *remotename)
+ 
+ 
+ 	if (Restricted) {
+-		/* restrict pathnames to current tree or uucppublic */
+-		if ( strstr(oname, "../")
+-#ifdef PUBDIR
+-		 || (oname[0]== '/' && strncmp(oname, MK_STRING(PUBDIR),
+-		 	strlen(MK_STRING(PUBDIR))))
+-#endif
+-		) {
++		/* restrict pathnames to current tree */
++		if ( strstr(oname, "../") || oname[0] == '/') {
+ 			canit(STDOUT_FILENO);
+ 			vchar('\r');
+ 			error(1,0,
+-- 
+2.35.6
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 403266743e0..ec98f690153 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
            file://0001-Fix-build-with-GCC-15.patch \
            file://0001-lrzsz-convert-K-R-function-definitions-to-ANSI-C-pro.patch \
            file://CVE-2026-105841.patch \
+           file://CVE-2026-105840.patch \
            "
 SRC_URI[sha256sum] = "c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1"
 
-- 
2.35.6

