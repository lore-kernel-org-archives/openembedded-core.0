Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3C3C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 16:57:33 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.28341.1639501051903304076
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 08:57:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GxbFJGaD;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id r138so17768502pgr.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 08:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iOr9A9aF9Wtwr4u6O9bJDfg02wP12xOhUzCXKG2xsx8=;
        b=GxbFJGaDQsExmegVK/Nf/XVQFCCsPs/nPoGJAXL/CQeUAKmOBEvaMIlHN67DXj2T6L
         r0ecDLmiwMpE6lWhFStDgm7hSM6ZWcnHHwQL+G+cFemith6XlREACS8PDeqyL10wTMhq
         PisxU4D/OMjF44uNdGk4cIhPWI4IXjFkFyj8R5cenOH/VXrUcDEh8DYp9pwWX9CxB0aY
         ZNNjRxnGY94c3wobzpX8ed+xurEzR8vcSPwfRsV/t1EDlmeEy048UYzrMJFAiGRwUvwi
         ni5VCzNj5d+1Tw6IpSIuI/Q/9T31n1G/mVeDVYLncl9OlXvv368HlycD9aNDUdA39ZYG
         vr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iOr9A9aF9Wtwr4u6O9bJDfg02wP12xOhUzCXKG2xsx8=;
        b=Ya4yQAkNXOcDtwsLyVgQHFBJYQgL4/StPQraE14Gb+/PpurA/qgspcFuyvwotfLa6G
         h9xq136hCC57yG8Ow71P+mWm8nRBHk+/ufAvQpAvF8lrkqd6wVzEdk8+ZN8qSiTyz7Tp
         44FJ3HPehiYzRqeozSZaWR20Mg/wbTVBvDVuzxgnxYpFAUiRmlFYvzK4j3HE4QaPPUIh
         7xvLdj09q71YuU1o7CqkWdmRPvwNErCwC9NS8SgKAlNGm9Frz214PFV5LDZjiyxZ3BMo
         RAuUvo+dL3WjENwr+a3+OhQY7dhObNDjTkJ3H3FFyNvq8k47a7mXdVUIduD40q+nLN9J
         +sQw==
X-Gm-Message-State: AOAM531JNCwuuuPaU0xltkBqd7DYhD63vHl1ngdwyiQ46l9aomTA5Gi5
	yOKC79rx9htxxrP+2ydS4LIbShkLhOH3wi5Z
X-Google-Smtp-Source: 
 ABdhPJxwy9bO2T4sAyCFHu4GoWk5ZLMHqj9uYCurZcYnnmtHrqCMEbKvVyv4eC7xlZuBhPjWhLUN5w==
X-Received: by 2002:a05:6a00:1a8d:b0:4ad:df18:8be3 with SMTP id
 e13-20020a056a001a8d00b004addf188be3mr5221817pfv.33.1639501050512;
        Tue, 14 Dec 2021 08:57:30 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 p8sm391768pfo.141.2021.12.14.08.57.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 08:57:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/10] Pull request (cover letter only)
Date: Tue, 14 Dec 2021 06:57:18 -1000
Message-Id: <cover.1639500918.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 16:57:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159699

The following changes since commit f788765e1b9832d0da8ec4ce49aa811115864b0e:

  README.OE-Core.md: update URLs (2021-12-06 04:48:48 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Andrey Zhizhikin (1):
  lttng-modules: do not search in non-existing folder during install

Markus Volk (1):
  wic:direct.py: ignore invalid mountpoints during fstab update

Marta Rybczynska (1):
  libgcrypt: solve CVE-2021-33560 and CVE-2021-40528

Richard Purdie (1):
  gcc: Add CVE-2021-37322 to the list of CVEs to ignore

Ross Burton (1):
  runqemu: check the qemu PID has been set before kill()ing it

Sana Kazi (1):
  busybox: Fix multiple security issues in awk

Stefan Herbrechtsmeier (2):
  recipetool: Set master branch only as fallback
  selftest/devtool: Check branch in git fetch

Steve Sakoman (2):
  cve-extra-exclusions: add db CVEs to exclusion list
  selftest: skip virgl test on centos 8 entirely

 .../distro/include/cve-extra-exclusions.inc   |   9 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   5 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   1 +
 .../busybox/files/CVE-2021-423xx-awk.patch    | 215 ++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-9.3.inc         |   3 +
 .../lttng/lttng-modules_2.11.6.bb             |   4 +-
 .../libgcrypt/files/CVE-2021-33560.patch      | 138 +++++------
 .../libgcrypt/files/CVE-2021-40528.patch      | 109 +++++++++
 .../libgcrypt/libgcrypt_1.8.5.bb              |   1 +
 scripts/lib/recipetool/create.py              |  15 +-
 scripts/lib/wic/plugins/imager/direct.py      |   2 +-
 scripts/runqemu                               |   3 +-
 13 files changed, 408 insertions(+), 99 deletions(-)
 create mode 100644 meta/recipes-core/busybox/files/CVE-2021-423xx-awk.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2021-40528.patch

-- 
2.25.1


