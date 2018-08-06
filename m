Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 627CC78869
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 14:29:24 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id s198-v6so22482208oih.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 07:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GDx4mRosGZSYlCRnr8LRTJL2tjhzRvYEiUbAFk7fGc4=;
	b=P/Vgsz3Q3xqF8sR+7zEuoIQWdet3yLvfJYQg7+kuKcqRyRhcIbv8t5PACW/tYhiDhL
	0edPDprMfP2yZkEDurfN/Z7bL/T6PQF/Vy1gQZ5fd0DqSqUwzBoTUNpR+1Pjcq+144Hv
	SKVrRgxdZHisGfhWVTHL2ZhUm2hDGSmY/JyG2fQE2jF0MMLbBnn3/jmmyvSUVmCsSmD+
	laqoXVmcQ1iZBCLIJtn1AxygtLC5/BOsjf/eAT6u3E083XlR0kJIr7alI2Tqgv/eFlKp
	7EI7px9TfKj1UYBUsBHUxKeWHJpzWsD6Nuf5VEKAdIDbnsXabKdqnw8FuLNmybuc2TPd
	UFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GDx4mRosGZSYlCRnr8LRTJL2tjhzRvYEiUbAFk7fGc4=;
	b=FWNW8ZqkCjE/xuCFnvMy5U0hWEMfxV7knyVgDzxt/sLn7gc8obnnijfATy/5TuQBvX
	e/hVMuGOgpWNTnAjTyIoABqp/wp3QOe6UmmJCkzale0zaXuvQbJ7ZLaoj1NqtuY2gCAx
	9IIDZQVKhb30+/H3PezBaz7tXxS/2EaaiOaralPPpLq1IA5WvTOk1M7tMLxFzGxgPIyz
	XOOPPt3lAHDywCtC4dflWx8s7Wuf6Wpo8ExgxjJezZjQzO9q1a/+StyekNwGLloY9ZCx
	paF0XFJrUDP4PH7OXrtmTMBp9JlzQUNkt3SWMfhdc6j6gAu226sh4ZeKmILcpBhpDv+p
	HARA==
X-Gm-Message-State: AOUpUlGJnNcfPPxNj8Hk4ZfzZfmdSuuxXbtU1hbj9LqjOw56+9wJC2xi
	9VvJwrK4rbyvT1s6VTvkS9A+T+ts
X-Google-Smtp-Source: AAOMgpf+f+um3Yjo5A6GYsPaXdYEgpx85YOK8QRQA/XlAQzYjbDvlP1f9Kz2eFpXOi7yTTQuU7SFKA==
X-Received: by 2002:aca:e748:: with SMTP id
	e69-v6mr15415011oih.263.1533565765565; 
	Mon, 06 Aug 2018 07:29:25 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	j193-v6sm13645810oih.55.2018.08.06.07.29.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 07:29:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 07:29:12 -0700
Message-Id: <1533565758-2467-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
References: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
Subject: [SUMO][PATCH 06/12] binutls: Security fix CVE-2018-7208
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
X-List-Received-Date: Mon, 06 Aug 2018 14:29:24 -0000

From: Armin Kuster <akuster@mvista.com>

Affects <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.30.inc   |  1 +
 .../binutils/binutils/CVE-2018-7208.patch          | 47 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-7208.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.30.inc b/meta/recipes-devtools/binutils/binutils-2.30.inc
index 6b915fa..3a39d5f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.30.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.30.inc
@@ -40,6 +40,7 @@ SRC_URI = "\
      file://CVE-2018-6872.patch \ 
      file://CVE-2018-6759.patch \
      file://CVE-2018-7642.patch \
+     file://CVE-2018-7208.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-7208.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-7208.patch
new file mode 100644
index 0000000..8efefeb
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-7208.patch
@@ -0,0 +1,47 @@
+From eb77f6a4621795367a39cdd30957903af9dbb815 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 27 Jan 2018 08:19:33 +1030
+Subject: [PATCH] PR22741, objcopy segfault on fuzzed COFF object
+
+	PR 22741
+	* coffgen.c (coff_pointerize_aux): Ensure auxent tagndx is in
+	range before converting to a symbol table pointer.
+
+Upstream-Status: Backport
+Affects: Binutils <= 2.30
+CVE:  CVE-2018-7208
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/coffgen.c | 3 ++-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+Index: git/bfd/coffgen.c
+===================================================================
+--- git.orig/bfd/coffgen.c
++++ git/bfd/coffgen.c
+@@ -1555,7 +1555,8 @@ coff_pointerize_aux (bfd *abfd,
+     }
+   /* A negative tagndx is meaningless, but the SCO 3.2v4 cc can
+      generate one, so we must be careful to ignore it.  */
+-  if (auxent->u.auxent.x_sym.x_tagndx.l > 0)
++  if ((unsigned long) auxent->u.auxent.x_sym.x_tagndx.l
++      < obj_raw_syment_count (abfd))
+     {
+       auxent->u.auxent.x_sym.x_tagndx.p =
+ 	table_base + auxent->u.auxent.x_sym.x_tagndx.l;
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,9 @@
++2018-01-29  Alan Modra  <amodra@gmail.com>
++
++       PR 22741
++       * coffgen.c (coff_pointerize_aux): Ensure auxent tagndx is in
++       range before converting to a symbol table pointer.
++
+ 2018-02-28  Alan Modra  <amodra@gmail.com>
+ 
+        PR 22887
-- 
2.7.4


