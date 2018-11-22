Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 762156C5C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 15:41:59 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id p2-v6so9499460wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DWqLr3G8JY/LKZs4aD7shywaOr2EfRX3ER0pP83Uc1s=;
	b=Qz7HTYgM38ghYuo5CUSA1agObono/IIOYyuOc8RMiJaKmMU9ULfjbx82ZCtx3WdZ1b
	mT+8HTl0bydCwVBIadt3baYrSQPfIr8OtbkluicFPnWdNnEKmBbp0NICEjDuc2XtERfi
	QLY1p2PJT4NpfNjUkBQycLrpW+fDMXnxJL+1a4KagAjfhxTAHFixyNhPiDizCR68pf9x
	XLnxD4ii+zhx1Z/hdXo0a5OO3ZljpfifJIUQQubqx86wZI7fWbuy7ITt3PqmwyqSh3Yq
	nZw6KpuvlGUkj3GiwpqiVnC2O0Fw6uttFx5A7doiP6jNR9B5bIy2gvpCvvYyH3o4D3X3
	SZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DWqLr3G8JY/LKZs4aD7shywaOr2EfRX3ER0pP83Uc1s=;
	b=PwJ5qB6GQ4S/zSZ/Hk0eyu7zrCoxZFOEgOeDDPd8Xexw/sZtpnawutCeYZqzRfZq3M
	sXNIv09p/nM+jqLOh2DrrIn4vELrLHKFdeU3XUwI50omyl/dX//gAdmRZWlLR2ym3oMw
	DDokr0lCubxSK27Ja7O72yJ7ojJqkkOB3CEPqc/a3NqFlQEbvFa3DGYUJEwFQn+Pxn1g
	maDyOLsH9oVOkX3R7IFzV/ck9hnNYmRvLCepn9iLg30QuiAlf1gCEo3nP/Tr+9Qv8ZYB
	APU3XUQjUlbDSKx2INCzfdYbuom3z7w+kPXn833E5tWrQcbNHBpZeRS08PLpWDNIY341
	RatA==
X-Gm-Message-State: AA+aEWYpLSEGrzCHRiQFKJwyPsZZWpcZqYDzxB005O42BJ4pzPeMFTsB
	4ODLyf0xpK8T0pytOXR0xELgcu6B
X-Google-Smtp-Source: AFSGD/XMWzRTgjVLqttyKLb1to93sTS/NC1R05GtS+w9yZXXkBccNiP0WShOioRrQlHHq/ao3csJbQ==
X-Received: by 2002:a1c:2807:: with SMTP id
	o7-v6mr9860717wmo.138.1542901319829; 
	Thu, 22 Nov 2018 07:41:59 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm3302931wmf.22.2018.11.22.07.41.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 07:41:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 16:41:31 +0100
Message-Id: <20181122154136.121480-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122154136.121480-1-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/16] psmisc: update to 23.2
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
X-List-Received-Date: Thu, 22 Nov 2018 15:41:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch | 14 +++++---------
 .../psmisc/{psmisc_23.1.bb => psmisc_23.2.bb}      |  2 +-
 2 files changed, 6 insertions(+), 10 deletions(-)
 rename meta/recipes-extended/psmisc/{psmisc_23.1.bb => psmisc_23.2.bb} (87%)

diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch b/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
index b57a006bc67..3609594b67a 100644
--- a/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
+++ b/meta/recipes-extended/psmisc/psmisc/0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch
@@ -1,4 +1,4 @@
-From 5dc872bb2fba6421cb8e1ee578f7bd4aaed55f61 Mon Sep 17 00:00:00 2001
+From 115fcf1daff18aa2f2e130d63704f04031878db0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 24 Mar 2016 15:46:14 +0000
 Subject: [PATCH] Use UINTPTR_MAX instead of __WORDSIZE
@@ -7,14 +7,13 @@ Do not include sys/user.h since it conflicts with
 pt_regs struct from kernel APIs in asm/ptrace.h
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
 
+---
  src/peekfd.c | 13 ++++++++-----
  1 file changed, 8 insertions(+), 5 deletions(-)
 
 diff --git a/src/peekfd.c b/src/peekfd.c
-index cba2130..0d39878 100644
+index 5aa990a..7e8e3fc 100644
 --- a/src/peekfd.c
 +++ b/src/peekfd.c
 @@ -30,8 +30,11 @@
@@ -28,8 +27,8 @@ index cba2130..0d39878 100644
 +#include <stdint.h>
  #include <getopt.h>
  #include <ctype.h>
- 
-@@ -228,11 +231,11 @@ int main(int argc, char **argv)
+ #include <dirent.h>
+@@ -266,11 +269,11 @@ int main(int argc, char **argv)
  		if (WIFSTOPPED(status)) {
  #ifdef PPC
  			struct pt_regs regs;
@@ -46,6 +45,3 @@ index cba2130..0d39878 100644
  #elif defined(ARM)
  			struct pt_regs regs;
  			ptrace(PTRACE_GETREGS, pid, 0, &regs);
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/psmisc/psmisc_23.1.bb b/meta/recipes-extended/psmisc/psmisc_23.2.bb
similarity index 87%
rename from meta/recipes-extended/psmisc/psmisc_23.1.bb
rename to meta/recipes-extended/psmisc/psmisc_23.2.bb
index f07c9db1e7e..38e0a440587 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.1.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.2.bb
@@ -6,5 +6,5 @@ SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https \
            file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
 	   file://0001-Makefile.am-create-src-directory-before-attempting-t.patch \
            "
-SRCREV = "bd952b3063f2466ecab4ec093026cf0c4ce373c7"
+SRCREV = "44eab9a3a63394eae6b79a7ef0a042f57e0c8a8f"
 S = "${WORKDIR}/git"
-- 
2.17.1


