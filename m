Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.19493.1608974900027546490
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fY2biMUZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id y24so5552943edt.10
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a7TLnEbrxlB9AphYX8I1oybcgaCT25ALEm2FKTC/szw=;
        b=fY2biMUZ/AHSTMnpcETjfwWZdmhJwQkHirlBDMKy4IOWZKK7ZaGg/VL/Au1WCPtKrV
         qedei8/9RFwIrfE7lP6qgc9cTsD2fAcKB+MpGKIKORizQ8U171i7IogOfLRsVjLJtIi+
         A8VG1vIvC6Hf68r7CcKx7A5nxbUSKTS2ByByAY38dSrUfkf/FBTYiBTGJSFzPY5uE2uH
         DYIFPGhubXmQ2naosDhDL9EeNeaCEVuP24g/Of1WjBKTM02A9BFqwUeqC4fIy8HeyJF4
         Bzqa2mdJvsGybPYPsi6IYuQl/V74rf6B/4YO/cJZ+oTJcaWT137d0MQDl6l24L7TQ8t0
         ZCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a7TLnEbrxlB9AphYX8I1oybcgaCT25ALEm2FKTC/szw=;
        b=PpFF0y33KmvRp0qJdh1u2TyZM0CcHKp2lsxyHaNppyV+v1Nb5MQzGKhS47KwRmpuH9
         xjgW+u7Ak0pV72NFP+kuv3UPo9IvPkwfb7P3mMLWwLRcPxKX8kb5hqU08iEbdE+5QgG7
         IdAY2xDmAuL61+9k30NpKbPnRgpNwpJyAbCNUAPtwUEnmUcjALVkiKYdZZA1/WUEoi5U
         MVILKzkurdeR3D36VzbDINAC/Ytpuf8qbwYhDCH+ob6xoKIpDez1H+Fs6lt3AdlFD92o
         JStuSNkaMV1a8ZJwr11IFa/ZWEH+6RS3OIPCTw/3EUhy9TX8mbyfAyPixP5AN+OYA4B6
         TmZQ==
X-Gm-Message-State: AOAM533LON60Px7d2R92ExJ/gWlrSvAezzfXDshjC5/8rzMm7u4kr6pc
	C5OEsHgPmW5Zhv82a+zhSL5jku91aGM=
X-Google-Smtp-Source: ABdhPJxoLj6GR98cbrZuo9Co7CNmlkTz7B5xoA8nx79ULxY7jUBllVIwmOHSc/QxWLoJ4kYlNc/vdQ==
X-Received: by 2002:a05:6402:c4:: with SMTP id i4mr34510917edu.152.1608974898648;
        Sat, 26 Dec 2020 01:28:18 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:28:18 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 46/48] systemd-bootchart: update 233 -> 234
Date: Sat, 26 Dec 2020 10:27:30 +0100
Message-Id: <20201226092732.52323-46-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{systemd-bootchart_233.bb => systemd-bootchart_234.bb}    | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta/recipes-devtools/systemd-bootchart/{systemd-bootchart_233.bb => systemd-bootchart_234.bb} (92%)

diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
similarity index 92%
rename from meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb
rename to meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
index a7a1f0ff1a..4c857c3fd0 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_233.bb
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart_234.bb
@@ -14,9 +14,7 @@ SRC_URI_append_libc-musl = " \
     "
 
 
-# Modify these as desired
-PV = "233+git${SRCPV}"
-SRCREV = "fe1c5e41e6bdb78043dad8fa863fc2df66d1dadf"
+SRCREV = "8183cfd9dad8beca5434d625cf6b2df87775e956"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

