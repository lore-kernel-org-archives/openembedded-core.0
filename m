Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.18811.1603023029906025916
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 05:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aMeauP56;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id s9so8299945wro.8
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xMryaOF0xuPSxy3seS02avKMtCGmr7mWh7lTU8mHdN0=;
        b=aMeauP56KwbzE90bvIm0BT+llrNXmtPq9MspwdpRJCIt7LQWS1GpnwIIDsVf73fViC
         5i9L2I26UpgW7yVq5wT2PpUGnhcRURGeNpk83CIYz2hCjplTvsOkcn3M3dUfSIWJCPDg
         X1zUN5TpsWNat2TS8JtCqoHx6V+csz7HvjhoRqQ0h8isBygcM/PLR3IMOzTRwEvWup7t
         sMkuflJMC4ceykydQwB/2Z1ucdgpmj2v4aqQbCCF1T4DNH5dS7tBwJ6XT++J6CslQ2VQ
         0utO4Mj+j5h+DJQ/kgh84VG9b5PuJ9ilgVHSBaZ89OB8+O2D/uWuLP5WvlScBkWfuNa7
         544w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xMryaOF0xuPSxy3seS02avKMtCGmr7mWh7lTU8mHdN0=;
        b=kZP8+6AxIgMoA0nmixL8/0ziMg82xTgHo8neb2a/zGXdn0kQ8WzB0kuVBe0lJJrOQ2
         F6ohq1LZl25pe3+K2Rg7gs2SzhSCFDjxGc25zYdV50i+aeS3hU7O2dALQSaRCM57WfYe
         HIJha+9BfrNi3qLpQLHCwZe+p29ABwPsGIi6zlvgPq9XNqcDOrimL/SBlUVXqHMu6oER
         fhQcHEgfLKMZq7YYtYWFFbDXMmhErBEfODAAYMAuHK5BOW4i6G7kVxzurQrglQBVnEqX
         wslbbwE9s5MqyBdeK+Y6AVc8Bm4JbNBQz15Og7w0iTAf61cfnk7NbmfBzdMdqsRUNuns
         Aw5w==
X-Gm-Message-State: AOAM530HsagnmWWJ4KBLg1oMAAoS37XpS9/EBL2t8z/IwzQkLTpv+eZ4
	0DLlg3LqstirrAztVgQDhbQ4Fv/O3f/X6A==
X-Google-Smtp-Source: ABdhPJxXh2VEFajbfTHNdIfX2vGsrXD7b6bNVe7dnVue28sD7tdSwsu6lBEKuysAzfmCKbPRovjbCw==
X-Received: by 2002:a5d:4f0b:: with SMTP id c11mr14407204wru.316.1603023028259;
        Sun, 18 Oct 2020 05:10:28 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id z18sm9511084wrs.82.2020.10.18.05.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:10:27 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 09/20] gstreamer1.0-plugins-bad: disable new meson options
Date: Sun, 18 Oct 2020 13:09:51 +0100
Message-Id: <20201018121002.1417335-10-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018121002.1417335-1-quaresma.jose@gmail.com>
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
index d209107805..903ca920f2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
@@ -100,9 +100,11 @@ EXTRA_OEMESON += " \
     -Daom=disabled \
     -Dandroidmedia=disabled \
     -Dapplemedia=disabled \
+    -Davtp=disabled \
     -Dbs2b=disabled \
     -Dchromaprint=disabled \
     -Dd3dvideosink=disabled \
+    -Dd3d11=disabled \
     -Ddirectsound=disabled \
     -Ddts=disabled \
     -Dfdkaac=disabled \
@@ -113,6 +115,9 @@ EXTRA_OEMESON += " \
     -Dkate=disabled \
     -Dladspa=disabled \
     -Dlv2=disabled \
+    -Dmagicleap=disabled \
+    -Dmediafoundation=disabled \
+    -Dmicrodns=disabled \
     -Dmpeg2enc=disabled \
     -Dmplex=disabled \
     -Dmusepack=disabled \
@@ -124,13 +129,16 @@ EXTRA_OEMESON += " \
     -Dsoundtouch=disabled \
     -Dspandsp=disabled \
     -Dsrt=disabled \
+    -Dsvthevcenc=disabled \
     -Dteletext=disabled \
     -Dwasapi=disabled \
+    -Dwasapi2=disabled \
     -Dwildmidi=disabled \
     -Dwinks=disabled \
     -Dwinscreencap=disabled \
     -Dwpe=disabled \
     -Dx265=disabled \
+    -Dzxing=disabled \
 "
 
 export OPENCV_PREFIX = "${STAGING_DIR_TARGET}${prefix}"
-- 
2.28.0

