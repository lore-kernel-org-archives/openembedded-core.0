Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.7171.1588683737494643267
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cgkWVmZz;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id k1so2660715wrx.4
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BDSTcuFwD1pGl36wsZMuDYTXaIrqaOTQnrfmFp113nM=;
        b=cgkWVmZzD35plqM+agJoERn8UCn7lxy6AcAAX/j4dsLeA0lekmUsEsL6CAWAro5XaX
         se/2BwalhLiXmioRZM+WrOOoVNUYnNduoZucTt0SKWYN+5lcU3PYlMdVHzHusmP1mB4K
         5JCWWdUW9Dh8eZ6ivgQm+QNOZ85I/clgXpYfDl63ZBuOc9j0dfeTQmCAOgPgNCF0kSSM
         yU29wiNJepIH03YnQ6Q71H2lEp+nIqbqC0EZmBqlY7s4wQpR98xKTIp8auS/A3kJwNZS
         ADjJkM35UOB/ZedLh5Z1Bh2rw0YTRuOV55sV0jwdZTYunRsT6puzL4aEyNAxSeGlKFhG
         h/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BDSTcuFwD1pGl36wsZMuDYTXaIrqaOTQnrfmFp113nM=;
        b=lzxy8+PZAaVi59f43o20DIojRrCvWenbe01DdhpmPy+y5sezNWKhctN88yucouhYQT
         CY6ctX0bHHNtv8OExB0+kDHw97xy2a4pVBZ2963tLXg7teOTiskEk+qg7FT341m+5QM8
         M3EhnjnP+R9WsYXiXLpMFJeaKESkUgwibWdT6WHaxTCqnbGjbgUxQGFCZURWcBmnHduU
         8HsuFipQ2rszLMTMxeNR3NIPRnpBveUv69WIQ7IrY+j17wJGfVwzcg7TyCiya9LhMiMV
         9iTgm8ILOZ/ybkKpZEKtPlPXqmCy2DzZmlQ8NgQdobU3JBlKcduWayW7CSuKBRmC4bmM
         +0uQ==
X-Gm-Message-State: AGi0PuYgwtq42Qk4EdQF1nvEPTxBssl/oIba4iSVIxOQxrs1nn3M09ph
	pPsrvgvG5jXsiQA6dseo1ImyoT6Z
X-Google-Smtp-Source: APiQypKc0MGmWpS8rTBWJJpnTVO/0nHzdXht6/PdDdsTZT5y7Hd3Meq1TAKATHhiFxvxxbaZpnyGtQ==
X-Received: by 2002:adf:ed86:: with SMTP id c6mr3948932wro.124.1588683735871;
        Tue, 05 May 2020 06:02:15 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:15 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/24] vulkan-headers: upgrade 1.1.126.0 -> 1.2.135.0
Date: Tue,  5 May 2020 15:01:24 +0200
Message-Id: <20200505130133.24930-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ulkan-headers_1.1.126.0.bb => vulkan-headers_1.2.135.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.1.126.0.bb => vulkan-headers_1.2.135.0.bb} (87%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.1.126.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
similarity index 87%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.1.126.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
index 72c29a72a2..54cee96cce 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.1.126.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
@@ -5,9 +5,9 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=sdk-1.1.126"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=sdk-1.2.135"
 
-SRCREV = "5bc459e2921304c32568b73edaac8d6df5f98b84"
+SRCREV = "fb7f9c9bcd1d1544ea203a1f3d4253d0e90c5a90"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.1

