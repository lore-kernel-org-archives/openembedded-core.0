Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id D890D78967
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 02:42:44 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id w15-v6so2278732plq.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 19:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OQi6dapjXOGq5IGoyuXG69s0XPYJGT7Z7zSxsyF+YbE=;
	b=ZuvPUIMZSgMbPw+W9uUt7Qwnb1jfUah/KD98HtoL7cUnETLht3uJWovnixZQ0f5zwh
	/pOAvIvBy4QpZ+BjsW5LURwjjhIhDr3aIRYRHYctZ4Q53S+Ze78YbdwaFc74wXP3sY5N
	4Yp7TgMdF3apfs9ai6PxTujs50dPJS5fCf/t1cibosxrC9aUpdpGK2aXuPJIaVcN4tUn
	xWkqpSrA6+Wm8o5GZsF9Bv6PWJL55hipS2sh05tDJruHzs8vUybxE44u0qmEQ/TJ8Y6e
	FGBr5RiiCKrC94B/V8jVdS//OKdgnao2uugofKzRTiBUnU4E23wuV8emStHlTfzfiYWV
	cCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OQi6dapjXOGq5IGoyuXG69s0XPYJGT7Z7zSxsyF+YbE=;
	b=eJP/l/S2RCTrw6KHPBOTEcXp7BxCbJ88k4l1k9unOdo2yBp/bPiJhVwZ2rwr/ohw1H
	IObYgehRINCM/QjMG4oOOKEC3CGtjAFYhCwqtnrqO97zJ+dIqxzq5RDIL1k1mDlQldZa
	EPqw2QsDpRXtXeG6auCwlEaTAf2vQqVr8WHykD6vejq94A31C4oKg1SbnHCldtIv6fuc
	Qe5DS1+ZFtT4pzYKYxvUM1Hgxcrjz0fJ7QQaceDRaufVJ44PfdOwQobqgE+PAq8TMKt1
	9p1W5fsQrbcILqyYpJMBei2aoh0hN83hEpMgjQWy+uqxZJWPpKWMRllRAqaLRN2VPFPp
	zoTg==
X-Gm-Message-State: AElRT7HaADEM5DjneaYEbNG6+NvAcrOMQya/RIDfyadBB+VUkEHkoNrH
	Lr9PyC+sFnZR8eDYw2BWdKB4AQ==
X-Google-Smtp-Source: AG47ELtFext//bWpZRYURoNK6npUlAQJkhEyhigL970RH8iucm9DhUlqS+mp/g+Elyn9BzICmAlm6w==
X-Received: by 2002:a17:902:43e4:: with SMTP id
	j91-v6mr1160805pld.118.1521600166002; 
	Tue, 20 Mar 2018 19:42:46 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	12sm6172559pfr.108.2018.03.20.19.42.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 19:42:45 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2018 19:42:27 -0700
Message-Id: <1521600149-3894-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
References: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
Subject: [daisy][PATCH 4/6] ncurses: fix build with gcc 5
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
X-List-Received-Date: Wed, 21 Mar 2018 02:42:45 -0000

Use Gentoo version of backport of upstream patch:

  https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-libs/ncurses/files/ncurses-5.9-gcc-5.patch

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../ncurses/ncurses-5.9/ncurses-5.9-gcc-5.patch    | 53 ++++++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_5.9.bb           |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/ncurses-5.9/ncurses-5.9-gcc-5.patch

diff --git a/meta/recipes-core/ncurses/ncurses-5.9/ncurses-5.9-gcc-5.patch b/meta/recipes-core/ncurses/ncurses-5.9/ncurses-5.9-gcc-5.patch
new file mode 100644
index 0000000..a52d830
--- /dev/null
+++ b/meta/recipes-core/ncurses/ncurses-5.9/ncurses-5.9-gcc-5.patch
@@ -0,0 +1,53 @@
+https://bugs.gentoo.org/545114
+
+extracted from the upstream change (which had many unrelated commits in one)
+
+From 97bb4678dc03e753290b39bbff30ba2825df9517 Mon Sep 17 00:00:00 2001
+From: "Thomas E. Dickey" <dickey@invisible-island.net>
+Date: Sun, 7 Dec 2014 03:10:09 +0000
+Subject: [PATCH] ncurses 5.9 - patch 20141206
+
++ modify MKlib_gen.sh to work around change in development version of
+  gcc introduced here:
+	  https://gcc.gnu.org/ml/gcc-patches/2014-06/msg02185.html
+	  https://gcc.gnu.org/ml/gcc-patches/2014-07/msg00236.html
+  (reports by Marcus Shawcroft, Maohui Lei).
+
+Upstream-Status: Backport
+
+  https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-libs/ncurses/files/ncurses-5.9-gcc-5.patch
+
+Signed-off-by: Sanchar Banerjee <Sanchar.Banerjee@infosys.com>
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+diff --git a/ncurses/base/MKlib_gen.sh b/ncurses/base/MKlib_gen.sh
+index d8cc3c9..b91398c 100755
+--- a/ncurses/base/MKlib_gen.sh
++++ b/ncurses/base/MKlib_gen.sh
+@@ -474,11 +474,22 @@ sed -n -f $ED1 \
+ 	-e 's/gen_$//' \
+ 	-e 's/  / /g' >>$TMP
+ 
++cat >$ED1 <<EOF
++s/  / /g
++s/^ //
++s/ $//
++s/P_NCURSES_BOOL/NCURSES_BOOL/g
++EOF
++
++# A patch discussed here:
++#	https://gcc.gnu.org/ml/gcc-patches/2014-06/msg02185.html
++# introduces spurious #line markers.  Work around that by ignoring the system's
++# attempt to define "bool" and using our own symbol here.
++sed -e 's/bool/P_NCURSES_BOOL/g' $TMP > $ED2
++cat $ED2 >$TMP
++
+ $preprocessor $TMP 2>/dev/null \
+-| sed \
+-	-e 's/  / /g' \
+-	-e 's/^ //' \
+-	-e 's/_Bool/NCURSES_BOOL/g' \
++| sed -f $ED1 \
+ | $AWK -f $AW2 \
+ | sed -f $ED3 \
+ | sed \
diff --git a/meta/recipes-core/ncurses/ncurses_5.9.bb b/meta/recipes-core/ncurses/ncurses_5.9.bb
index 6d23c0c..0644926 100644
--- a/meta/recipes-core/ncurses/ncurses_5.9.bb
+++ b/meta/recipes-core/ncurses/ncurses_5.9.bb
@@ -4,6 +4,7 @@ PR = "${INC_PR}.1"
 
 SRC_URI += "file://tic-hang.patch \
             file://config.cache \
+            file://ncurses-5.9-gcc-5.patch \
 "
 
 SRC_URI[md5sum] = "8cb9c412e5f2d96bc6f459aa8c6282a1"
-- 
1.9.1


