Return-Path: <ricardo@opensourcefoundries.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 062CD74583
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2018 01:01:15 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id b20-v6so4526010qtp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 18:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=opensourcefoundries-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=khMR+DjBeR+hm+8tz45xFq5syDHPulUQLvo6Ljq2tag=;
	b=zWnAi+aWqeki8hCO+ahsg7zq8m8U+xFb0uIe8QC8QRmf/XaHKUHto0vZ1uG7s0z+kG
	l0HWPCCicukjrXOJWY2MRwSsCTNgMKjrhyvZgXFcUezNye/UagAycWTrAHp8ndlfuOn/
	qdhjR0ckRPgLN8tCRGpbwGFDBEczGBekRW1IozkGtPjgdGtIwCBU/lwityxD/gxuqN2v
	Kc+sM41OdSbJ0KsfpmwxsThi17PpFXdxporjHhQGIDpJI/Dq0NI6EV4956HsaGpc/lB9
	clpYX4FyJJoN+g14s64H7UT2zp4OKd0SYr2aJtmNrwztzlr8UVtNaZEF851PjxFNKZ1D
	hSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=khMR+DjBeR+hm+8tz45xFq5syDHPulUQLvo6Ljq2tag=;
	b=h+cihPEeuBzYGmXlJqjsaBR+TQjcpy46P818RRdaiiRe7BmC7m8UIitM1G9uS/dTHO
	Xj3NzNR9PuxBFD1IgVpRpYfHGCf7fia1kle57OR8hl8p7wUcxgKsVq7LbuZbENIbqr9H
	fzMNIKRXD8ofhmcwICsAZA9uaKRcaJkeGqn/mPx/QMo0/iREny9v2+Gv8zNEGWgJSCfd
	Hu3CBKypVFehLiyNovWLiJejENbXbBP9NqThcX+CLRpEWrAm8jv0vlp5YiaX4ExqXD15
	SJAA2lrtWRm1mef5J98lTKIAn9HyYogVtMIw3a1SJb/8WmwHYFzjY1VenYtVv4Qx63PF
	lKUg==
X-Gm-Message-State: APt69E3XgXzCGpjSd1L+/nkZRZufaEBLJizSV1H2o9TYCnkq5IupLxyU
	8EUiWPT8rI3HACGGzgY8TS5bEENMxw==
X-Google-Smtp-Source: AAOMgpfWUDnlPGqIbkGl0/z/EseH07uzU/ay1eCtTqkRH5or9WsjARdaSR8NyXQtkvVgK4mdvVksDA==
X-Received: by 2002:aed:3624:: with SMTP id e33-v6mr442712qtb.22.1529974876459;
	Mon, 25 Jun 2018 18:01:16 -0700 (PDT)
Received: from localhost.localdomain ([189.4.98.150])
	by smtp.gmail.com with ESMTPSA id
	x4-v6sm195968qti.7.2018.06.25.18.01.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jun 2018 18:01:15 -0700 (PDT)
From: Ricardo Salveti <ricardo@opensourcefoundries.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jun 2018 22:01:05 -0300
Message-Id: <1529974865-29179-1-git-send-email-ricardo@opensourcefoundries.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] gcc-8: define GLIBC_DYNAMIC_LINKER relative to SYSTEMLIBS_DIR on riscv
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
X-List-Received-Date: Tue, 26 Jun 2018 01:01:16 -0000

Refresh 0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
to also define GLIBC_DYNAMIC_LINKER relative to SYSTEMLIBS_DIR on riscv.

Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
---
 ...e-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 8913c87..043bb9d 100644
--- a/meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.1/0014-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -23,11 +23,12 @@ Upstream-Status: Inappropriate [OE configuration]
  gcc/config/i386/linux64.h    |  6 +++---
  gcc/config/linux.h           |  8 ++++----
  gcc/config/mips/linux.h      | 12 ++++++------
+ gcc/config/riscv/linux.h     |  2 +-
  gcc/config/rs6000/linux64.h  | 16 ++++++----------
  gcc/config/sh/linux.h        |  2 +-
  gcc/config/sparc/linux.h     |  2 +-
  gcc/config/sparc/linux64.h   |  4 ++--
- 11 files changed, 29 insertions(+), 33 deletions(-)
+ 12 files changed, 30 insertions(+), 34 deletions(-)
 
 diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
 index 36b74dc1993..02373578af8 100644
@@ -152,6 +153,19 @@ index 2dfd0c18b90..12057c51b5e 100644
  
  #undef MUSL_DYNAMIC_LINKER32
  #define MUSL_DYNAMIC_LINKER32 \
+diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
+index aa8a28d5d..ebf9551c9 100644
+--- a/gcc/config/riscv/linux.h
++++ b/gcc/config/riscv/linux.h
+@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.
+     GNU_USER_TARGET_OS_CPP_BUILTINS();				\
+   } while (0)
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-riscv" XLEN_SPEC "-" ABI_SPEC ".so.1"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-riscv" XLEN_SPEC "-" ABI_SPEC ".so.1"
+ 
+ #define MUSL_ABI_SUFFIX \
+   "%{mabi=ilp32:-sf}" \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
 index 90fe6566255..55695dadd91 100644
 --- a/gcc/config/rs6000/linux64.h
-- 
2.7.4


