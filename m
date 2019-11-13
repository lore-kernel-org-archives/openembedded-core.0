Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7E07F43D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:19:58 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id q17so1563714pgt.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+/CXBhQCpecIks+XxezEawFtx0h7CBDDJcCmaPkmn6w=;
	b=qQCbLSAeqUBb7FEPH08+bvU3AZSeOVBcMgjIAIcqw4aBPrYA8S1BT4KYs+68IOJOPS
	PKxQhF+9/F0xB4pFzrd3lPEq2H4SWN4ksyb8v7CQN0w2MjrS8uSmsrr/vzy3BMPramBw
	DM4OM5J5KH1DaT/AHxnSlbt2YcDWDQBWlQEB19Wn9P0F1qQR2GZPSzj+rYRN5lZWpIWO
	WeDZDBM71f65+jgV6XBtaLdshkNTX9TzttcIjYE17eTVfOPLUxvGrcnlv1CFOOO/NH7p
	wmNyH22IMoXkCRLCeDyJl7PVUSMPFtyVzUva3Lz/aNez7E4BLIbo+a2KKlqLfmQCFBAw
	vhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+/CXBhQCpecIks+XxezEawFtx0h7CBDDJcCmaPkmn6w=;
	b=rHjUMka9z4Z1cdbyOv5+yTA3UNjP4WxtDJ1Pvn2wDelgaWXehVt+5i/SJ3X0OKW106
	dWwK/eJBrBRaFrHtISJvbGxP/iem6CZKMUhx0+v5TXPbWg2YfvCzuQcCD/7iZ4YKUncz
	Hhhq0lNS/HlgZN2WMhbM6Alqgl0kSp8DaSQdU70XM/J859UoqgBX8f4k6uaD2UROFZB3
	L5rIz/g8OGcj0ebFHGnMQzcnTVay57VplYyk3m4xwOVgx0wwFEP3kBeTmnW870s00rP2
	+c8XHGYwNLcNXwa10GBjGtSEMZS10lWiZ+UwUVNjDeJSq8FEg7jyupxHrXDevEjiqjaM
	yRdw==
X-Gm-Message-State: APjAAAXjgIx1AoFvltcFtDTcMQLJu9h1vhC6L1m3vaRUeDXNg0G3OyL4
	gRW+bOddnBV8iAIb9ya44rASlShk
X-Google-Smtp-Source: APXvYqzeffuEYQiUZZ8Lqp0gwYfdqMECpqB0IdSyW7r1Oe2BQp73c4aPApo3BYT60eEi6VYGQEy7/g==
X-Received: by 2002:a63:1b5c:: with SMTP id b28mr4270488pgm.69.1573658398892; 
	Wed, 13 Nov 2019 07:19:58 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.19.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:19:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:15 -0800
Message-Id: <aa88f0f3b7f70ddc88f187c91860505b256aeda3.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 12/25] libxslt: fix CVE-2019-18197
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
X-List-Received-Date: Wed, 13 Nov 2019 15:19:58 -0000

From: Joe Slater <joe.slater@windriver.com>

Use patch from upstream after 1.1.33 release.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libxslt/files/CVE-2019-18197.patch             | 33 ++++++++++++++++++++++
 meta/recipes-support/libxslt/libxslt_1.1.33.bb     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2019-18197.patch

diff --git a/meta/recipes-support/libxslt/files/CVE-2019-18197.patch b/meta/recipes-support/libxslt/files/CVE-2019-18197.patch
new file mode 100644
index 0000000..5f2b620
--- /dev/null
+++ b/meta/recipes-support/libxslt/files/CVE-2019-18197.patch
@@ -0,0 +1,33 @@
+libxslt: fix CVE-2019-18197
+
+Added after 1.1.33 release.
+
+CVE: CVE-2019-18197
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt.git]
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+commit 2232473733b7313d67de8836ea3b29eec6e8e285
+Author: Nick Wellnhofer <wellnhofer@aevum.de>
+Date:   Sat Aug 17 16:51:53 2019 +0200
+
+    Fix dangling pointer in xsltCopyText
+    
+    xsltCopyText didn't reset ctxt->lasttext in some cases which could
+    lead to various memory errors in relation with CDATA sections in input
+    documents.
+    
+    Found by OSS-Fuzz.
+
+diff --git a/libxslt/transform.c b/libxslt/transform.c
+index 95ebd07..d7ab0b6 100644
+--- a/libxslt/transform.c
++++ b/libxslt/transform.c
+@@ -1094,6 +1094,8 @@ xsltCopyText(xsltTransformContextPtr ctxt, xmlNodePtr target,
+ 	    if ((copy->content = xmlStrdup(cur->content)) == NULL)
+ 		return NULL;
+ 	}
++
++	ctxt->lasttext = NULL;
+     } else {
+         /*
+ 	 * normal processing. keep counters to extend the text node
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.33.bb b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
index 92d3099..f93c253 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.33.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
            file://0001-Fix-security-framework-bypass.patch \
            file://CVE-2019-13117.patch \
            file://CVE-2019-13118.patch \
+           file://CVE-2019-18197.patch \
 "
 
 SRC_URI[md5sum] = "b3bd254a03e46d58f8ad1e4559cd2c2f"
-- 
2.7.4


