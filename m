Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F73103A999
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:20:09 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13731.1774405201988383562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Sp+NW5y4;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8296d553142so1044033b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 19:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774405201; x=1775010001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnWXS9AQJb3dTKCH66v7BpzBs60VuEnsEv3SHYOobJk=;
        b=Sp+NW5y4UDvDHTr0j6dLsAd137MycEFS7R9nsa/BxcONvrthh5pvW+otSZER9aEyzb
         tQixWjnx1rzIfhTPTRrDdEzAQWwLgXZX/74vKZDFChyJ6s2lEBdZadyxxdg0ve4nvW96
         oZuIxgNrd/cCkx+2Ob0euEWRpjAYG9jysafA+Id2LirP7EhJxCcPCRFdrFOKSSBimaB0
         O9S+E2z2O+f8Vcb582evxDqa16tIqpVNIpKiW2BOJV6TZ0pCNs3jr1DT4EBtWvugZjGr
         RpttV2qR+rIylvHhkL5dwKFfYinDlvrggZ0vUjqxXl42nUkzzJ/33EWwpuJb74dlTSQL
         gkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405201; x=1775010001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EnWXS9AQJb3dTKCH66v7BpzBs60VuEnsEv3SHYOobJk=;
        b=MEhKaO/qANAc8rmqjHNA0KFy/sbDRBKZtBPdCvzNsTHrcPn5z8KAiClsujeUcB2+Ev
         Dvj3kPUCcJ3GxH+SkkM9rImDe0FqT1174rqUcMb2bZPpzv/xmv0U2cM+8GV2FBFoP8mz
         /Tx4ghzP5fx3Zj+Djqo4l7ym/ic5223dQkd9Ndv2E+q4deMEGxen1iGJCjx6JRVQpnwg
         rGx+5s8lS5lv2vcX+kdgk2Z4yJR0SV8SLHUxJFcvJWchyatRJZqyRPIwk7qSYKaxvDrI
         ItPbsn76AgG/uoTb/wrjd3ygNivH8VJeeIQqzI8SbR4w7VPtuxIsgLYPMw2ZGHq8Ux++
         9rfA==
X-Gm-Message-State: AOJu0YxufJ2M6OGyh8IQQHyBP3+Vy4cBc8ipipLQZWVkq5qFH2sU0Y37
	hWGrAwlWtvBbDcKNLPG4vAkKgBLF1sAMaJ7gU876JG2GDd00COLY+yT7EhpwRTV/
X-Gm-Gg: ATEYQzy/h8h9q1ks10Kn9gBfmRDTksMTsqtC+YTdQNUlz9K7zvmse4c0sC1dK88px+c
	Usl2cEY2xwKUdC4WhVt72/xWDF59j6KLNM9hvGjnI4d4SUExfYUzt9BXduB3mJbMK7rH0i8cSbL
	4TACWmbmrgjwZhbsi8COWz0P0vjT2KeELZh2rFJ33BDTFj4qhi3Sf2fK1LCt1ma0T5NFIYyLl6M
	CLnaSC/VGkxcT8iv9SONlE7oNGKifmZhZUk9a9I8FjEXJ6i+a+rYf8btxu8MI+s4YAWE2sJuSMw
	3kBxTEMRw2bzAtFDAbVO0x7xa8t6MOKqrvsBFSXeZI4GIqhYElw0O7orFc2aV1iqUiUYXj37vqe
	G8RxfFJsgJQ+r5ljK5rG8S3h9D65/5bVXhJym7UsFyAsG8R6cZHUI93SbT8DDvEvdi0pkP+75b8
	O957ava/oDmCajUbSf/I/N3utrjukg2poCMug=
X-Received: by 2002:a05:6a00:3391:b0:82a:5d55:5807 with SMTP id d2e1a72fcca58-82c6de73d5amr1793623b3a.6.1774405201263;
        Tue, 24 Mar 2026 19:20:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409f409sm13581235b3a.31.2026.03.24.19.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 19:20:00 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 10/12] seatd: upgrade 0.9.2 -> 0.9.3
Date: Wed, 25 Mar 2026 15:18:54 +1300
Message-ID: <20260325021856.4053666-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
References: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 02:20:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233848

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6bf3674d8a59f8fa5a9bbd51c116cd3144fc4f23)

Bugfix release
https://git.sr.ht/~kennylevinsen/seatd/refs/0.9.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-core/seatd/{seatd_0.9.2.bb => seatd_0.9.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/seatd/{seatd_0.9.2.bb => seatd_0.9.3.bb} (97%)

diff --git a/meta/recipes-core/seatd/seatd_0.9.2.bb b/meta/recipes-core/seatd/seatd_0.9.3.bb
similarity index 97%
rename from meta/recipes-core/seatd/seatd_0.9.2.bb
rename to meta/recipes-core/seatd/seatd_0.9.3.bb
index 9e1b50c087..d0802eee60 100644
--- a/meta/recipes-core/seatd/seatd_0.9.2.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
 
 SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
            file://init"
-SRCREV = "a3c56c324c3a84474cc1615d94ccd6a6255d0c10"
+SRCREV = "daa8196e10b180b8b0caeafa8e5f860eb1bd6706"
 
 inherit meson pkgconfig systemd update-rc.d useradd
 

