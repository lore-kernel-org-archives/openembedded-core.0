Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D521BC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 18:01:25 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web09.595.1657908085153691120
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 11:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jS/+4uv4;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id y4so7279653edc.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 11:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WuFMlqTz29bJkhB/ce7aCPNkxCVnfbk+/XuGiIEj2TM=;
        b=jS/+4uv4bHgxe708WbDxizHfdUe9AhV4ZvyBLCreIFzXRLflxHWLFsDqbYJEGHeEo9
         vxvFUJaW3QatTdmTku5BendUNa8kknXocxhzTuBnvwBvQqdDoKf/Uy2ZVw+DkVFDCpEb
         KtTM9+1MOp8n3Y2x5BUiutlv528UI205bVArO0b5FsuuZ6R/lvVfcb/GW18EZCwAKcgs
         Zsc76WER5JchdU0dnwfM1YBqQGWiKS47Wak8Xn+Uc9mRdvEli03J6EIzJdNjqVcwsmYW
         05H4WpZ33tghx4j4XEprOcgAa71a5+Bb74WkkfPGhe2sD4T3O9kvTa5buFz9AoPDhR/L
         61eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WuFMlqTz29bJkhB/ce7aCPNkxCVnfbk+/XuGiIEj2TM=;
        b=SKFvBO3gwkX8NaI8oj2yHQeBZOKBkp3nSvVsmymk+DTIYZHnQdbSeUMy3sgeNkjIDQ
         8XaI1DjoFoUVQhW1IE5NuledoTNVwBJ0ctFDiaOK1BCm+mu6lQ7qt5RvmqFQjgvZmZh1
         8nnfBmQVpg4Z818B5Pc3GcH6Hd6s4R3tqB3R281NgS2iAZbIEQi6X1n+DP1mDPT8tVBc
         zVXhQ74M5NK9tjoOTgOBdymcuEMZhYU2DqRA18iJDys0Nd/a6wCx+uzxTBGL9h9W6q05
         XAqCijgW91EdQfJIVEFhVAiQjDLNnd1AW1OZaivj9DY23Z/NeKyrl43OxRyz+GljSH+G
         qqAA==
X-Gm-Message-State: AJIora+rZXTF5MiIXbhzv7E2HqyyOE6BUVzpirtCwwJxzzVYXMSTvlqh
	z5jon5qDh6EFjQfDzdzgXu0fwu5dlKKEbg==
X-Google-Smtp-Source: 
 AGRyM1vf8mweCRG90ITsChk9lmOKYkUVV6HmpP+sqe73dxyZXPOZ5rrb7IvlgwKtja64TwNYQhjveQ==
X-Received: by 2002:a05:6402:3785:b0:435:5d0e:2a2e with SMTP id
 et5-20020a056402378500b004355d0e2a2emr21130898edb.307.1657908083502;
        Fri, 15 Jul 2022 11:01:23 -0700 (PDT)
Received: from fedora.fritz.box ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id
 g3-20020a170906538300b0072b14836087sm2254429ejo.103.2022.07.15.11.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 11:01:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] conf/local.conf.sample: mention site.conf.sample as well
Date: Fri, 15 Jul 2022 20:01:04 +0200
Message-Id: <20220715180104.6737-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 18:01:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168136

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/local.conf.sample | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 589ee32665..f6be0a59d1 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -5,7 +5,8 @@
 # be set in this file. More adventurous users can look at
 # local.conf.sample.extended which contains other examples of configuration which
 # can be placed in this file but new users likely won't need any of them
-# initially.
+# initially. There's also site.conf.sample which contains examples of site specific
+# information such as proxy server addresses.
 #
 # Lines starting with the '#' character are commented out and in some cases the
 # default values are provided as comments to show people example syntax. Enabling
-- 
2.36.1


