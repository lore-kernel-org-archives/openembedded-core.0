Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id B04437FC4A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:29:24 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id z3so24073483wru.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=jySuSKdmAOsvlG8FjL1vtFovaXQQzRyMlSNDGcU8jt4=;
	b=tfV2x4u6rxzOC5wtrlSe42IyLmpg8LQQUCa6i9znRAL2h07yK0h/hc3vz6H9Tr9+N/
	VIf7wuRbSGpNxZLhLLGJ8LqE/E/hbV3MjuSZejUKYLI7EsPwaSqwkxyVK/T96c7kVUnd
	MCEzsINUwyXiQc53Ycsq93Htlv7ubUgO01gdd4geyRAmqWZcrYWB7PqVMI8W/BsZ1gIN
	ZayZZ0kBBgWYXcZCHxbnhzi248BrQmS7LkU7Jkci894qMnaorbjM7pyACpJldbxOe/4G
	61D6L3VnpHv3bnnZ5fDyiN0RSuTqFJCMyK9xEvCrLE8jTkwqjuUaf6+KolaG1eRw/YyI
	cGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jySuSKdmAOsvlG8FjL1vtFovaXQQzRyMlSNDGcU8jt4=;
	b=JPm1IQjeGuVCH948zAy5rKjyj5jsyi1nDKFQeOXJh3fEPn+mCqxxjDa9XcfPj+VZBI
	VFnXlfwFXf9Jq9VFTfnW5fgT1/47qPQYyBkP7dL/V/39/j4rzdjYMDSN+Ts6NVe+ao+s
	PsChxHgsC+v0tB/LOvE8CBlZY+9GPrViM9ef8EQqvO4SA6DKFLCWc2HnfLHWe+3U/Qfb
	LxQYQHeLrajbHeiVlMgU2OGwI8HGpg71uaXMRG0Bv1S7YCSKpzcmObmov1FWrEuO+9v+
	D8HJW1hI4M89N5jZeBZioO2cVsYBVis5wmRSLDWVz7UncJgFLmlUYL0w3NtQVcXQky/K
	HEOg==
X-Gm-Message-State: APjAAAXTs+WNAj0hShSEW7Erk7vox8A/25IKOLisV9cGOtvPEf+SW1UV
	iNp6mIgErv2KFW+O+l3lWGbydDoD1WI=
X-Google-Smtp-Source: APXvYqw9LS4u+J9AQ2Z78Fpa/H0bNuZ3+YXdGJ9Afy+rU8jY+NGoq5Y0HYWz3BJxYbf6TtX8pH4HiA==
X-Received: by 2002:a5d:6406:: with SMTP id z6mr5154892wru.294.1579296565206; 
	Fri, 17 Jan 2020 13:29:25 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0BBB19EA1F5BE194E084E5.dip0.t-ipconnect.de.
	[2003:f0:7f0b:bb19:ea1f:5be1:94e0:84e5])
	by smtp.gmail.com with ESMTPSA id
	l7sm36094689wrq.61.2020.01.17.13.29.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:29:24 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 22:29:06 +0100
Message-Id: <20200117212908.32647-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200117212908.32647-1-schnitzeltony@gmail.com>
References: <20200117212908.32647-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 08/10] mime-xdg.bbclass: initial add
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
X-List-Received-Date: Fri, 17 Jan 2020 21:29:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When opening files by file-browsers on fresh images, user has to choose the
application to open from the pool af ALL known applications even those not
designed to open the file selected. By inheriting this classs in recipes the
assosiations in /usr/share/applications/mimeinfo.cache are build by calling
update-desktop-database.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/mime-xdg.bbclass                 | 74 +++++++++++++++++++
 .../update_desktop_database                   |  8 ++
 2 files changed, 82 insertions(+)
 create mode 100644 meta/classes/mime-xdg.bbclass
 create mode 100644 scripts/postinst-intercepts/update_desktop_database

