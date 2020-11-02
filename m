Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.1205.1604335775091896018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gK5Nh++7;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id za3so19791680ejb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SvuL+sIhLHy/BXXOSCxGQ8c2nB3kmXtIsrZKFxkpHXA=;
        b=gK5Nh++79qLy0ueq6mogHVaSII4GWUfMsCWxjgBzSyi44SF1cRHSqM2rbR/GsMzcsz
         shSDaJnRTTS6jytx3GIrJ9P3lxnZw9A1mFbYYIx3ZLLxO0CPND1QfJuvyMr5LJ4oeDwQ
         XpDsVL6tfxtUBmn/MweD5G/xewdPX8yRnFXzg8GTRo1WjvXp+nidY8aRWlECNanH+bJv
         NuULhUgqGAY1re8qKysSNBrtu55vyCklpEHKXevF81nY8sfAhHL7et7mHHlg5cDsHTVS
         A2qs2PgtBKCoJRe/Sir5+/PoDmdph5Gtci60fanp7TT+1/LA1KCBJG+Q+BnW3TLDsa8X
         iNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SvuL+sIhLHy/BXXOSCxGQ8c2nB3kmXtIsrZKFxkpHXA=;
        b=nm6cYvG07DaWbIIYCkKlSYWv1y8pEmSmNITgNnRTxsUpq3UhkQi4UDhYTI99mXKWat
         kWETEX8z1yxq4mtKxA/5aehV0A5ArVtd/C3Xi3Im4wanvwkPXMxpUvZ3V+m/0GIWfdeM
         y6n9lv/E4X4IoQMK2BG8qU0Ty8BWNJp94Up/so0PYxKHCZs6xyFLfIzrLpKLTqfKY0K4
         uFumnpVvoAjc5SEaQI+STXQeZMAcre+iTT9iZBsL2wnjYL7Upfyv+A8xWg9GUG1IlV6/
         J7xioi9K4kZpY+bNIHZ23SA0jH2DYWwv7KFfVd6MkEvsBQLy5DpTxWr/oMt3epu4f/iW
         Y8Vw==
X-Gm-Message-State: AOAM531PauN5w37bGhsuDXy1/SXXNYxn70EWhjBs3+6Fn9d/8L2jraRt
	ccgJZUxvsHzYsW8FQ52Pa/cc25L+qPbhJQ==
X-Google-Smtp-Source: ABdhPJx1wX5CgVhDI5NzPmclLFMILUxymqm9gyfDgurAe0Kix31maFTlbb68GPLgst3fHJmiHDZpmA==
X-Received: by 2002:a17:906:4803:: with SMTP id w3mr15615802ejq.406.1604335773491;
        Mon, 02 Nov 2020 08:49:33 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:33 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/80] dhcpcd: upgrade 9.2.0 -> 9.3.1
Date: Mon,  2 Nov 2020 17:48:05 +0100
Message-Id: <20201102164907.27572-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../dhcpcd/{dhcpcd_9.2.0.bb => dhcpcd_9.3.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_9.2.0.bb => dhcpcd_9.3.1.bb} (95%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.1.bb
similarity index 95%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.1.bb
index 13467189b4..e520115f71 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.2.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://dhcpcd@.service \
            "
 
-SRC_URI[sha256sum] = "fcb2d19672d445bbfd38678fdee4f556ef967a3ea6bd81092d10545df2cb9666"
+SRC_URI[sha256sum] = "a0843233fdaecee971c38ceda53ad1450bb7b83aefbf1fa9642213224a9c415e"
 
 inherit pkgconfig autotools-brokensep systemd useradd
 
-- 
2.29.0

