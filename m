Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 958317F469
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:49 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id 205so4924272pfw.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MMWDv0uoopLviqWRqMrkPTByEkYY21bhkCQDH9w9D8M=;
	b=ueTBz8XX9YydMw37ESwWIb5hN8idV8eVXTcmStmqjDNaVJPTUX+65Icmh/UijdhDCX
	8AvIrO3y48VV564VHY+su5Foga/1P/Qo6ltabB9t7zmIl9jVF/QrLnfLjHk7OlxZ6pBv
	m860GJq+trSRu1vs67+pdFPRWnuGUUMZ8BFk1rWu1lupBvD6xlFMusuLEpfGyAUAnSUS
	ODwClsr0XtB6RRELbGWtHdsZKslquZHlPf+35Ew7gkwfzgfscdpaunZ4stwQOFC4g+yu
	zjEP4OhwMUFQx3rAbbZE7TGadVWZ7K8SiprznRDbC4Rua1FuhhmNGHCsSz2vGzPTn5kl
	MkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MMWDv0uoopLviqWRqMrkPTByEkYY21bhkCQDH9w9D8M=;
	b=d00EojwxqdDDZpVggAlQgBNU3BCSZsCF62oUrOOk0DAKNTnzzL6NWIGR++EnYOBmn2
	gJFSEq+I29kdmT+AnfiaFXKVcaSHY/UTDRG49ceBvuG5fupfSn5cES+WkzpXaojbqE/4
	tBKiwHzPX78G0S7vCdIhDGf6LCu+r3NxBV/+tmIDWSIEkmzEYdpu0AhDEV1mYN51k9RV
	lcedLOdJht/N+GK0mrYJaWvUPFqmXgLsoDSBbDhWfbSvnlXMZ/aM2ybxhcG7hUnNC7QH
	R6/0ch83nd+saaarfQcIA6Ck1+RP+FfAZiXMmUoQCEh9tQ0QPIeH34mh4gVnEp+9AtYY
	LsBw==
X-Gm-Message-State: APjAAAU44QK0XTUAmV1vASi/urQTjQ93m0zTYmS4GMk9f+sdCvYMF6sh
	qGfTUXrmq3Y2PnEdZNqdkwTe1t2q
X-Google-Smtp-Source: APXvYqy+nA4aHr1PTZZyoklpya/QiIRlP1fwX4t197BMiHBYwlv9ngR7kpSJU+4ZvlZo1UoeUMCgYg==
X-Received: by 2002:a62:ce0e:: with SMTP id y14mr29615955pfg.73.1567348610699; 
	Sun, 01 Sep 2019 07:36:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:36:05 -0700
Message-Id: <555b0642579c00c41bc3daab9cef08452f9834d5.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 27/43] patch: fix CVE-2019-13638
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:49 -0000

From: Trevor Gamblin <trevor.gamblin@windriver.com>

(From OE-Core rev: b59b1222b3f73f982286222a583de09c661dc781)

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ke-ed-directly-instead-of-using-the-shell.patch | 44 ++++++++++++++++++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb         |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch

diff --git a/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch b/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
new file mode 100644
index 0000000..f60dfe8
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/0001-Invoke-ed-directly-instead-of-using-the-shell.patch
@@ -0,0 +1,44 @@
+From 3fcd042d26d70856e826a42b5f93dc4854d80bf0 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruen@gnu.org>
+Date: Fri, 6 Apr 2018 19:36:15 +0200
+Subject: [PATCH] Invoke ed directly instead of using the shell
+
+* src/pch.c (do_ed_script): Invoke ed directly instead of using a shell
+command to avoid quoting vulnerabilities.
+
+CVE: CVE-2019-13638
+Upstream-Status: Backport[https://git.savannah.gnu.org/cgit/patch.git/patch/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0]
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+---
+ src/pch.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+
+diff --git a/src/pch.c b/src/pch.c
+index 4fd5a05..16e001a 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -2459,9 +2459,6 @@ do_ed_script (char const *inname, char const *outname,
+ 	    *outname_needs_removal = true;
+ 	    copy_file (inname, outname, 0, exclusive, instat.st_mode, true);
+ 	  }
+-	sprintf (buf, "%s %s%s", editor_program,
+-		 verbosity == VERBOSE ? "" : "- ",
+-		 outname);
+ 	fflush (stdout);
+ 
+ 	pid = fork();
+@@ -2470,7 +2467,8 @@ do_ed_script (char const *inname, char const *outname,
+ 	else if (pid == 0)
+ 	  {
+ 	    dup2 (tmpfd, 0);
+-	    execl ("/bin/sh", "sh", "-c", buf, (char *) 0);
++	    assert (outname[0] != '!' && outname[0] != '-');
++	    execlp (editor_program, editor_program, "-", outname, (char  *) NULL);
+ 	    _exit (2);
+ 	  }
+ 	else
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
index 8cf20a3..8908910 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
             file://0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch \
             file://0001-Fix-swapping-fake-lines-in-pch_swap.patch \
             file://CVE-2019-13636.patch \
+            file://0001-Invoke-ed-directly-instead-of-using-the-shell.patch \
 "
 
 SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"
-- 
2.7.4


