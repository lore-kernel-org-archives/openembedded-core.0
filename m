Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAE9C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 21:24:06 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.2733.1642713845219244338
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zWGFpaIv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id 128so6793710pfe.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eh7SlsKwq3eaKdeadecqe1uQbKPMmoTmCL+iRqIp0MQ=;
        b=zWGFpaIvM2Wh2dGkQXYTn3h9g+MT1bOY+TWFvO79g4DkFN7m7VBQE9LuC3skAEtrNp
         cmOUw/4owHIsSNHRTIdjKw8o5NCtVRygKwxonQYVIC4pp5auA3LqLNWDoDDNDwVrBB4h
         +cJsR6f8Uj3mJlp5Esbpd9tA60lPF1vvEld4XGW42x1G1kOedM9JN9l1ET0sWhcuf3SR
         LqYpQyW+RoFNGynKZT3LeJNNcGYjCXloIV3TXTNXquEXswD3OR2z59/qdglcOEYDT7dn
         UDNcAdr2qM/imAxruQ9ECozyXV3rMqK7CC4RPH79i16EbQ/Nux/xNoavXJ9smeTlL220
         xvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eh7SlsKwq3eaKdeadecqe1uQbKPMmoTmCL+iRqIp0MQ=;
        b=c8LFYFYbAFwooMG6fdN16U42eVIO12uYQFPZO2j0YrA7R6U6pHRmFdItwndZ0yfrwT
         i+UoadXYNivp9t7qXnTXiye2nZm1g86ofzY0D681/yQdljqcg4Tbi5byM7oqSAY16hIA
         OKUH0u7vFJTg56oghaagdd42pkaViEyPFobn101XqbC9peUuhH1BKaMu9bhkN1uZRiwU
         haFp73E7sWMR7DDlVupjToiAtk+7iDy+tobObuVr+2J2bQdZyza0lQNMxZ4051q2SHZx
         w+od6enD5nwa1ApPmaOcr/RO6PLg4qQh8+B4PYZ+XstL/DDOMjxhqqm48wmLsNKvAV48
         URIA==
X-Gm-Message-State: AOAM533mSJDer1sw+Ic06fPm0cpvTP02RKCVZCGFQ4mgK/v+zK3iBTfx
	Qsvtm8wpuywCSiaxyOhG26UWXos2mN94Vt7s94E=
X-Google-Smtp-Source: 
 ABdhPJxSeNijyUm0Z1rlfptmtGwfQ3yXxQobTkhKM8cJ2TgFiMo5UMHDf8oCg0ZcZkSCp2ThtSc5CQ==
X-Received: by 2002:a63:f250:: with SMTP id d16mr528429pgk.494.1642713843921;
        Thu, 20 Jan 2022 13:24:03 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 o5sm4029115pfk.172.2022.01.20.13.24.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 13:24:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Patch review
Date: Thu, 20 Jan 2022 11:23:39 -1000
Message-Id: <cover.1642693490.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 21:24:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160790

Please review this set of patches for dunfell and have comments back by end
of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3141

The following changes since commit 01f256bc72fb45c80b6a6c77506bc4c375965a3a:

  glibc: Add fix for data races in pthread_create and TLS access (2022-01-12 04:37:31 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bruce Ashfield (5):
  linux-yocto/5.4: update to v5.4.169
  linux-yocto/5.4: update to v5.4.170
  linux-yocto/5.4: update to v5.4.171
  linux-yocto/5.4: update to v5.4.172
  kernel: introduce python3-dtschema-wrapper

Kai Kang (1):
  speex: fix CVE-2020-23903

Marek Vasut (1):
  Revert "weston: Use systemd notify,"

Richard Purdie (1):
  lttng-tools: Add missing DEPENDS on bison-native

Steve Sakoman (3):
  expat fix CVE-2022-22822 through CVE-2022-22827
  expat: fix CVE-2021-45960
  expat: fix CVE-2021-46143

 meta/conf/distro/include/maintainers.inc      |   1 +
 .../expat/expat/CVE-2021-45960.patch          |  65 +++++
 .../expat/expat/CVE-2021-46143.patch          |  43 +++
 .../expat/expat/CVE-2022-22822-27.patch       | 257 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |   3 +
 .../wayland/weston-init/weston-start          |  12 -
 .../wayland/weston-init/weston@.service       |   6 -
 .../weston/systemd-notify.weston-start        |   9 -
 .../wayland/weston/xwayland.weston-start      |   3 +-
 meta/recipes-graphics/wayland/weston_8.0.0.bb |   6 -
 .../python3-dtschema-wrapper/dt-doc-validate  |  20 ++
 .../dtc/python3-dtschema-wrapper/dt-mk-schema |  20 ++
 .../dtc/python3-dtschema-wrapper/dt-validate  |  20 ++
 .../dtc/python3-dtschema-wrapper_2021.10.bb   |  17 ++
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../lttng/lttng-tools_2.11.5.bb               |   2 +-
 .../speex/speex/CVE-2020-23903.patch          |  30 ++
 meta/recipes-multimedia/speex/speex_1.2.0.bb  |   4 +-
 20 files changed, 500 insertions(+), 54 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2021-45960.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2021-46143.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-22822-27.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/systemd-notify.weston-start
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate
 create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
 create mode 100644 meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch

-- 
2.25.1


