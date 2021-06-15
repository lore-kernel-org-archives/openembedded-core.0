Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.6326.1623744781502064290
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:13:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DKxb/6h2;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id w21so49823364edv.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SaLeehMG2rlLzXW0+gDoW/Bcs/RwiUy7CV1ufQ2pNCc=;
        b=DKxb/6h2hlYHy7+L75Iuk32M8NzgQsy3Hkp+8IPXPP/RORQi9nlJhlwSNj6tyw9N3p
         I7eTnBQxXB1gZ3snnI4XUuZODO5ySob52gtQZKYJS0ktWiZ0bJQmeuypVNYn/ygyP2UW
         mnyIFSK8VGfxfUl/U/AU4amwfvEstxyAR5pn0EIj1cwGvIhZDlrqFWW6SrcLl2oriSUT
         ioRm66t5Fk91T+4qTQfLBiCcCOwLCHX6uUoXPGtn8hwWZrYiGMffX4yQni6xc/oezfa/
         ujEXvDBw0HrxwhloPto99C0BtQg50qaU+PYj8BaQ6ZvRwHh+XD+p7OrQzMxWhmMeiP5v
         j4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SaLeehMG2rlLzXW0+gDoW/Bcs/RwiUy7CV1ufQ2pNCc=;
        b=ivkmyKzmquBZpRcEQ1fO3IUR1SoSXGjYuzprnNjAuAgKWW4EaMsdgI1zUzFhmftVlx
         vA+n/yWJReox2hZ4H40B4AkJjeSq7sSGSfexl8imAf3zOBGFqXNoeqa5i5iLPaseSVRP
         wd1wa4/yYUuoLav5JpkgOUvdXhrkML0V7IufeQOdR0jt21ZQC6SXsfdcry5+qo/M3XJw
         h5LZ+EjuN6Ic9u7HjFkQtLhM9044irw1zlli1hxJygVzICMa2e2VZ9pvXXa33Cifcwy3
         7JFEDSdqL2e+Z80PqUVr1F5hJzVridY2gvrnj27HzsPU5mpgT/4NLZ357D1iJbhh5BIn
         IZQQ==
X-Gm-Message-State: AOAM532ElZGLSIlMhgbj9tq89i/sjB9h+DvHavYqrZppd1HfcLNBgn67
	fPw+YmDL5R31qnQILHqMtb89nuJhlyzfpQ==
X-Google-Smtp-Source: ABdhPJyUVDyReI8skqYeYO62uF81MuN9PMOO20+Cd7cHaMOgWiz/fyRan+ZBnz047ZGmA4PqliTyuA==
X-Received: by 2002:aa7:da4b:: with SMTP id w11mr22234025eds.272.1623744780126;
        Tue, 15 Jun 2021 01:13:00 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:59 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/31] libx11: upgrade 1.7.1 -> 1.7.2
Date: Tue, 15 Jun 2021 10:12:31 +0200
Message-Id: <20210615081240.1734087-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../xorg-lib/{libx11_1.7.1.bb => libx11_1.7.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libx11_1.7.1.bb => libx11_1.7.2.bb} (93%)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb b/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
similarity index 93%
rename from meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb
rename to meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
index b5f0445e12..383860409f 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.7.2.bb
@@ -14,7 +14,7 @@ SRC_URI += "file://Fix-hanging-issue-in-_XReply.patch \
            file://disable_tests.patch \
            "
 
-SRC_URI[sha256sum] = "e64e43deaa562cbfb0d5ada64670ec09c6fac7935262dcd77bbc6d984a535d47"
+SRC_URI[sha256sum] = "1cfa35e37aaabbe4792e9bb690468efefbfbf6b147d9c69d6f90d13c3092ea6c"
 
 PROVIDES = "virtual/libx11"
 
-- 
2.31.1

