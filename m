Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.3856.1603919172104396132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DhTyCZgE;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id x1so983870eds.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=draRZUhhbBKNFfTTZrHi3E/SEvMglD3t+hkcNPFulDQ=;
        b=DhTyCZgE0pmowvcKw8UEuSjVWk7Itq9ivTIJbfnxN8i5YoF6GrxSfZeOFI2LDIhJAt
         lJ0+Fb71Ud7dS3qOZbK2KoojtAOqO5CUrZbUgxITmjhTXoQtLeFdpS4jkiup0EKG/6vF
         NhpfAE7MMTX8Qpem9/SPlsK9hPzVbKX9zVb3ostBSheoMtM96dNh/EQJmqhIgdRB7JrF
         HeRRvlxPb/8Je2SnSMVyicgNqgTz8vHHbTH3RbXD8Ckckn2DOe/YPKhSaX4iz6oIcbDm
         4KF87QvcTVuVFMdKzcdz/Z/teOZp+B1FTcytlt/wqr3qIrq8Fc/BO0z5uPiQzpCybivt
         0Mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=draRZUhhbBKNFfTTZrHi3E/SEvMglD3t+hkcNPFulDQ=;
        b=XybazBcX/OjG1+kEZBAeno2c2ORWHDWtEZ7XGqgo5yOMp4u62bo4GOab8F3D99dkfF
         xF4s+VxwvCcFTQeB38DfHa1erdxJ0zjFD23yE6Kofcb2ghl/Rvm6d9unH+knA14KYRMg
         RjU+gTGVkw9H5A1Z9mmRF/64HMUJrXfmbTeYlxlbdAO2hDzf49B3wcdfFm6afFdVYq2T
         2Rpg0yVFNouxVCnv01vUT8nF2LCVctZq0c5WzkX3ruXkL/vA9968eLJryfB2xgq2oJ6z
         /PWOXZz46SuwOyZutf8J/sG7ZyZ+KWE+97LwW8a3bD6VdS2WeTKu709XqVWvOewkARWf
         Iu3A==
X-Gm-Message-State: AOAM532Dx1FXKAs60JRLMut92NI1nRneZWMrAtDZ8zTN4YuU7WKmUvls
	qvThsGV2lkCmnmNwd8rb3Ijj/IVxmzRweA==
X-Google-Smtp-Source: ABdhPJzHSmJhLGsNvxZ2S/SdAH/b96bGNdyYM9vsnTGQBvxjUkarupALjfDtI6bQbi47q0P/XOpnpQ==
X-Received: by 2002:a05:6402:1d87:: with SMTP id dk7mr848598edb.222.1603919170389;
        Wed, 28 Oct 2020 14:06:10 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:09 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/33] libdazzle: upgrade 3.36.0 -> 3.38.0
Date: Wed, 28 Oct 2020 22:05:30 +0100
Message-Id: <20201028210558.21070-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdazzle/{libdazzle_3.36.0.bb => libdazzle_3.38.0.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-gnome/libdazzle/{libdazzle_3.36.0.bb => libdazzle_3.38.0.bb} (82%)

diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.36.0.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb
similarity index 82%
rename from meta/recipes-gnome/libdazzle/libdazzle_3.36.0.bb
rename to meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb
index 25ccee2e29..a2a1aed7bc 100644
--- a/meta/recipes-gnome/libdazzle/libdazzle_3.36.0.bb
+++ b/meta/recipes-gnome/libdazzle/libdazzle_3.38.0.bb
@@ -12,8 +12,7 @@ inherit gnomebase upstream-version-is-even vala features_check gobject-introspec
 
 DEPENDS = "glib-2.0-native glib-2.0 gtk+3"
 
-SRC_URI[archive.md5sum] = "154be45a6aac020e7d59f477bd7cafcf"
-SRC_URI[archive.sha256sum] = "82b31bbf550fc62970c78bf7f9d55e5fae5b8ea13b24fe2d13c8c6039409d958"
+SRC_URI[archive.sha256sum] = "e18af28217943bcec106585298a91ec3da48aa3ad62fd0992f23f0c70cd1678f"
 
 GIR_MESON_OPTION = 'with_introspection'
 
-- 
2.29.0

