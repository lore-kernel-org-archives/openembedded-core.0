Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069A8C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:13:39 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.26813.1646662417320001295
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=mszkAQm5;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662418; x=1678198418;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=H481GceAMH4XqL8SVHMXt7yMOyWcf8cBoLnpkMWv2fY=;
  b=mszkAQm5mHnUg9Vpc2iFyR3GfxPTxuk7iHt83chtO6icdtA7hqwV0TXt
   bTsNPFozEmDt8Bq3NlK3rVipVbQPqZFSHEf0lqVyaJ8P+ZBnBgS9uBgus
   Vrvznn6IeAJFBB4wgyhw6MKM6aUL3QK/GUjkl4Pjy758u0LP321mdb7jd
   bcitwyagj0XEENg8w0FeP5iYIDiGwhD9Wc+4SaGki1t01TIb0pierOy80
   qASfE/lwQ3KakqyhoaMIXf1pW2kKjnF84jQddZtatMpf5vBu/9DktOGAL
   Pp/ndZo6OZ+CDe90++YvstHAAtIQmjXU/PLxeMjMWoNWQhYZW05XFVTXd
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112408"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112408"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:08 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070759"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:07 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 01/25] harfbuzz: upgrade 2.9.0 -> 2.9.1
Date: Mon,  7 Mar 2022 22:09:37 +0800
Message-Id: 
 <99a05d5365e85f5d32f2cf5926110292443211f6.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:13:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162822

From: wangmy <wangmy@fujitsu.com>

Final subset API is in place and if no issues are discovered,
it will be the stable subset API of HarfBuzz 3.0.0.
Old API is kept to ease transition, but will be removed in 3.0.0.
Various fuzzer-found bug fixes.
hb_buffer_append() now handles the pre- and post-context which
previously were left unchanged in the destination buffer.
hb-view / hb-shape now accept following new arguments:
--unicodes-before/after: takes a list of hex numbers that represent Unicode
codepoints.
Undeprecated API:
hb_set_invert()

(From OE-Core rev: 0a9d19f575fda7db2f768f77701a137da8f73a97)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../harfbuzz/{harfbuzz_2.9.0.bb => harfbuzz_2.9.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.9.0.bb => harfbuzz_2.9.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.9.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.9.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.9.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.9.1.bb
index bc91a8c03c..694553beef 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.9.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.9.1.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3e1c2e1d2c65d56364fd16d1c41a06b2a35795496f78dfff635c2b7414b54c5a"
+SRC_URI[sha256sum] = "0edcc980f526a338452180e701d6aba6323aef457b6686976a7d17ccbddc51cf"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.35.1


