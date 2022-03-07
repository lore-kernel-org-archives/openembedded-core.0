Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0579BC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:13:40 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.26813.1646662417320001295
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=EY4nuc1j;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662419; x=1678198419;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ysHRCdgvoWmy0NwgAaVqAZsVxvegpYBtzbgeiCGbY1w=;
  b=EY4nuc1jM/8vL9GmhYShv2gVlTlv/xfZa0LoKVDeXS1zElE0wbAnOLNv
   IavSd+xTalN8xkspgsfXo5P15iB8gveG+tkX8uRB6H0apkE5+9gArvtK9
   bKrUQFdO/tsrCAeBzBuMZNyMQy5HDAs/3+ZKI/JER90Mc9O9k4K/bZY1O
   dcH2eOsNbsyUYi2Fm/DgTRhQv4fjd0q35d22vKhqeNCLK3VoiHuq9Go/p
   HlI6E9YITJpMRqG2ZrDidqnMhMIrYmNlqJfIEXmKPEw/VBaUV33JT7/7L
   hAQXOzIraUNxOvYTcd7dpxpc+F9ATLm7Uk0YWgA4OXKYTKwV6EWsks6Hd
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112419"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112419"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:10 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070762"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:09 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 02/25] ruby: update 3.0.2 -> 3.0.3
Date: Mon,  7 Mar 2022 22:09:38 +0800
Message-Id: 
 <7e3929281bbb9f37a8e286a3f0d89eed01df2a0d.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:13:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162823

From: Alexander Kanavin <alex.kanavin@gmail.com>

Do not tweak a file that is no longer installed.

(From OE-Core rev: 1af0c4ef56d1892f284b6787ccc5a925d023e178)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/ruby/{ruby_3.0.2.bb => ruby_3.0.3.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.0.2.bb => ruby_3.0.3.bb} (93%)

diff --git a/meta/recipes-devtools/ruby/ruby_3.0.2.bb b/meta/recipes-devtools/ruby/ruby_3.0.3.bb
similarity index 93%
rename from meta/recipes-devtools/ruby/ruby_3.0.2.bb
rename to meta/recipes-devtools/ruby/ruby_3.0.3.bb
index 2abf504d91..95feb94dd4 100644
--- a/meta/recipes-devtools/ruby/ruby_3.0.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.0.3.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
            file://0006-Make-gemspecs-reproducible.patch \
            "
 
-SRC_URI[sha256sum] = "5085dee0ad9f06996a8acec7ebea4a8735e6fac22f22e2d98c3f2bc3bef7e6f1"
+SRC_URI[sha256sum] = "3586861cb2df56970287f0fd83f274bd92058872d830d15570b36def7f1a92ac"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
@@ -83,8 +83,6 @@ do_install_ptest () {
         -i ${D}${PTEST_PATH}/test/erb/test_erb_command.rb
 
     cp -r ${S}/include ${D}/${libdir}/ruby/
-    test_case_rb=`grep rubygems/test_case.rb ${B}/.installed.list`
-    sed -i -e 's:../../../test/:../../../ptest/test/:g' ${D}/$test_case_rb
 }
 
 PACKAGES =+ "${PN}-ri-docs ${PN}-rdoc"
-- 
2.35.1


