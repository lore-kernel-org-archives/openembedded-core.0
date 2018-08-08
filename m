Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 349FA78D97
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 21:54:23 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id 13-v6so6457765ois.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 14:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZXrBJWf9o9QE7nGbXgiulyQ4G+KLLit7CQdzGLQpxeA=;
	b=U6AZ7uwXKVR8yqAMCo9+ilYnjjzzPe5xcDlvm8K1GSxZ7mCDJHnMphGTkZmNyXcwZg
	n5FDu1HJoyNUpe92tNQbJPCnRv2mDq48QTUr5etgZfRQ/+8qW5hHOCiQ+TTk6pOjKyCC
	LBQuanPF6+yR4XgEnjTtC7Bj9vBnemLJELovVN0dXPC2O5lxCFAaooNZVK5P+dM3iY58
	+q9VVWKh1KlIxDwuUDWHrRdEmVUP1F6X2od5TvAxHSckitDP1Re7KI1edII/OUWFoKc6
	n0VYq/pkGPAyxIckxp/j0JBgUq7urk/TeSqOH8gJhAicIDmQlbpzjqkWQzKSgdwm/JVQ
	BA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZXrBJWf9o9QE7nGbXgiulyQ4G+KLLit7CQdzGLQpxeA=;
	b=ofpi9/8rN8HEaThnmefjhEm7RxhXe1QlI82iIMgqUqu//URHO4AjoQzvgwWoY6Lpzv
	aD7zAKFt5kvK3suE1H9FZMPGweM5tTDelMfaEjB2292s9asOKp3udC/V3Cu9Ii7fCJqc
	krjLMWqZCFG76B7OXogoQ888MQl/iD22RwvPZV4JEe+oLWwTCvQPo0C3u/il84CqHhAO
	vGFzx9KcTE4zDhNbBItQba+0QgFxNgXrkJZv6l3FyvZuj1CCDwBNwROnJP8woAVJn9c7
	HR9lscUWGAljAtkyDrbG/VosUWNaQJFzcJLCsfPw6cS3MYRr6UQ35CQqp60hAVlvIfqO
	bQ5A==
X-Gm-Message-State: AOUpUlGgnt8LOy73wcGtOylDMudgTeWQcjgbCr76K5VWcSBVbig/ELZu
	chDhkhyuuX8Je8kxzqoWFTCmIis5
X-Google-Smtp-Source: AA+uWPzbk2wjw7I0Zza4ICxPId6MJrnmxvnjtl+7k9ACY8HFqPg0Cav7c5oS4VvWgx6CZkPK9sDXXA==
X-Received: by 2002:aca:b154:: with SMTP id
	a81-v6mr5120645oif.34.1533765264179; 
	Wed, 08 Aug 2018 14:54:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	s3-v6sm3384122oif.22.2018.08.08.14.54.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Aug 2018 14:54:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 14:54:10 -0700
Message-Id: <1533765259-10091-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
References: <1533765259-10091-1-git-send-email-akuster808@gmail.com>
Subject: [ROCKO][PATCH 03/12] Binutils: Security fix for CVE-2018-10373
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
X-List-Received-Date: Wed, 08 Aug 2018 21:54:23 -0000

From: Armin Kuster <akuster@mvista.com>

Affects: <= 2.30

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
 .../binutils/binutils/CVE-2018-10373.patch         | 45 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-10373.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index 7830b87..1916743 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -66,6 +66,7 @@ SRC_URI = "\
      file://CVE-2017-17125.patch \
      file://CVE-2017-17123.patch \
      file://CVE-2018-10372.patch \
+     file://CVE-2018-10373.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-10373.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-10373.patch
new file mode 100644
index 0000000..963d767
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-10373.patch
@@ -0,0 +1,45 @@
+From 6327533b1fd29fa86f6bf34e61c332c010e3c689 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Tue, 17 Apr 2018 14:30:07 +0100
+Subject: [PATCH] Add a check for a NULL table pointer before attempting to
+ compute a DWARF filename.
+
+	PR 23065
+	* dwarf2.c (concat_filename): Check for a NULL table pointer.
+
+Upstream-Status: Backport
+Affects: <= 2.30
+CVE: CVE-2018-10373
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog | 5 +++++
+ bfd/dwarf2.c  | 2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+Index: git/bfd/dwarf2.c
+===================================================================
+--- git.orig/bfd/dwarf2.c
++++ git/bfd/dwarf2.c
+@@ -1587,7 +1587,7 @@ concat_filename (struct line_info_table
+ {
+   char *filename;
+ 
+-  if (file - 1 >= table->num_files)
++  if (table == NULL || file - 1 >= table->num_files)
+     {
+       /* FILE == 0 means unknown.  */
+       if (file)
+Index: git/bfd/ChangeLog
+===================================================================
+--- git.orig/bfd/ChangeLog
++++ git/bfd/ChangeLog
+@@ -1,3 +1,8 @@
++2018-04-17  Nick Clifton  <nickc@redhat.com>
++
++       PR 23065
++       * dwarf2.c (concat_filename): Check for a NULL table pointer.
++
+ 2017-11-28  Nick Clifton  <nickc@redhat.com>
+ 
+        PR 22506
-- 
2.7.4


