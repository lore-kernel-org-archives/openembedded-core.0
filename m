Return-Path: <rahulchauhankitps@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 010B060C85
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 03:07:11 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id n7so525036pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 19:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4w7c764Xm8OoxtFmZJOBtR7Rn3a8UR5ozOqKzQ3O9Is=;
	b=cE8ERAfk67L23jpR3uFFRW4t7Pk6WhFXEF5WLoZ4e2ZvPOrYfedSzF6//JPmEJatNw
	rNJIgwNS6wYF4bziEkpeXRiP79gZ+Yh9Za+gRa1UXdoQwjDX9kACQydTAz3MJfL8CByj
	KsJIOpamTr1s0PXXqwwBlx2xk4cPCK/m5p+SoA0OwM1jKke7G9FDcbmhL2nHqBidpIY/
	L1yt3eFgjDXLiodSAiAnA8LacFzBS8yZYCh07lDMlPe5n0VsomLpRsthUaIKXFaSIjKk
	5gbpD/g+EI3HDi4MPKcqko952sITJMzfeR8L/7IOr/bBdCKgihpBFCjG1aTjocBnh6vD
	LAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4w7c764Xm8OoxtFmZJOBtR7Rn3a8UR5ozOqKzQ3O9Is=;
	b=YlkWUBPXn7p3lHYCTh+rJaVxyZf6hxXescYJKOOeQAQ4kBcIDLyZtZsFHH6ztu28Di
	D1NAhX8Aqi43WJkB+Kcqk0RmfZ+C2htGSAOFxtq9rXIOgbm8WYgB50Txl31t/G6LA9kH
	AE+Iyigf3knU+GbfSNptV5mGPr1kHrhlj8DSy+mh76Q2Hb9qWIFF8Vu/ynXJ65kM9MqP
	3EuLaPOgA068uCNnyDiMvT0i4qAfJT56lZGETPdvw7bgFc4YZYkqGOXf1QsTKgXGQp+z
	kYX0fCMqbjRemHhDGOAd11I9POGD7pHv+dW3Uw9Cd1AznmQzgshh3SQo2DF5hUVxd3f3
	tEqg==
X-Gm-Message-State: APjAAAVlEvCcFkfmBGJB7TyVeydpdEX2KcFT7iq29fTLLzFx38i7599h
	8vS28HhLpxuHwh1tPp200QJO19ER
X-Google-Smtp-Source: APXvYqzd/vkmiDKlM1FdZmKTlmtODfw87eNy6o/ZqohicZpRPFq2M1UfyCkVtmc4ayFw199JpQKocA==
X-Received: by 2002:a62:cd8c:: with SMTP id o134mr7397265pfg.22.1581044832535; 
	Thu, 06 Feb 2020 19:07:12 -0800 (PST)
Received: from localhost.localdomain ([36.255.87.199])
	by smtp.gmail.com with ESMTPSA id s21sm751972pgo.63.2020.02.06.19.07.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Feb 2020 19:07:11 -0800 (PST)
From: Rahul Chauhan <rahulchauhankitps@gmail.com>
X-Google-Original-From: Rahul Chauhan <rahulk@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 08:36:22 +0530
Message-Id: <1581044782-4481-1-git-send-email-rahulk@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [warrior] libxml2: Fix CVE-2019-19956
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
X-List-Received-Date: Fri, 07 Feb 2020 03:07:12 -0000

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


