Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 22F7277228
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:19 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id sv5so919427pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=bp7Oc7ipjoDSWmz0g6/T+w19sHMUMTZKxS/zSXsa7Y4=;
	b=RFJL2nkvlHQh7Ia2PQ4by7NPOyQXF5NP3xUe6nfYvB88u1x0l5t286isAT3PD++/mU
	Z6hReZxLtobciXekfcu6JNpXRZimyuclEyAPQTNWkjPkeHey+mpzF3jJUH1rhS1f0yic
	LmCU/pKFALsB8IJu75ie83++20sZQtUyLjMYIAZWJ9R0zCeNlP49PoAZA5pIaaRKBlKO
	m985KvzqDWj7XdPXKyK87USv8adz5u3sPWe6bWoXFOSskSqmg5kT15OFjvLw9sHxfMk3
	rb6J2is+tnSiESxMpm+tLCo8A0ighXE3sQYizv5X/f2TC5xJo/gkz/SFq1mN/wR42V92
	uo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=bp7Oc7ipjoDSWmz0g6/T+w19sHMUMTZKxS/zSXsa7Y4=;
	b=jxjss7KZ5CtRaAzFA/XsEtjNx6DW9yam6KW6r9NhGIIPpNVmjX7WHb8VxoSmhf26ni
	uC+pWivjJJHePeNtUXNBb2erFOvvjDqQMNYxUrnbwk79PmNoyJX2QY/K8JzbuSRUCU+x
	noxPvm1/cOQXwdMAJ6RtOUEE59jUHf8/Dl96zsk8CaiStfX/LMlKQacoP/XWuLmNDLmv
	1A7hAxAJ/XBFA73TQ7E8UIGyD2l8yfbpgVuaVs2MfURyop/RMaeqANVI0xXuq7dT9cyN
	MBxf3XzwqUDLuZbr0MazxGVMxXC7a0xkLj/DM4MP6wtdt3bbCmPAAqTcdhPo7ur60xb+
	cOCg==
X-Gm-Message-State: AG10YOR3Qx4r9tI+kSx8JuwqoD6xJYu7UlbksUeYYXcjWxO7Nuuw2DG5wr0t/sBwZtrPCA==
X-Received: by 10.67.1.164 with SMTP id bh4mr30947014pad.118.1454800520559;
	Sat, 06 Feb 2016 15:15:20 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:14:46 -0800
Message-Id: <7fb1d51d6a0bd817a48caed35bbb2747d77e748d.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 05/21] openssl: Security fix CVE-2015-3197
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Feb 2016 23:15:20 -0000

CVE-2015-3197 OpenSSL: SSLv2 doesn't block disabled ciphers

(From OE-Core rev: b387d9b8dff8e2c572ca14f9628ab8298347fd4f)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../openssl/openssl/CVE-2015-3197.patch            | 63 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3197.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3197.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3197.patch
new file mode 100644
index 0000000..dd288c9
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3197.patch
@@ -0,0 +1,63 @@
+From d81a1600588b726c2bdccda7efad3cc7a87d6245 Mon Sep 17 00:00:00 2001
+From: Viktor Dukhovni <openssl-users@dukhovni.org>
+Date: Wed, 30 Dec 2015 22:44:51 -0500
+Subject: [PATCH] Better SSLv2 cipher-suite enforcement
+
+Based on patch by: Nimrod Aviram <nimrod.aviram@gmail.com>
+
+CVE-2015-3197
+
+Reviewed-by: Tim Hudson <tjh@openssl.org>
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+
+Upstream-Status: Backport
+https://github.com/openssl/openssl/commit/d81a1600588b726c2bdccda7efad3cc7a87d6245
+
+CVE: CVE-2015-3197
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ssl/s2_srvr.c | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+Index: openssl-1.0.2d/ssl/s2_srvr.c
+===================================================================
+--- openssl-1.0.2d.orig/ssl/s2_srvr.c
++++ openssl-1.0.2d/ssl/s2_srvr.c
+@@ -402,7 +402,7 @@ static int get_client_master_key(SSL *s)
+         }
+ 
+         cp = ssl2_get_cipher_by_char(p);
+-        if (cp == NULL) {
++        if (cp == NULL || sk_SSL_CIPHER_find(s->session->ciphers, cp) < 0) {
+             ssl2_return_error(s, SSL2_PE_NO_CIPHER);
+             SSLerr(SSL_F_GET_CLIENT_MASTER_KEY, SSL_R_NO_CIPHER_MATCH);
+             return (-1);
+@@ -687,8 +687,12 @@ static int get_client_hello(SSL *s)
+             prio = cs;
+             allow = cl;
+         }
++
++        /* Generate list of SSLv2 ciphers shared between client and server */
+         for (z = 0; z < sk_SSL_CIPHER_num(prio); z++) {
+-            if (sk_SSL_CIPHER_find(allow, sk_SSL_CIPHER_value(prio, z)) < 0) {
++            const SSL_CIPHER *cp = sk_SSL_CIPHER_value(prio, z);
++            if ((cp->algorithm_ssl & SSL_SSLV2) == 0 ||
++                sk_SSL_CIPHER_find(allow, cp) < 0) {
+                 (void)sk_SSL_CIPHER_delete(prio, z);
+                 z--;
+             }
+@@ -697,6 +701,13 @@ static int get_client_hello(SSL *s)
+             sk_SSL_CIPHER_free(s->session->ciphers);
+             s->session->ciphers = prio;
+         }
++
++        /* Make sure we have at least one cipher in common */
++        if (sk_SSL_CIPHER_num(s->session->ciphers) == 0) {
++            ssl2_return_error(s, SSL2_PE_NO_CIPHER);
++            SSLerr(SSL_F_GET_CLIENT_HELLO, SSL_R_NO_CIPHER_MATCH);
++            return -1;
++        }
+         /*
+          * s->session->ciphers should now have a list of ciphers that are on
+          * both the client and server. This list is ordered by the order the
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index a4e2f67..4a96a44 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -39,6 +39,7 @@ SRC_URI += "file://configure-targets.patch \
             file://CVE-2015-3194-1-Add-PSS-parameter-check.patch \
             file://0001-Add-test-for-CVE-2015-3194.patch \
             file://CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch \
+            file://CVE-2015-3197.patch \
            "
 
 SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
-- 
2.3.5


