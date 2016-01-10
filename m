Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5B1BF76651
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:31:15 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id yy13so23082481pab.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=WeJF9VTrMz5sY46VPXJrnFNY2EhHRjUycUvbpVQQhNI=;
	b=PZJgfOM0whxPqE8JjV3fPt90kKFKxlmBNdzF8t2zT6kf8dq1eUzDYCapKXtdwbFFL3
	TXvNugQ313Rc8OyWVxTURo7etVW01DtGd6LATtyVuB2uuesJ5jfP2sBDZo1NyucWddm/
	BosSXqysdo/t/U6hsqZTRAhgcKCO/+b3Rz1JvaMW0eZ57xyo0IqyLGVSYa5eZHmiXnHf
	O1jm8pot8zPl/PPQnCrmwyiZoLqgsAG++L5lG5XJR9aMXEJIDpv5govquxEejSuFEzM2
	c2QfUVr4MeCd3b1bhTlK5WVCFj8YPeyS5kI1PqPqwYCl/59NUFpoOjIJkvd0mFAHo4Km
	dZpA==
X-Received: by 10.66.141.142 with SMTP id ro14mr167982723pab.112.1452385876443;
	Sat, 09 Jan 2016 16:31:16 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ry1sm176283718pab.30.2016.01.09.16.31.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:31:11 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 1EEC9FCC849; Sat,  9 Jan 2016 16:30:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:30:43 -0800
Message-Id: <d56f8720719bb529e89b0ea91669cc7bd28f8d03.1452385572.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
Subject: [PATCH 17/20] libxml2: CVE-2015-8241
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
X-List-Received-Date: Sun, 10 Jan 2016 00:31:15 -0000

From: Sona Sarmadi <sona.sarmadi@enea.com>

Upstream bug (contains reproducer):
https://bugzilla.gnome.org/show_bug.cgi?id=756263

Upstream patch:
https://git.gnome.org/browse/libxml2/commit/?id=
ab2b9a93ff19cedde7befbf2fcc48c6e352b6cbe

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  1 +
 .../libxml/libxml2/CVE-2015-8241.patch             | 41 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index d5e263b..2dafeb4 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -25,6 +25,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch \
            file://CVE-2015-7942.patch \
            file://CVE-2015-8035.patch \
+           file://CVE-2015-8241.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch
new file mode 100644
index 0000000..98b30f0
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch
@@ -0,0 +1,41 @@
+From ab2b9a93ff19cedde7befbf2fcc48c6e352b6cbe Mon Sep 17 00:00:00 2001
+From: Hugh Davenport <hugh@allthethings.co.nz>
+Date: Tue, 3 Nov 2015 20:40:49 +0800
+Subject: Avoid extra processing of MarkupDecl when EOF
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=756263
+
+One place where ctxt->instate == XML_PARSER_EOF whic was set up
+by entity detection issues doesn't get noticed, and even overrided
+
+Fixes CVE-2015-8241.
+
+Upstream-Status: Backport
+
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ parser.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/parser.c b/parser.c
+index d67b300..134afe7 100644
+--- a/parser.c
++++ b/parser.c
+@@ -6972,6 +6972,14 @@ xmlParseMarkupDecl(xmlParserCtxtPtr ctxt) {
+ 	    xmlParsePI(ctxt);
+ 	}
+     }
++
++    /*
++     * detect requirement to exit there and act accordingly
++     * and avoid having instate overriden later on
++     */
++    if (ctxt->instate == XML_PARSER_EOF)
++        return;
++
+     /*
+      * This is only for internal subset. On external entities,
+      * the replacement is done before parsing stage
+-- 
+cgit v0.11.2
+
-- 
1.9.1


