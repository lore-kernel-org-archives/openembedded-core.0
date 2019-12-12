Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 92E4A7FC06
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:15:09 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id t14so3624779wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ubVckeAZ7YbE918mVU6FV6QvNvPDoP7HzeMBBGO+Bzk=;
	b=qHiLbcQyokIsqtnJNGLClYWDDm4eD62Od1oPvk1YwOGrzFgC8dtOlh7J08kfznA5UY
	fQIHqyrTRCfK1VeJ3typrpiu8QhU0ANuGnPCmCMQg0pw5cse83pvBD60WQVC1fx3Asft
	IkMbYiOaKYH4kexCLPM1PcD9t6mRJd0mIFvL3YtEx9UqU9e+iQK5ory80L9BmtX6zk/G
	gT10xlEpks2rDcGBXnOftzcXa5zi5BcEaIULda4CskohKtanDM78ve5Pq6JEOCqFPhGn
	Pc7+ED4n6JwtlF+w995bGmnewU4OhdGFi/ibZeLGvlCODnT0qB5Kz6bjWyq6Vh25sMgY
	+KWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ubVckeAZ7YbE918mVU6FV6QvNvPDoP7HzeMBBGO+Bzk=;
	b=EK8nZxkoIT4BvW2gml6H0Z1P+MzErDwrjhYpaHKXLmLaMFn/FQghidOnqvhvhxa5cF
	sYPW4KcIl+XOybcxS5Iv/1EmQrloBudDUJFk81aPEyL9J8zCkoOKqadg6VuwtU/qiWMb
	6MeRdIVH0rLzUFvHh+KaxaEmj5aXC5/kYr/cc70secfquV2Ynzt2Ln/pGvEs9SfUUjgu
	RncurwUO9qpCIQropYhmqosWNEaAsZS/kP+PQ3UA8VHho47C6IrqaD+rnnMzQHLh6Ny8
	vxFk1DIaOwN2uURD7xlM+cd9sDU19Rdfo29WJ8VlpGo5h4P97lTnwciSxYk3+LAkLTf5
	TOZg==
X-Gm-Message-State: APjAAAUAQmaw9agQ/e/k6Ma5ByacwRijt3Tdy3P2s5dpX7fCjSSwiSvS
	2Atnh89qK1iKiYhzf3cO05IzZnAO
X-Google-Smtp-Source: APXvYqwi85OBGHu/qjGaecDrMF33nDnPIOtBcwtAB5b0XBEhVkxGYQElVeuhTRVYhKzsDpY3+0bLAQ==
X-Received: by 2002:a7b:c632:: with SMTP id p18mr7838029wmk.175.1576174509824; 
	Thu, 12 Dec 2019 10:15:09 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o66sm3147571wmo.20.2019.12.12.10.15.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:15:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 19:14:34 +0100
Message-Id: <20191212181436.1322-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212181436.1322-1-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
Subject: [PATCH 28/30] sudo: update to 1.8.29
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
X-List-Received-Date: Thu, 12 Dec 2019 18:15:10 -0000

