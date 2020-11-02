Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.1222.1604335804698231469
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XjsIiR1A;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id j24so19753990ejc.11
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ny/trpcTLGyRCC5XSS8OKEIeyx7FXNKi+EIroTBgUbw=;
        b=XjsIiR1AmKyFYMKFb0dYbWAPK3JXXTK5kU1tnArd53QPIu9VD2b20S/z/lFskY7Lio
         4A2h/tto/juKfksBQ+xJY6JD5RcOR5PYZGNdol19gRuiVjCvzNuqGB2SLm9y3EYMpJPY
         GmZ5MAfNOGGui1GfGvLOA9eYP49ng12+7hj0UPYzCVvtWfuFfer1dPKV70ZekI3W7GPJ
         Z9ODjNtbJdFQhjut6xOvAUaUDYXd2+hbxeayuaI+T9nDxhJDLu1csUB1s2rndFdu3jGC
         nqM2IBPsG9n840HB3GVhIJjmAXVPAKThenkuQ0fGDzHlRrICpR/7rZlB24bmitwUTtyE
         ZTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ny/trpcTLGyRCC5XSS8OKEIeyx7FXNKi+EIroTBgUbw=;
        b=aNvfi3/rab3VFc0S33fThRZVqENswagBq+Kmv4mzqbhT5SX3Yyos1YdVH3HEIW9X9w
         Qr/VxMqK81Udz7Njtxf4TCYForPmQrNjea7KMqGplfif5HLgPq15a83p7FOllmBDV99U
         tlM+aR5VaZXUMFprdCGR2xSYuP/6hN/MIy6CgyAdCNXX37k1wAVG1imLe93QYiSg+SSZ
         QJsJFBsQ9KtpK2iGxqVYiYnwOjC94N8j0zTO9ZKqnJlVld/sv2ZoWTHwvrqDAWeJ26jQ
         1z/hMBkcrmAh/LO2iQr1ly4dejXI4A1IRPn/JbitTEdt6Uedt7Pm4DKXlDVnOjU3r7GS
         B7gw==
X-Gm-Message-State: AOAM531Boaa97pp5IdOjQiqY0KnGg8uJtIhtQ7tpRjqJB9Q3wzIx8RlK
	yqOT48E7oxewSxTMpXSwinSHG/YUOhrVyA==
X-Google-Smtp-Source: ABdhPJwFa5nMytthEcF++Bv3m+7fddjgjUbrWTjYQ/JcOPQO/NHEbLE0Tfn4u/FkSl2Y/jMIG/l4zw==
X-Received: by 2002:a17:906:745:: with SMTP id z5mr17189192ejb.408.1604335803051;
        Mon, 02 Nov 2020 08:50:03 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:02 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 51/80] btrfs-tools: upgrade 5.7 -> 5.9
Date: Mon,  2 Nov 2020 17:48:38 +0100
Message-Id: <20201102164907.27572-51-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../btrfs-tools/{btrfs-tools_5.7.bb => btrfs-tools_5.9.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.7.bb => btrfs-tools_5.9.bb} (97%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb
similarity index 97%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb
index e61ea9bf89..15a958e624 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "11acf45eea6dd81e891564967051e2bb10bd25f7"
+SRCREV = "2e1fa482300449042ff6612bb51027f3f5765270"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-- 
2.29.0

