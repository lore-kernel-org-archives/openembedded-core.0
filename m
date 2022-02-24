Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD87C433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 06:30:43 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web08.7260.1645684241176371553
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 22:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ZpQCBGVu;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645684242; x=1677220242;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=mAPh35aI41iL/g3ryZyReqS7H+OQ/+4PoDTKX8brKIs=;
  b=ZpQCBGVu/YkTQEKFnPh2WA/Jc9q5h/NBAxQ0UyZtPoeRilXX3q2RruWJ
   3MHIqgemv974RMwKhlwbFqolXmkPKIHAkdXLf/acJdHBX4dBwntmPu6OI
   fECiLkldupnYmlJM04obnjJIE1wpFJHtNpqMBeZCBxwe5KfCqw+wHYwtL
   LoaZ6gzEZCf6mCzNhSjgpd2dtVnoBzQ71aoxUzoiBmkR53FMlDrKBcD5L
   NZepZlKZjkG/CtN6db/IPXzMD2XgrSH27lQ4wBEI5as+jtdDStPqPl8UB
   f6ftxCUu4LquhL+e8o5lUUmJToypEaw23bf1ihDCIgz9DUanhF26Gaqsf
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="338600476"
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600";
   d="scan'208";a="338600476"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 22:30:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600";
   d="scan'208";a="574101893"
Received: from cheeyang-desk1.png.intel.com ([10.158.87.104])
  by orsmga001.jf.intel.com with ESMTP; 23 Feb 2022 22:30:40 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][honister 2/4] ruby: update 3.0.2 -> 3.0.3
Date: Thu, 24 Feb 2022 14:28:54 +0800
Message-Id: <20220224062856.2249762-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224062856.2249762-1-chee.yang.lee@intel.com>
References: <20220224062856.2249762-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 06:30:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162299

From: Alexander Kanavin <alex.kanavin@gmail.com>

Do not tweak a file that is no longer installed.

(From OE-Core rev: 1af0c4ef56d1892f284b6787ccc5a925d023e178)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
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
2.25.1


