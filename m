Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.2805.1593155965882274226
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EtcgXvAF;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id l12so8328526ejn.10
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pChz6MZx8Vu8tk93WGal8DmRklCoFqm4WLG5be3S6xo=;
        b=EtcgXvAFY+bUUbYHfL3/yoAMKMIITiLi5GZTmgC3mX+NjXr+0qDtGryZ2y5E1M9Dlt
         qJnfPYPgoaYDfHQ/TA27EzsCTsWDtBgnd4cfr1WjpBsT7usVjUObpSNWomLKf2+4K9L4
         OPeOhQhtkjCeMTPo7m7N5T2CsnhFgmhVz1dET3YQX452FSb0FlB2/ck5GMIvyVBjj6Zg
         +6VMk8gE4qYZ7OEqMzLocWsEqaC3LjnUcUBS/tA73mQm5h3G4z0twVfSEnR9hC0S9/Ii
         79J24Ktp/Jxs6R9S4pWJS+xARqxvdy3ZgXLy/ueG0DjWuufOBnz2wiDLYq9+FsFjp3ma
         S0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pChz6MZx8Vu8tk93WGal8DmRklCoFqm4WLG5be3S6xo=;
        b=iZvMvdEd/ViS25sfv3WV9htuMuqbWfy7F2gVBJER3OTSoitIEae6nTzwic6UnmAuE8
         2s+QWifPYkS+/RLHbV0nSo8QJU9SrbZ7DZ4RwiJkI7cHSHS7Fthwta3GIdVBKZkx//r2
         Do0RXHKzsvAOHlfl2V3ajxwEBSFnCxUARGNny6nWHE3IjuLUejwN4nULno5HIbQreWaM
         XL/Strmil25vIo3TgWTI+R6rzTKhqHPIl1sd/Wj3lPTqedgYToywnGIemShbUoacsNTs
         gri0qPLeftVARdnMmKgAtB07Ha5icYeEQbzBMmG+u2nYlB27vybrF3+V2dXGvdRhVVY0
         02zA==
X-Gm-Message-State: AOAM530ka2UUrnVdHnvyqy4aXoSzlLa4GwmBEwMkzCOMDmsryfroAhzv
	K2p5hHmr222ZSzhoUgkuMEK1x/UJyrg=
X-Google-Smtp-Source: ABdhPJyGpgeMZwId+6nue0+aWoWZLO5Ijzxk+i54Hz7ffl1bVanGDzuey0gfgHAPkwlhuAy5I5FW4Q==
X-Received: by 2002:a17:906:3b4b:: with SMTP id h11mr1337575ejf.433.1593155964273;
        Fri, 26 Jun 2020 00:19:24 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:23 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/30] diffoscope: upgrade 147 -> 148
Date: Fri, 26 Jun 2020 09:18:36 +0200
Message-Id: <20200626071844.29134-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../diffoscope/{diffoscope_147.bb => diffoscope_148.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_147.bb => diffoscope_148.bb} (83%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_147.bb b/meta/recipes-support/diffoscope/diffoscope_148.bb
similarity index 83%
rename from meta/recipes-support/diffoscope/diffoscope_147.bb
rename to meta/recipes-support/diffoscope/diffoscope_148.bb
index 3db38fa324..8b81ce12fd 100644
--- a/meta/recipes-support/diffoscope/diffoscope_147.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_148.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "5b5fdaa4d900c891b319e4b9a006eb16824a0b61fdbe15e75acbbe35602e2da6"
+SRC_URI[sha256sum] = "54e39043226045419ba37f9b7aae4b96939f5ec16f37c44cc102e3d3f8e9ab1b"
 
 RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic"
 
-- 
2.27.0

