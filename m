Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4971C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 02:57:47 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.6479.1652237862214713100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 19:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=nRQWPFg3;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652237864; x=1683773864;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iKAIYoj/BjnTJ2uxwK0+bTDTm82d7dC6nTssDlnndWQ=;
  b=nRQWPFg3Q+ZS/6vxiN1VWI2ZN2ypTIRe9+URVd2CU+LuyA5d1oVJCtFX
   JXyOCJGe0wDa4mcjl3D7QMSWUKkJXxB9tjwYKhVS4bYJdyNC22lum01+Q
   CBJNwlLGM625zKNwOdNYUhRpZc0p8lALyCnpFgrH+DBUe4gIpS/85Roz9
   QOhHQRs2P4GbXtenYRww1jbolJlMN269SMgVpCunHYNLn9Qs3wm5OEqfc
   Rbb6wu5nHDxuk+n7n2LijBV1PGc6hV8Q0XT201Jk2feeNsbJSzl2W8rmg
   mcr9GDwlHeFgd1wIGvptg2HbB3NEEsHcYohIqlej8nlY2xa0t1hmNAKyA
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="257105989"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="257105989"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:41 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="602754684"
Received: from ukandhax-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.163.3])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:40 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 02/17] cases/buildepoxy.py: fix typo
Date: Wed, 11 May 2022 10:57:17 +0800
Message-Id: 
 <6f04b791315dcaa58876e416098712ab9740aaf9.1652231471.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652231471.git.anuj.mittal@intel.com>
References: <cover.1652231471.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 02:57:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165470

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3a9b6e71d1e7e8e2ebc0ed047841e36f09300387)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit af5bcfdc0b21607122fbbda6c35fac5d0cb0f829)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/sdk/cases/buildepoxy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/cases/buildepoxy.py
index 385f8ccca8..f69f720cd6 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -17,7 +17,7 @@ class EpoxyTest(OESDKTestCase):
     """
     def setUp(self):
         if not (self.tc.hasHostPackage("nativesdk-meson")):
-            raise unittest.SkipTest("GalculatorTest class: SDK doesn't contain Meson")
+            raise unittest.SkipTest("EpoxyTest class: SDK doesn't contain Meson")
 
     def test_epoxy(self):
         with tempfile.TemporaryDirectory(prefix="epoxy", dir=self.tc.sdk_dir) as testdir:
-- 
2.35.3


