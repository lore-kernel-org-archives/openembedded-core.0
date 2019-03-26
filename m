Return-Path: <ricardo@foundries.io>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6A9177D0FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 18:07:38 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id k130so8225708qke.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 11:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=twvUVUZ+gde4BMC0O1Ka23KmiGu0x4is1s0oDmZYbqQ=;
	b=od39R0b1yIw7f5TB6nRYlE1K89jI0iF889rFGXxrIwp/GWrfLe3cVi4pqdp15ngOiK
	5d3wjnVpb0X6Cba8/8EiB0I7qhUQWqUO9BqGez7T7A5cpVnA7suJ64/XUTBXLylPKtz8
	HReHOH1JQretpiz7qSLmAN7cIwv9NGwpIacAkP5ttZTEC8wta6B5Gx3IZl4me2bJ2XTw
	1oH+TpMW/2A8jWJbMFHvcW539UhkY+iaHaGqZ87HVtvRWodZNh+2QGNdolya4i6moTl+
	8nh9g7rTd0L3HBy7PnyMx0lH2Z+IQRmK5HOZqtHOvGN7yYPue38tHUbb9RUgWkge86z5
	9V6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=twvUVUZ+gde4BMC0O1Ka23KmiGu0x4is1s0oDmZYbqQ=;
	b=fldNjD2prSmpMcpj0e4fjSzslX2/IvEcE60/qYwJ3esJU9/P14rXTMLNHZr/LU9qtB
	HNC9mpTiWE2UjyzFE0pinZ3D9PSsBtWXiKhRRv1wfLIuuo/k3AEP7iDwM64bmyiqWysz
	HIHPblCRu0IfdXCsJa7YTZ8Lx0MsE7Oe3lIJMPJ9PEOmtN49MJUSTIBWZA5dbXtcYcM8
	Tm49PHnj0wrwyEtUOgz6MgWDP7GMzpz0qu++rohbZyFmskHcTJoKuDFaUVv4r3IwE+TS
	5wP2nVRMLSmi0felsI2wTtuuqZvvhlhx1WGE5LZhTVd9wsY0GJwuZaIedd0J64FmWg6j
	X53A==
X-Gm-Message-State: APjAAAX+h2l8mtFYWmOAZ83yuQu0lhcD6Lh69qGxPo8ul51v9zHekW4O
	c6yZ/vQFYxI0m1FV66MLyqHxP0XuLoL0
X-Google-Smtp-Source: APXvYqxUwqb8iDEi+t4WcDAkWtjuA90wPe78CaKl+1FKZzmXYry69hpTQNYoHQK6j1Gr6SMFSlukDA==
X-Received: by 2002:a37:8301:: with SMTP id f1mr25690172qkd.215.1553623658935; 
	Tue, 26 Mar 2019 11:07:38 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:bade:804b:9c80:f399:7db7:ab3f])
	by smtp.gmail.com with ESMTPSA id
	p52sm1184709qta.37.2019.03.26.11.07.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Mar 2019 11:07:38 -0700 (PDT)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2019 15:07:35 -0300
Message-Id: <20190326180735.26818-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] gcc-8.3: add back GLIBC_DYNAMIC_LINKER riscv changes
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
X-List-Received-Date: Tue, 26 Mar 2019 18:07:38 -0000

The riscv GLIBC_DYNAMIC_LINKER changes were dropped during the gcc 8.3
update, breaking usrmerge support.

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 ...NAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-8.3/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc-8.3/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
index 91a55c556f..d3be10f207 100644
--- a/meta/recipes-devtools/gcc/gcc-8.3/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0012-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
@@ -1,4 +1,4 @@
-From 4a697387eeab14ece2796c01382cca30e8467ffa Mon Sep 17 00:00:00 2001
+From 6f8649936df3677109b8396f563c716ae8b237fe Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 29 Mar 2013 09:24:50 +0400
 Subject: [PATCH 12/40] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
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
+index aa8a28d5d31..ebf9551c955 100644
+--- a/gcc/config/riscv/linux.h
++++ b/gcc/config/riscv/linux.h
+@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
+     GNU_USER_TARGET_OS_CPP_BUILTINS();				\
+   } while (0)
+ 
+-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-riscv" XLEN_SPEC "-" ABI_SPEC ".so.1"
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-riscv" XLEN_SPEC "-" ABI_SPEC ".so.1"
+ 
+ #define MUSL_ABI_SUFFIX \
+   "%{mabi=ilp32:-sf}" \
 diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
 index 44eab40a234..54aa8d957e7 100644
 --- a/gcc/config/rs6000/linux64.h
-- 
2.17.1


