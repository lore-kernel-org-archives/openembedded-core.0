Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6326.1795182837376713429
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:53:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DdICw9uj;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso7219025e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 05:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182836; x=1795787636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v8pbqMvWDNioJB4Ic6GYugair7N4FYILDOpwzxqIKn0=;
        b=DdICw9ujh5idArPXCYmV/UJ47cu5OMb/UyqhaQ2GjtFbJcgw4igtOyOTePLxhgvLWD
         VABIcDMkbiJdbntyu/xztOmwWIUFMA7x3dbz//mcNvM2NGu1zae0iVTZ2HERhKPGLgFg
         wD0YzvCT6ObcjYqANlnm0rNSi4hKrp6YtO5U2PrS63FYGpfKljPLaSXYbQegZgPdaFrR
         yEc86x8dSwDLYW059MN0A6lBrQ28S5CoBii/pBBrkb+kJ9KNY2kJUVYBMhPNIHqxrmhv
         pG6EiohqwnqXGaHLVcOxceH20Sh3/uGxOezk4XrpNqDJTuvWpDRvWDcQ2haOQgZlXLjz
         PZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182836; x=1795787636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v8pbqMvWDNioJB4Ic6GYugair7N4FYILDOpwzxqIKn0=;
        b=xVvDkGYK8DEvwBTnIHeySief8k3sMWIxYySxQjBXR+/6aZA2jFPD88dcSb947oEl4L
         DVJUjAiXYdlm/8AGb7HUA+Hl50MlMxExdB+CS2ONH0I1mxjQKaJvCPMWyod2QMjoSqK7
         ymyiuY2l3br6TirmcfN3xkM0A1JLGfQVS/ogKN8Z+B4RE6++GCKUn8aMH0dPR80DNx3s
         /7YRajcVG7w8hdPce9aMTVMNNdgMbun6D5fuVi/QAzse2e2yCuRqON+pD2/yM4TrVaAV
         Kq0cJ/jYg5rK7YiDrV1ItfHA2sISuAOCi3trXCHYRPqWKBTqteGM2vvRDj+KQexfYgAG
         iu0A==
X-Gm-Message-State: APuU4Z+Mdf2wsDv3w1+/ZglNdWqIm3z3xwAp7FtwBANM4kztPIe33ZIS
	tqxK9R5QMJa+kiJbppi6GzbGoN4ZqglL6g4h9Iv5BFPZxCIY0RR7wy2WK2h/QySp
X-Gm-Gg: AYBFou0xomC3AfaBo1yaNacAba8aC6A7A1+k2uxPNiXNgxpq0DNW0BBxIlNRPvv86vp
	oPQJuPBvVhmnPAQhi8AhiO3bxt8usTfTbOtgzFiJtVnZmBLTDdDq1/hMchCDOi0FzT+ir7OO9x7
	Ttwgi3gqG2AasvNk0Seelhm1XdyJlg2qMsZHAX4VNcCGvT7GR0zBeQh18HOaTAAgKS7O5ygZpry
	o5acsAJl5iloAVcs1ULc7Uh8CSoggRzys+iXOtHuM2FFmFuHcAqK5AE+bhXJDPoW3x1/Ke3s0El
	7h7z4Xxdo95BpSBOg36WLMeIh2/J6PwrIWDfo42wNQB283vs/n/t288L4f+x8MREBl+zXWemGl5
	aKU/+aiZQAVO3PpXHWAr/kJKi9g1jeMjU7HpDLY0wwvDnc6EylJ+os2zMbb45+6SyZ9tuiMSh1F
	ECiBOIgzztMbMclf9DNK2Q14QTRu9fBDKnVV/kZrbPpUuhzUW5xA2wnsE25adeNhDGBSukwjT8g
	OV+9sBxRvH4jfHbvcJw6/P++RZGfRRzsfn5rBLrFd4yvqHKQlwuZfKdyJbffj3j/XiB+O9GPq7s
	0n2JOzkIS1/ew8WpMzhroE/QSQYI2Gmg
X-Received: by 2002:a05:600d:6510:10b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb8881de57mr48311695e9.26.1795182835502;
        Fri, 20 Nov 2026 05:53:55 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f6b6a6sm101009695e9.5.2026.11.20.05.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:53:53 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH 07/10] npm-update-dependencies: Add a class to list the npm dependencies
Date: Fri, 20 Nov 2026 14:53:38 +0100
Message-ID: <20261120135342.2628228-8-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120135342.2628228-1-stondo@gmail.com>
References: <20261120135342.2628228-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:54:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250800
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add a class with the task do_update_npm_deps. The task reads
npm-shrinkwrap.json in ${S} and writes one SRC_URI entry for each
dependency to ${THISDIR}/${BPN}-npm-deps.inc. The recipe requires this
file. This is the same model as the cargo and Go update tasks.

Then the recipe does not need npmsw://. The fetchers see each
dependency as a normal SRC_URI entry with its own checksum.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 .../npm-update-dependencies.bbclass           | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 meta/classes-recipe/npm-update-dependencies.bbclass

diff --git a/meta/classes-recipe/npm-update-dependencies.bbclass b/meta/classes-recipe/npm-update-dependencies.bbclass
new file mode 100644
index 0000000000..43b00b9b1b
--- /dev/null
+++ b/meta/classes-recipe/npm-update-dependencies.bbclass
@@ -0,0 +1,48 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+##
+## Purpose:
+## This class is used to update the list of npm dependencies in SRC_URI
+## by reading npm-shrinkwrap.json in the source tree. It writes one entry
+## with a checksum for each dependency, so that no fetcher has to read the
+## shrinkwrap file. npm.bbclass checks that SRC_URI matches the shrinkwrap
+## file.
+##
+## To perform the update: bitbake -c update_npm_deps recipe-name
+
+addtask do_update_npm_deps after do_patch
+do_update_npm_deps[nostamp] = "1"
+do_update_npm_deps[doc] = "Update the recipe by reading npm-shrinkwrap.json and write in ${THISDIR}/${BPN}-npm-deps.inc"
+
+RECIPE_UPGRADE_EXTRA_TASKS += "do_update_npm_deps"
+
+python do_update_npm_deps() {
+    import json
+    import oe.npm
+
+    shrinkwrap_file = d.expand("${S}/npm-shrinkwrap.json")
+    with open(shrinkwrap_file) as f:
+        shrinkwrap = json.load(f)
+
+    destdir = os.path.relpath(d.getVar("S"), d.getVar("UNPACKDIR"))
+    dev = bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False)
+    try:
+        entries = oe.npm.shrinkwrap_src_uri(shrinkwrap, destdir, dev)
+    except ValueError as e:
+        bb.fatal("%s: %s" % (shrinkwrap_file, e))
+
+    lines = ["# Autogenerated with 'bitbake -c update_npm_deps %s'" % d.getVar("PN"), ""]
+    lines.append('SRC_URI += " \\')
+    lines.extend("    %s \\" % entry for entry in entries)
+    lines.append('"')
+
+    target_file = d.expand("${THISDIR}/${BPN}-npm-deps.inc")
+    with open(target_file, "w") as f:
+        f.write("\n".join(lines) + "\n")
+
+    bb.note("Successfully updated %d npm dependencies inside %s" % (len(entries), target_file))
+}
-- 
2.56.1

