Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id D291A614EA
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 16:00:56 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id z7so9401156pgk.7
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 08:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gAfGDDpb+X3vEkkwXJDZdtROWPuDbT+/GLP416MOIKo=;
	b=Wtj2lW+QtkFkussBlNm98FfcaB9ImaaYSH74tzEa6SVrKR1DKQP+yCgaRixYCnA/Ut
	deHO879ZJ4dzjzzVGzlvpEwCCpxZA8R9YrLZaDgTgsGvo5Y03xMcYGgU0Fde92FNj2Qp
	+R0iJR4KNttKVdaPBZ8Q8yuF0yfZA8f7cbpGsufCy9t/jrnskuLt4qU11WVGGjcgV8oC
	NqYsEbdkZ4Mj1kD6JYlQG2z1qtL1JyqBHrkrMQ3CGoXuhuYHgAXM0ySXzC8wgnczOubG
	yiE7myXEuptaeer3Byd6iZYJJwajuo8/aeupQ221V08v9ytsaEK4O5UlVyGif7OYH7AN
	um1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gAfGDDpb+X3vEkkwXJDZdtROWPuDbT+/GLP416MOIKo=;
	b=Qi2BJIUldoFDdtJkXFY/MekPPmJqrpVslTqVzjLpq0pt51Lzlk9Pn2spTcIu+LUJS3
	J8MK2v5xErD8mIiFKlBYIBsv1C8NyuymgPN90MTQa3YRVuHi9PNzCwBRo1h7kVEcj5a1
	SWCqyPlUG0ciUFdb8agGAKEoXETvMu6iY37cjneS3Mm87UsR9itFZU91KfrcJXO/et+n
	HqLqqKKlNcWcuhxQjZRVjmeWXh5tYvvDj1EQs4F2P3rZTGoB1V65p+qOos7vUyevIVKI
	f4JqHR29+gRItvqOnUPdM1hBprQrrt3di0HHl76kivHu7e42Hd6HSioTYrmzluDBvSJm
	36CA==
X-Gm-Message-State: APjAAAUAFyOV5Ei3yNFpSrrXiAA9RrmQuQ5SBgkItRZ0h6W8anhR5Rqi
	8RdCn7uuceTWr6maZ6TixDiVapkT
X-Google-Smtp-Source: APXvYqxAG9j7DbMEhHRZTX96gPF/7gicFr7BbF+JDIFGHEqACrqVGHI17GuZs5qNITQMYhcF3wHiOw==
X-Received: by 2002:a62:1dca:: with SMTP id
	d193mr17576224pfd.140.1581955257468; 
	Mon, 17 Feb 2020 08:00:57 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:9144:9b3e:b52:fa29])
	by smtp.gmail.com with ESMTPSA id
	a22sm928041pfk.108.2020.02.17.08.00.56
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 08:00:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 17 Feb 2020 08:00:39 -0800
Message-Id: <2be6ab4249c4f49c9ffcd9bb8fea964c8c5d449c.1581955142.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581955142.git.akuster808@gmail.com>
References: <cover.1581955142.git.akuster808@gmail.com>
Subject: [warrior 01/14] libxml2: Fix CVE-2019-19956
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
X-List-Received-Date: Mon, 17 Feb 2020 16:00:56 -0000

From: Rahul Chauhan <rahulchauhankitps@gmail.com>

Signed-off-by: Rahul Chauhan <rahulk@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libxml/libxml2/fix-CVE-2019-19956.patch   | 38 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.8.bb     |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch

diff --git a/meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch b/meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch
new file mode 100644
index 0000000000..43c3589d2c
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch
@@ -0,0 +1,38 @@
+From 3cd2b25ddb04740be2880cfd78d60038452228b1 Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Rahul Chauhan <rahulk@mvista.com>
+---
+ parser.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/parser.c b/parser.c
+index b7ecd65..491f5c9 100644
+--- a/parser.c
++++ b/parser.c
+@@ -13899,7 +13899,8 @@ xmlParseBalancedChunkMemoryRecover(xmlDocPtr doc, xmlSAXHandlerPtr sax,
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
+2.7.4
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.8.bb b/meta/recipes-core/libxml/libxml2_2.9.8.bb
index 62643bc764..67c2d4fafb 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.8.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://fix-CVE-2017-8872.patch \
            file://fix-CVE-2018-14404.patch \
            file://0001-Fix-infinite-loop-in-LZMA-decompression.patch \
+           file://fix-CVE-2019-19956.patch \
            "
 
 SRC_URI[libtar.md5sum] = "b786e353e2aa1b872d70d5d1ca0c740d"
-- 
2.17.1


