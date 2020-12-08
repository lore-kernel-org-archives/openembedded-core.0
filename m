Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.10877.1607444027077380035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 08:13:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hV0MqjDZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id v14so2509068wml.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 08:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=luiGn3KzXzbtviJj4pdWnCNts3bqnLjr38X/3ZMD9Ys=;
        b=hV0MqjDZuhMk4+dtAsfZenqGRldsIKeBbREoU88APwT0n/Wvl3AqT6by4pkVPTL5hF
         ccDXgD6XNFqFq20LbEcxd4rsX3D3S6TG26cF2JFHvBMTCA51LNhQhcLgciHFyiYfFaNE
         8FyjUhueLpSWSZS6CFQuFMSNa9Qot979x6zOlayFPy114rHM8hjl8n99U7rAOB240Y1V
         /kbXSZpvJac/yPqDYYKw8OhLFHtpK9YsgkNWrX8ISgXqtYArJJZbpWVqXdJc47Q8WP1H
         Qm+ea58HaYSfe638kOKURJbziUYsRJdpPD015GX4NMmGl1hZwYVfDSbfIL59IdpOz5uP
         kx2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=luiGn3KzXzbtviJj4pdWnCNts3bqnLjr38X/3ZMD9Ys=;
        b=ekCoBfDhtInY9P1pXH+dX6ragn06mT6IpTAjYVo4EBUF79cRqjnygyYtCm6U0G2o+S
         j7vHW4/v/5BdKpKoit+RJnEtgNO6i7SXxzb1mV5TssOJ/n//JsMqqVYxSaUTeo1bTQV9
         f7wP55fj5p52g9cv4wJgRKgFUqlXxfoe6BLPDaNFHJJweHZ/bWEz6eB2z4P5VinUhSuS
         PhggXXwJf0rDlbECnqO/5eyzYYAB5GYPjzDPm6KoDBneiMmMbum4YWeI5nL6HlCEA9XU
         djWyyxZhMYiJh7E8ka2vEz4QmCWcg5arUep+/RInGaZLSbAog5Yka0PLLZP7obqNYchM
         A9uA==
X-Gm-Message-State: AOAM533YydWoXukn4VmsRe/AKIyUQ96ExIwINPvdOcpPLV63JMbbPlct
	Otn3TxqH6EJADMulF5CnVOndDGYKpkg=
X-Google-Smtp-Source: ABdhPJwSMNpOU3GZHZvrBlVg7u7FqJZpvBPxqeJUb+TQ2UJ6f3nCchQFYwy1LucaFHBMnr9ELhv2AA==
X-Received: by 2002:a7b:c849:: with SMTP id c9mr4542821wml.101.1607444025290;
        Tue, 08 Dec 2020 08:13:45 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id 35sm15232307wrf.9.2020.12.08.08.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 08:13:43 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 8/8] gstreamer1.0-plugins-bad: remove meson option for plugins with dependencies always present
Date: Tue,  8 Dec 2020 16:12:57 +0000
Message-Id: <20201208161257.949716-8-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208161257.949716-1-quaresma.jose@gmail.com>
References: <20201208161257.949716-1-quaresma.jose@gmail.com>
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
index d37a223254..a43261b704 100644
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

