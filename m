Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0FFF327D9
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:22 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20381.1776765375556297005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WfYAeiX2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765375; x=1808301375;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bMn1oROk3KYM6xCu0YRYgN014g/mmgGg5aKInJLoaAw=;
  b=WfYAeiX2nKWEl+V5oykt8MOvdP+0QIgpWlb+9bmagRqXOAeoBbB5oQjz
   NgbKlf8L1RsJ06sP7VO3oaeKes1etC7SgoWIQEEJC+hNlUQxcGikacmn1
   JOvA2VZi8pPwe89Y+sqSyyQSm10U0B2TftAslPVNCtWBuBjWT99EL49Ii
   aEzVrY95PvyT0TbofZrzLWYraJtjYjiFAcSAWaV9vt11gTmGtUdj0f70F
   SpeOB3E3ym8MtKul6WmuYH1P1P3f2MUcDQ6q8B61Twnk7X0CKtVWEcbdl
   AcoGDBnOz+4/mLMZzVDjN/vtd7fv3ckeW6+h4fNCpT6bDvAshr/h9pSBZ
   w==;
X-CSE-ConnectionGUID: +LGtnZMORGuA8tTsHtJcPA==
X-CSE-MsgGUID: JiLtAaVGRwOE6er6VweM3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="237674539"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="237674539"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:14 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D570D100281E
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:13 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 8E3F9C0119A
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 24BD414000E6;
	Tue, 21 Apr 2026 09:56:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/49] diffoscope: upgrade 314 -> 317
Date: Tue, 21 Apr 2026 17:55:15 +0800
Message-ID: <20260421095559.1856-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235613

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_314.bb => diffoscope_317.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_314.bb => diffoscope_317.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_314.bb b/meta/recipes-support/diffoscope/diffoscope_317.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_314.bb
rename to meta/recipes-support/diffoscope/diffoscope_317.bb
index 11868dc8db..06c3ee1a30 100644
--- a/meta/recipes-support/diffoscope/diffoscope_314.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_317.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b347d6ebcadd913a5839555b89ea1026422a1cdf7b8b3be21bb2f112133c3ff8"
+SRC_URI[sha256sum] = "9c8741f76bcbd1faec59227da31981a524abca63e19d03f3a594c19f326de542"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.43.0


