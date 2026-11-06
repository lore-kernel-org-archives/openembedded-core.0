Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1036.1793980451049052737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 07:54:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=d6LDRN7S;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so5370725e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 07:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793980449; x=1794585249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSmdl9KwRFPWxHgo7Jg9CkmqkZWgRnwcSTzurGgPr4c=;
        b=d6LDRN7SeZFz5bncOwowd5GnoNHu0fgCxrLY5keOfg+Cf7xwdxXXSafydr7OyRuH1a
         aHk2sWSTdsgbsUst8WrIxN49AXmAK41MWcYnCSoWdV11eYKqeNYDp1O7dE8GGZNB5eaE
         YR/JCD+y2rY6YJaULxP/utQyS43EU/CFt7i8aq1n1tfCL8V2UmOoZ7DAoV0D4lZNobuM
         6eS6avqYifEBFZKQpDjatIFGpvjw7w71OSkB/FubxTlJZWMwhCr3gx089D95IIf6TA6s
         TSwo4mA8jwvpzDS/nWC8QGEBTsy0FNWYJSpGF0deh2z7z/+hjXmnZIYSfirB6AxAxMfY
         YaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793980449; x=1794585249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DSmdl9KwRFPWxHgo7Jg9CkmqkZWgRnwcSTzurGgPr4c=;
        b=Yw6aMUXKaajF9zRFsr7sNuCB3HwgEjnuiJ/F0CBMthUt3NtoB8LWbJWnzD3SUHfTX3
         CliNls4OuJol+pStrKJPhYsLFjekZfpHNzRrbzTPMpbnx5SlAmPp5y/2LOKvPYDYbG/c
         L1xdPkj1ECFccXfZ2G+UpHfAY6q0x58SI2Ud7w8lYAB/oU5Ts5n0wVYXiVjscAW4Q1Vp
         l1L8rF+E3A+wbSRV8CMhFORFPG1nel60vUFaW8miYja2SIeea2fQL3bStVqYw+4S+75q
         ee6ljRlh8YHhGx+4W+Ni+yYDBmjovw3sgJZgZ1N1vkwKNebXR/YFOwBJ3PA1p9m8xipU
         CLJw==
X-Gm-Message-State: APuU4Z9L6IEPZXhZcLLsL0T/IB+shWcrVLKB6jR2CaM6UTrmLLOtgo97
	y3b+USKJkWBR06T481v5Xo/DYBAL0r6ab3Uij4f8XmKZca9kgCCd9FSg1MTuxwx/bnmAHAWfTfw
	hXT7dTxk=
X-Gm-Gg: AYBFou1fxFpdwUAoS9YN/GvC63HJ9wi1K1kMGvfSgTWpzQJnP3D3G+jg1bpNGr0j/c3
	LE+em+X3Y7u82M6erAGFfVFYoAZx3ePp5G2bEvfhfvsfYAZ+JYeAY+5k402iMDQ/80ljEZ1mxoQ
	Tl/ga/PV0Vq40dvDueONeXxPy/AqnUUF1gTF5vJGBxBVOpruXxHEx2MhmwWj+WaeYsbZPpyFFnY
	FEJMZrErckWDF5x60rxmumetzy9b6HtI+CaIPi2cYRYtuyh+1Xz3GTSSJPHKyZETBl58Alwnij2
	dUSPcZQv4LypmGWuss4y2R0SAz8W5+ELP4Q2DJEMpAGsyoU0gywGJ4pN6nOYjQcGPW9owe4BM1z
	Yn8TtvueOVvsylOWQVLmQdlDH2xFsaH6c7HiLpw2BnxJu5WzMOcexcaRGFuerP8nPBBcZoOTUF0
	HhoWVdyjLGTUndq7DixNyDpfWEUH/acrWNkthDv4iHEGKBIj+9pAhXSehy4XZz/xnDwT+DPpgR3
	hNq+o0b8S7RzxpmUUR35FwHrFQDWIm1+iPa5eaESGk8pe5KI+HY6KzFe9LKR0dm03CW+gasyFXD
	SM+ULXyPn97lTg0fbxFFUrXhotkSNuDC/TScTigS3GOVTV7qgpJVwhKwrEKz5IvUxVet1zo4x4u
	HLLcOtp1tQI9bq51FkDsgRRqbgOrZvQ==
X-Received: by 2002:a05:600c:8718:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4b6ddcf599fmr52913015e9.15.1793980449123;
        Fri, 06 Nov 2026 07:54:09 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57203a98fsm128429425e9.4.2026.11.06.07.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:54:08 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][blacksail 1/1] openssh: fix CVE-2026-123158 (aka "sshhole")
Date: Fri,  6 Nov 2026 16:53:38 +0100
Message-ID: <3bbd2a4f81f368ae7eac580949e4717f7aeb4f06.1793980180.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793980180.git.yoann.congal@smile.fr>
References: <cover.1793980180.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 15:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249698
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
 
