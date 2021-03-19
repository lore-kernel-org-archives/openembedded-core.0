Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.3561.1616143512887461503
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 01:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OKcf74E3;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id ce10so8358328ejb.6
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 01:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W7S44jKVK4VVIwo7AWAxxR6GF2W+GeuULA0Mshh2QgQ=;
        b=OKcf74E3loHUddQfeHNd66MnNlrpudTPL+29isp6EWwTcILFktwTsgKPbLhb632NRX
         0+/l6nNq4uSkESLKnxn7/LBSWMIeuSeVl+3iRbp+fjrdfnHc8MuyyYPRBjiuwu24Q638
         g1VagTuPaqw77663xmn2wX+WaUZiaqkR+nNvbhnjYRD3pm3Fl6HlJbBwN+95Ye0G/T1K
         UYOOya14yr0SGA1IbU9PF+7bJk2fJRekBL+I4tFlqr2LhUeGc6521z+5AQD2vi45c5Ah
         wahv9qCEXF0RdL0itKRKfutPW/JhF2E1BliL4yXxYW1dXbC6AvgRwSRM5QRcqlEju9bP
         K0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W7S44jKVK4VVIwo7AWAxxR6GF2W+GeuULA0Mshh2QgQ=;
        b=gOikuO0BitLrdAFg7/U9d62Y+VpLH4jS0Pa1Fl14CVeo5Pgs/+5QEey11qZfc8moVP
         FaitpGQ7/TqGCAt7tEVMn9j3hPqhJv/vp7aPGb+aH/JIltxVcoJZ2dqlMZbHNsxfiCnD
         x+L/sC3Ct0W0TjLX1Q/eiN/iLeBU2BQco7iVfzsQKzGtPvVVIdfaXkphDeqUEYvjLVdz
         I2QNClivEzfP+HVKjUDlCnTYJ2lGY/TL0rZZ3S+75sHKx4GT4H/bB28zOaosvYlAhQ95
         /Scs+lp0MCHSZrTwsVtfARNvFQSbermglnRQvXQI/tyBLmayMKJWcP9VrPIgwWfbopZK
         xv7w==
X-Gm-Message-State: AOAM533e8w1pB0FAvmh2Hl23h2AvlTphlw34a2mpKKU7QPKQV7KU8L2y
	wJ6OL28IV8EzNBjv/vzaOz+h2t3wgO+5xg==
X-Google-Smtp-Source: ABdhPJyuk3Vzh5YYahMObSkjlOyHfbXccKZsvpsPkgxLiS4JlHtBbIk6PfKS8gu4+Y6ua1y7zoOWVg==
X-Received: by 2002:a17:906:7842:: with SMTP id p2mr3215532ejm.87.1616143511346;
        Fri, 19 Mar 2021 01:45:11 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id nd36sm3262248ejc.21.2021.03.19.01.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 01:45:11 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/16] spirv-tools: upgrade 2020.6 -> 2020.7
Date: Fri, 19 Mar 2021 09:43:51 +0100
Message-Id: <20210319084401.576728-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319084401.576728-1-alex.kanavin@gmail.com>
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../spir/{spirv-tools_2020.6.bb => spirv-tools_2020.7.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-tools_2020.6.bb => spirv-tools_2020.7.bb} (96%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_2020.6.bb b/meta/recipes-graphics/spir/spirv-tools_2020.7.bb
similarity index 96%
rename from meta/recipes-graphics/spir/spirv-tools_2020.6.bb
rename to meta/recipes-graphics/spir/spirv-tools_2020.7.bb
index ea89766e92..03b0f65e33 100644
--- a/meta/recipes-graphics/spir/spirv-tools_2020.6.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_2020.7.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "b27b1afd12d05bf238ac7368bb49de73cd620a8e"
+SRCREV = "2573fd781b5408cd7fe5755a78b60d767a748ff9"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git \
            file://0001-fix-strncpy-bound-error.patch \
           "
-- 
2.29.2

