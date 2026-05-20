Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA21CD5BA4
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 19:24:47 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20574.1779305084219541597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 12:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ASONPuKe;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67be41d5eeeso8920113a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 12:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779305083; x=1779909883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jgTJ8YZUxczxF0fnlfaV50WLUyvc7/zPdIChEB01Ctw=;
        b=ASONPuKeMI2ZJQ3/+SFsvUgqfmT0X4kXA7b/zZtBkBgbthpW5iK62wQsOElq0pRUgw
         NHv6/MWXOp6znZpLzOQCxdObCuIKII7W+FnopTihl4jLne0swgA6vI/285gI+QI+oQ7C
         jZ9KS1U7Vb1ZN7QqecmoP7xDtThGTab8Ci6Lk2aK40l1y43Bgv1RZQFzHiSw3oj8nD57
         y6Qv/rqj1Lxs6obgt2V39oGJc5B8T1UC4qyVS3zc/PCJKyMuiuk81UoHrq0+x7vjItiy
         rmbnw+2lbd6yQUYL5P6wZ+4IxIScb/7DQFh9jLl8ApeevKozFf1Pw/cbyuM5njJ0QKSJ
         MfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779305083; x=1779909883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgTJ8YZUxczxF0fnlfaV50WLUyvc7/zPdIChEB01Ctw=;
        b=HuAZXXWgzopgspuTFFEi1Gcowo4u/n2XZtGDafnyQKze7/dDjF2N4fbtm8xnHK++xg
         GjmZjKvSt9IB/0j2oZhvvQQFTS62vipi0trhpIaKYvfidfWskuGJ88X4N+fqOzRmhoy1
         ZVWySCf5Dnu6KCWTn7EMAjEfvvKNr/znmpSfb7Ix5356Bgl7KaFuSu0U4gNEzR0NtjLd
         +tBL8vVehBDKbZiO9DowBOlQPmXIr6dLwfsi6X6IW+saMDkArnrtdFjosLKGCb4wZ8Bd
         woY8h/JX8mjXcMxIjh7oVQq2Yxfy48TavRtqLvqJzu3bItc4YHAascdUaba4IkiyL9/D
         KtUw==
X-Gm-Message-State: AOJu0YxXyFM5rGZNqldS/JUucbYNy6lJQ8N8a/k9i/7ojVmPDq5gD1N+
	JMyFlNara6h50o5/rL35Z0k1EXW+cmPuJBtvmx5JwIrRLLoMO60UGFP4pNBIPw==
X-Gm-Gg: Acq92OGw+EFgc54ezpVw5K93xgxTqW8zrJEd5VxaYgEoopecA/Zwdxv6FSEmW+VvRab
	evazgeMiesDo/khqUXFNnYQBrZIPIUqUw8PCjEqi9ge8ffmBV88E1EilLSShOycDJIXoSLwZKb9
	o2NoP/s39+BH4c4BDzgUe/e1/x/RRUdxPT5BBDKcmW9bQSbEkL0FDfwBAHVtS/EH68Yq4NUSvO8
	p6nQ16auiGHQk+28Dx51W06GxvKGmA58TQ1f6V4TX9PExaZsdL2HJOxFF48mPczIU2h8SvXxY9B
	hygj+5uhNBdyaPGPoHmfIra8RsVJYp5SuiXGHesvkCms1qSna9usQaw3z7YD4lvblAhde8ZIw49
	WihI0ernMwOC4VpisgZhw/yC1583qK/6ElashvxPHIcDuIi9AZUDgrQuamFP6H3F/Ib48nniqgE
	Eeawt4teK22yGsnIqfUz+lal13Jb+eSf1xWITTyA==
X-Received: by 2002:aa7:d6cc:0:b0:67c:6836:7b0a with SMTP id 4fb4d7f45d1cf-683bd58b751mr11189919a12.23.1779305082369;
        Wed, 20 May 2026 12:24:42 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:60a:2b00:1931:6763:bc61:bf02])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310d58df1sm8430800a12.13.2026.05.20.12.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 12:24:41 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [scarthgap][PATCH] wic: fix updating fstab for nvme0n1
Date: Wed, 20 May 2026 21:24:38 +0200
Message-ID: <20260520192438.138210-1-aleksandar.nikolic22@pm.me>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 19:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237464

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

In case wks file references nvme0n1, update_fstab() function creates wrong entries
in /etc/fstab, as it is not adding prefix 'p' before the partition number (at the
moment this happens only for mmcblk). This leads that entries in /etc/fstab start
with:

    /dev/nvme0n11
    /dev/nvme0n13

instead with:

    /dev/nvme0n1p1
    /dev/nvme0n1p3

The patch fixes this as it extends the if condition and adds prefix 'p' for
both mmcblk and nvme0n1.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index a1d152659b..b2b407dc16 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -134,7 +134,7 @@ class DirectPlugin(ImagerPlugin):
                 device_name = "LABEL=%s" % part.label
             else:
                 # mmc device partitions are named mmcblk0p1, mmcblk0p2..
-                prefix = 'p' if  part.disk.startswith('mmcblk') else ''
+                prefix = 'p' if  part.disk.startswith('mmcblk') or part.disk.startswith('nvme0n1') else ''
                 device_name = "/dev/%s%s%d" % (part.disk, prefix, part.realnum)
 
             opts = part.fsopts if part.fsopts else "defaults"
-- 
2.34.1


