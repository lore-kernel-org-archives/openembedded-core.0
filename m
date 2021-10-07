Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E087DC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 00:00:19 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web09.4705.1633564818240136562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 17:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=FDuE6mwA;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 66so3912243pgc.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 17:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f4lpRCWZ17fYOolvIHYM+8+ulmQ6jABTn/NAcGERAbA=;
        b=FDuE6mwAbXrjiSv1mJH9Z5yT1u13qQBsWMG36RWBRW+sNB4cMl1VvNClCeqeAC/xD2
         SA2ZCDkNduhf06O39zeiUJ4biUHAIWrAKC8hD+3eE58hbbuGti8iNrsHrjU30hzzzrfw
         C8xRYbyrLibDgGREH6GwmaoSpg2ucc4dpfnAEPOcECIMQNxui6U4cdaU2fC7M+G1veCo
         wSEYc9A+OO6xVzzDGRlJeH6mcwyaAMMapqBHYUVPPSwqi+TqOjl7T2PxYGALiP9a7J7p
         oE4yE1cvQH0VKMSV2yVO1TCKCkWk4QMhSVAzMutsJlshXRLcKugsSy7ZZ7clWz5AKtit
         IqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f4lpRCWZ17fYOolvIHYM+8+ulmQ6jABTn/NAcGERAbA=;
        b=nYanvTCGyRosUI7jA6W2A32siwrt4q0XkeZnhvHQ8i1yUg02uKKq78JpZCtCaUm3B1
         ROJBF5k6aT4RIsyTAS8DJZbw0xYK8uzg6bD3eIqOHNN3a3mEky0ozaYol9X15+gTsUcE
         sO5o6bmq92C3CIO9BwcIyV1Qqpcd7I/khyfPXmUH9QCIwEa6mh7emIljLnxoKqh0q3C4
         33rPgyHKqHxspB2xFpshFlcjS8lJYEdJBIsOAnCh+adWoTOdr8/o5cMh4nXeWj+VNFkb
         wBI6gXNBDhAFAQioE6X88ZjWJzGIbwEh90fGOFuOjReSuRX1SVPMLE6W2XoCqUNQjGSh
         pt2Q==
X-Gm-Message-State: AOAM531hdwkE2KXh7nYZ2NQy+cxv4OOcAykv6vXaz1m8qoJK7bWppr6+
	OtTBrRrmWxV9+TiZbuxXQQH0ctaCrebCopi6PqY=
X-Google-Smtp-Source: 
 ABdhPJzEeNPzAiklJNKGuu9ZqIsdOaautRM1kzuIvCebB6dWoFMMc/4ZG30zBaj/HPuyBlUrz3R/zA==
X-Received: by 2002:a63:d94b:: with SMTP id e11mr774283pgj.295.1633564816611;
        Wed, 06 Oct 2021 17:00:16 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 r130sm14541730pfc.89.2021.10.06.17.00.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 17:00:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/15] Pull request (cover letter only)
Date: Wed,  6 Oct 2021 14:00:01 -1000
Message-Id: <cover.1633564738.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 00:00:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156704

The following changes since commit 8e7c8e43260682efafabc50c757b9c2daff98f13:

  connman: add CVE_PRODUCT (2021-09-24 04:27:46 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Minjae Kim (1):
  vim: fix CVE-2021-3778

Ranjitsinh Rathod (1):
  systemd: Add fix for systemd-networkd crash during free

Richard Purdie (7):
  mtd-utils: upgrade 2.1.1 -> 2.1.2
  pybootchart: Avoid divide by zero
  oeqa/qemurunner: Use oe._exit(), not sys.exit()
  libc_package/buildstats: Fix python regex quoting warnings
  oeqa/selftest/gotoolchain: Fix temp file cleanup
  oeqa/buildproject: Ensure temp directories are cleaned up
  glew: Stop polluting /tmp during builds

Robert P. J. Day (1):
  common-licenses: add "Unlicense" license file

Stefano Babic (1):
  mtd-utils: upgrade 2.1.2 -> 2.1.3

Tom Pollard (2):
  bzip2: Update soname for libbz2 1.0.8
  libsamplerate0: Set correct soname for 0.1.9

William A. Kennington III (1):
  rm_work.bbclass: Fix for files starting with -

sana kazi (1):
  openssh: Fix CVE-2021-28041

 meta/classes/libc-package.bbclass             |   2 +-
 meta/classes/rm_work.bbclass                  |   8 +-
 meta/files/common-licenses/Unlicense          |  24 ++
 meta/lib/buildstats.py                        |   4 +-
 meta/lib/oeqa/selftest/cases/gotoolchain.py   |   6 +
 meta/lib/oeqa/utils/buildproject.py           |   3 +
 meta/lib/oeqa/utils/qemurunner.py             |   2 +-
 meta/lib/oeqa/utils/targetbuild.py            |   4 +-
 .../openssh/openssh/CVE-2021-28041.patch      |  20 ++
 .../openssh/openssh_8.2p1.bb                  |   1 +
 ...-info-for-ordered-set-new-and-introd.patch |  78 +++++
 ...dered_set_clear-free-with-destructor.patch |  35 +++
 ...etwork-add-skeleton-of-request-queue.patch | 285 ++++++++++++++++++
 ...quests-when-link-enters-linger-state.patch |  50 +++
 ...ork-fix-Link-reference-counter-issue.patch | 278 +++++++++++++++++
 ...nk_drop-and-link_detach_from_manager.patch |  67 ++++
 meta/recipes-core/systemd/systemd_244.5.bb    |   6 +
 ...-utils-Fix-return-value-of-ubiformat.patch |  62 ----
 meta/recipes-devtools/mtd/mtd-utils_git.bb    |   9 +-
 meta/recipes-extended/bzip2/bzip2/Makefile.am |   2 +-
 .../glew/glew/notempdir.patch                 |  19 ++
 meta/recipes-graphics/glew/glew_2.2.0.bb      |   1 +
 .../libsamplerate0/shared_version_info.patch  |  13 +
 .../libsamplerate/libsamplerate0_0.1.9.bb     |   1 +
 .../vim/files/CVE-2021-3778.patch             |  49 +++
 meta/recipes-support/vim/vim.inc              |   1 +
 scripts/pybootchartgui/pybootchartgui/draw.py |   5 +-
 27 files changed, 956 insertions(+), 79 deletions(-)
 create mode 100644 meta/files/common-licenses/Unlicense
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2021-28041.patch
 create mode 100644 meta/recipes-core/systemd/systemd/basic-pass-allocation-info-for-ordered-set-new-and-introd.patch
 create mode 100644 meta/recipes-core/systemd/systemd/introduce-ordered_set_clear-free-with-destructor.patch
 create mode 100644 meta/recipes-core/systemd/systemd/network-add-skeleton-of-request-queue.patch
 create mode 100644 meta/recipes-core/systemd/systemd/network-also-drop-requests-when-link-enters-linger-state.patch
 create mode 100644 meta/recipes-core/systemd/systemd/network-fix-Link-reference-counter-issue.patch
 create mode 100644 meta/recipes-core/systemd/systemd/network-merge-link_drop-and-link_detach_from_manager.patch
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-Fix-return-value-of-ubiformat.patch
 create mode 100644 meta/recipes-graphics/glew/glew/notempdir.patch
 create mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3778.patch

-- 
2.25.1


