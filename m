Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD228EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 20:11:45 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.12536.1688547315971141850
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 01:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@snap.com header.s=google header.b=Eol/tcpN;
 spf=pass (domain: snapchat.com, ip: 209.85.218.54, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-991da766865so765697666b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1688547314; x=1691139314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sihnCgDjtHEW/tfwUX0MBsDjIDYMuFwJPSZt1rhLTH8=;
        b=Eol/tcpNJM2dR5clWP/pqHwZnxP635ntLhsyzRKbN90h/VRebAAWglTBSzEZy4V8y5
         Y8hfsoeS8V+0JW6dNJZU/q3ibC+6EZ5nrxkYQFuKD4iY0X1rOXOLmHY73qekNXgDal/n
         iA9DkebzBANeAPcAGPP0K8q3c/cktKVAfvfqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688547314; x=1691139314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sihnCgDjtHEW/tfwUX0MBsDjIDYMuFwJPSZt1rhLTH8=;
        b=Jj2DvVn/Rb3W05IbKP9iAKu0A9hLAmkhwL0KkyfL5MNFQmRL9Xipq4uGt2CY7KrAhm
         YTWQQxyzdlD6+kQRDHf54YADLKNabVy+46fU+8Iopl9VFTnQKXDrTjfySZjJ3rZ4DWF/
         Rvw95DqaUr58UwL5Q49EtTj41nnDZm4PyQBabQzXVOOqgsyh8VSi2JcXhgD5aBbdozFS
         xVEGjjRaVqvbSi16ozwnvBAB9j6YYIILWsJEhngxv5AG/XQx7w5zpmMCmCbzqmPUcXnt
         +pyT0LOkzsesZrn89ugMtLDbn2EpgsiZ3dFF7wQh8Kk8rilxbGruIfS2sYoC83uhGWNN
         Z+Bg==
X-Gm-Message-State: ABy/qLb2ASf2My/Il3YoQL6G8qADDXdI2KVEsVWv37Bgzf7a5gCnInKb
	npeK2xuMxoLNQeH4n4k/c+THGfaPU1Mz+jWXmpEdhg==
X-Google-Smtp-Source: APBJJlFolBRyQLc0Iw4NZ3xPbi32S3X8CIzDO9TlFptNFlqzSlqsj+afPktOP6hX6KmZvzjrqnsRIw==
X-Received: by 2002:a17:906:a857:b0:982:bbc7:15c0 with SMTP id dx23-20020a170906a85700b00982bbc715c0mr11745665ejb.66.1688547314133;
        Wed, 05 Jul 2023 01:55:14 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id t13-20020a1709063e4d00b00992ae4cf3c1sm8033477eji.186.2023.07.05.01.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 01:55:13 -0700 (PDT)
From: "Etienne Cordonnier" <ecordonnier@snap.com>
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] qemu: fix typo
Date: Wed,  5 Jul 2023 10:54:57 +0200
Message-Id: <20230705085457.2068569-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 20:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183910

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


