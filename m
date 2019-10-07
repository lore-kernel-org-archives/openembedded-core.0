Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id D085D7F2B3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 15:11:29 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id t3so2562655pga.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2019 08:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=rJImJJL2h9VAgMGxpLzQjVgZOcIZMjz/oqFJVh/QO6c=;
	b=vOMtk5d2DXr+Ew3P5AiYtDn/MC06CO/3lcXptOV85+TApVyK8Rz8trsZMGxU1dkIy7
	M6i4a6xo2Xe+6vtqGTFJxxP/wHH7yqhikkdHSATE/fLwqN52OUKKWdiyiva420uxSsoh
	p1YBvrdrTK1R1NXubOw30ddeVRTL+4XuqfF/x5keZwPqz8FXOG/AouNF56z1UoVZGOdL
	5TXMDTjXHbQRJYflVJe2qqd1z4djUgOpWeCSx7eKPsE7voO/VWCDRJV0qvDyk7L7NwBy
	OVbeTEEQxD1FRn7mwe/on33lnkGMJxCpQFIdnHxCbikw0gOl2DbunGzNw+kKD9xz5VNN
	N1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=rJImJJL2h9VAgMGxpLzQjVgZOcIZMjz/oqFJVh/QO6c=;
	b=sQqVVeCHMIVneXplty2OnU1UY13E6afGL74IndtYOstem1+b2eApG/oW0kAXHOBCTm
	0DL8Whd/lCd7ygSj53P8OIFWBImVlVN43emQ5qmvvMYKeBn5qXLoZt5EJx9bDASXZkx5
	zyMhmuq05uSM0ojDxhTXFJJa77XgLB6MESgokuF1QtW20LNrPABRqV1iksgocBrLAmWk
	ugiE8BR++WjLPq/cj2ALvBtbGJQOkXhlS//vM/lVs7YJ6HhcXFE1qTulyA1xzIwYZ2os
	Icn5NwUeOMFfDi5xSPrHys3dFzVLl/jzy4iR+NTjOsntA9RBDNs6oJXF324vJbdESdio
	iyVw==
X-Gm-Message-State: APjAAAUBpmOSIHYe9LVYhTO0w7cy66c5N2sraBqcaAL253uMGNfq1hoj
	ZZf9bh89MrjcCB9QND7wPVfVFPA8Nm0=
X-Google-Smtp-Source: APXvYqwUc42XsIL3MWtEiWOFx/F+vwth96liGYL5+D0sVAIreKY9i+KX85yK95JuymH6XnuaqH+DhA==
X-Received: by 2002:a62:1888:: with SMTP id 130mr33795815pfy.72.1570461090758; 
	Mon, 07 Oct 2019 08:11:30 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	m102sm12786928pje.5.2019.10.07.08.11.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Oct 2019 08:11:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2019 08:10:59 -0700
Message-Id: <07cd0d606fea63e683c7de7ebfaa6a55170b8318.1570460789.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1570460789.git.akuster808@gmail.com>
References: <cover.1570460789.git.akuster808@gmail.com>
Subject: [thud 22/26] libxslt: fix CVE-2019-13117 CVE-2019-13118
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
X-List-Received-Date: Mon, 07 Oct 2019 15:11:30 -0000
Content-Type: text/plain; charset=UTF-8
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


