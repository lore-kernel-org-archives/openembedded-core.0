Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4919C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:49:19 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.1314.1693417754913990171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yThEE6em;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68c3b9f83f4so3522131b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417754; x=1694022554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DtqIbmVebZ5aPV56o4QD+yhAHZCqwESD27hmnRiorx8=;
        b=yThEE6embefnQ075BIYrDG5eiKs3AaB1UJLLjddwWb2C5TuYxWWIFX3SMBVtICMD//
         nPMkrbB6Rmz0eMJDkxy8bfck3b461dOOL6l9xbbKU4Yev9WoApLdAFs3Y6CsIk03jsQj
         YdhYcYgAuLP9yPnp614hVQWImYvaZSH07ZhaDefxZwApDYeqGSgiQJpx5QXc0Q534/H/
         fnn9ZSMDzrZYxqI5jZvsCi5ty6tHanSCUnxVY/PyB3+vMH6/bU0m+Geg6L6U1O9c4LMQ
         xoDjgH3UatUIXPrCpHqyJMKrSG74ptKq4ZsrJfI7E/UkdMdZw8f2tgHGvDpPQInyZc1j
         9Jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417754; x=1694022554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtqIbmVebZ5aPV56o4QD+yhAHZCqwESD27hmnRiorx8=;
        b=Tg4K7vKKuT2913/4nR2oyDbOc8uvxHHbqYqNkxYav12SdgsVIWloWI86DrkVbV6kbC
         kW/gKtB442lGm1j88QfOVh93gu4QL1axXwpsu1ClYoK4Quha7No3dIpDOY7QpVxEOgw2
         ObgXa8xs+YFHM4VwPsQ8GbkV2oWLrpbzV2qHh2e5t3wFpwZZHHkPIB6aYiT2cFoYfGdf
         /30fl3cUZvzQ7jKqYgimGoOs10pzzKfAHHEFfVb2SLjnJnWVheISOVigQiWVEhhoQ640
         7mbEVT6wl/LChp4lGOLhx379RdUvEcM0tz2TKEVqaBZSEbRTOX9aJ5br9mSyzdTsrrnk
         b2OQ==
X-Gm-Message-State: AOJu0YzJfxgHNQTfqHsBN99BpYv543yD3Y37WcIBhZans81o2sOIIiHe
	Dgnd1LBtQGLdFYRqiwR4u68zrRRoE+W/L4kbq64=
X-Google-Smtp-Source: AGHT+IFppC9++Jj1P/IyC/+aZlAu+rorI/r3ROTr2ozCmh85GJ0Dwe9T9pS9OGbKds7NvK2gWzyabQ==
X-Received: by 2002:a05:6a20:7348:b0:149:2149:9491 with SMTP id v8-20020a056a20734800b0014921499491mr3138681pzc.43.1693417754090;
        Wed, 30 Aug 2023 10:49:14 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.49.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:49:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 20/20] vim: update obsolete comment
Date: Wed, 30 Aug 2023 07:48:24 -1000
Message-Id: <981fa51afe040550c7c351fff028553d4bbbd1ca.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693417541.git.steve@sakoman.com>
References: <cover.1693417541.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186922

From: Etienne Cordonnier <ecordonnier@snap.com>

vim 8.3 has been out for a long time, so this comment is obsolete.
However we still need UPSTREAM_VERSION_UNKNOWN, since we ignore
the last digit of the upstream version number.

Test result:
$ devtool check-upgrade-status vim
  ...
  INFO: vim                       9.0.1592        UNKNOWN         Tom Rini <trini@konsulko.com> c0370529c027abc5b1698d53fcfb8c02a0c515da

(From OE-Core rev: 65f5de85c3f488136d1ec2b1f7fe8d8426d6c5b3)

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 868a19357841470eb55fb7f1c4ab1af09dea99ed)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 33ae0d8079..83ab9ea5de 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -22,11 +22,10 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
 PV .= ".1592"
 SRCREV = "29b4c513b11deb37f0e0538df53d195f602fa42c"
 
-# Remove when 8.3 is out
-UPSTREAM_VERSION_UNKNOWN = "1"
-
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
+# Ignore that the upstream version .z in x.y.z is always newer
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


