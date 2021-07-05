Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.14337.1625510590052342475
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 11:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uhhwD1dv;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id m1so24673468edq.8
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 11:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=M66UAMrVhLfwM6vm3alBl7smSR/ViI9AdbCh0YIzC7Y=;
        b=uhhwD1dvRINDqPz1sDyGDHc4VTYWDklSStzUAsKsysafJ9ntxnx98sV9QagDAmZPto
         Q1U24RviM7zaK0kETeN5l2HGGwEsjUf7D2NYHZ9xRi2TB8/Kjk9eyCPcMrs1MTUkdnJd
         IFC7NyW6mWqgbohlodO1KpTpL7RJVbrKmiuX/gVCVb4hzjc7ZMAwiAl4Np37rul6raoZ
         qELDbrCnLDKfI/Zhc5CFiWnnunYWfGEuge+2DiLHknRG/rp4KbkqGsHET4vYWBsoxMxN
         AZBjUF3SVGwjzYI1bSyJblPoOSFmj7pJSQzlQkHA4LTJr208Ktc9vhi6HGN37dH+Q6Kk
         C6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M66UAMrVhLfwM6vm3alBl7smSR/ViI9AdbCh0YIzC7Y=;
        b=GnVK9RLazCJ8A8HJ65JIiK49pMFnvTQluUZGWxj2DZ0i3Zpg4sa5JcL27E4v/6OUmG
         pkD1ux+VaElHVY2nMQFeXeNqT8sqUmfncaVCCpnOPZxTdbYhVaCpF+EaTt3FWKgVkpWH
         ShMXBZMyYuPnEIblypuR3lHrekos3OHQAfh4PIMkZYgztaeVK0xo0kh/rRnajWphKoec
         sYVHMR7cK7MXJCYuueHVUN4fVDg6ix1vGIEh1upAklNeXPJ0uV3HHAsQl1TIAJf3Yf0C
         lpzF4OQSAC1z+YWBMNHRsHD3dZtLqGrAZggNuZLhpwwniwP7sHem7a+hzezQbvLNtTLx
         UF3Q==
X-Gm-Message-State: AOAM530nxR3jVFEbHS93LQzmnkTZ8+6M5ES2xLs2FooXx2YeSpDl3JiE
	GsBA9Su6FjTITYz+lguQuX5JqaHpNKk=
X-Google-Smtp-Source: ABdhPJzgulymSFkQVfoVMzE2BFn9LXSt02onkJ72OfxN0O6LEgBUXGm/cD4kP7spZWy04vNzmD/IeA==
X-Received: by 2002:a05:6402:204:: with SMTP id t4mr17761860edv.34.1625510588689;
        Mon, 05 Jul 2021 11:43:08 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f3d403323b289d7a4d4d153.dip0.t-ipconnect.de. [2003:f0:7f3d:4033:23b2:89d7:a4d4:d153])
        by smtp.gmail.com with ESMTPSA id ec40sm5872578edb.57.2021.07.05.11.43.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 11:43:08 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] pango: upgrade 1.48.5 -> 1.48.7
Date: Mon,  5 Jul 2021 20:42:59 +0200
Message-Id: <20210705184259.2125023-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705184259.2125023-1-schnitzeltony@gmail.com>
References: <20210705184259.2125023-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Overview of changes in 1.48.7
=============================
- Fix a thread-safety issue in fontmap initialization
- Small documentation improvements

Overview of changes in 1.48.6
=============================
- Avoid attribute index overflow
- Add a new pango-segmentation utility
- Documentation cleanups and fixes
- Update script property data for gravity
- Bring back careful glyph position rounding
- Add a few missing bidi types
- Add more tests

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-graphics/pango/{pango_1.48.5.bb => pango_1.48.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.48.5.bb => pango_1.48.7.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.48.5.bb b/meta/recipes-graphics/pango/pango_1.48.7.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.48.5.bb
rename to meta/recipes-graphics/pango/pango_1.48.7.bb
index b29c3c2d96..963fd5d01c 100644
--- a/meta/recipes-graphics/pango/pango_1.48.5.bb
+++ b/meta/recipes-graphics/pango/pango_1.48.7.bb
@@ -20,7 +20,7 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[archive.sha256sum] = "501e74496173c02dcd024ded7fbb3f09efd37e2a488e248aa40799424dbb3b2a"
+SRC_URI[archive.sha256sum] = "28a82f6a6cab60aa3b75a90f04197ead2d311fa8fe8b7bfdf8666e2781d506dc"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.31.1

