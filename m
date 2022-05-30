Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F1AC43219
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 02:36:27 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.31654.1653878172131745638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 19:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=WiQaQdli;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653878181; x=1685414181;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=55nSDddLIfEobluj78jYvHOncVLWIVRoCez38MTpvIU=;
  b=WiQaQdlifVrpSxlbGIsr78hW+Ywn7xMmDUVScrzwFT+jyHfBXhbz0r3I
   RVlyNdOKPjZz22RNOg+KnmVxy3YAD1vVW5Ygbvj93YY32LEjGXuzgZ82p
   7aCKmgAxJv9joXtayI3ZpWMcQU2Ll8zrE0H2GtnfYoEOo4cjJuZiknXDy
   3toJaT3/x+TBx+L3yDyP2Dff39c2bDBoUIaGam+8rKk0XxQuN+TvjTn//
   /q5GFtJMODhNawaFkckFVXjR0cQKHGGo2FswSY/bG/1tAkorwnjtRtVZ7
   /pwsiPFZOgrK7YjrZZonT/2JG8y3rVxId1kmoQD3sGfSiuQW7vgLooPr3
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274876470"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="274876470"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="666313594"
Received: from jngkeatx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.254.254])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:19 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 09/12] openssl: Minor security upgrade 1.1.1n to
 1.1.1o
Date: Mon, 30 May 2022 10:35:59 +0800
Message-Id: 
 <4c8f7c3533d1c3f10c6754c35c6da3f9aa05a09b.1653877872.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1653877872.git.anuj.mittal@intel.com>
References: <cover.1653877872.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 02:36:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166253

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

This security upgrade fixes CVE-2022-1292 as per below link
Link: https://www.openssl.org/news/cl111.txt

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../openssl/{openssl_1.1.1n.bb => openssl_1.1.1o.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1n.bb => openssl_1.1.1o.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1n.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
index dbde6e96a3..d6386c33a9 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1n.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1o.bb
@@ -29,7 +29,7 @@ SRC_URI:append:riscv32 = " \
            file://0004-Fixup-support-for-io_pgetevents_time64-syscall.patch \
            "
 
-SRC_URI[sha256sum] = "40dceb51a4f6a5275bde0e6bf20ef4b91bfc32ed57c0552e2e8e15463372b17a"
+SRC_URI[sha256sum] = "9384a2b0570dd80358841464677115df785edb941c71211f75076d72fe6b438f"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.35.3


