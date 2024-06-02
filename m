Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEC6C25B74
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 12:30:59 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.57666.1717331457119869805
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 05:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SVHfLdvZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4212a3e82b6so15078415e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 05:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717331455; x=1717936255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2kL5/ODQnu+tRWfyOkU1ImleTtaEGpHJTWxCchZoDWA=;
        b=SVHfLdvZ85KYUqpfMMumOGyj90X0YWZt31Y/0+wXUDW6CNmA1EoXc4queqthvJUix0
         Xbtiv+9qqJWDICsSWpkYg7srMLUrwsLf32RA1x2z0mA33d0xB/fXfpEA5vJpo562kjaD
         9OHUU+IPwiejuF2n5EfdmO8kuMjApT0ZXGXWz+9kVieuaS+qTBOYIDZWiqP9ua1tjE8S
         DpfGdEubPuANNxdFQjHcnI9t1CChblG91YiHwSKKHbBhffFkRJ2gSCFsqTQdP0zMhhmX
         6Yjws0W98GH499zvs7gfQYK89ryjn77XfbEayV9q0nroOmZh9adTG7xzDByOZx+fexTL
         774A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717331455; x=1717936255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kL5/ODQnu+tRWfyOkU1ImleTtaEGpHJTWxCchZoDWA=;
        b=evu+cTPJEnx/C/9gvGmvaYGBU/AlT3tGbti/lmK5dEa7DWWMuw+nrxtsliKGXUuFl9
         rXNT7HBz5oQFzNEKH0w1ntTi168iDOUINlRVlTtRjjBWjZ0iVEtJWRm/BPJXBJWYpTrb
         N18TCNzh+qNJ++w6mrK69IkB24n+tbJTnvOWcq1mUMUXP3AQcGec52BV8nbKSlVUUxCg
         THv29iPYE4M2tesG+ToNOLlwTDyeJ1agKDIVY0zy/P6mkLmUF7FVZ3bkOjccjwXW3v2/
         cX0+ledJyh42iyLAlBToyVlLDEcy/OHYlYgQLm5us9eXzymXKBCcdHgQ5zlNIieAYd3g
         Oclg==
X-Gm-Message-State: AOJu0YwYZqgEB7cd1Nyg+v3spNDmjUFJ3cmzE0H8RcmhX+IF96LslrjV
	6WvG3rL5yZ9hzddsJx7xZqYnRjWaddSrP+Zo4MLVTn+KTaGRatAHAHV0Bw==
X-Google-Smtp-Source: AGHT+IEZu3iOoaAMUDc+HsApN+GsBweMm+ERQj7wsWSxYe9mAcz8pTzSE0fdlQ6idED8i1ZnYEX0tw==
X-Received: by 2002:adf:f2cf:0:b0:359:f17c:134f with SMTP id ffacd0b85a97d-35dc7ec9840mr7601229f8f.32.1717331454983;
        Sun, 02 Jun 2024 05:30:54 -0700 (PDT)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be. [78.20.160.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd066eb35sm6050521f8f.115.2024.06.02.05.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 05:30:54 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH] python3-pygments: added rdepends
Date: Sun,  2 Jun 2024 14:28:49 +0200
Message-Id: <20240602122849.254064-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 12:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200206

python3-compression to have zipfile
python3-unixadmin to have getpass

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta/recipes-devtools/python/python3-pygments_2.18.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.18.0.bb b/meta/recipes-devtools/python/python3-pygments_2.18.0.bb
index fd37365681..8058372498 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.18.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.18.0.bb
@@ -10,5 +10,10 @@ SRC_URI[sha256sum] = "786ff802f32e91311bff3889f6e9a86e81505fe99f2735bb6d60ae0c50
 UPSTREAM_CHECK_PYPI_PACKAGE = "Pygments"
 inherit pypi
 
+RDEPENDS:${PN} += "\
+    python3-compression \
+    python3-unixadmin \
+"
+
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.39.2


