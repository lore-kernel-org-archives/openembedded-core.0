Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.7478.1593486253078612258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Y4hmm8w5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id h22so8866388pjf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=2CaW7dZfxsOnggTWc6AGpOJquuO8Ds6BttkLDpHlMDA=;
        b=Y4hmm8w5o+idCEVrXJ0LVSdCMMIwrHYhR8Dh5OUgI+TsbwnonXWntsdnxIKOI3AEOY
         ptbVb3or5wiiWD6iBxTrLpJ+DBLojPXhReY1ETclu52icw3fLYm/GnQ8cWjikRxRYx5Z
         u9fDl57tp/hie4F8xCzssG8fkp8H1QrIbseOmdlRVenpyqi5fyEJRGlxa+2cI5r6cO5Y
         Ah0HgW2HuUlX8R2r49zQz5Bj2guN9dwEtUZMd88xRDQhpccXOWj3r2whc/KgYDvNHnQV
         USnoxOACPPcp2t7DLmgHi5q/T64KJ8MtYdSVrRwa9RItCFsPUqxT7W2lk2p0gfQ9jvUy
         PoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=2CaW7dZfxsOnggTWc6AGpOJquuO8Ds6BttkLDpHlMDA=;
        b=Sj5Lqb9jvF+6kkUkK00UOnY87VvCJxxTsOlcqjhvmdOgrJV3AMVv9Y+WA51JM/Z7HH
         SkUc7Cv9J2kmqL0Y5hTAP/NOQ7YnTEocc9FzwoaRAd/YUsTolonav9vaRlVQSMTVVA/8
         sFHTZWgzjz1cY6R4W34yCgY24XxQ6kthJlUBxfL52whgv67+kj68imqQYywHE4AIkOP4
         b1SW8eseJkMTausVuL97pMMRrHm2tTJ+DYtlCxMnyTPHg5cgMPGWirJlTl2YCo+O2iU4
         89WEfd1N4Ab6A8xuEjFVO19aL9xCJzzawetsjStF+484QGfT9VFVktXYukv+n8rGLD5O
         ojTg==
X-Gm-Message-State: AOAM532/LOgY2tSJs9TaUR6oHCCo205mEw3RCTx3mWYN8zRFuP1tDMtb
	7noFDwTiX4VB5Z2sKUPo1qCSwyB5F0PnRw==
X-Google-Smtp-Source: ABdhPJxx+vAPBrTOevHYY260epvkUJ4tyXJpQLXMAjcUWhp4iaH5Uip5nr/7QHpyomL5U5UNCMHqSg==
X-Received: by 2002:a17:902:7288:: with SMTP id d8mr16311436pll.18.1593486252072;
        Mon, 29 Jun 2020 20:04:12 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.04.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:04:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/22] ell: upgrade 0.31 -> 0.32
Date: Mon, 29 Jun 2020 17:03:03 -1000
Message-Id: <cee916d41aa067fd6f994bf5331962b73f74343c.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

This is a bugfix release:

ver 0.32:
	Fix issue with handling D-Bus watch removal.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 98d97384167a8d297650e49f9cabf4fae823b4a0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ell/{ell_0.31.bb => ell_0.32.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.31.bb => ell_0.32.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.31.bb b/meta/recipes-core/ell/ell_0.32.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.31.bb
rename to meta/recipes-core/ell/ell_0.32.bb
index 1db7131ab0..07dc4d4cbb 100644
--- a/meta/recipes-core/ell/ell_0.31.bb
+++ b/meta/recipes-core/ell/ell_0.32.bb
@@ -14,8 +14,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "3f670230be4d89d621b0508c70b1d36b"
-SRC_URI[sha256sum] = "ae88617275452f9f5840b2365e33e6c7fb6fa3405d42cbf9367de642ee8b6701"
+SRC_URI[sha256sum] = "42fdb9e24ff561a101389d51445cab1ff7d55f5385dc22a05b0493088cf99e30"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.17.1

