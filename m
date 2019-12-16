Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id BE4717FDC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 16:00:15 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id s18so5813324pfd.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 08:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0mRnLXiYgG3O8JTy7LOo+miShKRH41CHkqlbsP9lHcE=;
	b=gSQxD1gRr4DzjW51ZJrbYP1zn0V66btsYzl0pe9QinJhK1IQTCFzHKaS09shw48eH6
	DVwJ/DhIIau4BMduq2KXRNxkDkHO8bJzSFHuzY6gQ6h8iCJPRdT5MHPctNy3sS3MMBoR
	e/U+19WrWEulxYt2yehWsorkTCPUsuanSd89nDxscezSl5357I8E9+DjnxPKe//gWUu/
	ffhxkk/TmwycD6gfcXmDwRHXFEIeqknLILwwOSjG4yBVjukSdjVLMecU8UQM8n8fUqLU
	WhMTMRqVIr7JGEGX4Gd4rPJnPqyVMjCmXCUt3uwAAJwmPyFCc2HpK9QePw9IvlO0olvV
	ViRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0mRnLXiYgG3O8JTy7LOo+miShKRH41CHkqlbsP9lHcE=;
	b=gAfM742BiNid+AQ4BubtK9zHw3VrPE8d7z9upf08czkwAN7y+OHLBUVQskE1MCDTpi
	f7vbITl9XypsuUJrkxDAoIcMiq/6YTcOaJDm74g//PtsztHu15m4VcD/Edm63mQAnznA
	KzoE4EFjgZQIoiQ3cFe/PUDgcxrehI33vJg0XmUmc9REZTjxkM25DdP2+k7h3ckopogW
	iRUkPlc3NjhbWyAHJKW80fos8frciLlowtgNqkX1CFG3f1Fi4HX4k3ap5rJ1njHeyTc2
	Tu4rH3DVLDj+dsKK5WJnXNiUagEaKfFXoUJRhInjynCWQpGW5WMdPjJUgqr/qNLSWLFR
	D89w==
X-Gm-Message-State: APjAAAXxJGLzS5zc7kptot1lz19aWVdwbfgu2JqUbCiMijfXO/M/tvdf
	Tza6hP0GXi+DAqB62BXsm7oV0VCeE3E=
X-Google-Smtp-Source: APXvYqwQUaRN5TvvOpE3FsPMq2IMbZSV6C0p0xgYmGj8YAH9zwZGtFcJmh4+NLBylS14/FCFf2ziOA==
X-Received: by 2002:a62:d451:: with SMTP id u17mr16026378pfl.181.1576512016438;
	Mon, 16 Dec 2019 08:00:16 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e5c5:31c9:a010:f145])
	by smtp.gmail.com with ESMTPSA id
	g6sm19568697pjl.25.2019.12.16.08.00.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Dec 2019 08:00:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 07:59:55 -0800
Message-Id: <e21a8e3b2b2b035cf71883f72eeb665e3fa9c078.1576511913.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576511913.git.akuster808@gmail.com>
References: <cover.1576511913.git.akuster808@gmail.com>
Subject: [thud 05/18] sudo: Fix CVE-2019-14287
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
X-List-Received-Date: Mon, 16 Dec 2019 16:00:15 -0000

From: Dan Tran <dantran@microsoft.com>

Signed-off-by: Dan Tran <dantran@microsoft.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../sudo/sudo/CVE-2019-14287_p1.patch              | 170 +++++++++++++++++++++
 .../sudo/sudo/CVE-2019-14287_p2.patch              |  98 ++++++++++++
 meta/recipes-extended/sudo/sudo_1.8.23.bb          |   2 +
 3 files changed, 270 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2019-14287_p1.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2019-14287_p2.patch

