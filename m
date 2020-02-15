Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0D39961260
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 15:35:31 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g1so13019687wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 07:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lNusmS9+uG2ZG5yj4y2k05kEm/uYtX54Irt4sQaef+M=;
	b=Aiv5dt4ocEfpV5pgo6VRCAll4uwxkyaYCuzC+JvFpqAPt9s2EBA2ce0Jrv+7xr5wyu
	z+LbdxTjrPHXfNjYo73o9OpZokBlPLdgYrk1Z/GnW4myx+eOPgy3TsOxhOKcupIMoUeb
	YlXyOvzusuYeOW+KdgrN2TOBGgZ2VdoD22c2XD7Ez0t+ArxvdqwVHVbBsSffnA15CCZK
	GAqpJMkstNoCRuE0wwpDQwL5UVxUJKyMPh+UQrCCj+D17qmiGpcDu3RuUI4yICCbVlkU
	Ovn14wP8XHT8jPR4XMbfx/0D8OZy7apMrUmytiSPiZzezcUas4bK8XDdskYzvz0gvwRN
	RSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lNusmS9+uG2ZG5yj4y2k05kEm/uYtX54Irt4sQaef+M=;
	b=Dbdb3BtZ/+s4lUxGviD2TuMsf/aG6z59nnICuacb6Ayh94mYbOq7ttLNqKs/haf+vh
	QjuyW5LRqse+WceOgNsxnKjJdPoa1mv0GBtLWSrTy3SdhEmm/Eg4MShItvjsWqZT5RfJ
	PFFTDImQS08qRdbGansC2ujtjrw1NoDjkHYtvoOsm34mBz5w1Y7p3JoweFs6tiW8nKdg
	7ElqJ5sZcdLEb3e2kIDoD7Lt7qXfmls7KfdsWGamZ1c+rwET89EQz/k1LwKCvNuk7sZl
	YZb/xmQHwHSgdnFYBSAGxOAvYMYfp4hnt0WRAeWd5l9ehLKxyOKRS4PJNNwjB3Sx9Npl
	uBhQ==
X-Gm-Message-State: APjAAAUfxXf+8mY5062w4x65D7EdDVaDn36zfpgfEKFYEvgDtTP62hub
	W9bNsi6Mq32RTAiVhdG6nKYTngyV
X-Google-Smtp-Source: APXvYqxKzU1UahQPEHBhAxBl9i9CI1ZV7C+5U1Y6GRe6/6IH05n0/vAwmdGya1Gr4vuT5UmOPce2IA==
X-Received: by 2002:a1c:f60e:: with SMTP id w14mr11354189wmc.188.1581780932114;
	Sat, 15 Feb 2020 07:35:32 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	h13sm13435276wrw.54.2020.02.15.07.35.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 07:35:31 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Feb 2020 15:30:06 +0000
Message-Id: <20200215153006.50240-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] openssh: Upgrade 8.1p1 -> 8.2p1
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
X-List-Received-Date: Sat, 15 Feb 2020 15:35:32 -0000

