Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 25B927F2E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 03:13:45 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id y22so323031pfr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 20:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rt2SCBf0H15IXZGSRQCub2CO44IpUy4N2eOTP4iX5RY=;
	b=Ghv/d8rDyp/Oqe04nSAeqndwOp7LMz+WDp0w2T15DpB6WoOhKmnNRmMc2h2O4rhNQj
	WD4wEjfUZNFWOkL+KG5Qd2Cw1OM8GNlLKgdWUdInW+iPo2Szm1jQKcA6yedJgD/3pXmC
	GACId4IANVCV+vy2E+etSbuNJp43TlRk0S4bwNC2VHz2ZtKmdJ68u+UbQX2QVBiWLI6D
	cpQOEUKtdNAZuOIPWisNWG5lAv6ixOJTyvubBiLriOXkE/Ofg4MFgjUOtkb22KFPxVPV
	Lg77Bd9WYKnR56O2TYfyjqEq01aoD5aGjKNUVanzmXAqiBaJOilJ96aezFZoxr/8g6LI
	DWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rt2SCBf0H15IXZGSRQCub2CO44IpUy4N2eOTP4iX5RY=;
	b=aduyRHfBqncM0tpf3VvyBTifwr+nx/jR1K4Ea1B4I2lCXsk40MF97AlHLdrP7x2aFv
	pQ2aUBEvajU6qAcE5f1g1f1Dx6QR4sVxTrvsNUC/RtXsqk3/jjJKjK6UQw3X8Q8C4JJT
	83n5HyK8oxtikqfxJ4A+TL4Ra9Yz/wSatN+7uXuospuGjP/z4CL3LH57VYooFIs0bG5K
	dhwQ2taiaC0M1uMPAtlKofqqF0FfVCwhsFZgf4nTvFLfvXvH5QLnCOs1c24cQr6hMFgd
	+65fWtm9FHK3p8yFS1SOukh+C5y1ZP8D4841GtdS97B92vRya7z8GfBf77qdCtt33Kbs
	NndQ==
X-Gm-Message-State: APjAAAVReyQy4d6/XfdtXoBHHDB7+3OGYBTwezRlDwkoOcvXhRcPFQDQ
	VyJF9kq2dsNi0bt3DJAz3AWbOnfdL20=
X-Google-Smtp-Source: APXvYqwm8F8dJaJ2gU28ySHVKNIM5Yiux2neXqRV67vlyEKLjvjF6xbTWnE9zNfIQDuWIAf9lAeQJw==
X-Received: by 2002:a62:870a:: with SMTP id i10mr757219pfe.259.1569294826138; 
	Mon, 23 Sep 2019 20:13:46 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id z23sm252602pgi.78.2019.09.23.20.13.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 20:13:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 20:13:18 -0700
Message-Id: <0ff891cf83ba2396ff40133383ffee2c10fdc550.1569294712.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569294712.git.akuster808@gmail.com>
References: <cover.1569294712.git.akuster808@gmail.com>
Subject: [Thud][ 22/24] patch: backport fixes
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
X-List-Received-Date: Tue, 24 Sep 2019 03:13:45 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

The original fix for CVE-2018-1000156 was incomplete. Backport more
fixes done later for a complete fix.

Also see:
https://savannah.gnu.org/bugs/index.php?53820

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 12f9689cba740da6b8c7d9292c74c3992c2e18f2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...k-temporary-file-on-failed-ed-style-patch.patch | 93 ++++++++++++++++++++++
 ...ak-temporary-file-on-failed-multi-file-ed.patch | 80 +++++++++++++++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb         |  2 +
 3 files changed, 175 insertions(+)
 create mode 100644 meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch
 create mode 100644 meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch

