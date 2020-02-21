Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id F1645615FA
	for <openembedded-core@openembedded.org>;
	Fri, 21 Feb 2020 02:53:56 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id y1so237456plp.7
	for <openembedded-core@openembedded.org>;
	Thu, 20 Feb 2020 18:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gAfGDDpb+X3vEkkwXJDZdtROWPuDbT+/GLP416MOIKo=;
	b=nznvo2qRZ6zC8TWhMuFohFTry42HbPe5eL4SzqfH2g0vraMYDza0o7Ad1wewIw6RWT
	f/5kz3MX/nZiSpI6DT+voIbUlZYEwrX/bo9zdqTgzdp8rrUIT70H+xp45y2KYv1JyHp8
	JKHxlZh/mqdnPuW4Q8gUgDaBK23UD3wPMXyleZOeljVb+d8IOr9oaKPgV2QBBQyGRqns
	yB/5WLZKdIn7x9ZXs8j/iffL7RLK5y9AodzyICLJWnCaibpkbxsFsEmAMamOPg/vQ+t+
	Ez+ZLarLPLz4FS3JC6k4IYBE+K0Rh9KO5qajzUFFNfZ5hGq5rhkCu/2a20nqCPPzMv7n
	6itA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gAfGDDpb+X3vEkkwXJDZdtROWPuDbT+/GLP416MOIKo=;
	b=Zvn4aOELf+0Hcgjb+B0exZrt6myq8M5jLLf294fm6QPMlvijj9uwASj8J9uufbQJLq
	FDMc6VkO5D/3tpvQrdU4qpaE4Q6ZdywAwrUfaHxXpjFWPAhV2uG7H9iwobuBFDyRJq68
	9+WcegXH5Qx6k6ivIt1bdZfa3vUzwXjFC5zO5fh7bHoBIZtW7uciFcIyZz9x13LG8qBd
	HXb9JQ0V4rO07KVorbRxvrLBMwR0EZ3erMI3Ply5dk9jG1AYfViqSINn1DAEH4WUImib
	VaQF/EEx1Qaql8fvEcf1yVt6vpV9nYy/vYNTkQXv0wQ8hulsxm8n9BffKkEqSM/ADzTB
	rH7g==
X-Gm-Message-State: APjAAAWMvl7otJXYTymwnxJ5IMsHwsvnSYbfP0nqd069C/zqudSm4JZ8
	V9vZHFnqlIpdVAgQgyPxSX4g5g9l
X-Google-Smtp-Source: APXvYqxiVUP4+6KMGmcXgPc++w2D0IncShEy3ctYa0T7utlPV9s00kNkikeJtvVsze6xiKiPgNEo2w==
X-Received: by 2002:a17:90a:5285:: with SMTP id w5mr332592pjh.77.1582253636870;
	Thu, 20 Feb 2020 18:53:56 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:88be:17f0:935c:9e35])
	by smtp.gmail.com with ESMTPSA id
	y10sm925320pfq.110.2020.02.20.18.53.55
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 18:53:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 20 Feb 2020 18:53:20 -0800
Message-Id: <2be6ab4249c4f49c9ffcd9bb8fea964c8c5d449c.1582253544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1582253544.git.akuster808@gmail.com>
References: <cover.1582253544.git.akuster808@gmail.com>
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
X-List-Received-Date: Fri, 21 Feb 2020 02:53:57 -0000

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


