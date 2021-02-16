Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.6590.1613475662420524689
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 03:41:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GokebHO6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id v15so12512071wrx.4
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 03:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S/LAW0AtzpXXbw/IoWFUt2/AFaMFcXecZuRsCJmytyQ=;
        b=GokebHO69PLu6pnCL+4No0nFq1nxhlZHzf2BicPh+xXT9zJm+HOIR+utrEpOyZxj18
         iVVNY3Tlc1OQmHJmMzC0prrRLWDlgzTsf7HZzi5si2KuL/oSUJUP4WSb/QJTRbrnd6Gp
         RFdHJzU5ZDy+9qKEI074IiNqaHvwXCPwKzZKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S/LAW0AtzpXXbw/IoWFUt2/AFaMFcXecZuRsCJmytyQ=;
        b=ZHbZHa23sPo802RkVl+qZj9EQkoYk2viwWPOxd19m8UyVEhD3f64NXnEY+ydrv5l+d
         STJ93lgsBRCcIAQDEO9XDh0n/9yObbgP8dOfCYvOQNUl3TSZ3I7sS4D5hXiTkwIhCetg
         SbmjpZJHvUhi1Iby03fpTyME/XIwllwPNaKY6UjjXcejfifOou/4R+ejoBX+ZpjKP2h+
         8ed5QPRbqh7EWU2Vip/2YWPooUzPbOXl3SzPiyuS5jIJQNIr5Ay29XMY1dx/X4YAxeeZ
         TfxJ/b6/UqEbLiwKH6PH1wgEaeMye/QY0XgkYGp2mw+sZ++3h3/PqA4EYs6yqviBhJ6j
         /EzQ==
X-Gm-Message-State: AOAM5339qgIxynBfV7pL36/lRVeE65TFmvj4Z04vwuaul0OJpwyuXkPw
	vRkPx1UAqhUoZI7rN1vvbd3vd4qrCs27dg==
X-Google-Smtp-Source: ABdhPJyXwWnngC6CwF8R4ma0fNky9ZM1PPweiKptPFnHBTUlkLJM3wSiixRU/9ATNRJHdP2+2MhuWA==
X-Received: by 2002:adf:df88:: with SMTP id z8mr23398195wrl.39.1613475661009;
        Tue, 16 Feb 2021 03:41:01 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3cdf:51ac:3008:b3cc])
        by smtp.gmail.com with ESMTPSA id q21sm4215496wmj.18.2021.02.16.03.41.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 03:41:00 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] subversion: upgrade 1.14.0 -> 1.14.1
Date: Tue, 16 Feb 2021 11:40:59 +0000
Message-Id: <20210216114100.2022235-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../subversion/{subversion_1.14.0.bb => subversion_1.14.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/subversion/{subversion_1.14.0.bb => subversion_1.14.1.bb} (97%)

diff --git a/meta/recipes-devtools/subversion/subversion_1.14.0.bb b/meta/recipes-devtools/subversion/subversion_1.14.1.bb
similarity index 97%
rename from meta/recipes-devtools/subversion/subversion_1.14.0.bb
rename to meta/recipes-devtools/subversion/subversion_1.14.1.bb
index 452a025fcc4..f1d00380863 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.0.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serfmacro.patch \
            "
 
-SRC_URI[sha256sum] = "6ba8e218f9f97a83a799e58a3c6da1221d034b18d9d8cbbcb6ec52ab11722102"
+SRC_URI[sha256sum] = "2c5da93c255d2e5569fa91d92457fdb65396b0666fad4fd59b22e154d986e1a9"
 
 inherit autotools pkgconfig gettext python3native
 
-- 
2.27.0

