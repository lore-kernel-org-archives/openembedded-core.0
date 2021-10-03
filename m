Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73183C4332F
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 23:42:20 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.2567.1633304539520002795
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RkivW8+j;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id u18so27247824wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 16:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YqDpXZXy6wzg07O54aN82sEy9xJb0shUa0J4nU1B+nc=;
        b=RkivW8+jHUf4GiCgBH30uQfggHE7lT0k8iHcSoWZgO6ZRDjJI152isSmYGN1FebE47
         yzp/q4FtX9iW2OD9j0hlKr4LXaHpe3z6GOGAV2AzaYELpZklMrf2o+c0XOaTbVHxZYNw
         25PAzmIICoqodQxFBh8OuioBm4/zHTy5Ve/WyguHmNMeOxsXFhJIQ7UgNZ6SCM4HUk0D
         vWr5dTt/PybPqVFGbIKbq3nZcUVhvGIuKdewIfWVmi3eWRDcerE0a04zqUMJlIy7eh+6
         aro7HsFa9MAvF71eb7FyVlsdrtS/uo6Ju7Tb7p3UuKkM86oy4f+07VpBKElnqHwZlNvp
         p9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YqDpXZXy6wzg07O54aN82sEy9xJb0shUa0J4nU1B+nc=;
        b=I7XaM5mkehfRCoyefCs5xo7kcU1WlzPtwCjUJCHE+valMZ063AuhXG9TBJ7aeNZITR
         l9zlZn+jfnzV7u2kvuq83/fJvOR5gWwdi12lZeZbrI53TyeJgLaKwlTg0JsMoFbWdYG9
         Vbggfi4vf6Zb02rZj7ei6IFjt2SThdr4mJJ44Fixl991v3jhPkoUq+6a9KXE1Sd4vrWq
         jUpSG93FbIwim2KDvzE2YkUKNgAFHS92pf9aGH2xnd37vMjsSXeFm2xpADMzi/GRf02R
         C+0eE+oGnnjFkAvdFWAZDF0Bx3ufexRMg0pqx2Zyc43hZgaK/UejOtjnOC2nGsh/Sjou
         k3XQ==
X-Gm-Message-State: AOAM531uMVEeVLor9MJXLZSZsUn4kqH+tYVNel1ADO5LR7ifTyWwnteH
	UbtQj92HPGpa2KaM5WegppsmPRQstXJi3A==
X-Google-Smtp-Source: 
 ABdhPJw6FuXhYxJjyAH23dLV0FXwxzyS7afbfOBGsIADVVedrilBeZzi6uqg8cQLgUOIXzx6QBku5g==
X-Received: by 2002:a5d:6d07:: with SMTP id e7mr10588762wrq.378.1633304537920;
        Sun, 03 Oct 2021 16:42:17 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 f3sm8831893wmb.12.2021.10.03.16.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 16:42:17 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 05/12] gstreamer1.0-plugins-ugly: 1.18.4 -> 1.18.5
Date: Mon,  4 Oct 2021 00:41:59 +0100
Message-Id: <20211003234206.949967-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211003234206.949967-1-quaresma.jose@gmail.com>
References: <20211003234206.949967-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 23:42:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156569

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ugins-ugly_1.18.4.bb => gstreamer1.0-plugins-ugly_1.18.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.18.4.bb => gstreamer1.0-plugins-ugly_1.18.5.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.bb
index 817dffe839..9777aaee19 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.bb
@@ -13,7 +13,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "218df0ce0d31e8ca9cdeb01a3b0c573172cc9c21bb3d41811c7820145623d13c"
+SRC_URI[sha256sum] = "df32803e98f8a9979373fa2ca7e05e62f977b1097576d3a80619d9f5c69f66d9"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.33.0


