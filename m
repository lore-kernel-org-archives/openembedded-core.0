Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id EF9E17F232
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:11:30 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id b128so8883541pfa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 08:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=drmZnVebnxsU4fkNGU1ffoGVxbDM9WZk8yW81++u2VY=;
	b=X7jDHfvyIuBT3nqPRMjWhGMAQRtMpuq7DuFoWwAQj+FBXbPMsYUMAo8Eku5i4NCxzp
	z8X7KYnjZA2lW3ak/EjWwNSnXv3QoG3Q9HofhiVazrk/0FDuqP0OXy6mhczS2VhygAjW
	u9hG0WRnlWgS4+4xBihLz8vY5VSh74VDpAETQSNhq9/HtTEKyj6LZehwNGP6mCJuWv00
	+4MFzbTB9jobsEeLMEwVynd9bLvZ3s37WMNeDpMuC5z6QmpagAHtlwmRbxjgrzoChHxx
	Kq2s5s84Xi5GMqytQnuZKPlX1re56KZ7lE1JIi2envCnDLZv0SbVKatbXS6k+WoADnzx
	mGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=drmZnVebnxsU4fkNGU1ffoGVxbDM9WZk8yW81++u2VY=;
	b=ZyhpDe85RjUvciA3RRHL0LpHJyQJwbw7tXca629mhenTMsP4tnadirSc2loCRCO64Z
	oWsQ3wArpR5nFxf044vDEciVu9nwh7n7yP0AZ2Tfp+nQYhAXSQ9slrRYr6N8GIzmiZMD
	KcqViZMtk968jlS9AWjzxz+yBt7uSNKTrneGetAXGzosTYKL4S3YSFtllfWrseUjnnAC
	zgc7e2n1AwliSub0/dgQMiolvI7zotMnRewTqAWo5Sx1vfMSll8ZtsVg21QO+TkL6oeo
	wuEBCvHbJzdO5RlWpChZRiztzTe+n5/vhwyDkihzkISW8IH2PflJG0luynW2/Ha9hgML
	MrIw==
X-Gm-Message-State: APjAAAXCMpE0K/qqFKewCFAmjYicSp2l9XmSo/ggxLIeMPn11/0JAuV0
	qcAmPBNPOCu0Mgp1Hdjl1TFkVnpSr0o=
X-Google-Smtp-Source: APXvYqyZWTiA2Omg1ZPh3JtC2iiFskWDX3e/1i/PfrqEenLR3q9kHzaBSsqTh/EleYsRD83gjeGonw==
X-Received: by 2002:a63:1f1a:: with SMTP id f26mr9811433pgf.2.1570461091781;
	Mon, 07 Oct 2019 08:11:31 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	m102sm12786928pje.5.2019.10.07.08.11.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 08:11:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 08:11:00 -0700
Message-Id: <308c44fd8f1d7d348c6c7cf9054f9c8403d8e8bd.1570460789.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570460789.git.akuster808@gmail.com>
References: <cover.1570460789.git.akuster808@gmail.com>
Subject: [thud 23/26] patch: fix CVE-2019-13638
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
X-List-Received-Date: Mon, 07 Oct 2019 15:11:31 -0000

From: Trevor Gamblin <trevor.gamblin@windriver.com>

(From OE-Core rev: b59b1222b3f73f982286222a583de09c661dc781)

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 555b0642579c00c41bc3daab9cef08452f9834d5)
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


