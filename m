Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7B4ECAAD1
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 14:40:41 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.26458.1661956833670780496
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=0xbIMV/e;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 n8-20020a17090a73c800b001fd832b54f6so12565857pjk.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 07:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=Ob/DUJpmQn3DTzxyXyDEUm6CgRZLntlXaRCLFNqTQYM=;
        b=0xbIMV/ec1pdgp9EXmjWDkhgUoP08EoxDKFfdPiSOkaLF9fMQcNzQAAG+3of6YMgOX
         dpMoBS3d5XfeJAlSGpmVwuWExCwRkev7Rm3gBnRNK8lthi44ThXEPWxM37uqAzp52l6W
         o4ObIFpyxlc6uEUd+lTSTWK2uWoPikS94D7vUQ2CT462OQTt0uBnYJfSwS8LerRUdKzS
         aJUGFZlz2LEguNpMNvwYNErHm/l+aXoRmEoLhBHVabQvG0PbVJur9n1vf17hu9zFqmx0
         zglpLF9wVtMtvS7bdC+D0AxSmJIoEqEioejsZ484SwJnskBX+FC8KqCXGpAXVM/6+gss
         Fu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=Ob/DUJpmQn3DTzxyXyDEUm6CgRZLntlXaRCLFNqTQYM=;
        b=zCMjYIIZtnxD8btTXFkhbNI2H1EzjEWpKJFsWSbZX26khBxDfVPSxNVopQNcDw3Say
         J1mk4ubQIc46Ei8qqyXsQ/HOFxsGks4or2pJ5vLB6SkdXr4wqtFkPg83mXKeUECuS5bF
         AxwdX58SVmYq+i2wQJz/dGARFssnD0plSamr48zOpu/e+QIsDeffDk/MThcKBHJ8I7nw
         vcNBZy+2qJZmwUfJ3PQNq/qOY4hLbQj4lWboTIEoLttZ1yB/FZfo6Tmr1ITr1MkcewaZ
         /AgJaZYl5okxyMQM73lpudfBuynqrOjXQ6C0ohXRbztqpkVLV8lfdzD2D1IaQpHLrBGh
         4KUQ==
X-Gm-Message-State: ACgBeo1zgra1eknOZn5oqAupAyV1/iyaE5gQD6bEx5VOS1R/T9M1KlSK
	dxpj56ubv4tHupWtJ/SgutIPSdFT/ePQspwk
X-Google-Smtp-Source: 
 AA6agR69MJmRW9y4aVsE1oqo3CrMW8VK9bjv6f0X0C5PZ06o1/B8L0CmPRrDr/c+r0l359PgADXxwg==
X-Received: by 2002:a17:902:ab8d:b0:172:9382:4d1e with SMTP id
 f13-20020a170902ab8d00b0017293824d1emr26352239plr.133.1661956832728;
        Wed, 31 Aug 2022 07:40:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a170902d1c500b00174d715cb76sm6070780plb.2.2022.08.31.07.40.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:40:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/19] gcr: Define _GNU_SOURCE
Date: Wed, 31 Aug 2022 04:39:39 -1000
Message-Id: 
 <ee8e5f60c2f21630400a5095304e5508d4297824.1661956484.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661956484.git.steve@sakoman.com>
References: <cover.1661956484.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 14:40:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170130

From: Khem Raj <raj.khem@gmail.com>

This ensures that definitions of functions e.g. getpass() are correctly
sourced from system headers, since it depends on feature test macros

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d117e5d17c491e1d26aefb4b919410b07fd5347)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/gcr/gcr_3.40.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
index 717c31c325..8719884f25 100644
--- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.40.0.bb
@@ -13,6 +13,8 @@ DEPENDS = "p11-kit glib-2.0 libgcrypt gnupg-native \
 
 CACHED_CONFIGUREVARS += "ac_cv_path_GPG='gpg2'"
 
+CFLAGS += "-D_GNU_SOURCE"
+
 GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
-- 
2.25.1


