Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB61C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 22:49:03 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.1163.1656024539004614372
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 15:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=DzeJ4nTU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id w6so937037pfw.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 15:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O5tbVCSh1Z3odKBkQe23BxzZ/Ryi1w7LB1hWyaJlkkY=;
        b=DzeJ4nTUzPxL+JYFM0u1Xu2r/wUtAtcgzCI7tRhX/KzLDybJxz54VgXN2w1D8j1dXL
         wQBcD7EFCeTNsc7x9IYXK5MIQYwddEMP3EuN7DqggyfUtjZP5aG0vuK4/1u6PTa+ra0O
         tGZ1dZiXwmNXpUub89We54GG5NqBhl7wNWApxV/vPeYvCbvxDlr85rxpmJAV99PrJHxO
         W76azXjHKaS9zdRi21YhBrZoXLbI9RdphtdA3DjnhDP9tpOLhVjjjYyBqVHWvYwtpfIq
         iUtBzmqy3VoD3m2iyMpzFMtS0LHMQjeIt3rOC8/Zq0ibY0FLI0fUN6bWhVeIBamdttut
         1oZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O5tbVCSh1Z3odKBkQe23BxzZ/Ryi1w7LB1hWyaJlkkY=;
        b=EJV2xxmG1P4HO66Rzzr//DMj/0nWfbNWv8Dv42aTV4X32sQ6gi4R9zAy433G/Dqpq9
         DWO2KuP886gtbqfhdtqu8Ws7saGAC7SYCV2hFd5G5q/q8uvE14mU777PIVwoy6Jas6tQ
         szqJJihnqJGkCasfs6aWUj7VQ4lk59xe58xrQv/citkzPeDbugCPknWmmnI6TzEfRSm6
         rKQpPOYVoaAwCueDjqNohvf+4L0sTCmO+jhtwbDxd8arl59106BVpt+db+PeoTfJCY7l
         lN6qesZgpW+HzG6iqxVS2qCr8UjRuBWI17v4b9Cy8JRw6j2dVGleCbM0ZLgJsga79Bch
         0Dtw==
X-Gm-Message-State: AJIora9+KOESEe9JT1O8A6MMG3SP52uihuXsYbyQ9sQUWiEtSDnwC25a
	9qrFtdqecwOy7ke2avOse4Y1oaIdkRFUJQv4
X-Google-Smtp-Source: 
 AGRyM1tNjcw/v6T0psh1VS/2jAJqfvSjuqyR8Was2CwdtG4tWmH20O76JU9fah12phUTy5aYmPjnRQ==
X-Received: by 2002:a65:6d89:0:b0:3fa:5523:440e with SMTP id
 bc9-20020a656d89000000b003fa5523440emr9422074pgb.318.1656024537883;
        Thu, 23 Jun 2022 15:48:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f13-20020a170902684d00b0015e8d4eb2ddsm136816pln.295.2022.06.23.15.48.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 15:48:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/13] Pull request (cover letter only)
Date: Thu, 23 Jun 2022 12:48:49 -1000
Message-Id: <cover.1656024452.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 22:49:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167285

This the final oe-core pull request for the 4.0.2 release.

The following changes since commit b2d10487f80deb04a0893325a1ae79c8629a7655:

  liberror-perl: Update sstate/equiv versions to clean cache (2022-06-17 05:02:15 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexander Kanavin (1):
  python3: use built-in distutils for ptest, rather than setuptools'
    'fork'

Davide Gardenal (1):
  efivar: add musl libc compatibility

Dmitry Baryshkov (2):
  linux-firmware: add support for building snapshots
  linux-firmware: upgrade 20220509 -> 20220610

Marta Rybczynska (2):
  cve-check: add support for Ignored CVEs
  oeqa/selftest/cve_check: add tests for Ignored and partial reports

Martin Jansa (1):
  mesa: backport a patch to support compositors without
    zwp_linux_dmabuf_v1 again

Michael Opdenacker (1):
  rootfs-postcommands.bbclass: correct comments

Nick Potenski (1):
  systemd: systemd-systemctl: Support instance conf files during enable

Paulo Neves (2):
  python: Avoid shebang overflow on python-config.py
  gtk-doc: Fix potential shebang overflow on gtkdoc-mkhtml2

Richard Purdie (2):
  python3: Remove problematic paths from sysroot files
  python3: Ensure stale empty python module directories don't break the
    build

 meta/classes/cve-check.bbclass                |  43 ++--
 meta/classes/rootfs-postcommands.bbclass      |   8 +-
 meta/lib/oeqa/selftest/cases/cve_check.py     |  82 ++++++++
 .../efisecdb-fix-build-with-musl-libc.patch   | 184 ++++++++++++++++++
 meta/recipes-bsp/efivar/efivar_38.bb          |   3 +-
 .../systemd/systemd-systemctl/systemctl       |  14 +-
 ...shebang-overflow-on-python-config.py.patch |  33 ++++
 .../python3/deterministic_imports.patch       |  32 +++
 .../recipes-devtools/python/python3/run-ptest |   2 +-
 .../recipes-devtools/python/python3_3.10.4.bb |  12 +-
 meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb  |   1 +
 ...nd-deprecate-drm_handle_format-and-d.patch | 158 +++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |   1 +
 ...01-Makefile-replace-mkdir-by-install.patch |  84 --------
 ...20220509.bb => linux-firmware_20220610.bb} |  11 +-
 15 files changed, 555 insertions(+), 113 deletions(-)
 create mode 100644 meta/recipes-bsp/efivar/efivar/efisecdb-fix-build-with-musl-libc.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
 create mode 100644 meta/recipes-devtools/python/python3/deterministic_imports.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch
 delete mode 100644 meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220509.bb => linux-firmware_20220610.bb} (99%)

-- 
2.25.1


