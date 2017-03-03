Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4DA5960670
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 21:36:31 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id g10so14728218wrg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 13:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=rkeMyTKRI6n5ie4r4kt0KlETEtHHkim1gpD+fxxsfAU=;
	b=MCDNCnVmsaHlhozX32fR1mA2F38yxL7gMWPLD1knpHTv22Jh4iBICXdT1Y5+lxMsK+
	Y398bC5sK96//ilQKxIXX7YLwUaufCnIv6fr0T8DaycbA0UYfxdG7C6JOq4x3gSwIbH4
	5zmgSJNw9gLKT4zf2EGxi7YBKOrrkp5RPYo2feEHjjsm/8PyAcLf1dLYNHwri4HMhSwl
	hBbHpC2pz7gPdid9WydXFHkLr78PYVfmOmfTsFTJ+zK0abVDs67X+eamaGoi7V15RBnn
	4Duuj/vyxb804D8evkmjzyNcDInnEj/5QXwtDhYLDGqYnorJJu1i0FF/8Xtxb0tr6EaW
	sjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rkeMyTKRI6n5ie4r4kt0KlETEtHHkim1gpD+fxxsfAU=;
	b=cIC72rLbzEMANt+wdjQt4gam3y5LkhII0D/9F4cUGPpO8EzRhJWwQ+yZht9pNQcqhi
	ZMdzm4t7+F56LGv3QnZD+/LkxzbyXr9t1t/vjLrHl2+fK9cJ7t7YA+iUU52aWEqevvP0
	St7Re8VeKOYUH70DH9srzQ4iSl4gPe0nBZxh91IoH0YS6RTC8PUd9bUUESBHPa46E2ip
	FZHI9ksgRQNUefOVY+dXoeXYYKuclr4bSQ4HW7U/rfrXzuv8QPxWWpjkXwWWUgcV3oVD
	5ZRx1Q9EJMM/zHVOibnTt9GXiubHYSqO0UkDikA1MXNzozoTrPDpHRXFW+Hnb5J/sXW3
	+/VQ==
X-Gm-Message-State: AMke39n90xgBMQ0Lqylc+yw3qByGPXm7xCABIPO8ohszu7Mh6QTya2zXGIF6f+EOwypypw==
X-Received: by 10.223.138.252 with SMTP id z57mr4280125wrz.110.1488576992517; 
	Fri, 03 Mar 2017 13:36:32 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911C6391E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:c639:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	186sm4480414wmw.24.2017.03.03.13.36.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Mar 2017 13:36:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 22:36:19 +0100
Message-Id: <20170303213619.29944-2-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170303213619.29944-1-schnitzeltony@googlemail.com>
References: <20170303213619.29944-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] aor: fix rss+perf+gold failure on do_compile_ptest_base
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
X-List-Received-Date: Fri, 03 Mar 2017 21:36:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Was detected in Martin's world build

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
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


