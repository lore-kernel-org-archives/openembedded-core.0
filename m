Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id DCC2A7FCAB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:32 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id p17so162051wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EtFAq89ac6fAWOE9//k4yNKLWw5DnzIFD6pcn6lbzqU=;
	b=RIo3FD9AhPwkky220LiPo4yFtDrMIK6F85AEvPzjy5BTlxTW0gBHIXSJ6NVo3eRxF3
	6QsmUDgaVTvOwSTT2DVGwGkQK5lg+D4rCKmAXTf0D1yEUm3cGIG0vskci1bPIfgcnma2
	wPx7sGIAPmlhhLpBn4TIzzzLWJGIMmw07a/kEXVT4sUz4tiO6DQgVX7LR9vBbRQmSL2j
	f2T2j9bR31wRFgDcQufloC4f+26rnQhAi7p6faZlCAbL0IlLI/7U8ehp6dr7mWx8ptGX
	2mLORSxVur5y++02CrLNTeO5qhHdER2/RuabCt6YAJVqDfelC+onsLHsADUFMfOcfor4
	HFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EtFAq89ac6fAWOE9//k4yNKLWw5DnzIFD6pcn6lbzqU=;
	b=UIYugcB2bibTtLj0vF7l97CfZ7YD26Yd62xB5jhkAhacfLXey1/f7UickTRU/zt1aC
	T6hEAMSsiYxNwxK7cN9Sm3pdlaDRLcdWaB3IF8xurEDoibAaFY/br7fG1Q44RSUlSmEf
	b6fkYkHXWMKa/RdzQ9jsQKLKh27gPg70irIrWY86AMR0HUKs9kGy0ZLA1rRe7wsz/Bwl
	cEBjK1oLTlKmGxF5jsig8+tEOYCGT5Ip8evU4aqqKChuz20RhV84cSIHK+Hjf8lmJWWR
	0gdqWQl9KkwRlOL0vtXIBkL92xt8X01ny550R0u58VPN/ANPRU0fFB9M7GZh2fpDePNY
	g4Mg==
X-Gm-Message-State: APjAAAV0xeD5yHL0tPlrm5fY0sPw2D9Kv8zYfeALXsPlJuUkXdJiXYjP
	W56mDvo8taPvaxgWSls/NCu/1IMo
X-Google-Smtp-Source: APXvYqwVQStPn/Uaqn0GD/9ui4y4hpklnT10gCxB3Zs+JQsp8fleBvjsM3EnQOXclWQ3cO9RSffE5w==
X-Received: by 2002:a1c:62d4:: with SMTP id w203mr351828wmb.184.1579541133241; 
	Mon, 20 Jan 2020 09:25:33 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:24:57 +0100
Message-Id: <20200120172510.22648-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/24] openssh: applied upstream fix for "cert not yet valid" test
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:33 -0000

From: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>

applied upstream fix for openssh's "cert not yet valid" test

Upstream Status: Backport:
    https://github.com/openssh/openssh-portable/commit/ff31f15773ee173502eec4d7861ec56f26bba381

Signed-off-by: Mingde (Matthew) Zeng<matthew.zeng@windriver.com>
---
 ...pplied-upstream-fix-for-openssh-test.patch | 60 +++++++++++++++++++
 .../openssh/openssh_8.1p1.bb                  |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-Manually-applied-upstream-fix-for-openssh-test.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-Manually-applied-upstream-fix-for-openssh-test.patch b/meta/recipes-connectivity/openssh/openssh/0001-Manually-applied-upstream-fix-for-openssh-test.patch
