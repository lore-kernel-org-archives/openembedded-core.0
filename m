Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA4B6080F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 19:53:26 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id 65so71004426pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 11:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=rKbWLZPE66JPu00HhQIJEyfkat8RlF7/R5VZF9owMqI=;
	b=Rrol748cbyAuTkip3xdL2xjuzpaP3WDjEbEP9uaO7sCL4t5xLL9O/VKX0KOpXGOxt0
	mYFqWVPeOQ9uKSOsFP9q1ujMVcLegpiUXcSG5nH2sfMFJutePnut7Knbkf2e2wuCWlsh
	akepA2ZVyHCQ4eHeIP+vrGDC6UCMO5roNhJ7MmBUKDt+HvIiaskIez46Ca0u+Vyg/uqD
	Q8RdJQsc3PYaUyPESjWFzVqmLwzcmKoZ6UvHiujlqsvYYNZg//YxQNJwQQsTFeAnrj5a
	nbQQagyJYKgbkUJrQpwKQ1TT6qzOgBzm3p78lQ9BbZNTNke9DtPUcdA9+1gG598SKK0X
	BMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rKbWLZPE66JPu00HhQIJEyfkat8RlF7/R5VZF9owMqI=;
	b=hvzqbUrzWZsZqHWtz6DVAmI0GaRvq/MagtiMaqCvBh6SX6F8IMFK2J+/P1ZLCQ9YJM
	u9gamut27jvzmAGocrEe1TYGywz8VbQL8aRbGza47sv7QPfztyE0CXFURC6EQrX87iJa
	O3kkiAR2t2sKtHlSBw5REQYdlLty/y4QN/xa12O3VVB4W9ToGR3q7MToXCuTe6IxLmXs
	apxzDm9YqrqR95fe/xYsXxF8GujrPU/ZDjm4dVy7KZoxJ7pN5DH6kSqMiuhSrZnGgjVg
	VxIKtCUnBA1gzxwk6zxl+ePkfkCLgA7yXcpJNL1UoanS7zvb4gAmoAZctQ+UGK5cTIyv
	T6Cw==
X-Gm-Message-State: AG10YORRlKnBMj8Y0aMqHmohQz6Ty7A6PRVfyt2oiGZSQ0J6K4qDfFscAEzl4swX7qW7MQ==
X-Received: by 10.98.75.20 with SMTP id y20mr7297481pfa.32.1454270006979;
	Sun, 31 Jan 2016 11:53:26 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	q136sm37670536pfq.66.2016.01.31.11.53.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 11:53:25 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Sun, 31 Jan 2016 11:53:08 -0800
Message-Id: <ca181405733aee400ae522deea8b1062b350f3f9.1454255704.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454255704.git.akuster@mvista.com>
References: <cover.1454255704.git.akuster@mvista.com>
In-Reply-To: <cover.1454255704.git.akuster@mvista.com>
References: <cover.1454255704.git.akuster@mvista.com>
Subject: [jethro-next 2/8] libxml2: Security fix CVE-2015-8241
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
X-List-Received-Date: Sun, 31 Jan 2016 19:53:28 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8241 libxml2: Buffer overread with XML parser in xmlNextChar

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  1 +
 .../libxml/libxml2/CVE-2015-8241.patch             | 40 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index b9ce0f0..bced950f 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -35,6 +35,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://0001-CVE-2015-7500-Fix-memory-access-error-due-to-incorre.patch \
            file://0001-CVE-2015-8242-Buffer-overead-with-HTML-parser-in-pus.patch \
            file://0001-CVE-2015-5312-Another-entity-expansion-issue.patch \
+           file://CVE-2015-8241.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch
new file mode 100644
index 0000000..89a46ad
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch
@@ -0,0 +1,40 @@
+From ab2b9a93ff19cedde7befbf2fcc48c6e352b6cbe Mon Sep 17 00:00:00 2001
+From: Hugh Davenport <hugh@allthethings.co.nz>
+Date: Tue, 3 Nov 2015 20:40:49 +0800
+Subject: [PATCH] Avoid extra processing of MarkupDecl when EOF
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=756263
+
+One place where ctxt->instate == XML_PARSER_EOF whic was set up
+by entity detection issues doesn't get noticed, and even overrided
+
+Upstream-status: Backport
+
+https://git.gnome.org/browse/libxml2/commit/?id=ab2b9a93ff19cedde7befbf2fcc48c6e352b6cbe
+
+CVE: CVE-2015-8241
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ parser.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+Index: libxml2-2.9.2/parser.c
+===================================================================
+--- libxml2-2.9.2.orig/parser.c
++++ libxml2-2.9.2/parser.c
+@@ -6999,6 +6999,14 @@ xmlParseMarkupDecl(xmlParserCtxtPtr ctxt
+ 	    xmlParsePI(ctxt);
+ 	}
+     }
++
++    /*
++     * detect requirement to exit there and act accordingly
++     * and avoid having instate overriden later on
++     */
++    if (ctxt->instate == XML_PARSER_EOF)
++        return;
++
+     /*
+      * This is only for internal subset. On external entities,
+      * the replacement is done before parsing stage
-- 
2.3.5


