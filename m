Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0DFC352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 18:45:44 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.56850.1670352339255297755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 10:45:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=eTLIA6Kd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id w15-20020a17090a380f00b0021873113cb4so15685177pjb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 10:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nWrRaYit9bVTiVskD7EgBzOYcdyI4TR8WXyzjwQXG6Q=;
        b=eTLIA6KdQouhGl7dAXh+vREQ0OsVYblIGmGbctpabqbkOSFttRsxOeN4HryafkUeb2
         a92l/pfOIw26WXTIt/xH3peQMe87DuKDzgYCuOXL3nPial6CHZi0VSy/JbnSzUoVQU1A
         uIfAoaPPgDVJ4TyizLzf/BSdB8Cv0XDNfb8ePMG2DsixbxMF5H8y+kUdJkWRyvLi8huz
         k3cLjFLEfprjXe5nQ1MrGV10YeXtS0YyDRtn/ptQY0FW359Wo+MeNbRGFCAFCDLULGaI
         mVyBuxhyhTBzPzTEClk2oifEQnHJ4GCe6R/6kLRyM3JDbykr3N19yMY1dfcPeiLi+YLz
         FBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWrRaYit9bVTiVskD7EgBzOYcdyI4TR8WXyzjwQXG6Q=;
        b=LJpPrjVjaBlJJ8PNK4Vmh6+27eiyFYrE/cdY6+8kxZ2+3anNRzWNSIANFYnyXzDHTa
         GPcQexpfO9SbGEJa8nDH8vIDKQImy7TZbQS69k9Gw61Alw3XZyzF527FJnW7B99RJ05S
         PQFaoLU0d545OzGRbcJ2Jbi8KEf92k+pmAVKwkuSSgZML9OmQcfxo1bgP+gyaOLzR5x0
         DAVjum/25CDTCflJ1QMHnvJenZoT36dymFj9pWkqyIzrnNgQrxun2n9PZ/pBnWqT61GF
         cGbAZB9l7pfiy7Yseefuxs8GotBNTdvJ25uMQeWuNjjJlulyA5tFk7lDRYXmHX4Z6S3b
         OzWA==
X-Gm-Message-State: ANoB5pmT71CEMWuA+GH6nyF6BNgj9rcjQ/vH12DQTT0jEivMoWMc66hF
	ogMyejUZnj+EpiqoYiCKqicKW4Pw+Oe5XRJQk1TGPw==
X-Google-Smtp-Source: AA0mqf7quRg1yDjr+PDn33UVrOtSkHeTiGGc4QX4FB71wF5FMjFVQjSXRl52yV8fieBSBDwGhE7Xtw==
X-Received: by 2002:a17:902:a989:b0:188:d4bf:dbfe with SMTP id bh9-20020a170902a98900b00188d4bfdbfemr70316956plb.31.1670352338023;
        Tue, 06 Dec 2022 10:45:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id t4-20020a170902e84400b00189e7eaa005sm2262999plg.107.2022.12.06.10.45.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 10:45:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Pull request (cover letter only)
Date: Tue,  6 Dec 2022 08:45:33 -1000
Message-Id: <cover.1670352273.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 18:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174328

The following changes since commit 408bf1b4bb4f4ed126c17fb3676f9fa0513065ba:

  sstate: Account for reserved characters when shortening sstate filenames (2022-11-23 00:26:19 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  linux-firmware: upgrade 20220913 -> 20221012

Chen Qi (1):
  kernel.bbclass: make KERNEL_DEBUG_TIMESTAMPS work at rebuild

Dmitry Baryshkov (1):
  linux-firmware: upgrade 20221012 -> 20221109

Mike Crowe (1):
  kernel: improve transformation from KERNEL_IMAGETYPE_FOR_MAKE

Ross Burton (1):
  pixman: backport fix for CVE-2022-44638

Vivek Kumbhar (1):
  qemu: fix CVE-2021-20196 block fdc null pointer dereference may lead
    to guest crash

Wang Mingyu (1):
  mobile-broadband-provider-info: upgrade 20220725 -> 20221107

 meta/classes/kernel.bbclass                   | 29 ++++++++-
 .../mobile-broadband-provider-info_git.bb     |  4 +-
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-20196.patch            | 62 +++++++++++++++++++
 .../xorg-lib/pixman/CVE-2022-44638.patch      | 34 ++++++++++
 .../xorg-lib/pixman_0.38.4.bb                 |  1 +
 ...20220913.bb => linux-firmware_20221109.bb} |  6 +-
 7 files changed, 129 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220913.bb => linux-firmware_20221109.bb} (99%)

-- 
2.25.1


