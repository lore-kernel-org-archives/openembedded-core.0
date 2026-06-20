Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93668CD4F26
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 20:57:55 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13413.1781989069844385888
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 13:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jx+kBH8K;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bebb72b845aso496109266b.3
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781989068; x=1782593868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozC19FqZsL1HSQUtK9O0+6EJhbaKufXI4VwGAhfPhKA=;
        b=Jx+kBH8KL+bmxljnaLre6IQnFb5sua2CVG3zzLeQkANAVYvtlp33xtKYYTQmKCZQgG
         QVyqhXSs7029Lj7/PpDMj3f7Wikmc3V1F1R/r6ee9nqqRo8TCDH+liinN+YR1iR7opS2
         WEb/lSToPT8O0tJmICaK/gIrsly81G2oOurjljvnTf92/N65Iz8ab530cs7wU7tguUPI
         oE+YneDPRaFSAE865ceb46Nzu6aip9AcNvMTLSDRbx+gAmWiuU4RO/r4CxQ820UJ8Hcl
         KmITvQDeKCeqNX2FrhSyE9Ku0TnPRimZydl8i9V3nhb11yG0GuIuNmdC74qLftbuJGKm
         AbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781989068; x=1782593868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ozC19FqZsL1HSQUtK9O0+6EJhbaKufXI4VwGAhfPhKA=;
        b=dQSX+rHaEcDHajestE7me5VVlLwAIbtgBIss9k1uWbEVNKYDxdTVr7GE5GHdkVHGu7
         x/9uudZYm5v6j2F+XOZpU9Op8+YbODBz54NTP5fcp/osPuNtHaTkgj+4K46/FsjDOU0M
         1v26Ixnqvw++Y5FWk1urEK+L5XirJN2/aNWs/7AzZ38seWlJBsmSWSn2QMIHBnioGwvs
         DjD+fjkZ40pGfTpYnBcrJZ+C0Yn9H6qkTRVaNq3ZR7rKhfoWxBuJwzH3S9Bo/RmGQOGM
         QQ6BMLyN9V4BoZnw9rgWlw+G1juymMpy8LiKGxL9SyyO9Bs8t2Z/5BHDENUCJuopwQc3
         Z2CQ==
X-Gm-Message-State: AOJu0Ywq2bDu5zv1PGCDiM6pEGxuojmmmIKgcXeQ3nSPzKHjZrv2V4Qk
	vgdcDMJKruJB5W0/eB4J+sNeGfWSc4VBhVyWpOjznp1vMMk3gHlTYFw99Xano3mu
X-Gm-Gg: AfdE7clraKN+mPneA+1WRsu+VfvMBkxFD1VQfzPv4W9BLV5RrrbxKfCHwg9BfP+qrXw
	HbqNAWzYmE2OwCd3hcGOIEc1X8UKh6zgVzKI3R8t3ON2AB1wl5/fQmvm/jw+plfoi05bL3MVg4T
	c9K0PFW7+zYISGVNbhgDX9Jxq5ZvuyqqdT62aPXDQCpG5k8VPq6STe2Qnt9CHRodUvVAXwaaYEA
	Te6c9/AsFSkz8h1k5VF5D6kjKawEDgJ7P0iUer2xG+zaorHZqbgmJnEKVmpibKRWvCLKPWG9Nsm
	1JBIkJnuHEYEm3e15aWYLSjxw9Y3oA/ctRRorDgqeeLx5yrrGym18i27G2DGDqdSAW3blHWdgPQ
	nQAWm8XPiipA18FDlXOky4QnU3v9n9mcLaSm3dH+yidYipLi2bY0DKWRYn0QbRdIs2INRCbSWP2
	2hF8/YM7Yq/MoNsWo+H0gGFsU8+PTJXGAM3koZ
X-Received: by 2002:a17:906:ee89:b0:be2:cd33:2142 with SMTP id a640c23a62f3a-c097af68d12mr445590766b.15.1781989067912;
        Sat, 20 Jun 2026 13:57:47 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810d:60a:2b00:46b1:66c9:a143:74d0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e5280sm139343966b.53.2026.06.20.13.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 13:57:46 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [scarthgap][PATCH 1/1] wic: Fix updating fstab for nvme devices
Date: Sat, 20 Jun 2026 15:57:41 -0500
Message-ID: <20260620205741.175107-2-aleksandar.nikolic22@pm.me>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260620205741.175107-1-aleksandar.nikolic22@pm.me>
References: <20260620205741.175107-1-aleksandar.nikolic22@pm.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 20:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239249

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

In case wks file references nvme, update_fstab() function will not add
prefix 'p' before the partition number, as the if condition only takes
mmcblk into consideration.

In case of nvme0n1 this leads that following entries are added to fstab:

    /dev/nvme0n11
    /dev/nvme0n13

instead of:

    /dev/nvme0n1p1
    /dev/nvme0n1p3

The patch fixes this as it extends the if condition and adds prefix 'p' for
both mmcblk and nvme.

Upstream-Status: Submitted [https://lists.yoctoproject.org/g/yocto-patches/topic/119439838]
Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index a1d152659b..b06e6a8f23 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -133,8 +133,8 @@ class DirectPlugin(ImagerPlugin):
             elif part.use_label:
                 device_name = "LABEL=%s" % part.label
             else:
-                # mmc device partitions are named mmcblk0p1, mmcblk0p2..
-                prefix = 'p' if  part.disk.startswith('mmcblk') else ''
+                # mmc and nvme device partitions start with prefix 'p'
+                prefix = 'p' if part.disk.startswith(('mmcblk', 'nvme')) else ''
                 device_name = "/dev/%s%s%d" % (part.disk, prefix, part.realnum)
 
             opts = part.fsopts if part.fsopts else "defaults"
@@ -266,7 +266,7 @@ class DirectPlugin(ImagerPlugin):
                 elif part.label and self.ptable_format != 'msdos':
                     return "PARTLABEL=%s" % part.label
                 else:
-                    suffix = 'p' if part.disk.startswith('mmcblk') else ''
+                    suffix = 'p' if part.disk.startswith(('mmcblk', 'nvme')) else ''
                     return "/dev/%s%s%-d" % (part.disk, suffix, part.realnum)
 
     def cleanup(self):
-- 
2.47.3


