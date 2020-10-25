Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.27249.1603635839718056595
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2020 07:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lmv27+Sj;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id h5so9580937wrv.7
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2020 07:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YOuXWVzQNWMGPxwuK75OD+vkeeamNzGY1IOiK9ZqL9A=;
        b=lmv27+Sjd8ZUCq/lbpBWznb6jsIiAw8RAPl2ZfVeeHqHadrjKtquJjNeKMUtuq/zm+
         uQ8HksKQZCf5YDkHqxVMkpTLMX1dlMdm/+a9g/XciQFEqAdXD5kmEhZDcOu8JtVmRRuO
         gpFmEOHI5e2oN2oRiJQq8mFb0KM30bEhQqd/h8oNaHnuxYpw2XYNnrrJnvOg9v4iko66
         WO9abmVOBF+KmLX41QjoNLrHDhtS6j8NtntB5MLGCKpcyiPR/UztsUBhA2NyQuxtk42W
         VHXayLTiWGSyzcud690qa7ibeIk1ukuTA9IGR+PGiS8HTAai/2sORuRK7AhoDhj96UZu
         aerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YOuXWVzQNWMGPxwuK75OD+vkeeamNzGY1IOiK9ZqL9A=;
        b=YhhccJcikTBjHfDfmoqfBZgG2IzkWiMX5zre/VUcFZL4kMYy6x9BSxJ7RKJw52okz+
         s1vToVqP3BA/hQxjO9fBtXA5rO9NO8hxn8eo9qOf7TEXsCFOVlss2nkIjq/MheR3Ulcq
         iwXHoodkg5/pLHdfzISRyIeGR56TZVyFF5TuYp0lKcJ0Rq3DpqlKt/p9zorcB8oHuEfe
         +4XBpOn1GxCC6bI/4N+x/+pSIFHZyStqCOllDU8nsa6Q41yDu0oJm+o51ly3Q8JORV81
         MiT6wwK+McxZAX6E39jvrw3ir05nHHUMT7zulmtAYbYB4IdRDtD94c3tvVCLT1L+QMaJ
         /I8Q==
X-Gm-Message-State: AOAM531fOtURbrepfl0oVj6nRa8SDKMcM4Jai7CXDK6pLRqIFofTOqSH
	Z0wkyyQbtKpFjPF6RjQbxeliwU9rjghpIw==
X-Google-Smtp-Source: ABdhPJw3CgVGL5ewJD8ukRnEw+f1chG+YKxwCQ4LbDLEWvy6fo2Tea0tEGovVEhN2uHDZR2DUf/hyg==
X-Received: by 2002:a5d:6a0d:: with SMTP id m13mr12800045wru.161.1603635838133;
        Sun, 25 Oct 2020 07:23:58 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id f14sm18041731wrr.80.2020.10.25.07.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 07:23:57 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH][dunfell 04/12] gstreamer1.0-plugins-good: Update 1.16.2 -> Update 1.16.3
Date: Sun, 25 Oct 2020 14:23:45 +0000
Message-Id: <20201025142353.1929717-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201025142353.1929717-1-quaresma.jose@gmail.com>
References: <20201025142353.1929717-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ins-good_1.16.2.bb => gstreamer1.0-plugins-good_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.2.bb => gstreamer1.0-plugins-good_1.16.3.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
index 17c9421394..75dd029109 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
@@ -6,8 +6,8 @@ SRC_URI = " \
             file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
             "
 
-SRC_URI[md5sum] = "bd025f8f14974f94b75ac69a9d1b9c93"
-SRC_URI[sha256sum] = "40bb3bafda25c0b739c8fc36e48380fccf61c4d3f83747e97ac3f9b0171b1319"
+SRC_URI[md5sum] = "c79b6c2f8eaadb2bb66615b694db399e"
+SRC_URI[sha256sum] = "d3a23a3fe73de673f591b7655494990c9e8a0e22a3c70d6f1dbf50198b29f85f"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.29.0

