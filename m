Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.4415.1623220618051421207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hV3hDRAT;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id c10so36629343eja.11
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 23:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YOz2cBCfsjF5T9zWM5IHRMszmflDk+MTOUK61rzAljg=;
        b=hV3hDRATP53fY/NlrhSWT9ykWDNi4weUN9HqVOMFV3lR/U3/brgRnGLm7TlyG24zCj
         zKrEa54IJe3BJo0flAF/uCQPmMp3UvNGWP5zxokbb1JreVfH8IcF4Rzfieu5qiApU4dS
         IcoH+T/AkLdclvfwaqjOxdXoxXeUo4LZ3h6he3vIHcwZuTvqxLYapC0wcUr8Y/GI9MKc
         t+f8XO6Hw00HFZwA5ObKFOg6ooFR9opVp88cz/HW83395Drf7JqTjX3dGqDfTF3ouWT/
         Zw7rbKOQx+HTZuMjLTpTEZUTvT/Xaq++8GegG96Tv8At7tWJsEVLh3Gv58qIWBY+vT9W
         HIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YOz2cBCfsjF5T9zWM5IHRMszmflDk+MTOUK61rzAljg=;
        b=U+cms3dtlI9B0t2Kb7dnh0SG9QkxHd8k0TxT8sZeUxJsyg9imOxl8kuJnNeVlNv79K
         eLhySdnx0CiZTWvpeaprfeBkBOlOrzB2tvMktwrWHlRmTf43Y2rrYsmUg0S5btwsNpzF
         aPgwJuXdZH5jp3O9F+m3F5u24aD2t0DqYB8wzaitUBZqqUYIB84nwYYbhYYiRK6Zi5wk
         s0vKKZw88eDp27bEk1q5gPniI3Z9UzSRCOnGPk+rktz8jksgvsbdS4igj0vRJMq9hN/5
         1+JJqYdvyTuXz6IiBPgDzlkxeFyFZhbBI7zhmNtZUaCwtncZ8Vq8w1O0NFFHBoNqokvN
         WdFQ==
X-Gm-Message-State: AOAM53120Nk3aW4cpHofqXAYgrD3g4WmH8+uDZj1SeKle9p7PokzW2W5
	6mpZccF2qfEYCkPi+D65DOj4f9VXpUT7jw==
X-Google-Smtp-Source: ABdhPJzY198AJ9f1FRc6RavQin7YokmxA23GvEtWMZjNp4TV+v9PQdR1zHb7FI8LBXw0bL+I7A04zw==
X-Received: by 2002:a17:906:dbc2:: with SMTP id yc2mr27244482ejb.390.1623220616599;
        Tue, 08 Jun 2021 23:36:56 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id n2sm717691edi.32.2021.06.08.23.36.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:36:56 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] p11-kit: upgrade 0.23.22 -> 0.23.24
Date: Wed,  9 Jun 2021 08:36:46 +0200
Message-Id: <20210609063646.3400519-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063646.3400519-1-schnitzeltony@gmail.com>
References: <20210609063646.3400519-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Use inclusive language on certificate distrust. Note: This changes the directory and attribute names to distrust certain CAs to
  "blocklist" [#324]
* Fix issues spotted by coverity and ASan [#349, #351]
* Integrate gettext with tools more tightly [#358]
* rpc: Forbid use of array of attributes [#365, #367]
* Build fixes [#342, #344, #345, #353, #362, #364]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../p11-kit/{p11-kit_0.23.22.bb => p11-kit_0.24.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.23.22.bb => p11-kit_0.24.0.bb} (91%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb b/meta/recipes-support/p11-kit/p11-kit_0.24.0.bb
similarity index 91%
rename from meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.24.0.bb
index 623afccb5e..6759168b37 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.24.0.bb
@@ -10,8 +10,8 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 
 DEPENDS_append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-SRC_URI = "git://github.com/p11-glue/p11-kit;branch=0.23"
-SRCREV = "bd97afbfe28d5fbbde95ce36ff7a8834fc0291ee"
+SRC_URI = "git://github.com/p11-glue/p11-kit"
+SRCREV = "34826623f58399b24c21f1788e2cdaea34521b7b"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.31.1

