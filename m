Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id AE2BB7FC47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:29:25 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id w15so24110160wru.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=xhAbkAFDM0aeF96naaVhHJsJVnQuPeK2S355pNETJ6g=;
	b=hckevWQH9p1UnHThgOZjpMvyED4ExdTMSjAuExEU9j7YLu3e40aLa3gCUi1RgdxrGE
	/rGKFUCsU7483FtM8P84Pkc+c5vz4x/8aoOkQW6G74RQhH53pzWvPEGChtMUU3Z2rVK/
	y8jSHmbqNxcCVne3tq3XBPumx/KG89LHKiTZP+QzQDpRngI1uRM5x6WtSwlyQ0XCMr86
	mYTq/L7wjScXLU5EZu0HXVnOhLGSugJuAQ6kFBzlc2lTilggmSZhENo/wIwHuqraXF5A
	j0gNrNWkXkwgkjXOgw9T2Mx5hoZoTylIidHrxouYas6dk+YyCTkSqIBN9mVimUDhJDJX
	Ak9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xhAbkAFDM0aeF96naaVhHJsJVnQuPeK2S355pNETJ6g=;
	b=EGSftug7r2KLIRoa3G+95G2SYaBiT4YN2P62xMB+n+idT6rylwvvMtZL2Cgk43jt74
	JuC5UIEXwFCieytJyLZgm7dUEkXH77yKEsSKG+dbpaknMxgR2ipzYQD5sMs/w1wR/DRt
	GDuFGbWUfw9+fgWc1ycsmsdxZ9tiUl9pLyA6rklRGF6GaWphTp6IQW4KBB/8THsBfbAf
	hXG5SIL7wJma2u2ScmwySm8ZJFuqGKdKZmBXXVdAp8nMBmxBDBYFLMaVoyGBImYRh1op
	t0BkcWeruaCAsbPGCZDdxeYrVUv+Uk7xPCzkSnVipVXk7+7udcGBUxbk9gvU8WPuvZmE
	8svw==
X-Gm-Message-State: APjAAAUxzajZqWHPR/SC/FE0VpyabIx2oAFQ4qN3pJfxIDOw6ExaoxLP
	lzXDltlFlaS0HvJwbbZ+9izqyaEwr0s=
X-Google-Smtp-Source: APXvYqxiRnXKO2sOHv3FqO3BQF5lCS14R9eFfrgP3Nx/e/YGAJLday0ZICOeBDUkN7Yhm6puy/4ugQ==
X-Received: by 2002:adf:ff84:: with SMTP id j4mr5208428wrr.27.1579296566124;
	Fri, 17 Jan 2020 13:29:26 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0BBB19EA1F5BE194E084E5.dip0.t-ipconnect.de.
	[2003:f0:7f0b:bb19:ea1f:5be1:94e0:84e5])
	by smtp.gmail.com with ESMTPSA id
	l7sm36094689wrq.61.2020.01.17.13.29.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:29:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 22:29:07 +0100
Message-Id: <20200117212908.32647-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200117212908.32647-1-schnitzeltony@gmail.com>
References: <20200117212908.32647-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 09/10] insane.bbclass: Spawn warning for missing mime-xdg in inherit
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
X-List-Received-Date: Fri, 17 Jan 2020 21:29:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If a package signals that it can open mime-types but does not inharit mime-xdg,
a warning is created.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/insane.bbclass | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a2d9318276..d6c60326db 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -28,7 +28,7 @@ WARN_QA ?= "ldflags useless-rpaths rpaths staticdev libdir xorg-driver-abi \
             pn-overrides infodir build-deps src-uri-bad \
             unknown-configure-option symlink-to-sysroot multilib \
             invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
-            mime \
+            mime mime-xdg \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -197,6 +197,35 @@ def package_qa_check_mime(path, name, d, elf, messages):
         package_qa_add_message(messages, "mime", "package contains mime types but does not inhert mime: %s path '%s'" % \
                  (name, package_qa_clean_path(path,d)))
 
+QAPATHTEST[mime-xdg] = "package_qa_check_mime_xdg"
+def package_qa_check_mime_xdg(path, name, d, elf, messages):
+    """
+    Check if package installs desktop file containing MimeType and requires
+    mime-types.bbclass to create /usr/share/applications/mimeinfo.cache
+    """
+
+    if d.getVar("datadir") + "/applications" in path and path.endswith('.desktop') and not bb.data.inherits_class("mime-xdg", d):
+        mime_type_found = False
+        try:
+            with open(path, 'r') as f:
+                for line in f.read().split('\n'):
+                    if 'MimeType' in line:
+                        mime_type_found = True
+                        break;
+        except:
+            # At least libreoffice installs symlinks with absolute paths that are dangling here.
+            # We could implement some magic but for few (one) recipes it is not worth the effort so just warn:
+            wstr = "%s cannot open %s - is it a symlink with absolute path?\n" % (name, package_qa_clean_path(path,d))
+            wstr += "Please check if (linked) file contains key 'MimeType'.\n"
+            pkgname = name
+            if name == d.getVar('PN'):
+                pkgname = '${PN}'
+            wstr += "If yes: add \'inhert mime-xdg\' and \'MIME_XDG_PACKAGES += \"%s\"\' / if no add \'INSANE_SKIP_%s += \"mime-xdg\"\' to recipe." % (pkgname, pkgname)
+            package_qa_add_message(messages, "mime-xdg", wstr)
+        if mime_type_found:
+            package_qa_add_message(messages, "mime-xdg", "package contains desktop file with key 'MimeType' but does not inhert mime-xdg: %s path '%s'" % \
+                    (name, package_qa_clean_path(path,d)))
+
 def package_qa_check_libdir(d):
     """
     Check for wrong library installation paths. For instance, catch
-- 
2.21.0


