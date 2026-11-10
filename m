Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20.1794324483614175051
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:28:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=cPLE5wuX;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so26654965e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 07:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794324482; x=1794929282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHi60aU/MwY5d+e1Lr3mBc1aoagegysEWpX+w+Ai2Qg=;
        b=cPLE5wuXMZ0/7eDwiEvUGR4vEQhH084Qc+W0IOpwWvjHyMomRdrcNGhYYTM6bPh3hc
         +h2GN0lVFg89jY3Lnk6CqQD5RiuEYlvQEMqMeUsOJCcQLeW3rzVHngBLcnqwmGwZirPL
         V6OVydLHu3E4DQcfpJ239ztT1RJvWQTi8aisbqvurY4ilV8Jmi8e2ZEPdCGKwXFRiGyn
         z9JFrie80vDCt/moCyMlYWNopSb5Tedmb2NE10adI8uZEyQMO6qy1WScg1s+3ClZAbR9
         klBmQ7pPiUWtq0iR4lC7za7sqqhzWZVNgRiOzwBKMN94oViKXoBPqko32kdv8fXgVCsu
         HrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324482; x=1794929282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YHi60aU/MwY5d+e1Lr3mBc1aoagegysEWpX+w+Ai2Qg=;
        b=CzX4yAH4LquqROGB5djbEk+opPnF4wbH5yOQ5fNYvIIqiaMiDp+wt5qjqAp7KO8/Qr
         GwZG2ZLNYB1ZCg+6yCMx6eDkAZy+gSQcmimtvqNURWvEub41wcV8LOqMsZEXDHpwv/ox
         cLvFsD1GIYnboll1Kb31p6uvB/dXTQbS/9W2s1PmtUnHHLHCauWhWE090SVNOFQCYFz5
         4CUxpncPDXtVGvfYzo8vcrJwpk8FtRpwk5F0yOCENZs5ph5RmKNC4HAT2ayS6Kb1zuKi
         aYap6TEz4s6cay+jhnPczQbx0dC5lT6GvqiussOjqOwYzaa6p5jNGcgOVKXcCYHtnOCj
         44Ug==
X-Gm-Message-State: APuU4Z/XyuvuIoGKlwaKKIn3FU+kdALaoZ0A9P6M8RkA/GNjPsL+DTnL
	G0+xMIzaZwhrO9lPpX81GHBi+D3Jz31w90NkPQyJYJgQw52nLfRn59iERj9qsJWV2ZHzmTHkQX3
	/CBQEUiU=
X-Gm-Gg: AYBFou37ZtlaV7NuXrsf++VBzGO0RvWnc7sJFpiUIYiOGFpY0eJ7QfxyUAU1M7AnOGX
	F4EUu83FWXGQ8TZJnKvgVdbLAwUXRC93K2JI82qZLmt0uE7hcXqaMHfKTvbXkj8Qlmf+YMU0xuO
	iq92UcIpLQENPEdUE8QboB4BS2M3SpnmKGVbsMomaAVsvNDzUH+liFPT9hUR86x+TsMVhDNeJ+6
	+t+Hp7KhSGalyf2NO89kgH3ZwXQX7938PBQo7eY4EKiA+f9xUv2P14+E6PS1IWBPkRXQ+uANKZk
	Mdb5ixYYcP48jmyhLaG2oofuzBZasTzzokt9y2asxgrGs8YWz9zRMB3Cs2R0Nm+J4egx2gLg1Gu
	W5Vev79VXyXs9Znqd4FfAPbLmFlq++S2/oDQjuvU99tBi8wBpEWO3yAvXEx5j4GVNqtwSZY1vsa
	i4tnHKlFJTMa9JgJoYJQY3RHd7z8aCs0YdB2hfGxIL82wRvDGxrsGg398JetG05FS2qPsUD5Q2H
	+j0WADMhTgztFVURb/grpvyCrTuQJwmNb2kNXTw1VQCZdljC5C6eW5vUQK5sGFtc5s7pPJ/B4aG
	EwkVyYY9TfnjbPeA5307GrXkvdc8NacNWlug7s3GD1VgHCHNfdMu4F2nDvJj+Wqq5R9QvRQnCuO
	U/28pKaGjjZaXTo0g1/Ymz0VgpNPqwShHM96m
X-Received: by 2002:a05:600c:4688:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4ba02342520mr54342215e9.7.1794324481679;
        Tue, 10 Nov 2026 07:28:01 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02043149sm66691555e9.8.2026.11.10.07.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:28:01 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 1/1] openssh: fix CVE-2026-123158 (aka "sshhole")
Date: Tue, 10 Nov 2026 16:27:36 +0100
Message-ID: <fc4316861becc9f0d41857b49f6438929ab4c291.1794323281.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794323281.git.yoann.congal@smile.fr>
References: <cover.1794323281.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 15:28:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249923
Content-Type: text/plain; charset="utf-8"

From: Yoann Congal <yoann.congal@smile.fr>

Backport the fix referenced by NVD[0].

[0]: https://nvd.nist.gov/vuln/detail/cve-2026-123158

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-123158.patch     | 191 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
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
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 6c8138ddd8a..883e97f27f1 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -47,6 +47,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-73283.patch \
            file://CVE-2026-73282.patch \
            file://CVE-2026-73281.patch \
+           file://CVE-2026-123158.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
