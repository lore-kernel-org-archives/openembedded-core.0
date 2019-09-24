Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4678C7F2D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:13:44 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id y72so293090pfb.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 20:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=drmZnVebnxsU4fkNGU1ffoGVxbDM9WZk8yW81++u2VY=;
	b=Pyl4W+9YWFVg6N06paB1yqI+/8x/Z/xea6sOcpe765HyykLx7PURGTC36eK+nzEI4l
	y17xvWTVbjq68sVA0y81OKQWzYQo+mjZbYnwpGUpeJaYdZvb1h5VCTMWqxbzeJfkfcyT
	3swPo8Za9UpyLTfQAk8NEOAfKWk0/dWdCRdvD1om/WXHUmVdCUdtKCeZmNs2fFsrUpWf
	vWHNMGxayV6NnJC5or1uvCydx/Fnbb3naMYtDVX9LRN9uAWqE7R7cw7grT1U3Rodqeb0
	z8kNvqbUNS9nWNBK5xls/TTF1KafY7y1KiTL8n7sDa5l638hAT/c8Ods6A1ZZTqZ84TI
	zNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=drmZnVebnxsU4fkNGU1ffoGVxbDM9WZk8yW81++u2VY=;
	b=U/DlY5m5lsL3/+PP8+MqtSjNmKNwW7HqncFGUKfA8OvLKC5nsd6kpo9lugPtw/m9Ah
	n4ijRV4+F2/j3l+hkskGICQClcNNsYlOVKQWb5uJDyFu3+YNLf4Pn3XKH6wnEAXXosAS
	2+Vg6kY0qgzIILmU6KK9BM9WVGa7m7triabviBGm43ornoGKjMxNxjeUpC7ZgDU3mnqK
	iNhCgU1DerlJjoYN0BSCz1r6CrOOxu04uW6fd2vqU8sU6WmR8O8ZhfTRqjcomK2OnmhC
	YrhZozbXqG3MIWYBz6q/fhtif6RrrfV00LkyuaIb3Dq3dw5F08hWcStLgPyCO4ePscMJ
	07Mw==
X-Gm-Message-State: APjAAAWHSa/Bxh8QUpXd3aMnPCmxinSmV2PAofbXfLhYl6cutMZ5+dht
	HuMbovPdnLDsaCSxIo1N8iLDJLS+Y14=
X-Google-Smtp-Source: APXvYqz/R98smW6qNl9Z+V4y1GyvQ+8uaJst4mxoHwcvQr8ao65Kxo+0CYJa9azOfJ+B956VniLkBA==
X-Received: by 2002:a62:5847:: with SMTP id m68mr806352pfb.23.1569294825290;
	Mon, 23 Sep 2019 20:13:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id z23sm252602pgi.78.2019.09.23.20.13.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 20:13:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 20:13:17 -0700
Message-Id: <160802a48c4596129f4831365383e08b74f818e2.1569294712.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569294712.git.akuster808@gmail.com>
References: <cover.1569294712.git.akuster808@gmail.com>
Subject: [Thud][ 21/24] patch: fix CVE-2019-13638
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
X-List-Received-Date: Tue, 24 Sep 2019 03:13:44 -0000

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


