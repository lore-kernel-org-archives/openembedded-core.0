Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id CA2DC61566
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 23:56:57 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so3875372eaj.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 16:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1uSWeo5/mBiV7xdNRM1q1V0s7TQmXOLnR3O8nW05iRM=;
	b=N+XL3Yv5eaZuTzdMwqxmlNfk23etlL457D+t53pPMWkDWu5zrtQnM/eNa5rrfZJocz
	iFVZD2a0tRjHxUsceCpoIiMl79oiwmiLde0T+gOyJ7BU8mH14AqXGEtwrI3PoKVLwTsW
	VWKUijDgHq2QSlZKta13404U0LVIpm9C6TkKJsOuUVftU81hyK6UItaGwKYG0hrTp5mW
	TcubCBhSt6pD4QXxlm5BnZQTXiS9SxO5IBWJb44zt8jcuYZ5AtzF9C6Pq7J6UHmAQJ2V
	hUcqJoh0Ko9BRLM6KHUWEuNAZdWiUi8VpMwyrZPYQUzWm0qPSMvn0KtXpQ1SNThVjLkL
	uahQ==
X-Received: by 10.14.183.130 with SMTP id q2mr63403581eem.5.1379548618851;
	Wed, 18 Sep 2013 16:56:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm6859262eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Sep 2013 16:56:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2013 01:58:32 +0200
Message-Id: <1379548712-18265-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1368548976-28229-1-git-send-email-Martin.Jansa@gmail.com>
References: <1368548976-28229-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH] gcc-4.8: temporary disable thumb
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
X-List-Received-Date: Wed, 18 Sep 2013 23:56:59 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* temporary work around for build issue on armv4t:
  | cp/decl.o: In function `bad_specifiers':
  | gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7171:(.text.unlikely+0x24): relocation truncated to fit: R_ARM_THM_CALL against symbol `error(char const*, ...)' defined in .glue_7 section in linker stubs
  | gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7173:(.text.unlikely+0x32): relocation truncated to fit: R_ARM_THM_CALL against symbol `error(char const*, ...)' defined in .glue_7 section in linker stubs
  | gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7176:(.text.unlikely+0x3e): relocation truncated to fit: R_ARM_THM_CALL against symbol `error(char const*, ...)' defined in .glue_7 section in linker stubs
  | gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7180:(.text.unlikely+0x4c): relocation truncated to fit: R_ARM_THM_CALL against symbol `error(char const*, ...)' defined in .glue_7 section in linker stubs
  | gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7182:(.text.unlikely+0x5a): relocation truncated to fit: R_ARM_THM_CALL against symbol `error(char const*, ...)' defined in .glue_7 section in linker stubs
  | gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7185:(.text.unlikely+0x66): relocation truncated to fit: R_ARM_THM_CALL against symbol `error(char const*, ...)' defined in .glue_7 section in linker stubs
  | gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7189:(.text.unlikely+0x74): relocation truncated to fit: R_ARM_THM_CALL against symbol `error(char const*, ...)' defined in .glue_7 section in linker stubs
  | gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7191:(.text.unlikely+0x82): relocation truncated to fit: R_ARM_THM_CALL against symbol `error(char const*, ...)' defined in .glue_7 section in linker stubs
  | gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7194:(.text.unlikely+0x8e): relocation truncated to fit: R_ARM_THM_CALL against symbol `error(char const*, ...)' defined in .glue_7 section in linker stubs
  | gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7198:(.text.unlikely+0x9c): relocation truncated to fit: R_ARM_THM_CALL against symbol `error(char const*, ...)' defined in .glue_7 section in linker stubs
  | gcc-4.8.0-r0/gcc-4.8.0/gcc/cp/decl.c:7200:(.text.unlikely+0xaa): additional relocation overflows omitted from the output
  | collect2: error: ld returned 1 exit status
  | make[2]: *** [cc1plus] Error 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc_4.8.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc_4.8.bb b/meta/recipes-devtools/gcc/gcc_4.8.bb
index 0ae22e8..c4827c6 100644
--- a/meta/recipes-devtools/gcc/gcc_4.8.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.8.bb
@@ -1,2 +1,7 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
 require gcc-target.inc
+
+# Building with thumb enabled on armv4t fails with
+# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7438:(.text.unlikely+0x2fa): relocation truncated to fit: R_ARM_THM_CALL against symbol `fancy_abort(char const*, int, char const*)' defined in .glue_7 section in linker stubs
+# | gcc-4.8.1-r0/gcc-4.8.1/gcc/cp/decl.c:7442:(.text.unlikely+0x318): additional relocation overflows omitted from the output
+ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
1.8.3.2


