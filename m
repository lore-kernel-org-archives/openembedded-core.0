Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 844C5C001DE
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 03:48:04 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.25660.1690516084047577316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 20:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ts2LF+h7;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-26814e27a9eso1005655a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 20:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690516083; x=1691120883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pj5XjSITyMCp5ma8HLwb2TuGh394WSZQVtOzwbYs1iY=;
        b=Ts2LF+h7DosasCxjyfw7ok2sf1zFRLCO3mWL7j5p+FJVbzDspW2gC9PX+NF6tKB+MQ
         JlAEfjmCsR7o7jRaw6acWwcnDXy+vILYHrOKWiNG4sbZhX6apZrAWHSbXly3em/wjg8+
         f5JIjuFVuEw5bISp6DbNM+ZTvBMa177Ui3WAXtNZv9ybTeBg0epsuChbOvXrLgh0A+1m
         i7Qa8awiazOfTmH809F3Vso5kIcPMBopi4AEJMyevy5IqC6DT6pA9Hg/5majgqvuo2AK
         MSVoOeTc5phP4M1TNio4nqH/dFx6G8sFGG80k01SOvS2qqTsjfSIZmoXnda1/UNUuDcO
         Cd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690516083; x=1691120883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pj5XjSITyMCp5ma8HLwb2TuGh394WSZQVtOzwbYs1iY=;
        b=euG6g+eLB4TsstcIn7CVizKxzF/inkIcMeNXnYAORKupb0OWu6XaEg9LWLI0yZ0TyK
         F7hlsKT8lVOjxusFmE6eqII+rMYiiLaMVwL1cmx8LWHw9YlbRJ1PACtqypg/ctW+YQx5
         aEkSyynVtyByiqL57jRRWhkTw1vaYuy07nOgEFYfwH38OlorFbBxp/5YnqvH8Q0nvyKK
         iqtpCsY1P4msB9Km5Y3m54Hlud6369XICKRE6fYh0TNRVVw3ejoXfmKVmj+KMabtjidf
         zvha4m3thpcTk6QcMkZudMu4MxUXhqWegN2qGw3zz0jyMvpTgLCsqzOblKNPi466MaLA
         SVAw==
X-Gm-Message-State: ABy/qLb3tEgU47i5x5PVregSuZvlTr20Rvs8o+X3M+aPBN937bY6o9nU
	gk4PuArbe2/qu3hlVmaEa9cdokVH67faOg==
X-Google-Smtp-Source: APBJJlH0miDlD7JCKXIZ5KTtONCYzipqp/T6gQ1dtPB+PFQTPBVK0LffV4QqMtmUgVNBayyj9spGcQ==
X-Received: by 2002:a17:90a:fa81:b0:268:5d00:3751 with SMTP id cu1-20020a17090afa8100b002685d003751mr425644pjb.10.1690516082714;
        Thu, 27 Jul 2023 20:48:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:6180::6608])
        by smtp.gmail.com with ESMTPSA id ms19-20020a17090b235300b00263f446d432sm3460532pjb.43.2023.07.27.20.48.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 20:48:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] Upgrade autoconf to 2.72c
Date: Thu, 27 Jul 2023 20:47:54 -0700
Message-ID: <cover.1690515949.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 03:48:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185007

Khem Raj (3):
  autoconf: Backport upstreamed patches
  Revert "site: merged common-glibc from OE"
  x32-linux: Do not cache ac_cv_sys_file_offset_bits

