Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5037E7F332
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 15:54:45 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id p74so57637093wme.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 08:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1rD+4hZLVK6Vj+2t6nsZpCdb+N0b1cZfj48R0lO5lTg=;
	b=TXpnjVRKzm4OMFd3irOZ4IfLHuf39jocGr0Grz22ts6JFAWODhw+bWkVO21UEnz6cz
	sTv/GNtFHTOZh+kb2Q1ELv7E9sVhWYTFmi99ZJoDwZwrCLvTirRg6W51UwQHUKvjFqrD
	h6E0itDWJ9Wg2mzbjF0jyOTV2yP49LPm1+XHBQl3hnRBAQauv+RY6JfLvTV57Npmg/2C
	WVgzaJ0vm31/ehMKKimnxL5JR0H+CPJTJV/rhLc3KKrnvPzaGcDPO6eL75A8bwDDKFZa
	SZmWu6FOqLL1hU0qgppc/dREs9J77+RAAkycJZ79yjbfn98jBGjKG18C1IQpZML+oR1R
	mkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1rD+4hZLVK6Vj+2t6nsZpCdb+N0b1cZfj48R0lO5lTg=;
	b=lZ3SkaEBdiwCbbI1XqYO033wCxdZDpKxK7ir0HG1lHVo9rR/yzc6OJ5Q//Q3SLC7Hb
	HWFtxgtMj1oHVoRL6RWrxRxp6x1/EBjWOJ56fHuKPutN50T3xcMV4ZaLQWmUXpsquka2
	RiqiRTsxdwzvosdhLin2InRAzgTLvT6TQDbeCN96Kj1IVsfHlC7D3o9sVtFkWkx6HyM1
	/g2MGjWSzcpQTGkN1b4LpvXwHdsbqu63z1gORrIyukbzqIJALDWkvSLg5JUvDsgJ9oT8
	KH/SgxgOJuLTtFYzWv+GaqNtoRPaN6sdMotO29Txmeg9DkRQh5IMkh/7dep77AYjDXnN
	e0jw==
X-Gm-Message-State: APjAAAWZfwDXvA/eilM8gH0Ezp5DMLzmGOFYmADVSmEhvdKaymO8i1Ls
	TpgaJ659rVXM2PI92vglOMD3e3iWJdM=
X-Google-Smtp-Source: APXvYqz7bqDDJpA+B73hSglPPp6b1VlxFoLHPa5xrl60El1opY9ID8qgCQD39+t8MuEWYlbVS8HwTQ==
X-Received: by 2002:a1c:f009:: with SMTP id a9mr4438650wmb.32.1564502085824;
	Tue, 30 Jul 2019 08:54:45 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c3sm70781403wrx.19.2019.07.30.08.54.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jul 2019 08:54:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2019 17:54:31 +0200
Message-Id: <20190730155432.96611-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190730155432.96611-1-alex.kanavin@gmail.com>
References: <20190730155432.96611-1-alex.kanavin@gmail.com>
Subject: [PATCH 7/8] webkitgtk: upgrade 2.24.2 -> 2.24.3
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
X-List-Received-Date: Tue, 30 Jul 2019 15:54:45 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk/snprintf.patch | 15 ---------------
 .../{webkitgtk_2.24.2.bb => webkitgtk_2.24.3.bb}  |  5 ++---
 2 files changed, 2 insertions(+), 18 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/snprintf.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.24.2.bb => webkitgtk_2.24.3.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/snprintf.patch b/meta/recipes-sato/webkit/webkitgtk/snprintf.patch
deleted file mode 100644
index b1481d78e83..00000000000
--- a/meta/recipes-sato/webkit/webkitgtk/snprintf.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-include missing header for snprintf definition
-
-Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=197088]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/Source/WebCore/platform/text/TextCodec.cpp
-+++ b/Source/WebCore/platform/text/TextCodec.cpp
-@@ -28,6 +28,7 @@
- #include "TextCodec.h"
- 
- #include <array>
-+#include <cstdio>
- 
- namespace WebCore {
- 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
index 891266b220b..1a56108afd5 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
@@ -22,12 +22,11 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://detect-gstreamer-gl.patch \
            file://include_array.patch \
            file://narrowing.patch \
-           file://snprintf.patch \
            file://0001-gstreamer-add-a-missing-format-string.patch \
            "
 
-SRC_URI[md5sum] = "83012998e1b9f71abb37d8baf6f9c7e6"
-SRC_URI[sha256sum] = "019cb1f0d05bf6148b72c7a85734bcd006388a1c14132843ef9a1b2cb7b4321c"
+SRC_URI[md5sum] = "e2a5bbd09a217eba096a2d1562143e35"
+SRC_URI[sha256sum] = "940d746d7e82c357222feb5b3f44c4b201e81df7d81ddca5ca2bf3ae0acf6c51"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-- 
2.17.1


