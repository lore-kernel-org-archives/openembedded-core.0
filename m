Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6562C433EF
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 02:50:50 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.1819.1636771849612089714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 18:50:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nXZxKhaO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id u17so9853432plg.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 18:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yz/lB+rcJALmP+mvX6lrQ8JsW9CzNcWooAMVaEhq7uA=;
        b=nXZxKhaOmO60s8E8JWI0R8aQMEbZJLtpvZOmEroPsqy6c5pKgbS7Zgxbe7Pw4/RbpT
         LMhlx4Y9yqU/tmEuyU/g5shXuHowg0+DdEcF8/A55b6jDQ12KeXMAMebxhBf+TrN66pL
         uxIUUJzRJx2yUHq6/qGexgH0Bium4vBGkharqTOIkz+b2J/U57PRT9anx9qCAfKDXDbz
         zxNy5Eb/FTx5zjJ4jSD8u/9WYxrhzT1FV0seEykWFKfwMV0r5l7ql8iuR+i6F6zSjnwD
         Dk1JhUPtQkaRs9cRotEK9MoO/+lpLkqcCzQkq6Q/Iz8rCdgZcOg9f+Pt98eUhj9LA/8Z
         fceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yz/lB+rcJALmP+mvX6lrQ8JsW9CzNcWooAMVaEhq7uA=;
        b=PomwcVKqmxrECaCRpXvqh5pV+eZ4AtxZRj09jiPzlENXnuaMsgqlbgzHDnILVRuCIy
         f5HybvLqWaxQ77YPoV8yFzpL2rvf30tcDsiuxi8MJ5ZlA2PZXh3mJ9Ej9TfefXYsErUC
         kR3y6yg9qh+9nE9CV/pRmD78NshEpLfRdeRjXnTUrQyXqrJDm+bsoG3xn6AnV8qsHgAP
         3EEi43+nhOAelyR0fVDGbk3x5RpCLEIHFFbNl1mxMfBpJWjeChvqelfdM/GOyJlnowMR
         87Aa4i3VaXiT4wH2HDPhNOnNg8pILLDvWmK4pqc3gBcYEYxkCjZea9jXZfFu28BxT1g3
         a1Ow==
X-Gm-Message-State: AOAM533vMMOJJZtuZLGvWEiBn2h7FNGudPewweACMkfdq3TPqyFYBHhw
	IEstOcfkBbSv0awjEWwUGv0RRvfLuMZn3TEQYmM=
X-Google-Smtp-Source: 
 ABdhPJzChBQ+KzIlBqepdxB3lnK3Bpz/SLEAF6WJxou7Wnukoee/ne8oY5Ggyx1qTj5NWZXQaubcBQ==
X-Received: by 2002:a17:90b:390f:: with SMTP id
 ob15mr24052437pjb.32.1636771848231;
        Fri, 12 Nov 2021 18:50:48 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 w37sm5321740pgk.87.2021.11.12.18.50.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 18:50:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/15] Pull request (cover letter only)
Date: Fri, 12 Nov 2021 16:50:28 -1000
Message-Id: <cover.1636771719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Nov 2021 02:50:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158237

The following changes since commit 38fc0807eea14dc12610da4ba73c082d5a4b0744:

  meta/scripts: Manual git url branch additions (2021-11-03 08:43:53 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Jose Quaresma (1):
  sstate: another fix for touching files inside pseudo

Joshua Watt (1):
  oeqa: reproducible: Fix test not producing diffs

Khem Raj (1):
  webkitgtk: Fix reproducibility in minibrowser

Marek Vasut (1):
  piglit: upgrade to latest revision

Mark Hatle (1):
  reproducible_build: Remove BUILD_REPRODUCIBLE_BINARIES checking

Mingli Yu (1):
  python3-magic: add the missing rdepends

Richard Purdie (7):
  linunistring: Add missing gperf-native dependency
  pseudo: Add in ability to flush database with shutdown request
  pseudo: Add fcntl64 wrapper
  mirrors: Add uninative mirror on kernel.org
  sstate: Ensure SDE is accounted for in package task timestamps
  sstate: Avoid deploy_source_date_epoch sstate when unneeded
  mirrors: Add kernel.org sources mirror for downloads.yoctoproject.org

Steve Sakoman (2):
  python3-magic: add missing DEPENDS
  selftest/reproducible: add webkitgtk back to exclusion list for
    dunfell

 meta/classes/mirrors.bbclass                  |  2 +
 meta/classes/reproducible_build.bbclass       | 53 ++++++++++++-------
 meta/classes/sstate.bbclass                   | 34 +++++++++---
 .../oeqa/selftest/cases/diffoscope/A/file.txt |  1 +
 .../oeqa/selftest/cases/diffoscope/B/file.txt |  1 +
 meta/lib/oeqa/selftest/cases/reproducible.py  | 29 +++++++++-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +-
 .../python/python3-magic_0.4.15.bb            |  7 ++-
 ...ssing-include-for-htobe32-definition.patch | 27 ++++++++++
 ...file.py-make-test-lists-reproducible.patch | 31 +++++++++++
 ...gen_tcs-tes_input_tests.py-do-not-ha.patch | 44 +++++++++++++++
 ...lizer.py-make-.gz-files-reproducible.patch | 30 +++++++++++
 ...sort-the-file-list-before-working-on.patch | 28 ++++++++++
 ...t-shader.c-do-not-hardcode-build-pat.patch | 30 +++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    | 12 ++++-
 .../0001-MiniBrowser-Fix-reproduciblity.patch | 31 +++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.28.4.bb  |  1 +
 .../libunistring/libunistring_0.9.10.bb       |  1 +
 18 files changed, 334 insertions(+), 30 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/diffoscope/A/file.txt
 create mode 100644 meta/lib/oeqa/selftest/cases/diffoscope/B/file.txt
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch

-- 
2.25.1


