Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2401.1793956886665127260
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 01:21:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JCQVr4EL;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5051; q=dns/txt;
  s=iport01; t=1793956886; x=1795166486;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=7TFDNWvo14yuQftCIhE88mRhqD78h+zk8HAc3nWi5GI=;
  b=JCQVr4ELQrnxoe4RZjA/c6i5FzMpTYKzj6Fy3ka2urQrEVx/Uq45TGgo
   +Bqhf8RZNgcHj1f3OGk+NzlehnQIqY2ha3mWfLHED3foS19HPmbOcltPw
   cRRKoZ3aX+ybpJu9VSK53scWdINGhbuX9VwNCfqzB1+pJgQ3vdfenMCbf
   I1gS399qVO0x4raszmRw2Sfj274xI+mLZjXFeTRA8y8pMDh5/Uryy3o8n
   O/TzysVYASZ1fnDADMTb6nfDI79yO4obRo69U1N5UHerWxWAkfDz/wpvC
   hyjfYUG3MX9mshCf+7KwaEeM6GNVGpiA8tTMbZcaFF/sLYqY54Fes74z+
   A==;
X-CSE-ConnectionGUID: kBCvjpR+RwWM2cK6Vgy6QQ==
X-CSE-MsgGUID: AhzDx7gSSLiErOWdeGa5QQ==
X-IPAS-Result: =?us-ascii?q?A0AnAABjmu1q/5L/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJA4xvhziCIQOeIYF+DwEBAQ9EDQQBAYUFAo4dAiY0CQ4BAgQDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAzIBGAE9HAMBAi8rI?=
 =?us-ascii?q?wgZGoJoAYJ0AxG8KYIsgQGDKQE/AkNQ2zMBCxQBgTgBhT+II10YAYR9Jxsbg?=
 =?us-ascii?q?XKBFAGDaYEFgVwCggaGIASCInoSgVoehiKGWAKBUYZ5SIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBaAM1EioVbjIdgSM+F4EHGwYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACA?=
 =?us-ascii?q?UlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJ?=
 =?us-ascii?q?C8FHCY+GwovGA1IESw3FRkEPm4Hkj2DEQE9HCITASuBaAEUEB8RCzKScZAWg?=
 =?us-ascii?q?iGhEQoog3iMJJU6GjOFW6UWC5h9jgqWUYRpgWg8gVlwFYMiCUoZD44uCwuBU?=
 =?us-ascii?q?YIPM4Ijgj3GZSYyAgkDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:P4pmEq7Fo3vdxd6tnlkP4AxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 jcfUWHXM/7bZmqmfN9/borjoEkA78XQn4VrGgRoqi4wZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztMtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4ePqcz5ORvOyJ06
 sM9cjsuMC6MlryP+efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcGFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkERUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FbYGNJYPQG5wJ9qqej
 kvG7UjpXR4hD/ie5CCizX6hqeaSpBquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:bw/1UanXlEPJKKeGRS4aoHN5LPnpDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:5NYd3GOQibTiuu5DWwNM6kwMIIMfbUL4lnzzfXG3GDhQcejA
X-Talos-MUID: 9a23:4fEOsAjIkgKm6LVZdXPHoMMpHcd6z7TxB3s2tZQroe67OSFfMmqktWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="530772614"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 09:21:25 +0000
Received: from sjc-ads-7857.cisco.com (sjc-ads-7857.cisco.com [10.30.222.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 86C141800023D
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 09:21:25 +0000 (GMT)
Received: by sjc-ads-7857.cisco.com (Postfix, from userid 1887505)
	id 2CE5CCBEF5A; Fri,  6 Nov 2026 01:21:25 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail][PATCH  2/3] lrzsz: fix CVE-2026-105840
Date: Fri,  6 Nov 2026 01:21:24 -0800
Message-Id: <20261106092125.2587191-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106092125.2587191-1-hthakar@cisco.com>
References: <20261106092125.2587191-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7857.cisco.com [10.30.222.144];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.222.144, sjc-ads-7857.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249625
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
 .../lrzsz/lrzsz-0.12.20/CVE-2026-105840.patch | 105 ++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb       |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105840.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105840.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105840.patch
new file mode 100644
index 0000000000..e9820e3a4d
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/CVE-2026-105840.patch
@@ -0,0 +1,105 @@
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
index 403266743e..ec98f69015 100644
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

