Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 114ACC52D77
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:50 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.82173.1674238307386370032
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=A0dkQCJP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id q9so4744088pgq.5
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1xhLQE0nsT1eqPY+iR7affXdvGwgFgtnJYpg4GNZWA=;
        b=A0dkQCJPcrMJ+TiR6hDjOr7ZyuIUTC/ZVNYZbdh6NRZeQTrml/cZNrhQvz5Tny9OK0
         RHmkqpceZYsO4t6cD+QGpVGi/Cr8als92aBCgO9tBYZYvDuRFIi2QxvUzJ6QIitFz7gy
         3YW0xwH+2cfQ5e81qQzb9pu+QlN2Blqh6iJeexh9iAs2ubz5+jhMx4eZ5jDS8l8t2g+V
         EdepKib6AjlCHcXF5BC+30pdSWpRhvPw+BU1ZAxKyBosxCr4/9y169z1m7DSh6uKyScD
         c1XhUxnYwFca9SH37x8Bs2ghQBpuN+BYdu5o4k8RQ4zsAv0nDZ4TBoMCFk/ByuZPUXCD
         Fxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1xhLQE0nsT1eqPY+iR7affXdvGwgFgtnJYpg4GNZWA=;
        b=JjsnY/9uUrggP0AnJnQICJZQAxBEsuoiZIfiNWPkOq3IuldEZxBvTh+FNIMIx87c1F
         aWyp+BBka9/mge21E+xdaCtDi01DXnmpE37vsJfIRNNeQ4Y32fWMH6OKDKg4rr4Y41NV
         Tt7k9+s016xpANoXZmSEabuuWbb4qaAB8Jvt9wUolbWegThdchnoIgqUvdGKQZJ/nvz+
         rv+CTvaOx9DzbX/MontGcgc2NIvhYGPNdEMNcz7N4J0pfIxDGqeEsnYxatscLFE0WbEn
         iEET8qWbPMjW78kckO+JjHui75hr2ZU9jJvITLVBGcHXV4HtAdnUbR/GSuosMVH/+cux
         l9bw==
X-Gm-Message-State: AFqh2kpRrBqRHC1fHmi4ALguZkXghnqTNmilaHF3xfVVoIlH9wxRR5a6
	ymn+PjvLCyn3KLfMugZng8Jzziip0s8gNWEm1MA=
X-Google-Smtp-Source: AMrXdXsFm+NdpiaVmAPTz0Jsy44cXDnzABFAMb+I9sNsnmuuWiwLG0MrExla2QuSD5lpkW15EffWKw==
X-Received: by 2002:a62:1448:0:b0:58d:9588:890b with SMTP id 69-20020a621448000000b0058d9588890bmr22396900pfu.0.1674238306391;
        Fri, 20 Jan 2023 10:11:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 23/41] classes: image: Set empty weak default IMAGE_LINGUAS
Date: Fri, 20 Jan 2023 08:10:40 -1000
Message-Id: <10cbde44012320f3cd203ff7d36f7594c8b36090.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176230

From: Alex Kiernan <alex.kiernan@gmail.com>

This is already set in default-distrovars.inc and so this assignment
will almost never succeed. Rather than leaving it to confuse, set an
empty weak default.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb402948158659da7de0fbbb1bb403c8dad06e2b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/image.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index e387645503..d4bf02784a 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -182,8 +182,7 @@ python () {
 
 IMAGE_POSTPROCESS_COMMAND ?= ""
 
-# some default locales
-IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
+IMAGE_LINGUAS ??= ""
 
 LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IMAGE_LINGUAS').split()))}"
 
-- 
2.25.1