Drop backports from upstream:

  0001-Manually-applied-upstream-fix-for-openssh-test.patch
  0001-seccomp-Allow-clock_gettime64-in-sandbox.patch
  openssh-8.1p1-seccomp-nanosleep.patch

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...pplied-upstream-fix-for-openssh-test.patch | 60 -------------------
 ...omp-Allow-clock_gettime64-in-sandbox.patch | 31 ----------
 .../openssh-8.1p1-seccomp-nanosleep.patch     | 27 ---------
 .../{openssh_8.1p1.bb => openssh_8.2p1.bb}    |  7 +--
 4 files changed, 2 insertions(+), 123 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/0001-Manually-applied-upstream-fix-for-openssh-test.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/0001-seccomp-Allow-clock_gettime64-in-sandbox.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-8.1p1-seccomp-nanosleep.patch
 rename meta/recipes-connectivity/openssh/{openssh_8.1p1.bb => openssh_8.2p1.bb} (95%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-Manually-applied-upstream-fix-for-openssh-test.patch b/meta/recipes-connectivity/openssh/openssh/0001-Manually-applied-upstream-fix-for-openssh-test.patch
deleted file mode 100644
index 7171ec0834e8..000000000000
--- a/meta/recipes-connectivity/openssh/openssh/0001-Manually-applied-upstream-fix-for-openssh-test.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 0a68d6cfe255f8bcdd5f9db0d008a8f0a60b237a Mon Sep 17 00:00:00 2001
-From: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
-Date: Wed, 15 Jan 2020 15:51:42 -0500
-Subject: [PATCH] Manually applied upstream fix for openssh test
-
-Upstream Status: Backport:
-    https://github.com/openssh/openssh-portable/commit/ff31f15773ee173502eec4d7861ec56f26bba381
-
-Signed-off-by: Mingde (Matthew) Zeng<matthew.zeng@windriver.com>
----
- regress/cert-hostkey.sh | 4 ++--
- regress/cert-userkey.sh | 5 ++---
- 2 files changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/regress/cert-hostkey.sh b/regress/cert-hostkey.sh
-index 86ea6250..60e3ec02 100644
---- a/regress/cert-hostkey.sh
-+++ b/regress/cert-hostkey.sh
-@@ -1,4 +1,4 @@
--#	$OpenBSD: cert-hostkey.sh,v 1.18 2019/07/25 08:28:15 dtucker Exp $
-+#	$OpenBSD: cert-hostkey.sh,v 1.23 2020/01/03 03:02:26 djm Exp $
- #	Placed in the Public Domain.
-
- tid="certified host keys"
-@@ -252,7 +252,7 @@ test_one() {
- test_one "user-certificate"	failure "-n $HOSTS"
- test_one "empty principals"	success "-h"
- test_one "wrong principals"	failure "-h -n foo"
--test_one "cert not yet valid"	failure "-h -V20200101:20300101"
-+test_one "cert not yet valid"	failure "-h -V20300101:20320101"
- test_one "cert expired"		failure "-h -V19800101:19900101"
- test_one "cert valid interval"	success "-h -V-1w:+2w"
- test_one "cert has constraints"	failure "-h -Oforce-command=false"
-diff --git a/regress/cert-userkey.sh b/regress/cert-userkey.sh
-index 38c14a69..f0e30945 100644
---- a/regress/cert-userkey.sh
-+++ b/regress/cert-userkey.sh
-@@ -1,4 +1,4 @@
--#	$OpenBSD: cert-userkey.sh,v 1.21 2019/07/25 08:28:15 dtucker Exp $
-+#	$OpenBSD: cert-userkey.sh,v 1.25 2020/01/03 03:02:26 djm Exp $
- #	Placed in the Public Domain.
-
- tid="certified user keys"
-@@ -338,7 +338,7 @@ test_one() {
- test_one "correct principal"	success "-n ${USER}"
- test_one "host-certificate"	failure "-n ${USER} -h"
- test_one "wrong principals"	failure "-n foo"
--test_one "cert not yet valid"	failure "-n ${USER} -V20200101:20300101"
-+test_one "cert not yet valid"	failure "-n ${USER} -V20300101:20320101"
- test_one "cert expired"		failure "-n ${USER} -V19800101:19900101"
- test_one "cert valid interval"	success "-n ${USER} -V-1w:+2w"
- test_one "wrong source-address"	failure "-n ${USER} -Osource-address=10.0.0.0/8"
-@@ -399,4 +399,3 @@ done
-
- rm -f $OBJ/authorized_keys_$USER $OBJ/user_ca_key* $OBJ/cert_user_key*
- rm -f $OBJ/authorized_principals_$USER
--
---
-2.24.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh/0001-seccomp-Allow-clock_gettime64-in-sandbox.patch b/meta/recipes-connectivity/openssh/openssh/0001-seccomp-Allow-clock_gettime64-in-sandbox.patch
deleted file mode 100644
index 78c493de8663..000000000000
--- a/meta/recipes-connectivity/openssh/openssh/0001-seccomp-Allow-clock_gettime64-in-sandbox.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From eae3e85322fa7c869f5822db4eda6348f2beb09e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 7 Jan 2020 16:26:45 -0800
-Subject: [PATCH] seccomp: Allow clock_gettime64() in sandbox.
-
-This helps sshd accept connections on mips platforms with
-upcoming glibc ( 2.31 )
-
-Upstream-Status: Accepted [https://github.com/openssh/openssh-portable/pull/161]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- sandbox-seccomp-filter.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/sandbox-seccomp-filter.c b/sandbox-seccomp-filter.c
-index 3ef30c9..999c46c 100644
---- a/sandbox-seccomp-filter.c
-+++ b/sandbox-seccomp-filter.c
-@@ -248,6 +248,9 @@ static const struct sock_filter preauth_insns[] = {
- #ifdef __NR_clock_nanosleep_time64
- 	SC_ALLOW(__NR_clock_nanosleep_time64),
- #endif
-+#ifdef __NR_clock_gettime64
-+	SC_ALLOW(__NR_clock_gettime64),
-+#endif
- #ifdef __NR__newselect
- 	SC_ALLOW(__NR__newselect),
- #endif
--- 
-2.24.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh/openssh-8.1p1-seccomp-nanosleep.patch b/meta/recipes-connectivity/openssh/openssh/openssh-8.1p1-seccomp-nanosleep.patch
deleted file mode 100644
index 7c9d61c26dec..000000000000
--- a/meta/recipes-connectivity/openssh/openssh/openssh-8.1p1-seccomp-nanosleep.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-commit 7e929163ed40f9ce90060a3ca6df558c3d901379
-Author: Jakub Jelen <jjelen@redhat.com>
-Date:   Wed Nov 13 12:57:05 2019 +0100
-
-seccomp: Allow clock_nanosleep() to make OpenSSH working with latest glibc
-sandbox-seccomp: Allow clock_nanosleep on ARM
-
-Upstream-Status: Backport [https://github.com/tcely/openssh-portable/pull/258]
-                          [https://github.com/bobby0809/openssh-portable/pull/138]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com
-
---- a/sandbox-seccomp-filter.c
-+++ b/sandbox-seccomp-filter.c
-@@ -242,6 +242,12 @@ static const struct sock_filter preauth_
- #ifdef __NR_nanosleep
- 	SC_ALLOW(__NR_nanosleep),
- #endif
-+#ifdef __NR_clock_nanosleep
-+	SC_ALLOW(__NR_clock_nanosleep),
-+#endif
-+#ifdef __NR_clock_nanosleep_time64
-+	SC_ALLOW(__NR_clock_nanosleep_time64),
-+#endif
- #ifdef __NR__newselect
- 	SC_ALLOW(__NR__newselect),
- #endif
diff --git a/meta/recipes-connectivity/openssh/openssh_8.1p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
similarity index 95%
rename from meta/recipes-connectivity/openssh/openssh_8.1p1.bb
rename to meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index 8e7896cf4a35..d879efc2012d 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.1p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -24,12 +24,9 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
-           file://openssh-8.1p1-seccomp-nanosleep.patch \
-           file://0001-seccomp-Allow-clock_gettime64-in-sandbox.patch \
-           file://0001-Manually-applied-upstream-fix-for-openssh-test.patch \
            "
-SRC_URI[md5sum] = "513694343631a99841e815306806edf0"
-SRC_URI[sha256sum] = "02f5dbef3835d0753556f973cd57b4c19b6b1f6cd24c03445e23ac77ca1b93ff"
+SRC_URI[md5sum] = "3076e6413e8dbe56d33848c1054ac091"
+SRC_URI[sha256sum] = "43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671"
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.17.1


