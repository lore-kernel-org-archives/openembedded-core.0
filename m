Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4386.1793965705212723709
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 03:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=eNWZGHd3;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso3648605e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 03:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793965703; x=1794570503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DSmdl9KwRFPWxHgo7Jg9CkmqkZWgRnwcSTzurGgPr4c=;
        b=eNWZGHd37+lZsfBPJTzl2v+UE0TZ38tgb6g7OFbqyilBQQUNcB0TFQOdi5tMD9dMXI
         dnqf9DzIDhPia6h9RTI+4x0IgBFCnNXp+5v/ht7x0X0RmmkaJncLj7rAX8EerSjLLKep
         u1jY5wbHhzHnYP75acTD1E2PKW6CLMo5cH2NOYRAR1sR+CuxV8jE+KQ07KbOUUNJv+yE
         5z8+4fltjrGUPuGQSO51bUoEYxmqUBm8yta5VPEfdS6K9T/Ni8dGngTCJdAYC/A79b4u
         dnRxC/KQig5Pk6m97O3FgOdExoUX74BQyIwBVuGlfiBTRPzkLMdI2KSO2m5TFe/9608+
         efpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793965703; x=1794570503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSmdl9KwRFPWxHgo7Jg9CkmqkZWgRnwcSTzurGgPr4c=;
        b=lNAX/VlTaQBnHE475BuYX4EMbYJSAG6qXSq64CGvQYF0PErPCaBDNUfYlxQPk/kyLI
         zqoWhyXwLdepN1DuRETf2dulJ6h+hIFJj5IlSZqZMJg58WANoF3y2LaYWv3T9mYgbtJX
         WoR/N8/tNQvcGFH+IwHyLQ9zXn185XwG3htOfw4Ra7JJM1c8QRoA5Csk+Pi4P0VyiRUx
         BPKkF5ASulVVXsYfSPq/E55kFX30IY3mCYtaLHCFr88RhvUf2IynxevQiAoKEqgctDjx
         o3uJEFe4iC+YYBDNsb2BuyCDVMYEz1tjudoWe9aU9WaIiuK0qAkU23gmLNx3MTq1+an+
         7Ftw==
X-Gm-Message-State: APuU4Z8x0jYknWFvT9keWpGNz8PEgmarcAt1bEPtTsIeTnCfgI+jQOcr
	QwxLoOpqWrxuCr3Zq+pBA6U3/otmZ0nMthDEDks5VM3L5Bam6hqM1Q/SbN98wWSRa7w4umKUzbW
	XY3Todn0=
X-Gm-Gg: AYBFou36aFvT2ss7Cxylgtbfp33wtINwraG3QfFVoUoTCd1yj80kd7lWj7KGa9u6IOB
	A7ZGkhaFpL0D+kHFK6tYgaelJxZvj7UntEaPo5PqkIluTeTWSAwh4RSpHP0bOT19vPKGqN88vHk
	m+ZVgDtN5/eSzX9N5pepQpQrFw9k2n6cB0MUMRBhxImdHKGsbyzQKY3CIgkY854vvnwlQJAzRiV
	Fm6jKmJxhRXzQMNJUNA8ZKOibux15JcTjrfa6rQa7+eoKLRVgydWEwYgAI090Y26PqkGFLcOFrJ
	je6IlvTUnOpDXsPFQ2tdPL3QD3BZETejQ4deQBggRrUbwgFmzBqGn9+V/HUQKKgv1eJDaKxv05Z
	EIxci6MYSpM5XEz+uJqtk+C3FsdHJCXhuSxY3/a+Jq7kcjOdZtd9VRIJIihN5v0P6r6QrojJoen
	Nj6X3r28JlaPA12nc3CRVISQa4YWLjDOcLHkkr09dO0h5FM0OA7u5XUZcW+fWtgKmNO8s7MRQcs
	ojXe28zeQKC0PCNarWumxRaYKK3ZFEEtgbbmX91v+4OBRRb+A4pFQiKv4EOd5VcgRtjT5/Ojlx+
	pWzd2t9GFm7UPblL9/eGsnrgc8skhBviGvQ6+XE4p+8d/wHku8VEybyNxHHyCOrZxZ8q0RkmPhq
	HIUW6O6CzIA4fZy29+g80Tl2oJH9X
X-Received: by 2002:a05:600c:4747:b0:4b3:6900:280c with SMTP id 5b1f17b1804b1-4b6de3b17f2mr41542205e9.19.1793965703214;
        Fri, 06 Nov 2026 03:48:23 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6187sm3314126f8f.46.2026.11.06.03.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:48:22 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [blacksail][PATCH] openssh: fix CVE-2026-123158 (aka "sshhole")