diff --git a/meta/classes/mime-xdg.bbclass b/meta/classes/mime-xdg.bbclass
new file mode 100644
index 0000000000..63169e990d
--- /dev/null
+++ b/meta/classes/mime-xdg.bbclass
@@ -0,0 +1,74 @@
+#
+# This class creates mime <-> application associations based on entry 
+# 'MimeType' in *.desktop files
+#
+
+DEPENDS += "desktop-file-utils"
+PACKAGE_WRITE_DEPS += "desktop-file-utils-native"
+DESKTOPDIR = "${datadir}/applications"
+
+# There are recipes out there installing their .desktop files as absolute
+# symlinks. For us these are dangling and cannot be introspected for "MymeType"
+# easily. By addding package-names to MIME_XDG_PACKAGES, packager can force
+# proper update-desktop-database handling. Note that all introspection is
+# skipped for MIME_XDG_PACKAGES not empty
+MIME_XDG_PACKAGES ?= ""
+
+mime_xdg_postinst() {
+if [ "x$D" != "x" ]; then
+	$INTERCEPT_DIR/postinst_intercept update_desktop_database ${PKG} \
+		mlprefix=${MLPREFIX} \
+		desktop_dir=${DESKTOPDIR}
+else
+	update-desktop-database $D${DESKTOPDIR}
+fi
+}
+
+mime_xdg_postrm() {
+if [ "x$D" != "x" ]; then
+	$INTERCEPT_DIR/postinst_intercept update_desktop_database ${PKG} \
+		mlprefix=${MLPREFIX} \
+		desktop_dir=${DESKTOPDIR}
+else
+	update-desktop-database $D${DESKTOPDIR}
+fi
+}
+
+python populate_packages_append () {
+    packages = d.getVar('PACKAGES').split()
+    pkgdest =  d.getVar('PKGDEST')
+    desktop_base = d.getVar('DESKTOPDIR')
+    forced_mime_xdg_pkgs = (d.getVar('MIME_XDG_PACKAGES') or '').split()
+
+    for pkg in packages:
+        desktops_with_mime_found = pkg in forced_mime_xdg_pkgs
+        if d.getVar('MIME_XDG_PACKAGES') == '':
+            desktop_dir = '%s/%s%s' % (pkgdest, pkg, desktop_base)
+            if os.path.exists(desktop_dir):
+                for df in os.listdir(desktop_dir):
+                    if df.endswith('.desktop'):
+                        try:
+                            with open(desktop_dir + '/'+ df, 'r') as f:
+                                for line in f.read().split('\n'):
+                                    if 'MimeType' in line:
+                                        desktops_with_mime_found = True
+                                        break;
+                        except:
+                            bb.warn('Could not open %s. Set MIME_XDG_PACKAGES in recipe or add mime-xdg to INSANE_SKIP.' % desktop_dir + '/'+ df)
+                    if desktops_with_mime_found:
+                        break
+        if desktops_with_mime_found:
+            bb.note("adding mime-xdg postinst and postrm scripts to %s" % pkg)
+            postinst = d.getVar('pkg_postinst_%s' % pkg)
+            if not postinst:
+                postinst = '#!/bin/sh\n'
+            postinst += d.getVar('mime_xdg_postinst')
+            d.setVar('pkg_postinst_%s' % pkg, postinst)
+            postrm = d.getVar('pkg_postrm_%s' % pkg)
+            if not postrm:
+                postrm = '#!/bin/sh\n'
+            postrm += d.getVar('mime_xdg_postrm')
+            d.setVar('pkg_postrm_%s' % pkg, postrm)
+            bb.note("adding desktop-file-utils dependency to %s" % pkg)
+            d.appendVar('RDEPENDS_' + pkg, " " + d.getVar('MLPREFIX')+"desktop-file-utils")
+}
diff --git a/scripts/postinst-intercepts/update_desktop_database b/scripts/postinst-intercepts/update_desktop_database
new file mode 100644
index 0000000000..8903b496f3
--- /dev/null
+++ b/scripts/postinst-intercepts/update_desktop_database
@@ -0,0 +1,8 @@
+#!/bin/sh
+#
+# SPDX-License-Identifier: MIT
+#
+# Post-install intercept for mime-xdg.bbclass
+
+update-desktop-database $D${desktop_dir}
+
-- 
2.21.0


