Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF107C37F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:19 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id q21so4845881pfn.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MMWDv0uoopLviqWRqMrkPTByEkYY21bhkCQDH9w9D8M=;
	b=Wb2/LfHNpeTJUKirryzoACe6CEmTpxC8TxFCH9/4VOhmblvL587h9xtUXSzkSdkFDU
	YZYK0VFsFToiOykd4BRTvL1msmazAB+BBJl6lK3PIn5brlT49X4eFL9JCHmmYMb7+0jo
	KCSGUuPmQKa4dt+vU9ieOc1Ie/jjQx8Ag2Cm2ZZeM12GDt0j3UcK8jn0t8BRzfg4M1jq
	Dns4Mgujb9Q7R4AjtqetG8oDncWLDdUXsrvRyzR+nLOYB64da7nk2nu6+YOYR23mBOC0
	cw7GIsek4mWF9D21cLGPCKC/Y39q05hfizLiAB8I4UyJLznbRlSCKYWT6MCebbyoZrU4
	DRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MMWDv0uoopLviqWRqMrkPTByEkYY21bhkCQDH9w9D8M=;
	b=TL4vN/BHfO53WkSmDkMPEaQXmmYMqDLOYlvlgzI+G9DjimkpSiClv6j+0QHmssCm0q
	GpEkSmUNdcq83F9xN3HsdIXP3reTPjzCvHerksD24Q7baJsSiqa/qIwQop3tUUL+SaOO
	ERQZY6dYWzAAmA+YUX3QY11OnJWfV7t4OTmeLPjkUzb+PDlWeEI1k/20/xWE6vpdkDFR
	7P6gdTc0Bc9+V+sqMGhSkvZDU6DZqa0EbTV7K8u5TWLgBq3U275TDBUXDSYLLmAV3n4Q
	Qxvoy1q8hE82N/BbF9bge5431MwlPqJY2qqi8+GVAOF9YFFjaI3P0ZFdttrJO3LPBLqi
	aGBw==
X-Gm-Message-State: APjAAAUDvcy2bN7ET+SoKRq5I30VUFazp6H6C2pnJw1HqY603+xQiVUW
	GikQEnLVK+moUiThlknhKx/7iBAZ4BA=
X-Google-Smtp-Source: APXvYqzpI12+Pi/o2KbNvavyBjYYrIiOCUJ4phrNalIQ2oCFQPX1orGwChnlpDV9Dz/Gh5LhltSBnQ==
X-Received: by 2002:a63:1665:: with SMTP id 37mr317932pgw.218.1569818900144;
	Sun, 29 Sep 2019 21:48:20 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:21 -0700
Message-Id: <87106ff3f2d24b58a90767e288f783aa92c25748.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 26/54] patch: fix CVE-2019-13638
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:20 -0000

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


