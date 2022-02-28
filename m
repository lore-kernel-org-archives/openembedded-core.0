Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C152CC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:47 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.19879.1646056878394925946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=TOuxFGvH;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056906; x=1677592906;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ctzjfQ6BDgBui8kwJeKK/vVY7Fww1vQ+Pec/YFRFtt8=;
  b=TOuxFGvH1fQUlwSikl5AqfwQ349fuVCByVTL/nMrhAzbn8SMY80IwfPq
   ht4DLrjIcdoWFWsR7DcrvcaV2mJHlxSWrmcz23B53bzWj7l6n51MZX4Mk
   7ocDhDnqub+37piH91KSQwnWeG5sv/02/hdQB+rWx46W8OaM1breG6HV7
   myyQnjBpILQtDWHi5Of93tG49b4+0V8RvlOp2E3Q4ib+QGtsXD2y9bavC
   CTaTeMqn3ILMav1eB/attz2Nz1JWAuIkjIqGG1t5rG5Eow/UdI6a+vG1j
   F7owpYvt5BmPRfEQDDQUqDa9dPb3FUR5ut6u3cLR3iP7t+fSBL6lH/Gue
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857465"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857465"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:31 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092811"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:30 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 35/39] libarchive: upgrade 3.5.1 -> 3.5.2
Date: Mon, 28 Feb 2022 22:00:25 +0800
Message-Id: 
 <d2985bdd2c13423d8121373fe5502bd6fafb6283.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162491

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f8f39cd5757907d50444203e0e6e2c5ed0a47152)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libarchive/{libarchive_3.5.1.bb => libarchive_3.5.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.5.1.bb => libarchive_3.5.2.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.5.1.bb b/meta/recipes-extended/libarchive/libarchive_3.5.2.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.5.1.bb
rename to meta/recipes-extended/libarchive/libarchive_3.5.2.bb
index 1387b69066..1cd6397f2d 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.5.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.5.2.bb
@@ -34,7 +34,7 @@ EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "9015d109ec00bb9ae1a384b172bf2fc1dff41e2c66e5a9eeddf933af9db37f5a"
+SRC_URI[sha256sum] = "5f245bd5176bc5f67428eb0aa497e09979264a153a074d35416521a5b8e86189"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.35.1


