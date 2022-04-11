Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE70AC47096
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.26173.1649654119092621888
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 22:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q9wnrEfV;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id h5so12253825pgc.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 22:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=158HYKTwMocKS6FB2IhulelNuf924AxNUoeqxmzMALU=;
        b=Q9wnrEfVvrsBm/Zltw0mFxGhqYiyovvMlNqdbXDZ52aBG6HawJIFC0Gf1mmU4MHK0h
         owaKalHsAxXDtZ7C3TJkySd/8rgYK0U3feyQja1z9RNMtdUfpYcFZzSTUpyRntYb5rNj
         d/Eu7B1JIJZbHAyCJzuQcZbWQyMoqhORxvg/mqdUmU24u/mhqBmv++5UCHxaobC+Kdr9
         lTfc5WdlXW0GYngpRoSyH8Ns9awI1GxYlvSad8IYHSeZ+fXmS7nuonlPqdnSyMLmU5Bd
         7HlTWzzE51Y2+Of6f/jPvc2qMlLaewNjxNIeVRx1QL9vr3RyxUA/Cd/RvHA1vMV2M9xS
         bsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=158HYKTwMocKS6FB2IhulelNuf924AxNUoeqxmzMALU=;
        b=FraMH7ShDv1oyAXX6qn5jIG6J2rHakwn6cSiwJnHSPJUH5HCL7eryqyHn8EnnbEeK0
         wKFXaimebAUqoLu4HkTWsc8EQ2IDPcyM34kv9WIB/pQ9L1yfp9UUySUHqq39BkUnpW90
         B4cAdzDRANKHlsSA7I/mXBj5H5gis/OPJ1SVZYpIKiYIYg+rQoBO2waMXgJrHtEJyxXq
         4YIs//3VVS9SA3ilPmgZle6KYY859JYhxdo3P/XRpkpkksOw1peKCSRLu+yJOTo0QUj0
         nNm6Rhreo6RjLLpPkiQQg9K0RdGsozKpzpJipvqsWUtfnLLEC641VJV1tyVQWfa9vYMK
         ErVw==
X-Gm-Message-State: AOAM5339L3d4D7NcuOKhv2RUVxxaihNXK9cj+VjrtkYmnUxhNaiLuwwh
	4PUk/SLfMrkIah/IUfQcUgPjDbm7NdWqUw==
X-Google-Smtp-Source: 
 ABdhPJx9mA2lOcatDBJRj2Z7W3z3+on6mFT/aS+ehgR7LYWhijE46VQirc0HFiqWvocU0h8EZeELkg==
X-Received: by 2002:a63:2cd5:0:b0:398:997f:a440 with SMTP id
 s204-20020a632cd5000000b00398997fa440mr25771773pgs.344.1649654118304;
        Sun, 10 Apr 2022 22:15:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 j13-20020a056a00130d00b004f1025a4361sm35044314pfu.202.2022.04.10.22.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 22:15:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [master][kirkstone][PATCH] musl: Move to 1.2.3 release tag
Date: Sun, 10 Apr 2022 22:15:15 -0700
Message-Id: <20220411051515.4061855-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164213

This actually are just 2 patches on top of what we have thus far

* 7a43f6fe release 1.2.3
* 01b14242 accept null pointer as message argument to gettext functions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index d29097106fa..044ed9c064b 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,9 +4,9 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "6d8a515796270eb6cec8a278cb353a078a10f09a"
+SRCREV = "7a43f6fea9081bdd53d8a11cef9e9fab0348c53d"
 
-BASEVER = "1.2.2"
+BASEVER = "1.2.3"
 
 PV = "${BASEVER}+git${SRCPV}"
 
-- 
2.35.1


