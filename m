Return-Path: <git@andred.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F727CD80AD
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 11:30:47 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.88656.1696937439611407160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 04:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: andre.draszik@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40572aeb6d0so52236095e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 04:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696937438; x=1697542238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EKxHonlwNj1NdME4rW9SznjGf//Fnh5Q1c6RvNxfC38=;
        b=nd3r54V7LVGJBeKv8ViSWINuu2oh7Xmg4IRpP+VWtZT8ezMsU5Ogk3VVR6Kp25sx1b
         V2zuEO401Q/RRmvZF2fKdgZiig3ZOO0rJldalIkKlUqYwk7+eOhUFgUvdn3BGmgz5mQ/
         /dCGboavDlB+kLRMEFmD5c181EeDdaqZvrDWLvCI98mHAIrSHyKgYQIxGGBJbQQsoGc/
         Sxb5E+xhrTdy2lpKGd4G+/9iGJs2mw+L0XaAbWb4ZTbJtC2ckRw7bnAfoip7O5fpHFHD
         Ux0FN5EJEY5cST2DPw4rMk0g3Sumh2T7QqaNXTQcIdD3gdtdaF7/Hjw99aahSV038/Te
         XRVg==
X-Gm-Message-State: AOJu0YyWyNGeOkeBAifJY5hqkVVVDYBHi81zC9XAFNZmYBDAi1v0pccp
	9wHUDu8FN8NkJ66CvFMBYm2ZctTAp0+ORA==
X-Google-Smtp-Source: AGHT+IEKOQMTEugMrKKUJfhvhQ2oyrow3jC9+1SYLH+9KZWr+la1ee8oMTUPmWy5ncoD1R2Tc9avLA==
X-Received: by 2002:a7b:ce8a:0:b0:405:4776:735a with SMTP id q10-20020a7bce8a000000b004054776735amr16555713wmj.2.1696937437772;
        Tue, 10 Oct 2023 04:30:37 -0700 (PDT)
Received: from salami.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c021100b003feae747ff2sm16169371wmi.35.2023.10.10.04.30.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 04:30:37 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] wic: fix a typo in help output
Date: Tue, 10 Oct 2023 12:30:31 +0100
Message-Id: <20231010113031.376044-1-git@andred.net>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 11:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188880

Signed-off-by: André Draszik <git@andred.net>
---
 scripts/lib/wic/help.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 73e3380cde17..163535e4318f 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -1118,7 +1118,7 @@ COMMAND:
 TOPIC:
     overview  - Presents an overall overview of Wic
     plugins   - Presents an overview and API for Wic plugins
-    kickstart - Presents a Wic kicstart file reference
+    kickstart - Presents a Wic kickstart file reference
 
 
 Examples:
-- 
2.40.1


