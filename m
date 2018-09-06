Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48])
	by mail.openembedded.org (Postfix) with ESMTP id 48D6979671
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:40:54 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id p52-v6so8457255eda.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=98dZ5NhIDA5FwJMWsWJyovwDYxCqLATW4ETPXfkwgm4=;
	b=taOrWcKjhTTzwFiLb40GCcCmUdCGDmybKq/iM4r+yEdNciKpndHSN9SGfBjbjMJ88e
	zPWlR9FQP4JPKXy3q+TE4IIuZrSvRPVU5x65XC0aEKTTd+ez/M3IMW5nqJJDlQbT22b+
	3mZy5YyOB80WcF6MEHSb4UPq5QMryEvaKYOpXPtJhf8sVr8NozvOSJ6DCbQkJLhC99fc
	grPS+ptnvMDcoZFyzr+l9EAjhtqRbKmh0qCmNK0qKQcjHI3xpbXU+iCcsEosV7j+h673
	JFzKNV3OulpE4XhPH7Nk23c+2eyvY5slBVGNlFJf6JSpzhCVtMUHa8bvVJKn1xOKS97O
	IUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=98dZ5NhIDA5FwJMWsWJyovwDYxCqLATW4ETPXfkwgm4=;
	b=DJ6z2njyo4FsJSOAnByOsSYmeFM+VZXSUwN4uq7NywqZ4G5Zqr4NNcB/80UvK1VPJi
	ELCdIZOBeLYIn4RB0/K2vbC/90C97XcrPFG265VSj1lHQQTEYfJizp4PKXnDLU4+j61z
	eaKiBQN3sBg2X/X48nBuJym4nBMmXzMj5tZYygrLzEVxgv1yizL7XiVtGAV64qv2MajF
	DAHtuduXPej7qLIFxCPwMt9z2G1YJ+yHVvIGfDM2rTVWOYkEr+jIcPKRyQldxcJBDnH0
	nO3WFRTzAPHQD+gxS6HRtTVhdue1SGMrb8QO3IGjw/hDxN+cHSZKAoTBSDWBE6yOHDc3
	AACQ==
X-Gm-Message-State: APzg51CJ4HqMzAfQp7eYcvoasXBHKXFb2nyHGP41zqN/E33cJca6+3mY
	DIuuGGUIKO3UjLHyJAsdHiig9DSqDvk=
X-Google-Smtp-Source: ANB0Vda+yIucEOUoTfRKdz0t/M8RVOtPYYg8fVS9lDL1i3tyKefHhbeTRoC9PJjBhtoKxkhq08Ngng==
X-Received: by 2002:a50:bb69:: with SMTP id
	y96-v6mr2899711ede.10.1536230454804; 
	Thu, 06 Sep 2018 03:40:54 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm2256506ede.11.2018.09.06.03.40.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:40:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:40:32 +0200
Message-Id: <1536230436-30342-17-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCHv2 17/21] vala: update to 0.42.0
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
X-List-Received-Date: Thu, 06 Sep 2018 10:40:54 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/vala/disable-graphviz.patch       | 12 ++++++------
 .../recipes-devtools/vala/{vala_0.40.8.bb => vala_0.42.0.bb} |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.40.8.bb => vala_0.42.0.bb} (64%)

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
diff --git a/meta/recipes-devtools/vala/vala_0.40.8.bb b/meta/recipes-devtools/vala/vala_0.42.0.bb
similarity index 64%
rename from meta/recipes-devtools/vala/vala_0.40.8.bb
rename to meta/recipes-devtools/vala/vala_0.42.0.bb
index dba9f0d..2b02e0c 100644
--- a/meta/recipes-devtools/vala/vala_0.40.8.bb
+++ b/meta/recipes-devtools/vala/vala_0.42.0.bb
@@ -6,5 +6,5 @@ SRC_URI += " file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pa
 	     file://0001-Disable-valadoc.patch \
 "
 
-SRC_URI[md5sum] = "3e3177692fb5d81a7b8aaa6b95a30bdd"
-SRC_URI[sha256sum] = "5c35e087a7054e9f0a514a0c1f1d0a0d7cf68d3e43c1dbeb840f9b0d815c0fa5"
+SRC_URI[md5sum] = "aa6eb8097d25b5847ad3fab34c0ff865"
+SRC_URI[sha256sum] = "62a55986da23cf3aaafd7624c32db2a1af11c8419e0bb0751727d10f1f7ab7be"
-- 
2.7.4