new file mode 100644
index 00000000000..7171ec0834e
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-Manually-applied-upstream-fix-for-openssh-test.patch
@@ -0,0 +1,60 @@
+From 0a68d6cfe255f8bcdd5f9db0d008a8f0a60b237a Mon Sep 17 00:00:00 2001
+From: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
+Date: Wed, 15 Jan 2020 15:51:42 -0500
+Subject: [PATCH] Manually applied upstream fix for openssh test
+
+Upstream Status: Backport:
+    https://github.com/openssh/openssh-portable/commit/ff31f15773ee173502eec4d7861ec56f26bba381
+
+Signed-off-by: Mingde (Matthew) Zeng<matthew.zeng@windriver.com>
+---
+ regress/cert-hostkey.sh | 4 ++--
+ regress/cert-userkey.sh | 5 ++---
+ 2 files changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/regress/cert-hostkey.sh b/regress/cert-hostkey.sh
+index 86ea6250..60e3ec02 100644
+--- a/regress/cert-hostkey.sh
++++ b/regress/cert-hostkey.sh
+@@ -1,4 +1,4 @@
+-#	$OpenBSD: cert-hostkey.sh,v 1.18 2019/07/25 08:28:15 dtucker Exp $
++#	$OpenBSD: cert-hostkey.sh,v 1.23 2020/01/03 03:02:26 djm Exp $
+ #	Placed in the Public Domain.
+
+ tid="certified host keys"
+@@ -252,7 +252,7 @@ test_one() {
+ test_one "user-certificate"	failure "-n $HOSTS"
+ test_one "empty principals"	success "-h"
+ test_one "wrong principals"	failure "-h -n foo"
+-test_one "cert not yet valid"	failure "-h -V20200101:20300101"
++test_one "cert not yet valid"	failure "-h -V20300101:20320101"
+ test_one "cert expired"		failure "-h -V19800101:19900101"
+ test_one "cert valid interval"	success "-h -V-1w:+2w"
+ test_one "cert has constraints"	failure "-h -Oforce-command=false"
+diff --git a/regress/cert-userkey.sh b/regress/cert-userkey.sh
+index 38c14a69..f0e30945 100644
+--- a/regress/cert-userkey.sh
++++ b/regress/cert-userkey.sh
+@@ -1,4 +1,4 @@
+-#	$OpenBSD: cert-userkey.sh,v 1.21 2019/07/25 08:28:15 dtucker Exp $
++#	$OpenBSD: cert-userkey.sh,v 1.25 2020/01/03 03:02:26 djm Exp $
+ #	Placed in the Public Domain.
+
+ tid="certified user keys"
+@@ -338,7 +338,7 @@ test_one() {
+ test_one "correct principal"	success "-n ${USER}"
+ test_one "host-certificate"	failure "-n ${USER} -h"
+ test_one "wrong principals"	failure "-n foo"
+-test_one "cert not yet valid"	failure "-n ${USER} -V20200101:20300101"
++test_one "cert not yet valid"	failure "-n ${USER} -V20300101:20320101"
+ test_one "cert expired"		failure "-n ${USER} -V19800101:19900101"
+ test_one "cert valid interval"	success "-n ${USER} -V-1w:+2w"
+ test_one "wrong source-address"	failure "-n ${USER} -Osource-address=10.0.0.0/8"
+@@ -399,4 +399,3 @@ done
+
+ rm -f $OBJ/authorized_keys_$USER $OBJ/user_ca_key* $OBJ/cert_user_key*
+ rm -f $OBJ/authorized_principals_$USER
+-
+--
+2.24.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_8.1p1.bb b/meta/recipes-connectivity/openssh/openssh_8.1p1.bb
index f8be7ba178d..8e7896cf4a3 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.1p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.1p1.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://add-test-support-for-busybox.patch \
            file://openssh-8.1p1-seccomp-nanosleep.patch \
            file://0001-seccomp-Allow-clock_gettime64-in-sandbox.patch \
+           file://0001-Manually-applied-upstream-fix-for-openssh-test.patch \
            "
 SRC_URI[md5sum] = "513694343631a99841e815306806edf0"
 SRC_URI[sha256sum] = "02f5dbef3835d0753556f973cd57b4c19b6b1f6cd24c03445e23ac77ca1b93ff"
-- 
2.17.1


