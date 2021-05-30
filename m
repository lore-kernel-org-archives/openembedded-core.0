Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.37088.1622412540435420545
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 15:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H93M1awU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id n4so8920801wrw.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 15:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1fdp5iVKXxId7mHFXq4VyHrkhK5E1LZ2GbaSPnaN4ro=;
        b=H93M1awU61zk/fBOTt3rDy7BhQIFHxTIyeYfnq/l7i07tyaKBPdCeW7aRDSt+MnPhQ
         pUhlmNGZOglrRgl5AxqbqhAKXqqDbFQz1/7RSa7N70ISizYjF6ogJUarlzm7zwh6W51f
         6QvEZPYZKa5J5FSkjxuJuI1Hu+sZjL6OaM0LI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1fdp5iVKXxId7mHFXq4VyHrkhK5E1LZ2GbaSPnaN4ro=;
        b=cR5G1fICkOH5K9G8Ajmr/WyoU8gTQoXKNbTtR4zg9WqIj1fL8+NsBuYXa6k+6l+sBR
         RhO3jhvnd7O3ZpDJ+qRsmGC1ZG0qq9vPIhPTqvZ7WM9PYY9tlYYzXVhgTYpPd1av87LV
         aAXsN19TUGe88oLuxgbD+99qchjwdpxQaEUZWZiJzYhCun2sd6u0UgJAUEpT8ScCIVtc
         +UF7/x6UyMs8PcZNLXpsHCRbyxgdcK95oBAEXat7Td9ryJd1uODe89ePHwexJS7FQdIe
         u2Uu6ks8pgHJcZvuU8hsNPdI4IIJ0rDriPQKkQcM5EqDDqTZYNkELAf0CDOMTSjaRqAS
         6LWw==
X-Gm-Message-State: AOAM533n3F3oqbzoHB11xLLi9647AuGyPK4bI17BkrIGCZKdEW4wUwUj
	dJ+rfJxPcVJemrTLDvEdJ79WxBBunMStzQ==
X-Google-Smtp-Source: ABdhPJzWdV2AyPjMt+/N5AQeRH0t9PN66seYwE61O8HV5+H2PliOx1OUiyT9ZbxVI60WiIZRb36/cw==
X-Received: by 2002:a05:6000:1865:: with SMTP id d5mr18958217wri.126.1622412539039;
        Sun, 30 May 2021 15:08:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id j10sm14721102wrt.32.2021.05.30.15.08.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 15:08:58 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/16] pango: upgrade 1.48.4 -> 1.48.5
Date: Sun, 30 May 2021 23:08:46 +0100
Message-Id: <20210530220856.2830501-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
References: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-graphics/pango/{pango_1.48.4.bb => pango_1.48.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.48.4.bb => pango_1.48.5.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.48.4.bb b/meta/recipes-graphics/pango/pango_1.48.5.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.48.4.bb
rename to meta/recipes-graphics/pango/pango_1.48.5.bb
index 9efde6577c0..b29c3c2d962 100644
--- a/meta/recipes-graphics/pango/pango_1.48.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.48.5.bb
@@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[archive.sha256sum] = "418913fb062071a075846244989d4a67aa5c80bf0eae8ee4555a092fd566a37a"
+SRC_URI[archive.sha256sum] = "501e74496173c02dcd024ded7fbb3f09efd37e2a488e248aa40799424dbb3b2a"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.30.2

