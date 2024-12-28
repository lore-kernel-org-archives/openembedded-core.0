Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3973BE77188
	for <webhook@archiver.kernel.org>; Sat, 28 Dec 2024 22:04:40 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.36129.1735423470928648043
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Dec 2024 14:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=sVrmR2qN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20241228220429c59099532b225ee6cf-l2oqm1@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20241228220429c59099532b225ee6cf
        for <openembedded-core@lists.openembedded.org>;
        Sat, 28 Dec 2024 23:04:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=cQYZMTiUaRvhFOvshMUxZRIDh7f7BSIwk3+FA08ZpzE=;
 b=sVrmR2qNTwYWxORRF6awgulUr/J4XDfMrARqDRI4liK7EbMsAqmr+sECV3yoxkAYovXwIc
 h9kC5lcilIpQsxt/TI7KbiHjmZai0QroDviukrZ1voGCaATChRP79o38eZMO7zsphfMy/sXh
 h/AeLcb4gaiLtfhN2zBzPCqIlkjGZ4cwn9mijYxRpLVLJ5hk3UqoMhr3pzoRYlbFglifqnDu
 RRtfLoj6mDR6Xj+bGoNMheMaKC8PfLkBRlQlnFFOyMTym7SUjIzgN1Cn7xIWfSWgJmKch91G
 GEzOOyohWh9XFHx3L2RKWWCdCvSvS/nNAGb/1nVYQR32GMLP20BbqLoA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH 1/4] gstreamer1.0-libav: explicitly disable documentation
Date: Sat, 28 Dec 2024 21:49:05 +0100
Message-Id: <20241228204908.2470952-2-peter.marko@siemens.com>
In-Reply-To: <20241228204908.2470952-1-peter.marko@siemens.com>
References: <20241228204908.2470952-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Dec 2024 22:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209124

From: Ross Burton <ross.burton@arm.com>

We can't build documentation when doing a cross build, so disable it
explicitly to be clear.

(From OE-Core rev: 2706062d3a711ff0b2c03bee40b908ad329ebd6d)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
index 7a72f9120e8..40360065518 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
@@ -22,6 +22,7 @@ inherit meson pkgconfig upstream-version-is-even
 
 EXTRA_OEMESON += " \
     -Dtests=disabled \
+    -Ddoc=disabled \
 "
 
 FILES:${PN} += "${libdir}/gstreamer-1.0/*.so"
-- 
2.30.2


