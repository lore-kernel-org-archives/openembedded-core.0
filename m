Received: from mail-la0-f46.google.com ([209.85.215.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Ts0DE-0006mY-SB
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 01:05:09 +0100
Received: by mail-la0-f46.google.com with SMTP id fq13so13979488lab.33
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 15:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Xt/UxLaS3IR2cxB1iHpVSHnrheecC6jAHbda82/WUqo=;
	b=b1/IhHs+uRL3UJYH+iA2tQVbwRAhmepzUIFmnnnGsnc//yliwjpM03KKzD2pwSl8+g
	jRyxep1MkdEMw0B6X4sP0XDkAaYY74PWqdQo3OrGrpDbcCh+d+bGyUG6eZ9csj7wlq2Q
	8zMkqm623Wfht3IAz4w3PbpGzgMEe+Rs9YPf8SGPhLoNTeQ9v7DSbtStNSiKDz15VoNC
	s+M5KDpFBS2WsuyIz88SNvtUlo004eH1WLeNfhuWQEvHC4VKJCZVw1SZdwKweaeWRB7f
	KuoXf6ew7yWTBlX+8ixYwITXqhzkPV5jBT851KSnV+kgP+EXDGLC15rf8LheJU29bkTS
	sD6w==
X-Received: by 10.152.103.99 with SMTP id fv3mr55474237lab.16.1357516200247;
	Sun, 06 Jan 2013 15:50:00 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ns7sm20625553lab.5.2013.01.06.15.49.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 15:49:59 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TrzyQ-0001Pj-LR; Mon, 07 Jan 2013 01:49:50 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 01:49:33 +0200
Message-Id: <1357516181-5358-8-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357516181-5358-7-git-send-email-cazfi74@gmail.com>
References: <1357516181-5358-1-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-2-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-3-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-4-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-5-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-6-git-send-email-cazfi74@gmail.com>
	<1357516181-5358-7-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v2 07/15] libx11: disable tests
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 00:05:09 -0000

Use of $(srcdir) in TESTS is an error causing automake-1.13
to abort. Disable the tests completely.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../xorg-lib/libx11/disable_tests.patch               |   17 +++++++++++++++++
 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb        |    6 ++++--
 2 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch b/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
new file mode 100644
index 0000000..8f5e531
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Inappropriate
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd libX11-1.5.0/nls/Makefile.am libX11-1.5.0/nls/Makefile.am
+--- libX11-1.5.0/nls/Makefile.am	2012-06-02 09:37:18.000000000 +0300
++++ libX11-1.5.0/nls/Makefile.am	2013-01-02 16:10:24.960156131 +0200
+@@ -36,11 +36,6 @@
+         < locale.dir.l1 > locale.dir.l2
+	cat locale.dir.l2 locale.dir.l1 > locale.dir
+
+-if HAVE_PERL
+-TESTS_ENVIRONMENT = $(PERL)
+-TESTS = $(srcdir)/compose-check.pl
+-endif HAVE_PERL
+-
+
+ # Per-locale data files
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
index 94e2051..7f18824 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
@@ -1,11 +1,13 @@
 require libx11.inc
 inherit gettext
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI += "file://keysymdef_include.patch"
+SRC_URI += "file://keysymdef_include.patch \
+            file://disable_tests.patch \
+           "
 
 SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
 SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
-- 
1.7.10.4



