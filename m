Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87776C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:46 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.3500.1637741325878284692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QdqEdfaQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id v11so2580617wrw.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aOtH0YO54t0+Jma+Dg4qKLePX8vGGUK/QegKnaEVNKo=;
        b=QdqEdfaQGfyM+UFt0h/7nZplRPHzxxc1q9W7VyTOJOsXYajK1XiHQA+GQj0NggPKLv
         L3F4k5fSoczgKnRpZQn1gl7OwcjFbjSmx/BckoIXx5ZEBsajjU1D2bz0EjVoYSaMY/mg
         K0BEP34MLtTXLaSDtdvCbKoKvyXh9wcS9GZss19O9NZ8/ZbRZ37GD2uC9rJePbwhaFWO
         0EN4NmVFdKson9cBVUdC6CtL3FjltaygC0ukXI+k1SZTPPJRN28uEck7M8oX3hSZxT5D
         UvPqvNXaFPGpK0ynBSKASg3/PFn2RdnQV+nKD+NNlB169EJX44ZIUNmuVhSZ2vOqNQcJ
         5AFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aOtH0YO54t0+Jma+Dg4qKLePX8vGGUK/QegKnaEVNKo=;
        b=zKt4K3M7PbgaT/FQUAkMXzPp+XbSrjEXjS/iCaLY9PjWe9GxQisoHnrgXazmPRN2AT
         r/AsZu0F+9COxiFxGnfnxzZJtjXVfQwtf64OmUltOz78KyJsgUYQ9Z8Mv5wiP+TtN+cT
         siRfzWttgpDbDePfJ/ZJuW+nCjaYj3e46BSkwCd9r1ukPd/K4pxpsMDsLHr62RVq2pXO
         A0WLML5vQvg1CqtYLKDRAwbR3MF9L59w2l5rYMxj6ci++1QxXrQUyPhkMnKdGm+qe2dm
         5vuWhG9JmZhZ8XGqOMxb8O5Iu5oA7ag9YeEFdONhQzKOs4we6FwuTXqwloUZaWQB4vDH
         zVYA==
X-Gm-Message-State: AOAM533kHQ0rraFIuGgOizvCcRYCU/jzccUBQonKm/rGpFSVF/mZfuoK
	zrrpvqT6T8XlklEJKxFouNdg4p+6nALdlA==
X-Google-Smtp-Source: 
 ABdhPJwPZkPUFyXYaVh+Ol+Tz1awUvU55ASexYk6/ugyA01TR7LxLXXOftsSujWskJ3waND4QEp6MA==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr15361641wrw.138.1637741324441;
        Wed, 24 Nov 2021 00:08:44 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/21] cmake: update 3.21.4 -> 3.22.0
Date: Wed, 24 Nov 2021 09:08:23 +0100
Message-Id: <20211124080828.530981-16-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211124080828.530981-1-alex@linutronix.de>
References: <20211124080828.530981-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158672

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cmake/{cmake-native_3.21.4.bb => cmake-native_3.22.0.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.21.4.bb => cmake_3.22.0.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.21.4.bb => cmake-native_3.22.0.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.21.4.bb => cmake_3.22.0.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.21.4.bb b/meta/recipes-devtools/cmake/cmake-native_3.22.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.21.4.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.22.0.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 8b1b0db30d..2cd8193d6f 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "d9570a95c215f4c9886dd0f0564ca4ef8d18c30750f157238ea12669c2985978"
+SRC_URI[sha256sum] = "998c7ba34778d2dfdb3df8a695469e24b11e2bfa21fbe41b361a3f45e1c9345e"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.21.4.bb b/meta/recipes-devtools/cmake/cmake_3.22.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.21.4.bb
rename to meta/recipes-devtools/cmake/cmake_3.22.0.bb
-- 
2.20.1


