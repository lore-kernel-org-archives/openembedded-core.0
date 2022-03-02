Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E84C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 00:05:00 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.2081.1646179499190720166
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 16:04:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=iN6weWAW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id b8so280335pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 16:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=clw1wPJ0V4tixxx4zhw/4ZnvvVGzLTQEmGmqYAsWKJ0=;
        b=iN6weWAWgEHOL5d9+FNnpcsDWGdeEtdVgDo+u0ThJLqF6YxnW7Wn4Ug8UHo6LU21zs
         9MUeM4gOMaoNZttoMj4DekKtsh1FvH1tJ0DyUigjMM7Gbqng1WW7BJKRaWdVHs9+0JpQ
         fVCVVTk/wKfW2Sa901Ezr5ytVUSoz0jFyiaP5q56+ze5mImusfYjbFEuJhXQNdylUGQw
         /CQYYf8bfFXpVyyT9RAOs1RfWG514ghMi99W+sOkS8+awb9cP5zmoREfd/SCACthkMr2
         g/Qcc7fECml1VoWHnA9R4FXwhI2u2wywXRnJNUIaG6FUapAgvAM6wIEI1CwQo7TjXyCa
         zMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=clw1wPJ0V4tixxx4zhw/4ZnvvVGzLTQEmGmqYAsWKJ0=;
        b=IprEkNqx3p55D/OzkdC+KeCIfK6IaPKYzO1pHmavZqD+rkklvcmPruuPMTk5/eXxpY
         fHuWvxMEQP47KuFOLN/CIcmqiKAQjsdULG3QNRswxKXhjJhsdKh29lpG11g5izEd1/eI
         Q6f8zx3BB4StiD6EpwsJ4I7A3dOVBKfvNDfyVdQxJIu96b2xmER+zrHdqHdv8mYpXNnp
         DBMDsEx5q1QpEDpvZk/nzphDnkxhtnVmbeg/RUhstGMi9E/eCsp/mlMUknr+k+Fsp8Xt
         7cWmKQYTN2wA3dFdWbiufHv5WI1BXqOnK7UXe/DjctMLKKPeO5iamj7VXtMeBH0J3+UE
         il9Q==
X-Gm-Message-State: AOAM533Cgy3XebFXzu7aNId7CLjUfe5pNX2CHO+r7hd2Ms4l9YmnCuga
	HxsIb4feAmsYVvoBD3hpH6E7hvDmMxjTep92V9I=
X-Google-Smtp-Source: 
 ABdhPJy16R9+2M9ZhEmr1xiBDcaSaEVKtl5WcfFNV7mdYZJoyXWYs6SxZfzZENqgNruCKP6ggu9eGQ==
X-Received: by 2002:a17:902:eb90:b0:150:e0a:c222 with SMTP id
 q16-20020a170902eb9000b001500e0ac222mr27739941plg.111.1646179497720;
        Tue, 01 Mar 2022 16:04:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p28-20020a056a000a1c00b004f6519e61b7sm66264pfh.21.2022.03.01.16.04.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 16:04:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/50] Pull request (cover letter only)
Date: Tue,  1 Mar 2022 14:04:48 -1000
Message-Id: <cover.1646179420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 00:05:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162583

