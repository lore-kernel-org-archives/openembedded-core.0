Return-Path: <pahaditechie@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9B7EF4EBE
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 07:36:21 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50217.1775460980761413549
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 00:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: ashissh7@cisco.com)
X-CSE-ConnectionGUID: jULSTOa2T0KIjVut83nKTQ==
X-CSE-MsgGUID: qbHvG46PQaOSMc7kUvJzqQ==
X-IPAS-Result: =?us-ascii?q?A0BsAwD/YdNp/5D/Ja1aHgEBCxIMggULAoJVcV5DSZZLg?=
 =?us-ascii?q?RaBf4hikiaCDgEBAQ9EDQQBAT8ChACNcgImNAkOAQIEAQEBAQMCAwEBAQEBA?=
 =?us-ascii?q?QEBAQEBCwEBBQEBAQIBBwWBDhOGTw1JAQwBhgMBLQsBGAEQEA0mBgMBAk8CC?=
 =?us-ascii?q?SMhgwIBgjkBAzYDEbYSgXkWBQIWgQGDKAGBU9d8ChkoDXGBYQELFAGBOIR4K?=
 =?us-ascii?q?R1BAYI3hSNbGAGEeicbfYEQgRWCcnaBBYEaQgIDiCEEgxwUgWEehmuHMAgHH?=
 =?us-ascii?q?xIIARwGCgJIFRIDBAMEBAECCxMJAwMCDgIIAwIIBhkBPxIEEwoDCgsHBR8KA?=
 =?us-ascii?q?gwUCigiEisKAzUSDxsVAQgGAgIEBAIEDAIJAgIFBwIRAwQBAQgCAi0DAQMZC?=
 =?us-ascii?q?AkIAgsFERgMCwcxAxAJAx8XGggBRQgGFgEaBwUGCzgVBQwRAQECRwIUAgQEA?=
 =?us-ascii?q?hIDAwQDEAMBAikDAwcIAwIHBBYKGQQFAgEuAwUHAgQBBwEDAwcDAgwCAhEFB?=
 =?us-ascii?q?AYCAQMMAwQDBQULLREHEwoGBAcFAgICFAYCEBIDAwQEAgECAgI6BA4aDgQIB?=
 =?us-ascii?q?wMHARgFAgMCBQEDAQcHEgIKCAMOAR0CAgQCCQEBCg4CAgYCAgEDCBgDBB8EA?=
 =?us-ascii?q?wMHAgIMCQMEDQISChIbAw4DDQ8CBAMMCjAQBAIHEAIJCAYKGAICAgYCAwMDB?=
 =?us-ascii?q?AkBAgEBAQEBAQECBwMDAwIDBgMXAwUHBgMEBgEEBAMDBgMDBQUBAwMFBQUHA?=
 =?us-ascii?q?gMGAwYHBwQIAwcLAQEBAQEDAgIJAQMIAwwJBAMFAyQPAwsJCAcMATwMBwooB?=
 =?us-ascii?q?DYBFBQHBCUZZwcHiyEngjQCgQ4BExcBIFuBCkOTI4MjjHGCIaAdcWiDPowej?=
 =?us-ascii?q?z6FfBozqmsLmHuOCYQJkSsCMWmEaDaBMjyBWTMaI1AxgjYJSRkPjjiDaYUTw?=
 =?us-ascii?q?QAmMgsyAQEHAgcNAwuBaIkxh2xgAQE?=
IronPort-Data: A9a23:2iMsLa8n7MjQ1QgIzGHHDrUD6X+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 jQWUTjTOfveZWLye4sla423oxgCvsTQmt9nT1RqpSFEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mpyyHjEAX9gWAsbjpKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k0AKkjxsF+W10W1
 t0aFi0RPkuFpN6PlefTpulE3qzPLeHxN48Z/3UlxjbDALN+HtbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0En1lQ/UPrSmM+hnXn+aCZY93qepLE85C7YywkZPL3Fb4KFKoLaFJUE9qqej
 nvM33rWXk8iDdW48h+OrXGRmM3dhBquDer+E5X9rJaGmma73mUTAREXSVawofi0okG7UtNbb
 UcT/0IGqrA/8kGuRNTxUxC05XWDpBM0X9tLD/Z87xmAzKfR6QuVCmUICDlbZ7QbWNQeXzcm0
 BqN2tjuHzEq6OLTQnOG/bDSpjS3UcQIEVI/ieY/ZVNty7HeTEsb13ojkv4L/HaJs+DI
IronPort-HdrOrdr: A9a23:9cs4C6rOxtu+UShAvLPw2hkaV5odeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080l6QU3WB5B97LN2PbUQCTQr2Kg7GP/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjizEht7t2uqUuEimpRGsZd0zs=
X-Talos-CUID: 9a23:QyqtGWOSWNZG7O5DWhRDz3IzE5oZKl78zknNPx/jD0VVcejA
X-Talos-MUID: 9a23:5K72eQv1t3GYKk6zac2nnTtCKug0vZyXAWc2tJ5ZuPSaFz5pAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,163,1770595200"; 
   d="scan'208";a="708868989"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Apr 2026 07:36:19 +0000
