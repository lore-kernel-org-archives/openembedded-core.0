Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5AC647FE02
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 20:26:41 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id u2so4279542wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 12:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VKBIs340bYIDQ4QN+JUUg8CV7+VJBTcerx7K+PhokAE=;
	b=YNXQRNKKPAO0fMI8R44dmZvhEDVtmGDn2ntiEwXxAPWEUMN2mxzRksFdNH1GzCp5Y7
	tCiepGkk5Rc6RiZk7NVzSBifqQUYFu5qVf7fkq7M5A3534hkQcQLsYsG0DBa0a2X6RJ6
	ogSuH30Qu/2ZeY6hjKkB6WSxyTT+HkFUliS8GptGzmA5W7xyrLvOyQFTbj34S1A71vP7
	RBiIhaLW+0yjR0A7YyBPZwB1LIu8HKCMvFUYRzvGaEZx7HGm9lL56Wfs8NVauj/LcSaD
	02xJLakgP6OE0GaFJuU1xHhgOBjjRuyQTndsOPn42WSHlBno5ChTA1GS4knmxnamDFx/
	AWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VKBIs340bYIDQ4QN+JUUg8CV7+VJBTcerx7K+PhokAE=;
	b=a7X/zOWPXtYZyxpmo/NaXouAxt8ksx5dqdbIakc+IX9RGFFrxpObEgI3vog5I5A/IW
	p3sWd8qcUihh1eb0nQ5VFUjNrbp2cIFZXsnWO+qs+vD8oEVUacjvH58NkBM2T+ypfrDh
	Mi7KIM8uPqP2ebDcSt9RYqiH0pFf5fRw9koY69MQZDvYjn60tJZ6Vc3nLlgOh2e+zVtU
	IfrLczqNPqam+PJyHNwCITjTqIDNUxzd6QJlrRfN3bT5t8wKUCMaI6ZwXUCzrUq0g4ep
	SEvwwPOSLQsnQVoBxX/tb64Dm57U8MCu/GNZtU+R+fURGtr7SZhz+TWYbB5mcgoHJKxM
	vEQg==
X-Gm-Message-State: APjAAAU7WQTsUJg5dmDUccWRjN4fodeBAgU8barSaq3Hzd+2QJRiBti7
	WZkoYQp1b4OPxIk0Wi2xxYHa/L0UVa4=
X-Google-Smtp-Source: APXvYqzBQ+1sxTpLukvllvm43zKRdiGdM5wXLBYS3D3uAsjiljizauJO/YzRR3DvY831PpuoojUbmg==
X-Received: by 2002:a1c:740b:: with SMTP id p11mr7174326wmc.78.1578601601766; 
	Thu, 09 Jan 2020 12:26:41 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0446528B12EBEBA10192C2.dip0.t-ipconnect.de.
	[2003:f0:7f04:4652:8b12:ebeb:a101:92c2])
	by smtp.gmail.com with ESMTPSA id z6sm9149986wrw.36.2020.01.09.12.26.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 12:26:41 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jan 2020 21:26:21 +0100
Message-Id: <20200109202623.28936-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200109202623.28936-1-schnitzeltony@gmail.com>
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/11] mime-xdg.bbclass: initial add
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
X-List-Received-Date: Thu, 09 Jan 2020 20:26:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When opening files by file-browsers on fresh images, user has to choose the
application to open from the pool af ALL known applications even those not
designed to open the file selected. By inheriting this classs in recipes the
assosiations in /usr/share/applications/mimeinfo.cache are build by calling
update-desktop-database.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/classes/mime-xdg.bbclass                 | 62 +++++++++++++++++++
 .../update_desktop_database                   |  8 +++
 2 files changed, 70 insertions(+)
 create mode 100644 meta/classes/mime-xdg.bbclass
 create mode 100644 scripts/postinst-intercepts/update_desktop_database

diff --git a/meta/classes/mime-xdg.bbclass b/meta/classes/mime-xdg.bbclass
new file mode 100644
index 0000000000..07194ce037
--- /dev/null
+++ b/meta/classes/mime-xdg.bbclass
@@ -0,0 +1,62 @@
+#
+# This class creates mime <-> application associations based on entry 
+# 'MimeType' in *.desktop files
+#
+
+DEPENDS += "desktop-file-utils"
+PACKAGE_WRITE_DEPS += "desktop-file-utils-native"
+
+mime_xdg_postinst() {
+if [ "x$D" != "x" ]; then
+	$INTERCEPT_DIR/postinst_intercept update_desktop_database ${PKG} \
+		mlprefix=${MLPREFIX} \
+		desktop_dir=${desktopdir}
+else
+	update-desktop-database $D${desktopdir}
+fi
+}
+
+mime_xdg_postrm() {
+if [ "x$D" != "x" ]; then
+	$INTERCEPT_DIR/postinst_intercept update_desktop_database ${PKG} \
+		mlprefix=${MLPREFIX} \
+		desktop_dir=${desktopdir}
+else
+	update-desktop-database $D${desktopdir}
+fi
+}
+
+python populate_packages_append () {
+    import re
+    packages = d.getVar('PACKAGES').split()
+    pkgdest =  d.getVar('PKGDEST')
+    desktop_base = d.getVar('desktopdir')
+
+    for pkg in packages:
+        desktop_dir = '%s/%s%s' % (pkgdest, pkg, desktop_base)
+        desktops_with_mime_found = False
+        if os.path.exists(desktop_dir):
+            for df in os.listdir(desktop_dir):
+                if df.endswith('.desktop'):
+                    with open(desktop_dir + '/'+ df, 'r') as f:
+                        for line in f.read().split('\n'):
+                            if 'MimeType' in line:
+                                desktops_with_mime_found = True
+                                break;
+                if desktops_with_mime_found:
+                    break
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