Richard Purdie (1):
  autoconf: Upgrade to 2.72c

 .../gettext-0.21.1/autoconf-2.73.patch        |  41 ++
 meta/recipes-core/gettext/gettext_0.21.1.bb   |   1 +
 ...ilers-that-moan-about-K-R-func-decls.patch | 138 ------
 ...-prototypes-more-prominently-in-NEWS.patch |  36 ++
 ...d-run-make-fetch-which-updated-these.patch | 123 ++++++
 .../0003-NEWS-Tighten-up-wording.patch        |  29 ++
 ...to-programs-misusing-AC_EGREP_HEADER.patch |  82 ++++
 ...-Fix-timing-bug-on-high-speed-builds.patch |  75 ++++
 ...7-Support-underquoted-callers-better.patch |  57 +++
 ...-for-building-inside-Guix-containers.patch |  54 +++
 ..._DIR-Rewrite-using-AC_CANONICAL_HOST.patch |  82 ++++
 ...PE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch |  77 ++++
 ..._TRADITIONAL-a-compatibility-alias-f.patch | 180 ++++++++
 ...TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch | 328 ++++++++++++++
 ...-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch |  84 ++++
 ...st-few-internal-uses-of-AC_EGREP_CPP.patch | 116 +++++
 ...0015-Support-circa-early-2022-Gnulib.patch |  32 ++
 ...year2038-largefile-option-processing.patch | 121 ++++++
 ...Fix-configure-failure-on-32-bit-ming.patch |  30 ++
 ...18-Document-limitation-of-BusyBox-tr.patch |  45 ++
 ...REQUIRED-Fix-configure-failure-with-.patch |  48 +++
 .../0020-Tone-down-year-2038-changes.patch    | 405 ++++++++++++++++++
 ...-AC_FUNC_MMAP-to-more-modern-systems.patch |  98 +++++
 .../0022-Fix-port-of-AC_FUNC_MMAP.patch       |  91 ++++
 ..._SYS_YEAR2038_RECOMMENDED-diagnostic.patch |  38 ++
 .../0024-Improve-AC_FUNC_MMAP-comments.patch  |  29 ++
 ...S_LARGEFILE-on-GNU-Linux-alpha-s390x.patch |  62 +++
 .../backports/0026-Modernize-INSTALL.patch    | 270 ++++++++++++
 .../0027-doc-fix-broken-cross-refs.patch      |  58 +++
 ...build-host-target-and-the-system-typ.patch | 224 ++++++++++
 .../0029-Shorten-and-improve-INSTALL.patch    | 366 ++++++++++++++++
 .../{autoconf_2.71.bb => autoconf_2.72c.bb}   |  40 +-
 .../bison/bison/autoconf-2.73.patch           |  15 +
 meta/recipes-devtools/bison/bison_3.8.2.bb    |   1 +
 meta/recipes-extended/findutils/findutils.inc |   1 +
 .../findutils/findutils/autoconf-2.73.patch   |  15 +
 .../gzip/gzip-1.12/autoconf-2.73.patch        |  15 +
 meta/recipes-extended/gzip/gzip_1.12.bb       |   1 +
 .../libarchive/libarchive/configurehack.patch |  45 ++
 .../libarchive/libarchive_3.6.2.bb            |   1 +
 .../libpipeline/autoconf-2.73.patch           |  15 +
 .../libpipeline/libpipeline_1.5.7.bb          |   1 +
 .../man-db/files/autoconf-2.73.patch          |  15 +
 meta/recipes-extended/man-db/man-db_2.11.2.bb |   1 +
 .../parted/files/autoconf-2.73.patch          |  13 +
 meta/recipes-extended/parted/parted_3.6.bb    |   1 +
 .../apr/apr/autoconf-2.73.patch               |  23 +
 meta/recipes-support/apr/apr_1.7.4.bb         |   1 +
 meta/site/common-glibc                        |   1 -
 meta/site/x32-linux                           |   1 -
 50 files changed, 3482 insertions(+), 144 deletions(-)
 create mode 100644 meta/recipes-core/gettext/gettext-0.21.1/autoconf-2.73.patch
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/0001-Port-to-compilers-that-moan-about-K-R-func-decls.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0001-mention-prototypes-more-prominently-in-NEWS.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0002-build-run-make-fetch-which-updated-these.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0003-NEWS-Tighten-up-wording.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0004-Cater-to-programs-misusing-AC_EGREP_HEADER.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0006-Fix-timing-bug-on-high-speed-builds.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0007-Support-underquoted-callers-better.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0008-New-script-for-building-inside-Guix-containers.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0009-AC_XENIX_DIR-Rewrite-using-AC_CANONICAL_HOST.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0010-AC_TYPE_UID_T-Rewrite-using-AC_CHECK_TYPE.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0011-Make-AC_PROG_GCC_TRADITIONAL-a-compatibility-alias-f.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0012-Overhaul-AC_TYPE_GETGROUPS-and-AC_FUNC_GETGROUPS.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0013-Fold-AC_C_STRINGIZE-into-AC_PROG_CC.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0014-Remove-the-last-few-internal-uses-of-AC_EGREP_CPP.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0015-Support-circa-early-2022-Gnulib.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0016-Improve-year2038-largefile-option-processing.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0017-AC_SYS_YEAR2038-Fix-configure-failure-on-32-bit-ming.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0018-Document-limitation-of-BusyBox-tr.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0019-AC_SYS_YEAR2038_REQUIRED-Fix-configure-failure-with-.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0020-Tone-down-year-2038-changes.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0021-Port-AC_FUNC_MMAP-to-more-modern-systems.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0022-Fix-port-of-AC_FUNC_MMAP.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0023-Improve-AC_SYS_YEAR2038_RECOMMENDED-diagnostic.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0024-Improve-AC_FUNC_MMAP-comments.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0025-Fix-AC_SYS_LARGEFILE-on-GNU-Linux-alpha-s390x.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0026-Modernize-INSTALL.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0027-doc-fix-broken-cross-refs.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0028-INSTALL-Clarify-build-host-target-and-the-system-typ.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/backports/0029-Shorten-and-improve-INSTALL.patch
 rename meta/recipes-devtools/autoconf/{autoconf_2.71.bb => autoconf_2.72c.bb} (52%)
 create mode 100644 meta/recipes-devtools/bison/bison/autoconf-2.73.patch
 create mode 100644 meta/recipes-extended/findutils/findutils/autoconf-2.73.patch
 create mode 100644 meta/recipes-extended/gzip/gzip-1.12/autoconf-2.73.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/configurehack.patch
 create mode 100644 meta/recipes-extended/libpipeline/libpipeline/autoconf-2.73.patch
 create mode 100644 meta/recipes-extended/man-db/files/autoconf-2.73.patch
 create mode 100644 meta/recipes-extended/parted/files/autoconf-2.73.patch
 create mode 100644 meta/recipes-support/apr/apr/autoconf-2.73.patch

-- 
2.41.0


