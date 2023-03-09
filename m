Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65445C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:35 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.5715.1678402691370325069
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=yqqB5Da1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id y2so3562296pjg.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FWWjkz/95VQinhGNQBVkcHftsphVu0WmOYpkFreKgGI=;
        b=yqqB5Da1Tcz/LHRNmK1yO+kWpY9CFPTX7UhtEbnBUccH40qG9YPTuhjGzelsieaw48
         nh35/5OYSI+jZoP5Y/MwaJzaLdo1HbHGHoR7Lc/AO4VLKmsqPZb15N1DJ8rHcpvTUKuK
         4noqvXdGPiX+rmFjICac+JNpUBDvaXKDgP1A1X3IyLNO3/03j/PP7nBxGNQFcDZ9IoJz
         Yam7xONnkBVljppaRl8tcJLK5N/9andz8mKFkcwTnp3RNsCiy63fCxuLeZRMl0Z59pzB
         wEgWPruGluw2R2ii0TrKQrsDuDOlgbAu+u02Rjl3MAamsplOzbOlygpJgFXkVqLfwHP6
         r70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWWjkz/95VQinhGNQBVkcHftsphVu0WmOYpkFreKgGI=;
        b=aJIbsu7mymN2HHv+YzDhvmIke2GCE6B78eqopLAsJdcT+hFZjxj0HDtBjjLvVteusw
         lBRba4nm7pmReHON2EOdMPp4+moxyd+V7rDfjluZkufG9kEn4RzdEJCdVJUeCuJQ2917
         7FjDIUmlDAOyltpNaTQY20BlDRGsz7fRaRo7iy5bCxPRddbCYWmpw3GXQrCAd5xePpMo
         ARx+IW6EgT3n8Zaf0qmOnf/R45A5d5wkZduJuMZ93j5QqHQCJ0IADRcgtnvwOZhsydpN
         99f/ckDNCjXc+VfhfAmcNes+TyYxISZ1hfoEIcpPJdBnZoU9EH4UQvHY0NIB5G/eQ0NL
         L//Q==
X-Gm-Message-State: AO0yUKWHbJhc333cqpU5iXjYEAoH4O+t3eNchmsoETDwTBJkz+I4R+pe
	oz1ZVqSJlp0dkxy1HqIot/lTB61jGMj2e2ZTQsQ=
X-Google-Smtp-Source: AK7set+By2r6O9BMIj78UvHH8a/pRKlAl9jeslYIlfus31YcJopNc6xiSuXDVKvpi2in0cBoTEAiiw==
X-Received: by 2002:a05:6a20:1585:b0:cc:a93:2b81 with SMTP id h5-20020a056a20158500b000cc0a932b81mr24898904pzj.41.1678402711485;
        Thu, 09 Mar 2023 14:58:31 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 11/27] libmicrohttpd: upgrade 0.9.75 -> 0.9.76
Date: Thu,  9 Mar 2023 12:57:46 -1000
Message-Id: <35e9efdd6aac2092e3c1327a01e7fd1165876917.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178284

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Fix potential DoS vector in MHD_PostProcessor.
Releasing GNU libmicrohttpd 0.9.76 hotfix.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f5b5c77d797ce09e2322ad744f0e4fa3ffd50f19)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{libmicrohttpd_0.9.75.bb => libmicrohttpd_0.9.76.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.75.bb => libmicrohttpd_0.9.76.bb} (90%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
similarity index 90%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
index 043fed367c..7bd66f63cf 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "9278907a6f571b391aab9644fd646a5108ed97311ec66f6359cebbedb0a4e3bb"
+SRC_URI[sha256sum] = "f0b1547b5a42a6c0f724e8e1c1cb5ce9c4c35fb495e7d780b9930d35011ceb4c"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.34.1


