Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.3604.1616143514544350509
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 01:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p+faPdiS;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id u9so8363607ejj.7
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 01:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+UzxGgLFbuwNyyk2vK543G8vTHKDRFI5h4EAWVopLWY=;
        b=p+faPdiSWGBEhGuWwc8NnUpN96ji059zV4lRnNwKyzprFsCScUmZfEVvugbQEN4QKd
         NLLckxi53MzpNFwa9gj6aQkFmFrI9nLfcV7aOR287TzFSu25uR5LxTqZcubB9kGgOSy9
         4YXOi03EUC4B+19LAP7AiN9e8OICoLiAdvsvSJSSOXwtCIk8LuA4rgjKSpsG9oaVwTiu
         Z90Y6mO9O/w1jyJj6/I8tPwKTVGMfiae05DQK7K0aTuq/SBomapbw5Eqi9rjQLAxCN1J
         k2zymubmKjDR06ZO7KHEW7DRvBotasRW+4wlNWpPUqofzTKQd+eM2BcXqc0BMVrZtlBu
         T5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+UzxGgLFbuwNyyk2vK543G8vTHKDRFI5h4EAWVopLWY=;
        b=FgmPjb+21+68H0UCsx85nkcXvMsP3kqGpgmVTVzu25t6KWnIZWdUfmAWjDkqm32baC
         ILfpJUgbfR48C9EN92uKWAPc5NT5Ck8SlJ6seBw0E7n2YaAmi4gLuJ4152sefcHgFpxb
         Kp9VcD2LM019xyANxbOiJPX1szN83kLr7/AOEA3N6Skog1buQ/+EEvkA1sLEQuKpJ6S6
         ZBOAXnhoGnCSLFJQ5EfXrOQOVe/OfybYn2N9m6jwx8xz1pDyeG3yroQOQ0wfQ0kdyUb2
         FmbaZQN7C/4o6snmbe9lSONvcs7rT3mrDbKrQfQLv+oxtqmZi7TJ4nsUHkZwlS64ozr2
         4aMg==
X-Gm-Message-State: AOAM530oghx0JCDAj+ZpB7t9j1K9TWQun9cU2KeVBMmzTXxQvZ2ZoVTQ
	sjBZ38ONwPZQqUmoWWJfZECD+ufjlwRj+Q==
X-Google-Smtp-Source: ABdhPJw7aVpscLf3h6/roFFqSgeOEDs64JpqmH50jv7oOoH6nxaefXtUVz2ZNFcu5C/zraITUZYiqg==
X-Received: by 2002:a17:907:37a:: with SMTP id rs26mr3060587ejb.336.1616143513185;
        Fri, 19 Mar 2021 01:45:13 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id nd36sm3262248ejc.21.2021.03.19.01.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 01:45:12 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/16] asciidoc: update 9.0.4 -> 9.1.0
Date: Fri, 19 Mar 2021 09:43:54 +0100
Message-Id: <20210319084401.576728-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319084401.576728-1-alex.kanavin@gmail.com>
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dropped patch supserseded by https://github.com/asciidoc-py/asciidoc-py/pull/172

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../asciidoc/asciidoc/auto-catalogs.patch     | 53 -------------------
 .../{asciidoc_9.0.4.bb => asciidoc_9.1.0.bb}  |  5 +-
 2 files changed, 2 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-extended/asciidoc/asciidoc/auto-catalogs.patch
 rename meta/recipes-extended/asciidoc/{asciidoc_9.0.4.bb => asciidoc_9.1.0.bb} (91%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc/auto-catalogs.patch b/meta/recipes-extended/asciidoc/asciidoc/auto-catalogs.patch
deleted file mode 100644
index ca170db00f..0000000000
--- a/meta/recipes-extended/asciidoc/asciidoc/auto-catalogs.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-If SGML_CATALOG_FILES is in the environment, pass --catalogs to xmllint and
-xsltproc. Also pass --nonet to xsltproc to detect future missing stylesheet
-problems.
-
-An earlier version of this patch was filed upstream at
-https://github.com/asciidoc/asciidoc-py3/issues/61 so depending on how that goes
-this could get merged.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/a2x.py b/a2x.py
-index 2d7699a..582d809 100755
---- a/a2x.py
-+++ b/a2x.py
-@@ -57,6 +57,10 @@ LYNX_OPTS = '-dump'
- W3M_OPTS = '-dump -cols 70 -T text/html -no-graph'
- XSLTPROC_OPTS = ''
- 
-+if "SGML_CATALOG_FILES" in os.environ:
-+  XMLLINT += " --catalogs"
-+  XSLTPROC += " --catalogs"
-+
- ######################################################################
- # End of configuration file parameters.
- ######################################################################
-@@ -298,7 +302,7 @@ def exec_xsltproc(xsl_file, xml_file, dst_dir, opts = ''):
-     cwd = os.getcwd()
-     shell_cd(dst_dir)
-     try:
--        shell('"%s" %s "%s" "%s"' % (XSLTPROC, opts, xsl_file, xml_file))
-+        shell('%s %s "%s" "%s"' % (XSLTPROC, opts, xsl_file, xml_file))
-     finally:
-         shell_cd(cwd)
- 
-@@ -483,7 +487,7 @@ class A2X(AttrDict):
-             self.asciidoc_opts += ' --doctype %s' % self.doctype
-         for attr in self.attributes:
-             self.asciidoc_opts += ' --attribute "%s"' % attr
--#        self.xsltproc_opts += ' --nonet'
-+        self.xsltproc_opts += ' --nonet'
-         if self.verbose:
-             self.asciidoc_opts += ' --verbose'
-             self.dblatex_opts += ' -V'
-@@ -634,7 +638,7 @@ class A2X(AttrDict):
-         shell('"%s" --backend docbook -a "a2x-format=%s" %s --out-file "%s" "%s"' %
-              (self.asciidoc, self.format, self.asciidoc_opts, docbook_file, self.asciidoc_file))
-         if not self.no_xmllint and XMLLINT:
--            shell('"%s" --nonet --noout --valid "%s"' % (XMLLINT, docbook_file))
-+            shell('%s --nonet --noout --valid "%s"' % (XMLLINT, docbook_file))
- 
-     def to_xhtml(self):
-         self.to_docbook()
diff --git a/meta/recipes-extended/asciidoc/asciidoc_9.0.4.bb b/meta/recipes-extended/asciidoc/asciidoc_9.1.0.bb
similarity index 91%
rename from meta/recipes-extended/asciidoc/asciidoc_9.0.4.bb
rename to meta/recipes-extended/asciidoc/asciidoc_9.1.0.bb
index bb4248a5e5..523bf33f42 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_9.0.4.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_9.1.0.bb
@@ -8,9 +8,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=4e5d1baf6f20559e3bec172226a47e4e \
                     file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 "
 
-SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https;branch=main \
-           file://auto-catalogs.patch"
-SRCREV = "8de61a75572b5b8f90c1f87634aa3767472be7a7"
+SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https;branch=9.x"
+SRCREV = "9705d428439530104ce55d0ba12e8ef9d1b57ad1"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-- 
2.29.2

