Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E134C561E6
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 20:04:33 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25347.1785873871444982703
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 13:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=kStGkkP4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260804200429024da973b1000207a2-g6yqqv@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260804200429024da973b1000207a2
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 22:04:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=PH1Vpy2Ta1kN40TuONn95na4NEpO38SQGjbBNwtMgMY=;
 b=kStGkkP4vJ62bxSU0zbL5UpJZyBCunTjlwbGqmNWonYVXbZ+bFwKxKTZMp4uefK1yK4+Nb
 xLCbplAB0zy/9AMQWBC96ObaC8vy441j7ArmXknPOwDToha3dADBI5xMwvvRlD3AdcD8jjgN
 VwY1mSzbI3EK7wXNNRetifW9T8ek8OS+rdCHd+0aSOSskJmLG+Swymwa0975AnidF65BAfU8
 tLPrOjyGmZA5tpUScZdsYyMeGs1pSTKBkJxRGtVOtAg17nUMLIKLDeRfir2KS7LK8jLJt1+1
 m04H0kqorVgBk6AQFsyxlpg70CkcRpu1EtGQCVEy2ziq83mgbrhjKMkQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 2/6] p11-kit: upgrade 0.26.2 -> 0.26.4
Date: Tue,  4 Aug 2026 22:03:52 +0200
Message-ID: <20260804200356.2093270-2-peter.marko@siemens.com>
In-Reply-To: <20260804200356.2093270-1-peter.marko@siemens.com>
References: <20260804200356.2093270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 20:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242797

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 4e58b57cdc5e25d6cb12b658f09fea7c91835430)

Release Notes:
* https://github.com/p11-glue/p11-kit/releases/tag/0.26.4
  * Build fix
  * Update translations
* https://github.com/p11-glue/p11-kit/releases/tag/0.26.3
  * server: fixed stack exhaustion via unbounded recursion in RPC
    attribute parsing by enforcing a recursion depth limit
    (CVE-2026-13757)
  * fixed confusing error message when trying to store an existing cert
    with trust anchor
  * fixed assert when parsing p11-kit files with value (")
  * fixed numerous memory management issues
  * Build and test fixes

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../p11-kit/{p11-kit_0.26.2.bb => p11-kit_0.26.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.26.2.bb => p11-kit_0.26.4.bb} (97%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
similarity index 97%
rename from meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
index 5f553f11bb..5a42d0dc50 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.2.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
@@ -12,7 +12,7 @@ DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''
 
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=${PV} \
            "
-SRCREV = "8e6e4e6d64d9fe91c62b0052c105b2b72d4c24ef"
+SRCREV = "a14788849d1ef44422d679534a13821eab5bb5f4"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"

