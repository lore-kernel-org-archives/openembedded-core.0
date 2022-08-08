Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C5AC25B0C
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:42:56 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.22450.1659940971095808254
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A80Lywl7;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id j8so14771053ejx.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DVjQ596fwQKDYTEhYgI+q+JtVBpwqbt19CjHjBNbL0w=;
        b=A80Lywl7ks8mIcHuN8W3ua42wtqyvBDNHFTz5SPvE8uTFlMMt69K/Z7ZGJTw23OJb6
         8nojP+ru/pI7JimHlv6/zVbWccZ+oph6h76Djq6T8Pb615qu+C1hRcTnUp1WwEAoUTCN
         H+BZEEVyXH4hmtRoJOk95kjmAVN1Y5ngaQR5gkNRWQl3I2CGR2GGdldshfXONLAt9s67
         gfF/9dmSwBRU7R/XpBVMNFsS8yykqXP6N9HCOvJWv0xUbBx/nKQ5sUMxbN6/XK4RsFKc
         DPdDWYBpEfGDjTh0YjI8N8sHjI2dvuxinVhJQhf+sk38Lb6DLqt+54wRlYuySFm7IdzY
         UjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DVjQ596fwQKDYTEhYgI+q+JtVBpwqbt19CjHjBNbL0w=;
        b=S2s7J4e4d8Z20K8etgbirmSMyAEI/j9gZkb6VYPn3QLqDMosjqPzFmSuBiKzHidWjp
         36L1MJFejfZ/kzCNbLW4dGH4kO1dcfoeCwUubFNi8jzxKZGe4TWvCymi5LlGtYbLoEl4
         +GjDL/3zK4O+8z1gNMtR5+KnLp2o0iAAjs31V2tQMxGT5QlFseILcmfB/tNVpwyQyxKF
         94FflsloBpkGpJOPSRXBY4AX2qJR8/TLGWPfrNJT4HEGN/94LJZmPfhN2o3l73gVidQH
         mx5z9LrXc4uVkw4IHXvSecISW2H7vv+VdnG/1shB7nUNn4K2D19KJvSf4GHfdcxfZsgu
         0rjQ==
X-Gm-Message-State: ACgBeo0W6wJtfYbr/jhMwrcneynhuKCUKXCOQm99CQ7DoxuUzIbyiDqY
	I7bxV6uQnJUAEpUyxV7kIqUTA/O/GJU=
X-Google-Smtp-Source: 
 AA6agR7yNgqGA2weggAPd/twe5CwUyym3BVYkDj8lZmV8m3KYVWzruzKPzHoBxW2LQiJr+2+Wx3sOw==
X-Received: by 2002:a17:907:a047:b0:730:e4e7:5127 with SMTP id
 gz7-20020a170907a04700b00730e4e75127mr11183514ejc.707.1659940969646;
        Sun, 07 Aug 2022 23:42:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 09/44] python3-pip: update 22.2.1 -> 22.2.2
Date: Mon,  8 Aug 2022 08:42:02 +0200
Message-Id: <20220808064237.3975347-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:42:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169033

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-pip_22.2.1.bb => python3-pip_22.2.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_22.2.1.bb => python3-pip_22.2.2.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip_22.2.1.bb b/meta/recipes-devtools/python/python3-pip_22.2.2.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_22.2.1.bb
rename to meta/recipes-devtools/python/python3-pip_22.2.2.bb
index 39349b6026..9ef6d51cf5 100644
--- a/meta/recipes-devtools/python/python3-pip_22.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.2.2.bb
@@ -35,7 +35,7 @@ inherit pypi python_setuptools_build_meta
 SRC_URI += "file://no_shebang_mangling.patch"
 SRC_URI += "file://reproducible.patch"
 
-SRC_URI[sha256sum] = "50516e47a2b79e77446f0d05649f0d53772c192571486236b1905492bfc24bac"
+SRC_URI[sha256sum] = "3fd1929db052f056d7a998439176d3333fa1b3f6c1ad881de1885c0717608a4b"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.30.2


