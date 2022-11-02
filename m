Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE353C4321E
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:42:51 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.1988.1667356966975856675
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=bkWtj+tG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id k7so5579916pll.6
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nfodmCDe27U4k8DxfaT3MqazMJY+VdkQNoVywdmeQvM=;
        b=bkWtj+tGa4sf0QMsV5Gv7t/jwq5h6GfYag3OEdy9snHDImSPRIac/WkdcFbVFeIxuJ
         CjsvhXztHiYRDDpnRDjmWlB3RbJxofNl/yo/9CNm7rLwIYTBojaLW1DuToC/guUiWqRG
         +gqrPl+x1AS63coE90nB6ePOAm3rz679YficFYrgK5gwtXRRLJp5u+vK0tEFuY4o/UeW
         W26W0ULvjHOM/kwotVq56JIP2pMBndUuOdeIsvaQC2NRSDzabKCq+PoRRyd5528kd7mk
         D2bZqBQzkJUAHw2Yb8DApTWOY3BvySq+W0fqrkdW1bZcdsozn7e5l3CUz5k4D0nIpvgN
         aEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nfodmCDe27U4k8DxfaT3MqazMJY+VdkQNoVywdmeQvM=;
        b=4CLyNELMnW9F/VuXoinvK4suYCIx/O9tLOE94Fl3FNPwcGLuBXsCLDlniGiwZzG1YI
         ZIaynBVu7p+koZT2WkyKNywvI/iFgHeRYvL5UvpWP5SMj2MyvP1j6B6qeLHTcy4tdpcG
         bgaeiYH5/9wta1CVhaa+74TwVHekkgYXKDxI/v6ww39QPviD0f4+OILYff4bEOQtAbin
         bxQX0JeEUsnpN+6Lqffylgh82Mi4EVKm5ZVlFhDlOuKHJl07ZJoqMd064NimoX/t66qn
         ax+Adhk4y5A3hmUpl40uWxHiXHvwCtcOzI9naKWqRlyz2FV9nhAydoAIDvIgqHVfB/kW
         kq8A==
X-Gm-Message-State: ACrzQf1SxiF68VsGoXhkbc/mKtRhwNJLlnYVTtiTaBF0fYp3V41PiOq4
	oiVElbk1P08sed1T/m+wNXf4MBwpibIY3FVD
X-Google-Smtp-Source: AMsMyM7XCjpQYRDQPYUZHXr+081nrUNbOyGP9JVtctvCibSnxnOLAebquOeV8yC0OmJkEzilMTQbkg==
X-Received: by 2002:a17:902:ec8e:b0:187:1c64:7c32 with SMTP id x14-20020a170902ec8e00b001871c647c32mr14869972plg.24.1667356966077;
        Tue, 01 Nov 2022 19:42:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.42.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:42:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 11/20] pango: upgrade 1.50.9 -> 1.50.10
Date: Tue,  1 Nov 2022 16:42:01 -1000
Message-Id: <78dc0bf6384349c23a54f59d89988ad242125581.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172551

From: Ross Burton <ross.burton@arm.com>

Overview of changes in 1.50.10, 16-09-2022
=========================================
- Avoid some unnecessary strdups
- Fix line height computations with a non-trivial CTM

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 884ce27b9cee231e093fe53192d04133c437404e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pango/{pango_1.50.9.bb => pango_1.50.10.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.50.9.bb => pango_1.50.10.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.50.9.bb b/meta/recipes-graphics/pango/pango_1.50.10.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.50.9.bb
rename to meta/recipes-graphics/pango/pango_1.50.10.bb
index 03e2ca6721..95209889a8 100644
--- a/meta/recipes-graphics/pango/pango_1.50.9.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.10.bb
@@ -24,7 +24,7 @@ SRC_URI += "file://run-ptest \
             file://0001-Skip-running-test-layout-test.patch \
 "
 
-SRC_URI[archive.sha256sum] = "1b636aabf905130d806372136f5e137b6a27f26d47defd9240bf444f6a4fe610"
+SRC_URI[archive.sha256sum] = "7e5d2f1e40854d24a9a2c4d093bafe75dcdbeccdf1de43e4437332eabed64966"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.25.1


