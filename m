Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC75C83F33
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 08:48:02 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.43821.1693817280919786523
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 01:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QV5HhcjH;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: bbara93@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bcbfb3705dso17491871fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 01:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693817279; x=1694422079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TWj/j5lv7mPFffi6sPNbnwvGRzJEAR2/3IBgjIzpXNo=;
        b=QV5HhcjHdvnJ6EQeCP4f77Ud1BqcooteebG7ugNW0CzbOiMTv+aRO9OW9S3U9Yi1f9
         Hza4YsMeArv06NgPzAWoOUgVSPCz4GuRQ/8vOsD1v3dOYS0AkSPRwcVeHbXrhmMNjj7A
         PzOX2ZDdAjK5w9v6uUoDjNzPr4uot1QihccELAII/VuFZlWmtDg3luaXYb4w5ecAcbqG
         yBJsAfU1b7ZCjL28/11rOe1E2hw9TfhtAv6X/9fXtK6UlP9g8gU94VDQu8g0fDMBUsIA
         DB4dDv/+YDQEiuH1h0VuUDa/2fB6b4+z/IwE6EpE3T8lsnlv/gXgY/z/12Pqfp4B69jL
         BYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693817279; x=1694422079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWj/j5lv7mPFffi6sPNbnwvGRzJEAR2/3IBgjIzpXNo=;
        b=HmLJrAE9WEx0iVhnLytvZqrW4mSGcbTHWvDQIeNZ7PxWteaB40/eZ6pBn4r43yovzm
         nVB2KMHZYr6vEPy/MBMhx4doobkqbkmPu6+8zkCRN7VWllieKANoUMmikuqb6R0f0+VN
         vtq1MG2661qjfoVMMtFAULwEyKadPhNZXqX0eEVuGGGf15d7nPS+BDV1G3+0Zi82z21T
         bX+hIvkUZQ1gjTn8ta9x0QPsbDgMKP6KVH4yYVFv6zH3cEEgmU1dDqY0Fb0ecLSGzi+d
         IkrcOmVn/6mL9K0FsQdVNPRHbA5nD3rRj2ja2HFXulr7GTydTXz0Nr4cU8f9WHjXFS2s
         /pkg==
X-Gm-Message-State: AOJu0YyJBWj1AMrBUfz0P04UU0qQjp1FRk7jbMrE0eJyKaLwuc275QJ7
	9F2Ho5Im3vzfdrKceUo+BQQ2rpukN9fhLA==
X-Google-Smtp-Source: AGHT+IHiIx6dN+Axpn4IYOnMVWtD0SXvKf0Qci3bzqqNZWZa5Zuplds4rOlUo79Y+ieAgme89nz9TQ==
X-Received: by 2002:a2e:701a:0:b0:2bc:d5f1:b9cf with SMTP id l26-20020a2e701a000000b002bcd5f1b9cfmr6305628ljc.27.1693817278573;
        Mon, 04 Sep 2023 01:47:58 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id a14-20020a05600c224e00b003fbe4cecc3bsm16446058wmm.16.2023.09.04.01.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 01:47:58 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Benjamin Bara <benjamin.bara@skidata.com>
Subject: [PATCH] README: fix mail address in git example command
Date: Mon,  4 Sep 2023 10:47:37 +0200
Message-Id: <20230904084737.4135067-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 08:48:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187164

From: Benjamin Bara <benjamin.bara@skidata.com>

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 README.OE-Core.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.OE-Core.md b/README.OE-Core.md
index 31b1bf52b4..687c58e410 100644
--- a/README.OE-Core.md
+++ b/README.OE-Core.md
@@ -22,7 +22,7 @@ for full details on how to submit changes.
 As a quick guide, patches should be sent to openembedded-core@lists.openembedded.org
 The git command to do that would be:
 
-     git send-email -M -1 --to openembedded-corel@lists.openembedded.org
+     git send-email -M -1 --to openembedded-core@lists.openembedded.org
 
 Mailing list:
 
-- 
2.34.1


