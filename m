Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE9CC3DA64
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 15:53:19 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.46419.1722441195112658090
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 08:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hfEi8OD/;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fc4fcbb131so52532345ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 08:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722441194; x=1723045994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xl3HdVBzftWzJbtIp8Qz7OTij4FZCZUuZ+nXV9OlZbk=;
        b=hfEi8OD/2P6t7OM35U9Wz/1n2EHSwS1k6f7UsRqF0bsfq71Ro9Lyh1AwKCWtUeuhtT
         QEc+FUyfe1Ew2yO2H2YZIoHdawiZlsY1WqfvkSg/jCZZ2BhXRa1lcNU1XNSs2oR1vcha
         1COgirdDuECQQY0sq2YvqjI9r2wpjT2MMFYWi+B5ooPGcm/vNuU0k3rQ7j9Fx1ux4aw4
         kKAQX9t83dYUMifwt2kq5jveCg5upI6IvUzFTDCRlY4wR9BjLClaQHS4MK0KDfTURNTq
         bc6jyzxJqMS2lCFG/wC0gVfZ3ZUNDHzk0xtjRTSQ/xDU0o4zm9o8WsxQJVBhtUcu2q5X
         NdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722441194; x=1723045994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xl3HdVBzftWzJbtIp8Qz7OTij4FZCZUuZ+nXV9OlZbk=;
        b=nDI9+KLQqQ0l9EaPoGpxhiYA7mtyyx301RSI7PdboEUUdXD/HS7lZxop+PStKz49IY
         u2ohH4Zv08LNEb66NOC+LwVCPQHkwneiIzXTm/C73UpitJaQNR/H+4Gz+Hc/SvUFgxhZ
         HLUMBN+pCnQa+RObJywudgUbhwe2gRUWSs5spzIEWtuY679nRWkzfs/HSbEl8P3wyjUp
         FnfDlZneQTvX6E4z2KwIQfjzvY32g7TWem2qabOIBGBgnfyb5mCB4KbJQN2zp5mPxx1V
         RHkE6CEPripAAyhqyhCVTY9F0OTDz8GdkKtjd6XbruavbwGcD4CVJpK1k98IG9NNZTqU
         Dp/w==
X-Gm-Message-State: AOJu0YzpLdQ7lNY4cznTFOgFBozU90w/8nef8hDb/lBhadC5ebonIY27
	3m8vc5IYnmKUdQQ3jIgjmBy31CwUllCG9TsjVtrG0Vyr9V+cHLrmXMnHjC53
X-Google-Smtp-Source: AGHT+IGVqaw0/qp2PYRxRCyuF/K1+pTPMn/l1j05OkMqFZZP8o8OP9hQXj/kjG+iGKQ75iEzRDQ0tw==
X-Received: by 2002:a17:902:c40e:b0:1fd:69e0:a8e5 with SMTP id d9443c01a7336-1ff048d4cb2mr177966355ad.41.1722441194097;
        Wed, 31 Jul 2024 08:53:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5aec])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fb67e4sm121643385ad.265.2024.07.31.08.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:53:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libyaml: Change CVE status to wontfix
Date: Wed, 31 Jul 2024 08:53:11 -0700
Message-ID: <20240731155311.1682989-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 15:53:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202716

This has not yet been disputed officially

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index 2d6f27af1fc..2154910d0ca 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -18,6 +18,6 @@ inherit autotools
 DISABLE_STATIC:class-nativesdk = ""
 DISABLE_STATIC:class-native = ""
 
-CVE_STATUS[CVE-2024-35328] = "disputed: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302"
+CVE_STATUS[CVE-2024-35328] = "wontfix: Upstream thinks there is no working code that is exploitable - https://github.com/yaml/libyaml/issues/302"
 
 BBCLASSEXTEND = "native nativesdk"

