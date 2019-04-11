Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8DF187D44F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 21:27:31 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id w15so8397015wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 14:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CvQQOI2VDS8EJ6ajybyLxwNLC/EQucUhXLY5H1YbdBQ=;
	b=oFQjA9SWYrhuufOWUt0pLbYXJeTRjbIJTYKDy654XPGHvERTS4752u20xz7PQoVVK8
	1b8lux3rDSxnTZr4r5EBceULiL5v6T1d8RrRojfFYA44fPD/Q9B76/WZ/75T5GB8wAya
	CcsM55aMAz27v5F9sVcU5sjP769213xu61UTlHNIJkZ8AQaSR9CizEIUZCkgb9vW7HZt
	IFR7oPR+OORN97DaSOyoa4Vb7F1j1x6nteNfsYXkRxcZsWjRl+Yow+NQpw2NposYIGeW
	wmR/wbtqfDDfc+a04JMrGaDoSM3RwSDDCUV2BBxXOwFunovA4PbRMoX5KbvzVlGJOsDU
	4lFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CvQQOI2VDS8EJ6ajybyLxwNLC/EQucUhXLY5H1YbdBQ=;
	b=oCapH2WjpoYlS83arrzmvSuMXiL9hPKYfUHIosvusVy6Bwg2Vq7Mx9THDpFeSSGEht
	SxShKC9+SqNJ7fhb8IWJhctf7nAywaZVSJkKwnU0SY4O0sQeRylzyDRYgBs11fEcoT60
	cfdmrb/h011dBbOTXmCYGcsTpB/vSXCKFJWUiKLYjHQ6F8mK0bMdLtsSzPfhFPMmntWV
	7WmYlMRNY5/u144H74dQMWTokdHCgR3ZskVDsEXug618hIBoyM8ZYwoQcOLLbyrSbOo7
	83To7Q8tpHcFPrm0zxX5cN3mOM8Gq+Fe0H7W4+nLb9nG2IbjT6ZQVkVAS2a8+0zdL6kv
	msEw==
X-Gm-Message-State: APjAAAXy1BO54CVQGGX/8MtufDYxUh/x8Se6KYoVXSyNWCG3qLHnaP6P
	Ah9G250wQ+ibllqW70tH45KcNQXt
X-Google-Smtp-Source: APXvYqx2kTROsR4iHZwzy6UmZxiZucVG0syD5Ru6kKLCgunj7zUtzHitmjp6FJVSi0w4TjejeH4qng==
X-Received: by 2002:a7b:c848:: with SMTP id c8mr8491238wml.110.1555018051983; 
	Thu, 11 Apr 2019 14:27:31 -0700 (PDT)
Received: from 81c5895b9d0e.corpintra.net
	(dslb-178-008-197-077.178.008.pools.vodafone-ip.de. [178.8.197.77])
	by smtp.gmail.com with ESMTPSA id
	c10sm46330516wrt.65.2019.04.11.14.27.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Apr 2019 14:27:31 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2019 21:26:30 +0000
Message-Id: <1555017992-64163-1-git-send-email-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/3] ethtool: upgrade 4.19 -> 5.0
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
X-List-Received-Date: Thu, 11 Apr 2019 21:27:31 -0000

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch  | 2 +-
 meta/recipes-extended/ethtool/{ethtool_4.19.bb => ethtool_5.0.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_4.19.bb => ethtool_5.0.bb} (88%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index beae5f9..b145188 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -19,7 +19,7 @@ index e891d91..600f8a8 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 4.19, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.0, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu])
diff --git a/meta/recipes-extended/ethtool/ethtool_4.19.bb b/meta/recipes-extended/ethtool/ethtool_5.0.bb
similarity index 88%
rename from meta/recipes-extended/ethtool/ethtool_4.19.bb
rename to meta/recipes-extended/ethtool/ethtool_5.0.bb
index 74e255c..76cdf9c 100644
--- a/meta/recipes-extended/ethtool/ethtool_4.19.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.0.bb
@@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[md5sum] = "a533db1d202724822c4ef297643fac12"
-SRC_URI[sha256sum] = "e8e88f5a79c78e542cd84fee60b67dbf29cee63e4760e8d61544fea74c761ad1"
+SRC_URI[md5sum] = "8998c9eb7e491b0aec420a807ce52ba6"
+SRC_URI[sha256sum] = "cc53a6d4d5643f8993ef20d6b638f88d9035529a9e777e222073c3a5b9237178"
 
 inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
-- 
2.7.4


