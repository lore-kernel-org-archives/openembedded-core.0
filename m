Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2A1C001B0
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 20:11:45 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.62809.1688488107994961286
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 09:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@snap.com header.s=google header.b=PJY/+WVz;
 spf=pass (domain: snapchat.com, ip: 209.85.218.48, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9891c73e0fbso1047692966b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 09:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1688488106; x=1691080106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sihnCgDjtHEW/tfwUX0MBsDjIDYMuFwJPSZt1rhLTH8=;
        b=PJY/+WVzTswnLggjsVv3I3sVkpNaerRFE3hU6k+JakGJ+vZfj1KFJQp2zZF9u1+h0n
         bMXj2MNoyrz/BPorpRPPQKXWSH09P44rORK2SXhHGaUd8OAYjW93bo3RLcWONbinoLp7
         tED1cQt+ygvRuJVLBFEJSDXYUsKOmSu5AFv0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688488106; x=1691080106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sihnCgDjtHEW/tfwUX0MBsDjIDYMuFwJPSZt1rhLTH8=;
        b=CVoH9FPMx9bfYnoqPaiCGkFbvwnhE9zMA0LGv0Hbo7EF8JDjJ5WHtd/STq5fzqCDLc
         JWdMt8QdSUqyTrcWfA5FygYxiHx6qw1l7sbRtrwi55xkXcrlSkYRfxJ6Xst9xtAVp85M
         6JIbnv9Jv2GY36pQOKSF7WlLy1qLGj5Xeb8x4F8XeNHGZM+GBvIKAxG3Fe/1I+Br695M
         vOEDwTbPmwLphcjbo1ua1/SlcFZE0eV+198RY/383TtP028PKSRlSHR+EagagBSDMgAM
         LiIR/XQfMs+YWA+B4eye+hnzGFL4KFIkgilRj7txiGRO2Be0tjvmVJ9iJxbSnhXDyYN1
         OWUg==
X-Gm-Message-State: ABy/qLZnLWz9LpVKMUsQzy0PnQ7qiVpo7NQWA2G8MPoXOjGlZLuhEatE
	wHcUmK+yeyVoDz1GUyOzAiKw8WDt9yiPG0OlwyVenw==
X-Google-Smtp-Source: APBJJlHC+tOOsDdgqyccwsyB/7swBwxl3WbCqrtFLrIGehlO0CCLt5/sOvXmJ1haRkUG81Cx8H0r7w==
X-Received: by 2002:a17:906:10dc:b0:992:2f67:cd34 with SMTP id v28-20020a17090610dc00b009922f67cd34mr16506680ejv.22.1688488106082;
        Tue, 04 Jul 2023 09:28:26 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id a10-20020a17090640ca00b0098e025cda3bsm13420184ejk.141.2023.07.04.09.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 09:28:25 -0700 (PDT)
From: "Etienne Cordonnier" <ecordonnier@snap.com>
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH] qemu: fix typo
Date: Tue,  4 Jul 2023 18:28:20 +0200
Message-Id: <20230704162820.302230-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 20:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183909

From: Etienne Cordonnier <ecordonnier@snap.com>

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6acda61425..5b0b95c289 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -215,7 +215,7 @@ PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
 # libnfs is currently provided by meta-kodi
 PACKAGECONFIG[libnfs] = "--enable-libnfs,--disable-libnfs,libnfs"
 PACKAGECONFIG[pmem] = "--enable-libpmem,--disable-libpmem,pmdk"
-PACKAGECONFIG[pulsedio] = "--enable-pa,--disable-pa,pulseaudio"
+PACKAGECONFIG[pulseaudio] = "--enable-pa,--disable-pa,pulseaudio"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
 PACKAGECONFIG[bpf] = "--enable-bpf,--disable-bpf,libbpf"
 PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
-- 
2.36.1.vfs.0.0