Date: Fri,  6 Nov 2026 12:47:56 +0100
Message-ID: <20261106114756.3807676-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 11:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249632
Content-Type: text/plain; charset="utf-8"

From: Yoann Congal <yoann.congal@smile.fr>

Backport the fix referenced by NVD[0].

[0]: https://nvd.nist.gov/vuln/detail/cve-2026-123158

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-123158.patch     | 191 ++++++++++++++++++
 .../openssh/openssh_10.5p1.bb                 |   1 +
 2 files changed, 192 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-123158.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-123158.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-123158.patch
new file mode 100644
index 00000000000..6fb42827a02
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-123158.patch
@@ -0,0 +1,191 @@
+From 66caf6873206a863372f696083929c6cc69ea9ee Mon Sep 17 00:00:00 2001
+From: Damien Miller <djm@mindrot.org>
+Date: Thu, 5 Nov 2026 08:18:18 +1100
+Subject: [PATCH] avoid password authn bypass
+
+This bypass affects some configurations and runtime configurations.
+We do not consider the root cause to be within OpenSSH but we are
+well equipped to avoid it.
+
+CVE: CVE-2026-123158
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/4353fdc43ef646c43a8dda7025cc1a898caf1482]
+
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ auth-passwd.c            | 17 +++++++++++++----
+ openbsd-compat/port-uw.c | 16 ++++++++--------
+ openbsd-compat/xcrypt.c  | 18 +++++++++++++-----
+ 3 files changed, 34 insertions(+), 17 deletions(-)
+
+diff --git a/auth-passwd.c b/auth-passwd.c
+index a9d768891..fb3b22a05 100644
+--- a/auth-passwd.c
++++ b/auth-passwd.c
+@@ -50,6 +50,7 @@
+ #include "ssherr.h"
+ #include "log.h"
+ #include "misc.h"
++#include "xmalloc.h"
+ #include "servconf.h"
+ #include "sshkey.h"
+ #include "hostfile.h"
+@@ -67,6 +68,7 @@ extern login_cap_t *lc;
+ #define DAY		(24L * 60 * 60) /* 1 day in seconds */
+ #define TWO_WEEKS	(2L * 7 * DAY)	/* 2 weeks in seconds */
+ 
++#define MIN_PASSWORD_HASH_LEN	4
+ #define MAX_PASSWORD_LEN	1024
+ 
+ /*
+@@ -194,16 +196,20 @@ sys_auth_passwd(struct ssh *ssh, const char *password)
+ 	Authctxt *authctxt = ssh->authctxt;
+ 	struct passwd *pw = authctxt->pw;
+ 	char *encrypted_password, *salt = NULL;
++	int ret;
+ 
+ 	/* Just use the supplied fake password if authctxt is invalid */
+-	char *pw_password = authctxt->valid ? shadow_pw(pw) : pw->pw_passwd;
++	char *pw_password = authctxt->valid ?
++	    shadow_pw(pw) : xstrdup(pw->pw_passwd);
+ 
+ 	if (pw_password == NULL)
+ 		return 0;
+ 
+ 	/* Check for users with no password. */
+-	if (strcmp(pw_password, "") == 0 && strcmp(password, "") == 0)
+-		return (1);
++	if (strcmp(pw_password, "") == 0 && strcmp(password, "") == 0) {
++		free(pw_password);
++		return 1;
++	}
+ 
+ 	/*
+ 	 * Encrypt the candidate password using the proper salt, or pass a
+@@ -217,7 +223,10 @@ sys_auth_passwd(struct ssh *ssh, const char *password)
+ 	 * Authentication is accepted if the encrypted passwords
+ 	 * are identical.
+ 	 */
+-	return encrypted_password != NULL &&
++	ret = encrypted_password != NULL &&
++	    strlen(pw_password) >= MIN_PASSWORD_HASH_LEN &&
+ 	    strcmp(encrypted_password, pw_password) == 0;
++	freezero(pw_password, strlen(pw_password));
++	return ret;
+ }
+ #endif
+diff --git a/openbsd-compat/port-uw.c b/openbsd-compat/port-uw.c
+index 074f80c8d..5c50ffa0f 100644
+--- a/openbsd-compat/port-uw.c
++++ b/openbsd-compat/port-uw.c
+@@ -58,14 +58,17 @@ sys_auth_passwd(struct ssh *ssh, const char *password)
+ 	int result;
+ 
+ 	/* Just use the supplied fake password if authctxt is invalid */
+-	char *pw_password = authctxt->valid ? shadow_pw(pw) : pw->pw_passwd;
++	char *pw_password = authctxt->valid ?
++	    shadow_pw(pw) : xstrdup(pw->pw_passwd);
+ 
+ 	if (pw_password == NULL)
+ 		return 0;
+ 
+ 	/* Check for users with no password. */
+-	if (strcmp(pw_password, "") == 0 && strcmp(password, "") == 0)
+-		return (1);
++	if (strcmp(pw_password, "") == 0 && strcmp(password, "") == 0) {
++		free(pw_password);
++		return 1;
++	}
+ 
+ 	/* Encrypt the candidate password using the proper salt. */
+ 	salt = (pw_password[0] && pw_password[1]) ? pw_password : "xx";
+@@ -83,11 +86,8 @@ sys_auth_passwd(struct ssh *ssh, const char *password)
+ #endif /* UNIXWARE_LONG_PASSWORDS */
+ 		result = (strcmp(xcrypt(password, salt), pw_password) == 0);
+ 
+-#ifdef USE_LIBIAF
+-	if (authctxt->valid)
+-		free(pw_password);
+-#endif
+-	return(result);
++	freezero(pw_password, strlen(pw_password));
++	return result;
+ }
+ 
+ #ifdef UNIXWARE_LONG_PASSWORDS
+diff --git a/openbsd-compat/xcrypt.c b/openbsd-compat/xcrypt.c
+index 9cded6684..2721b3342 100644
+--- a/openbsd-compat/xcrypt.c
++++ b/openbsd-compat/xcrypt.c
+@@ -25,6 +25,8 @@
+ #include "includes.h"
+ 
+ #include <sys/types.h>
++#include <stdarg.h>
++#include <stdlib.h>
+ #include <string.h>
+ #include <unistd.h>
+ #include <pwd.h>
+@@ -59,6 +61,8 @@
+ #  define crypt DES_crypt
+ # endif
+ 
++#include "xmalloc.h"
++
+ #define MINIMUM(a, b)	(((a) < (b)) ? (a) : (b))
+ 
+ /*
+@@ -71,7 +75,7 @@ static const char *
+ pick_salt(void)
+ {
+ 	struct passwd *pw;
+-	char *passwd, *p;
++	char *passwd = NULL, *p;
+ 	size_t typelen;
+ 	static char salt[32];
+ 
+@@ -80,6 +84,8 @@ pick_salt(void)
+ 	strlcpy(salt, "xx", sizeof(salt));
+ 	setpwent();
+ 	while ((pw = getpwent()) != NULL) {
++		if (passwd != NULL)
++			freezero(passwd, strlen(passwd));
+ 		if ((passwd = shadow_pw(pw)) == NULL)
+ 			continue;
+ 		if (passwd[0] == '$' && (p = strrchr(passwd+1, '$')) != NULL) {
+@@ -90,6 +96,8 @@ pick_salt(void)
+ 		}
+ 	}
+  out:
++	if (passwd != NULL)
++		freezero(passwd, strlen(passwd));
+ 	endpwent();
+ 	return salt;
+ }
+@@ -122,9 +130,8 @@ xcrypt(const char *password, const char *salt)
+ 
+ /*
+  * Handle shadowed password systems in a cleaner way for portable
+- * version.
++ * version. Caller must free returned value.
+  */
+-
+ char *
+ shadow_pw(struct passwd *pw)
+ {
+@@ -138,7 +145,8 @@ shadow_pw(struct passwd *pw)
+ # endif
+ 
+ #ifdef USE_LIBIAF
+-	return(get_iaf_password(pw));
++	pw_password = get_iaf_password(pw);
++	return pw_password == NULL ? NULL : xstrdup(pw_password);
+ #endif
+ 
+ # if defined(HAVE_GETPWANAM) && !defined(DISABLE_SHADOW)
+@@ -152,5 +160,5 @@ shadow_pw(struct passwd *pw)
+ 		pw_password = spw->ufld.fd_encrypt;
+ # endif
+ 
+-	return pw_password;
++	return pw_password == NULL ? NULL : xstrdup(pw_password);
+ }
diff --git a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
index 052686f2896..297caacc427 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://run-ptest \
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
+           file://CVE-2026-123158.patch \
            "
 SRC_URI[sha256sum] = "d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11"
 
