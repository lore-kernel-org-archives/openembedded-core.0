Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D6BC43217
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 01:08:57 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.16549.1644196133544033487
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qzpWsdYz;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id u15so22024445wrt.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1wWArqytppgxHn89E+aMvs8YSGCMWSj3xnKXrnXNyF4=;
        b=qzpWsdYzwF583t8GQ11aFem2tY8eWgsDO7kplVM39LyLTz9woad69a96jHDjOJ6WRz
         Zf0kbYavrjJygTFwwmXqYPtuJvx3eVbhYazIFSpKUzJsb+LOHlzrnlomELWVWdS5snw7
         M2j6DieybkB8gIBj+v8t+qVeYdiPjKTpVk4mQarJUbAl2VDgw/9IZiG43BtTIZojilV+
         hAw3wp4wWlsuUeWt173zu1VAIlJHv+CM+hzhsj7wVgaSclSEY0n05o6vw96wdnLDgsqX
         O11sApaPUn4SzBgr4Tm1mMluBi7zCcFJf4PlfmrlkzjK2vE+3TTpSAUiVWWyDb++WOWS
         ZnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1wWArqytppgxHn89E+aMvs8YSGCMWSj3xnKXrnXNyF4=;
        b=Y0n4auVGYW7THIMolrVYBRkqYSgkaLqXBzIr8cVBJUz8zDzbvaXJ7IWdzAsJJ8JLu+
         o/pgZafPv5vZEztZeLb+xRe2kAPrFOgTo2PgW1XmVbM5QskQvdDCo8By30quP0GdOWAe
         PCE5D0mkd7b72Elpx2j5rLF4eFRFXc8FTWIchVJ9zsC2U3LZ9asUCgrOLwMpad3P5J/2
         +qmNkB5ciJEMCgQjSl7RQotkjoqo2kP9EF4cyceO2kV0YQwAuGvmHsUPk1RNWqvKLzfy
         oIGlovT3fsC3gBYas+PsEDObgGFNXnxgfGinEAx8v4/wvTqx43FRUaN+ar7PSQDMi5sf
         K92w==
X-Gm-Message-State: AOAM532q6NrCIDy+DEYRgbS41Yx076mDPmPmbJMl+yGcdnhCXsX6cCub
	2VEaUo5AJGGFV49Xrm6TemEdD5XOLl4=
X-Google-Smtp-Source: 
 ABdhPJxvgeaFD2Bq/TLDfb8Xq17uFrhivcGPFrsf4qcc7gk+Wa6Y9bVYi0ei45s/C4lEPXBSQ3z3bQ==
X-Received: by 2002:a5d:64e9:: with SMTP id g9mr7880641wri.341.1644196131968;
        Sun, 06 Feb 2022 17:08:51 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o22sm3903556wmh.13.2022.02.06.17.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 17:08:51 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 14/17] gstreamer1.0-vaapi: upgrade 1.18.5 -> 1.20.0
Date: Mon,  7 Feb 2022 01:08:20 +0000
Message-Id: <20220207010823.143664-14-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207010823.143664-1-quaresma.jose@gmail.com>
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 01:08:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161434

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...streamer1.0-vaapi_1.18.5.bb => gstreamer1.0-vaapi_1.20.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.5.bb => gstreamer1.0-vaapi_1.20.0.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
index 9a68a3fadf..ce7fbde0df 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.20.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "4a460fb95559f41444eb24864ad2d9e37922b6eea941510310319fc3e0ba727b"
+SRC_URI[sha256sum] = "f79a47346dfd5e585e063e77078e5fc498b06dee895bfcbf47d8863fcac9ea32"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.35.1