diff --git a/meta/recipes-extended/sudo/sudo/CVE-2019-14287_p1.patch b/meta/recipes-extended/sudo/sudo/CVE-2019-14287_p1.patch
new file mode 100644
index 0000000..f954fac
--- /dev/null
+++ b/meta/recipes-extended/sudo/sudo/CVE-2019-14287_p1.patch
@@ -0,0 +1,170 @@
+Treat an ID of -1 as invalid since that means "no change".
+Fixes CVE-2019-14287.
+Found by Joe Vennix from Apple Information Security.
+
+CVE: CVE-2019-14287
+Upstream-Status: Backport
+[https://www.sudo.ws/repos/sudo/rev/83db8dba09e7]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+
+Index: sudo-1.8.21p2/lib/util/strtoid.c
+===================================================================
+--- sudo-1.8.21p2.orig/lib/util/strtoid.c	2019-10-10 14:31:08.338476078 -0400
++++ sudo-1.8.21p2/lib/util/strtoid.c	2019-10-10 14:31:08.338476078 -0400
+@@ -42,6 +42,27 @@
+ #include "sudo_util.h"
+ 
+ /*
++ * Make sure that the ID ends with a valid separator char.
++ */
++static bool
++valid_separator(const char *p, const char *ep, const char *sep)
++{
++    bool valid = false;
++    debug_decl(valid_separator, SUDO_DEBUG_UTIL)
++
++    if (ep != p) {
++	/* check for valid separator (including '\0') */
++	if (sep == NULL)
++	    sep = "";
++	do {
++	    if (*ep == *sep)
++		valid = true;
++	} while (*sep++ != '\0');
++    }
++    debug_return_bool(valid);
++}
++
++/*
+  * Parse a uid/gid in string form.
+  * If sep is non-NULL, it contains valid separator characters (e.g. comma, space)
+  * If endp is non-NULL it is set to the next char after the ID.
+@@ -55,36 +76,33 @@ sudo_strtoid_v1(const char *p, const cha
+     char *ep;
+     id_t ret = 0;
+     long long llval;
+-    bool valid = false;
+     debug_decl(sudo_strtoid, SUDO_DEBUG_UTIL)
+ 
+     /* skip leading space so we can pick up the sign, if any */
+     while (isspace((unsigned char)*p))
+ 	p++;
+-    if (sep == NULL)
+-	sep = "";
++
++    /* While id_t may be 64-bit signed, uid_t and gid_t are 32-bit unsigned. */
+     errno = 0;
+     llval = strtoll(p, &ep, 10);
+-    if (ep != p) {
+-	/* check for valid separator (including '\0') */
+-	do {
+-	    if (*ep == *sep)
+-		valid = true;
+-	} while (*sep++ != '\0');
++    if ((errno == ERANGE && llval == LLONG_MAX) || llval > (id_t)UINT_MAX) {
++	errno = ERANGE;
++	if (errstr != NULL)
++	    *errstr = N_("value too large");
++	goto done;
+     }
+-    if (!valid) {
++    if ((errno == ERANGE && llval == LLONG_MIN) || llval < INT_MIN) {
++	errno = ERANGE;
+ 	if (errstr != NULL)
+-	    *errstr = N_("invalid value");
+-	errno = EINVAL;
++	    *errstr = N_("value too small");
+ 	goto done;
+     }
+-    if (errno == ERANGE) {
+-	if (errstr != NULL) {
+-	    if (llval == LLONG_MAX)
+-		*errstr = N_("value too large");
+-	    else
+-		*errstr = N_("value too small");
+-	}
++
++    /* Disallow id -1, which means "no change". */
++    if (!valid_separator(p, ep, sep) || llval == -1 || llval == (id_t)UINT_MAX) {
++	if (errstr != NULL)
++	    *errstr = N_("invalid value");
++	errno = EINVAL;
+ 	goto done;
+     }
+     ret = (id_t)llval;
+@@ -101,30 +119,15 @@ sudo_strtoid_v1(const char *p, const cha
+ {
+     char *ep;
+     id_t ret = 0;
+-    bool valid = false;
+     debug_decl(sudo_strtoid, SUDO_DEBUG_UTIL)
+ 
+     /* skip leading space so we can pick up the sign, if any */
+     while (isspace((unsigned char)*p))
+ 	p++;
+-    if (sep == NULL)
+-	sep = "";
++
+     errno = 0;
+     if (*p == '-') {
+ 	long lval = strtol(p, &ep, 10);
+-	if (ep != p) {
+-	    /* check for valid separator (including '\0') */
+-	    do {
+-		if (*ep == *sep)
+-		    valid = true;
+-	    } while (*sep++ != '\0');
+-	}
+-	if (!valid) {
+-	    if (errstr != NULL)
+-		*errstr = N_("invalid value");
+-	    errno = EINVAL;
+-	    goto done;
+-	}
+ 	if ((errno == ERANGE && lval == LONG_MAX) || lval > INT_MAX) {
+ 	    errno = ERANGE;
+ 	    if (errstr != NULL)
+@@ -137,28 +140,31 @@ sudo_strtoid_v1(const char *p, const cha
+ 		*errstr = N_("value too small");
+ 	    goto done;
+ 	}
+-	ret = (id_t)lval;
+-    } else {
+-	unsigned long ulval = strtoul(p, &ep, 10);
+-	if (ep != p) {
+-	    /* check for valid separator (including '\0') */
+-	    do {
+-		if (*ep == *sep)
+-		    valid = true;
+-	    } while (*sep++ != '\0');
+-	}
+-	if (!valid) {
++
++	/* Disallow id -1, which means "no change". */
++	if (!valid_separator(p, ep, sep) || lval == -1) {
+ 	    if (errstr != NULL)
+ 		*errstr = N_("invalid value");
+ 	    errno = EINVAL;
+ 	    goto done;
+ 	}
++	ret = (id_t)lval;
++    } else {
++	unsigned long ulval = strtoul(p, &ep, 10);
+ 	if ((errno == ERANGE && ulval == ULONG_MAX) || ulval > UINT_MAX) {
+ 	    errno = ERANGE;
+ 	    if (errstr != NULL)
+ 		*errstr = N_("value too large");
+ 	    goto done;
+ 	}
++
++	/* Disallow id -1, which means "no change". */
++	if (!valid_separator(p, ep, sep) || ulval == UINT_MAX) {
++	    if (errstr != NULL)
++		*errstr = N_("invalid value");
++	    errno = EINVAL;
++	    goto done;
++	}
+ 	ret = (id_t)ulval;
+     }
+     if (errstr != NULL)
diff --git a/meta/recipes-extended/sudo/sudo/CVE-2019-14287_p2.patch b/meta/recipes-extended/sudo/sudo/CVE-2019-14287_p2.patch
new file mode 100644
index 0000000..dcb2703
--- /dev/null
+++ b/meta/recipes-extended/sudo/sudo/CVE-2019-14287_p2.patch
@@ -0,0 +1,98 @@
+CVE: CVE-2019-14287
+Upstream-Status: Backport
+[https://www.sudo.ws/repos/sudo/rev/db06a8336c09]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+
+Index: sudo-1.8.21p2/lib/util/regress/atofoo/atofoo_test.c
+===================================================================
+--- sudo-1.8.21p2.orig/lib/util/regress/atofoo/atofoo_test.c	2019-10-11 07:11:49.874655384 -0400
++++ sudo-1.8.21p2/lib/util/regress/atofoo/atofoo_test.c	2019-10-11 07:13:07.471005893 -0400
+@@ -24,6 +24,7 @@
+ #else
+ # include "compat/stdbool.h"
+ #endif
++#include <errno.h>
+ 
+ #include "sudo_compat.h"
+ #include "sudo_util.h"
+@@ -78,15 +79,20 @@ static struct strtoid_data {
+     id_t id;
+     const char *sep;
+     const char *ep;
++    int errnum;
+ } strtoid_data[] = {
+-    { "0,1", 0, ",", "," },
+-    { "10", 10, NULL, NULL },
+-    { "-2", -2, NULL, NULL },
++    { "0,1", 0, ",", ",", 0 },
++    { "10", 10, NULL, NULL, 0 },
++    { "-1", 0, NULL, NULL, EINVAL },
++    { "4294967295", 0, NULL, NULL, EINVAL },
++    { "4294967296", 0, NULL, NULL, ERANGE },
++    { "-2147483649", 0, NULL, NULL, ERANGE },
++    { "-2", -2, NULL, NULL, 0 },
+ #if SIZEOF_ID_T != SIZEOF_LONG_LONG
+-    { "-2", 4294967294U, NULL, NULL },
++    { "-2", (id_t)4294967294U, NULL, NULL, 0 },
+ #endif
+-    { "4294967294", 4294967294U, NULL, NULL },
+-    { NULL, 0, NULL, NULL }
++    { "4294967294", (id_t)4294967294U, NULL, NULL, 0 },
++    { NULL, 0, NULL, NULL, 0 }
+ };
+ 
+ static int
+@@ -102,11 +108,23 @@ test_strtoid(int *ntests)
+ 	(*ntests)++;
+ 	errstr = "some error";
+ 	value = sudo_strtoid(d->idstr, d->sep, &ep, &errstr);
+-	if (errstr != NULL) {
+-	    if (d->id != (id_t)-1) {
+-		sudo_warnx_nodebug("FAIL: %s: %s", d->idstr, errstr);
++	if (d->errnum != 0) {
++	    if (errstr == NULL) {
++		sudo_warnx_nodebug("FAIL: %s: missing errstr for errno %d",
++		    d->idstr, d->errnum);
++		errors++;
++	    } else if (value != 0) {
++		sudo_warnx_nodebug("FAIL: %s should return 0 on error",
++		    d->idstr);
++		errors++;
++	    } else if (errno != d->errnum) {
++		sudo_warnx_nodebug("FAIL: %s: errno mismatch, %d != %d",
++		    d->idstr, errno, d->errnum);
+ 		errors++;
+ 	    }
++	} else if (errstr != NULL) {
++	    sudo_warnx_nodebug("FAIL: %s: %s", d->idstr, errstr);
++	    errors++;
+ 	} else if (value != d->id) {
+ 	    sudo_warnx_nodebug("FAIL: %s != %u", d->idstr, (unsigned int)d->id);
+ 	    errors++;
+Index: sudo-1.8.21p2/plugins/sudoers/regress/testsudoers/test5.out.ok
+===================================================================
+--- sudo-1.8.21p2.orig/plugins/sudoers/regress/testsudoers/test5.out.ok	2019-10-11 07:11:49.874655384 -0400
++++ sudo-1.8.21p2/plugins/sudoers/regress/testsudoers/test5.out.ok	2019-10-11 07:11:49.870655365 -0400
+@@ -4,7 +4,7 @@ Parse error in sudoers near line 1.
+ Entries for user root:
+ 
+ Command unmatched
+-testsudoers: test5.inc should be owned by gid 4294967295
++testsudoers: test5.inc should be owned by gid 4294967294
+ Parse error in sudoers near line 1.
+ 
+ Entries for user root:
+Index: sudo-1.8.21p2/plugins/sudoers/regress/testsudoers/test5.sh
+===================================================================
+--- sudo-1.8.21p2.orig/plugins/sudoers/regress/testsudoers/test5.sh	2019-10-11 07:11:49.874655384 -0400
++++ sudo-1.8.21p2/plugins/sudoers/regress/testsudoers/test5.sh	2019-10-11 07:11:49.870655365 -0400
+@@ -24,7 +24,7 @@ EOF
+ 
+ # Test group writable
+ chmod 664 $TESTFILE
+-./testsudoers -U $MYUID -G -1 root id <<EOF
++./testsudoers -U $MYUID -G -2 root id <<EOF
+ #include $TESTFILE
+ EOF
+ 
diff --git a/meta/recipes-extended/sudo/sudo_1.8.23.bb b/meta/recipes-extended/sudo/sudo_1.8.23.bb
index ce32bd1..d12cf2d 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.23.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.23.bb
@@ -3,6 +3,8 @@ require sudo.inc
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
+           file://CVE-2019-14287_p1.patch \
+           file://CVE-2019-14287_p2.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.7.4


