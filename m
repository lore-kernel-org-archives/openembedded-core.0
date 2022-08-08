Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A4EC25B0D
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:16 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.22613.1659940986365386645
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b9KWsxX7;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id f22so10053148edc.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WDxPcZdfp1x+IKN8xErB1xmMv8/lnPritrfrVOgNyss=;
        b=b9KWsxX7foOUR5i2Ni1HGWa0gQtYmhpVQPhL0qYuFNF0vd69mWE0x3Orvb7rmMw+JG
         Ym9biL8mJSP85HWsCI+OALVu7SPr1iQQLD104VUNY3SpsGCf650OI9Q3kq70TBOmpwqu
         1dV+crTRfwZQc0b3tsgyMRnxK2+1hCfEJ7ZbyN05+Dsy6Es5/fyzpAf/c3WQJa8I+jeG
         CQ2iExhZNGOwjHIjmiN+JdUj0EwcfIheTNKtHzI8G+N+mJyWjrJYaoopdjgT5JNr/HXt
         OmGfPLQZ7PWyHUjiL7/Xu8+Pa0iPcHPINhxTgemEhEJGvwBAPqnqJNVh4PI9PgBM2SLW
         hQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WDxPcZdfp1x+IKN8xErB1xmMv8/lnPritrfrVOgNyss=;
        b=zNTkeHqGZEEIQZZXroxswVaWPNQbKk+hhVN0ePYgiAw2zNw4wRR8phWjtqGdCH872/
         qJYirqspIvwJxcOXahswQste3qoVHoowGdOnNFDTPuR5DD8KXD+T4l2gX5SwFY4RyMAM
         vyLB9UQ4deWVoBMBQi76KJ9kKw3cIOxdumsNxlV3o7yQD15pYWKgpvW60IWC2c+21u+n
         HeLo+v6LP3qLaMLp9+ZyaII44j5ZezTK4nC6TE6kFN6KbfQss/xGNmhT/DnOGntEeOD+
         Pe6R1jLPhtE8AgsXilWpOnShadBXku8ZleqDQBgd+QUJN1jGjye/l8dMnA9aT8/SMSsL
         KSwQ==
X-Gm-Message-State: ACgBeo1245LHAglNFpeVuwP44TtNstF5/KeoK8sMA6vAkuS47fLImczQ
	g59aU2h6gt5Gxg0x14YUJ9Dm1Wrhy+I=
X-Google-Smtp-Source: 
 AA6agR4kMK/RpKzwpN5eZLDt5UzrFZCp9lhRNY5N+PoIjA5Q/FnCY+DHN1Q/aCkwTIIQ7bUaL05jlA==
X-Received: by 2002:a05:6402:3201:b0:43d:47ee:4ae2 with SMTP id
 g1-20020a056402320100b0043d47ee4ae2mr10312976eda.235.1659940992580;
        Sun, 07 Aug 2022 23:43:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 36/44] python3-markdown: upgrade 3.3.7 -> 3.4.1
Date: Mon,  8 Aug 2022 08:42:29 +0200
Message-Id: <20220808064237.3975347-36-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169060

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-markdown_3.3.7.bb => python3-markdown_3.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.3.7.bb => python3-markdown_3.4.1.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.3.7.bb b/meta/recipes-devtools/python/python3-markdown_3.4.1.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-markdown_3.3.7.bb
rename to meta/recipes-devtools/python/python3-markdown_3.4.1.bb
index c456cecc78..e99c3310ac 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.3.7.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.4.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Markdown"
-SRC_URI[sha256sum] = "cbb516f16218e643d8e0a95b309f77eb118cb138d39a4f27851e6a63581db874"
+SRC_URI[sha256sum] = "3b809086bb6efad416156e00a0da66fe47618a5d6918dd688f53f40c8e4cfeff"
 
 BBCLASSEXTEND = "native"
 
-- 
2.30.2


