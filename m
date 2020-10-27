Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.93.1603837792759432579
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 15:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VE6gvXxy;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id o3so1593647pgr.11
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 15:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=WToZIjMuCXXSSOlC2rXIs9tZYesM5E8jyOzHdGk8/fk=;
        b=VE6gvXxya7VoAUyXnYR8z9J8Q2+ZwSYDMLIb/ZUIaEsHo/hJAlOVNxbnsxPqIsZ1Yb
         CWMNXoBRWm1ZUiDP0uPcY4yPcDMdhsDCHdEIcWq0wmlKRn4BjMFtcS38QESSzVTgaof6
         83DZ4zq01Hl7FX6cqhjDZlCet4KZd9q/zM+GWLh9WAUz/pA//JypZ3iYRobFtRK30FCP
         jj3/KPYuz8TcmboYFPmTaOxu2Bssbg7k40Zpq7xuCxQvRSFiDq7QIvniKV7ajZBAQMdZ
         DDK/CH2Mr/htZjH11uZIajOYtheEry2u3fM3T72xWW5dU05wNR1WCVBdvx9+KWz94K8P
         ZMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=WToZIjMuCXXSSOlC2rXIs9tZYesM5E8jyOzHdGk8/fk=;
        b=AjRN9f57MqAwCCQmpcS+VHRuoxcsWQ5GxMll18ROMzGx4rX6IPNYwNAWwFZVEoUJop
         u6769p5rpAzCwmD8Pn/ENvTGz2eDDliXvlcUVeZeYsn+19VDtTONHlUzCpUVkYMg2rh+
         YGDPwuRwO3GCvInDJxFB9H33fnGXkMs7n+7Y9jb3Si6JcT/BvAlL1WmaS0YaS/YsJNyP
         jlzwUd2yM06q2dbasPsuGyEHXPVfPrwI3rsloUm6QIs1b0cbsQCY6yk2GLVXDQWIh3/J
         VFCTZR+CZ0JCumsbEpnTxGErPBoE5EuO0kuYNbh5UMrVAyo0klkeYjre6RnMbPyMgOJL
         zh3A==
X-Gm-Message-State: AOAM530cnp9nPozgoFeBoTH8mMZf25ugZjvS4JRfXNSLpGrdc1QVLt0S
	xftZ7pKIBp56Wz2rgBkNpQhlyhBrbbJMzd0a
X-Google-Smtp-Source: ABdhPJy/h21RV2rd6PyXRuNIaRR2neYs4c5nRJd5cl2O40T26z/DkXzQ27jBV58CPVGPN3IQYNa+VA==
X-Received: by 2002:a62:7d15:0:b029:155:29ed:db4c with SMTP id y21-20020a627d150000b029015529eddb4cmr4182999pfc.77.1603837791908;
        Tue, 27 Oct 2020 15:29:51 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b7sm3699000pfr.171.2020.10.27.15.29.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 15:29:51 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/16] gstreamer1.0-plugins-ugly: Update 1.16.2 -> Update 1.16.3
Date: Tue, 27 Oct 2020 12:29:13 -1000
Message-Id: <cb759c9a077ae8e4c4a5e8235b7b86bd5304ed23.1603837524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603837524.git.steve@sakoman.com>
References: <cover.1603837524.git.steve@sakoman.com>

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ins-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.16.3.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.3.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.3.bb
index be10800389..d9ec82d887 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.3.bb
@@ -9,8 +9,8 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[md5sum] = "10283ff5ef1e34d462dde77042e329bd"
-SRC_URI[sha256sum] = "5500415b865e8b62775d4742cbb9f37146a50caecfc0e7a6fc0160d3c560fbca"
+SRC_URI[md5sum] = "b025125a6c928024cbd300cc27b5d712"
+SRC_URI[sha256sum] = "403c21688065f41e53008874402b5c07832567cc1309a60df597eab7ff5843f0"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.17.1