Received: from sjc-ads-21720.cisco.com (sjc-ads-21720.cisco.com [10.128.165.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id AD2E318000207;
	Mon,  6 Apr 2026 07:36:19 +0000 (GMT)
Received: by sjc-ads-21720.cisco.com (Postfix, from userid 1869324)
	id 5AA26CC1288; Mon,  6 Apr 2026 00:36:19 -0700 (PDT)
From: Ashish Sharma <pahaditechie@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ashissh7@cisco.com,
	Ashish Sharma <pahaditechie@gmail.com>
Subject: [OE-core][scarthgap][PATCH] openssh: Fix CVE-2026-35414
Date: Mon,  6 Apr 2026 00:36:18 -0700
Message-ID: <20260406073618.3629883-1-pahaditechie@gmail.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-21720.cisco.com [10.128.165.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.128.165.208, sjc-ads-21720.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 07:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234669

The match_principals_option() function in auth2-pubkeyfile.c used
match_list() (which performs glob-based, comma-separated matching)
instead of exact string comparison. When a certificate principal
name contains a comma, match_list() splits it into multiple patterns,
allowing an attacker to craft a principal name that gains unauthorized
access.

Fix by replacing match_list() with a strsep+strcmp loop for exact
principal matching.

Backport of commit fd1c7e131f331942d20f42f31e79912d570081fa from
openssh-portable 10.3p1.

CVE: CVE-2026-35414
Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
---
 .../openssh/openssh/CVE-2026-35414.patch      | 78 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-35414.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-35414.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35414.patch
new file mode 100644
index 0000000000..dbc0968a3f
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-35414.patch
@@ -0,0 +1,78 @@
+From fd1c7e131f331942d20f42f31e79912d570081fa Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 02 Apr 2026 07:48:13 +0000
+Subject: [PATCH] upstream: Fix matching of authorized_keys principals
+ option against certificate principals containing commas
+
+When matching an authorized_keys principals="" option against a list
+of principals in a certificate, an incorrect algorithm (match_list)
+was used that could allow inappropriate matching in cases where a
+principal name in the certificate contains a comma character.
+
+Exploitation requires an authorized_keys principals="" option listing
+more than one principal AND a CA that will issue a certificate encoding
+more than one of those principal names separated by a comma. Typical
+CAs strongly constrain which principal names they will place in a
+certificate. This condition only applies to user-trusted CA keys in
+authorized_keys; the main certificate authentication path
+(TrustedUserCAKeys/AuthorizedPrincipalsFile) is not affected.
+
+Reported by Vladimir Tokarev.
+
+OpenBSD-Commit-ID: c790e2687c35989ae34a00e709be935c55b16a86
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/fd1c7e131f331942d20f42f31e79912d570081fa]
+CVE: CVE-2026-35414
+Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
+---
+ auth2-pubkeyfile.c | 26 +++++++++++++++-----------
+ 1 file changed, 15 insertions(+), 11 deletions(-)
+
+diff --git a/auth2-pubkeyfile.c b/auth2-pubkeyfile.c
+index 896ea19..e729cc5 100644
+--- a/auth2-pubkeyfile.c
++++ b/auth2-pubkeyfile.c
+@@ -50,6 +50,7 @@
+ #include "authfile.h"
+ #include "match.h"
+ #include "ssherr.h"
++#include "xmalloc.h"
+ 
+ int
+ auth_authorise_keyopts(struct passwd *pw, struct sshauthopt *opts,
+@@ -146,20 +147,23 @@ auth_authorise_keyopts(struct passwd *pw, struct sshauthopt *opts,
+ static int
+ match_principals_option(const char *principal_list, struct sshkey_cert *cert)
+ {
+-	char *result;
++	char *list, *olist, *entry;
+ 	u_int i;
+ 
+-	/* XXX percent_expand() sequences for authorized_principals? */
+-
+-	for (i = 0; i < cert->nprincipals; i++) {
+-		if ((result = match_list(cert->principals[i],
+-		    principal_list, NULL)) != NULL) {
+-			debug3("matched principal from key options \"%.100s\"",
+-			    result);
+-			free(result);
+-			return 1;
++	olist = list = xstrdup(principal_list);
++	for (;;) {
++		if ((entry = strsep(&list, ",")) == NULL || *entry == '\0')
++			break;
++		for (i = 0; i < cert->nprincipals; i++) {
++			if (strcmp(entry, cert->principals[i]) == 0) {
++				debug3("matched principal from key i"
++				    "options \"%.100s\"", entry);
++				free(olist);
++				return 1;
++			}
+ 		}
+ 	}
++	free(olist);
+ 	return 0;
+ }
+ 
+-- 
+2.25.1
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 1cdd888ccb..4d0b9afca0 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2025-32728.patch \
            file://CVE-2025-61985.patch \
            file://CVE-2025-61984.patch \
+           file://CVE-2026-35414.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.44.4


