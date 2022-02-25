Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C55C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:26:56 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.7046.1645799207056384379
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:26:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=hK71W+6Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id o23so4766587pgk.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GGeC7bqkcyejZVh7wekLIFm85rkvSHFnNsDU2MSG3wE=;
        b=hK71W+6YrQwQT5xcZIYERno8XtdENm2M5VtDDXeO4iIRWs/PItXzUlz0uNFCBLIhHV
         CDWkpikz5RWGppVXs1u1+WzdAtKWrmZSP7Z9ACTyLA/xlG1o7L5RHltv21l4l4KPnNPL
         Ri0IIUJEsgX4gO3cUffD+Gegcj+zWworNp4ACwI80HAESGSDLjjvkrz1Rxboe1hn1ekK
         kM9phIfTl6dMpVMt+t7MopISgfhL64jgd7v2Yt7LXAspTxQ5sHwLlFouCTrSJG5RRVYG
         BeFzILf547dD5/2/ALhT7WzEVPzLceekzMeN5Cs6oETx4Yr7ucxnSDGArNN4Ha1rbnyV
         feMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GGeC7bqkcyejZVh7wekLIFm85rkvSHFnNsDU2MSG3wE=;
        b=aj+v58sJJ1TcR9S3sSyVPRNTv05HfMhp8yGzd/Ij9NFuNYB0JptajAl72aqoVhHxeQ
         +op/TKlc7lfZIajuFnAQy3ROMCMAoBF3KQWBpIMFaOU00OtkCB8zz9h9ECyLwsawuSah
         UC+aeUND6FH08jJavDZv8WYRbQSIHWyrCK704vUpB9Lr8/TcID+lvZgYTLoMJ+wNt84s
         wSiwiRaGBVjsRdNafFw34R7VmY789Z8AHCiGeITjZ+OO3jqRwOPwjv4O8lb0LClOwyDJ
         3N7dE/lieF4WW/JoR4c3kT3VgfP1vK9K6nhVXD4oqktS3r9XILJUM2n2SUHYnQuS47u5
         9n/g==
X-Gm-Message-State: AOAM532xHyb+k7iaY103Aq0avNQEs3aiUL0AYxAyd1CdedpB53sac1Cd
	cjjdKmk3MwVzxby5cg7MkqlFAgk/wmI596s2
X-Google-Smtp-Source: 
 ABdhPJxs2CNKrNwbFfEYb+Q6vtuGMOw1dmVNIprIoNwtRSsr0qDNaugnRMNaPlrGM77aybVqyKo9Cg==
X-Received: by 2002:a63:4d52:0:b0:343:8d41:eb12 with SMTP id
 n18-20020a634d52000000b003438d41eb12mr6447971pgl.527.1645799205635;
        Fri, 25 Feb 2022 06:26:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.26.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:26:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/50] Patch review
Date: Fri, 25 Feb 2022 04:25:40 -1000
Message-Id: <cover.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:26:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162346

Please review this set of patches for dunfell and have comments back by end
of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3283

with the exception of a known autobuilder intermittent issue on qemuarm64
which passed on subsequent retest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/4780

The following changes since commit 9360b92f98222cb74a93690f53570cd62633c0cf:

  vim: Upgrade 8.2.4314 -> 8.2.4424 (2022-02-21 07:28:56 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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


