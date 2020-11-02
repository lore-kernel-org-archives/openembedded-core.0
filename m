Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.1235.1604335784509240928
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gTXxSIL/;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id i19so8793044ejx.9
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FV5HobRtz4DzY8pemNFeJW7vx9xYkxaU7r5IdJwHDSc=;
        b=gTXxSIL/ULm3Y7Zg0U6+Yn5Aqmosn06bQ8FyOBbc6CthJzhN8KL1l9Mz4B/QhDrzo+
         LkTiFC/PL0/wEdFtnQGAWbXxOibmo7GVPpn06llk62toq495tHP8HYNGxftprqamm43o
         db7gYtKZW7rIX2cg9NnxjhqP7JCQU02VJQa54nuwuaiTD6A0WyQ75OqfNzuTp8WSCPjx
         +mih3uDK2vcrFA/0FfE95u30Yh96IbvNEggpurgwkFKYufX8tIbQkfUyGtF/MeXF+xcy
         DsppB0dcIGBSfBadgSvxAhakBCTKCtRIdEI0VZIqvPYtCxqDOXbkhp0axKC0uFVt5w+d
         gL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FV5HobRtz4DzY8pemNFeJW7vx9xYkxaU7r5IdJwHDSc=;
        b=RnWyIu7wDJWe6n4fdQ4I8HfWGHitvTwvX8MhpS8akKihIkVIpi74pHhlVzFU2Rz/SA
         L+WtLdirzM9l7juRMk3njLWGgspzRxApJhXd5+SLYZfuKFq4ibpiVIb055LO4t/yMkCa
         CCmcnT5jYLck6V0l/OHEvZ77V0OTjPicB4BCy0SA23jyxlbwPGvXUW7q2ti0fhl/GnVP
         DUmTCbXgZ56BjUaR6g63dX8uKg3xefelEVnAmS54SUat+iY+mQASJz/f0ALxIzrBEyHG
         UjC7QOIyrGuw8kVstSetmp0kC++VPr/vcxdPL21PNBusAoAVmtRp7AZayy/bKcjeD5NK
         +EGg==
X-Gm-Message-State: AOAM531t8+jo4uLP5CW2WXHx0uvUDOW9Wgw7TQJW109vi65vtPiJPnQZ
	yh0KVEAAxDsG5y1WSXwX2Hb6t54eeJ5hGQ==
X-Google-Smtp-Source: ABdhPJxjNO68HlmMSdulx308hYTgcYo0GtjsnAN0oQD9kK7F3dkCjoPz+aWqiW0lSbllZE7PDldhUQ==
X-Received: by 2002:a17:906:2490:: with SMTP id e16mr15865028ejb.17.1604335782183;
        Mon, 02 Nov 2020 08:49:42 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:41 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 28/80] iw: upgrade 5.8 -> 5.9
Date: Mon,  2 Nov 2020 17:48:15 +0100
Message-Id: <20201102164907.27572-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/iw/{iw_5.8.bb => iw_5.9.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/iw/{iw_5.8.bb => iw_5.9.bb} (85%)

diff --git a/meta/recipes-connectivity/iw/iw_5.8.bb b/meta/recipes-connectivity/iw/iw_5.9.bb
similarity index 85%
rename from meta/recipes-connectivity/iw/iw_5.8.bb
rename to meta/recipes-connectivity/iw/iw_5.9.bb
index e0456fbf00..3d1e1c7e79 100644
--- a/meta/recipes-connectivity/iw/iw_5.8.bb
+++ b/meta/recipes-connectivity/iw/iw_5.9.bb
@@ -14,8 +14,7 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://separate-objdir.patch \
 "
 
-SRC_URI[md5sum] = "98129d64212bdbb408f009c56ed5c62a"
-SRC_URI[sha256sum] = "cd9125c7e560926d66b09977fe0f75e5365ffd05a15df67d86a421dc76f96a96"
+SRC_URI[sha256sum] = "6e7d3c9f8b4ee68e412f20fe229c9854c2dba383e3e650ce6af8eb8dbd12efc3"
 
 inherit pkgconfig
 
-- 
2.29.0

