Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E36C61D97
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:37 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.46723.1674657751581814107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:42:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=dTya12Ef;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id 144so558729pfv.11
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DBmGOtLfYdQvl6sEqJzGwC7u2QsE1XnHAupM+oGygMQ=;
        b=dTya12Efw7vbCXCd1PdwKI6kIKYrr9uCcBRnFQiknsDlY3kJ1ko9tHS6rIWCVKzmod
         ULfBPPBV64i60F0S+zxWYWhviXLPuYfZ9hq/qKx0lpESjpJMAH+XzTicZKdaoJiXyBoL
         WBs0U0aDuJWHNT7EvXvtQ8hT1LZ0LmWlrbMIiQ0HXWpbtBjuGV1WBK8+yhdARTDkPFux
         KvewFVeGlGaN3XtRZF2f0pJfsrtP5ptt28vNe4f47LLMiN+5P75fZBI7LeUXB2idDjtl
         PSPcB9ZRkom89PtOHtZrqfxhGK890+7HSN7x4C7pVaxL3P5FhZRmEvgaQv8AZSxbwyq4
         lrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBmGOtLfYdQvl6sEqJzGwC7u2QsE1XnHAupM+oGygMQ=;
        b=zTdAJXLAkIj7by6inV0Jwv+dPBH0n+fikkxGJxD7hZPXx2xwQ0rLBHpqh+DemsByaY
         ngfDGRF183phYcJ4zvEEb68jvnk7GdhP7wQBgnohD9xrVLxxcwzSenRcEFNo+W1FF264
         KV1ifQ9Fge7kGJQjDUEWir9ORKuWN35yLyAA+lVoXPa1NAja2Ta3XOVIAq7HPx5kokCj
         DUt8rLAdiRj/C5poRuUHxxnJFZfFbBeLGYz46NZd5QTXhjVZhOn9UJKCkDTlDU7YQHaS
         POzRXzi0/y6yMSXRe7nPF7H7Dg2gF5Rn7tc3zhhMi8TPfGjkxFi6q14u+PynDjby6BUu
         wKlA==
X-Gm-Message-State: AFqh2koyzO4yEzdTY61RZWZVPcRgKoYmW9zJ2vMZWny0oiVjTEv+9Y84
	EdNKgIW8ofrqCaaHZJ94RV2A+1G2taBr31GYlW0=
X-Google-Smtp-Source: AMrXdXt4O4YecNuhAuZ57XkgrS2jXaBucSvmQzZYupH+274COuNpayGA3Mzsa3MlHiUvmDLbMJUH4g==
X-Received: by 2002:a05:6a00:181f:b0:58b:d244:b525 with SMTP id y31-20020a056a00181f00b0058bd244b525mr46605124pfa.17.1674657750440;
        Wed, 25 Jan 2023 06:42:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b005810c4286d6sm3723703pfn.0.2023.01.25.06.42.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:42:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/16] vim: upgrade 9.0.0947 -> 9.0.1211
Date: Wed, 25 Jan 2023 04:41:54 -1000
Message-Id: <2ae1a6f8fcf02ede94b4f8ae696b6015e2be513c.1674657501.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674657501.git.steve@sakoman.com>
References: <cover.1674657501.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176362

From: Randy MacLeod <randy.macleod@windriver.com>

Includes fixes for:
   https://nvd.nist.gov/vuln/detail/CVE-2023-0049
   https://nvd.nist.gov/vuln/detail/CVE-2023-0051
   https://nvd.nist.gov/vuln/detail/CVE-2023-0054
   https://nvd.nist.gov/vuln/detail/CVE-2023-0288

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1c51068c78d12ee02789a6dbecf5e7e91d141af5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 1e5ef1c811..46250c0d37 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0947"
-SRCREV = "cc762a48d42b579fb7bdec2c614636b830342dd5"
+PV .= ".1211"
+SRCREV = "f7d1c6e1884c76680980571f1cf15e0928d247b5"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


