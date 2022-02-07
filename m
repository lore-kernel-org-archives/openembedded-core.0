Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C105C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 01:08:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.16547.1644196128856553183
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=He0JfWio;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 n40-20020a05600c3ba800b00353958feb16so7551244wms.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 17:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0PxhdPWY6XJHxtLCqbkLr/Pnjf5am9V7CXBOKc8ZN/4=;
        b=He0JfWiocAEw993bNhIAhw6LF7xZO6g9R0pg9N/aEsjk4gJPkFOmRQwHRrJK+GiW2+
         rnSoWu67+/qIkwdlrMMos30N21Khum5ZAqkA3R5HscWzWCzP8YivrImINoaHqNCTxyYE
         ZopWfAfpeld4tJf5fxNyZX3dNRWrtri77RymPiJ+hunjtNFLvw16ifSpEB+KI4fSD+tG
         HXzhqVfFNtEv8rMBC+yTT1EBbTFsbmPJdWT9wr90PW3vf1dN65oizSBb43OTM2NqJga1
         +Uv/cmQtu1gFHiq7J6XqB0LFJ7I2QCWYMmDuxff4u5b5EHb/kx+g2SFfJX7mljK2h9CX
         +tZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0PxhdPWY6XJHxtLCqbkLr/Pnjf5am9V7CXBOKc8ZN/4=;
        b=tTz+cDwx27NagZi+8jnYgozSiFiF3T4aS2+YU4dX6DgMuyKFEl1zngpCigsNb4nx3a
         bDqI5gL1bB1F6S6lC8L0FwOg1wZQUwEkxdA6uq58UrkO9ALbJ8tEAlame02lU3bnmimd
         GqK90pKnuR+jpOZAHlMefBI4Okxj7cwLXncdo+PdqG2YQ2tEcrnY8PyBzyoVXFnfizTf
         kx0b7ihdufzjNMZGQ1zKJG4/eubSa9Hxjm9sX9m+yl4okoGhtocow1Qzu0pHuGx82q0j
         +y7kuZX8LEyBQY+zrG/r0IQysMS/95KLhVmyDWGE/kwBfa2EdgsnNVEEscIwzffKqxK6
         h73A==
X-Gm-Message-State: AOAM533M6K2Xe1pu2yAr+iNODBua0nitGke1NN8C8W4nTjEdbR8OqUmB
	h34f7Kv+pPJXx862kJeqln2zYeFpSTI=
X-Google-Smtp-Source: 
 ABdhPJyaUXqsZQDmnY8PCUIHcQWODCYw0BSKrmDZ92GXhPUMooELzg2KMJKm/7c0tVnmgWQ1ybD6Bg==
X-Received: by 2002:a7b:c0c8:: with SMTP id s8mr12273229wmh.3.1644196127297;
        Sun, 06 Feb 2022 17:08:47 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 o22sm3903556wmh.13.2022.02.06.17.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 17:08:46 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 09/17] gstreamer1.0-plugins-good: upgrade 1.18.5 -> 1.20.0
Date: Mon,  7 Feb 2022 01:08:15 +0000
Message-Id: <20220207010823.143664-9-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207010823.143664-1-quaresma.jose@gmail.com>
References: <20220207010823.143664-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 01:08:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161429

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ugins-good_1.18.5.bb => gstreamer1.0-plugins-good_1.20.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.18.5.bb => gstreamer1.0-plugins-good_1.20.0.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.bb
index ade935df9e..da4d4a8ccb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "3aaeeea7765fbf8801acce4a503a9b05f73f04e8a35352e9d00232cfd555796b"
+SRC_URI[sha256sum] = "2d119c15ab8c9e79f8cd3c6bf582ff7a050b28ccae52ab4865e1a1464991659c"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.35.1


