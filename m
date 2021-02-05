Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.5570.1612513535364259878
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 00:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fHN1crax;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id v15so6655017wrx.4
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 00:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PKU8i9AVIamIDwZdtn5gfSx6cJZiAtniTDoJgjl2KBY=;
        b=fHN1craxvLOX24+7/hcH7rZaTvjObjw8HuEG3eYH6F1DoVtH/PM8/BvlQJCwDjIXiR
         TuBGNDkm/bl5cXANXgt+FND9NDXGg9QO4UrB96hZBgy9qfJ7F1G4Cbrde3TplBVz0sp4
         WcT64ARM8Q3nCC7ohBge9SEVbSRgM72b5M84w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PKU8i9AVIamIDwZdtn5gfSx6cJZiAtniTDoJgjl2KBY=;
        b=NqvgCObPvLrt5jG+J2B0n66TLhGEYBJr4xAO10isUHBmnL1byIpxy65YdQQ7AXkxpv
         nSufz3oZ5CrsW86hsWl7ebMz02jR3rRw1qV4cTQT5dUw4MFQkFJtsuS/i4FUdj7xcWMN
         cj8NT9DHDimifo19ffcajmV3MESYHvieGFt07vYT+Wn9k9tthvEBEL3vCRBvLZM9whFJ
         MIplRfPRlok5pDSv0wuO31fDGsXI1eja/THNnBxfXY5aOxxUj0viCAf8q4xjsYUmR7IL
         PU12TyowQ/SEfxEDdJcUEi/qgW273mPnh/lXcjwyoXahmf2IW9MIiIhZNSFgNksU0Xhg
         wlEQ==
X-Gm-Message-State: AOAM531kJ1xuYlk6H6WkTjDld55QbVlmkX/VYRIU9njRv+d2Zkxw4Oud
	0Nq+rvmbBX7RRGe4vDKhzMh2ijrBQFmeWQ==
X-Google-Smtp-Source: ABdhPJxTaqglaIWnhbtbhy3spvEUvcPBhUxv9keg3f8SnZl4JJiRBeW+7YlJYBYQKMr3FL0sIV2NNA==
X-Received: by 2002:a5d:6511:: with SMTP id x17mr3653715wru.313.1612513533703;
        Fri, 05 Feb 2021 00:25:33 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d1b2:8778:591e:ef47])
        by smtp.gmail.com with ESMTPSA id f6sm7708464wmq.33.2021.02.05.00.25.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 00:25:33 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] pseudo: Update to work with glibc 2.33
Date: Fri,  5 Feb 2021 08:25:32 +0000
Message-Id: <20210205082532.1620529-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210205082532.1620529-1-richard.purdie@linuxfoundation.org>
References: <20210205082532.1620529-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update to a pseudo version which contains some heqader fixes for
glibc 2.33.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 0ba7b503551..0072e0558b8 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "8317c0ab172db47dabcef909bae02cd77b1f1010"
+SRCREV = "f332f5633b5dd73fa2b6e5d605eb33e4a446d7ad"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.27.0

