Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
	[209.85.208.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6B6BE79551
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:55 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id l5so8471532edw.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xOnu9O8Wx/deCkqiRg9O52q/wCcZxtLuI5ItP/1UhYA=;
	b=Djp4greD86LmsWYTCz0Yj9av6RCupnJJrV0PlH9xYMZ1R4KbdMXSpyRnvXvx+oqMsl
	W5Bmx1zSwGkqYNB1znNfnqIhJciXQF9lpc8rKVJzb69bd53V9RqdypFFVnN4CiKwFnV/
	Pp/k+4LIOnwQj9AFCavWA+ZGcQBA/jMqwjyFVVgFzE9f/sJzO4XJmAC38aoZvXTzB6l4
	2t9gNAFZg476lH8cN1ya7Gb2juxcY8/6+hc/79DwpZI/5aoS/W4zBZiLOheasP1IkPYk
	X2ckXjOvObZUe78BjtCh2mOnwc4N8sTapbGr+aIdIiKRY8AENREThTE8daRTiWMCtIwk
	xZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xOnu9O8Wx/deCkqiRg9O52q/wCcZxtLuI5ItP/1UhYA=;
	b=BK2DqzgfFEcsjKYA1y/T/TfIg7kKx038RpxfTIm+pkry4oNCE7ie9JDNp6mx6uDiMi
	yP9eESOlZ9q/e1lLp6+gpSERYXDO+5vAfanbzeDsWH1S+KRon2290SDAAR4eFsGQhEtc
	314NRa5qbjcmEXFkUsxCJpvmFZ2cZEf15bd6spzgQ3lpoYLLyDwPzFRvnTLeZctK5ykU
	xdFrfonSV5UPndxTSGCSRHIgHnzSHLRyr3u/E/nakxZoQ/LnP5cLcpxhOZmBQCAVfBjm
	EZkd8cQU71jZvX4owa8EIBZzbxzO8VZJZDi52/0IbNEP6HL3Z5fwwFGGXCjnmZAc3zjQ
	8Dnw==
X-Gm-Message-State: APzg51DxSkUOqmvSj3y0cwEH+N+XiPxP6yetm/j2Tjnawp3sqNHVz8m4
	fa8/Ds0Akh6cxZjgmMsgoe3wJPiyg3M=
X-Google-Smtp-Source: ANB0VdZYLai1MlgG3iCv/kJ0DQzWGG1SV4TJ1keOqGFpU+4pi24C4NBjY8Jvi4iEgeercMpdZ1nVKg==
X-Received: by 2002:a50:b7db:: with SMTP id
	i27-v6mr2894335ede.284.1536229795886; 
	Thu, 06 Sep 2018 03:29:55 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:26 +0200
Message-Id: <1536229770-29600-17-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
References: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCH 17/21] vala: update to 0.42.0
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
X-List-Received-Date: Thu, 06 Sep 2018 10:29:55 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/vala/disable-graphviz.patch | 12 ++++++------
 meta/recipes-devtools/vala/vala_0.40.8.bb              | 10 ----------
 meta/recipes-devtools/vala/vala_0.42.0.bb              | 10 ++++++++++
 3 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala_0.40.8.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.42.0.bb

diff --git a/meta/recipes-devtools/vala/vala/disable-graphviz.patch b/meta/recipes-devtools/vala/vala/disable-graphviz.patch
index e7e38c7..477504d 100644
--- a/meta/recipes-devtools/vala/vala/disable-graphviz.patch
+++ b/meta/recipes-devtools/vala/vala/disable-graphviz.patch
@@ -1,4 +1,4 @@
-From 5ae347907b8c65983365a6325ac990fcde28d508 Mon Sep 17 00:00:00 2001
+From 57f6b661d7865e8cecd17be36fab68f7f8447998 Mon Sep 17 00:00:00 2001
 From: Rico Tzschichholz <ricotz@ubuntu.com>
 Date: Wed, 6 Sep 2017 18:52:55 +0200
 Subject: [PATCH] libvaladoc: Allow disabling the graphviz dependency of
@@ -17,10 +17,10 @@ Upstream-Status: Submitted [bugzilla link above]
  4 files changed, 63 insertions(+), 34 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 694ffd2..9150620 100644
+index 730c72d..af81986 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -112,34 +112,38 @@ PKG_CHECK_MODULES(GMODULE, gmodule-2.0 >= $GLIB_REQUIRED)
+@@ -119,34 +119,38 @@ PKG_CHECK_MODULES(GMODULE, gmodule-2.0 >= $GLIB_REQUIRED)
  AC_SUBST(GMODULE_CFLAGS)
  AC_SUBST(GMODULE_LIBS)
  
@@ -202,7 +202,7 @@ index 37c731c..e0326ef 100644
  
  	public void write_namespace_content (Namespace node, Api.Node? parent) {
 diff --git a/libvaladoc/html/htmlmarkupwriter.vala b/libvaladoc/html/htmlmarkupwriter.vala
-index dcc4dad..cf9c860 100644
+index 5aa4afd..e79b0b8 100644
 --- a/libvaladoc/html/htmlmarkupwriter.vala
 +++ b/libvaladoc/html/htmlmarkupwriter.vala
 @@ -51,12 +51,16 @@ public class Valadoc.Html.MarkupWriter : Valadoc.MarkupWriter {
@@ -210,14 +210,14 @@ index dcc4dad..cf9c860 100644
  	}
  
 +#if HAVE_GRAPHVIZ
- 	public MarkupWriter add_usemap (Charts.Chart chart) {
+ 	public unowned MarkupWriter add_usemap (Charts.Chart chart) {
  		string? buf = (string?) chart.write_buffer ("cmapx");
  		if (buf != null) {
  			raw_text ("\n");
  			raw_text ((!) buf);
  		}
 +#else
-+	public MarkupWriter add_usemap (void* chart) {
++	public unowned MarkupWriter add_usemap (void* chart) {
 +#endif
  
  		return this;
diff --git a/meta/recipes-devtools/vala/vala_0.40.8.bb b/meta/recipes-devtools/vala/vala_0.40.8.bb
deleted file mode 100644
index dba9f0d..0000000
--- a/meta/recipes-devtools/vala/vala_0.40.8.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch \
-             file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
-	     file://disable-graphviz.patch \
-	     file://0001-Disable-valadoc.patch \
-"
-
-SRC_URI[md5sum] = "3e3177692fb5d81a7b8aaa6b95a30bdd"
-SRC_URI[sha256sum] = "5c35e087a7054e9f0a514a0c1f1d0a0d7cf68d3e43c1dbeb840f9b0d815c0fa5"
diff --git a/meta/recipes-devtools/vala/vala_0.42.0.bb b/meta/recipes-devtools/vala/vala_0.42.0.bb
new file mode 100644
index 0000000..2b02e0c
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.42.0.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.patch \
+             file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
+	     file://disable-graphviz.patch \
+	     file://0001-Disable-valadoc.patch \
+"
+
+SRC_URI[md5sum] = "aa6eb8097d25b5847ad3fab34c0ff865"
+SRC_URI[sha256sum] = "62a55986da23cf3aaafd7624c32db2a1af11c8419e0bb0751727d10f1f7ab7be"
-- 
2.7.4


