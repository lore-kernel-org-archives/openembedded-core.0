Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.9619.1629636701769381388
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KNnXCQVU;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id d26so1443976wrc.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=POh0rr9svMluc/enL/zp7SxsEHJeG6n+5+uhjDvZEKU=;
        b=KNnXCQVUQnIIAcrE1hEm1Qb9w9Bhe2kODtVxs9/22Ru77cjU1kohtkvnGScrLoPoC3
         l1KLI+DTWJ9jvq+mMm0IK7OyiWsu3WsypgdVdpKE7tJ3coi/Hdj0MWNkPb1g7CE81xAU
         w7YqQ4ZWh1S3x7/yZf/ce9pnrilC+zLbe+5arXjTRidq4uqz57OOuFMbR4aR4eskWR/J
         qHfl+94SggIUYvue5lz1KswCdnzYC+yjKo9vrJqUotu5zEuciHxHu1XEm8x/aznhKJYy
         vHCNPZBNJcgctoUjH1Xy1WN9BzHIE+Dh4amFskmq41GwpjvCZMkWTDXAVhNSxPyId7+k
         8LGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=POh0rr9svMluc/enL/zp7SxsEHJeG6n+5+uhjDvZEKU=;
        b=UU5B8pra3V5qPTKWkALVtuh9gb9J0LIBctsD57s/HzY8w5FfUk/xFtL5S9iaDZgILw
         njTlrvjtEKqELymuv671Eu9sIkMk3bLKFyYW8uzh0yjB0+tDGRf4PMxgYDKwaHctTbHR
         HFxrDWemTDAHsWsQIDNREbgxk5DJiCtCVQiolOLM2gz9p1cqzQ3AxWjPCLaScLbWHJqC
         HnNa3klQ7htXxjOVk3xw5qgnusi0vb6HWgaBtTHXOIZPAixK9wMdWw3MTV7Y2Dw2GSOF
         osfgRZBwuqKohlawii+YTNtNfSLnpbIYfRMs525Yl6rzZLb7ceuVaan39YdB3s5nNBdx
         5MRg==
X-Gm-Message-State: AOAM531jtPqat4NtmktDJhv4v86FJtSxE9tS4bwTwc5p2hMThzuG3Nui
	u6+kY/0CthXNomqjWZi46YAf7t2KlV5+CA==
X-Google-Smtp-Source: ABdhPJyZNPjliG/kQug+3RMAip0xg4c0ffGg/fm2gUvMZZgXK9V/s93fDFOyRZVb4GbQ06dQnSVt+w==
X-Received: by 2002:a05:6000:11c5:: with SMTP id i5mr8542432wrx.183.1629636700400;
        Sun, 22 Aug 2021 05:51:40 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:39 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 43/55] libxfont2: upgrade 2.0.4 -> 2.0.5
Date: Sun, 22 Aug 2021 14:50:51 +0200
Message-Id: <20210822125103.310416-43-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-lib/{libxfont2_2.0.4.bb => libxfont2_2.0.5.bb}        | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont2_2.0.4.bb => libxfont2_2.0.5.bb} (81%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb
rename to meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb
index 1c9cc0a21d..24e0b054d7 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.5.bb
@@ -15,8 +15,7 @@ XORG_PN = "libXfont2"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "00516bed7ec1453d56974560379fff2f"
-SRC_URI[sha256sum] = "6d151b3368e5035efede4b6264c0fdc6662c1c99dbc2de425e3480cababc69e6"
+SRC_URI[sha256sum] = "aa7c6f211cf7215c0ab4819ed893dc98034363d7b930b844bb43603c2e10b53e"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.31.1

