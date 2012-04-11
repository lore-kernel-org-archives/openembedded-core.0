Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SI01C-0007Gq-Rq
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 18:03:38 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so910823wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 08:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=HCoZ1Xy5oTvTX2rYtOACzia4ygYkuqRk7U4ftmE9RpM=;
	b=SEJdYYxXFXJR5c2+i4Otk0bzWYwMi0hmTKPSiEgkHxh7vNObf2Yu+WxGskQyUUo7Qf
	X4lHunyGGLMybX2m3OBg8iDoJinY6dL8heky/kviiTG6yFwLgYQiGWbpMLFYqplRJZnU
	Cgcee1aU3t+f6crzGF+tskuxvfSxYQspRbjjSmZKpIKxNDTjW6M9+hgE52hoVP7RCLZ9
	isY1/u4+bCdn4D2lcPh0bUEiYF1E7cGE7+n9DvpyJ2Ryjzajfhg/6aAwdcOXPjK/yiPd
	TQsXSNuLBHQ9E9tV8XTUM2E52+p+vKBfEz4LVR9UsFApL9PUjYYTiJmlpoOA54jhQALs
	nO0w==
Received: by 10.216.136.72 with SMTP id v50mr8986478wei.73.1334159662060;
	Wed, 11 Apr 2012 08:54:22 -0700 (PDT)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id n8sm10877794wix.10.2012.04.11.08.54.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 08:54:20 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 18:54:14 +0300
Message-Id: <a9b864635df3ef1e7c3ceeeb05adc491d4e5b97b.1334159446.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <c76e09de7b542e3860f49ed8fb7733d60b21b5bc.1334159446.git.andrei@gherzan.ro>
References: <c76e09de7b542e3860f49ed8fb7733d60b21b5bc.1334159446.git.andrei@gherzan.ro>
In-Reply-To: <cover.1334159446.git.andrei@gherzan.ro>
References: <cover.1334159446.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQlCmdeuvdjkUvJms5DKER9krgdEinyCcn+ZrRoxheE8xOgMrQEL7KOswLtgSBMfVuiTVVzg
Subject: [V4 2/2] PR bump packages with gdbm in DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 16:03:38 -0000

This is done because of this change in gdbm:
"gdbm: Package compat libs in gdbm-compat"

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    2 +-
 meta/recipes-devtools/python/python_2.7.2.bb       |    2 +-
 .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
 meta/recipes-support/apr/apr-util_1.4.1.bb         |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 92ca9b8..8f3ad25 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r4"
+PR = "r5"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index a3a2c96..00a5558 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.14"
+PR = "${INC_PR}.15"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
index e98a591..fd61149 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r7"
+PR = "r8"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
diff --git a/meta/recipes-support/apr/apr-util_1.4.1.bb b/meta/recipes-support/apr/apr-util_1.4.1.bb
index 029cf7e..deb608f 100644
--- a/meta/recipes-support/apr/apr-util_1.4.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.4.1.bb
@@ -9,7 +9,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=519e0a18e03f7c023070568c14b077bb \
                     file://include/apu_version.h;endline=17;md5=806685a84e71f10c80144c48eb35df42"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
-- 
1.7.5.4



