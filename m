Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2E2C25B4E
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:11:50 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.82166.1674238294940872625
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:11:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lP6rvsmB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id s3so4558585pfd.12
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJLh7qxLPoyGnlcWXDK79WXgvLQAm7GaNrdRYLuyZFM=;
        b=lP6rvsmBe++61OYmTY7x8v+615UNXXqeYvmiVIkfRbAr9GFQe/9FyUwEvgmcfIRuMV
         0IJSwMkW939FJCT49UvRR0le4t1rzXv0SS/XtX4nQnyaPVliLb1IBV8RGxSPArJlSkf2
         p4bizZLQcjmW4JRvbNkcqYZOf58SffGUDfg5uBuU6Yb0QHTEELLtNtOOCK4U2RL+RaLD
         bI4Q6nmSZoS2b4YG3eTNen7SMrXMXkdiRxi1hoCuYDhNuHEmDCt3/TnnOe3/ARvCX8Vg
         3H5L+tScwPcZvw+4U0jyObXxgTeaNTQU9m+bdyq0S4+2c0lOGfFJCQqEod3KWFZfrSvR
         2WCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJLh7qxLPoyGnlcWXDK79WXgvLQAm7GaNrdRYLuyZFM=;
        b=IsFO34hGldcgaDFqcxHEL+MJmhsRj4GJ9FdYxRGpoaXfgnBdnxcwszVDmGrjPJsdAF
         4C9i8/+W/UlQYc1cNOmAQHSFAbhWDg1xEamd44GqDB+bcDlWRCO86bvV6CgPM5buM1ap
         +oT+qJY4yJxmqPRIj7YnTeL5GrNFEuJHo/umBhVl9fkI5PE/I77gFB9+qRtqrupREG/g
         mbujfbiNE5UF3IrO3hgRkUO3iRSsUYbjymvzrHP5iDK1azJLXMx5ia6mcvKGkOq0Xa63
         kAGnCqRRXm25llaSj/ilNZGJ7HpfAA10vINwQePjXUiwqICWDub1VdQdYVDmCsiWbsLt
         Es8Q==
X-Gm-Message-State: AFqh2kqW7byfyZ/dRXL/yuSIm0WJ/SOKvIrkEOdedN17XsSvgI8T+3Vs
	dElTV5PoNQKcFA0e6XeRRrCiqHvCLkVAEE9g8CA=
X-Google-Smtp-Source: AMrXdXtF5IWvUDQ4P3EVyu9q/4u8VYGhPQfz674xRQZRVUL1X8CS1mfA4t31PI9OHj0JIlcxxCNKFQ==
X-Received: by 2002:aa7:91c1:0:b0:58a:fddd:9b1d with SMTP id z1-20020aa791c1000000b0058afddd9b1dmr15455963pfa.10.1674238304636;
        Fri, 20 Jan 2023 10:11:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.11.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:11:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 22/41] bitbake-layers: fix a typo
Date: Fri, 20 Jan 2023 08:10:39 -1000
Message-Id: <adee6183096c15b1743ae3e33ebbbbe6218a668f.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176229

From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>

Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fab3aa7b1b7003bb03678c5cfc62ad2b597f0932)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/bblayers/makesetup.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
index 22f89d81a4..834e9338bc 100644
--- a/meta/lib/bblayers/makesetup.py
+++ b/meta/lib/bblayers/makesetup.py
@@ -46,7 +46,7 @@ class MakeSetupPlugin(LayerPlugin):
         return describe.strip()
 
     def make_repo_config(self, destdir):
-        """ This is a helper function for the writer plugins that discovers currently confugured layers.
+        """ This is a helper function for the writer plugins that discovers currently configured layers.
         The writers do not have to use it, but it can save a bit of work and avoid duplicated code, hence it is
         available here. """
         repos = {}
-- 
2.25.1


