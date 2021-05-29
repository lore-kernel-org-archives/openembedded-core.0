Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.19667.1622285897641284745
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 03:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vZndfHl0;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id o10so5551288ilm.13
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 03:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=W0JnBwjxqyIkLUS4JOx3aeNOfkzyYZ8eZy5G4ga2bWQ=;
        b=vZndfHl0v98mT0/8+FSxJx3cPZbq4iydUf811Ex/VuAfAok81tD+62ANdMTJ16aOvy
         gwUkN6hY7fO+7XlC+ilEaD+aWxBq8EdoV/UiJ8bp7HHZ2gfaIbN6uAwg5QjaL97unVSD
         EyX436Wd2BhG83LQDdaAX91d0ppnEjoMJGw/Q1BXgXXKfV1Xs5xcdnCSDKa5kxIScg06
         fF+NgxgcKiD0GWkDpd8gvwygdYNeRVDgjUQUp+oXXf91/65eiJorKiWKcMbu0p62AuWj
         x07/N2/R6vaVpyx32KGPGI7NYOwIqP+syiecAxsGGEZDjXUPdG9ehylbEPBgRlSYN6G7
         9EDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=W0JnBwjxqyIkLUS4JOx3aeNOfkzyYZ8eZy5G4ga2bWQ=;
        b=LDIoGQ/WSrTy/xf3/cNuqZY69WgNWTU74baqZK35rE7CCEKKS+Qx8FEHEO0BZuZJQC
         optJ5aTYaqHxcEuO2a0yq0hBqLCSWbDnEQCPy+p4phAw09soi/55ZLJUDABgZ7NwpGme
         eihVJ1YZeILNINw1E9lOQ2HCcSaK/WCVp7Y9ybXlNk5nwT2168JqRm8Zv/aQC43PKEGq
         djdNUmepeALoCaJqsd5eKrHL7UeqhrSoz2qxCBeHijWdJpXSS0iNk6oDH/BQTKjJDnUA
         M8+Qfas0ac5pApRTLaJpqSeRyNatOa380ey5XSEWDVzlfyGv4z7ntZfkbuq7UvS4+rvX
         lykw==
X-Gm-Message-State: AOAM533qhaLppJQGZ25V2OvX5jmkuFo61ahIxDPZmm1SPZcDbgb0JI3n
	FVYu5/JGw1EOy6ejRUtGsnQlVccG6rj1YFWx
X-Google-Smtp-Source: ABdhPJzZ1Y+I9zwWKkFox6OS4rA2PEFLbCQCZu5JViuA+RmN/vOeaI2/gryZmBhdJX9UdJj/wUWFpQ==
X-Received: by 2002:a05:6e02:ee3:: with SMTP id j3mr5496370ilk.0.1622285896645;
        Sat, 29 May 2021 03:58:16 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id o5sm4441174ilm.78.2021.05.29.03.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 03:58:16 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	alex.kanavin@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v8 5/5] While executing ui testing observed failures due to below warning,
Date: Sat, 29 May 2021 03:57:49 -0700
Message-Id: <20210529105749.3017489-5-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210529105749.3017489-1-vinay.m.engg@gmail.com>
References: <CANNYZj8i1D15ePeor45k2Mpec3vq7y6PSU8+ynLvSzRdnfL1Hg@mail.gmail.com>
 <20210529105749.3017489-1-vinay.m.engg@gmail.com>

"'+v8' is not a recognized feature for this target (ignoring feature)"

Same got fixed by backporting below patch,
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rmacleod/rust-wip-2021-02-16&id=f243e4bbd5414ce519336753a68c53ee60cbe89e

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 meta/recipes-devtools/rust/rust.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index ee3176b559..fb20bbd0fb 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -64,9 +64,6 @@ def llvm_features_from_tune(d):
     if 'neon' in feat:
         f.append("+neon")
 
-    if 'aarch64' in feat:
-        f.append("+v8")
-
     if 'mips32' in feat:
         f.append("+mips32")
 
-- 
2.17.1

