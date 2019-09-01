Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 46BE27F424
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:28 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id i18so5923151pgl.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=G6q68tHCgcNOibGVyiTPGV40J+v6/qASCoH+NWi3QOs=;
	b=TsKXugQMm0lQUhN2n5xKoemysBypeJ0YCLWXV2yFyKgfALGKwhUxBhOT0Z7XgaOYoe
	Y9X6Qaq06yHdt64mv9iOdziZ7ajGvIWSiN7rxvrZdwZ5FQYPDfr99MHZwasK6tbBRI5i
	+GFnYm6E7Fu5jc6UV1JdM2O6paemBCQYlJcpHfMJ7KZfgf52/FFoSYFAkSWRoyI9uV0R
	z3+gV9+JjdLA2+xKzJEAmffp+zjW5IoUml0riHg7/dSRYii22RddrsjyemKGwPuvxrvO
	HbQm7AxqgvuT6q1xZ4qrGPIHJOJfqe9rg1yaeCE0DbDfYURfN1r9U2dzWusp1nicdkq/
	2vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=G6q68tHCgcNOibGVyiTPGV40J+v6/qASCoH+NWi3QOs=;
	b=opxnyLY5LbPgRwvplDxOteIEsiYufp4EEIoQYkquu+cvNy2/qh5x64CCz3IXTIAmvX
	EhCB1Rf9hsW97OEYX2gm993kUJKeQkRCDlxDdeO8HSXvSnDnPRoGfImCtsFZPJFfFPMT
	bq/r8wSu60o9EXJa3tiTJh9oa0O/BQUrh+dod2Dfhz3aA63ciprlIfRiohuyuGjr4zEQ
	jh3dDn1xHlAt2PIt5XeeasT62EEqQjg3TNsu8ZJOiuBTbg2Tq1jZCSK7Ua//aOezVGlb
	zNoBCO09If82swYfQiQ/KQ/RkXrWJ35ZX9iRdRhTtPsaiX1U/5FyUYs+g93FvAeBnnYb
	aQBQ==
X-Gm-Message-State: APjAAAX1rAYzgYRbMY8D4qaa3trjWoCCjeXiYnJxxGF7VjcAPoOJnYG3
	GPBqF+f6pofThiyZFL53niRBB5p/
X-Google-Smtp-Source: APXvYqx3EB7wsRTWHWOxAxrNKuqdUGdmeQjydJXzxWN/F/LM4alcAohgYEl8Ljygd2cPK7KM/tA7ew==
X-Received: by 2002:a17:90a:c588:: with SMTP id
	l8mr8765687pjt.57.1567348589137; 
	Sun, 01 Sep 2019 07:36:29 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:35:42 -0700
Message-Id: <efdde49177047907242948fcc5f7f37cb1e7f541.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 04/43] libxslt: fix CVE-2019-13117 CVE-2019-13118
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Anuj Mittal <anuj.mittal@intel.com>

(From OE-Core rev: 7dc3048fec88dd62ef49ef16517b7382ab7cf2a5)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libxslt/files/CVE-2019-13117.patch             | 33 ++++++++++
 .../libxslt/files/CVE-2019-13118.patch             | 76 ++++++++++++++++++++++
 meta/recipes-support/libxslt/libxslt_1.1.33.bb     |  2 +
 3 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2019-13117.patch
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2019-13118.patch

