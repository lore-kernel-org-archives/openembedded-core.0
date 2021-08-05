Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web12.10489.1628177805514257160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 08:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=NBbcwUzv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id f20-20020a9d6c140000b02904bb9756274cso5557021otq.6
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 08:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DibFP0sfw4B4SD8gK6GSeQ8cdTq3xTx+Uv9YwUpsicA=;
        b=NBbcwUzvEFlb9mdkm3ELPEJovqKslN9E6IEuQcRNd9yLTPZJAAntWn8MrRWG7gkKA7
         3zqSVr4x05B+1EPaX8/yp28/Dlz4dZo1ZFZp8fB2zk7yyP7Jol2O68o4XeoU0Cx/hYQM
         7sTrGppjyS1xNJ/g99P60lR+ZeYIQ7gxav1saITetYEfKawss7Sm1Drh7c5W78l1D1RP
         RCyaVQOVphI4CmaF0ixJpkCeDtLDWQFvLy2VIDaBleNAuXBYixEYEstmSw7wfjr+Hb2w
         dA4I6UgAYTAXaWvM8rwCvs9nHCxOV8ur+RFeG+yP6UU4BCRqhN9afWs+Pk1DE555mrOk
         wHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DibFP0sfw4B4SD8gK6GSeQ8cdTq3xTx+Uv9YwUpsicA=;
        b=C2fyfqdRVCjPPZhQpp7tuGhTuVLSaDOIGPyRpgq//4XpJhO4Zle9++Cbaw8a0rndwY
         V37t5J7dINGzjQqVX1J92hQ7GENR9OMbwXbCaMTmyskEUHXr6BfKYEWyk8HmVs4GadYH
         jrypW4n/Dw/xJugTpko5qtnsk1FzrfPl1i/n9X5ByckC81126aF9K6pukxxXsaoOmT47
         Jykjdcj5E60xLYtA1J/TeudFunHH69pEhhrxCDfQVg8Dve5whnmceoLNdVxpA+ogMOeB
         BC/GUQhPz1Ye8FbuLWidHRqcwP7CJats0/aNh+SqvynYv1p36bClYk9YaL5m+JmkjLeq
         QHMA==
X-Gm-Message-State: AOAM5334fCLvI7d9aMV4fAe2u6ApvjgwOEa5QelmBI4GHhfRvKIvmTGw
	NJtR6Sj/fMy4OFLc54vYvy5YbXF1tP9LlfdU
X-Google-Smtp-Source: ABdhPJzvnYq7gzwHaQg0A8mhu5LTWAQ3J/vPBWji0f3BJBmVAfsYlHD7qqQkLScEuK7Lq+fEnejsBQ==
X-Received: by 2002:a9d:447:: with SMTP id 65mr2543544otc.197.1628177804498;
        Thu, 05 Aug 2021 08:36:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id bf41sm1103076oib.41.2021.08.05.08.36.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 08:36:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/33] qemu: Enable seccomp if FEATURE is set
Date: Thu,  5 Aug 2021 05:33:55 -1000
Message-Id: <10aace6034e4ca3d09d97c4e2046d8eef3078164.1628176985.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628176985.git.steve@sakoman.com>
References: <cover.1628176985.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ruslan Babayev <fib@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu_4.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu_4.2.0.bb b/meta/recipes-devtools/qemu/qemu_4.2.0.bb
index 9c76144749..f9905e2812 100644
--- a/meta/recipes-devtools/qemu/qemu_4.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_4.2.0.bb
@@ -26,5 +26,6 @@ do_install_append_class-nativesdk() {
 PACKAGECONFIG ??= " \
     fdt sdl kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
 "
 PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
-- 
2.25.1

