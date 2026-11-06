Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5857.1793999012108005435
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 13:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=dWdwYH+M;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490a0e72588so584826f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 13:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793999010; x=1794603810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2kZwOvfe2G2rTBZy5gZcdvcH4/a9wWXY7MQaYHdbrk=;
        b=dWdwYH+M+ZT9krsZV3H+MRbFnGvXtjBJc9kE3iPnP4TBNv6hHhbbyxxGyg9rg5Cxs7
         nmuFjfwe1S2Rn6yMxS0utV4JTzpgjBaRS1uTbzs53rFACbbMbOSPvQz/2ZfQ70KiPYiW
         r6v5A/V46ul3gDP6bb7Ful/5FKIhB9TRiBSiDmzSbDfJLRKe4txMce4VhjcCS15orX3B
         Vym8IefudYFVeA+vJQyZ7BEiwARXd8aRznMI5PUjtKekQoMm/wwPBX/lKndU6VR2xWVu
         PHQrj53lA49rDEEyu18ngX2vfM2vgjYS8XRjK/EiDIecYT4/Ys/NY8L3tZ0yZPrONvzp
         ACNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793999010; x=1794603810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U2kZwOvfe2G2rTBZy5gZcdvcH4/a9wWXY7MQaYHdbrk=;
        b=kZZmdPtjxtdFVv/yFNncGZiCJEQMf2+z1C2aV6mmz9mUy7eRf7ndM3ybUXizuJspKh
         W+n6XlYHCO5A8BKB72zdKde0zMcPAShDpwtWtckmdpip9FuFTVf3d+l9QbdVxpotKXy7
         HVwsOzF3LsphR882+XqOS8OACY1yGE1T7TQkBB1Tb9XBfj65F4pasVkVYe/4X680pYgM
         1RT2BHV8JPQmukJecObWPnLYjIVYR7333v16y7B9bY1TcP3tcX/8wAHcZCU+efGvq2gS
         FJDNLsu0A+vMx7DswMu0fFLJTB61S+TA16+E4ycw6JbigwHdM3MkJWUk/iVBSbsxPa2v
         DZRw==
X-Gm-Message-State: APuU4Z/olXakWwMkSTZoSpjFEXRpVIX+arTq+mrPc+6sEX3WCX97wJTd
	+SM7LZsiyZdG0R1tMCfk6N/3kRFtypLDiZ8j23j+Q5IPWW10c/unqLzHYcvoATXJyLIq2qqFsb9
	EkI6c4VY=
X-Gm-Gg: AYBFou29MPaDV/p2IUbxJ0ciOkOerbE2374ny0thSOFtDw/tlNe7mAqXC2iKyDYcb5B
	dK4NGYDN4/Zda6T/EnAJjdYL+yu5topenWNmiaJOquB2XehgPKUc8iohOM8rTTOOIIbYQIbyVmY
	D+rV6IN5HIei7ukVAw7Cyi+OOxWQ4K0yGeijE8GupWBaCtNu1T4NJgP1hqPfjDlmsCR6341CYPK
	k/KdMXnHNbBZYs0+VIXPmoqo8DUfWE2Yozy2s7JQy3oMzsik1urY/po5Y8EIrsTJOX8dYut7lj6
	FpUoYl7qPzQ7wk1r/GAptmXnOQbYym4qesUGKVNx1H5Jc5H7TJD28FCxDzjB+wKYlON++SQxe+Y
	u/ELzwdxNA+xZ+OKI50npt8Sn+c3GZphwrDJCyCddP8ANoRnHNc11dkb/eOMWZ0J/6hyA5eOMDl
	GPshF+Zev3rDbBSINWbMTn5F1QqCr/2j2+Cl2yJZEk6IXaAnPZRst1VTSvW2G85Eh8uF3JIxouX
	80Cw98h5cWveTv+VZlwLkyvZTOH7G35ZWj5j3FrGTh8lkt2XG+Tk38lLlHxcSANe39jAujm0Ov2
	9BqS7VZpRfdODG9A+83ekFOFJGiNkI5Rs1cy6cx+5euy8GiOfiMzBrsdzJtWYAz7zVWcd/LIgST
	wmeWtcBbwK6knOZFmJFoghTCxndCZEq9FxAj5QgQ6KkXYqR56eQ==
X-Received: by 2002:a05:6000:2089:b0:48a:f0cd:8712 with SMTP id ffacd0b85a97d-4927fc59c3dmr7114977f8f.50.1793999009966;
        Fri, 06 Nov 2026 13:03:29 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3c6c056sm6035216f8f.4.2026.11.06.13.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 13:03:29 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 1/1] openssh: fix CVE-2026-123158 (aka "sshhole")
Date: Fri,  6 Nov 2026 22:03:10 +0100
Message-ID: <2285da08068a6d1b4a64c9a52d85a58be50e4679.1793998796.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793998796.git.yoann.congal@smile.fr>
References: <cover.1793998796.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 21:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249716
Content-Type: text/plain; charset="utf-8"

From: Yoann Congal <yoann.congal@smile.fr>

Backport the fix referenced by NVD[0].

[0]: https://nvd.nist.gov/vuln/detail/cve-2026-123158

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssh/openssh/CVE-2026-123158.patch     | 191 ++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |   1 +
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
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index a476645f40f..dfcb77f215d 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -34,6 +34,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-73283.patch \
            file://CVE-2026-73282.patch \
            file://CVE-2026-73281.patch \
+           file://CVE-2026-123158.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
