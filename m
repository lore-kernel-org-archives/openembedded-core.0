Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76875C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:49 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.9126.1635325668828460858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FcgUmhvT;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id k7so2815747wrd.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dNX3AXKqLjCCMYRuhV7uovmos1wOB53HoFOgX9imXUY=;
        b=FcgUmhvTZbMkd+GxgWcBkQbmiL4XPcLg9bzmT3qM4/FIuO+9E10LVEJGD3So3TUzs9
         oUAN7fM6HShszVhAiWI357DoEM1tNQX49CnC7shUSwAZpFz4OndJJ5Kb7ByMyhoXhnP1
         fxL1aK8ihJFrb7GD4nDz2aJt+7BLZXkf+B/0ONRCrM/X5szIv6T2pH4+Qxr5DERu3jjq
         rXQbBVQLS4Iz9T3dyzzud0YInAYn8xG9SvnPqjhezFl1hL2xFjQCx/oADokD+3hA5idw
         CWDs8N4igFmK2blSvLP6zAHYAsz/b4ZRzk0rtO6rc4Zlkz57xnerN/knhMKJ6/LuCmeQ
         fGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dNX3AXKqLjCCMYRuhV7uovmos1wOB53HoFOgX9imXUY=;
        b=KmS3wXmsQgGTGR8Mtwj/1Z1hIcI/EneMLIaEOG32UfSvFV4oytd570eG05sFbkJ55/
         KoBGc7qvX+w3h3kmNyVqp26CzaaViJsKcQb3Ny7wYiqihJmiQlwBTQzbRTSndoJ8qeE/
         fzeO4DeU4O4DnZCXG/8SxDmFcYpFEUEIjYYBZExOB0p+jewdN/G2RdVQnNXEhccC8c6V
         zr+kuQixC61kilHdAqOBH6pkLWk53nYkkoL/Ap7varh/RppD0VcQAO1ey0S7hYptyno9
         w+ElRqsLW4u9Gf+pP4ypUhvl1E0B1gMxLsqO8u3SyNqF4N6DDoiJdr3IyOZ6TIWYfB06
         VYmA==
X-Gm-Message-State: AOAM5333NJBYSuc/fC9jmJfhQZzewi1LSfdAVeTNOZXcUBRUkvhQs7Q0
	tkoUx8c93EUAGC3UkIWYBHIKZZS+JWg=
X-Google-Smtp-Source: 
 ABdhPJwFHLnv9x7a4duWCJKNX5CmoJfaSEjC9AVmNxlv1EJ4YIV0hHxiJeNoZrjboy9phRM+lP6L3g==
X-Received: by 2002:a05:6000:11ce:: with SMTP id
 i14mr22370411wrx.102.1635325667453;
        Wed, 27 Oct 2021 02:07:47 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/30] webkitgtk: upgrade 2.34.0 -> 2.34.1
Date: Wed, 27 Oct 2021 11:07:20 +0200
Message-Id: <20211027090736.2546759-14-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157490

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../webkit/{webkitgtk_2.34.0.bb => webkitgtk_2.34.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.34.0.bb => webkitgtk_2.34.1.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.1.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.34.1.bb
index 906683041d..dde8963d04 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.1.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Fix-build-without-opengl-or-es.patch \
            "
 
-SRC_URI[sha256sum] = "880c8ee626f67019f67557ca09e59a23ecf245e60f6173215f1a8823cb09af34"
+SRC_URI[sha256sum] = "443c1316705de024741748e85fe32324d299d9ee68e6feb340b89e4a04073dee"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.20.1