The following changes since commit 9360b92f98222cb74a93690f53570cd62633c0cf:

  vim: Upgrade 8.2.4314 -> 8.2.4424 (2022-02-21 07:28:56 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Chee Yang Lee (1):
  ruby: 2.7.4 -> 2.7.5

Kartikey Rameshbhai Parmar (1):
  puzzles: Upstream changed to main branch for development

Marta Rybczynska (46):
  grub: fix a memory leak
  grub: add a fix for a possible NULL dereference
  grub: fix a dangling memory pointer
  grub: fix wrong handling of argc == 0
  grub: add a fix for malformed device path handling
  grub: fix memory leak at error in grub_efi_get_filename()
  grub: add a fix for a possible NULL pointer dereference
  grub: add a fix for unused variable in gnulib
  grub: fix an unitialized token in gnulib
  grub: add a fix a NULL pointer dereference in gnulib
  grub: add a fix for NULL pointer dereference
  grub: fix an unitialized re_token in gnulib
  grub: add a fix for unnecessary assignements
  grub: add structure initialization in zstd
  grub: add a missing NULL check
  grub: fix a memory leak
  grub: fix a memory leak
  grub: fix a memory leak
  grub: fix an integer overflow
  grub: add a fix for a length check
  grub: add a fix for a possible negative shift
  grub: add a fix for a memory leak
  grub: add a fix for possible integer overflows
  grub: fix an error check
  grub: add a fix for a memory leak
  grub: add a fix for a possible unintended sign extension
  grub: add a fix for a possible NULL dereference
  grub: add a fix for a memory leak
  grub: add a fix for a memory leak
  grub: fix a memory leak
  grub: remove unneeded return value
  grub: fix an integer overflow
  grub: fix multiple integer overflows
  grub: fix a possible integer overflow
  grub: test for malformed jpeg files
  grub: remove dead code
  grub: fix checking for NULL
  grub: add a fix for a memory leak
  grub: avoid a memory leak
  grub: add a check for a NULL pointer
  grub: add a fix for NULL pointer dereference
  grub: add a fix for an incorrect cast
  grub: fix incorrect use of a negative value
  grub: add a fix for a NULL pointer dereference
  grub: avoid a NULL pointer dereference
  grub: add a fix for a crash in scripts

Purushottam Choudhary (1):
  tiff: fix for CVE-2022-22844

Ranjitsinh Rathod (1):
  openssl: Add fix for CVE-2021-4160

 ...leak-when-iterating-over-mapped-memo.patch |  39 +++
 ...ible-dereference-to-of-a-NULL-pointe.patch |  39 +++
 ...net-tftp-Fix-dangling-memory-pointer.patch |  33 +++
 ...n-parser-Fix-resource-leak-if-argc-0.patch |  50 ++++
 ...formed-device-path-arithmetic-errors.patch | 235 ++++++++++++++++++
 ...-kern-efi-Fix-memory-leak-on-failure.patch |  30 +++
 ...ix-possible-NULL-pointer-dereference.patch |  65 +++++
 ...ulib-regexec-Resolve-unused-variable.patch |  59 +++++
 ...mp-Fix-uninitialized-token-structure.patch |  53 ++++
 ...-Fix-dereference-of-a-possibly-NULL-.patch |  52 ++++
 ...egexec-Fix-possible-null-dereference.patch |  53 ++++
 ...b-regcomp-Fix-uninitialized-re_token.patch |  55 ++++
 ...e-unnecessary-self-assignment-errors.patch |  41 +++
 ...std-Initialize-seq_t-structure-fully.patch |  34 +++
 ...heck-for-NULL-before-dereferencing-i.patch |  43 ++++
 ...re-comp-data-is-freed-before-exiting.patch | 128 ++++++++++
 ...-If-failed-then-free-vg-variable-too.patch |  28 +++
 ...ory-leak-on-uninserted-lv-references.patch |  50 ++++
 ...odisk-Fix-potential-integer-overflow.patch |  50 ++++
 ...that-the-volume-name-length-is-valid.patch |  43 ++++
 ...ix-possible-negative-shift-operation.patch |  42 ++++
 ...source-leaks-while-constructing-path.patch | 121 +++++++++
 ...3-zfs-Fix-possible-integer-overflows.patch |  56 +++++
 ...-a-check-for-error-allocating-memory.patch |  35 +++
 .../files/0025-affs-Fix-memory-leaks.patch    |  82 ++++++
 ...x-possible-unintended-sign-extension.patch |  36 +++
 ...pt-mpi-Fix-possible-NULL-dereference.patch |  33 +++
 ...slinux-Fix-memory-leak-while-parsing.patch |  43 ++++
 ...n-Fix-leaking-of-memory-when-process.patch |  52 ++++
 ...0-commands-hashsum-Fix-a-memory-leak.patch |  56 +++++
 ...move-unnecessary-return-value-of-gru.patch |  94 +++++++
 ...bfill-Fix-potential-integer-overflow.patch |  78 ++++++
 ...eo_fb-Fix-multiple-integer-overflows.patch | 104 ++++++++
 ...deo_fb-Fix-possible-integer-overflow.patch |  39 +++
 ...eg-Test-for-an-invalid-next-marker-r.patch |  38 +++
 ...-Remove-code-that-coverity-is-flaggi.patch |  34 +++
 ...ader-bsd-Check-for-NULL-arg-up-front.patch |  47 ++++
 .../0038-loader-xnu-Fix-memory-leak.patch     |  38 +++
 ...driverkey-data-when-an-error-is-dete.patch |  77 ++++++
 ...k-if-pointer-is-NULL-before-using-it.patch |  42 ++++
 ...nstall-Fix-NULL-pointer-dereferences.patch |  41 +++
 ...v-Fix-incorrect-casting-of-a-signed-.patch |  46 ++++
 ...x-incorrect-use-of-a-possibly-negati.patch |  50 ++++
 ...ix-NULL-dereference-in-grub_script_e.patch |  28 +++
 ...ire-device_name-is-not-NULL-before-p.patch |  33 +++
 ...void-crash-when-using-outside-a-func.patch |  37 +++
 meta/recipes-bsp/grub/grub2.inc               |  48 +++-
 .../openssl/openssl/CVE-2021-4160.patch       | 145 +++++++++++
 .../openssl/openssl_1.1.1l.bb                 |   1 +
 .../ruby/{ruby_2.7.4.bb => ruby_2.7.5.bb}     |   4 +-
 ...al-buffer-overflow-for-ASCII-tags-wh.patch |  52 ++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   1 +
 meta/recipes-sato/puzzles/puzzles_git.bb      |   2 +-
 53 files changed, 2811 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/0001-mmap-Fix-memory-leak-when-iterating-over-mapped-memo.patch
 create mode 100644 meta/recipes-bsp/grub/files/0002-net-net-Fix-possible-dereference-to-of-a-NULL-pointe.patch
 create mode 100644 meta/recipes-bsp/grub/files/0003-net-tftp-Fix-dangling-memory-pointer.patch
 create mode 100644 meta/recipes-bsp/grub/files/0004-kern-parser-Fix-resource-leak-if-argc-0.patch
 create mode 100644 meta/recipes-bsp/grub/files/0005-efi-Fix-some-malformed-device-path-arithmetic-errors.patch
 create mode 100644 meta/recipes-bsp/grub/files/0006-kern-efi-Fix-memory-leak-on-failure.patch
 create mode 100644 meta/recipes-bsp/grub/files/0007-kern-efi-mm-Fix-possible-NULL-pointer-dereference.patch
 create mode 100644 meta/recipes-bsp/grub/files/0008-gnulib-regexec-Resolve-unused-variable.patch
 create mode 100644 meta/recipes-bsp/grub/files/0009-gnulib-regcomp-Fix-uninitialized-token-structure.patch
 create mode 100644 meta/recipes-bsp/grub/files/0010-gnulib-argp-help-Fix-dereference-of-a-possibly-NULL-.patch
 create mode 100644 meta/recipes-bsp/grub/files/0011-gnulib-regexec-Fix-possible-null-dereference.patch
 create mode 100644 meta/recipes-bsp/grub/files/0012-gnulib-regcomp-Fix-uninitialized-re_token.patch
 create mode 100644 meta/recipes-bsp/grub/files/0013-io-lzopio-Resolve-unnecessary-self-assignment-errors.patch
 create mode 100644 meta/recipes-bsp/grub/files/0014-zstd-Initialize-seq_t-structure-fully.patch
 create mode 100644 meta/recipes-bsp/grub/files/0015-kern-partition-Check-for-NULL-before-dereferencing-i.patch
 create mode 100644 meta/recipes-bsp/grub/files/0016-disk-ldm-Make-sure-comp-data-is-freed-before-exiting.patch
 create mode 100644 meta/recipes-bsp/grub/files/0017-disk-ldm-If-failed-then-free-vg-variable-too.patch
 create mode 100644 meta/recipes-bsp/grub/files/0018-disk-ldm-Fix-memory-leak-on-uninserted-lv-references.patch
 create mode 100644 meta/recipes-bsp/grub/files/0019-disk-cryptodisk-Fix-potential-integer-overflow.patch
 create mode 100644 meta/recipes-bsp/grub/files/0020-hfsplus-Check-that-the-volume-name-length-is-valid.patch
 create mode 100644 meta/recipes-bsp/grub/files/0021-zfs-Fix-possible-negative-shift-operation.patch
 create mode 100644 meta/recipes-bsp/grub/files/0022-zfs-Fix-resource-leaks-while-constructing-path.patch
 create mode 100644 meta/recipes-bsp/grub/files/0023-zfs-Fix-possible-integer-overflows.patch
 create mode 100644 meta/recipes-bsp/grub/files/0024-zfsinfo-Correct-a-check-for-error-allocating-memory.patch
 create mode 100644 meta/recipes-bsp/grub/files/0025-affs-Fix-memory-leaks.patch
 create mode 100644 meta/recipes-bsp/grub/files/0026-libgcrypt-mpi-Fix-possible-unintended-sign-extension.patch
 create mode 100644 meta/recipes-bsp/grub/files/0027-libgcrypt-mpi-Fix-possible-NULL-dereference.patch
 create mode 100644 meta/recipes-bsp/grub/files/0028-syslinux-Fix-memory-leak-while-parsing.patch
 create mode 100644 meta/recipes-bsp/grub/files/0029-normal-completion-Fix-leaking-of-memory-when-process.patch
 create mode 100644 meta/recipes-bsp/grub/files/0030-commands-hashsum-Fix-a-memory-leak.patch
 create mode 100644 meta/recipes-bsp/grub/files/0031-video-efi_gop-Remove-unnecessary-return-value-of-gru.patch
 create mode 100644 meta/recipes-bsp/grub/files/0032-video-fb-fbfill-Fix-potential-integer-overflow.patch
 create mode 100644 meta/recipes-bsp/grub/files/0033-video-fb-video_fb-Fix-multiple-integer-overflows.patch
 create mode 100644 meta/recipes-bsp/grub/files/0034-video-fb-video_fb-Fix-possible-integer-overflow.patch
 create mode 100644 meta/recipes-bsp/grub/files/0035-video-readers-jpeg-Test-for-an-invalid-next-marker-r.patch
 create mode 100644 meta/recipes-bsp/grub/files/0036-gfxmenu-gui_list-Remove-code-that-coverity-is-flaggi.patch
 create mode 100644 meta/recipes-bsp/grub/files/0037-loader-bsd-Check-for-NULL-arg-up-front.patch
 create mode 100644 meta/recipes-bsp/grub/files/0038-loader-xnu-Fix-memory-leak.patch
 create mode 100644 meta/recipes-bsp/grub/files/0039-loader-xnu-Free-driverkey-data-when-an-error-is-dete.patch
 create mode 100644 meta/recipes-bsp/grub/files/0040-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch
 create mode 100644 meta/recipes-bsp/grub/files/0041-util-grub-install-Fix-NULL-pointer-dereferences.patch
 create mode 100644 meta/recipes-bsp/grub/files/0042-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch
 create mode 100644 meta/recipes-bsp/grub/files/0043-util-glue-efi-Fix-incorrect-use-of-a-possibly-negati.patch
 create mode 100644 meta/recipes-bsp/grub/files/0044-script-execute-Fix-NULL-dereference-in-grub_script_e.patch
 create mode 100644 meta/recipes-bsp/grub/files/0045-commands-ls-Require-device_name-is-not-NULL-before-p.patch
 create mode 100644 meta/recipes-bsp/grub/files/0046-script-execute-Avoid-crash-when-using-outside-a-func.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch
 rename meta/recipes-devtools/ruby/{ruby_2.7.4.bb => ruby_2.7.5.bb} (95%)
 create mode 100644 meta/recipes-multimedia/libtiff/files/0001-tiffset-fix-global-buffer-overflow-for-ASCII-tags-wh.patch

-- 
2.25.1


