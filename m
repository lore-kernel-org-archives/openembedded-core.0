Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE28EE49B0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:36:27 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.13059.1692801384985329163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=qj5aLIiF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bdc243d62bso37344115ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801384; x=1693406184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IBLIhhmfXWbvhaCr/AO3neQBKvyfl1S0aVraElfUfZo=;
        b=qj5aLIiFG/XMj6/Fj+t9sQaZSE1N19REfSDH4/G98PAIT0VbJKXc1mkHlQezrRcq0O
         Y62xqXGe4Gr7bOCULciHQVrfGIb10FFQSYS9uZVfo5OY2vh/6qiK59h6z2z8k4ptKHVM
         F6Uq7nxPux//9lVmVWx3IMwnkqa2zGx2noSMdg+QPzeps033lNI6QThBxNeO/zFtgxGm
         xWowhR90KgJUROls5wRmoQBNE4Lqvhe9YbeHJAnQew/R9+VCE0zrH/0BpVSR0/r5a7gY
         dl0i2VHpeBDMXMQSWjyZ8C8wUJcnTeFDDY5/x+5CwGN0P0TRghy4NszIdIzgckOXebGW
         sNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801384; x=1693406184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBLIhhmfXWbvhaCr/AO3neQBKvyfl1S0aVraElfUfZo=;
        b=eP/DkSh4gNeKC+ltTYsJKcKOj8L6dvUz2s9B011e2g6SxkKWJzzpjP965DEwktTXHM
         aAE4Dk9Z+dmKPm992BQ47q5/YBh3quPzE/oKVnQQXuqP2QJt2zA4iRGQLLsqpexA2scB
         AuUcRdg2fYSUZo+osEgg0WqX0NJRxx6V+wTzq95f4ylHPPh9qhUDzmi0H2Us/TDRpHY+
         VUbPsnk97u+mnNjJnkgREQFfHmkWn00Gxq/hWz82ooyjC1wwKu71FnMkUMgVm3boMb4E
         mZ9cq2LkEhxELl8V/sg0y++u3lnVwArtgOGHbQ8qXCbvn+iN7SG3ktLHvWMds6CA0b2u
         mUQg==
X-Gm-Message-State: AOJu0Yy0cSGuT9WQYw/rXisaAkSNylq4uu1BbyVG2xJItiA45iuPQ+Ff
	6kPZWNkgAJPhjZYN4gSRyQqjLurCi6eduffSXu4=
X-Google-Smtp-Source: AGHT+IGoHe/AbDA2PHlv6Kg3XaARtbzvs/ojRm0U7eKlCuL+au8vtJr7xCrt3iqKn0uxEDS+sTHG0A==
X-Received: by 2002:a17:903:2309:b0:1b9:f97a:16ab with SMTP id d9-20020a170903230900b001b9f97a16abmr11659897plh.57.1692801384109;
        Wed, 23 Aug 2023 07:36:24 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/36] librsvg: 2.52.7 -> 2.52.10
Date: Wed, 23 Aug 2023 04:35:34 -1000
Message-Id: <2ac80e25d85a4dba62813e28525a00f13922fd4b.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186585

From: Chee Yang Lee <chee.yang.lee@intel.com>

upgrade include fix for CVE-2023-38633

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../librsvg/{librsvg_2.52.7.bb => librsvg_2.52.10.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.52.7.bb => librsvg_2.52.10.bb} (96%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.7.bb b/meta/recipes-gnome/librsvg/librsvg_2.52.10.bb
similarity index 96%
rename from meta/recipes-gnome/librsvg/librsvg_2.52.7.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.52.10.bb
index 78eb93c635..b79e95a04f 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.7.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.10.bb
@@ -20,7 +20,7 @@ SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.pat
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \
            "
 
-SRC_URI[archive.sha256sum] = "057c1eeeaf85c84e254bdb707459207f5840da5b4d52b4711c03140ed09e6887"
+SRC_URI[archive.sha256sum] = "6292dfcd6a8e1ce1784e0188914546af1633081d1fae9e22f7cb017e7e84ba8f"
 
 # librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces from it 
-- 
2.34.1


