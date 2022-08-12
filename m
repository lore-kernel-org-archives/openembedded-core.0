Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CBCC00140
	for <webhook@archiver.kernel.org>; Fri, 12 Aug 2022 21:12:01 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.2391.1660338720842653348
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 14:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=6Aw6LYpI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 s5-20020a17090a13c500b001f4da9ffe5fso9374589pjf.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 14:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=pqi2gJl0JuLLD4zj9+OSflnanEfcZvAKw2an1rBSoPU=;
        b=6Aw6LYpIaoizf8jq7wqark6Tri/xF7URDMaLBhFqipVbC6YfQvb67K27YGuikcFXRT
         Q6t+v2YYsBdk1DeBakhXxRBDlIbNpzmDkRO904juc1uqcP6I91NzCRsyNNmIE+Tl8seh
         5DTsppbSAf+hQG5gPhO75zB/mfhqdJZLH7UeNMG24P4OeSvqNfw0nY3E3YCTJrKFM3Sl
         qGbup5mMz1pIeet8G/FtXmA8SG8MrPgX24b+Fbvkmc1LgN2Zkk+v+DiTqzLk8iKX//Pp
         u544fMZshROjChcb7It4wLE/tL7iA8OqTEsloLhaUtCzruGZS8vmKBSf7crFbTsM6xY+
         PbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=pqi2gJl0JuLLD4zj9+OSflnanEfcZvAKw2an1rBSoPU=;
        b=ZItRPn9lQf5s2SeU4VhnFqssOWpDDLDGF6mZeTPcn62F7qEEpPv34zbIi0xHQT20nX
         poTaCcEE2NqUN8viLt3o6EfkaaV6Z7weqCEp0WvqaQmYe0qGMoLGFBpZrpDx2JiIm1BL
         Q3+H4poHOA0YoUrwcR9u7/WJiAFKexTkMHaR7QUdZIKFHD2o+2DTXdHob4FRtVtI/dLV
         T0z50Sb0klX0rdIKk5uuwNbEm9osxLNU/6WvgY8MsiG/XJIUnP4u1ZElAlD6EUrloNYk
         PpYsOq19WzXzR7m9HRlbw/5/Z4di0UPGrY7pza50zKC8zd6CKJHY8U1MJctbyCfsVi05
         MKKA==
X-Gm-Message-State: ACgBeo3jw3Aljn+H8rcYy3KIp6DwoypAMqNeMdQM4vhB4uc3m7EJQhED
	/eF29xOxPbdbKTYCRzkC/2um6ObOlkDG14oO
X-Google-Smtp-Source: 
 AA6agR7ZwiapCfLNBo/v+XYR6IMZexoM3JqP7RnjlymYVtae5brSKtJTZDZGaLA3oajq7VG3LC+NNQ==
X-Received: by 2002:a17:903:2286:b0:16e:ef47:4013 with SMTP id
 b6-20020a170903228600b0016eef474013mr5931233plh.120.1660338719701;
        Fri, 12 Aug 2022 14:11:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h7-20020a170902680700b0016f0c2ea158sm2197192plk.157.2022.08.12.14.11.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 14:11:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Pull request (cover letter only)
Date: Fri, 12 Aug 2022 11:11:51 -1000
Message-Id: <cover.1660338639.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Aug 2022 21:12:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169293

The following changes since commit 73d2b640ad665f6ff3c4fbe8f5da4ef0dbb175f2:

  libtirpc: CVE-2021-46828 DoS vulnerability with lots of connections (2022-07-28 06:26:48 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alex Kiernan (1):
  openssh: Add openssh-sftp-server to openssh RDEPENDS

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.208
  linux-yocto/5.4: update to v5.4.209

Hitendra Prajapati (2):
  grub2: Fix several security issue of integer underflow
  gdk-pixbuf: CVE-2021-46829 a heap-based buffer overflow

Jose Quaresma (1):
  gstreamer1.0: use the correct meson option for the capabilities

Khem Raj (1):
  libmodule-build-perl: Use env utility to find perl interpreter

Martin Jansa (1):
  libxml2: Port gentest.py to Python-3

Richard Purdie (1):
  insane: Fix buildpaths test to work with special devices

Ross Burton (1):
  cve_check: skip remote patches that haven't been fetched when
    searching for CVE tags

Steve Sakoman (1):
  selftest: skip virgl test on fedora 36

 meta/classes/insane.bbclass                   |   6 +-
 meta/lib/oe/cve_check.py                      |   5 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +
 .../grub/files/CVE-2022-28733.patch           |  60 ++
 .../grub/files/CVE-2022-28734.patch           |  67 ++
 .../grub/files/CVE-2022-28736.patch           | 275 ++++++
 meta/recipes-bsp/grub/grub2.inc               |   3 +
 .../openssh/openssh_8.2p1.bb                  |   2 +-
 .../0001-Port-gentest.py-to-Python-3.patch    | 813 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  11 +
 .../perl/libmodule-build-perl_0.4231.bb       |   1 +
 .../gdk-pixbuf/CVE-2021-46829.patch           |  61 ++
 .../gdk-pixbuf/gdk-pixbuf_2.40.0.bb           |   1 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../gstreamer/gstreamer1.0_1.16.3.bb          |   2 +-
 17 files changed, 1321 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28733.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28734.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28736.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-Port-gentest.py-to-Python-3.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-46829.patch

-- 
2.25.1


