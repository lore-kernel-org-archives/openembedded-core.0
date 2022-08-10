Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A29C25B0E
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 22:32:41 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.975.1660170740813231156
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qmwdy9Lf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id
 e8-20020a17090a280800b001f2fef7886eso3484352pjd.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=Rme7T2mMikrORZf/S+SkEuqAldvunt/9WRxNtw3WKzU=;
        b=qmwdy9LfRbq8qSUYnyBdpeNWgEhtjMbNy4xY3lE7GYxiZfzk1FwCJOXOHJv1Ckg5J7
         cxNupWrNMNQ6iAAuvIoQrAcofCF/kCRcEzdwgWCG9ajPv/pKMHe0sgtlA+tUDPQwVI/a
         GHwHneWZ5Ujiib1MxboPYCmdFG3WV7++h7/lAYOPRnOoRnesESYeO0ni2+1ZHlsGyftt
         9GJNbrZkBhZ/nq3ar/GsFFYq1rueRq+52g6bu2psTUo6RNbyoNBRylKANBXVBebSc9jS
         aTSPwyc+GBVaxHTELXvx64a1fPq6KLPThfLQDAa9Vy49JqOq/PUBul4Dug0Dbh7VDfvM
         nyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=Rme7T2mMikrORZf/S+SkEuqAldvunt/9WRxNtw3WKzU=;
        b=DkG7ErXm4lX44J63gpjqAWqQHwCEHTCOen8DscUIxO10Bh3exIIAJ3K0/pvDQ/+2jW
         +H7zV4vam4AaptzaLmyx4Gx20PENFxq+GhU12ht+9E82O63x3zwAyhjVBzwdPcZgM8Lv
         AOEtHJLCbgbor2EwuR9xRxiF2e7Uh/6pmr+51aj1wIiMgErhtjW5vMwCEgyF1Yms1C0X
         u4YDGt6tXgLI6qA5kNNfsB9fhKlEfYMzrsgx3ciNWUF9TtqSEbdQVp9fWG9egrqbqJfz
         uH3uFCp0TNVfrEsuTkFyFaNIbRHLF0Rna5uCNbxA4fosMXr1yaIRzcJyJpDOg271dBEH
         yf1w==
X-Gm-Message-State: ACgBeo2dCcXIni1sPfYN6Z1oVdyA8wH/Cz3hMi/7V91qvhX/4sBTGEoD
	TNMF7xsTZukglusJwJSU0y2QKzue/XYOPoh6
X-Google-Smtp-Source: 
 AA6agR7yfyttyKpkP3brADw94OyyCtZmIr7WXTEiVU+mofk65KB7Xlk3507cuPux/sOJczTgOSzPyw==
X-Received: by 2002:a17:903:292:b0:16d:5e43:bd9e with SMTP id
 j18-20020a170903029200b0016d5e43bd9emr30594211plr.116.1660170739577;
        Wed, 10 Aug 2022 15:32:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x14-20020aa79ace000000b0052d7606d144sm2532513pfp.74.2022.08.10.15.32.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 15:32:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Patch review
Date: Wed, 10 Aug 2022 12:31:58 -1000
Message-Id: <cover.1660170592.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 22:32:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169213

Please review this set of patches for dunfell and have comments back by
end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4058

The following changes since commit 73d2b640ad665f6ff3c4fbe8f5da4ef0dbb175f2:

  libtirpc: CVE-2021-46828 DoS vulnerability with lots of connections (2022-07-28 06:26:48 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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


