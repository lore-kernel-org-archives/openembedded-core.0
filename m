Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BA7C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 23:10:54 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.70.1646781053409361209
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 15:10:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=fw8gEGw2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id cx5so730624pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 15:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fkOzQXHlcXXgTPUYJ+RKRbWi0Qga1tIk4+rHw8irOXg=;
        b=fw8gEGw2c0Cy2ZgX61XFwjBL5LGiIa5C+9+2j1C4zc23bIJ6xnKptOhaDeMSJwhfMW
         k+27CEimgLmlPs1/lfLKuCNm89Kx3uPCyCeHOmuqBWPFRdF4RtQK/miDSbcG28pIvY4w
         Z7Z9apZITXcA+QIYHVS8YJVSrG++lbW5ZIWKHv9H/sMa3ea+OP81dGEyblBOs1u/Z7KY
         iTRRafB+e0SmGiq0J1gIx8Bh/XFtR4BONbAGo5G/zopxjha+2H+xFuuKEVMVHoyto7Xi
         H8oULkYcS7ulgzdeh8U6iOa+KtO0QaD343a8UaOdQ4UUtP79f8UapwwwUTAYTexirUJb
         euLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fkOzQXHlcXXgTPUYJ+RKRbWi0Qga1tIk4+rHw8irOXg=;
        b=59Af3wy89u+XezfeMdLDuMwALkgvUW8GqPI6hfpFFOThzYhphudT2ONgAc0QYAAuUI
         r0we0JgNNLfHohDyPsb2oqwSRga71ZnrABnVeV1UvzL+HvQmu13GCwedWF7oVo1EpT77
         UXjS9MkCk65EAh5yHs1INr6Ye2OTFnxdG7Nfb4eQodk6g7ojukORLFK4gfFIrsYW9XZo
         g5kH54wyFbmmSsDcGShOqeBfER/6eCu88i63n6VGrbW3WflfIqx2hdVmBoOqUpz4osGQ
         Xv3BL7H48xP+z5C02g5Vl4gCz9lwJtF2PJFXGnlmBuignKcUR1UZSBCAp9FVJmnIqdxY
         Su3A==
X-Gm-Message-State: AOAM532sFM5BW0YDmkPzFQ7cV6Ktv2GlzmUXXGuCEjOgSEXoRG9omDy3
	IcxshRBjGECz34V3DEN/MLOQvfukslTOwfQUHsg=
X-Google-Smtp-Source: 
 ABdhPJxoamYCZGWigl38JWfkNy3pSQte9sk5Zy8lW345gqKae2Nr7NvCywN5AFqZr++KM1WFsUz/5w==
X-Received: by 2002:a17:902:ec8f:b0:152:939:ac45 with SMTP id
 x15-20020a170902ec8f00b001520939ac45mr3854569plg.61.1646781051775;
        Tue, 08 Mar 2022 15:10:51 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 y12-20020a17090a390c00b001bf7b033e21sm163759pjb.8.2022.03.08.15.10.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 15:10:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/18] Pull request (cover letter only)
Date: Tue,  8 Mar 2022 13:10:37 -1000
Message-Id: <cover.1646780968.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 23:10:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162945

The following changes since commit 79ce9059f716546a7d6f4562ba194aedd90c22cd:

  grub: add a fix for a crash in scripts (2022-02-23 05:00:42 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Jose Quaresma (1):
  buildhistory.bbclass: create the buildhistory directory when needed

Marek Vasut (1):
  bootchart2: Add missing python3-math dependency

Michael Halstead (1):
  uninative: Upgrade to 3.5

Minjae Kim (2):
  go: fix CVE-2022-23806
  go: fix CVE-2022-23772

Nathan Rossi (1):
  cml1.bbclass: Handle ncurses-native being available via pkg-config

Richard Purdie (2):
  libxml-parser-perl: Add missing RDEPENDS
  uninative: Add version to uninative tarball name

Ross Burton (3):
  coreutils: remove obsolete ignored CVE list
  cve-check: get_cve_info should open the database read-only
  Revert "cve-check: add lockfile to task"

Steve Sakoman (5):
  expat: fix CVE-2022-25235
  expat: fix CVE-2022-25236
  expat: fix CVE-2022-25313
  expat: fix CVE-2022-25314
  expat: fix CVE-2022-25315

Virendra Thakur (1):
  libarchive: Fix for CVE-2021-36976

wangmy (1):
  wireless-regdb: upgrade 2021.08.28 -> 2022.02.18

 meta/classes/buildhistory.bbclass             |   1 +
 meta/classes/cml1.bbclass                     |   8 +
 meta/classes/cve-check.bbclass                |   4 +-
 meta/classes/uninative.bbclass                |   2 +-
 meta/conf/distro/include/yocto-uninative.inc  |  11 +-
 meta/recipes-core/coreutils/coreutils_8.31.bb |   3 -
 .../expat/expat/CVE-2022-25235.patch          | 283 +++++++++++++++
 .../expat/expat/CVE-2022-25236.patch          | 129 +++++++
 .../expat/CVE-2022-25313-regression.patch     | 131 +++++++
 .../expat/expat/CVE-2022-25313.patch          | 230 +++++++++++++
 .../expat/expat/CVE-2022-25314.patch          |  32 ++
 .../expat/expat/CVE-2022-25315.patch          | 145 ++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |   6 +
 .../bootchart2/bootchart2_0.14.9.bb           |   2 +-
 meta/recipes-devtools/go/go-1.14.inc          |   2 +
 .../go/go-1.14/CVE-2022-23772.patch           |  50 +++
 .../go/go-1.14/CVE-2022-23806.patch           | 142 ++++++++
 .../perl/libxml-parser-perl_2.46.bb           |   1 +
 .../libarchive/CVE-2021-36976-1.patch         | 321 ++++++++++++++++++
 .../libarchive/CVE-2021-36976-2.patch         | 121 +++++++
 .../libarchive/CVE-2021-36976-3.patch         |  93 +++++
 .../libarchive/libarchive_3.4.2.bb            |   6 +-
 ....08.28.bb => wireless-regdb_2022.02.18.bb} |   2 +-
 23 files changed, 1711 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25235.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25236.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25313-regression.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25313.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25314.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-25315.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-23772.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-23806.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-36976-1.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-36976-2.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2021-36976-3.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2021.08.28.bb => wireless-regdb_2022.02.18.bb} (94%)

-- 
2.25.1


