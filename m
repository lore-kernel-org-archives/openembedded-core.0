Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 41B4C6C489
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 15:17:48 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s11so2659043wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 07:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ghWdPGGsiMTdG1t9ORnVD2v47R7kwDUE182Ezr6Rj04=;
	b=b37SaTF3+01mZyivDZEXXdSzJDyWZ4qhIzfaNkW5eVJQNQl55MOgYhiVhPV62UMS2i
	FU2E255TbjAsVt9+u2JmSkH3E81Axac4zD2sKY4EjPG/YQhHATIqgRS3rU7VcR4gRa8K
	xfuH3H3jA0bdKOq0/jMrhA9WK46lVE/Ziz5Puz4cpmCeke7CRW9VdK4jM/YjEJQBGd5Y
	ebVl5dQNG9A4BFFq4HaJ+JsiduLwX+g2FsH99vR1Z10YcyJZLkk4i/fNePuW6BVz3Z12
	v9MBnJ1394W5JI/rqfc7kbf5hsBPoeKTW8CKLQAPYZTPMjRGdGYZE2ytnzAT5K9wcYOd
	bMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ghWdPGGsiMTdG1t9ORnVD2v47R7kwDUE182Ezr6Rj04=;
	b=YWKqk9BlDWetSEYdXpywWDsyjAgkPfKJmeZnjYmJkZRs5A/2NLnzrYcIsmgipZDCS9
	kJ1tr3QZaVHxdK9J2g6+lTO5IpV126aJa0iYysdCBVzupYDr73Ya+XV2vP24eGmT+P41
	RZd61dKuEAqlOKvTazIL5QYy3WRE4YiMdT3GNftINaXPY8a59G7FJplaDlhuv6p8iSl1
	klIIjXjG16O4XQEaC3LoWiUAXvgfFqZIVPPEYH8Lhor2CWW7eiQaOn8321992Jz06ymK
	tYn2qkEdeWOFgCpms2xk3xAEP1doXaZcLIkWfT+6Y3zhTqKQz3Qf7GDtxxzer4w0twJv
	/+qA==
X-Gm-Message-State: AGRZ1gLAwS06uYb7RN/eZOBPns1+myuv1l3FVyJvwQx2yqHWZCdAS194
	BxYYvsR3vfDVapcs151mbj+lfXLur/c=
X-Google-Smtp-Source: AJdET5etH+Bk4IL01EmZiandd3u7N45vVNaaOzyKwmAG6nxObK/+xFcmJ+ErAqJLO5fAu/DJW47oYA==
X-Received: by 2002:a1c:e701:: with SMTP id e1mr2471007wmh.21.1542727068623;
	Tue, 20 Nov 2018 07:17:48 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id z83sm9147518wmc.7.2018.11.20.07.17.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 07:17:47 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 15:17:45 +0000
Message-Id: <20181120151745.13553-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] json-glib: add ptest
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
X-List-Received-Date: Tue, 20 Nov 2018 15:17:48 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/json-glib/json-glib/run-ptest |  3 +++
 meta/recipes-gnome/json-glib/json-glib_1.4.2.bb  | 12 +++++++-----
 2 files changed, 10 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-gnome/json-glib/json-glib/run-ptest

diff --git a/meta/recipes-gnome/json-glib/json-glib/run-ptest b/meta/recipes-gnome/json-glib/json-glib/run-ptest
new file mode 100644
index 00000000000..0c6398a177d
--- /dev/null
+++ b/meta/recipes-gnome/json-glib/json-glib/run-ptest
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+gnome-desktop-testing-runner json-glib
diff --git a/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb b/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
index 19fe3cc4427..b4a6a6f2b63 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.4.2.bb
@@ -10,12 +10,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 DEPENDS = "glib-2.0"
 
+GNOMEBASEBUILDCLASS = "meson"
+inherit gnomebase lib_package gobject-introspection gtk-doc gettext ptest-gnome
+
+SRC_URI += "file://run-ptest"
 SRC_URI[archive.md5sum] = "35107e23a7bbbc70f31c34f7b9adf1c3"
 SRC_URI[archive.sha256sum] = "2d7709a44749c7318599a6829322e081915bdc73f5be5045882ed120bb686dc8"
 
-GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase lib_package gobject-introspection gtk-doc gettext
-
 # This builds both API docs (via gtk-doc) and manpages
 GTKDOC_ENABLE_FLAG = "-Ddocs=true"
 GTKDOC_DISABLE_FLAG = "-Ddocs=false"
@@ -29,8 +30,9 @@ EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'T
                                                                                     '${GI_DISABLE_FLAG}', d)} "
 
 do_install_append() {
-    # FIXME: these need to be provided via ptest
-    rm -rf ${D}${datadir}/installed-tests ${D}${libexecdir}
+	if ! ${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}; then
+		rm -rf ${D}${datadir}/installed-tests ${D}${libexecdir}
+	fi
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


