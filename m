Received: from mail-la0-f54.google.com ([209.85.215.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TqrlQ-0000dM-5c
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 21:51:45 +0100
Received: by mail-la0-f54.google.com with SMTP id fp12so8637492lab.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 12:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Lo9HJHs779z1hUexDCQRJPntvq9Bz3xyECPzf5mlFX8=;
	b=qe6t5nYy7nxuIiNbq1zrYdyW1I3dSiIgxkOPCvCK1OAUNx9qmk1B+KkE83sZYyIkih
	YKF66j+ciV0/ma4ybCBSSbrj+abzt0bv3YsXi8qUHxDqCjWqN+V2peh9mKsuaEyroNis
	Qb8sHMZXF1LvrEvcReOSITr9cJacDBPW5HxxwdhR5QcfMjkFMMawyX0xT9VAw19XVubi
	8n2C3Pp2cjSrPjEHmdxCqsJid2AFqFO9yMy+54C36DLAjRS4ZBdZJCFdZfZoRlvS5ya6
	KFIdInuGFqH/qkMcKUWGP36wc32X7uRtCfP5tCvqTiICsF92A2bZnMT6xCbfHNznJyzE
	EsZg==
X-Received: by 10.112.43.161 with SMTP id x1mr20688885lbl.32.1357245399830;
	Thu, 03 Jan 2013 12:36:39 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id ne2sm18772408lab.10.2013.01.03.12.36.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 12:36:38 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TqrWk-0002Eg-MT; Thu, 03 Jan 2013 22:36:34 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2013 22:36:23 +0200
Message-Id: <1357245391-11055-8-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357245391-11055-7-git-send-email-cazfi74@gmail.com>
References: <1357245391-11055-1-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-2-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-3-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-4-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-5-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-6-git-send-email-cazfi74@gmail.com>
	<1357245391-11055-7-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 07/15] libx11: disable tests
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
X-List-Received-Date: Thu, 03 Jan 2013 20:51:45 -0000

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
index 0000000..ec61751
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/disable_tests.patch
@@ -0,0 +1,17 @@
+Upstream-status: Not sent
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



