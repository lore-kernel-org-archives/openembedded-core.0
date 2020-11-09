Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web12.4535.1604880152097884868
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 16:02:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nBq3Oj1V;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id w6so684242pfu.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 16:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FF9F/F7pRPo+0rTJQkrtigEoJ40PJrARBptXnIcj8JI=;
        b=nBq3Oj1VkIrP825yL1Y9xNOwzXjNrzRw5zrZE0j6D4J05flvg/uNBJOuUtgO/poXeT
         T4odvRm8AWBQIE8Wh4836MOGL013t8wdYVslgmT/cCBt7xn7vUOF0+W6xuP6fi3m59on
         SNpn8XwsxtP8ylGEZaeZjvTfH8HHp68J5b0QX9/Is8iOr29oLPxp4nRfR8lCBKcZUEgy
         19kKPP8kz402h4ZTCFoPc46ne0mSZnYze/DEvRxCbnimIkcODX5NefzKYooda5Mi++F3
         JDS771AU6kWnfs4eoqlmQXad3Vcjzz6kl9/PTEmYg1fmP/mDTSpjSDZ+pULsVfqEq5dS
         WOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FF9F/F7pRPo+0rTJQkrtigEoJ40PJrARBptXnIcj8JI=;
        b=dEQfwQsLfmIrSfLcU4VluKXBQn8RG6LaGisZp/Jv9Ruhs4bIsgsnDMoyBSjIJGbG3D
         mUx2XnoRHgtxEkqjRPVNlmtEP39PLP8iW5Z3P0uG7BNRez9BeUaS+Wn/CuaZ3IPU+WRI
         /fXPlXFHjUA9yytVn2PEmviL9eR1c6XU9de+N4we8hyczyd0j087ySycXoaMkHGtJkne
         sooRZnZVJccZ1yXa4dM4+eoatUbCdNT34wLAhecp+V/53kJ8TQM9NqLESUGapJXILGkD
         7ndc1wXaujONB+7ZKbB03/QRLMc/yLH/wjKozL+FhW9SGbGeLOIB76tZMQ8Wxm3FPG+4
         rccg==
X-Gm-Message-State: AOAM5329whjIV+xhTfQrgzyV0yL8P1kXYUA01wK3SMGQg/wTlaCtWTJG
	QW84DmY9V+yAXo3CRy5va5W9WOPuvXGbKg==
X-Google-Smtp-Source: ABdhPJzXZBDZCSAtM0h0d1CQwdikXYlCaEcavikV+lgDnZaVVMAXuGyeb1RLipQF2yZXN+DZrE2IQw==
X-Received: by 2002:a65:464c:: with SMTP id k12mr9897279pgr.215.1604880151423;
        Sun, 08 Nov 2020 16:02:31 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id c2sm8825227pfb.196.2020.11.08.16.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 16:02:30 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 10/11] lto.inc: Disable LTO for perf
Date: Sun,  8 Nov 2020 16:02:16 -0800
Message-Id: <20201109000217.3008448-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109000217.3008448-1-raj.khem@gmail.com>
References: <20201109000217.3008448-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

perf invokes kernel sources, and currently fails in multiple places for
now therefore disable LTO for perf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/lto.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lto.inc
index bd433aa418..bb957084b5 100644
--- a/meta/conf/distro/include/lto.inc
+++ b/meta/conf/distro/include/lto.inc
@@ -18,6 +18,7 @@ LTO_pn-curl = ""
 LTO_pn-libcap = ""
 LTO_pn-libproxy = ""
 LTO_pn-libbsd = ""
+LTO_pn-perf = ""
 LTO_pn-xserver-xorg = ""
 
 # Custom LTO flags
-- 
2.29.2

