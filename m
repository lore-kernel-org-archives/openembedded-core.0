Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA1AC43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 02:35:23 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.49167.1658284517275647109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 19:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7gPTC1yt;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id b10so5528331pjq.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 19:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sdANjtUQ8/JdyKSytKZmWzbVdnu+2PHy4R8VWBc85IU=;
        b=7gPTC1ytXlToH0DMa5Ze+s7l+O47a4Gid5c1PE88DKGJI9S7XeYRJ0iWs5G2azh6mv
         7qGs4idADgLlb/0mIaVN6bJq0Hwb0G5DOa1UQV/YlvM7IGDxsFxmhH+bxQ5u1HrXwnyl
         v84+6mGEpgwrN6gn+4qWvmMz6Wk5lTH+0l/jg0lxPeUID2xnwgN5F72LrMuAPetEaceI
         JPeEtQvb7ff7g6Mf7eV6Yi+JPwjQhbfDhKmAf0KrVu2KPO4M03boMJiiGmchBUIGpZBY
         ZgZn0jPp7cKB4yR8OlTr9Hn9q8YH5zLIGIEe8yEA8hj+K1/PqDN0GVBaGMQ3ZNlRoOqt
         iEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sdANjtUQ8/JdyKSytKZmWzbVdnu+2PHy4R8VWBc85IU=;
        b=Gm1775tkiXuvsIFkedrc4vpQN57o3JLBZTOZhTQsQIFbpOvm19dfwskjuIi+AyJcPz
         Q9TWu/F+ZRhGAI84Zb2pc9AYDoB1K0w5YPGfMB6dO24L/YXIYEv8n2j+q1w6NnvYbdV4
         mqbRmTeR+gmEA9u1RwPbECYzGlHa7LokIM9r5wmjkoBxbT3AATOP+o/ju3HTQrQIWiUr
         fVsPQVY3DE2vatHHwrohbySOStoRL0HLG4kqajqo+7HktootooP5h3alFqSNuaZ1nw55
         D8y+x2wvlHImwBZfFrxqv4kbRh59Z3Assu5r8ZBOf+0U/45Ie3xfcsis5yuWgq0gpxLe
         0Sbg==
X-Gm-Message-State: AJIora9F3DbvPmevMZdujGCMpx6vYbL6w002FvTqFsRIBmM07cn6brYT
	r/d2tNnGxW6CQESIJnNUBB/9SMARTBeO+35p
X-Google-Smtp-Source: 
 AGRyM1s+teFfj0tnna0omzfb04qRbG6lZjJ59BXRVVCptuSau//k0XCVZAn5f0MvUEAyMeWKOGwwBQ==
X-Received: by 2002:a17:90a:e7c8:b0:1f0:c82:c89d with SMTP id
 kb8-20020a17090ae7c800b001f00c82c89dmr2784735pjb.108.1658284515950;
        Tue, 19 Jul 2022 19:35:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u14-20020a654c0e000000b0040d0a57be02sm10784663pgq.31.2022.07.19.19.35.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 19:35:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/23] Pull request (cover letter only)
Date: Tue, 19 Jul 2022 16:35:01 -1000
Message-Id: <cover.1658284406.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 02:35:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168292

The following changes since commit a4bfb5ceb5cf8c0c6d27225b27ef10c0b9dceccb:

  libsoup: upgrade 3.0.6 -> 3.0.7 (2022-07-13 11:54:16 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Bruce Ashfield (19):
  linux-yocto/5.10: update to v5.10.121
  linux-yocto/5.10: update to v5.10.123
  linux-yocto/5.10: update to v5.10.128
  linux-yocto/5.10: fix build_OID_registry/conmakehash buildpaths
    warning
  linux-yocto/5.10: fix buildpaths issue with gen-mach-types
  linux-yocto/5.10: update to v5.10.130
  linux-yocto/5.10: fix buildpaths issue with pnmtologo
  linux-yocto/5.15: update to v5.15.46
  linux-yocto/5.15: update to v5.15.48
  linux-yocto/5.15: drop obselete GPIO sysfs ABI
  linux-yocto/5.15: update to v5.15.52
  linux-yocto/5.15: fix qemuppc buildpaths warning
  linux-yocto/5.15: fix build_OID_registry buildpaths warning
  linux-yocto/5.15: fix buildpaths issue with gen-mach-types
  linux-yocto/5.15: update to v5.15.54
  linux-yocto/5.15: fix buildpaths issue with pnmtologo
  kernel-devsrc: fix reproducibility and buildpaths QA warning
  kernel-devsrc: ppc32: fix reproducibility
  perf: fix reproducibility in 5.19+

Richard Purdie (4):
  qemu: Fix slirp determinism issue
  qemu: Add PACKAGECONFIG for brlapi
  gperf: Add a patch to work around reproducibility issues
  gperf: Switch to upstream patch

 .../qemu/qemu-system-native_6.2.0.bb          |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 meta/recipes-devtools/qemu/qemu_6.2.0.bb      |   4 +-
 ...c6e57a308a05889c80c048dbc58bdc378dcb.patch | 181 ++++++++++++++++++
 meta/recipes-extended/gperf/gperf_3.1.bb      |   2 +
 meta/recipes-kernel/linux/kernel-devsrc.bb    |   8 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +--
 meta/recipes-kernel/perf/perf.bb              |   6 +
 13 files changed, 238 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-extended/gperf/gperf/1862c6e57a308a05889c80c048dbc58bdc378dcb.patch

-- 
2.25.1


