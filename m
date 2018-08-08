Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8181B78D6F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 15:35:24 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id w14-v6so1195923plp.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 08:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CB85Gjp3VkQW74yBKY1tuewSX44tAAi5MVQ32C5xxwo=;
	b=gxcq12P7xPSF5LezV+SgSc0yHYy2K5Tuv9GFr8+dcAQ42fi8IloxzOrmrW52fn8kvj
	9E4FgfiiaB36Rc7m7aCd3BdTde95fUHpuyC+1/1PEfaqB14ySsii+lm4VPQiPnwavnh3
	MB0V22V3xkTd4bvCrbrMrukZ5iobdyhzQYKLjzptAd5yGzUCGjYD+PFzl9c6Ck1lGXvd
	u0qCQle6rsgSpKKAE9oGzI8IcDpX+7DQHx6FbqDd5VlOFSAXJejjZDpbzTgbWnhjQtvA
	D/vym/2oRrgNADqxJ2JHQmGwPecfdkEwRPVcr47wBJWP/5EW9/nt7xaVF7wmxO0d1p3F
	qAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CB85Gjp3VkQW74yBKY1tuewSX44tAAi5MVQ32C5xxwo=;
	b=aO/gbX6/h9788Rn5waWq7ianyUI9M0WCjw3qp+4jGRIdWxMjnFPhRYcT+V1QMY2npq
	5z4mE3qx1ej93DlH2jCgtfNbqCJVebPvOBaLNUKH53yS6ma4SYaB8HYM5neNVSMrb0yE
	6WEQZYtr3l3w0xjFpHrzPJR2UI3Vx/e08PAoTFf3IDU1kX0X/JDoaSGP9nOorxV5V554
	7tV4OJ1Ft+ARFoHQAAXiWaIt4bAXdK0z6cv6fS7MC2iVvRx8yZkJXzWJViMkCfS/yorn
	htbG09fzeC+fgrHpwhXcvW5sL2BenZgX3sq13qn9psZFFR5fxTXVHUAV1AmMxHY216NQ
	mcww==
X-Gm-Message-State: AOUpUlHFJzgKYcuRK2bkVvruZFskPZLAhT0HF9YPyPuuY3uvzaTdYLkQ
	0u/Xw7Z2Qv0M2K7ZBSpUV6E=
X-Google-Smtp-Source: AA+uWPw1dhudFEPTHb9N5mahsNQXTmc8fzytb50lbKgMPioILrmZUMycNxa/sT9JjF4GBZ4pCo3XtA==
X-Received: by 2002:a17:902:42c3:: with SMTP id
	h61-v6mr3036015pld.319.1533742525620; 
	Wed, 08 Aug 2018 08:35:25 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	q78-v6sm8290927pfi.185.2018.08.08.08.35.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 08:35:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 08:34:57 -0700
Message-Id: <1533742522-24357-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 02/27] binutils: Secuirty fix CVE-2017-14930
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
X-List-Received-Date: Wed, 08 Aug 2018 15:35:24 -0000

From: Armin Kuster <akuster@mvista.com>

affects <= 2.29.1

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2017-14930.patch         | 53 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-14930.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 12b579c..2232781 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -36,6 +36,7 @@ SRC_URI = "\
      file://0014-Detect-64-bit-MIPS-targets.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
      file://CVE-2017-12967.patch \
+     file://CVE-2017-14930.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-14930.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-14930.patch
new file mode 100644
index 0000000..bbd267a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-14930.patch
@@ -0,0 +1,53 @@
+From a26a013f22a19e2c16729e64f40ef8a7dfcc086e Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 24 Sep 2017 17:10:14 +0930
+Subject: [PATCH] PR22191, memory leak in dwarf2.c
+
+table->sequences is a linked list before it is replaced by a bfd_alloc
+array in sort_line_sequences.
+
+	PR 22191
+	* dwarf2.c (decode_line_info): Properly free line sequences on error.
+
+Upstream-Status: Backport
+Affects: <= 2.29.1
+CVE:  CVE-2017-14930
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 5 +++++
+ bfd/dwarf2.c  | 8 ++++++--
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+
+Index: git/bfd/dwarf2.c
+===================================================================
+--- git.orig/bfd/dwarf2.c
++++ git/bfd/dwarf2.c
+@@ -2473,8 +2473,12 @@ decode_line_info (struct comp_unit *unit
+     return table;
+ 
+  fail:
+-  if (table->sequences != NULL)
+-    free (table->sequences);
++  while (table->sequences != NULL)
++    {
++      struct line_sequence* seq = table->sequences;
++      table->sequences = table->sequences->prev_sequence;
++      free (seq);
++    }
+   if (table->files != NULL)
+     free (table->files);
+   if (table->dirs != NULL)
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,8 @@
++2017-09-24  Alan Modra  <amodra@gmail.com>
++
++       PR 22191
++       * dwarf2.c (decode_line_info): Properly free line sequences on error.
++
+ 2017-11-28  Nick Clifton  <nickc@redhat.com>
+ 
+        PR 22507
-- 
2.7.4


