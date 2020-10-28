Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.3864.1603919189614754472
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m+nHyTtC;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id t11so888932edj.13
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+//hB2UR0hZxjZiQt9y3KUo38W7PmSmEku4lCh6R3M4=;
        b=m+nHyTtCVHZnvHA1MxrRqJZ+7R5vDQUFOrvTB1JJ2LPbfWWB107sqmF+VrsIUYRsUI
         zIX6cnE2SbTwmNjSSrEQubJLhtoUFS8cRfxnyMZV7whVtpFplxa3NpvW65RwUNhp0F9k
         uIw2gNyja9WN5J2Nz7NlevfKURN/vu+7/VU9DBECYEVP0s24fm1VDuwux4yuAy560fDe
         J+tlsfWnChpBH2UIrXzoBkrK55Ek+ebP1DwJcEq10S0tGsSBApopiSzvrlU2iohdTyGl
         Z5Ht8yjnAakMYWTu5hjdSb1OkcdWw9SH9TwtwuARieNZT/qg0ItplbZRwuHysccZwFYg
         K9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+//hB2UR0hZxjZiQt9y3KUo38W7PmSmEku4lCh6R3M4=;
        b=hPFmeYD+CNzqy5VON+7OcgaFFaKbjJCpOMzCBOUSfto1DS2Ai0zx4Df/PK+ljpRTtx
         2rfl24cUMTs9rEkGpPrxA+Qo4I8t++b55n9lqGLcH0q98apTxZQui+l2FJ/xABhTfben
         YI6Yuu1H6lf+LzOcReRQ+wAlkbHi5m5AHi7Wf6iH0QcGsR2LB82HXP6kD5yYT5vAeRdb
         XcwtYXoCr6yB5ARjau7+Jpeqo2nJUpjOL5G9M97s5Jru7+Fy6TbrHFVtOpJ2ECQGQjks
         7TkOVsnURMJufqIPwXy0/tCpp0W0Ijs0QJJlQ05bk4K615YRuz3QJnx+Az/nGZndV2kH
         QiDA==
X-Gm-Message-State: AOAM530Uez6B+kkg5bRKGMKw8sjA7u/cA/zadEHPaH56JhThfFTwO3mD
	KdEPNHIUqm+8ymVqP8Yb8932SLX7PJFzHw==
X-Google-Smtp-Source: ABdhPJwg0lR5ip3T9Y3Xex1ywvaZ5zMJhFY2WCg+e5kUATDaTzI++YwGG+45fZ5EaReQO54vgRXSJQ==
X-Received: by 2002:aa7:c6cd:: with SMTP id b13mr920582eds.32.1603919188054;
        Wed, 28 Oct 2020 14:06:28 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:27 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 25/33] libhandy: upgrade 0.0.13 -> 1.0.0
Date: Wed, 28 Oct 2020 22:05:50 +0100
Message-Id: <20201028210558.21070-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/libhandy/libhandy_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/libhandy/libhandy_git.bb b/meta/recipes-gnome/libhandy/libhandy_git.bb
index 9f74014640..01b932a528 100644
--- a/meta/recipes-gnome/libhandy/libhandy_git.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_git.bb
@@ -3,9 +3,9 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/${BPN}.git;protocol=https"
-SRCREV = "7a193d7692c9c76a1a94f17c4d30b585f77d177c"
+SRCREV = "94313c206258860b2428712e7ece1d02c5177857"
 S = "${WORKDIR}/git"
-PV = "0.0.13"
+PV = "1.0.0"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
-- 
2.29.0

