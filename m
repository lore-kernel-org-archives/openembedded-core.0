Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6CC057F7B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:27 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id k13so1605110pgh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LZTuZiBBczfMDMdkF8Mzt0B4BasNgk56UpsqjEpBPqM=;
	b=ddaheLcIDFBJQTjNJGhIALQpP4WbuW4ObrzYiTVVKkRaRJ73BxkGKXkHyKmrBG3oKs
	nt/NUMiGnqJoNg6xSpG7vrMMAtZNeftTrZwSSbzrXPH0r0n77zkOsxhviAkaDjWVy5kS
	YvjL/BjZlRxqz477aMlKeZ+0hMPbYmtOzeaHApVuQ8O5+26N2VTsmgjsrfRpBqdzoDAM
	Dewmq625NR6MJUHXQNqG4PhANMa9fIqy0NP3L/GTaPrOXkq8e7/Q1pgw/kNzLLO9br0C
	gdSptobGx4nTf0nuGG+MOr5O+RQBaLasFFPqyy32tLyMckni1EtQcz5MSQ5G+4efLE4f
	IEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LZTuZiBBczfMDMdkF8Mzt0B4BasNgk56UpsqjEpBPqM=;
	b=XO18Hf8hQNm3JauOrp63q9EB9gshxelHajNzM6ktLe7XFqVUS0ANsZAZYyq4ntDnvM
	c1ehG1yuYBjWiNrtFrS0/t6KX/kAZSvIngUe8+gSBROwsiQJu2VPEoTo3+Ycs0BlwnLc
	yfyPiaaqcO66ICvSOR7KsT0N1FQ4vqR/+dHXPhX1sK5orebzC8XPx3fIuqQVUZvLi+Vo
	gW4fWmotVHH2j8gICBof4N9QevRO7mGnRa7mW8/q9cOqphkcJbpwSg/EPzA9MVgJNQbp
	2A750k9ZcRWmJsiKVs21aJyZuAAYY0SsAT0ZefxXienvOdZbQbDe8nhKlH5qsSb2Ut/L
	tz2g==
X-Gm-Message-State: APjAAAWGueMVCthE3n2P1TwFjK6G400TMyjvzM9PhXgRnLsV5CCio7p+
	ARVyt9+A8tzi6A4oxxFg7haKmodE
X-Google-Smtp-Source: APXvYqx+tWAuRTgxZgIsP3QgDXuDuXOagxW4rLTZEoTMTgNFpO292dJXGOkMc2bdEF1iWTJHMMO9GA==
X-Received: by 2002:a17:90b:4386:: with SMTP id
	in6mr5760975pjb.33.1573659148332; 
	Wed, 13 Nov 2019 07:32:28 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:31:45 -0800
Message-Id: <27969c5987d974ff10e5d0f00415b8a8576143e0.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 03/31] libxslt: fix CVE-2019-18197
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:27 -0000

From: Joe Slater <joe.slater@windriver.com>

Use patch from upstream after 1.1.33 release.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
index abc00a0..9f268e7 100644
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


