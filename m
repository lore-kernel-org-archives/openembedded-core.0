Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.7082.1588683733168761936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RI06LjP4;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id j5so1860144wrq.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AR6RC49bn/TIYOHmAb7A2iwNV7cfrOQMyiQyRNk1RCA=;
        b=RI06LjP453t4Ya6B9eOu1AKgHZy8WcYUyCNwB6H/J/to1BOqc27wD9ioCwZgJkfRqd
         Igi3I0gSgMF93ARm/1vXwoQxXukJvQNQ+A2D1nOiNS9opsfnyVvV+11V9yt4cr7ynBcA
         yWw3OGmEexYal/4KctNKbMHm0TcZPt3HOlxKUdtwUl4zP40Ck1/JoewRNwNtz0UgjWYO
         ZOCSQNuZnhK20WL8ebQcjLOxiqO28bC+W5mbQLq6/z7V+Y1ZWpjl9vvDvu55yV3gjxYH
         9Jky8O/ofkKVFhXSrGmGUC0zAojltG5pFysGX+sYSSEo+U3V24hM9ehsxW8diCqTHzoz
         br/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AR6RC49bn/TIYOHmAb7A2iwNV7cfrOQMyiQyRNk1RCA=;
        b=jh4AEmS2rxhRk2hNa06AhPwOfDKLGKxAxH/dPovuN5T5X+2o3TZleuFZ9s3vx+GlNo
         bBLgw2qlGLqjbjmkW5eKOfuKiupfyo6nKs7MVPnw9R+LfEfTt2F2h+2xRkqMe7DSsZbd
         t8Qpdd6yBpIOYXn7YLNAMVpTk0d+FPPfH8rHaf6GfAOZsVToyHWn+l2RRF3CUq8VwXqp
         i+3SzoYoFcInuNopnw5DNDiGAdwhD+vx9IEms5aiuZoCpE5O5pnfRYdAdZd9SsEeZYdL
         4tJsgn9QoYxq8otntxuMlQVnBWb3p2xECazif40z2KI8OtM2tJWRHcY+jASpwPYQ6oEI
         R8mA==
X-Gm-Message-State: AGi0PuYHca5u8F03L1VIeXwWFnmKTetVt8lHM0bUKR5A13+jOMgkHK6U
	gpKVUfGBDG2m4rKk4XA016q4ACUi
X-Google-Smtp-Source: APiQypLQfJjxDvaPITpDDSM/RUF1f2FgMpJUwpo7hQPd3MNx+2iJZdUjjSi4yDs4JcqMIpWxhVhZOQ==
X-Received: by 2002:adf:fad0:: with SMTP id a16mr3989413wrs.149.1588683731435;
        Tue, 05 May 2020 06:02:11 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:10 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/24] patchelf: switch to git
Date: Tue,  5 May 2020 15:01:20 +0200
Message-Id: <20200505130133.24930-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tarball download website is full of broken links;
while direct tarball download still works, exploring
around and checking for latest versions does not.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/patchelf/patchelf_0.10.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/patchelf/patchelf_0.10.bb b/meta/recipes-devtools/patchelf/patchelf_0.10.bb
index cc983e033a..d29e094edd 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.10.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.10.bb
@@ -1,4 +1,4 @@
-SRC_URI = "https://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "git://github.com/NixOS/patchelf;protocol=https \
            file://handle-read-only-files.patch \
            file://fix-adjusting-startPage.patch \
            "
@@ -6,8 +6,9 @@ SRC_URI = "https://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
 LICENSE = "GPLv3"
 SUMMARY = "Tool to allow editing of RPATH and interpreter fields in ELF binaries"
 
-SRC_URI[md5sum] = "6c3f3a06a95705870d129494a6880106"
-SRC_URI[sha256sum] = "f670cd462ac7161588c28f45349bc20fb9bd842805e3f71387a320e7a9ddfcf3"
+SRCREV = "e1e39f3639e39360ceebb2f7ed533cede4623070"
+
+S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-- 
2.26.1

