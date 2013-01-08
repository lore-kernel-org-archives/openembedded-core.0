Received: from mail-la0-f43.google.com ([209.85.215.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsTfG-0000qj-3N
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 08:32:05 +0100
Received: by mail-la0-f43.google.com with SMTP id eg20so100816lab.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 23:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=3ZccrjeP6fad/M2lg7IVZUTv/j3RGkByf3N8gXRqWME=;
	b=timN0vgzzUVis6R9MCxD6Yyecrmnt/3s8hiA+FQBkb1X6xvSm/aGhhYP2DeZR50SWf
	yX7noImqeR6UzdubwYPgL5qxN0LoVhEZhH0fp5gdiq8C5/33ftDEHWhEyOOseLnwyLtK
	ama7wTvwA3x7IMejXMU64FcUympByQlYin71YNfwt69m9xA85T3bDm9adLQA0nJJqiIv
	0sVrhTnqg8SJ9dkn/BpdjW0t4B3dZgtXnV6ixFBR4NlzNP1bx8UlD+ZjcudbYyOnVoC2
	svcRlqNcmXY9157XEkjddcRIAYHDsk910hba30+pP3oRz83ddhCVtjNipIO0/VXNad0r
	aGLw==
X-Received: by 10.152.108.172 with SMTP id hl12mr60448075lab.32.1357629411889; 
	Mon, 07 Jan 2013 23:16:51 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id
	ew10sm22113004lbb.10.2013.01.07.23.16.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 23:16:48 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TsTQU-0005kS-KI; Tue, 08 Jan 2013 09:16:46 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 09:16:37 +0200
Message-Id: <1357629404-22020-6-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357629404-22020-5-git-send-email-cazfi74@gmail.com>
References: <1357629404-22020-1-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-2-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-3-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-4-git-send-email-cazfi74@gmail.com>
	<1357629404-22020-5-git-send-email-cazfi74@gmail.com>
Subject: [PATCH v3 05/12] libx11: disable tests
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
X-List-Received-Date: Tue, 08 Jan 2013 07:32:16 -0000

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
index 0000000..c570e45
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Inappropriate [disable feature]
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



