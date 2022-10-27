Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593AAFA3742
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 02:37:16 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.2163.1666838227897564736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 19:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ODSrd7HV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id e4so120835pfl.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 19:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1M/GWkUC5QtHUJgh7GTn9ek2fnlh/A2twkoMk8X4+4=;
        b=ODSrd7HVCR9dnXp+kq5mpYOtlwhvL7v5zaBWV5KLT8ZgGLjdxDEdCQDP4E6pGtucQU
         2qKsovT9nrPTIUnyWP423hJhAtI27LN3W9KOel1FxarSYnYh91QN8no4pC21lvMGsJJ4
         D1fvNt7nooG+E0Yd7aU/oqTtsMcxjxkluHg6h+w2GJRq5+bwixFjnXog5MqVpIf7Zf1O
         fDpGl0O5tRhD4guB2k72m53LHIlcyjYn+hMGQEWDCu4RPdHVGDgjFJT7LdfM0JsNbQ4N
         efD3AgzOxI5Z/glC+JqVw0/bs4dURCkpL8dWG6xFPxX0LbJDEYtR30J6VRHZbF7yaUwM
         /15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1M/GWkUC5QtHUJgh7GTn9ek2fnlh/A2twkoMk8X4+4=;
        b=TdWDiSM0Ajgg5BeR+R1dTnZ9OvfWsMKZ46VtCUlS+tmDm7EsCfHWGMZPC5NiNzThhp
         pOW2tOSLwKVCBd+VKwhBIzOKO4Vc9ljblJ3CmhkDG7u82f4JZ8FtjEsfvcBUB7lC0kMO
         dUY1d23u2YDo1h8EMAh+EfHa0cjCNTW4U7ccgMM1XUjxS99vnqRHjB+L0FMEAfchPPQ2
         xa3JoirmwVhPQRjcDkWJb0U72Bjgz0fluQnuvRZPfT8iuWD5nZbRM+ii+Ze4RP4oplqu
         ojPWecQTsN5NVx1UKXIlkhYEI3tejF+w3je6nWiyACRkB1AidAyFDvw+KC/3mxO3JmM9
         nGIQ==
X-Gm-Message-State: ACrzQf0gjAhtglclBh8TVXe9WxvyV78AJYpAmtkRFj/BSnIC8RcSbCxj
	U668aNvjbYJs6RbRrM5wHYpG5LH1g5p5fM31
X-Google-Smtp-Source: AMsMyM7fY92gJDZ0TEWPLAy6nKontaCwsc4WtsGIbflJFtEW60sdIGpsTX0ka2T6WMHZs9GmuAjHNw==
X-Received: by 2002:a05:6a00:1306:b0:555:6d3f:11ed with SMTP id j6-20020a056a00130600b005556d3f11edmr47124654pfu.55.1666838226978;
        Wed, 26 Oct 2022 19:37:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b1-20020a62cf01000000b0056246403534sm81088pfg.88.2022.10.26.19.37.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 19:37:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/8] binutils: stable 2.38 branch updates
Date: Wed, 26 Oct 2022 16:36:36 -1000
Message-Id: <3ea33ca1a83d8621f1feee78f2c63850c1bc73e3.1666825041.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666825041.git.steve@sakoman.com>
References: <cover.1666825041.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 02:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172182

From: Yash Shinde <yashinde145@gmail.com>

Below commits on binutils-2.38 stable branch are updated.
dc2474e7d20 (HEAD -> binutils-2_38-branch, origin/binutils-2_38-branch) elf: Reset alignment for each PT_LOAD segment
f184ba116ed Re: PowerPC64 pcrel got relocs against local symbols
737e29d05eb PowerPC64 pcrel got relocs against local symbols

Signed-off-by: Yash Shinde <yashinde145@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils-2.38.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 8259ec3232..c1904768dc 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -18,7 +18,7 @@ SRCBRANCH ?= "binutils-2_38-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "5c0b4ee406035917d0e50aa138194fab57ae6bf8"
+SRCREV ?= "dc2474e7d204c124ab5a21b4490aa46eb7e1d4c3"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.25.1


