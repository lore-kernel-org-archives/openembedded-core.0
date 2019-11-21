Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id A62F77C4DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 16:57:46 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id n18so3946686ilt.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 08:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MIPzcrMNRTtJlisRIeud1EtFYzMnT5UiEBtR7OlC998=;
	b=cjHfOHcGN0nVtNr0ku13kKfiyHxEzGkWtbyJwZD7hf1sz5N5YvTj7XNxrrIoXyZlNz
	jpPVLjJtoDZbLGvFMWNrFM3chNUdUO2OphS5U5ze3KE/AdgP+pzaf4tuZZ2IENrs+u/K
	eegS5lypkOVOtdA1+OwVjXQ2+vE5d00Twv4AWWtQ40tNAQW6XLIjFMM+wX6OUR15GFv5
	UesPX90hHtBLxahlHiIAzGDDoLFNQdWRk27QM+pxeQEbkSNv+Ox0bhG5Etxutj/123ru
	GDGo5VRwE6gVNWhpA+0DjUjkp9HvPOGah66eXklgpnbfIcFpyZHokYSyZnle6Ig7xlAE
	2GjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MIPzcrMNRTtJlisRIeud1EtFYzMnT5UiEBtR7OlC998=;
	b=ClnbA8xC2/i/XuirGoDjyD6HaRkXt86HYgKH7gzLxIRgWWTPDauArdho02jSqO5Rvv
	WdHJM+pQ/dseShdrSZWcakAqAHjcTiH2NsIZF9kH7U5BCfq4hjCphDzJbymHMRbCdE0g
	2bmrVCVpRh6rV/iqFFdzoWq3YAJk1ZQV02KRMTmYh+piH8jGGqrnQEhdhZW9MeczDNy0
	TF8PWhi4KIFhE1om1XqU5nn+qKwe5E1Xgko0xrJVg3tdKRzTDBc/y/foE/EDT36vsU3c
	lfna65SEVwTXkjAZaImxAO/pNXXDr5+TocFlfusOeCBcRVCAQ8CpYJu1wfmiyElrtQrH
	16tA==
X-Gm-Message-State: APjAAAUODVj92hEz2+0xoZU8wMM5fy+w9xhgZD7pqfgewnf4hq2azl/l
	hDuh0Gm7W6WaxM0GRUIrthELwdqDf0U=
X-Google-Smtp-Source: APXvYqxH413NdLkiyb4D6mk4gKVrFt4JK2R9bwmDQLwr4qcZaoUh44hE2zCR4whbSs/rmeBnWeERyQ==
X-Received: by 2002:a92:6609:: with SMTP id a9mr11680525ilc.131.1574355467283; 
	Thu, 21 Nov 2019 08:57:47 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id w85sm17661ili.44.2019.11.21.08.57.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 08:57:46 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 10:57:42 -0600
Message-Id: <20191121165742.1219887-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] pango: Fix reproducibility
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
X-List-Received-Date: Thu, 21 Nov 2019 16:57:46 -0000
Content-Transfer-Encoding: 8bit

Applies a patch to fix the build reproducibility of the -src package.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../0001-Fix-build-reproducibility.patch      | 31 +++++++++++++++++++
 meta/recipes-graphics/pango/pango_1.44.6.bb   |  3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/pango/pango/0001-Fix-build-reproducibility.patch

diff --git a/meta/recipes-graphics/pango/pango/0001-Fix-build-reproducibility.patch b/meta/recipes-graphics/pango/pango/0001-Fix-build-reproducibility.patch
new file mode 100644
index 00000000000..03abf8763ce
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango/0001-Fix-build-reproducibility.patch
@@ -0,0 +1,31 @@
+From f8b32901981a06a8db4169b82a704dcf7e8b6560 Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Wed, 20 Nov 2019 15:43:57 -0600
+Subject: [PATCH] Fix build reproducibility
+
+Changes the comment in pango-enum-types.c to reference the file basename
+instead of the full path. This ensures that the generated file is
+reproducible when it is included in source packages meant for debugging.
+
+Upstream-Status: Pending [https://gitlab.gnome.org/GNOME/pango/merge_requests/159]
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+---
+ pango/pango-enum-types.c.template | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pango/pango-enum-types.c.template b/pango/pango-enum-types.c.template
+index d922c691..0d55ef74 100644
+--- a/pango/pango-enum-types.c.template
++++ b/pango/pango-enum-types.c.template
+@@ -6,7 +6,7 @@
+ /*** END file-header ***/
+ 
+ /*** BEGIN file-production ***/
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN value-header ***/
+-- 
+2.23.0
+
diff --git a/meta/recipes-graphics/pango/pango_1.44.6.bb b/meta/recipes-graphics/pango/pango_1.44.6.bb
index 8138ef72c16..c741d5836af 100644
--- a/meta/recipes-graphics/pango/pango_1.44.6.bb
+++ b/meta/recipes-graphics/pango/pango_1.44.6.bb
@@ -16,7 +16,8 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
 
 SRC_URI += "file://run-ptest \
-            file://0001-Skip-thai-break-tests-without-libthai.patch"
+            file://0001-Skip-thai-break-tests-without-libthai.patch \
+            file://0001-Fix-build-reproducibility.patch"
 SRC_URI[archive.md5sum] = "db0a3243ba33e02aaa775412f8e5f412"
 SRC_URI[archive.sha256sum] = "3e1e41ba838737e200611ff001e3b304c2ca4cdbba63d200a20db0b0ddc0f86c"
 
-- 
2.23.0