License-Update: added SPDX info.
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/sudo/sudo.inc           |  22 +--
 .../sudo/sudo/CVE-2019-14287-1.patch          | 178 ------------------
 .../sudo/sudo/CVE-2019-14287-2.patch          | 112 -----------
 .../sudo/{sudo_1.8.27.bb => sudo_1.8.29.bb}   |   6 +-
 4 files changed, 13 insertions(+), 305 deletions(-)
 delete mode 100644 meta/recipes-extended/sudo/sudo/CVE-2019-14287-1.patch
 delete mode 100644 meta/recipes-extended/sudo/sudo/CVE-2019-14287-2.patch
 rename meta/recipes-extended/sudo/{sudo_1.8.27.bb => sudo_1.8.29.bb} (87%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 15075bcefd7..67815fa8584 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -5,17 +5,17 @@ BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
 LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=6c76b73603ac7763ab0516ebfbe67b42 \
-                    file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=4a162fc04b86b03f5632180fe6076cda \
-                    file://lib/util/reallocarray.c;beginline=3;endline=15;md5=b47f1f85a12f05a0744cd8b1b6f41a0d \
-                    file://lib/util/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
-                    file://lib/util/getcwd.c;beginline=2;endline=27;md5=09068a19b4f6b6f0a0958655bfe98b63 \
-                    file://lib/util/glob.c;beginline=2;endline=31;md5=1f2f771c35fb0658d567a7824007e56d \
-                    file://lib/util/snprintf.c;beginline=3;endline=33;md5=63e48e1b992bce749a19dd9b2256e9a0 \
-                    file://include/sudo_queue.h;beginline=2;endline=27;md5=082b138b72ba3e568a13a25c3bf254dc \
-                    file://lib/util/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a \
-                    file://lib/util/arc4random.c;beginline=3;endline=20;md5=15bdc89c1b003fa4d7353e6296ebfd68 \
-                    file://lib/util/arc4random_uniform.c;beginline=3;endline=17;md5=31e630ac814d692fd0ab7a942659b46f \
-                    file://lib/util/getentropy.c;beginline=1;endline=19;md5=9f1a275ecd44cc264a2a4d5e06a75292 \
+                    file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
+                    file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
+                    file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
+                    file://lib/util/getcwd.c;beginline=2;endline=27;md5=50f8d9667750e18dea4e84a935c12009 \
+                    file://lib/util/glob.c;beginline=2;endline=31;md5=2852f68687544e3eb8a0a61665506f0e \
+                    file://lib/util/snprintf.c;beginline=3;endline=33;md5=b70df6179969e38fcf68da91b53b8029 \
+                    file://include/sudo_queue.h;beginline=2;endline=27;md5=ad578e9664d17a010b63e4bc0576ee8d \
+                    file://lib/util/inet_pton.c;beginline=3;endline=17;md5=27785c9f5835093eda42aa0816a2d0b4 \
+                    file://lib/util/arc4random.c;beginline=3;endline=20;md5=ced8636ecefa2ba907cfe390bc3bd964 \
+                    file://lib/util/arc4random_uniform.c;beginline=3;endline=17;md5=e30c2b777cdc00cfcaf7c445a10b262f \
+                    file://lib/util/getentropy.c;beginline=1;endline=19;md5=a0f58be3d60b6dcd898ec5fe0866d36f \
                     "
 
 inherit autotools
diff --git a/meta/recipes-extended/sudo/sudo/CVE-2019-14287-1.patch b/meta/recipes-extended/sudo/sudo/CVE-2019-14287-1.patch
deleted file mode 100644
index 2a11e3f7ec7..00000000000
--- a/meta/recipes-extended/sudo/sudo/CVE-2019-14287-1.patch
+++ /dev/null
@@ -1,178 +0,0 @@
-From f752ae5cee163253730ff7cdf293e34a91aa5520 Mon Sep 17 00:00:00 2001
-From: "Todd C. Miller" <Todd.Miller@sudo.ws>
-Date: Thu, 10 Oct 2019 10:04:13 -0600
-Subject: [PATCH] Treat an ID of -1 as invalid since that means "no change".
- Fixes CVE-2019-14287. Found by Joe Vennix from Apple Information Security.
-
-Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/f752ae5cee163253730ff7cdf293e34a91aa5520]
-CVE: CVE-2019-14287
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- lib/util/strtoid.c | 100 ++++++++++++++++++++++++++++-------------------------
- 1 files changed, 53 insertions(+), 46 deletions(-)
-
-diff --git a/lib/util/strtoid.c b/lib/util/strtoid.c
-index 2dfce75..6b3916b 100644
---- a/lib/util/strtoid.c
-+++ b/lib/util/strtoid.c
-@@ -49,6 +49,27 @@
- #include "sudo_util.h"
- 
- /*
-+ * Make sure that the ID ends with a valid separator char.
-+ */
-+static bool
-+valid_separator(const char *p, const char *ep, const char *sep)
-+{
-+    bool valid = false;
-+    debug_decl(valid_separator, SUDO_DEBUG_UTIL)
-+
-+    if (ep != p) {
-+	/* check for valid separator (including '\0') */
-+	if (sep == NULL)
-+	    sep = "";
-+	do {
-+	    if (*ep == *sep)
-+		valid = true;
-+	} while (*sep++ != '\0');
-+    }
-+    debug_return_bool(valid);
-+}
-+
-+/*
-  * Parse a uid/gid in string form.
-  * If sep is non-NULL, it contains valid separator characters (e.g. comma, space)
-  * If endp is non-NULL it is set to the next char after the ID.
-@@ -62,36 +83,33 @@ sudo_strtoid_v1(const char *p, const char *sep, char **endp, const char **errstr
-     char *ep;
-     id_t ret = 0;
-     long long llval;
--    bool valid = false;
-     debug_decl(sudo_strtoid, SUDO_DEBUG_UTIL)
- 
-     /* skip leading space so we can pick up the sign, if any */
-     while (isspace((unsigned char)*p))
- 	p++;
--    if (sep == NULL)
--	sep = "";
-+
-+    /* While id_t may be 64-bit signed, uid_t and gid_t are 32-bit unsigned. */
-     errno = 0;
-     llval = strtoll(p, &ep, 10);
--    if (ep != p) {
--	/* check for valid separator (including '\0') */
--	do {
--	    if (*ep == *sep)
--		valid = true;
--	} while (*sep++ != '\0');
-+    if ((errno == ERANGE && llval == LLONG_MAX) || llval > (id_t)UINT_MAX) {
-+	errno = ERANGE;
-+	if (errstr != NULL)
-+	    *errstr = N_("value too large");
-+	goto done;
-     }
--    if (!valid) {
-+    if ((errno == ERANGE && llval == LLONG_MIN) || llval < INT_MIN) {
-+	errno = ERANGE;
- 	if (errstr != NULL)
--	    *errstr = N_("invalid value");
--	errno = EINVAL;
-+	    *errstr = N_("value too small");
- 	goto done;
-     }
--    if (errno == ERANGE) {
--	if (errstr != NULL) {
--	    if (llval == LLONG_MAX)
--		*errstr = N_("value too large");
--	    else
--		*errstr = N_("value too small");
--	}
-+
-+    /* Disallow id -1, which means "no change". */
-+    if (!valid_separator(p, ep, sep) || llval == -1 || llval == (id_t)UINT_MAX) {
-+	if (errstr != NULL)
-+	    *errstr = N_("invalid value");
-+	errno = EINVAL;
- 	goto done;
-     }
-     ret = (id_t)llval;
-@@ -108,30 +126,15 @@ sudo_strtoid_v1(const char *p, const char *sep, char **endp, const char **errstr
- {
-     char *ep;
-     id_t ret = 0;
--    bool valid = false;
-     debug_decl(sudo_strtoid, SUDO_DEBUG_UTIL)
- 
-     /* skip leading space so we can pick up the sign, if any */
-     while (isspace((unsigned char)*p))
- 	p++;
--    if (sep == NULL)
--	sep = "";
-+
-     errno = 0;
-     if (*p == '-') {
- 	long lval = strtol(p, &ep, 10);
--	if (ep != p) {
--	    /* check for valid separator (including '\0') */
--	    do {
--		if (*ep == *sep)
--		    valid = true;
--	    } while (*sep++ != '\0');
--	}
--	if (!valid) {
--	    if (errstr != NULL)
--		*errstr = N_("invalid value");
--	    errno = EINVAL;
--	    goto done;
--	}
- 	if ((errno == ERANGE && lval == LONG_MAX) || lval > INT_MAX) {
- 	    errno = ERANGE;
- 	    if (errstr != NULL)
-@@ -144,28 +147,31 @@ sudo_strtoid_v1(const char *p, const char *sep, char **endp, const char **errstr
- 		*errstr = N_("value too small");
- 	    goto done;
- 	}
--	ret = (id_t)lval;
--    } else {
--	unsigned long ulval = strtoul(p, &ep, 10);
--	if (ep != p) {
--	    /* check for valid separator (including '\0') */
--	    do {
--		if (*ep == *sep)
--		    valid = true;
--	    } while (*sep++ != '\0');
--	}
--	if (!valid) {
-+
-+	/* Disallow id -1, which means "no change". */
-+	if (!valid_separator(p, ep, sep) || lval == -1) {
- 	    if (errstr != NULL)
- 		*errstr = N_("invalid value");
- 	    errno = EINVAL;
- 	    goto done;
- 	}
-+	ret = (id_t)lval;
-+    } else {
-+	unsigned long ulval = strtoul(p, &ep, 10);
- 	if ((errno == ERANGE && ulval == ULONG_MAX) || ulval > UINT_MAX) {
- 	    errno = ERANGE;
- 	    if (errstr != NULL)
- 		*errstr = N_("value too large");
- 	    goto done;
- 	}
-+
-+	/* Disallow id -1, which means "no change". */
-+	if (!valid_separator(p, ep, sep) || ulval == UINT_MAX) {
-+	    if (errstr != NULL)
-+		*errstr = N_("invalid value");
-+	    errno = EINVAL;
-+	    goto done;
-+	}
- 	ret = (id_t)ulval;
-     }
-     if (errstr != NULL)
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/sudo/sudo/CVE-2019-14287-2.patch b/meta/recipes-extended/sudo/sudo/CVE-2019-14287-2.patch
deleted file mode 100644
index 453a8b09a4a..00000000000
--- a/meta/recipes-extended/sudo/sudo/CVE-2019-14287-2.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From 396bc57feff3e360007634f62448b64e0626390c Mon Sep 17 00:00:00 2001
-From: "Todd C. Miller" <Todd.Miller@sudo.ws>
-Date: Thu, 10 Oct 2019 10:04:13 -0600
-Subject: [PATCH] Add sudo_strtoid() tests for -1 and range errors. Also adjust
- testsudoers/test5 which relied upon gid -1 parsing.
-
-Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/396bc57]
-CVE: CVE-2019-14287
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- lib/util/regress/atofoo/atofoo_test.c            | 36 ++++++++++++++++------
- plugins/sudoers/regress/testsudoers/test5.out.ok |  2 +-
- plugins/sudoers/regress/testsudoers/test5.sh     |  2 +-
- 3 files changed, 29 insertions(+), 11 deletions(-)
-
-diff --git a/lib/util/regress/atofoo/atofoo_test.c b/lib/util/regress/atofoo/atofoo_test.c
-index 031a7ed..fb41c1a 100644
---- a/lib/util/regress/atofoo/atofoo_test.c
-+++ b/lib/util/regress/atofoo/atofoo_test.c
-@@ -26,6 +26,7 @@
- #else
- # include "compat/stdbool.h"
- #endif
-+#include <errno.h>
- 
- #include "sudo_compat.h"
- #include "sudo_util.h"
-@@ -80,15 +81,20 @@ static struct strtoid_data {
-     id_t id;
-     const char *sep;
-     const char *ep;
-+    int errnum;
- } strtoid_data[] = {
--    { "0,1", 0, ",", "," },
--    { "10", 10, NULL, NULL },
--    { "-2", -2, NULL, NULL },
-+    { "0,1", 0, ",", ",", 0 },
-+    { "10", 10, NULL, NULL, 0 },
-+    { "-1", 0, NULL, NULL, EINVAL },
-+    { "4294967295", 0, NULL, NULL, EINVAL },
-+    { "4294967296", 0, NULL, NULL, ERANGE },
-+    { "-2147483649", 0, NULL, NULL, ERANGE },
-+    { "-2", -2, NULL, NULL, 0 },
- #if SIZEOF_ID_T != SIZEOF_LONG_LONG
--    { "-2", (id_t)4294967294U, NULL, NULL },
-+    { "-2", (id_t)4294967294U, NULL, NULL, 0 },
- #endif
--    { "4294967294", (id_t)4294967294U, NULL, NULL },
--    { NULL, 0, NULL, NULL }
-+    { "4294967294", (id_t)4294967294U, NULL, NULL, 0 },
-+    { NULL, 0, NULL, NULL, 0 }
- };
- 
- static int
-@@ -104,11 +110,23 @@ test_strtoid(int *ntests)
- 	(*ntests)++;
- 	errstr = "some error";
- 	value = sudo_strtoid(d->idstr, d->sep, &ep, &errstr);
--	if (errstr != NULL) {
--	    if (d->id != (id_t)-1) {
--		sudo_warnx_nodebug("FAIL: %s: %s", d->idstr, errstr);
-+	if (d->errnum != 0) {
-+	    if (errstr == NULL) {
-+		sudo_warnx_nodebug("FAIL: %s: missing errstr for errno %d",
-+		    d->idstr, d->errnum);
-+		errors++;
-+	    } else if (value != 0) {
-+		sudo_warnx_nodebug("FAIL: %s should return 0 on error",
-+		    d->idstr);
-+		errors++;
-+	    } else if (errno != d->errnum) {
-+		sudo_warnx_nodebug("FAIL: %s: errno mismatch, %d != %d",
-+		    d->idstr, errno, d->errnum);
- 		errors++;
- 	    }
-+	} else if (errstr != NULL) {
-+	    sudo_warnx_nodebug("FAIL: %s: %s", d->idstr, errstr);
-+	    errors++;
- 	} else if (value != d->id) {
- 	    sudo_warnx_nodebug("FAIL: %s != %u", d->idstr, (unsigned int)d->id);
- 	    errors++;
-diff --git a/plugins/sudoers/regress/testsudoers/test5.out.ok b/plugins/sudoers/regress/testsudoers/test5.out.ok
-index 5e319c9..cecf700 100644
---- a/plugins/sudoers/regress/testsudoers/test5.out.ok
-+++ b/plugins/sudoers/regress/testsudoers/test5.out.ok
-@@ -4,7 +4,7 @@ Parse error in sudoers near line 1.
- Entries for user root:
- 
- Command unmatched
--testsudoers: test5.inc should be owned by gid 4294967295
-+testsudoers: test5.inc should be owned by gid 4294967294
- Parse error in sudoers near line 1.
- 
- Entries for user root:
-diff --git a/plugins/sudoers/regress/testsudoers/test5.sh b/plugins/sudoers/regress/testsudoers/test5.sh
-index 9e690a6..94d585c 100755
---- a/plugins/sudoers/regress/testsudoers/test5.sh
-+++ b/plugins/sudoers/regress/testsudoers/test5.sh
-@@ -24,7 +24,7 @@ EOF
- 
- # Test group writable
- chmod 664 $TESTFILE
--./testsudoers -U $MYUID -G -1 root id <<EOF
-+./testsudoers -U $MYUID -G -2 root id <<EOF
- #include $TESTFILE
- EOF
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/sudo/sudo_1.8.27.bb b/meta/recipes-extended/sudo/sudo_1.8.29.bb
similarity index 87%
rename from meta/recipes-extended/sudo/sudo_1.8.27.bb
rename to meta/recipes-extended/sudo/sudo_1.8.29.bb
index 0a11a1b28f8..8da2d646318 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.27.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.29.bb
@@ -3,14 +3,12 @@ require sudo.inc
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
-           file://CVE-2019-14287-1.patch \
-           file://CVE-2019-14287-2.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "b5c184b13b6b5de32af630af2fd013fd"
-SRC_URI[sha256sum] = "7beb68b94471ef56d8a1036dbcdc09a7b58a949a68ffce48b83f837dd33e2ec0"
+SRC_URI[md5sum] = "b28dabff9c460f115fe74de4d6a6f79d"
+SRC_URI[sha256sum] = "ce53ffac9604e23321334d8ba8ac59ded2bcf624fdb9dbde097ab2049bf29c7c"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.17.1


