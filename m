Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id A3CD97D007
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 17:43:55 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id q26so42699034lfc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 10:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=zQRgzw6eQJ0XYAdwwwFnR20CNO/3edJqtSLbY83ujAc=;
	b=i9M+1vI3J46/xYLv39dAo/nbikiqgkS8MarN4EM31f9IpWhXOpiwaI3bpYhSKYLdmP
	lMgOg9Eus9PUDHX/dDdDYgPWNtWyk6k9Vq1p+XIRk0sBPi9tFQQ+mXeVG5Dpa63Twsxa
	3KlJH3+4k99STwx4d5oPJDTWcUfh+LZttPfo7glP8CsyAcWZEUc7O98bv72DNEGEmz31
	m9GOfw/H1qWaKbyirm8yzEQBOqcUZp1O31XFDD/pBmEta1INzRiGMTBsjEADSLTnzWl+
	Iysq6i9qs/ymUgMVpCjTegdT2o2UCJeqPu/fVtj96bOrdus6XuANn+RlITm9XbqJHKk8
	QBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zQRgzw6eQJ0XYAdwwwFnR20CNO/3edJqtSLbY83ujAc=;
	b=irlQDRmdFA1voE4GFzv8Pl4wZ0+mjzNjNeXC2zVtICz8SuOu+GLBzS3xwNuwk+G1X0
	TIKkvBA6u1GeJ+9FiKcREX2JNUZMiB0pV2y4L0OeURt6tRLwF/WAiVYAZS8kN5Mrb857
	wV8ZC0lK9cTwsF/n4dQEyvoOVIlBzgB8nOM8mtSSVa6D35sKOL3Vd5pOvOB5CTNrqiQm
	Thw5wOdyQFtkQEmbXAQkXsuK9TzcIiE8smOB2FxdRboydWCGEXZ7HgYdz/uPwUgFsrCK
	7iFL/HmFgTCdMS1AeA4fK+EwSuwzN67gIaAbGzPCyl56g9mtQUdiMqKq+YtXkX6bUm0a
	zuqw==
X-Gm-Message-State: APjAAAVBJVgPpdmUwCK9lGRVlrrJUs7aanHhmfBA6mh97GgnActxhUTI
	vekBDzfM8At5TE+VUxfaqPjlm2xB
X-Google-Smtp-Source: APXvYqzMb6sm1XSuREYrUwRBvqpvP23YLhmGeUP4q2RXt/pzmE5DrAt62tu+lN1CtuAbJ3UcE4pxzw==
X-Received: by 2002:a19:8093:: with SMTP id
	b141mr53730101lfd.137.1564422235667; 
	Mon, 29 Jul 2019 10:43:55 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	l24sm13021051lji.78.2019.07.29.10.43.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 29 Jul 2019 10:43:54 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2019 19:43:48 +0200
Message-Id: <20190729174348.21971-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ethtool: update to 5.2
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
X-List-Received-Date: Mon, 29 Jul 2019 17:43:56 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch         | 10 ++++------
 .../ethtool/{ethtool_5.1.bb => ethtool_5.2.bb}         |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.1.bb => ethtool_5.2.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 7a0e38a394..7c5d4f956b 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 2ca4c2492c4a06b28012e3e1033d10aa48f153b4 Mon Sep 17 00:00:00 2001
+From f8333f7759717b4d163cfe8e3ef8861c5a667324 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -9,16 +9,17 @@ serial-tests is required to generate those targets.
 Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Upstream-Status: Inappropriate
 (default automake behavior incompatible with ptest)
+
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 2941a65..b0a1896 100644
+index 2127fdb..4910e6f 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.1, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.2, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu])
@@ -26,6 +27,3 @@ index 2941a65..b0a1896 100644
  AC_CONFIG_HEADERS([ethtool-config.h])
  
  AM_MAINTAINER_MODE
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/ethtool/ethtool_5.1.bb b/meta/recipes-extended/ethtool/ethtool_5.2.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_5.1.bb
rename to meta/recipes-extended/ethtool/ethtool_5.2.bb
index d379d93bcf..e9759bd21b 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.1.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.2.bb
@@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "5d3aad86aec055348a37e867695a744a"
-SRC_URI[sha256sum] = "4edb1fa4d7cf5667a5958d4213f61609f96d02cda90d2b6ec440561f8f8ffbf2"
+SRC_URI[md5sum] = "79cff0d4af62b030ad28be90414b5c4a"
+SRC_URI[sha256sum] = "8ad6cb30f6e1767d9d23a5cb5f606f3b51f83e85ebf0153c1506194f6709e90b"
 
 inherit autotools ptest bash-completion
 
-- 
2.17.1


