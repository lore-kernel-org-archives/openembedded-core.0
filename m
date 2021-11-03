Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3C3C433F5
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 00:11:36 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.907.1635898295727318719
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 17:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Dd0hxklx;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id n23so792607pgh.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 17:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=St9AdQ4YN5eH4tIDCc9fypJ18nriJfEqqSDnLvDJ7go=;
        b=Dd0hxklxsw1tqBhq6/78BnkiMQheB/r+8friEtQBZSd77BviQ49cS8XknwjL9vvhG1
         3ETj/dEFJkiFsr+rFw49HetAX82oYBoYxK940J7HeBS3my4LVaBK9XtQ7DT6GQHM28ZY
         3BZGaH5pbVf3rksuzpMG9YSvz9IDYMIh41zhO7ibHNAlWDqGfL1qWqQnakBVPrElg3Sg
         nVKDBYBQ1YMLO59rENXQIC2BQ1prFm18ROk+wmzdxecsw1BfEms686ZnqM3+e7unZOUf
         bpvj+mbjBk8Q1N9GAW14K2pLZVkfSZzbS5Shv8MgKiyDesWLLRGqsXsk0uuDNmr+pgMc
         S6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=St9AdQ4YN5eH4tIDCc9fypJ18nriJfEqqSDnLvDJ7go=;
        b=aDTXviqy3MrtsR9ePjX+GkmGt/vqJXJQqoSnhWgc/J0BIOb2v1atfCn8R/UgH8OL/i
         77V2Stahl6l6ty+IWmLoSUTTCXjdAkxr4RHiaS+UUX397vsOF96Uwtj8J1mcEgfdgsQw
         ny31dc8K+4ieXcbt3pEVfk6KfBCIZxkRe36KZeO4yL6rA1oEkmfCGpyDEWpUoomX8Pg+
         /P41ffR1quv11I7MLCaEYgIaSO/XrlhQ8GwpOrW69TrI/kTxM12sYHQ0kYJ1JivNGGyT
         zTJoSeBL0janDH5Nh8AZbBncUSsdWZjPtLCHu2PV5fEQ4W07eGeb5/mbeenwefnhI+QK
         GqFQ==
X-Gm-Message-State: AOAM5315huLzjIqrQzi92Ajr6Mm7zou+vWezxNUQ0C+Vn/yigL8BXFbg
	qQ7zXdN3ZQ55yEk++M+6NeIcG/NnkErww+8q0TE=
X-Google-Smtp-Source: 
 ABdhPJzz0loJmlEuzjelqe8SgVkdQoLS+nf7ZxAz9DUe5zwkiEjEWYYaeLqmGeyW+nDl6fJd1AYp/Q==
X-Received: by 2002:a05:6a00:16d2:b029:300:200b:6572 with SMTP id
 l18-20020a056a0016d2b0290300200b6572mr40326688pfc.62.1635898294058;
        Tue, 02 Nov 2021 17:11:34 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g16sm289644pfj.5.2021.11.02.17.11.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 17:11:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/29] Pull request (cover letter only)
Date: Tue,  2 Nov 2021 14:11:25 -1000
Message-Id: <cover.1635898227.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Nov 2021 00:11:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157817

The following changes since commit a7520c47573cd166d441e504737492b86f5aa42e:

  selftest/reproducible: adjust exclusion list for dunfell (2021-10-25 13:28:19 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (7):
  linux-firmware: upgrade 20210511 -> 20210818
  linux-firmware: upgrade 20210818 -> 20210919
  wireless-regdb: upgrade 2021.04.21 -> 2021.07.14
  wireless-regdb: upgrade 2021.07.14 -> 2021.08.28
  ca-certificates: update 20210119 -> 20211016
  tzdata: upgrade 2021a -> 2021d
  tzdata: update 2021d -> 2021e

Daniel McGregor (1):
  bitbake.conf: Add gpg-agent as a host tool

Jose Quaresma (1):
  sstate: fix touching files inside pseudo

Minjae Kim (1):
  vim: fix 2021-3796

Oleksandr Kravchuk (1):
  mirrors.bbclass: remove dead infozip mirrors

Ranjitsinh Rathod (1):
  curl: Whitelist CVE-2021-22897

Richard Purdie (5):
  base: Clean up unneeded len() calls
  base: Use repr() for printing exceptions
  reproducible_build: Drop obsolete sstate workaround
  patch: Use repr() with exceptions instead of str()
  git: Fix determinism issue

Ross Burton (8):
  devtool: fix modify with patches in override directories
  sstate: don't silently handle all exceptions in sstate_checkhashes
  oe/license: implement ast.NodeVisitor.visit_Constant
  license.bbclass: implement ast.NodeVisitor.visit_Constant
  oe/utils: log exceptions in ThreadedWorker functions
  testimage: fix unclosed testdata file
  oeqa/runtime: load modules using importlib
  oeqa/runtime: search sys.path explicitly for modules

Steve Sakoman (3):
  waffle: old website is down, update to new project URLs
  stress-ng: convert to git, website is down
  stress-ng: improve reproducibility

Teoh Jay Shen (1):
  oeqa/runtime/parselogs: modified drm error in common errors list

 meta/classes/base.bbclass                     | 12 +--
 meta/classes/devtool-source.bbclass           |  4 +-
 meta/classes/license.bbclass                  |  4 +
 meta/classes/mirrors.bbclass                  |  1 -
 meta/classes/patch.bbclass                    |  4 +-
 meta/classes/reproducible_build.bbclass       |  4 -
 meta/classes/sstate.bbclass                   | 11 +--
 meta/classes/testimage.bbclass                |  7 +-
 meta/conf/bitbake.conf                        |  2 +-
 meta/lib/oe/license.py                        |  6 ++
 meta/lib/oe/utils.py                          |  3 +-
 meta/lib/oeqa/runtime/cases/parselogs.py      |  2 +-
 meta/lib/oeqa/runtime/context.py              | 29 +++----
 meta/lib/oeqa/selftest/cases/bbtests.py       |  3 -
 meta/recipes-devtools/git/git.inc             |  2 +-
 meta/recipes-devtools/git/git/fixsort.patch   | 36 +++++++++
 ...write-the-timestamp-into-compressed-.patch | 26 ++++++
 .../stress-ng/stress-ng_0.11.17.bb            |  7 +-
 meta/recipes-extended/timezone/timezone.inc   |  7 +-
 meta/recipes-graphics/waffle/waffle_1.6.0.bb  | 12 +--
 ...20210511.bb => linux-firmware_20210919.bb} |  6 +-
 ....04.21.bb => wireless-regdb_2021.08.28.bb} |  2 +-
 ...ertdata2pem.py-print-a-warning-for-e.patch | 80 +++++++++++++++++++
 .../ca-certificates/sbindir.patch             | 26 ------
 ...pdate-ca-certificates-support-Toybox.patch | 33 --------
 ...0210119.bb => ca-certificates_20211016.bb} |  5 +-
 meta/recipes-support/curl/curl_7.69.1.bb      |  5 ++
 .../vim/files/CVE-2021-3796.patch             | 50 ++++++++++++
 28 files changed, 266 insertions(+), 123 deletions(-)
 create mode 100644 meta/recipes-devtools/git/git/fixsort.patch
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210511.bb => linux-firmware_20210919.bb} (99%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2021.04.21.bb => wireless-regdb_2021.08.28.bb} (94%)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20210119.bb => ca-certificates_20211016.bb} (95%)
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3796.patch

-- 
2.25.1


