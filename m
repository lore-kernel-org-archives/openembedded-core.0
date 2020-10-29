Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.9549.1603981716150298818
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 07:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mUKeimMd;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id h22so72203wmb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8T+/sDmuWwwb0onJ41wsYJ/9KF51AaXeFH4oINlp1bg=;
        b=mUKeimMdyg30mwbIEsMW82bC+x9KZVdjvaC7DW1WI9MWv1F4r3+ma7pQ08dzs8JGx+
         xH0oqXmixg6qgLmV2F+HIyHAOEo9BDufCT65OZOXJBPKs1Gs2XxIr0Us8Kzqv7An0gWk
         Qk3zD5IaIA4WREgzBtdB4ABrDpj1IWe3cEq4KN7C05DmA/KBBcs0wuIUvBnWCdY0YutX
         jXe7QQvExCagYzd3TDbxnHchEhf2tpY3TDqRs8mJtUp1IN7N7792+wwiOnthKgKKVNC+
         nRFNkf3/oardTW16/gNPR8BmG47+4hVkNUxFmLuYw1blqiXOQzg0L++EQIGxZ/nf6luc
         wXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8T+/sDmuWwwb0onJ41wsYJ/9KF51AaXeFH4oINlp1bg=;
        b=MT3slNxIyr4+yoQlwJE0eKloCcyg7o62D+ts4O8hmpl7yMwMXnmSOqs4PdALfxWbMy
         TYu5KUD+1oCXiUo/GNC+CtW90AztScD5J25gERARPlZeRSkvwA71iMjs1/pl0FuQe9na
         ZLYGX+RJKRJEW1LeeZTuNhUgHnYfXVsmV5w2j/ilABDvR9VrHA21jJQNiqXGkr0jQqd9
         ckHGbKgMdR9A1OVPuK31w5qeTxk+5ufrXPMQo99WXNCyXWFad7YxIByrkdMwcrbwW4Di
         YrZbjm6C4e0MbHVz1r6HgrpOcgDDx2pK8P2sj6b6GkzDrU/fRZSVjvsvmWAaOws27QHk
         mcBQ==
X-Gm-Message-State: AOAM530fGPlMf1P6kz+STWZBKrMTukLy55HBv2urmwAYM3ydn7XPRz/l
	jTgYNhbT3cSwz9+nG4h/gW7M9q6pXvCfig==
X-Google-Smtp-Source: ABdhPJzh/fK3VyVXogWNdhzG3Q+gbX8JadFKlbvJ5sP5JpTCZxdbLJT06fI28mfVGw30x+neYRxYsA==
X-Received: by 2002:a1c:55c1:: with SMTP id j184mr95682wmb.180.1603981714319;
        Thu, 29 Oct 2020 07:28:34 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id y4sm5404803wrp.74.2020.10.29.07.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:28:33 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 22/22] gstreamer1.0-libav: add comercial license flags as ffmpeg needs this
Date: Thu, 29 Oct 2020 14:28:06 +0000
Message-Id: <20201029142806.1830504-23-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029142806.1830504-1-quaresma.jose@gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb
index a50f65e981..9fe7957daa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.0.bb
@@ -2,6 +2,8 @@ SUMMARY = "Libav-based GStreamer 1.x plugin"
 HOMEPAGE = "http://gstreamer.freedesktop.org/"
 SECTION = "multimedia"
 
+# ffmpeg has comercial license flags so add it as we need ffmpeg as a dependency
+LICENSE_FLAGS = "commercial"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
-- 
2.29.1

