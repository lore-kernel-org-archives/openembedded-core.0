Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8D81B7EFD5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:50:00 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id w10so356770pgj.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MMWDv0uoopLviqWRqMrkPTByEkYY21bhkCQDH9w9D8M=;
	b=WBCUXnpTBw8xCa5L61PFjD0e5zBM48nAzzlquEwfsv5bYQn7Cm8g8FhGXzbbIwrQfV
	xmYkXYAlxTDpz8hN5ZDekZ9NFWFzBGBHqBTd22LilWDYPHb8R3Jad5koTDtvgjqlXmHi
	sP/LIx15lRkZ+MLoBaymGBsatu4Y67CL6AsYXlyrSiE8p2GBypK7GrRXYz27yZj+K200
	ahfmm9D7TZcLUrc2VDHcvP6L4qyk/+eJKgnOKrrgI+18jzvRZF7Eul3U1khhHy4XfUyt
	JKiRcIFppoPUkhEke73eahAHS7cd6dkO2X4XOQSvnW3hq5O+9TVVcVUHhW9x+E91c9Nh
	T0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MMWDv0uoopLviqWRqMrkPTByEkYY21bhkCQDH9w9D8M=;
	b=iW3LpLSHsuDzl5g9+1UHG6BqbZty6KNsVFZZ2M5jgAGdV2u2M07/2twJoJ06ogp0Wk
	TQLy2cq2WKrRjQEB4noC58WX05hTUjd/mOuxAv41IcWtccnaztTTQ9Lf9vZA75Axpi3n
	0hYLWGQ9iXUb0kWne6nCXvTM3aBt8KXFKRXlonuOVSLzpNJSfWjmEmsQQqTPMkosNuTJ
	OSCYHUaN5gVrhwUEQsyVRzBd+mBbyjx7Ha7G56jSY5nAQJLZjAsp++hORaX4uzTSmDdN
	aNXs/FVvrH5Rdw8LL1+lQxp0dwewgXyKedm0vWdlQ6EOtV+Gwumx9WNAzDNIcI0EsDOC
	fZ4g==
X-Gm-Message-State: APjAAAWsS2JX02FWEPCowHWJCRvpkp4fx07V05EP4Eob5bAYAVkyxRke
	z84AREeNFDi9K1zFO6j6+EFmhCcmVjg=
X-Google-Smtp-Source: APXvYqwpFSoLXoPQeOChcTFmxdmPwkUvoMaJEk7qQNObg0oaI0/DnblsF2segtEoj4MUvn0lFiCQxw==
X-Received: by 2002:a17:90a:d585:: with SMTP id v5mr400883pju.7.1569293401583; 
	Mon, 23 Sep 2019 19:50:01 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.50.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:50:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:07 -0700
Message-Id: <555b0642579c00c41bc3daab9cef08452f9834d5.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 27/50] patch: fix CVE-2019-13638
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
X-List-Received-Date: Tue, 24 Sep 2019 02:50:00 -0000

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


