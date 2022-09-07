Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF7BC38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:14:25 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.2523.1662592461458172604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VD5sYH2R;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so470582pjq.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ihH979QQbuEwrq+bSPPpkvgWOe7vPpigb1KUkfqiR/M=;
        b=VD5sYH2RwgBFVI+yZMVs4wVLkCcwsWxUtWElJZIZORjaULPvS9zuhhXBz0ypb+x2FB
         ma+2lkXPZ/kjmLp+/PwJjOQ/hG9K2q5WliTd3gWY/89vbtWIigoYmVROJSzlkL2TBzro
         tSWoivTNkFu8y8fDxv8d/6oJVuqKmejxdkPcWUC+9GcVNk6ZuI/wct5mo3KoMSW+xSEB
         idvkKcIfOd9vsAvRkSGSZOV6k2RHPwUker3aZ5oKtlIWRbKKN/Dq0LvpbaZ5jthKevLO
         QzV1D9TgkH19it1IXSyTv7mYn3QgaeOTtFZjJDVHRNCjHrgQ6XAV11GZ9ZAW4mSF89sY
         ORKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ihH979QQbuEwrq+bSPPpkvgWOe7vPpigb1KUkfqiR/M=;
        b=yMuu0d7wKViTE8VrRLYUdgu6K1LoWaNYdNvJuI9gkRF9DZmXOV/++vzVRaBukRlA+c
         wUYuwzFi6YDWeh58646nxNu3nxifYoFgLLERRfhXnAMGekof1QfxVGF3V7m/NARNXBqT
         BpLSsrJ/bITA5BYmButtVfHoG5mMpoRYzVeGfHPes3zS0yxnx0NJmyfBl0fwUTNTMwPW
         m7+Edf3O3jrhqi5vDth4I3Zdry6GLSleb99zQmiLUr1YWyT3zt5oELno+yT/N8geksxA
         pc6XOIW5KejpNsloXmmNT+K5ufwuyzQ30eeevb2fSF5/E9KC2sYcy1gX/oBZHZ5NqZtH
         mjQg==
X-Gm-Message-State: ACgBeo0rwamywDMy5S1soJY+DCM8oF0C+ZRaSNmnnt9irIkfGRg4tOza
	2fPFCG81P5Rd9Wj1bRLFi+eKd4QverCxcQ==
X-Google-Smtp-Source: 
 AA6agR50UHyzokb34I38/5D6iuHGD8EXfOg6s1mwHrUEQAZrfdHWcW9AYR5zTfmh9tyzJQx6uoFhkw==
X-Received: by 2002:a17:902:a704:b0:174:3ad5:30b8 with SMTP id
 w4-20020a170902a70400b001743ad530b8mr5944729plq.14.1662592460588;
        Wed, 07 Sep 2022 16:14:20 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 o19-20020a170902779300b0016dc6279ab7sm12867892pll.149.2022.09.07.16.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:14:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] vala: Update to 0.56.3 bugfix release
Date: Wed,  7 Sep 2022 16:14:17 -0700
Message-Id: <20220907231417.3274392-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907231417.3274392-1-raj.khem@gmail.com>
References: <20220907231417.3274392-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 23:14:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170434

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/vala/vala_0.56.2.bb | 3 ---
 meta/recipes-devtools/vala/vala_0.56.3.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala_0.56.2.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.56.3.bb

diff --git a/meta/recipes-devtools/vala/vala_0.56.2.bb b/meta/recipes-devtools/vala/vala_0.56.2.bb
deleted file mode 100644
index 08c8ccca1d..0000000000
--- a/meta/recipes-devtools/vala/vala_0.56.2.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[sha256sum] = "66c9619bb17859fd1ac3aba0a57970613e38fd2a1ee30541174260c9fb90124c"
diff --git a/meta/recipes-devtools/vala/vala_0.56.3.bb b/meta/recipes-devtools/vala/vala_0.56.3.bb
new file mode 100644
index 0000000000..83f61e5b2f
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.56.3.bb
@@ -0,0 +1,3 @@
+require ${BPN}.inc
+
+SRC_URI[sha256sum] = "e1066221bf7b89cb1fa7327a3888645cb33b604de3bf45aa81132fd040b699bf"
-- 
2.37.3


