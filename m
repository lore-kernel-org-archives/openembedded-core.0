Return-Path: <makchrbiz@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 298D3C282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 19:16:04 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.35613.1742152560471504901
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 12:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ccwU+01D;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: makchrbiz@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so838385666b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 12:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742152558; x=1742757358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQ/xpo2Uupo8p3hw4As6g17B0dUR4yB4s0HKA5YsuAg=;
        b=ccwU+01DYgn2IstoD37I7HlI9AWmDd42Am63X2sw4u4r3mphCvUmJkzwOg2QCILVcE
         0OaQTdWWERQ26S7UGKtlSnH9bfL1qgNrxE/emSD5lwgY1EOymaOIJ8iWsf1gkISKQWHd
         VE45oxBUTKirf2FOJfKq652mqkQrCGirIe0yvfLvEItz9K8vy7TgdTFLEjAQ1Ks+P2xJ
         w4vO1LYPZeSu3XGeP3GUOEm3NA2/WwiE8712EC/3lyM2Or/DE5MoKxF1fVLKlh5dBtVo
         zt/GZTGwEXRZ7+fYY2lKJGLbhJ3f+/+z4u5oyUzpsALT5twG9KWF8MHyriufdgIA3oEF
         Pl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742152558; x=1742757358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQ/xpo2Uupo8p3hw4As6g17B0dUR4yB4s0HKA5YsuAg=;
        b=g5C0L7xXWq9xFnfOHNL3RauRW5bsv+FndU/6hSrLXUXe/7gmJ3kxQg07EAmEevkIOD
         3kPkKqg1ewg8hz1JZnfKbBmLH2NLGBQFn7+RxUUmqWho+fKk5MxZX2OCG6BNn7WSzdnF
         BKs3btpEHug1VnNH1KrDAP1s0iMf+XMqYv3sg4f00wuhWSQn9vstoXqyTjNL8Y3j7IUP
         F1O+XlxVjcJFXi9w3EOdTecnZ+TD5s+YtqySL4tMToru5/UZV2wmVYiVI1ujTz40CqwA
         BQSmPF6hQqIJzHt30lNGB2wHxpSLoA6afkU9ZPNnQr79BF/kDw1e2fgYDpv1Xf2PKFDJ
         FvOA==
X-Gm-Message-State: AOJu0Yy0ewHmm6RhtV2XBrCuFUF4KGRwQQn2N2oXKdUcF57mo+vz6vhC
	iNG2AGjoxx+X8oeafbZ8i5F8OkgdkElTujNlxMQ5a2dckyt27ZiVW51faZ24
X-Gm-Gg: ASbGncsCj68sx1zNWQ6/PDX0yf7la8Oho/2M3fjWuzKdxoayBDzzQmor192VzNgrAGx
	RnQbyUaxGJHDc92Ng5uHQ/9JZiUv5kX3J9v8iHVTLKIWN7SYws3Ep+5ZO3BkiemSlYyM/v8Z+Qr
	bvWlIrzeK/krsGn3V51R2bSOc/PVw47ypx/wh2rujeAKBfnIfaSwwu+aWxFZzEcJ2Qd/einbDpo
	dY2tmyt+jYl9SIEfQ0+D+zTrJow2LSqlmSjOxWQRQ6XY1pnp7pJ1dpfLQUGduzjGMWs5it6rN0w
	s3bTsJOfOUTf8aNWYdIaZcyq7TNSPpCVPrZ6S24fftwZVX07lE63poE4ZabdWGC6VtkTEWzsFpk
	bvIgThGy24Q==
X-Google-Smtp-Source: AGHT+IEoaip2sTpuZMfjSr/FYN8X2Q2wfnBcOr3Zn9jGWoAe2L1rDHCsFSsxN/7aVFjxZP8sLEOlEg==
X-Received: by 2002:a17:907:9488:b0:ac3:4489:790f with SMTP id a640c23a62f3a-ac344897c14mr695517566b.24.1742152557530;
        Sun, 16 Mar 2025 12:15:57 -0700 (PDT)
Received: from localhost.localdomain (athedsl-286910.home.otenet.gr. [85.73.168.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314aa7d10sm531496066b.185.2025.03.16.12.15.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 12:15:57 -0700 (PDT)
From: Makarios Christakis <makchrbiz@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH] icu: Adjust ICU_DATA_DIR path on big endian targets
Date: Sun, 16 Mar 2025 21:13:42 +0200
Message-Id: <20250316191343.2621-1-makchrbiz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 19:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213056

Greetings everyone,

First of all, thanks for the amazing work you're doing on the Yocto project.

Migrating our build system from dunfell to scarthgap, I came across an
interesting issue causing Postgres to not be able to start on our big-endian
PowerPC boards.

I identified that the root cause was the ICU package which we build with the
`make-icudata` PACKAGECONFIG option enabled.

The icu data file icudt74b.dat is being installed onto the target's rootfs at

${datadir}/${BPN}/${@icu_install_folder(d)}/icudt${ICU_MAJOR_VER}b.dat

by the do_install append of the recipe, which regenerates it for big-endian targets.

The problem seems to be that the runtime ICU data path is being set to the 
dash-separated version:

$ icuinfo | grep icudata.path
    <param name="icudata.path">/usr/share/icu/74-2</param>

Which causes any application that tries to load the icu data file to 
fail with U_FILE_ACCESS_ERROR.

The culprit was the C++ preprocessor define -DICU_DATA_PATH which was being set
for big-endian targets to the ${PV}-terminated path.

I am therefore proposing to change the PV with a call to `icu_install_folder` in
order to set the ICU_DATA_PATH appropriately. 

I am not sure if this is the right way to correct this issue, so any comments would 
be appreciated :)


