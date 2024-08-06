Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9EFC52D71
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 18:56:03 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.15302.1722970557330294306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 11:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M05IJg2l;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7095bfd6346so582926a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 11:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722970556; x=1723575356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DqwKxvDQv05vf/1Icsb15O4DnMl6xs0y7+bS1NpiE2k=;
        b=M05IJg2l/nkw/saOzrsLwSGCcnpwHtVZChgOoP7j6lXxuX/crTPj+E96S4/2ktMqnj
         cK32jhXIBfgXVFFzzEsXdu2hew+A+m9C0lKgZ5GOvH0iYyi37SbqVMkuW14NmnV+ncPG
         LZhPnTtsXPpqVpyv/I1yy4cZ7GDncSK6RdDYaRm8BI3zpOxHM0Ptjr0Ioh/EMDich7ra
         eXWVLqXSzR6fglZLjRsIgZrUCs+LZUWHbNHAqMK9iMixWdyWTCKgHibGqnhEMvctvivo
         +j4O7ydfYGfBFGIwoa5zryLZojIUZ0U14rZ65blyOwGKAWHNKcFckGaUOZYOR9UkUYHr
         ACuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722970556; x=1723575356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DqwKxvDQv05vf/1Icsb15O4DnMl6xs0y7+bS1NpiE2k=;
        b=DWnlB6AQNWHygR0GtRVfcYX8L9geZ5d5V7O08ZcF/8xEnjziWMyXhG8VKW2IemN2Sx
         gUytBUOuac1jCJKjs4RQFPa+MrV+ctfUATCkVWXj5F07Ua0C+z2ygqsBzMtp2hoeHYB2
         olg+7xgVW5a5uy/JQqF0L+jO/JDXdxNKmlpFnPMBc/yqD3DW2wSicTLV0z2zVct7XSr3
         u3oKDCT7e7Ti9hnGNq2DfreCfAjr5kjDTFbEpJAQj0GvBvlZVQIvNrntyn15LkXQL1L4
         jXOXCh/HvX56eDnyY5VAaGh+Ga/TQv0fV4gAJrhW1Ew/RKiWUFlmcVcNkSbfa1rGSMEL
         vKXw==
X-Gm-Message-State: AOJu0YwH5PoYAuDUjAGjGiUMpJJXWm+dCXEQyEz7uHr0+F+/nNbvq2Tt
	j02W8eMS7EOllq3AwJ7EwEedB7S7VE3RomkwiqpVUoer4IYBmsal
X-Google-Smtp-Source: AGHT+IEg+6lsdNyVMbpfQOAIB78iuHi3ajIeuqfrwBbH2qVTwiiEfxOzwHKpneF16Pv1cxU8VOTc8Q==
X-Received: by 2002:a05:6830:280a:b0:707:1794:6f9c with SMTP id 46e09a7af769-709b996085dmr13380621a34.22.1722970556405;
        Tue, 06 Aug 2024 11:55:56 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a34f6ebcd3sm481988185a.42.2024.08.06.11.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 11:55:55 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8][v2] linux-yocto: introduce v6.10
Date: Tue,  6 Aug 2024 14:55:46 -0400
Message-Id: <cover.1722970092.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 18:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203039

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's v2 of the patch series.

In a similar manner to v1, I've got yocto/yocto-bsp patches along side the
oe-core ones .. just to save us both some synchronization and juggling.

 - the 6.10.3 update contains kconfig changes to fixup some of the
   warnings seen in v1
 - I've updated the parselogs exceptions to fix the issues with
   qemumips*. I didn't run in directly on the AB, so there's a chance
   these will need a tweak.
 - As discussed I've pinned genericarm64 to 6.6 until it is updated
   to 6.10
 - meta-virt has been updated, so xen should be fine now

 - meta-arm/meta-agl will still need updates from their maintainers.

Bruce

The following changes since commit a1c5e16c62f26401be8f5c0673efebfa18ed5abd:

  appstream: add qt6 PACKAGECONFIG option (2024-08-05 14:33:12 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto: introduce 6.10 reference kernel
  linux-yocto/6.10: update to v6.10
  linux-yocto/6.10: update to v6.10.2
  linux-yocto/6.10: update to v6.10.3
  oeqa/runtime/parselogs: update pci BAR ignore for kernel 6.10
  oeqa/runtime/parselogs: mips: skip sysctl warning
  yocto-bsp: set temporary preferred version for genericarm64
  poky/poky-tiny: bump preferred version to 6.10

 meta-poky/conf/distro/poky-tiny.conf          |    2 +-
 meta-poky/conf/distro/poky.conf               |    4 +-
 meta-yocto-bsp/conf/machine/genericarm64.conf |    1 +
 .../cases/parselogs-ignores-mipsarch.txt      |    6 +
 .../cases/parselogs-ignores-qemuall.txt       |    8 +
 .../linux/cve-exclusion_6.10.inc              | 6660 +++++++++++++++++
 .../linux/linux-yocto-rt_6.10.bb              |   48 +
 .../linux/linux-yocto-tiny_6.10.bb            |   33 +
 meta/recipes-kernel/linux/linux-yocto_6.10.bb |   73 +
 9 files changed, 6832 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/cve-exclusion_6.10.inc
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.10.bb

-- 
2.39.2


