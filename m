Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.9663.1603981701367950524
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 07:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Swd+r8/o;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id w14so2982464wrs.9
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 07:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rcqV33IahlSh9ojQ/jK615LhsxTLnhIrUBH0n9NJcG8=;
        b=Swd+r8/oZM+zhU7n3nuhcUk/Dec0r8cZa1FQMb9sZBeBANCr/ScWCoBXiFpO5WWzbf
         0pDCua7t2J5AEBuwR7wI33Z1QsapIsEzCKm6KNcBgY1WmOvidqVxe8y/6GRTT0EJJaj1
         +s0J5qlx9qUot3Okf8/fqKGDB6b2mHzlbYDbxEJOdqMdheCEhgvme0v5Vdi3b552p9+j
         QaNatPf1DjM9JZZ1zVtxLSIiIoa0n2Ppq6NYLXUpDeurNkJV/oTS26m9oXgtTasCZpIh
         zTx8KCMpeV2WkRLdrW43IDBDR6UcfWEWfQtkb1KrlGae8iviuZziJpKb/2qZanlVI2od
         1d0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rcqV33IahlSh9ojQ/jK615LhsxTLnhIrUBH0n9NJcG8=;
        b=rhJCaFE3m9K1KWo1FXqKMdQTUeBfy6o/IYxU+7/+dksRwNt4X8iNAn74KzwIW6sxZC
         K85xLycL1F4Z8a4oDyOjR/+gzWxCrBqGrRiJxB7f04T/092O0fhB83IyvNH1xjhy5PWQ
         MEXWgqZ2P4YCJ+pZ8W4D1T17CQVpg6FLCAZCsDuvItuGwm79Fy/nZVhwrG4L72JdxD/L
         H51M7mo0z3tu82dfnrA5PtDFqoMAVZ9HjxIR/rDO3xPA3/+Z6HRibuNynM5wf9hkALWg
         8tbXr7IBu9Xn6x9SVm0q7lWo/aKUGC7kSH20m6x11taexZz7D3mJxql3HmEJ6MsbEv+Q
         f9iQ==
X-Gm-Message-State: AOAM533cI5SXBfEMENx9+1v41RNlQIRKqVcxoExLOBZI9ZfslvtxsJxc
	Na+d0HT4KH3LGyEkNRN8FBdmXz+UNRMUjA==
X-Google-Smtp-Source: ABdhPJxX1bZEm3+HEeIF5zSYZViGvfDassaYLxCJcvwbbIz+gc35Zal9CJ8aryi5keNi+IrPRChphQ==
X-Received: by 2002:adf:fe4b:: with SMTP id m11mr5685949wrs.98.1603981699741;
        Thu, 29 Oct 2020 07:28:19 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id y4sm5404803wrp.74.2020.10.29.07.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 07:28:19 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 10/22] gstreamer1.0-plugins-bad: add new meson options as PACKAGECONFIG
Date: Thu, 29 Oct 2020 14:27:54 +0000
Message-Id: <20201029142806.1830504-11-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029142806.1830504-1-quaresma.jose@gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
index 903ca920f2..8f9036b8ec 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
@@ -73,6 +73,7 @@ PACKAGECONFIG[srtp]            = "-Dsrtp=enabled,-Dsrtp=disabled,libsrtp"
 PACKAGECONFIG[tinyalsa]        = "-Dtinyalsa=enabled,-Dtinyalsa=disabled,tinyalsa"
 PACKAGECONFIG[ttml]            = "-Dttml=enabled,-Dttml=disabled,libxml2 pango cairo"
 PACKAGECONFIG[uvch264]         = "-Duvch264=enabled,-Duvch264=disabled,libusb1 libgudev"
+PACKAGECONFIG[va]              = "-Dva=enabled,-Dva=disabled,libva"
 PACKAGECONFIG[voaacenc]        = "-Dvoaacenc=enabled,-Dvoaacenc=disabled,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "-Dvoamrwbenc=enabled,-Dvoamrwbenc=disabled,vo-amrwbenc"
 PACKAGECONFIG[vulkan]          = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader shaderc-native"
@@ -81,6 +82,7 @@ PACKAGECONFIG[webp]            = "-Dwebp=enabled,-Dwebp=disabled,libwebp"
 PACKAGECONFIG[webrtc]          = "-Dwebrtc=enabled,-Dwebrtc=disabled,libnice"
 PACKAGECONFIG[webrtcdsp]       = "-Dwebrtcdsp=enabled,-Dwebrtcdsp=disabled,webrtc-audio-processing"
 PACKAGECONFIG[zbar]            = "-Dzbar=enabled,-Dzbar=disabled,zbar"
+PACKAGECONFIG[v4l2codecs]      = "-D-Dv4l2codecs=enabled,-Dv4l2codecs=disabled,libgudev"
 
 # these plugins currently have no corresponding library in OE-core or meta-openembedded:
 #   aom androidmedia applemedia bs2b chromaprint d3dvideosink
-- 
2.29.1

