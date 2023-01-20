Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C199C004D4
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 02:36:45 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.65413.1674182197886266870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 18:36:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=45riyAZ+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso3632681pjf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 18:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n6ElyreNnqeCyDjzzOH5piCXMqNS5wenilvEKZq+/Yg=;
        b=45riyAZ+xo7cHT2AjDJxb//TvCh1iXAqYolzVYjjAAjOV5Lo2CHtEwCM99BBASLn0Q
         3TpQYuav4glIAtMJXAMqulipTfbHNP/YDyCg1yAqKq5lHl9gyte+JKnhsTOs/J4mz2Xq
         8kipXERqMtTDPINTC6Mi0ONDqkyncrUxm+MmXINJk1xo78fVTH3PyrQ96nXQ26D5THx6
         jVhPkT9MXMBDZ/cVWcQ6hAFwzQLmoxxNG4ceUtPz0Ygmd9J0msd3qW5u1eAMaY+LlhGz
         BJONbQZhw0SADpo6WINi1Fb/BL1Npno0g2/9FWgqWpEZu0XeIFL41nt5WfYvQIQFF4Ip
         jMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6ElyreNnqeCyDjzzOH5piCXMqNS5wenilvEKZq+/Yg=;
        b=yoavQw8Dlr84zyoj45wyvKFsVwiOD2SdtIiPmCP9qRzBmb7TQVkEXtu3y7aDFJuEtW
         sWF77Ox8r9h2tG7Jhv58OwyUPUW555qxy1fUN2UzIAw7bINMOKLGCgQI/dQspgAzqdcD
         D1vD8e13sLQC3XVYgAH9AXfoKPAzCa1SW/EP3AxS3He3KYPA+4DqmlG0VsA9J/yHit3U
         OnyfJFEEAtzgpuPbFBUsXKtg3z8VwJUTJVVElG3q6XDbGbj6FwtDEC9s/+wIE5M1NjN/
         FR2XcHjdwSnZuP/YYFaLwfeiXP7J064h3wBLA9FmzBBWrzY+jcDdTjrM28uT2nXav7na
         12cw==
X-Gm-Message-State: AFqh2krTGn7J+IuptKPWb/WXj/RAQQR2gk/bSGtBuN67oqnPLJ1kzDVR
	GZXFdz0AU7+hwwXvy2VUTqqWZKo/sHtwF3d9p6w=
X-Google-Smtp-Source: AMrXdXsbSX8/xGQ+X8Rbd/ijvOhGNxsjPe6oHO9t8oSKcCQWP6KiIkJ70QPgAWlZZV4SK7ghn3BW/Q==
X-Received: by 2002:a05:6a20:438a:b0:b8:d868:111f with SMTP id i10-20020a056a20438a00b000b8d868111fmr11007268pzl.3.1674182196405;
        Thu, 19 Jan 2023 18:36:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id e8-20020aa79808000000b005897f5436c0sm19881274pfl.118.2023.01.19.18.36.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 18:36:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/9] Pull request (cover letter only)
Date: Thu, 19 Jan 2023 16:36:31 -1000
Message-Id: <cover.1674182148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 02:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176178

The following changes since commit 4760fac939a6204e3cb7dcd3699cd9a2508f9dee:

  devtool: process local files only for the main branch (2023-01-12 04:56:26 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Bhabu Bindu (1):
  qemu: Fix CVE-2022-4144

Daniel Gomez (1):
  gtk-icon-cache: Fix GTKIC_CMD if-else condition

KARN JYE LAU (1):
  freetype:update mirror site.

Martin Jansa (1):
  ffmpeg: refresh patches to apply cleanly

Narpat Mali (3):
  python3-setuptools: fix for CVE-2022-40897
  python3-wheel: fix for CVE-2022-40898
  python3-git: fix for CVE-2022-24439

Yash Shinde (1):
  glibc: stable 2.35 branch updates.

Yogita Urade (1):
  libksba: fix CVE-2022-47629

 meta/classes/gtk-icon-cache.bbclass           |   2 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 ...-git-CVE-2022-24439-fix-from-PR-1518.patch |  97 ++++
 ...-git-CVE-2022-24439-fix-from-PR-1521.patch | 488 ++++++++++++++++++
 .../python/python3-git_3.1.27.bb              |   4 +
 ...-of-whitespace-to-search-backtrack.-.patch |  31 ++
 .../python/python3-setuptools_59.5.0.bb       |   1 +
 ...tential-DoS-attack-via-WHEEL_INFO_RE.patch |  32 ++
 .../python/python3-wheel_0.37.1.bb            |   4 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2022-4144.patch             |  99 ++++
 .../freetype/freetype_2.11.1.bb               |   2 +-
 ...c-stop-accessing-out-of-bounds-frame.patch |  19 +-
 ...c-stop-accessing-out-of-bounds-frame.patch |   7 +-
 ...-vp3-Add-missing-check-for-av_malloc.patch |  12 +-
 ...overflow-in-the-CRL-signature-parser.patch |  72 +++
 meta/recipes-support/libksba/libksba_1.6.2.bb |   3 +-
 17 files changed, 848 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1518.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/0001-python3-git-CVE-2022-24439-fix-from-PR-1521.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch
 create mode 100644 meta/recipes-devtools/python/python3-wheel/0001-Fixed-potential-DoS-attack-via-WHEEL_INFO_RE.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
 create mode 100644 meta/recipes-support/libksba/libksba/0001-Fix-an-integer-overflow-in-the-CRL-signature-parser.patch

-- 
2.25.1


