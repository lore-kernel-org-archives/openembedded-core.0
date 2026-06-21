Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE948CD98F2
	for <webhook@archiver.kernel.org>; Sun, 21 Jun 2026 20:25:34 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30133.1782073529675395096
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jun 2026 13:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P/Mk7H1W;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c074142cf6dso564913366b.0
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jun 2026 13:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782073528; x=1782678328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RpEfq8FRe1iq35nI/KNeXg2y80F1lhq9HmfMVN6W5A0=;
        b=P/Mk7H1WFM1A7Fc9Dd+giA0qurRJFwVpv7jbun5JwkusTU4GZuDhc3D6B2mGxNz3cO
         9tQfj173k/KRbZPTTFAUSSC0T+2vwTW4S5VkmLHTClMrCR4o2VvffV5vEJb1vuqF/wRT
         kL4sseqqmB/H8FKua8F+wDZyJX/qA/DvQEOAQXGbSbM79sVwiq3peHr6zcyLYbHk+28F
         ccvtZR/xqkTcxofcHKxBtrHpR9dIcp1k7OdG1It/Dd5/mQB5aimXUxwEW1RFF+z0is3m
         CULO7hTNP5TUvGX27S+kz6+uf8LjBI6tWDQfXFikTyYnau6huyVqkuaPBLf0LXTV9YWn
         MdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782073528; x=1782678328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpEfq8FRe1iq35nI/KNeXg2y80F1lhq9HmfMVN6W5A0=;
        b=Pb/uTgsmzBcS9bTYoYZmozgtJkC2a3bcVHmpOB3yF6nSDrNYwrT4csVlgI6GKOHFl2
         Mqgo3COKj80m39nIjTHHGgrWp19AQfamm826oCsjQGTwY27atnQoP8OYj6FtgMuUOgSG
         B7VB4q3i8uUwQQJzabooEaTOjZ/dY3kq9pZKoFvOhGA2Yjw1Nob3Too73VlYSlIekeWH
         SjDx+5Or+pHOcqrxJovIPuG39GPKFupecYG1Jp/U+FszFKlZRFoG9AW9Gii5hajX07iG
         kO85PKfUlApvpQkCCbnvVLoaUH92UOhrUwAkE5VrE7zusMmQLH8rs/QWJn+Ev6Q9/BbE
         unRA==
X-Gm-Message-State: AOJu0YwMqFeETjJRVBf7aXTvo0IAxH7gwZMoaXli5zt6kAEpW8/FarFu
	j+GdYT134wZW4jXwyBM8n9+jh22Yczg3dEBAOO75W2BdH8+SvzFx3/99d61fI+X7
X-Gm-Gg: AfdE7clXKGFgOfEp0D9Do0CDTKJOTrZzaP1VBwmaAzHeqKng89y4r+uB/pnKkCjHxGe
	9peSl43rmNw+iKXNcmFsfF97on06mC/3SYedCXOJfKd94weAUl4cYfhjnpDRFshhb6QMfS1tNw/
	R3XveszIjpctpGPlNIWwcv8s+8eK5GMHN90oKTshEGkrP1XrLMXazSmzaH1xqChGGKXl+PLqnWV
	aSfzJFZ9lR+Txhkyu/fuxinJ4kfwm3YOKQv4f6FDeaMWmC/7ETOkSy3K18YLgvAyr/9wd+pBw8A
	BBI8XKYjqpIWkZqdrDlk6Ddxv07YSgtTAOG5Fm9zOrW5OHcpOxwQvBjBWihhiuDakUgCTqU2k2u
	WzynjrZBLDBeermv6uZP/GtcmpJg7JJGCbsDWi8SHvTbrmPPc/czb3IMDMF88NL3kA4n52yl7v8
	Sz1DLPRbVfjLVFZz8JTBsou/LdF12StjAjaFpGulRARRBPow==
X-Received: by 2002:a17:907:9494:b0:bd8:fc89:cda0 with SMTP id a640c23a62f3a-c09b96816bemr451941866b.24.1782073527491;
        Sun, 21 Jun 2026 13:25:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810d:60a:2b00:b372:820:9a16:740d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be4d790sm1868877a12.24.2026.06.21.13.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 13:25:26 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [scarthgap][PATCH v2] wic: Fix updating fstab for nvme devices
Date: Sun, 21 Jun 2026 15:25:19 -0500
Message-ID: <20260621202519.177293-1-aleksandar.nikolic22@pm.me>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jun 2026 20:25:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239261

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

Upstream-Status: Backport [https://git.yoctoproject.org/wic/commit/?id=f20cda73b495b75ef399c331f59b0e2401a3e76a]
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


