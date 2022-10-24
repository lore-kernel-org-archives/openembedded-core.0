Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA0BECAAA1
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 14:24:38 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web08.19791.1666621474821281660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 07:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=oi1SB+KO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id f9so4411876pgj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 07:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yy2x/ZwbtEZ8pQ0+jFFEqAcYbRzH7qZVTaI1BT4ahgQ=;
        b=oi1SB+KO1bpjPNJTQmYUtL21Nn/6KROEkMTyP8msalvjBO73/sVd2J8Wcp1D7ceBgV
         PFwLruLVKAF7YDLJx6Zceml4yl/w4Lap+n1DiRaDRnir5yz9X4XwnElaBjitEFET1YXK
         h2x4cDpKk7Mi33KzgoET0VcSQbwIcdXG5bLwqnW0HHiGU5LaznS4KzEXEp8ksvxMZxEf
         oGXmt1PEUgAS9/8SdkDylUPbbzdyS49PHR8Oqht7jYAndEpJ/zhNRdQXaRIvIOpZfvnG
         +XGVmRX+yAwUCQg6fdUvUTDaJjByZqcgLbjwelLwS1GsnbWAmwjpWfF0Yp4ZYp17QhwZ
         yZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yy2x/ZwbtEZ8pQ0+jFFEqAcYbRzH7qZVTaI1BT4ahgQ=;
        b=yJjUwbdgU8CJ6BPTNdXFA6foeddECTyx3XWP6MOAX09WF6t4wQnGO+iHGa3R8AWYhI
         JFxx1DoVUe96IoDkTHCCAQrGtG1e1fSZT1OsB/2m55LnMdN6p65hjEQEq9ZCFhZGC9VP
         AIILsKHlYZ4Eix0wQQMdDb88RgXx9LJC83Ik1f5kn+HbcRPvA4SA/O3bL6A5e00RTQcv
         RIS5aLMmn/9P5q3VuxZ0DrWqKvebP7ShMlSQLOs6neDb1NZdCQUYFDWF+QvD9+kRwU0z
         uoQhqMi6fHHCqYtqQsuypSFarTmt+H2Ru6zCXEKvYQzchl+1ghNh6qe/Sq0wAqKeZUhx
         8Fvw==
X-Gm-Message-State: ACrzQf30VdP6mXbXq3QddsB2a0r6m37aEZGEQ6xHty0ba4EylLg+rzN+
	r7REOGpBC7GDQsytxCylD0IAmyk14ykDFH2i
X-Google-Smtp-Source: AMsMyM47PdA3Xpo4AdO1V1RkhjSvYKmDfZiJZq5LM3vYAyD9p8cgyB59AkE0ptuvauuqQVL+cGcv+A==
X-Received: by 2002:a05:6a00:24d0:b0:563:6d36:eae8 with SMTP id d16-20020a056a0024d000b005636d36eae8mr33824896pfv.66.1666621473713;
        Mon, 24 Oct 2022 07:24:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id z15-20020a170903018f00b0017e64da44c5sm19704457plg.203.2022.10.24.07.24.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 07:24:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Patch review
Date: Mon, 24 Oct 2022 04:24:14 -1000
Message-Id: <cover.1666621276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 14:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172090

Please review this set of patches for dunfell and have comments back by
end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4364

The following changes since commit aa9d0c2b777c10bb6c68b0232d54cbcd1af1493f:

  qemu: Avoid accidental librdmacm linkage (2022-10-12 05:13:44 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.216
  linux-yocto/5.4: update to v5.4.219

Omkar (1):
  dbus: upgrade 1.12.22 -> 1.12.24

Paul Eggleton (1):
  classes/kernel-fitimage: add ability to add additional signing options

Steve Sakoman (2):
  devtool: add HostKeyAlgorithms option to ssh and scp commands
  selftest: skip virgl test on all Alma Linux

wangmy (1):
  dbus: upgrade 1.12.20 -> 1.12.22

 meta/classes/kernel-fitimage.bbclass          |  6 ++++-
 meta/lib/oeqa/selftest/cases/devtool.py       |  2 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  4 ++--
 ...s-test_1.12.20.bb => dbus-test_1.12.24.bb} |  0
 meta/recipes-core/dbus/dbus.inc               |  3 +--
 .../dbus/{dbus_1.12.20.bb => dbus_1.12.24.bb} |  0
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 scripts/lib/devtool/deploy.py                 |  8 +++----
 10 files changed, 31 insertions(+), 28 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.20.bb => dbus-test_1.12.24.bb} (100%)
 rename meta/recipes-core/dbus/{dbus_1.12.20.bb => dbus_1.12.24.bb} (100%)

-- 
2.25.1


