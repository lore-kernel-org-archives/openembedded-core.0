Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED08FCF0458
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:46 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.9230.1728452979019762894
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YPoqYS6X;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452985; x=1759988985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3IVEUQP8zSG98uHAyXKSkQeLYo6Ci9CRDuimJI4V0Ws=;
  b=YPoqYS6XrV/zWZ092PrbLQZhmDZK7NZhvAROyrvN/ZFGCOmHAf2d3oKY
   7lAPmWa+HZvyI2C5zfCvIUVf7997z6xJNT8gidsRQ3r5OyoJx5qnbLqZv
   CSq8aJNzm8sSReEBACNs/mFH/9XIbbYk7GU9Y9kTGTrWNaPM74NOhPhxE
   /DAJ1LsfsQvv3TAQ1oAvIiXVVL4tEbOetv42Wky0ARqckw4/jILjcM0LL
   WZbRBKENDs5XZGz10Dk8GXZr4UXWjHGX96AJdC00IWrhuWQyT5eVO8rHM
   K4ya+WppHJ2jpBsBfetNCtCqsx2VpQrjj3fLvlpHoGMh2W6tOYc6X9vij
   A==;
X-CSE-ConnectionGUID: 6Vj+CGVST5u43EcF9HG/fw==
X-CSE-MsgGUID: rSD2hOm/RWewYSrZuA7o4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="176256749"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="176256749"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:44 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 54383CA1E5
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 143BAF670E
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A844D20081319
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5543D1A000A;
	Wed,  9 Oct 2024 13:49:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/26] python3-pycryptodome(x): upgrade 3.20.0 -> 3.21.0
Date: Wed,  9 Oct 2024 13:49:06 +0800
Message-Id: <1728452955-25051-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10--2.609700-10.000000
X-TMASE-MatchedRID: k/L/ofNtQd2dsbtv2+OMzH1zro62qhdCN5dqZcIK7Vg0kS9L8/F4KLQt
	i58C3mP/KqrQ7lLcMnwt/DPtuO0OwdzZGrP764sOP0HVIeixJdDBOVz0Jwcxl0fyM5VfgjG209D
	6Rw2zIrMPNxz2EvpSIIQdazR8uTaor78SC5iivxwURSScn+QSXt0H8LFZNFG76sBnwpOylLPx41
	tVSV6BymmS1ciHGQ9r8t3XkQs6vz5Idx1SH+bXR7kCIt02cS+X/bCv8nXRA1kMSwfVqLxzbgxpB
	/xdAt0cmY2LTFFQdECIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205330

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb  | 5 -----
 meta/recipes-devtools/python/python3-pycryptodome_3.21.0.bb  | 5 +++++
 ...cryptodomex_3.20.0.bb => python3-pycryptodomex_3.21.0.bb} | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.21.0.bb
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.20.0.bb => python3-pycryptodomex_3.21.0.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
deleted file mode 100644
index 6c93c205ac..0000000000
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-pycryptodome.inc
-inherit python_setuptools_build_meta
-
-SRC_URI[sha256sum] = "09609209ed7de61c2b560cc5c8c4fbf892f8b15b1faf7e4cbffac97db1fffda7"
-
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.21.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.21.0.bb
new file mode 100644
index 0000000000..77664b22a5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.21.0.bb
@@ -0,0 +1,5 @@
+require python-pycryptodome.inc
+inherit python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "f7787e0d469bdae763b876174cf2e6c0f7be79808af26b1da96f1a64bcf47297"
+
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.21.0.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.21.0.bb
index 54578d2850..e5fb000d9b 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.21.0.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "7a710b79baddd65b806402e14766c721aee8fb83381769c27920f26476276c1e"
+SRC_URI[sha256sum] = "222d0bd05381dd25c32dd6065c071ebf084212ab79bab4599ba9e6a3e0009e6c"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.34.1


