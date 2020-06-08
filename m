Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.25168.1591602518924031061
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QeK1iRlT;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id d15so84254edm.10
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AM4vQf6cM6kPmEi7SitVngi2AY9aIJ/sl+crbTZED0s=;
        b=QeK1iRlTSHlfb5GkJO45Ryk6EjK10Kh2SYuFWsuQd3JeDbIkEIF2s+Cvux1rYHwhpT
         evaVBBXUSME89e/R3OstHLbQRlMuAmPEXUMih0WtRzpp7yPFfPDfGygN56G12LNN7ILM
         sjWdK7LxiY4rWY0NvCBZUB/MuJD1TTViyUIDyImukfwbd72zcCqqGkRZUML9Ro9VBSzW
         MWpprKBIE/e9urx5ShsPD8PMLXS5ii97F13ppOQ3UuYmzUWD2lxI5UM/f3x7bhjzNC4m
         eCdXyYZeXRsOYj+J+Col7nHlhVPVbblQj54wYx+HTf6aR8fNmGmEXXrK04J/XAHWNZpr
         98oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AM4vQf6cM6kPmEi7SitVngi2AY9aIJ/sl+crbTZED0s=;
        b=cBIbwL4ejUrEbvXHyqalWjgXOywJn+118ACmUZnCYFE73sblHAqYCx0XxhHx6E/gyZ
         yaBhVaDSJtp6lhsSTSZ2obeuMruf7NhKN58X+lYbnOKvWN2AD1eR93M8SXJL9jBNeMGy
         rweWKRJf2cdlZu2Bsl1UG2ScnUotNBO1nPOoEjpLl8shTeMnGp5YtgJ5nLh4N7KE+HyB
         Akdox82kl8Q9OEFR28pGDfO0OU2rlOhO/ft9WTuKKSFzf5AtkrhI+8ZnKUYp9yRNVL8q
         wDgFWYXGCDqRMERcGsNexv14UdPVgCktP+61/qOUzcaS1jA0SbVNVFfssuTSy1zThKO0
         s3kA==
X-Gm-Message-State: AOAM531qZG/c4gy6SmVROou451v69jEoHjO3I7au8gWmxI6y5DZNTFDP
	6Aha7SonUOcNls54405kAWwITDZ0NiQ=
X-Google-Smtp-Source: ABdhPJzwUJm8lGgXQ3cheYW2fpU0GZlvObBmUudrPhGeHUYVpLZMeUvo9LfR566+c3DRtgL0otCcJg==
X-Received: by 2002:a50:9a81:: with SMTP id p1mr19209113edb.221.1591602517322;
        Mon, 08 Jun 2020 00:48:37 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:36 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 27/42] bison: upgrade 3.6.2 -> 3.6.3
Date: Mon,  8 Jun 2020 09:46:44 +0200
Message-Id: <20200608074659.7051-27-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/bison/{bison_3.6.2.bb => bison_3.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/bison/{bison_3.6.2.bb => bison_3.6.3.bb} (94%)

diff --git a/meta/recipes-devtools/bison/bison_3.6.2.bb b/meta/recipes-devtools/bison/bison_3.6.3.bb
similarity index 94%
rename from meta/recipes-devtools/bison/bison_3.6.2.bb
rename to meta/recipes-devtools/bison/bison_3.6.3.bb
index 2ec9381231..1d0f5995c1 100644
--- a/meta/recipes-devtools/bison/bison_3.6.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.6.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
            file://0001-bison-fix-the-parallel-build.patch \
            "
-SRC_URI[sha256sum] = "4a164b5cc971b896ce976bf4b624fab7279e0729cf983a5135df7e4df0970f6e"
+SRC_URI[sha256sum] = "06db793651de9dd5f0a85a6fe4bdbca413c0806bf2432377523da96ca0b4b73d"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
-- 
2.26.2

