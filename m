Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.745.1616176417250955130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 10:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KEzHQTpc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so8759384wma.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 10:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=67vSMbikTstuZ/tNsYOtq8MZ3bB2Ozt/pcnL5Nxi3+A=;
        b=KEzHQTpcMRXMl+99zFKf8upv5KqE0AS1BsQBOyiqfa6COdFB29fzTXYIKD5W+RrGj8
         sNAghZS6uxurMjgJRQdpLzkMyS++M7/RwVt94kub4J9c6wGugFshEIY7X/WG47QzRtx1
         YVBRXWgRfTzQA3ZOblMZyE1YGYJOL6/v+Awm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=67vSMbikTstuZ/tNsYOtq8MZ3bB2Ozt/pcnL5Nxi3+A=;
        b=laodl8/sgnd00tCbteaDr3fAGNZWzPc0AyAN6SqwEzhiay/8WhbnzCSt1JwLKLZTVz
         TtCyvMDwiTZ47spEnh7O68E/OoyHrr0l8u2HvBazHC9j6J9/+A6LlMuMa/WBztYrKEQY
         xHcf2FKu6sS4euDJVubTt1+tbBzEm/XokHCakUyRGsU25UKZMbFSfcCOcwbWXm/G2kPK
         t/yfug6fY2gD5s7vu2bwRosRlwEoTdpC/Zq/P7dqkZbXJgVPIuF5YOL13hb8DsWEZgOl
         olFxkBbx0r7NtwCtV3i803n6lubrC6Nj8kx0dtJf5/m1igtdUvTCGHt/JdPxFX3Ry175
         Urzg==
X-Gm-Message-State: AOAM532RdjMyTv/jOoSPZumOWfmLsdAhA5jNjdhFTxCSyZptWbwf9K+z
	JHX3AJEiXLlOqW6u5QVjj8gzpbVNGlR2cw==
X-Google-Smtp-Source: ABdhPJxxezq8scyoapGSgrgta4UCeccMy3MmhAGGU6Bstv+uNEch0WyTVhnLiywvKbYMa1DrnY8KsQ==
X-Received: by 2002:a05:600c:c4:: with SMTP id u4mr4846852wmm.27.1616176415561;
        Fri, 19 Mar 2021 10:53:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5808:8e52:d330:3893])
        by smtp.gmail.com with ESMTPSA id s20sm7238204wmj.36.2021.03.19.10.53.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 10:53:35 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] layer.conf: Drop gatesgarth from the layer series names
Date: Fri, 19 Mar 2021 17:53:34 +0000
Message-Id: <20210319175334.235050-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The time has come to encourage people to update actively maintained
layers to use the new series name.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index b10b58ab32c..5210fd46126 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILE_COLLECTIONS += "core"
 BBFILE_PATTERN_core = "^${LAYERDIR}/"
 BBFILE_PRIORITY_core = "5"
 
-LAYERSERIES_CORENAMES = "gatesgarth hardknott"
+LAYERSERIES_CORENAMES = "hardknott"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-- 
2.30.2

