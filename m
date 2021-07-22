Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.1171.1626993919349347380
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 15:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AjS/Oc0a;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id j6-20020a05600c1906b029023e8d74d693so524909wmq.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 15:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r9U8W3SwCHRgh0691Zz7Yjdv11waDUf2SgZs96zif84=;
        b=AjS/Oc0aKCl1aycMmTTUitF6kq/s+el+PcNtaHCuKauOwUeUEZy2JpBt68cPjyGX4y
         GaigIB3EchVJ502gWwT/RqbAEAvkRH90CrGgwVf44TLVTxgpSXaYo6gAIMC1ht0aCoYQ
         S/mMjZ98yxQLQA41pl22xGu5vw7j0dnX1d79oFAtPVoJFS+ttG0tB4uwoheUPPeAODVg
         ttNagPYpD/bJvc6FsVSwhmSIB8TopYH5pfOvhZJUY3LqUX/dpLe7XmhVqzvhbknlL5iU
         XhSI7EI9RQcl8iAd8VhzGgW7cYWCi5duHMeTNdznei/XIbjOva6q6Trx6J/T7AlmI8KY
         Tf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r9U8W3SwCHRgh0691Zz7Yjdv11waDUf2SgZs96zif84=;
        b=neiNWX09vSeqeouykZVhKV4dLh3gc0B/xngvkia5vXq/rqZEcU+BoYEYUlRbZV+COM
         JLCDT32YKwVuhxVFe5TXtw+kqsOgUWJEQwSUqZ+s90hPhQsx9y4yhLyPQrOjsG+lBnYi
         3tBJvcz+st48C3u8uoDNwfAc/CDZvwxxDq4KdJOw9OsnV5SmQJyVTVKlmCEfIhqEk08q
         HIc6HQytgDg6PSvhSEYFOJ1/XpDEc8hFs6OZy7uJY1Yz4Lvb3q7dBF/N/FY+V8+LjAZR
         P/9pNmZcbMOhypaN13G+YQZycw1zZu3q+UGw/xdCx/dccxfOa1UOcgACh3TQQXKFR5aH
         3bpg==
X-Gm-Message-State: AOAM530ZW+ah9/GRL383RbODnbbr1urv3f9RXqC3vebUDT0+ukIluZrW
	C+hdLqp58fRI/X+ldvDKGGDibiUGMyaQCg==
X-Google-Smtp-Source: ABdhPJz7jpbMxINo155Yq/at0t3NtJ5XehCyxEa0YauVPlMn6OOHhRCQtzIuTAlcmbmyLbqDmQt27A==
X-Received: by 2002:a05:600c:35cb:: with SMTP id r11mr11204208wmq.179.1626993918009;
        Thu, 22 Jul 2021 15:45:18 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n5sm24337739wrp.80.2021.07.22.15.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 15:45:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 8/8] vulkan-samples: update to latest revision
Date: Fri, 23 Jul 2021 00:45:08 +0200
Message-Id: <20210722224508.51967-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722224508.51967-1-alex.kanavin@gmail.com>
References: <20210722224508.51967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 972173ef50..503b058101 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -11,7 +11,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "47c5237be21209afc945e43d03ae409fa80a0155"
+SRCREV = "43ee480644a20dbc8d4983b22578068f8bed7571"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
@@ -32,3 +32,6 @@ EXTRA_OECMAKE += "-DCMAKE_DEBUG_SRCDIR=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${P
 # from some builds depending on the point the PCH was compiled. Disable it to be
 # deterministic
 EXTRA_OECMAKE += "-DCMAKE_DISABLE_PRECOMPILE_HEADERS=ON"
+
+# This needs to be specified explicitly to avoid xcb/xlib dependencies
+EXTRA_OECMAKE += "-DVKB_WSI_SELECTION=D2D"
-- 
2.31.1

