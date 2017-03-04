Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4DB65606CA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Mar 2017 10:24:21 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n11so6502609wma.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Mar 2017 02:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FzLNqRxGBQ4kRdCl34Z8Zdo8qG0k4B5173dtCYxtDGk=;
	b=CqCMmidOm95AusR1EcblwCHlFES37NWxEEalEDDzILNNa8XKszTqwWWfvSepCrZJnJ
	EUYtamUOXJkthvH2V6XFDe5nFuwCHhC2asX0DgB7PmJ5kYmH2B/WfVqdm/nbUXmkJNbD
	Wt9hLjjZJcEW+3e/kbPtrqzN3EsppbqaHPQJfEiZASRAjPNFa1cjjbxWRyUJq0T4pnHY
	fNzKAR3edHfA/ou3Ro7C5pawVt0+sf5+YPTA+Jo3O7V+DcY1ff6IoPNEXBmwofucRgOj
	jbBhgWhoItkdroxxZ0gCW539abFhl2IoMQdJAPuutiTArsG4opGqDi0L9U38em/9E1NN
	cvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FzLNqRxGBQ4kRdCl34Z8Zdo8qG0k4B5173dtCYxtDGk=;
	b=crScDhmjOU6KroTExpXDJ3+TS1BjQcf0IpErBb8EF6Zm9AGDdCt0f2kPsRCiILRUSC
	MhBn7eciGpx3ms2g8f8QLBjGFn3F6Si66n46qqEJ8hZQizDotuZK6zDnYZeXQq2fBTTP
	Q6LI2umQhL39QRFVQwv2B1KD6tBQ7MSz0smgWl48S4gFWr5OYLfWKlBE8AHRxRtOnIyi
	2WsSe8nabBFeOV9QVnJKwI+LAXqqFtEUCkLQOuSvPYfift8Yg4emaZMzM2oC4XsrE9zc
	xPKDxGBTyKzIex8UItwS8ZQH158Re/P1YliOMzu+eTAAFlJNJRpP0ZcjNxpSB0FNheaY
	dudw==
X-Gm-Message-State: AMke39nOW7f4UurYb0buXvB5q8pU/k979ugjs0Yu/tVk2zwflpGvelE2dbOVCRPZwAiqNA==
X-Received: by 10.28.199.132 with SMTP id x126mr5817494wmf.37.1488623062192;
	Sat, 04 Mar 2017 02:24:22 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911C6391E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:c639:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	o63sm6470670wmo.30.2017.03.04.02.24.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Mar 2017 02:24:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Mar 2017 11:24:09 +0100
Message-Id: <20170304102409.14774-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH V2 2/2] apr: fix rss+perf+gold failure on do_compile_ptest_base
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
X-List-Received-Date: Sat, 04 Mar 2017 10:24:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Was detected in Martin's world build

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---

V1->V2: Fix typo aor -> apr

 ...link-libapr-against-phtread-to-make-gold-.patch | 50 ++++++++++++++++++++++
 meta/recipes-support/apr/apr_1.5.2.bb              |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr/0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch

diff --git a/meta/recipes-support/apr/apr/0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch b/meta/recipes-support/apr/apr/0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch
new file mode 100644
index 0000000..7d0dddc
--- /dev/null
+++ b/meta/recipes-support/apr/apr/0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch
@@ -0,0 +1,50 @@
+From 94d1ca0266a0f9c0446f1299b54f752e87b8a695 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 3 Mar 2017 22:24:17 +0100
+Subject: [PATCH] explicitly link libapr against phtread to make gold happy on
+ test
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+| ../.libs/libapr-1.so: error: undefined reference to 'pthread_mutexattr_init'
+| ../.libs/libapr-1.so: error: undefined reference to 'pthread_mutexattr_settype'
+| ../.libs/libapr-1.so: error: undefined reference to 'pthread_mutexattr_destroy'
+| ../.libs/libapr-1.so: error: undefined reference to 'pthread_mutex_trylock'
+| ../.libs/libapr-1.so: error: undefined reference to 'pthread_attr_setstacksize'
+| ../.libs/libapr-1.so: error: undefined reference to 'pthread_create'
+| ../.libs/libapr-1.so: error: undefined reference to 'pthread_join'
+| ../.libs/libapr-1.so: error: undefined reference to 'pthread_detach'
+| ../.libs/libapr-1.so: error: undefined reference to 'pthread_sigmask'
+| ../.libs/libapr-1.so: error: undefined reference to 'pthread_once'
+| ../.libs/libapr-1.so: error: undefined reference to 'pthread_key_create'
+| ../.libs/libapr-1.so: error: undefined reference to 'pthread_getspecific'
+| ../.libs/libapr-1.so: error: undefined reference to 'pthread_key_delete'
+| ../.libs/libapr-1.so: error: undefined reference to 'pthread_setspecific'
+| collect2: error: ld returned 1 exit status
+| Makefile:114: recipe for target 'globalmutexchild' failed
+| make[1]: *** [globalmutexchild] Error 1
+| make[1]: Leaving directory '/home/superandy/tmp/oe-core-glibc/work/cortexa7t2hf-neon-vfpv4-angstrom-linux-gnueabi/apr/1.5.2-r0/apr-1.5.2/test'
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.in b/configure.in
+index 5b19940..cdf4d58 100644
+--- a/configure.in
++++ b/configure.in
+@@ -766,6 +766,7 @@ else
+           APR_PTHREADS_CHECK_RESTORE ] )
+     fi
+     if test "$pthreadh" = "1"; then
++        APR_ADDTO(LIBS,[-lpthread])
+         APR_CHECK_PTHREAD_GETSPECIFIC_TWO_ARGS
+         APR_CHECK_PTHREAD_ATTR_GETDETACHSTATE_ONE_ARG
+         APR_CHECK_PTHREAD_RECURSIVE_MUTEX
+-- 
+2.9.3
+
diff --git a/meta/recipes-support/apr/apr_1.5.2.bb b/meta/recipes-support/apr/apr_1.5.2.bb
index 079f8cd..992b561 100644
--- a/meta/recipes-support/apr/apr_1.5.2.bb
+++ b/meta/recipes-support/apr/apr_1.5.2.bb
@@ -18,6 +18,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://Fix-packet-discards-HTTP-redirect.patch \
            file://configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch \
            file://0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch \
+           file://0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch \
 "
 
 SRC_URI[md5sum] = "4e9769f3349fe11fc0a5e1b224c236aa"
-- 
2.9.3


