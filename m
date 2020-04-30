Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web11.513.1588286366602535396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 15:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kdO8Tl3t;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.194, mailfrom: steve@sakoman.com)
Received: by mail-il1-f194.google.com with SMTP id f82so2952954ilh.8
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 15:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=VPD4iKUdAbsSnAiw3g5q3RFdrLDXFk0gmUyj97qekmE=;
        b=kdO8Tl3t7RgEoo3XQhtX0G0BAM/XxZsbwgw5ZS1hgXPCV4nEugjLUBjMGEvIJPWa8P
         lv5Dx63+VGOZLww5sPvuGQvHyhTw9THhU/D955YIAilc6FbSp/o3b6TfWunhb1rElw4P
         qWEJv7msj3scOxPvjh1et+uTA9jS26W1g34fByoflsRd6Q10DLNfEhLpXqkbrhCMbUdz
         ZcXXfV085hSKMM8E00wYXPp1LwEO5LTJiSJbmdPmG9KlUpgd6BbAByAaF2BHsMJH3Ji4
         9cTzGph5umewZMeS3nkinatN+VoE0FhpWNL6/J3TXN+ee7Aa5+LWzJBSwqmqe75C3dSm
         N1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=VPD4iKUdAbsSnAiw3g5q3RFdrLDXFk0gmUyj97qekmE=;
        b=P3v/hZX95f/boFhasP/j7Ch+WSCEiZFt9D4b6SSoYomO5s6m0IjymaRVSfgD0Gg1P9
         BZ6NYn3scxoMOtbgSdpbuOba0ofxjN20bIoGK7p45gfDJouKSx/EfxSdi1gpG5zFCIfS
         rAb5d67KmoxsdYw/E319P7Ew6Mi4hIVfH63QBB4NbHaM8ubCa84WSKUigkYlElIekyHo
         usbxgdbK+Y/MgDrXc2kR5J/YMB8UOGPFF44QjT+LtPVAuYjpqd5dxCcbawFUEzx1Jv7K
         Ege6mpFq0icxsrnpEpg9hu/xNuTJgmj5p84Yj2oiQQSj5Q0LTjDtFMh9Eyzy9ej2PVSF
         eE+A==
X-Gm-Message-State: AGi0Puarl4jUhQ/3mrMh1VY5nRWaX4Yph145acbHCzzQ5XF/7LR7+0uL
	oSX3b3AnijK2leYNkJqjqs+oey5NhehMeg==
X-Google-Smtp-Source: APiQypJXFSdgl62OD7Y9VwoxqAe1rzPOT1gY9jVRCdx2KF3FnOH9WkcdSOtp83IJmEmtzQS1y6XhrQ==
X-Received: by 2002:a63:b51b:: with SMTP id y27mr1115134pge.400.1588285872882;
        Thu, 30 Apr 2020 15:31:12 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d124sm646011pfa.98.2020.04.30.15.31.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 15:31:12 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 10/14] ell: upgrade 0.30 -> 0.31
Date: Thu, 30 Apr 2020 12:30:15 -1000
Message-Id: <c1892a1074560e27671975f4b9fb92468d9874da.1588285073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588285073.git.steve@sakoman.com>
References: <cover.1588285073.git.steve@sakoman.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

This is a bugfix release:

ver 0.31:
	Fix issue with verification of the second certificate in chain.
	Fix issue with handling trusted CA matching in verification.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ell/{ell_0.30.bb => ell_0.31.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/ell/{ell_0.30.bb => ell_0.31.bb} (83%)

diff --git a/meta/recipes-core/ell/ell_0.30.bb b/meta/recipes-core/ell/ell_0.31.bb
similarity index 83%
rename from meta/recipes-core/ell/ell_0.30.bb
rename to meta/recipes-core/ell/ell_0.31.bb
index 17045b3ae5..1db7131ab0 100644
--- a/meta/recipes-core/ell/ell_0.30.bb
+++ b/meta/recipes-core/ell/ell_0.31.bb
@@ -14,8 +14,8 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "79c757858688cc6c36087605234d87a8"
-SRC_URI[sha256sum] = "51cf8cc66a9d1038e41f7d619ea5660aa4476904496562b2d45ca79370ca4a5e"
+SRC_URI[md5sum] = "3f670230be4d89d621b0508c70b1d36b"
+SRC_URI[sha256sum] = "ae88617275452f9f5840b2365e33e6c7fb6fa3405d42cbf9367de642ee8b6701"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.17.1

