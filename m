Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.9751.1607440134982215668
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 07:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FZ/px1RX;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id a12so9773365wrv.8
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 07:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+QhxS3OsqKvOy91tLENRMu8dvLrUJCb3dwzhS9QZP1o=;
        b=FZ/px1RXs7UB9UTjj5UPukkBvbuuW68lbSuPP6atuBFhXl+yU6gpUafS+NHXdj+YFj
         CQqnOwyB6r1j1r6XhN27OSx2cRU1qlY1JWzQQvd88s+aLcKQfdZoueiV3OaSzdM6PweO
         Ii8Jwkl8eLkQ43DD01WPg63aAHW+5fJ/xgHcUnvqIFBl/xuEyR7s/TEotkQA1Z/imL8i
         cQWOLk/NeCYtZ9HfFB0/Y2eno5Bxz3D6qjGatOIGjcvDKYCM7j6+QPr287fCc4GrkS9F
         1d76ztTW9DRP0fD2N1Xl79mCF7resV38TPX3waWIWJ4+Yi6EW7Xaz6nOgKECx3WzEQZx
         n4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+QhxS3OsqKvOy91tLENRMu8dvLrUJCb3dwzhS9QZP1o=;
        b=U2BTO1YcHyaRcgGuNVD332Wspf7OYx76/pm0CPrRgjp8cgbjZ1FGQIs5NtcDCMyHVM
         KqR49QMuRaWEhBI2IbsgZ5Hyei4Ch2d9V6ibmtIPi0y5zZ7IPfqUQo79GanOt7IvktSz
         Tg56oqgAe5qn4NFUW/WThB6tbidE/OFsHsF3OREhTvMwFIl0G8PHnyzebByhO9v1BtNX
         Tj6Bv01YgXFR8UzBOrifvfxStMz15Ah0GBe1fM5EIpMROIWtS4Xyfy6x5VueTon7nzsT
         zEzmMn2lw9nmaj+wmlb/0jD7HWIJRWUO78usAoJzkMaYl++n3wzy/+87kigCe7VLe16e
         H81w==
X-Gm-Message-State: AOAM5339OMGiyn0pswINTZmadihfnN8vQ8EW0v+SsVdV8CV0jDKZUVBO
	ZfEVAm/pGVpuXXal3o553YmKmXKGIUU=
X-Google-Smtp-Source: ABdhPJy30bGIW9InlOK9MrrHHm6V5fau1GDpDajkcnQDyF+EfW8ADukJWWxsL5oO0UQ3M8IEgn0w4w==
X-Received: by 2002:a05:6000:c9:: with SMTP id q9mr11268594wrx.259.1607440133388;
        Tue, 08 Dec 2020 07:08:53 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id h83sm4418607wmf.9.2020.12.08.07.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 07:08:52 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 8/8] gstreamer1.0-plugins-bad: remove meson option for plugins with dependencies always present
Date: Tue,  8 Dec 2020 15:08:16 +0000
Message-Id: <20201208150816.744752-8-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208150816.744752-1-quaresma.jose@gmail.com>
References: <20201208150816.744752-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

decklink: libdl (glibc)
dvbk: kernel headers
fbdev: kernel headers
ipcpipeline: gst-plugins-base
shm: librt (glibc)
transcode: gst-plugins-base

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb            | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
index f0764e0852..ed9ed40c1f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
@@ -87,12 +87,6 @@ PACKAGECONFIG[x265]            = "-Dx265=enabled,-Dx265=disabled,x265"
 
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
-    -Ddecklink=enabled \
-    -Ddvb=enabled \
-    -Dfbdev=enabled \
-    -Dipcpipeline=enabled \
-    -Dshm=enabled \
-    -Dtranscode=enabled \
     -Dandroidmedia=disabled \
     -Dapplemedia=disabled \
     -Davtp=disabled \
-- 
2.29.2