diff --git a/meta/recipes-support/libxslt/files/CVE-2019-13117.patch b/meta/recipes-support/libxslt/files/CVE-2019-13117.patch
new file mode 100644
index 0000000..ef3f270
--- /dev/null
+++ b/meta/recipes-support/libxslt/files/CVE-2019-13117.patch
@@ -0,0 +1,33 @@
+From c5eb6cf3aba0af048596106ed839b4ae17ecbcb1 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sat, 27 Apr 2019 11:19:48 +0200
+Subject: [PATCH] Fix uninitialized read of xsl:number token
+
+Found by OSS-Fuzz.
+
+CVE: CVE-2019-13117
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt/commit/c5eb6cf3aba0af048596106ed839b4ae17ecbcb1]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ libxslt/numbers.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/libxslt/numbers.c b/libxslt/numbers.c
+index 89e1f668..75c31eba 100644
+--- a/libxslt/numbers.c
++++ b/libxslt/numbers.c
+@@ -382,7 +382,10 @@ xsltNumberFormatTokenize(const xmlChar *format,
+ 		tokens->tokens[tokens->nTokens].token = val - 1;
+ 		ix += len;
+ 		val = xmlStringCurrentChar(NULL, format+ix, &len);
+-	    }
++	    } else {
++                tokens->tokens[tokens->nTokens].token = (xmlChar)'0';
++                tokens->tokens[tokens->nTokens].width = 1;
++            }
+ 	} else if ( (val == (xmlChar)'A') ||
+ 		    (val == (xmlChar)'a') ||
+ 		    (val == (xmlChar)'I') ||
+-- 
+2.21.0
+
diff --git a/meta/recipes-support/libxslt/files/CVE-2019-13118.patch b/meta/recipes-support/libxslt/files/CVE-2019-13118.patch
new file mode 100644
index 0000000..595e6c2
--- /dev/null
+++ b/meta/recipes-support/libxslt/files/CVE-2019-13118.patch
@@ -0,0 +1,76 @@
+From 6ce8de69330783977dd14f6569419489875fb71b Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Mon, 3 Jun 2019 13:14:45 +0200
+Subject: [PATCH] Fix uninitialized read with UTF-8 grouping chars
+
+The character type in xsltFormatNumberConversion was too narrow and
+an invalid character/length combination could be passed to
+xsltNumberFormatDecimal, resulting in an uninitialized read.
+
+Found by OSS-Fuzz.
+
+CVE: CVE-2019-13118
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt/commit/6ce8de69330783977dd14f6569419489875fb71b]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+---
+ libxslt/numbers.c         | 5 +++--
+ tests/docs/bug-222.xml    | 1 +
+ tests/general/bug-222.out | 2 ++
+ tests/general/bug-222.xsl | 6 ++++++
+ 4 files changed, 12 insertions(+), 2 deletions(-)
+ create mode 100644 tests/docs/bug-222.xml
+ create mode 100644 tests/general/bug-222.out
+ create mode 100644 tests/general/bug-222.xsl
+
+diff --git a/libxslt/numbers.c b/libxslt/numbers.c
+index f1ed8846..20b99d5a 100644
+--- a/libxslt/numbers.c
++++ b/libxslt/numbers.c
+@@ -1298,13 +1298,14 @@ OUTPUT_NUMBER:
+     number = floor((scale * number + 0.5)) / scale;
+     if ((self->grouping != NULL) &&
+         (self->grouping[0] != 0)) {
++        int gchar;
+ 
+ 	len = xmlStrlen(self->grouping);
+-	pchar = xsltGetUTF8Char(self->grouping, &len);
++	gchar = xsltGetUTF8Char(self->grouping, &len);
+ 	xsltNumberFormatDecimal(buffer, floor(number), self->zeroDigit[0],
+ 				format_info.integer_digits,
+ 				format_info.group,
+-				pchar, len);
++				gchar, len);
+     } else
+ 	xsltNumberFormatDecimal(buffer, floor(number), self->zeroDigit[0],
+ 				format_info.integer_digits,
+diff --git a/tests/docs/bug-222.xml b/tests/docs/bug-222.xml
+new file mode 100644
+index 00000000..69d62f2c
+--- /dev/null
++++ b/tests/docs/bug-222.xml
+@@ -0,0 +1 @@
++<doc/>
+diff --git a/tests/general/bug-222.out b/tests/general/bug-222.out
+new file mode 100644
+index 00000000..e3139698
+--- /dev/null
++++ b/tests/general/bug-222.out
+@@ -0,0 +1,2 @@
++<?xml version="1.0"?>
++1⠢0
+diff --git a/tests/general/bug-222.xsl b/tests/general/bug-222.xsl
+new file mode 100644
+index 00000000..e32dc473
+--- /dev/null
++++ b/tests/general/bug-222.xsl
+@@ -0,0 +1,6 @@
++<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
++  <xsl:decimal-format name="f" grouping-separator="⠢"/>
++  <xsl:template match="/">
++    <xsl:value-of select="format-number(10,'#⠢0','f')"/>
++  </xsl:template>
++</xsl:stylesheet>
+-- 
+2.21.0
+
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.33.bb b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
index 42b21c7..92d3099 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.33.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
@@ -10,6 +10,8 @@ DEPENDS = "libxml2"
 
 SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
            file://0001-Fix-security-framework-bypass.patch \
+           file://CVE-2019-13117.patch \
+           file://CVE-2019-13118.patch \
 "
 
 SRC_URI[md5sum] = "b3bd254a03e46d58f8ad1e4559cd2c2f"
-- 
2.7.4


