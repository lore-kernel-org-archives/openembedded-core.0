Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.9684.1603981709770842665
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 07:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gwfJ3/9j;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id h22so71882wmb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 07:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bZDvYq9aCCZFLdsysyOpz0BkwFBHfzuJZpFCRuyjpxY=;
        b=gwfJ3/9jB15ni2pgFITrVRtv734RsTvnoCNZRhXF7C7/ZLktLSuSvmfCFJp5+GANrc
         LdugNIIzMGBGGKVOsU3IZlSDjaJ2YOEOUX164u0YN+HWhsWCJ0jvsTFoWT5cig/YeBu9
         JmXMBSLqYZ8YL50QtaUYmCfwiVnGRvgAu4KHOezn1f6trdUtRv3B2u4N4KI6xgVqzeST
         0yJpHkrCFN8zzFvp3xly74MSyHC/CC0wbcaNVaxq6TYKluKh4z90FZj573ZZsM8v/rm1
         ySUzfN3geEJANwKDZodwILTfA4RGFEdiR4AcVCSYZOPfKHke600D8QX6UMfGVHGlHlzR
         /8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bZDvYq9aCCZFLdsysyOpz0BkwFBHfzuJZpFCRuyjpxY=;
        b=ZzxoYbJOPmjsvI1gJhMmIpYwYOYVYDYxQSoakQPXqLkIZotzGWrmph7ozl4n5RfLFj
         XgkdCpk/n+THOMHnIH7A01Uft6Z7v80abPqJte7h00DABLHlaUPS7spjLAJOLpStHs2Z
         DTSHq0lklbPqNhgkTxFRIrN/16WCtd0Pi87tZEFdF2irrZD3RD3qP96D++8U8L2NlFip
         MlE6WMdIwYPo28SNGGwqIM31PAelapcJ40wAoijZ5KNkUYZgcmLn94Zz9Qk4Zp6qIfPo
         gAcKU5jvcIlZ7MfaiEDkF5+2730BS4JAtTsye6kd0B1l+vZ28//TSPHyyxLlHyoTuUcw
         uRxg==
X-Gm-Message-State: AOAM533qHGJE4GrOH+IFaMYWo1bCqnpohDrmLLrcWHgPeJyhMAkptFXj
	VK0+mKtdVQ5Xa0ge7Ciqz1Ob3ObcNo4oog==
X-Google-Smtp-Source: ABdhPJw886FBvIInJC+HuspDcxcKrsQ639Xxq9k9DNB/WsbjljejmGRsugqsoD0MXdyA5x6NCDKX0A==
X-Received: by 2002:a1c:44d4:: with SMTP id r203mr104038wma.152.1603981708025;
        Thu, 29 Oct 2020 07:28:28 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id y4sm5404803wrp.74.2020.10.29.07.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:28:27 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 17/22] gstreamer1.0-omx: upgrade to version 1.18.0
Date: Thu, 29 Oct 2020 14:28:01 +0000
Message-Id: <20201029142806.1830504-18-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029142806.1830504-1-quaresma.jose@gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.18.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.18.0.bb} (92%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
similarity index 92%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
index f1bdbd235d..c4855034e0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "6362786d2b6cce34de08c86b7847f782"
-SRC_URI[sha256sum] = "11ed411a2eba75610d72331eeb14ff05e2df28f4fd05cb69225a88bec6d27439"
+SRC_URI[md5sum] = "dcff9e4f055a2b1ecadc9f49f5b60a2e"
+SRC_URI[sha256sum] = "302c65e04578991364f7605e04cfb54dfd75268d51080d35f221ee1a8b341fad"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.29.1

