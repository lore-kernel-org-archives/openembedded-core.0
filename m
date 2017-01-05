Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 28DEA71B2F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 19:46:36 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id u143so3178376oif.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 11:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RZ8HMqufMzxjqbumr+Q9SNLNGPVKD94p8DWjta7DZMw=;
	b=m35Y+mxpA/jT2Cl/g5G003yYITn9SdEQlGorl936WBrSgDdGGKjydfGz6jEqm+78ny
	qUYCa3ONSEkMsS+lP8/HJQAuAoT3hkzgw648/pRJo0LkNORh7LSVeINOGiQWhueEBnbT
	rNMVWbd14uo/YCXHeQ3a2SswXvzmAbQcSA1pGwQrc+cqNvB7V6XvvV3wfhUOZFoHJF6f
	cJdavEfDF3NXebiypckKP8TmYsIohw5+AmQyT9JGwo7UbcWIllVsGD6Yyg20VKpPD6Gb
	/Vzhkuh4FuYyqtiG4p5MbkfUNUbBBCWq2eZsoj5y5yBwjosig2srmlZ4XzlEVjpKwDIt
	rGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RZ8HMqufMzxjqbumr+Q9SNLNGPVKD94p8DWjta7DZMw=;
	b=eNbtjXafOEEPksLEfNnlQPp8jGw5+iFQdSAm+hbaA80CCPVejVtfGPdZciE1PTUniP
	k3/CRqXNJ4yu+5mi53xpMWpTiMWffbjDuQLqoG+SPW5TECu5kTtsB7DWxqppBqnD53mb
	iIQ1pUsdQLzuRvAot4HnbCMmHRmElVTr8J8C5YSvp3eyX2pmX1sTNOxi8iIzmagMjkUn
	1Gnb93Sf1tJBoPlArTF11LIqB+uDK/ScCQfUQzPuvxaIUbbW5IdqVPhlulfMrEp7uGBB
	R8zC/BDTkZIKTgRuBi4+vg/8WjD5+gJ+bN3HAdNTAfAN5aWCUh+0hX7j5tnzn4mLJo3a
	XQMg==
X-Gm-Message-State: AIkVDXJiZeV5LAUfpPgRTh+1nhPBkh7mBE/8AG4V047+30Mk6zdjY61x3N4okv32qdgKrw==
X-Received: by 10.157.35.195 with SMTP id t61mr33031638otb.263.1483645597275; 
	Thu, 05 Jan 2017 11:46:37 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id d10sm153783otb.4.2017.01.05.11.46.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jan 2017 11:46:36 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2017 12:46:16 -0700
Message-Id: <73bfbba6b75877dcfd492f404b0cda2f0d386205.1483645446.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1483645446.git.chris_larson@mentor.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 04/16] lttng-tools: fix for x32
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
X-List-Received-Date: Thu, 05 Jan 2017 19:46:37 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-kernel/lttng/lttng-tools/x32.patch | 16 ++++++++++++++++
 meta/recipes-kernel/lttng/lttng-tools_git.bb    |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/x32.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/x32.patch b/meta/recipes-kernel/lttng/lttng-tools/x32.patch
new file mode 100644
index 0000000..b1bb8e4
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/x32.patch
@@ -0,0 +1,16 @@
+Fix build for x32
+
+Upstream-Status: Pending
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
+--- lttng-tools-2.6.0/src/bin/lttng/utils.c~	2015-01-26 18:17:15.000000000 +0100
++++ lttng-tools-2.6.0/src/bin/lttng/utils.c	2015-07-30 19:45:25.632045712 +0200
+@@ -130,7 +130,7 @@
+ #define HAS_FLS_U32
+ #endif
+ 
+-#if defined(__x86_64)
++#if defined(__x86_64) && !defined(__ILP32__)
+ static inline
+ unsigned int fls_u64(uint64_t x)
+ {
diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
index 0d2bd00..29fd75b 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
@@ -31,6 +31,7 @@ PACKAGECONFIG_remove_libc-musl = "lttng-ust"
 
 SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.8 \
            file://0001-Fix-error.h-common-error.h.patch \
+           file://x32.patch \
            file://run-ptest"
 
 S = "${WORKDIR}/git"
-- 
2.8.0