diff --git a/meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch b/meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch
new file mode 100644
index 0000000..9891526
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch
@@ -0,0 +1,93 @@
+From 7f770b9c20da1a192dad8cb572a6391f2773285a Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Thu, 3 May 2018 14:31:55 +0200
+Subject: [PATCH 1/2] Don't leak temporary file on failed ed-style patch
+
+Now that we write ed-style patches to a temporary file before we
+apply them, we need to ensure that the temporary file is removed
+before we leave, even on fatal error.
+
+* src/pch.c (do_ed_script): Use global TMPEDNAME instead of local
+  tmpname. Don't unlink the file directly, instead tag it for removal
+  at exit time.
+* src/patch.c (cleanup): Unlink TMPEDNAME at exit.
+
+This closes bug #53820:
+https://savannah.gnu.org/bugs/index.php?53820
+
+Fixes: 123eaff0d5d1 ("Fix arbitrary command execution in ed-style patches (CVE-2018-1000156)")
+
+Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/patch.git/commit/?id=19599883ffb6a450d2884f081f8ecf68edbed7ee]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ src/common.h |  2 ++
+ src/pch.c    | 12 +++++-------
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/common.h b/src/common.h
+index ec50b40..22238b5 100644
+--- a/src/common.h
++++ b/src/common.h
+@@ -94,10 +94,12 @@ XTERN char const *origsuff;
+ XTERN char const * TMPINNAME;
+ XTERN char const * TMPOUTNAME;
+ XTERN char const * TMPPATNAME;
++XTERN char const * TMPEDNAME;
+ 
+ XTERN bool TMPINNAME_needs_removal;
+ XTERN bool TMPOUTNAME_needs_removal;
+ XTERN bool TMPPATNAME_needs_removal;
++XTERN bool TMPEDNAME_needs_removal;
+ 
+ #ifdef DEBUGGING
+ XTERN int debug;
+diff --git a/src/pch.c b/src/pch.c
+index 16e001a..c1a62cf 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -2392,7 +2392,6 @@ do_ed_script (char const *inname, char const *outname,
+     file_offset beginning_of_this_line;
+     size_t chars_read;
+     FILE *tmpfp = 0;
+-    char const *tmpname;
+     int tmpfd;
+     pid_t pid;
+ 
+@@ -2404,12 +2403,13 @@ do_ed_script (char const *inname, char const *outname,
+ 	   invalid commands and treats the next line as a new command, which
+ 	   can lead to arbitrary command execution.  */
+ 
+-	tmpfd = make_tempfile (&tmpname, 'e', NULL, O_RDWR | O_BINARY, 0);
++	tmpfd = make_tempfile (&TMPEDNAME, 'e', NULL, O_RDWR | O_BINARY, 0);
+ 	if (tmpfd == -1)
+-	  pfatal ("Can't create temporary file %s", quotearg (tmpname));
++        pfatal ("Can't create temporary file %s", quotearg (TMPEDNAME));
++        TMPEDNAME_needs_removal = true;
+ 	tmpfp = fdopen (tmpfd, "w+b");
+ 	if (! tmpfp)
+-	  pfatal ("Can't open stream for file %s", quotearg (tmpname));
++        pfatal ("Can't open stream for file %s", quotearg (TMPEDNAME));
+       }
+ 
+     for (;;) {
+@@ -2449,8 +2449,7 @@ do_ed_script (char const *inname, char const *outname,
+       write_fatal ();
+ 
+     if (lseek (tmpfd, 0, SEEK_SET) == -1)
+-      pfatal ("Can't rewind to the beginning of file %s", quotearg (tmpname));
+-
++        pfatal ("Can't rewind to the beginning of file %s", quotearg (TMPEDNAME));
+     if (! dry_run && ! skip_rest_of_patch) {
+ 	int exclusive = *outname_needs_removal ? 0 : O_EXCL;
+ 	*outname_needs_removal = true;
+@@ -2482,7 +2481,6 @@ do_ed_script (char const *inname, char const *outname,
+     }
+ 
+     fclose (tmpfp);
+-    safe_unlink (tmpname);
+ 
+     if (ofp)
+       {
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch b/meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch
new file mode 100644
index 0000000..d6a219a
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch
@@ -0,0 +1,80 @@
+From 369dcccdfa6336e5a873d6d63705cfbe04c55727 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Mon, 7 May 2018 15:14:45 +0200
+Subject: Don't leak temporary file on failed multi-file ed-style patch
+
+The previous fix worked fine with single-file ed-style patches, but
+would still leak temporary files in the case of multi-file ed-style
+patch. Fix that case as well, and extend the test case to check for
+it.
+
+* src/patch.c (main): Unlink TMPEDNAME if needed before moving to
+  the next file in a patch.
+
+This closes bug #53820:
+https://savannah.gnu.org/bugs/index.php?53820
+
+Fixes: 123eaff0d5d1 ("Fix arbitrary command execution in ed-style patches (CVE-2018-1000156)")
+Fixes: 19599883ffb6 ("Don't leak temporary file on failed ed-style patch")
+
+Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/patch.git/commit/?id=369dcccdfa6336e5a873d6d63705cfbe04c55727]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ src/patch.c    |  1 +
+ tests/ed-style | 31 +++++++++++++++++++++++++++++++
+ 2 files changed, 32 insertions(+)
+
+diff --git a/src/patch.c b/src/patch.c
+index 9146597..81c7a02 100644
+--- a/src/patch.c
++++ b/src/patch.c
+@@ -236,6 +236,7 @@ main (int argc, char **argv)
+ 	    }
+ 	  remove_if_needed (TMPOUTNAME, &TMPOUTNAME_needs_removal);
+ 	}
++      remove_if_needed (TMPEDNAME, &TMPEDNAME_needs_removal);
+ 
+       if (! skip_rest_of_patch && ! file_type)
+ 	{
+diff --git a/tests/ed-style b/tests/ed-style
+index 6b6ef9d..504e6e5 100644
+--- a/tests/ed-style
++++ b/tests/ed-style
+@@ -38,3 +38,34 @@ EOF
+ check 'cat foo' <<EOF
+ foo
+ EOF
++
++# Test the case where one ed-style patch modifies several files
++
++cat > ed3.diff <<EOF
++--- foo
+++++ foo
++1c
++bar
++.
++--- baz
+++++ baz
++0a
++baz
++.
++EOF
++
++# Apparently we can't create a file with such a patch, while it works fine
++# when the file name is provided on the command line
++cat > baz <<EOF
++EOF
++
++check 'patch -e -i ed3.diff' <<EOF
++EOF
++
++check 'cat foo' <<EOF
++bar
++EOF
++
++check 'cat baz' <<EOF
++baz
++EOF
+-- 
+cgit v1.0-41-gc330
+
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
index 8908910..5d7f55f 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -8,6 +8,8 @@ SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
             file://0001-Fix-swapping-fake-lines-in-pch_swap.patch \
             file://CVE-2019-13636.patch \
             file://0001-Invoke-ed-directly-instead-of-using-the-shell.patch \
+            file://0001-Don-t-leak-temporary-file-on-failed-ed-style-patch.patch \
+            file://0001-Don-t-leak-temporary-file-on-failed-multi-file-ed.patch \
 "
 
 SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"
-- 
2.7.4


