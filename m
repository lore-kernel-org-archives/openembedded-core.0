Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 98F037F225
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2019 00:06:19 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id d10so16090779pgo.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 17:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rJImJJL2h9VAgMGxpLzQjVgZOcIZMjz/oqFJVh/QO6c=;
	b=LwAmq/nViDbQKjuu9VlPss0evf//julAN+f5Lxo0VScIyq2ebbGKxwaiBn2dnPAKBm
	fLi8nrPqyjMgjUKU33G0VX6eCk/qsjM7De5OvuV4sO41iqdt0FQBep74xmF6fsC3oZoP
	WDw85pWR8chr8b5ntkS7nVt5ubWl3GBmgYY5sxEJn9Ze5r7RpnuYBoDeyuzs6BMfVFvl
	kdWTGBEVa7PhXlGfwwB2EKeFPdtd2Ej8jJ4aFCrN5EBnoyfct+wMTP9KHblwOtduhbFL
	Li3hTdj/c2eblnzAqrNqvc4KOKPEf47kPRjGldufwIAF13GRYkn4X0EiaU4oDsWljAbw
	VVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rJImJJL2h9VAgMGxpLzQjVgZOcIZMjz/oqFJVh/QO6c=;
	b=MdfXq6N0ArYmutFl8mjKAntLopLLbcB7xu2bDHT/gGexuvXHmH//LMXLaYOl/isyro
	yZiGduOyW5UvXCHscP+2oPtV0h3HIB81KCiSu8sycyRmIS+XXfR+9AsV8UYXgsVwBpts
	118rlUVV1tQYJzJdqTXP18g0+FX9KY6PtE6r6TPB/Ydwk5QlT6XUmfAmrzBGggDbIC4F
	eSSTOUssVOATPl/U0fkLQPwkXKRWHI7nG9C7LyZSRB4qD3L72iN9msCkRDxCNYiVGOpx
	+paHkmY30SO8os6sSysmnADGct531U0ewM54s1/CuRZwfSe3vFZgP9RD+hBJ1vlbgH9p
	aFXQ==
X-Gm-Message-State: APjAAAWKjTaNdiIcd8s4u2yVh0RmlYYwJgVUgy00Gvz6NQZAWcYFt31S
	aOOIf3hgmCGRIOSMiGaVzk5+NjIKkHU=
X-Google-Smtp-Source: APXvYqwq+ZQUNgS1FLkC9DhkoVCI7tfUSShg5M/SIfYdUL7Mx+EC2T1r7FJSlyF+zWiQ0uYX/nsY6w==
X-Received: by 2002:a62:3c1:: with SMTP id 184mr54032169pfd.209.1568419580178; 
	Fri, 13 Sep 2019 17:06:20 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:b812:1f2e:5b35:90e5])
	by smtp.gmail.com with ESMTPSA id
	193sm34908153pfc.59.2019.09.13.17.06.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Sep 2019 17:06:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 17:06:17 -0700
Message-Id: <1568419577-22002-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [thud][PATCH] libxslt: fix CVE-2019-13117 CVE-2019-13118
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
X-List-Received-Date: Sat, 14 Sep 2019 00:06:19 -0000
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Anuj Mittal <anuj.mittal@intel.com>

(From OE-Core rev: 7dc3048fec88dd62ef49ef16517b7382ab7cf2a5)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Fixup for thud context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libxslt/files/CVE-2019-13117.patch             | 33 ++++++++++
 .../libxslt/files/CVE-2019-13118.patch             | 76 ++++++++++++++++++++++
 meta/recipes-support/libxslt/libxslt_1.1.32.bb     |  4 +-
 3 files changed, 112 insertions(+), 1 deletion(-)
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
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.32.bb b/meta/recipes-support/libxslt/libxslt_1.1.32.bb
index df3f97a..e2a515f 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.32.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.32.bb
@@ -11,7 +11,9 @@ DEPENDS = "libxml2"
 SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
            file://fix-rvts-handling.patch \
            file://CVE-2019-11068.patch \
-           "
+           file://CVE-2019-13117.patch \
+           file://CVE-2019-13118.patch \
+"
 
 SRC_URI[md5sum] = "1fc72f98e98bf4443f1651165f3aa146"
 SRC_URI[sha256sum] = "526ecd0abaf4a7789041622c3950c0e7f2c4c8835471515fd77eec684a355460"
-- 
2.7.4


