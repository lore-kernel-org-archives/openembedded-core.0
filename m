Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.5355.1605279174437610069
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:52:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xULsqqog;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id cp9so4649971plb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=eVKyoicj/YTfIzKxj0drSZszjGvFIO7iaKm/JM4rf2A=;
        b=xULsqqogvzEtXZtmejBtP3MHq0CuWK/VKIrZZDcXyR7c/ZeaZ/KfGuJyOLYjmD1X2x
         ZtnYhCYwEM5F0/nboAm0AgaA0jRaXsUfbR+3imS0mf503cELF4+ngHF+l95dfuFwbG5+
         kTTJ1I/qxlGi0nT8IFqiJxUhbWQnnzgVdpx7UfOc10saQkk6zZPVkB6otW6Z+Gi7BCZK
         zzHLm1WND8RVafkX2gsk47mLfhonvvJm9uUMljwVT4T1hdqXik7aKrl5fL17dFg3kXe2
         SqrBP6951qgywsBZ5f9Dx2GZ+Qbgk6w7OnF07rIFGRjvEEUlSyP8gDIJD2kmE32xENdC
         2QuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=eVKyoicj/YTfIzKxj0drSZszjGvFIO7iaKm/JM4rf2A=;
        b=KSufZnA/WX74gzjfXZdPyAWsMkaCfXESxB8HaXetmCRChrostHg5ZVDBdExZysVHQ2
         soYfq4mmX0DaDoLQk/+npVjVelb8L/Jn2CRJTsYVR2uXOxaHiFxMWyx80dIIeyMxfD5K
         lcEkmLBnPGRlt7dF760iJR+IP9J3HHVGntDrft6uZo/tNkqKtWonNr0g4pJWNi4E0j78
         O6KIWRCM0ZJ8smPkU5z34TtpkuxqVgH0p/9FhW+B0NYfB+A4ZFlHOCRYDzJDPojnrGFf
         DtF/v8mgNyjMO6/oX9iqWUeYarKvdFRy2mdjnlaV0wfEZ8gBsLaM85PRzeQu2ybsy6lJ
         MYKg==
X-Gm-Message-State: AOAM531VPW0YwJrxiALjPt0PvBsPDSh/WTdbLp6OniRMrZrPl9jc71HE
	gKpU+pvdXUzELG6tkS9OEpSjCC4/1hwlmOZv
X-Google-Smtp-Source: ABdhPJz3GhQlLyt0bw5URg0cKObMPLSgW88ATe60czfrvnk98V21dGXWjPmll/Yxr7qHXfLM4X2Z7A==
X-Received: by 2002:a17:902:c281:b029:d7:ce5d:6406 with SMTP id i1-20020a170902c281b02900d7ce5d6406mr2261307pld.35.1605279173526;
        Fri, 13 Nov 2020 06:52:53 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.52.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:52:52 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/18] diffstat: add nativesdk to BBCLASSEXTEND
Date: Fri, 13 Nov 2020 04:52:11 -1000
Message-Id: <537847e60b2d0a04a1a15a857201be9f8c2aa9b4.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>

From: Nathan Rossi <nathan@nathanrossi.com>

The diffstat tool is part of HOSTTOOLS. To support hosts that do not
have it installed with buildtools-tarball it must be enabled for
nativesdk.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0ed002422bc46539f1d71ed19ee17358b6691bf0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/diffstat/diffstat_1.63.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.63.bb b/meta/recipes-devtools/diffstat/diffstat_1.63.bb
index ee0a7e7bd6..61b2ea5dc2 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.63.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.63.bb
@@ -27,3 +27,5 @@ LDFLAGS += "${TOOLCHAIN_OPTIONS}"
 do_install_ptest() {
 	cp -r ${S}/testing ${D}${PTEST_PATH}
 }
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.17.1

