Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 018989169E
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:01 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id x7so3904331pgl.11
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SrlwjbvtlgJ+YXJsm0Zm3vzk9UBfP1kSqVgcQn2vPA4=;
	b=Yuoc+YF6HJlvqtRHkbieYcDyEd1tJ1IqqZWH4k8z8opkJrGkHUQEVkTxjqtnlxVb8c
	x61urD9+QvpnHVR0+CHoxYUsPGtXl7kr6PsVD9ONbup4JXF28N3EtzQDhgbmmBIAgzfc
	bywD4oaOheBEPSi0jxE61U+Hvn/LY2NTY5flwXgXldCwyfUsvUv7FlZMxVqqWThGI/oY
	hJHaqfU+05VZqycsj0kFSzMM0IbGUHHulZfgtnUL9eOiPsZrnpxQVKqnWvz7xto6c60J
	QjCfzVjb9uYvBfGi6E9oNaGiEBNwJQPC7G7cd8A2WRMo7SXbvq6pj57QbtCWc8j9TbEn
	DFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SrlwjbvtlgJ+YXJsm0Zm3vzk9UBfP1kSqVgcQn2vPA4=;
	b=gEX29B5N7P5hQ4xaz7LmgdrGH5JGarWY5MR52lFAHHhvZUdu+1uK5LMwLDzeLVe1CF
	lZ8YuiX5kuHnFNs9jdpqvQZ1hQg1RXyq5K75QsY1Kcutqd24B7giNoObiho0Y6jq/gAR
	k3pk9PLg4Jsskc3/rzchNU7TN+ymaOuZOx6BiKS3cxzNM1GRIZB9UIuzPAdGxZ+c2P59
	9pWQ535+AV5lLzX5c56BTJHRyazXnkQbrrIbObhbPOTzQViNZQ5OmrDrgiWwSTouXBGl
	fNzL5Jmk5l2ZbXVLKU7x/RJH5DSmPKO7vZKBBZTOuTWl7mMHBidQc8IkbkO5PgAcNLyQ
	fhpw==
X-Gm-Message-State: APjAAAXyTR7NordhfNbn159H1O9vmqMchdxxUebUXExhqgjHMk5IYo0K
	atkvtmUKlBosEAT3qBNxbH8GEr+G
X-Google-Smtp-Source: APXvYqzA7srQsByW7xSP3aRNXUAPcyZ/7bnndD3KtQTimnRtG8ToFXaWdDsM7KMWkm+/Rsm/8IhvTA==
X-Received: by 2002:a62:486:: with SMTP id 128mr5462664pfe.236.1580055902859; 
	Sun, 26 Jan 2020 08:25:02 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.02
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:32 -0800
Message-Id: <02c54859c009be191958a19a5c3549a6635cc647.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 07/29] binutils: fix CVE-2019-17451
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:02 -0000

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Backport upstream fix.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../binutils/binutils-2.32.inc                |  1 +
 .../binutils/binutils/CVE-2019-17451.patch    | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
index a92bfd0354..739ba70cf2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
@@ -53,6 +53,7 @@ SRC_URI = "\
      file://CVE-2019-14250.patch \
      file://CVE-2019-14444.patch \
      file://CVE-2019-17450.patch \
+     file://CVE-2019-17451.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch
new file mode 100644
index 0000000000..b36a532668
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-17451.patch
@@ -0,0 +1,51 @@
+From 0192438051a7e781585647d5581a2a6f62fda362 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 9 Oct 2019 10:47:13 +1030
+Subject: [PATCH] PR25070, SEGV in function _bfd_dwarf2_find_nearest_line
+
+Selectively backporting fix for bfd/dwarf2.c, but not the ChangeLog
+file. There are newer versions of binutils, but none of them contain the
+commit fixing CVE-2019-17451, so backport it to master and zeus.
+
+Upstream-Status: Backport
+[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=336bfbeb1848]
+CVE: CVE-2019-17451
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+
+Evil testcase with two debug info sections, with sizes of 2aaaabac4ec1
+and ffffd5555453b140 result in a total size of 1.  Reading the first
+section of course overflows the buffer and tramples on other memory.
+
+	PR 25070
+	* dwarf2.c (_bfd_dwarf2_slurp_debug_info): Catch overflow of
+	total_size calculation.
+---
+ bfd/dwarf2.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index 0b4e485582..a91597b1d0 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -4426,7 +4426,16 @@ _bfd_dwarf2_slurp_debug_info (bfd *abfd, bfd *debug_bfd,
+       for (total_size = 0;
+ 	   msec;
+ 	   msec = find_debug_info (debug_bfd, debug_sections, msec))
+-	total_size += msec->size;
++	{
++	  /* Catch PR25070 testcase overflowing size calculation here.  */
++	  if (total_size + msec->size < total_size
++	      || total_size + msec->size < msec->size)
++	    {
++	      bfd_set_error (bfd_error_no_memory);
++	      return FALSE;
++	    }
++	  total_size += msec->size;
++	}
+ 
+       stash->info_ptr_memory = (bfd_byte *) bfd_malloc (total_size);
+       if (stash->info_ptr_memory == NULL)
+-- 
+2.23.0
+
-- 
2.17.1


