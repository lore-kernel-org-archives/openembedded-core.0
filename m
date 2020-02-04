Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 60BB5611F9
	for <openembedded-core@openembedded.org>;
	Tue,  4 Feb 2020 15:06:13 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id k3so9795546pgc.3
	for <openembedded-core@openembedded.org>;
	Tue, 04 Feb 2020 07:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dmbU8KUAjvuGC1+F0jX22Y6ppNcouY2M002z0JPZ9BU=;
	b=GyTwE4HAzDC0eZE9+fp8BJOVO/Y0Ds+tbdusEnVzlr5NszZGiZWlQsANaj/QS1L3PP
	OFKBuAHbUuj8F55Md+JPEnrMLcdPCFI11uOOCv/somldw4q2+VjVUZ/j0dEoWJeo3ohA
	oT93kp1ixLE038WYByi1nait4gAFcSwMWgcIjVpZI9bzcoDHpYarbWTuuhlMxED/ytUH
	B9+SyT3nfvbFM0/OEfDuJjhWj4SoZ9OzFn82CUv1BieOqO1KokxH3v+d4GG7e9P05Scx
	pJcq8S9PK68wVfQ3VvDbOMgcJ2V7scOwS6vNA0sEivX4LxKXSFDFI0MT92MgqLx56iUK
	xgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dmbU8KUAjvuGC1+F0jX22Y6ppNcouY2M002z0JPZ9BU=;
	b=dG5YfyZRv2W6tfIMmWj1WLoT+94cIYNJGW/DZ4EbBoV5o5XQnt4PKFwD3eCstSseiH
	0Y4uSRd8hrzTWYuCAURqtDRWvNhVp1xu1bH2F1ZjZFWxlH3dqC5UWqG8UFV1a12is8rX
	QXPecLBpK+qB77zunAElbxZdFoYfOphyWwmsAand3tON5WTPI62S6l+2xZviN4vstP0b
	VIZcFXscWaxj3waFeEyBp22I1Js/Pr8xxiBjhncVfvResdEUiTPXp7TgO970UF3yKUpO
	FpITq+rH/4XLLOIy4t4BMIeeHGf2DEGmeL/ZTd7g8t4ctFEQARcZ8dErJxIHQfCQxkz3
	mj0Q==
X-Gm-Message-State: APjAAAV6UxiJA2HTn16DkR1vO7wmZAPgTAwylQe6qp+v/YGVVfudMeoo
	hRgFQ3fM0yOFMP/UKMrAnIZDPODF
X-Google-Smtp-Source: APXvYqxcf9YUzWJyaYwPV58Wox/I6r7vIJ96QEZI2qG9EoVJI3um7z9mggF1sFdjJ76J2qekdBSRyQ==
X-Received: by 2002:aa7:8699:: with SMTP id d25mr31023350pfo.139.1580828773890;
	Tue, 04 Feb 2020 07:06:13 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0::afc]) by smtp.gmail.com with ESMTPSA id
	b98sm4216055pjc.16.2020.02.04.07.06.12
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 07:06:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue,  4 Feb 2020 07:06:01 -0800
Message-Id: <3bd467abc907070b98dc470a23ac4d72866d58d9.1580828664.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580828664.git.akuster808@gmail.com>
References: <cover.1580828664.git.akuster808@gmail.com>
Subject: [zeus 1/8] libxml2: Fix CVE-2019-19956
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
X-List-Received-Date: Tue, 04 Feb 2020 15:06:13 -0000

From: Lee Chee Yang <chee.yang.lee@intel.com>

see:
https://gitlab.gnome.org/GNOME/libxml2/commit/5a02583c7e683896d84878bd90641d8d9b0d0549

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libxml/libxml2/Fix-CVE-2019-19956.patch   | 40 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.9.bb     |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/Fix-CVE-2019-19956.patch

diff --git a/meta/recipes-core/libxml/libxml2/Fix-CVE-2019-19956.patch b/meta/recipes-core/libxml/libxml2/Fix-CVE-2019-19956.patch
new file mode 100644
index 0000000000..1c2dff9d5f
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/Fix-CVE-2019-19956.patch
@@ -0,0 +1,40 @@
+From 5a02583c7e683896d84878bd90641d8d9b0d0549 Mon Sep 17 00:00:00 2001
+From: Zhipeng Xie <xiezhipeng1@huawei.com>
+Date: Wed, 7 Aug 2019 17:39:17 +0800
+Subject: [PATCH] Fix memory leak in xmlParseBalancedChunkMemoryRecover
+
+When doc is NULL, namespace created in xmlTreeEnsureXMLDecl
+is bind to newDoc->oldNs, in this case, set newDoc->oldNs to
+NULL and free newDoc will cause a memory leak.
+
+Found with libFuzzer.
+
+Closes #82.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/commit/5a02583c7e683896d84878bd90641d8d9b0d0549]
+CVE: CVE-2019-19956
+
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ parser.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/parser.c b/parser.c
+index 1ce1ccf1..26d9f4e3 100644
+--- a/parser.c
++++ b/parser.c
+@@ -13894,7 +13894,8 @@ xmlParseBalancedChunkMemoryRecover(xmlDocPtr doc, xmlSAXHandlerPtr sax,
+     xmlFreeParserCtxt(ctxt);
+     newDoc->intSubset = NULL;
+     newDoc->extSubset = NULL;
+-    newDoc->oldNs = NULL;
++    if(doc != NULL)
++	newDoc->oldNs = NULL;
+     xmlFreeDoc(newDoc);
+ 
+     return(ret);
+-- 
+2.24.1
+
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.9.bb b/meta/recipes-core/libxml/libxml2_2.9.9.bb
index c38f883e44..c44a90b1c2 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.9.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.9.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml-m4-use-pkgconfig.patch \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            file://fix-execution-of-ptests.patch \
+           file://Fix-CVE-2019-19956.patch \
            "
 
 SRC_URI[libtar.md5sum] = "c04a5a0a042eaa157e8e8c9eabe76bd6"
-- 
2.17.1


