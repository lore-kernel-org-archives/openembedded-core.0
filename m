Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.11571.1621204378472506567
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DpY20U0t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id a4so4483300wrr.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=i1FdLQv085wfWFWtegifKeLDyQQWed9W/WtFHVURZIU=;
        b=DpY20U0tWkxKs+1F+b5igV4Cb6wiOjNLwBf/29D2qFI0p7yQzaA7GwJ5rAap0ogdHE
         ZypXNcPNTkVgynNoX77ixq8CI/Zyt6ft/PZUhm7Nqh/2Oczm5T/kavkV375Kj28qd6iC
         PMcM5qUQnTOXFKd/Yb9Aga99AnXtDmFWdf0ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i1FdLQv085wfWFWtegifKeLDyQQWed9W/WtFHVURZIU=;
        b=ZwlkyzNXp1D7G0dsXpCtXfWkNcNUpbDO7BanXPJbLWix9YShzaCsCuVZ0wbExBw8H0
         nHDrJhAyIwsef1xbBLuXgbxnM9nmB3ljvtoWtK8Dt0Z8vwDylKjeM8InDqdf5XRKTzPq
         EmVA13Bzuift4/v0MJEdkye/79mowWWX2I9ZZyKX7enpiOKy92ITq9tween3afag2rMG
         igcgeAFIvmr5sEmvgI0Iy2UAsoNWd+IyNJVvB4qK21R4Yq8m120ZeZD2Fdx/DXbtUTl7
         1j7zLKN0lyHUcEtklcFyQFm/uZmug9VFxjbIsuxNp23AIRBzrmnCynmCog4OHRI2cjO6
         z48A==
X-Gm-Message-State: AOAM532gglrlkdXWtIHgdy17bk54wZzLUJYjGeu6kkc4QjYoyWS2rL87
	w9zZOZIW96TtP1ss6hBev7JOGLQif/Q9PA==
X-Google-Smtp-Source: ABdhPJzbdVqVmrlQlG991AHfmPfkLHLHvFXwM4T8shl96AA0OtCttP2DsWHQTWbWRhzdYO/EBj8K0w==
X-Received: by 2002:adf:f7cf:: with SMTP id a15mr32085216wrq.184.1621204377053;
        Sun, 16 May 2021 15:32:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:56 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/27] libtirpc: upgrade 1.3.1 -> 1.3.2
Date: Sun, 16 May 2021 23:32:36 +0100
Message-Id: <20210516223247.2401235-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libtirpc/{libtirpc_1.3.1.bb => libtirpc_1.3.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libtirpc/{libtirpc_1.3.1.bb => libtirpc_1.3.2.bb} (90%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
similarity index 90%
rename from meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb
rename to meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
index 57922642505..b666263280e 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb
@@ -12,7 +12,7 @@ PROVIDES = "virtual/librpc"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-SRC_URI[sha256sum] = "245895caf066bec5e3d4375942c8cb4366adad184c29c618d97f724ea309ee17"
+SRC_URI[sha256sum] = "e24eb88b8ce7db3b7ca6eb80115dd1284abc5ec32a8deccfed2224fc2532b9fd"
 
 inherit autotools pkgconfig
 
-- 
2.30.2

