Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web12.3954.1587928386902330354
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2020 12:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IQPQBhs9;
 spf=pass (domain: gmail.com, ip: 209.85.210.65, mailfrom: jpuhlman@gmail.com)
Received: by mail-ot1-f65.google.com with SMTP id e26so22479209otr.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2020 12:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zIzNjk8l/e/Qox++Cj6EEdeE9Mkep5iA9AZcDQBmzaQ=;
        b=IQPQBhs9dEOikRqP/Fmb0siEE53qcndrrA76H+kXAi22tI71eF9l4X+kfUnrGy20sj
         LgNR5MnfLfyWdwWrh2I0Tupsl5RLHqhpKlbOGAOfbmGwyLhImDxFnwR5JdxvcghXp5B7
         b4Xw12B/cP2IwlY8/ZdsYGGeFJ1oZI2smbKQBRvh0apWrciHbAs3lLX+PaXSi7iFTT42
         1y5M95pSJL0p+DlFQO/wh0zNBBSO2fNB6uXbfS3zXt0rwDdfJ9oK6gwoQTv8zOjhHR8f
         mUOqDqpSwCydQq6CzGo7YNxLW1JIPeVb5if2dfMO9eFgt0uQ8qdn2FuFFb0eFua5Ycua
         Fy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=zIzNjk8l/e/Qox++Cj6EEdeE9Mkep5iA9AZcDQBmzaQ=;
        b=s0JnUDWoR6BDY1AQzDStv+MNpACg2orRjug29Vrl3VXp+Ln7OTihsABka1Wammfgg1
         kEDUFi5YOdc9HlNA5fWKjI7OFw7yKw+nZlvOQRbTVJW4hSuHyIWy3sUhD1L1NsXX/tLu
         /V5CfRMT7SKqU0gYenn3pO7I7TGY2KQrVGq/963AEHctup0ZRbrrlQx46o0PSmxhZU2O
         cjCkNCRQshTU4XD671UFKc2UVpqTwTGgRxHZQJPaH8Xrrqy9yQjdZJoL/zHjBxFrCthY
         3cVCZg0arnsDLCo9qiLEnlvdDgjuNARS35wQFZlINEWHiJPMZofmYiDX1hhxvKMytmUD
         Bkqg==
X-Gm-Message-State: AGi0Puaz7hh7NknfnlevhaQsieR0K7dw5oHN97PwxYimsnbAWS8ssljE
	FNt0vfqbV/lQ4mmbjCjkn8c=
X-Google-Smtp-Source: APiQypJMAg8vH1BhuCJsD0abIM5vV425zDfjXuXSDacez1DOgUGjOJCEcejLK9u0qeBYTBgNxX7qhw==
X-Received: by 2002:aca:c43:: with SMTP id i3mr13743639oiy.91.1587928386237;
        Sun, 26 Apr 2020 12:13:06 -0700 (PDT)
Return-Path: <jpuhlman@gmail.com>
Received: from workhorse.localdomain (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id c81sm3383431oib.35.2020.04.26.12.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2020 12:13:05 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 91F6E2A0923; Sun, 26 Apr 2020 12:13:04 -0700 (PDT)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 2/3] nativesdk-gcc-runtime: enable building libstdc++.a
Date: Sun, 26 Apr 2020 12:13:01 -0700
Message-Id: <20200426191302.25782-2-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200426191302.25782-1-jpuhlman@mvista.com>
References: <20200426191302.25782-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

(From OE-Core rev: ef5cff3db22e911b7a6ecf3dac212903757b4df1)

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 771f344ac0..ace706dbf4 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -22,6 +22,8 @@ EXTRA_OECONF_append_libc-newlib = " --with-newlib"
 EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
 EXTRA_OECONF_append_armeb = " libat_cv_have_ifunc=no "
 
+DISABLE_STATIC_class-nativesdk ?= ""
+
 # Newlib does not support symbol versioning on libsdtcc++
 SYMVERS_CONF_libc-newlib = ""
 
-- 
2.20.1

