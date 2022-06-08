Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEE4C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 21:50:58 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.3455.1654725056273416841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 14:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=XV6Cp5Gy;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id a10so19799016pju.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 14:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H+JYVgRlhJR2CoWS1AeDIB/KCvBq5vbsT/Qou75FdaU=;
        b=XV6Cp5Gy/asiZHriI2QjERGc3XFnx+rJvDVis3xvrBZI4QNqZidTCvxg50PgchUqPx
         J9XUVQjsQyfJrGyLoXP00+M4SoCnhXOeRLU5nrGXqjpRYMKXW5P1DzgD5CA6ycyw/KmD
         xr6xYDCtSsjnvOsfegdT6x2MvfS0rpckLKN3DP7DhiNQf42UoRTT3KmDO4HR046r/2w0
         cXAwXR0bwk/Ne4q9QctyzlCOJb4WeLKpWeYTbET4BmfuabmD653+GRSiWKkyuTVbawp1
         vfqfNIBnfTjDVtawCnNKSwM6ZDzHzWh67z1oE/lABVITnvowPQazR6S/VTzE3RNhHC4v
         0XZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H+JYVgRlhJR2CoWS1AeDIB/KCvBq5vbsT/Qou75FdaU=;
        b=sa8cFjD/hnig6l6E9fHrbZ2iCCgVhB+9J2F1Pr/YKossajtQvUn+iMlQPMGW/C0Yi+
         +xgYA2TqRHKnoiUv5qP+n4LMMGMNYtUJPGwhAOcZS5PqKh2omZpuVVMhOuEwp3ZOM0Ua
         xxWXkkNvvk8tizH1dYKCWKd1j4hI2PVBcqvmndDvLgPaUNMGgbr0PZ/QWdZzJp1ecgCA
         aw6ljwieeBL1TwAPxkZiI/V0UHkpuRRdAEV0E/1uz5BPBt/l7Ev3gAo9mYzGF/AFXnON
         i8lYtVFBdu5JhqKu9+puAUmnHRDSAyUMSXmvyyksekNa7N5WHKTZp3TtG11vEDe0o/B6
         AiNg==
X-Gm-Message-State: AOAM532pd2HmPTDnYeSawLqlwbMIH4amLVKZ/3gTAhvIiJ4D1tsu3bHe
	Ke//bAczsohJLUuXp4pmEF8b1/m4DLDT5HwF
X-Google-Smtp-Source: 
 ABdhPJwiigU3zMVS8FwTTH1YwstvTU/thTF7Z/SkY9jRSvRNc/zmi95G+cMOthy4Wl9fTc2lZSf0Pw==
X-Received: by 2002:a17:902:cec9:b0:167:8ce9:ec34 with SMTP id
 d9-20020a170902cec900b001678ce9ec34mr12423346plg.147.1654725054707;
        Wed, 08 Jun 2022 14:50:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r2-20020a170903020200b0015e8d4eb1f6sm15205056plh.64.2022.06.08.14.50.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 14:50:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/13] Pull request (cover letter only)
Date: Wed,  8 Jun 2022 11:50:44 -1000
Message-Id: <cover.1654724965.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 21:50:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166757

The following changes since commit e63013cc38b82659658365da53b14952711d6701:

  gcc: Upgrade to 11.3 release (2022-06-02 06:48:32 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexander Kanavin (3):
  bash: submit patch upstream
  valgrind: submit arm patches upstream
  zip/unzip: mark all submittable patches as Inactive-Upstream

Jiaqing Zhao (4):
  systemd: Drop 0001-test-parse-argument-Include-signal.h.patch
  systemd: Remove __compare_fn_t type in musl-specific patch
  systemd: Drop 0002-don-t-use-glibc-specific-qsort_r.patch
  systemd: Correct path returned in sd_path_lookup()

Khem Raj (4):
  systemd: Drop redundant musl patches
  systemd: Document future actions needed for set of musl patches
  systemd: Drop
    0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
  systemd: Update patch status

Martin Jansa (1):
  makedevs: Don't use COPYING.patch just to add license file into ${S}

Richard Purdie (1):
  lzo: Add further info to a patch and mark as Inactive-Upstream

 ...sysctl.d-binfmt.d-modules-load.d-to-.patch |  73 ++++
 ...se-ROOTPREFIX-without-suffixed-slash.patch |  42 ---
 ...test-parse-argument-Include-signal.h.patch |  27 --
 .../0002-Add-sys-stat.h-for-S_IFDIR.patch     |   2 +-
 ...002-don-t-use-glibc-specific-qsort_r.patch | 163 ---------
 ...-missing_type.h-add-comparison_fn_t.patch} |  41 +--
 ...missing.h-check-for-missing-strndupa.patch |  14 +-
 ...008-add-missing-FTW_-macros-for-musl.patch |   3 +
 ..._register_atfork-for-non-glibc-build.patch |   3 +
 ...S_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |  33 --
 ...ype.h-add-__compar_d_fn_t-definition.patch |  28 --
 .../systemd/0019-Handle-missing-LOCK_EX.patch |  24 --
 ...ible-pointer-type-struct-sockaddr_un.patch |  38 --
 .../0021-test-json.c-define-M_PIl.patch       |   4 +
 meta/recipes-core/systemd/systemd_250.5.bb    |  10 +-
 .../makedevs/makedevs/COPYING.patch           | 346 ------------------
 .../makedevs/makedevs/makedevs.c              |   4 +
 .../makedevs/makedevs_1.0.1.bb                |   5 +-
 ...etting-mcpu-to-cortex-a8-on-arm-arch.patch |   2 +-
 ...n-for-targets-which-don-t-support-it.patch |   2 +-
 ...te-march-mcpu-mfpu-for-ARM-test-apps.patch |   2 +-
 .../bash/bash/makerace2.patch                 |   2 +-
 ...ass-LDFLAGS-to-tests-doing-link-step.patch |   2 +-
 .../unzip/unzip/CVE-2021-4217.patch           |   2 +-
 .../unzip/unzip/avoid-strip.patch             |   2 +-
 .../unzip/unzip/define-ldflags.patch          |   2 +-
 .../unzip/unzip/fix-security-format.patch     |   2 +-
 .../unzip/unzip/symlink.patch                 |   2 +-
 ...LAGS-and-LDFLAGS-when-doing-link-tes.patch |   2 +-
 .../zip/zip-3.0/10-remove-build-date.patch    |   2 +-
 .../zip/zip-3.0/fix-security-format.patch     |   2 +-
 .../zipnote-crashes-with-segfault.patch       |   2 +-
 ...Use-memcpy-instead-of-reinventing-it.patch |  10 +-
 33 files changed, 136 insertions(+), 762 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-test-parse-argument-Include-signal.h.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
 rename meta/recipes-core/systemd/systemd/{0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch => 0003-missing_type.h-add-comparison_fn_t.patch} (63%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0017-missing_type.h-add-__compar_d_fn_t-definition.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0019-Handle-missing-LOCK_EX.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0020-Fix-incompatible-pointer-type-struct-sockaddr_un.patch
 delete mode 100644 meta/recipes-devtools/makedevs/makedevs/COPYING.patch

-- 
2.25.1


