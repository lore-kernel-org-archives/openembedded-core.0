Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web12.8235.1630503948263017869
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 06:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K5ENPLVW;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id t1-20020a4a54010000b02902638ef0f883so824490ooa.11
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 06:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YZl4WQtkDfJPId9qdWRdgIxdKUDvi/c5eh8ZJItaIZw=;
        b=K5ENPLVWY7ujEBMB17ETJw9/SOfeuySmfYqKt5ZLcON66sQKQkL4Aq9sX6Be2xJjH3
         bc0QSNSeCDnTbCCeIK4Sa8IJ35c6luRoJ4D6GqOXGB1dwx5CoB+LTqPsaYNgeDhCv5aC
         yjE2+OzA+UbzH64SiGrJu9UjER6fYbe+pxdJ9Blo2Xdv2QgavYI/ImZa9mZZ0Pgu6gJa
         f807oDdtYhQkC90y4VpheUdECA6N5JE/txtAq824i5E3OQQ+FUWGDa28uBjZ+aDVBxj4
         V45wFcf4bheLi/2oelhdTZuDN/s2mV0py2sKhsq9PTQ1avE35JejtimdL+X7nRi9DCqa
         ZkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YZl4WQtkDfJPId9qdWRdgIxdKUDvi/c5eh8ZJItaIZw=;
        b=NuB/megY+u7DZucSCZo21Nh+NHuDdo1n1k+J73FkgiG1PHODATPcctIfHoCOGjR+vd
         tg8HYjxEV2qzOm0z4Uiu3b0+pwfwLcfdD/HuxV5kL6TgdDtqvrqGrxh4Qm2i3c1xdIXM
         oIisEgTPRnj3Mgjl72bwJRPWFoX05vi568Nd3C3C+GDkSJVqGWvj/9tEyb8m7r9e4N4I
         ZwgjFblCvlbIcnzNHZpLYIP/DyO70dfYbPum5m9QMSWrFSH3CCjY32uCl3kESJQTcYnh
         kHg/GjFVXMJivdNJb23DHsx/EiSrdCjGRbzu/gmfIMZEBabX2RovQcNv0mDELjq6eIwh
         U8HA==
X-Gm-Message-State: AOAM532Xy+btfGusmO04kZ2wLJkwdKXX+IgUVLmoPlDzFaPJX9PzLeIF
	2THpyZNWeRZ0aN8QnwQwNTXq8OE+PM4=
X-Google-Smtp-Source: ABdhPJynBIIej+0JY+9sue5tY2OS3/uZGJEJrs/au/VomXXhFYEHbZNtyG0g61dPdCThl4bbc0fKTg==
X-Received: by 2002:a4a:3443:: with SMTP id n3mr19280949oof.27.1630503947321;
        Wed, 01 Sep 2021 06:45:47 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id c75sm4283772oob.47.2021.09.01.06.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 06:45:46 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	saul.wold@windriver.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 29/31] font-util: Use specific BSD license variant
Date: Wed,  1 Sep 2021 08:45:08 -0500
Message-Id: <20210901134510.29561-30-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901134510.29561-1-JPEWhacker@gmail.com>
References: <20210901134510.29561-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-graphics/xorg-font/font-util_1.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb b/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb
index 8f2d10e25b..f940c5f534 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.3.2.bb
@@ -3,7 +3,7 @@ SUMMARY = "X.Org font package creation/installation utilities"
 require xorg-font-common.inc
 
 #Unicode is MIT
-LICENSE = "BSD & MIT"
+LICENSE = "MIT & MIT-style & BSD-4-Clause & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df208ec65eb84ce5bb8d82d8f3b9675 \
                     file://ucs2any.c;endline=28;md5=8357dc567fc628bd12696f15b2a33bcb \
                     file://bdftruncate.c;endline=26;md5=4f82ffc101a1b165eae9c6998abff937 \
-- 
2.32.0

