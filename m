Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id E8172772E6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:48 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id pv5so4055005pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=XqTZVOkaJxeTSgOfHXSUQ/ouBOGTas2EO+b8tlTmsWQ=;
	b=BCmtHX70HibqrvIAz0mAmZBtISiBvBhFH/Vfz4SYci4su6Rf0RMKCYIbdqBiKsolM8
	rx5qdHhWehZcfqY94bw7BlzYvqFGybSNdwIVsHzPMiju8JTjPRx92Jol/oAqvIZK80iN
	tLYXzbmI80S2sB2EeiNaMr1b0gRWCuuqCYXVjO3GAHI1zisnPsnTfjIxPBK6yorN/01u
	3P43TdLJV1A2C41qAn/g+cdxo7dAY8Uqbhn9C8o64J45teKFW3bVzMrepcFob6fhxvBX
	tLpAWVWVNZJ/LZSE4Le8gWtf08u/m1+PY+xKWUMDZ9cys3jL12QMad3DCOU4Q+64R/Tx
	2XyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=XqTZVOkaJxeTSgOfHXSUQ/ouBOGTas2EO+b8tlTmsWQ=;
	b=UnzsHBVAlobFdhH+kNYioqsUqjpIJlLm9HUSCFEHn8oK2k2agIOi5clHiUcFBxXq5O
	wdkKG2RHD4Icj2H2hjf86L+kK0kST+03BeZEAu1thGj86LYJVIowb7AqFvGjQu7oUvjP
	YoOAvxfP938k/V5KI6tEi2f/Aw71jAwBW4uSven0V3oBsUx7zwZOZ/GDX8vQ8529+n43
	fvYbRBy9sZ4hekHPdYZRbMImtu+UONECAgTa8QUjL6C1jwrEmqvSFSps5jA3ePl/jq14
	YZjj8C5ip89ODYogXwpCZ5VEkEW02IgG7GltA/PM4DiMvIQPUk/fSQKPt5wpmqvJ+KWJ
	j4HA==
X-Gm-Message-State: AG10YOS8X8kolex9MF2a5xMn6eBAYrLzud+z9sOenmqi6ZqP4eKqdv+I63p0LU3fVlnuTg==
X-Received: by 10.66.141.229 with SMTP id rr5mr31271405pab.123.1454800549997; 
	Sat, 06 Feb 2016 15:15:49 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:15:00 -0800
Message-Id: <71dcdf54f830b00b7e9ec7463eaeddb9166f8c7b.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 19/21] libxml2: Security fix CVE-2015-8241
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:49 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8241 libxml2: Buffer overread with XML parser in xmlNextChar

(From OE-Core rev: f3c19a39cdec435f26a7f46a3432231ba4daa19c)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  1 +
 .../libxml/libxml2/CVE-2015-8241.patch             | 40 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 4f2034e..01d6bbe 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -37,6 +37,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://0001-CVE-2015-7500-Fix-memory-access-error-due-to-incorre.patch \
            file://0001-CVE-2015-8242-Buffer-overead-with-HTML-parser-in-pus.patch \
            file://0001-CVE-2015-5312-Another-entity-expansion-issue.patch \
+           file://CVE-2015-8241.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch
new file mode 100644
index 0000000..89a46ad
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch
@@ -0,0 +1,40 @@
+From ab2b9a93ff19cedde7befbf2fcc48c6e352b6cbe Mon Sep 17 00:00:00 2001
+From: Hugh Davenport <hugh@allthethings.co.nz>
+Date: Tue, 3 Nov 2015 20:40:49 +0800
+Subject: [PATCH] Avoid extra processing of MarkupDecl when EOF
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=756263
+
+One place where ctxt->instate == XML_PARSER_EOF whic was set up
+by entity detection issues doesn't get noticed, and even overrided
+
+Upstream-status: Backport
+
+https://git.gnome.org/browse/libxml2/commit/?id=ab2b9a93ff19cedde7befbf2fcc48c6e352b6cbe
+
+CVE: CVE-2015-8241
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ parser.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+Index: libxml2-2.9.2/parser.c
+===================================================================
+--- libxml2-2.9.2.orig/parser.c
++++ libxml2-2.9.2/parser.c
+@@ -6999,6 +6999,14 @@ xmlParseMarkupDecl(xmlParserCtxtPtr ctxt
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
-- 
2.3.5


