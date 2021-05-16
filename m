Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.11637.1621204380034303559
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HhsmO17d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id x8so4447163wrq.9
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oTPJPZh7rI9BcJAJt6UH2SbtO1/b+Vgk4IJkZsP7/QQ=;
        b=HhsmO17dFndBuEOBGor3hQrTd3mECVvz8IF4wr2oULRERCsuZQD+48qg6tO4WsDCHS
         t0gholErUl/rAx0w8/Nu2KankF3SGYUH958bCWawe9OwyXF8+UZKkrwtgsbsDw9llEV1
         GANHcFeiJbqwSB01jQUWkLoKORmOgRbxEX25M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oTPJPZh7rI9BcJAJt6UH2SbtO1/b+Vgk4IJkZsP7/QQ=;
        b=dZyngUywqY6Gb82olsOTIe7tpSYItManZJ8MANoP/NsZH867HlRodya4zzvD4G0y6m
         SclXE+GFoMctPYS9vd/j7owgIZAE9iec321uNbMZT4NWfh1zoBO1gc6WkLvl5Op6xCAx
         tNDnZsD3Mpl4BHShLBvbNOdl550ICE33fMnWrsDiZPT3mBj11bohTK0LN2rKz2hQ2Xh7
         Onrxg8WX/FnNLmxY/TQqn3SzVThSWRKbP5kj0nhnNHrd3iH9LULSK/4SwEVQF9WoKci5
         ZNifpnNo/9kla3LAfZ1K1PzgQEZGSo0668/fZ/Nsl3unucmfD30rVKadCsPuY161xehE
         zGUQ==
X-Gm-Message-State: AOAM532UtKVzMtJAkP7OJq/KXh0gfzS3Ah5HTqqIh1P9w4PVGRv3whd+
	esK2AKzdACNGoJ/3bR7wKbtk3Sd9XrVa0A==
X-Google-Smtp-Source: ABdhPJyz8/Qz8SiKVBZJ6Ypr/BC7MlpBqaMsam6C+DRcHysYoAdsXyx2klZMA6e78HmhfQ6IFNtxKA==
X-Received: by 2002:a5d:4046:: with SMTP id w6mr22156566wrp.15.1621204378491;
        Sun, 16 May 2021 15:32:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:58 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/27] hdparm: upgrade 9.61 -> 9.62
Date: Sun, 16 May 2021 23:32:39 +0100
Message-Id: <20210516223247.2401235-19-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-extended/hdparm/{hdparm_9.61.bb => hdparm_9.62.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.61.bb => hdparm_9.62.bb} (90%)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.61.bb b/meta/recipes-extended/hdparm/hdparm_9.62.bb
similarity index 90%
rename from meta/recipes-extended/hdparm/hdparm_9.61.bb
rename to meta/recipes-extended/hdparm/hdparm_9.62.bb
index 459a62a8330..026772351d3 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.61.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.62.bb
@@ -25,8 +25,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz \
            file://wiper.sh-fix-stat-path.patch \
           "
 
-SRC_URI[md5sum] = "3ef06831e83890f0ba48f7a252b93325"
-SRC_URI[sha256sum] = "da1a1c3887f10b8397e8e02013caa61142e0e72cb0d73997421ca2f2f4df5343"
+SRC_URI[sha256sum] = "2c0f9d75cdbeda928a25a128cd3d0b7120445ec0910c0b29d4c1038ed1be777f"
 
 EXTRA_OEMAKE = 'STRIP="echo" LDFLAGS="${LDFLAGS}"'
 
-- 
2.30.2

