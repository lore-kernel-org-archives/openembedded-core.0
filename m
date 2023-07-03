Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB1AC0015E
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 03:30:39 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.19946.1688355033507838924
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jul 2023 20:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=I0MgpPLQ;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688355035; x=1719891035;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=J0ALEdVN1pEordZK4zCtUKX2q/9ZWo+KCLNOyWuuoa0=;
  b=I0MgpPLQKvPweML6vnluLi2x7U9d0INZ95z//aKPKxkIqo6BGuY5Vu5g
   JQ9hqM5TH0OsX4k9t8W82P1vkueNo/9mKTSY1pvBAea+U+Do9T5fu6WjD
   ChKUZAwlEVvikLqzQyJ5LdrHoa3IrTPFDcGWNhA0chCqJKPtaYyY7WrAk
   azhutl7uFVug9KJpcqwaLZylMOCkSmYON8nHPirrmysZdit7CwdE3Fv2J
   yBhisLNQtbjMO9HqfN2o/v1OWgPsAzMioJlT/H8iV6h+IyxyQqs3hw5Wi
   ZMPp3G2S0hBLBUl+THKcdHrcprsz1Xphq8pVT7ud+wa6r/HOk261q/uR7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="426461613"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="426461613"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 20:30:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="1048908151"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="1048908151"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.151.68])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2023 20:30:34 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] libpng: upgrade 1.6.39 -> 1.6.40
Date: Mon,  3 Jul 2023 11:30:23 +0800
Message-ID: <20230703033025.30865-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230703033025.30865-1-anuj.mittal@intel.com>
References: <20230703033025.30865-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 03:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183789

License-Update: Change in copyright dates

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libpng/{libpng_1.6.39.bb => libpng_1.6.40.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.39.bb => libpng_1.6.40.bb} (87%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.40.bb
similarity index 87%
rename from meta/recipes-multimedia/libpng/libpng_1.6.39.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.40.bb
index a6c229f5cf..0ef4b82d1c 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.40.bb
@@ -5,13 +5,13 @@ library for use in applications that read, create, and manipulate PNG \
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5c900cc124ba35a274073b5de7639b13"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8f533bc367bfd43f556b6f782234c076"
 DEPENDS = "zlib"
 
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937"
+SRC_URI[sha256sum] = "535b479b2467ff231a3ec6d92a525906fb8ef27978be4f66dbe05d3f3a01b3a1"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.41.0


