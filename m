Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.19119.1608974871121059773
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L4cxLvFX;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id j16so5594077edr.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m0lr/P/5joJwkZ8yrBMc4a1zpuLjEJNOOIzCIDAkLgc=;
        b=L4cxLvFXe4TMztOKhKGluyrwnirMT/8RsSOvZsjgmQMzSw/vyFQ/sguZ4Wpd+MQGUi
         hAD4Jsm63oMbKbmHmaQbH/RBDuTuFoTEghF9TlpEk+ZFcgffOYhA4NyEy1PdgpTX/2iu
         FueLMVzyYEutaC1qiGIrjINfB0M4xWoC7XXP6OIuOAfj95wmtraPNKbINjUL+W1nJ9XG
         g+WAOCXOKkZI4crCQxLFLgXPWH5hJcmlo6+dUn6Xqv68iwLQIx1vnndR4xW87WHPddrf
         sbwOJxAYZkkSsZhaut1F4SA+P8doqs6aEwpDl7qVdIvhWupidLETCgHiBPIfPngNDt1d
         4WJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m0lr/P/5joJwkZ8yrBMc4a1zpuLjEJNOOIzCIDAkLgc=;
        b=I+DwY1T7h5qMti+QUpTsslkYHN3alOQILcvSZkBhxRLOKrAZXU6CZSRiArgBj5KDkW
         B4lOInBV/w9EnXdo6SrpAzgb+OtBVaz0tszk72ed31UFBRqO3/D/wEUB/In7/LeOX15/
         EdG4c1QeA/vc/1lvhII8ZvzvMyZKVKszou6NX1gG8WTnPcZayU7tyfs1HaEO0FWFVpk8
         vSa7EYlS84voHnTdMibynZZ1/e3CiRTPdcc1hxMdWd6H8lSm+tJDMvkkDVUAnZso6n5y
         m2VO+lNY0EgvocEl3ZwgvndgUbjtPGJHkMiikjU2OPJNFJg8r4ZvYRyJggCKdFqNbMEh
         zdKA==
X-Gm-Message-State: AOAM532/9tKHMsGzyyz+fkOdKgOqGXXPRddY+MhEggbjWBu2qsWllkud
	+0QCIn9xvWDwYArsYu/71o0OTXDQ8I0=
X-Google-Smtp-Source: ABdhPJw3FSYHi+ZDn9fw6ufO5uCOOesVzPPeTuLR7zO3a5f1yXnTcKycMDiUVbBbckfTm/Pr05j4eQ==
X-Received: by 2002:a05:6402:c95:: with SMTP id cm21mr34940871edb.294.1608974869805;
        Sat, 26 Dec 2020 01:27:49 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:49 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/48] gtk+3: upgrade 3.24.23 -> 3.24.24
Date: Sat, 26 Dec 2020 10:26:53 +0100
Message-Id: <20201226092732.52323-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.23.bb => gtk+3_3.24.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.23.bb => gtk+3_3.24.24.bb} (89%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb
similarity index 89%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb
index 338b7030e1..01a2a94ce3 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
            "
-SRC_URI[sha256sum] = "5d864d248357a2251545b3387b35942de5f66e4c66013f0962eb5cb6f8dae2b1"
+SRC_URI[sha256sum] = "cc9d4367c55b724832f6b09ab85481738ea456871f0381768a6a99335a98378a"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.29.2

