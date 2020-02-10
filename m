Return-Path: <rahulchauhankitps@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5678260CE3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 18:49:37 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y1so3171434plp.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 10:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4w7c764Xm8OoxtFmZJOBtR7Rn3a8UR5ozOqKzQ3O9Is=;
	b=ExP7IlmBQAlZyZT0zx/IHKeCo1LcxB4rihj0z5osMr5OYSzo2YEsJauF21MCYN4pYN
	m0o21z5J3qlpWJlIJw5lr16lWOxs7atnVITP7aDJKYdL9ahdUz7Z9RFnkdq7viO3aI22
	a5AhKdqBgR8xlAb1BvoXGEJkMcLqe6uYzFVYgCIAjwhdmYkOJPa+aJIGdXuniNAX66Hp
	NmE6Ml8XHttd6nmKeNiv0UN8nkHv4iniUA0YMMsShdyYkodvOutIYP4TKFHvyK5BA1Ob
	RIg6cN5uoxrKvmERgi4Dh9U7BE4cXx5I3P3tdNbowUC4dl9MqAOPb0qgKE89FqeHJEeT
	T/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4w7c764Xm8OoxtFmZJOBtR7Rn3a8UR5ozOqKzQ3O9Is=;
	b=ixGZ4akC/f1TUu5WsaDI16+pfvredHOdviGZJd+EpASiQPZ9V/AcGNVG50Mksjj1kP
	SkSe4NaR+tZVPwloDXcj2Lx1Y4eREdP6pqRGW8PcBkvIJE5sj8QA0C6gChz4FEJVZIf2
	T71j0MR140AmV75FrSl8mbOVIhrIaMXAuR2gBJYWEmyIuOPgXIGEGPEzfRfSr4/6xxPH
	u3Jt+EChFnYove2nrhEVhPScuoKz+FfYgDoxwT2cCA2kxzUEGBVGnKkif+CbCxHcOCyL
	zWlq/Id8sGv/k/nsWrNt8PZtQtYrkcUApEowZHcnXX2WfTHqdQb1Tm/I/ync+Q+tCsaK
	hw+w==
X-Gm-Message-State: APjAAAWmx+RmqevE+aXEmVxFybMxCaIdWMmYvX+cGgtKYqgeVxzTlqVH
	335JSYNO/tMNv4IeCcf3YwhJLSuY
X-Google-Smtp-Source: APXvYqw+Mr9OLbIMdwGFbbTFEpSEAqW74eAsAYHwTnioCNuv5sedusAtraz+wRXMBSuNQ0+GEtUbeQ==
X-Received: by 2002:a17:902:820b:: with SMTP id
	x11mr14097388pln.196.1581360577734; 
	Mon, 10 Feb 2020 10:49:37 -0800 (PST)
Received: from localhost.localdomain ([36.255.87.199])
	by smtp.gmail.com with ESMTPSA id q29sm893253pgc.15.2020.02.10.10.49.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 10 Feb 2020 10:49:36 -0800 (PST)
From: Rahul Chauhan <rahulchauhankitps@gmail.com>
X-Google-Original-From: Rahul Chauhan <rahulk@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2020 00:19:21 +0530
Message-Id: <1581360561-30532-1-git-send-email-rahulk@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [warrior][PATCH] libxml2: Fix CVE-2019-19956
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
X-List-Received-Date: Mon, 10 Feb 2020 18:49:37 -0000

Signed-off-by: Rahul Chauhan <rahulk@mvista.com>
---
 .../libxml/libxml2/fix-CVE-2019-19956.patch        | 38 ++++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.8.bb          |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch

diff --git a/meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch b/meta/recipes-core/libxml/libxml2/fix-CVE-2019-19956.patch
new file mode 100644
index 0000000..43c3589
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
index 62643bc..67c2d4f 100644
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
2.7.4


