Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id A052A7D95C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:20 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y197so8009900wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SadOhMSi037drBNcVbHBw230PmYTB64je4DHA37FHSk=;
	b=Atobvcu9wmnuJfLxCu4aUiHSzAeerdDdSWHiz5ayQy0WgG8sf6n05qyR2K6n0bvug8
	jEjgSEUQ2d4/o88vfMrhKFcq9SZwkNmwoLkhbcC+q2ZOiqUNPb57WQT0tbD8Lckk8HSC
	Y9XD1xqZw8Ko6JU3/NRvKeuItzp7fCCBXixN8jd+GrSfLHFZJ0jgAFjtQegnZpVRVuY6
	s2xJd8gPjlWI0SFZRzXSsAgGaPzXfCQ3u2tUe9xEigJKn8RDfKIzIJRY0z0zuub/mBbk
	fTag8ej4q8RugRWznYnV/TUKXS2nTL0F5L0caR6ZM+735ic9iv3v4Dz03j2GKZnvESaq
	ssZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SadOhMSi037drBNcVbHBw230PmYTB64je4DHA37FHSk=;
	b=MpDI1ls0sZal62Bt6UtXdFeUxdAa44ZsT8gUNlKVHUFXxpO9HjScJJa1bTjOez3i+3
	M0ij5zbTak3/q4+Iej1mWAS14CXKQMrrxcpnVr4xM17Uh1LVKnwJJ0ChpUauAl87hpVW
	uQoBmQZtn0jfhbXhFY3GOLanzS1nML4fDr2s1rAXsGeoRC/cA4yrzJcYMtfI6Y5LHJm8
	4I1qB9V3GsT9EbyuGDqt38v0lmZeBE40D/RMgk/ziyGTKRBKNdKwrqcoM9/QE9WsO9ay
	kyNnfW30FwTWXPVfSZxCvqPzUZLOHe2nUTWCrReUQWMEjGxLdQJJe38PbHsu2cHJRaiW
	Kavg==
X-Gm-Message-State: APjAAAWDcLcbbbjqvdVvUMoUh7gZJUZIeJ1XxTA9aD6ZZ/Nvwzb763Ym
	XHXCNj+5vxAvDJW20HrlQh0kbkU0PwI=
X-Google-Smtp-Source: APXvYqxLOlski8AXN3uIlVkyxYORDBADZX9MYX2Ag7DbaHx/t8x4g/G97N5wbURP00V0IXTnFLdbqA==
X-Received: by 2002:a1c:d7:: with SMTP id 206mr20692554wma.69.1555325721241;
	Mon, 15 Apr 2019 03:55:21 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o10sm75468400wru.54.2019.04.15.03.55.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 03:55:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:54:56 +0200
Message-Id: <20190415105457.57067-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190415105457.57067-1-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
Subject: [PATCH 18/19] python3-pygobject: update to 3.32.0
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:21 -0000

Switch to meson build system.

Add a patch to disable tests.

Add "introspection" to unknown configure option whitelist, as
this recipe needs g-i unconditionally.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Do-not-build-tests.patch             | 26 +++++++++++++++++++
 ..._3.28.3.bb => python3-pygobject_3.32.0.bb} | 10 ++++---
 2 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-pygobject/0001-Do-not-build-tests.patch
 rename meta/recipes-devtools/python/{python3-pygobject_3.28.3.bb => python3-pygobject_3.32.0.bb} (68%)

diff --git a/meta/recipes-devtools/python/python3-pygobject/0001-Do-not-build-tests.patch b/meta/recipes-devtools/python/python3-pygobject/0001-Do-not-build-tests.patch
new file mode 100644
index 00000000000..626a82cb095
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pygobject/0001-Do-not-build-tests.patch
@@ -0,0 +1,26 @@
+From c125a806de951359ab7e302b0584f7c92fa451ad Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 12 Apr 2019 16:25:58 +0200
+Subject: [PATCH] Do not build tests
+
+They require installing tests from g-i, which we do not do.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index a63d771..b3925d0 100644
+--- a/meson.build
++++ b/meson.build
+@@ -174,4 +174,4 @@ configure_file(input : 'PKG-INFO.in',
+ 
+ subdir('gi')
+ subdir('pygtkcompat')
+-subdir('tests')
++#subdir('tests')
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python3-pygobject_3.28.3.bb b/meta/recipes-devtools/python/python3-pygobject_3.32.0.bb
similarity index 68%
rename from meta/recipes-devtools/python/python3-pygobject_3.28.3.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.32.0.bb
index 313af227b62..c2676b35022 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.28.3.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.32.0.bb
@@ -3,6 +3,7 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
+GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase distutils3-base gobject-introspection upstream-version-is-even
 
 DEPENDS += "python3 glib-2.0"
@@ -10,10 +11,13 @@ DEPENDS += "python3 glib-2.0"
 SRCNAME="pygobject"
 SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
+    file://0001-Do-not-build-tests.patch \
 "
 
-SRC_URI[md5sum] = "3bac63c86bb963aa401f97859464aa90"
-SRC_URI[sha256sum] = "3dd3e21015d06e00482ea665fc1733b77e754a6ab656a5db5d7f7bfaf31ad0b0"
+UNKNOWN_CONFIGURE_WHITELIST = "introspection"
+
+SRC_URI[md5sum] = "6e39bca1d19a27cde4435061dd59578a"
+SRC_URI[sha256sum] = "83f4d7e59fde6bc6b0d39c5e5208574802f759bc525a4cb8e7265dfcba45ef29"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
@@ -21,7 +25,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'directfb', 'wa
 
 # python3-pycairo is checked on configuration -> DEPENDS
 # we don't link against python3-pycairo -> RDEPENDS
-PACKAGECONFIG[cairo] = "--enable-cairo,--disable-cairo,cairo python3-pycairo, python3-pycairo"
+PACKAGECONFIG[cairo] = "-Dpycairo=true,-Dpycairo=false, cairo python3-pycairo, python3-pycairo"
 
 RDEPENDS_${PN} += "python3-setuptools"
 
-- 
2.17.1


