Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id C0B2C7714F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 13:27:23 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id r129so117823658wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 05:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wnnnTZqEmN7UezgQllvcyeaagBvXmToGTdxb3hFj/yg=;
	b=nydMe7DbAeSI71LJkdutCk/LxvlFure4j59fihgfple7ad7cEhornaKjgS+LhzdCoh
	Ot9m8qcYvPJSZg9aWPtLSWHLS80pAl74AZnCB5QMIfIHRNbq/+p6Fs1cR41pT+oEt2u8
	2wTSsUabmGw6BKQmcNZj+Sq1dU1wW38SKh2DLSCGqyBPKG9Syva5yGnk8frqDxfUUndq
	UOzc1RMgaGtNf/AIt2G+Brgtwm/9IZpnR8EgkFEOwmI0ju31Ed3jDYUFO1E3HhJE3Azl
	7s7g+C1SxYC/ky5pdbpCIwsiLeDIB4T3vOZ9bMKYd9AkDAF35NLrmw6euneAtv6IXgsj
	d8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wnnnTZqEmN7UezgQllvcyeaagBvXmToGTdxb3hFj/yg=;
	b=XoPdOJbWEihvHiJIwiNWmOI1CoyPT7pfexTn+rVhbDChl+lawm6qkf4J1qRJV8fCHk
	XRzIpxLeUmCW4LjMW+FtO5Z4b5AcijSOXqh/Y4xU3EOA+nBJj26W51wFzgm2lkEO+yKo
	reazvXImBkcga1JSVJ0N+XhKTtQTuCqA8UXL2cnRzzEbOkhiXBDQYY99+ea+U3Kuz19a
	sJ8rM/a1MLqYOuzTcIdlH3MRH9433Fi5H4i6XzJf7NmnzVpRk66Ap4Lm4j3QWzjdDIeZ
	C/ZYYgpQSrHVb5o+cg8ARlBb+E9nXXks/hm2Txg1xcn3M17IMhFpW9mN8uQSWDzr/acC
	+8ng==
X-Gm-Message-State: AG10YOQogP4xay0XefDj/BQ1XKMltPll73kXB5/p6K4r6TGbdnUMMSlh9nrIfRffu6wS8Tmq
X-Received: by 10.194.133.164 with SMTP id pd4mr34045808wjb.133.1454419643831; 
	Tue, 02 Feb 2016 05:27:23 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l67sm16433764wmf.11.2016.02.02.05.27.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 05:27:23 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 13:27:15 +0000
Message-Id: <1454419635-10822-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454419635-10822-1-git-send-email-ross.burton@intel.com>
References: <1454419635-10822-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 5/5] insane: add test for -dev packaging containing real libraries
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
X-List-Received-Date: Tue, 02 Feb 2016 13:27:26 -0000

PN-dev packages should generally contain the link-time symlinks from libfoo.so
to the real libraries.  If a recipe installs a real library named libfoo.so
there's a very good chance that it's a loadable module and should be in another
package.

(From OE-Core rev: 1fe7e025e3b8530456feacb5cc3b60b3b878ada3)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 500a37c..c70e887 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -38,7 +38,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
             split-strip packages-list pkgv-undefined var-undefined \
             version-going-backwards expanded-d invalid-chars \
-            license-checksum \
+            license-checksum dev-elf \
             "
 FAKEROOT_QA = "host-user-contaminated"
 FAKEROOT_QA[doc] = "QA tests which need to run under fakeroot. If any \
@@ -275,6 +275,17 @@ def package_qa_check_dev(path, name, d, elf, messages):
         package_qa_add_message(messages, "dev-so", "non -dev/-dbg/nativesdk- package contains symlink .so: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d)))
 
+QAPATHTEST[dev-elf] = "package_qa_check_dev_elf"
+def package_qa_check_dev_elf(path, name, d, elf, messages):
+    """
+    Check that -dev doesn't contain real shared libraries.  The test has to
+    check that the file is not a link and is an ELF object as some recipes
+    install link-time .so files that are linker scripts.
+    """
+    if name.endswith("-dev") and path.endswith(".so") and not os.path.islink(path) and elf:
+        package_qa_add_message(messages, "dev-elf", "-dev package contains non-symlink .so: %s path '%s'" % \
+                 (name, package_qa_clean_path(path,d)))
+
 QAPATHTEST[staticdev] = "package_qa_check_staticdev"
 def package_qa_check_staticdev(path, name, d, elf, messages):
     """
-- 
2.6.4


