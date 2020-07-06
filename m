Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.61416.1594051879590001283
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=2IqT1t3+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id f16so6835812pjt.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ukGknah0RF2smT1seZ2DV1S13NRBwsBJZ5MjLCSxLHI=;
        b=2IqT1t3+BVm2BaJ4XH4wAn5lqS7pF0f/iSRwHIdGRvRxKxLP+tyAu6YQlTbUNW5tQ/
         kcJCWYhOugPGn/4Ln3nF3wqhwMsvsDmH/7b6bK0IlsKqRVqyYnmDhYAp+D2ecvfDcmo7
         CaubgU2VisVlgPDycZ8z6Xij5MySUdmVcZHBXwV1gHsLV1tjN/mDJz5+TkaC++22DB8M
         vXeyfLCoJxGnrcHXs27c/xUkjmarHPE1M2GTcE2Ks5bXwFLh8Di/Q4N86gy5Ax8pUsMc
         U4ZgU79mTMNvyuoKlF4VjQJ25ekCk6wID9+Pwb5cD6zE71P4b7T786eFAU7ITCJRXzqX
         CZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ukGknah0RF2smT1seZ2DV1S13NRBwsBJZ5MjLCSxLHI=;
        b=f7lkxJS6bsV+QhrZlq9RMT2+fKI4td70zTlP+4qtIQXCRjuyyGYK+wcyL/o3h/s5dP
         xE6k/mKK2Bf4V72r519T6kwVsg3oDUZLR6FwHqVQO+uVEocjr6xF8yZo7J1UHN7DBiG3
         Mgq4AZyMTQKX02QVLQsqkffsW3xJfl7a/ILvEZeFzOTJ3lXTMnpkzH2cDPzE/luVcNX3
         KWyZx9BYemyZOAbWfA/s/JSBzBPwvLlJ9OYLk5o78LF6+A/f8GNORfcAzjfuT/U/xKiO
         1zREhSBmLdTML/L5qDK6U17FqOGkj/et7uO6PmtRohlThTna3ETkcQujxIpaoowLkLIj
         RsEQ==
X-Gm-Message-State: AOAM530BOYMspRhxy/Cydt066dheq1yucYWXNbOveQ1uveSeiUc+ZZV+
	2wzf0mLn+Wb+onxHFybZDT/P/sjhcjH+Yg==
X-Google-Smtp-Source: ABdhPJzdzWZvFNoRXVohoS1lq7uJNuj+XIuViw+mOUf5jTa0wqsvvwoH3n/bmko0UWWK7t7+DxpEHg==
X-Received: by 2002:a17:902:ed14:: with SMTP id b20mr44313831pld.25.1594051878717;
        Mon, 06 Jul 2020 09:11:18 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:18 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/25] linux-yocto-rt/5.4: update to rt25
Date: Mon,  6 Jul 2020 06:10:08 -1000
Message-Id: <9f0054f4a57ba42ba3303e849b9c4495e5cfecce.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    46d685b7b963 Linux 5.4.43-rt25

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 361b11594b3e04e7b279a88d5d3358dd75bb2a2e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index c88a045dfc..d4d95204f6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3401d0c3e51b083016c4c5177de686fb9606f304"
+SRCREV_machine ?= "46d685b7b96320ec6e8b2e1a1126ce02cae35865"
 SRCREV_meta ?= "87313d46d577412854ab491d524a94fa82af4536"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.17.1

