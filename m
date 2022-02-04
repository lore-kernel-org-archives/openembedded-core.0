Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2869FC433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:13:13 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.9481.1643983972820228964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 06:13:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=MUmbqakv;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643983992; x=1675519992;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ipaYADTlkPY0WcyAu+G28bNiUkXdUnPu9ac4PIJVFv4=;
  b=MUmbqakvnLxwA4ZAkXBhhUrxzbzyjZWntySZnva3KZhn7HRphGOeE/8w
   0HFDN+NRKia+hoZfSAbRIcO/G2K8imLKUSFjHydNMsgsJ+EPnzRZqsIj1
   cfblIOjLuFoKG1gKhyT+Uhj+pdDJDhoh/1dAjPz9OqdG890YUva+Zf8IR
   ct2Wp3HmEVVF2g0Dhghg4j7KeS/dGtwx6vaSw9OfcQFndASsBv8TENBLA
   NKEULtQTfO+JWvU/r59F/YeEsaxoakw9VUi4xqaluh/m+64OhirWhCwZQ
   ulb6HpZsHXHw7clkMS0BqDJ4X4UylRvlcR1q1Q2Vb032y43n9CqJElocG
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248321658"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="248321658"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="566750107"
Received: from raajloka-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.235.116])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:11 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 14/17] expat: upgrade to 2.4.4
Date: Fri,  4 Feb 2022 22:12:40 +0800
Message-Id: 
 <4857274b27712981e175c0bbc00fa650f5d3bcf2.1643983711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643983711.git.anuj.mittal@intel.com>
References: <cover.1643983711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 14:13:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161361

From: Ross Burton <ross@burtonini.com>

Fixes CVE-2022-23852 and CVE-2022-23990.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4ed96683893e7433804ccf7a4000a2dd18318ef5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/expat/{expat_2.4.3.bb => expat_2.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.4.3.bb => expat_2.4.4.bb} (91%)

diff --git a/meta/recipes-core/expat/expat_2.4.3.bb b/meta/recipes-core/expat/expat_2.4.4.bb
similarity index 91%
rename from meta/recipes-core/expat/expat_2.4.3.bb
rename to meta/recipes-core/expat/expat_2.4.4.bb
index 088ce81500..63d291ed40 100644
--- a/meta/recipes-core/expat/expat_2.4.3.bb
+++ b/meta/recipes-core/expat/expat_2.4.4.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-SRC_URI[sha256sum] = "6f262e216a494fbf42d8c22bc841b3e117c21f2467a19dc4c27c991b5622f986"
+SRC_URI[sha256sum] = "14c58c2a0b5b8b31836514dfab41bd191836db7aa7b84ae5c47bc0327a20d64a"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.34.1


