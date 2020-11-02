Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.1175.1604335823900970489
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hr7GJVnD;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id cw8so6242463ejb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eXDhNp8lwKmyBrC3+OVaeQRwfG6v3gILhV9aBeruFQY=;
        b=hr7GJVnD42A6piR+LqPt6UbrzUGWwRZn9rlewWstXqUr1pYoHHAAVFtCY0I9ykM/qC
         dY2E1oEPgWehvDQW5rrqwDLJfgjHXcaqGfkPDX/yyuHLBb7D4u6kUXV0s647/V00tqhK
         I6nBUibEi0F8aOt/sFU3s42lmmSP9EeunUtkxZf+nEhfntI5EYE8rT9NYqVyrB6CtWLJ
         fVO6nLIwIMV5r6xyLGEige5RsLnLDr41KCw3k6nOzyH3RWc+fkfuOQH5aYLUOMImgIBs
         x8bgg3Wlg2HVRwqLJrzFbGYDLSfBiB/hN3tfG2qRae7LS7OC8DoQa4wMMoxK7LJjk0uJ
         DXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eXDhNp8lwKmyBrC3+OVaeQRwfG6v3gILhV9aBeruFQY=;
        b=IoBLMDBaPGgEmlyoaUFxegPdtx1OcFExR09x+GeQOpUmlxhqNmLxL7pKqFYoIUO6A7
         PZ5KeAgM8FYpWWldgNVPx0eL64csTqGv8GvW2gXlL7wrk6Y3UgEtkaIYW34M0BxwzKuL
         8SOgNgayK0YXefOYHHJQUJvdlnYZ5VpbwoSrsw0eOmq4VP0gDb9TCF91xKFHDpMveDax
         qwf2pNfg81fOF6xagI211wsKSCpCERoqeggpMKF1kbDBu5Zq12hsVuMEPp1lGB8FI0qq
         LkeNvYk6Hh3nJDxL+ISNERYBu2TtaOJ/fZrX66njuCkl1+3Ykq8pSkTUesoT84YCX19T
         vX+w==
X-Gm-Message-State: AOAM533zJCN8hWY4TnSNTBNWIkI4tCqlOPRusqnVlMou6fALcvn+umfc
	4lbqcP0vq82UReMYMNPcf3+x12Bsd70NZQ==
X-Google-Smtp-Source: ABdhPJzCWRpz8f+lmaHvsseacKDpS65I0z+76YDzFTfkoxovg4chygZU3EJJSMP0FNzKvEFSylddGQ==
X-Received: by 2002:a17:906:3641:: with SMTP id r1mr17104883ejb.391.1604335822253;
        Mon, 02 Nov 2020 08:50:22 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:21 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 73/80] enchant2: upgrade 2.2.9 -> 2.2.12
Date: Mon,  2 Nov 2020 17:49:00 +0100
Message-Id: <20201102164907.27572-73-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: reformatting
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../enchant/{enchant2_2.2.9.bb => enchant2_2.2.12.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/enchant/{enchant2_2.2.9.bb => enchant2_2.2.12.bb} (81%)

diff --git a/meta/recipes-support/enchant/enchant2_2.2.9.bb b/meta/recipes-support/enchant/enchant2_2.2.12.bb
similarity index 81%
rename from meta/recipes-support/enchant/enchant2_2.2.9.bb
rename to meta/recipes-support/enchant/enchant2_2.2.12.bb
index 784fd14ee1..1ce8245731 100644
--- a/meta/recipes-support/enchant/enchant2_2.2.9.bb
+++ b/meta/recipes-support/enchant/enchant2_2.2.12.bb
@@ -2,14 +2,14 @@ SUMMARY = "Enchant Spell checker API Library"
 SECTION = "libs"
 HOMEPAGE = "https://abiword.github.io/enchant/"
 LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "glib-2.0"
 
 inherit autotools pkgconfig
 
 SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "b29a3d2273f5edcbdbbb565e94bfd8ea3f9526886fcb6327b4b0f72f0d722f3c"
+SRC_URI[sha256sum] = "6b9bc58ae714ee7f5335ade966f4ac5718d5339e280cc9e1cca9ab278c06227e"
 
 UPSTREAM_CHECK_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.29.0

