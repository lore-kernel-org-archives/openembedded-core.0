Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF193C001DD
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 20:11:45 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.59497.1688480074976808393
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 07:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@snap.com header.s=google header.b=LvR1a8Q3;
 spf=pass (domain: snapchat.com, ip: 209.85.218.41, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9741caaf9d4so500275266b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1688480073; x=1691072073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sihnCgDjtHEW/tfwUX0MBsDjIDYMuFwJPSZt1rhLTH8=;
        b=LvR1a8Q32LXdU/E/wwfWVrLasYOpE9mGSI5KWEf0RcYKq828OVNYHFfUANPdhX8y/N
         9MssLGP0TtvbHf9CwKSksp2f4rJZcmw9TEDLvBjK5QlSfUl39eiUY1I8wzbFc03SBkKG
         lH2H38DsKwf+2wgAPKxIUSBqJwbJlxa6lL20o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688480073; x=1691072073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sihnCgDjtHEW/tfwUX0MBsDjIDYMuFwJPSZt1rhLTH8=;
        b=lifOJELn/C68B44zs/P9Pxnk5hSJXkbkcPRCUmjNZGVVo1ycSR0TxSMSaqwIJL2OFk
         UUjllzceDo1+E1BsHO7JJA2rHMiyt94BI8Q4duJ6HiE3POqf7s+Pd0e44DErD+o4YrK3
         371Lg9EDe7urqck7YRQjMsTHFaI2iMHXa3sgVRbfhm+c2KXDJuRqwJwml/vs6Xcx4GPx
         0rZuLQUnWbtqOEuSYGQX2NWfNd23OpU2ubRBGHzculbaEAkmlIinlXZn2Yff9BKK6uU2
         HxyW18mLhsmm9CiZJ+Ujmgv1aqLyS+ro+G1bemCeRvpPfF4AX91odocuBb5+Vnl8X7GO
         anKw==
X-Gm-Message-State: ABy/qLZB35nYmAWPF0GJeloRKUYHUpT06pzrl69mx1DhRRwIyiatZxqR
	gxTzXJaz9Ya39JpPogczZ6rc3XYymy6YEZXnU9Xlrg==
X-Google-Smtp-Source: APBJJlHkUCdfUXxuYvxgO/SH9mnjw+GWDJ5HB+QVKfyOW2QnbSEfaRhcGj7lPviJBhuNmQlrTyX+jQ==
X-Received: by 2002:a17:906:1c42:b0:982:caf9:126 with SMTP id l2-20020a1709061c4200b00982caf90126mr9761706ejg.42.1688480072972;
        Tue, 04 Jul 2023 07:14:32 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id t14-20020a170906948e00b0098d2f703408sm13189974ejx.118.2023.07.04.07.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 07:14:32 -0700 (PDT)
From: "Etienne Cordonnier" <ecordonnier@snap.com>
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] qemu: fix typo
Date: Tue,  4 Jul 2023 16:14:00 +0200
Message-Id: <20230704141400.3519751-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 20:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183908

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


