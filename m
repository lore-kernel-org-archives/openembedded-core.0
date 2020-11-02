Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.1222.1604335800863780001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QT8pQVM/;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id o9so17729906ejg.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oxI+5VQtrJy+lVSZFdbcbpUJJW14tiWOOFxl6YUdqj0=;
        b=QT8pQVM/pfaHG9Zxp7v5ytDjW3VGnH8XTijdUY+yT5UiI47gE7hDLJg8936zBkCpVe
         X3CWsWlZGB4SrMMZtwb3Hy6YpzpsXe5K+eX3ou8rTN3uKbPv295lQg4QykhOqmb7Rt/O
         5LAo59SmJNe4aiaWZbo17q7qSFvsk5DvOWG+VZM2m6FLpQNmkCyVWbBKz9TmH441z+/5
         /pBz4BqAQDETBvjJ9mJd4Z53Wji99ZDWYctcD59Cg370V+Pvbha/aGg+/bBgz+lSds40
         ys5+kYre4roDVvAPlUMvZCf7YESZ8/JFrw/Y64Qx9tarPMGzxFPtDVKhEX5/MbLtuxSI
         H4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oxI+5VQtrJy+lVSZFdbcbpUJJW14tiWOOFxl6YUdqj0=;
        b=jFv6agAmCxoIzzUCx1/XTbcRabSxsowAH9WEXlWMCr+pRNToz726ZFk0JKHXTwSQ+F
         wYfHVl4sKnjVfbum6uPJuUei+AK1N6vwufwzMyZfgLowNcAk3nPp8eEv3GiUV4ibtGtH
         pKlzn1aBFSrGUR81iBrFfF6YPkkaZrVhULZ3k9hIGF4k7V8Y/SsBs8YxMEwEIVgrt7nn
         Qe/vYdbPp2LtZiFNbvq/PUuel2mKjwj77eGySL3hV9jgBZ8cQ1yrJlFXC73OBYjOe0hg
         ww5fNtiW/xtQcCOuhV2ZS52QCeRbdVfC1ux+FJlIiJ9npNWvvx1jyPDhtR04MbTKjt2x
         ZN5w==
X-Gm-Message-State: AOAM532lG+qAjcEhEOOOy8ALU57Wl1OF1txm/Gu7PNDTuBm6u6RK29i4
	5Kj+4aSnhXPXpAZr8dB/5UpAkEoQPVl+yQ==
X-Google-Smtp-Source: ABdhPJzgpGV8D0zxRGeRgr1y496tkHMVUBE3oOBkq/mqkjURtuuyJn85Ugv9knk2aS5A65KEE8HmlA==
X-Received: by 2002:a17:906:647:: with SMTP id t7mr16758568ejb.428.1604335799284;
        Mon, 02 Nov 2020 08:49:59 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:58 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 47/80] usbutils: upgrade 012 -> 013
Date: Mon,  2 Nov 2020 17:48:34 +0100
Message-Id: <20201102164907.27572-47-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-bsp/usbutils/{usbutils_012.bb => usbutils_013.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-bsp/usbutils/{usbutils_012.bb => usbutils_013.bb} (87%)

diff --git a/meta/recipes-bsp/usbutils/usbutils_012.bb b/meta/recipes-bsp/usbutils/usbutils_013.bb
similarity index 87%
rename from meta/recipes-bsp/usbutils/usbutils_012.bb
rename to meta/recipes-bsp/usbutils/usbutils_013.bb
index 28031e72a7..51f909b795 100644
--- a/meta/recipes-bsp/usbutils/usbutils_012.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_013.bb
@@ -12,8 +12,7 @@ DEPENDS = "libusb1 virtual/libiconv udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
           "
-SRC_URI[md5sum] = "7484445cbcf04b3eacac892fe58f8d9f"
-SRC_URI[sha256sum] = "ae2e10aad530d95839b6f4d46cd41715eae6f0f1789310d793e9be21b3e7ae20"
+SRC_URI[sha256sum] = "efdfd5403dbdd7412de6bb897d5fbaae65ef3eb4332032c0e1f216216618e9a9"
 
 inherit autotools pkgconfig update-alternatives
 
-- 
2.29.0

