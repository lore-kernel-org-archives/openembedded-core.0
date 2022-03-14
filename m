Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8180DC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 23:17:32 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.3760.1647299851163415600
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=enf9Z/iX;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 n33-20020a05600c3ba100b003832caf7f3aso620161wms.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hr7tDyOvLcjEfM8e5xze1Qpfrgx3jMKtYouI5UXe+K4=;
        b=enf9Z/iXJpBBz9gAXmZPXM5cthKvxX7QYDNVWvb4UoQ7khHpjNhFqA63ZrnJ8La0QO
         NFHZBooOkxCgXJOKEYqALb7Eu3KZWBkOBoZ9Mi/yDyH08aR5+W6ksPVlAUT094LNntev
         ibLLjCPlK/+rhRq1Xjc4d7by334+qAt4PHpGhVIB0VRRDVZOFmWahS3s9BSTPYeHP/d0
         f4eqVMb8eSG5GFPvcmZTq9sdT1OcBpUxz+Kcb/wvZ+YcRz1QPtb1EZ9SSkbJG6U4TGH9
         SMP3zS/NS1izHw/IStWD44n9Hjwxxr6rq0myCTDCPxRqwb+qNlSxp3tVShxDmO7DIQR6
         Ol5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hr7tDyOvLcjEfM8e5xze1Qpfrgx3jMKtYouI5UXe+K4=;
        b=Sx1ulHqn1hnJtDH8rnNLBbtDdHgFeo+7dMF4bUoUZF9n5uj6xlGrB2XsndpN3S+oy9
         nkqIdmI0EWKpj6q3uNadPTKffO0Nov+YFtM5XK3NO/kgYyjuVX7/J1RMeAsscP3z0lqi
         5ORQqFWbKKaVpywKaG4VfGU+kVxSXQ1ufC90u7VT725KE1Yn+zDS12StZj0unQnetQv+
         2x3nkEHfR6yPm3KsPAkEZ1kWnTe+Y1zclOt3TcPAor+YP1PV/umufBy5BnLjskZgNWsM
         hCa8+d68sS/Fi70w9K5NjPRfkDh10AVrL22wauJbVII3HaW/yrM7s0rSLhk8huwH/chI
         dX5Q==
X-Gm-Message-State: AOAM533yIup/22/OrP/WA2GaDxfz82cZ5HVUOGFJ23TNZI8X4OxVhvKn
	u1664+ZvVoDGLumyHvmH2rQrb77uLVg=
X-Google-Smtp-Source: 
 ABdhPJyHxhqAuM3e5i5zxVsSNDmYowtOEHtwLUOEiRT4hfBiMtq7CeVcNkKtns4DFjB7wpu7UEcVAQ==
X-Received: by 2002:a1c:7916:0:b0:389:8d21:caa9 with SMTP id
 l22-20020a1c7916000000b003898d21caa9mr1067390wme.106.1647299849536;
        Mon, 14 Mar 2022 16:17:29 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b0038995cb915fsm1122019wms.9.2022.03.14.16.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 16:17:29 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 08/11] gstreamer1.0-vaapi: upgrade 1.20.0 -> 1.20.1
Date: Mon, 14 Mar 2022 23:17:09 +0000
Message-Id: <20220314231712.296796-8-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314231712.296796-1-quaresma.jose@gmail.com>
References: <20220314231712.296796-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 23:17:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163212

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...streamer1.0-vaapi_1.20.0.bb => gstreamer1.0-vaapi_1.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.20.0.bb => gstreamer1.0-vaapi_1.20.1.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb
index 7ef8ae3138..48b571f563 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "f79a47346dfd5e585e063e77078e5fc498b06dee895bfcbf47d8863fcac9ea32"
+SRC_URI[sha256sum] = "87fbf6c537af9079c99a9aefe951da119e16e5bcc9cc8614f5035f062bf21137"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.35.1


