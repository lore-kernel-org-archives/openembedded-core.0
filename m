Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF75C4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:51:18 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.12598.1664898673418287338
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xqWOM/fq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id c7so13033129pgt.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=6hYoNRJv88gWR9kEcPxI0DISxPIvpdPmWWF+2lCXapU=;
        b=xqWOM/fqgLNSPtyzNgYNInoY89G7Yi9iO3PhR0SV4HGT8ECmcZ/CWtszo+PbM9LukE
         boxks43FyrlQ8a/m7eZPmdq3+f5Pnhr4wgC0kLWXglMsDWgvZVY+w8pfuANG5vycNMfn
         ZKq8kj+xHic4BcxnXQeXTptRhQPMAi7JOyvW0ooFtQ8Cjnllj178XQcgY+OXsdROOgJ+
         4ANSm2IFxkiQ4YKSZWc8gANXa7GuFR2VkOjU62g+mu63qNGjlMWJVUHROtiAiXrq+ckc
         XIHNIfpHH/MLlwP065RdRclraR1Eaoxnmy8DujvnfiFX676HEsWP1mEMrqgPVT+/j83b
         /liA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6hYoNRJv88gWR9kEcPxI0DISxPIvpdPmWWF+2lCXapU=;
        b=OqPqIcCIyW6gU9mUfyY7ypwXgsIJcGbw6eUUlMSobCsAGiUTk2OUgC3iEKUcIXqCpe
         cNwnuRefnzzLigP+EU5d+R7YL3XqxRg3ziiwpTCAo37JU9iwZL+vaDL/5ACpinYvQB4R
         c5DRUj0g0dHnNsqXPnd0EDfFqtQUmetED6Zoc3qA5q9PPQwp2sH9LPYNgcXJKncm5gbC
         rGZBmGYz1bcXDxmJmt6IrgeQT5S0q38nxcHDuZNxn5WfJIMXCypGZeOj+XTgLhcQlO4Q
         RROHnoF3q7Wb4Y1phlxd8LrKFYA23F7jdcsVmwIxLAYL22YmiKpKe7E9Csa4IL7NbBG2
         MEKg==
X-Gm-Message-State: ACrzQf0R60XKxKMWZGQrw6YBVEQoDBeIKM0pSis6VhvCK5JVXZbnHyap
	2bVMut+Z+0Tfk673sO1D5zkiykvoNIDUmNPK
X-Google-Smtp-Source: 
 AMsMyM72wKGgq1SVsctZrozMuqLryFaNXQrjfXIu95H+2aeTw1pJGwt3F/HNOsyI4mLkELqNuSes9g==
X-Received: by 2002:a05:6a00:10c2:b0:547:4991:c984 with SMTP id
 d2-20020a056a0010c200b005474991c984mr28750369pfu.6.1664898672495;
        Tue, 04 Oct 2022 08:51:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78e82000000b00561642b6903sm4464266pfr.120.2022.10.04.08.51.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:51:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/18] webkitgtk: Upgrade to 2.36.6 minor update
Date: Tue,  4 Oct 2022 05:50:32 -1000
Message-Id: 
 <342a05cc65aaff83f738988211f291e377b1ab87.1664898546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664898546.git.steve@sakoman.com>
References: <cover.1664898546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:51:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171410

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: bee36428a45c6c0c24d4c0fcf64bd890f3481c4a)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkit/{webkitgtk_2.36.5.bb => webkitgtk_2.36.6.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.5.bb => webkitgtk_2.36.6.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.36.5.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
index b3fe357010..37b977f9ba 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            "
 
-SRC_URI[sha256sum] = "d5532fa884c943dc48f1911473dd663aba407a3b35caa7b04bac1419b41e5908"
+SRC_URI[sha256sum] = "1193bc821946336776f0dfa5e0dca5651f1e57157eda12da4721d2441f24a61a"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.25.1


