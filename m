Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E658AC433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 14:08:54 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.7609.1668607726550608861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 06:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5Doq91Nf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id d59-20020a17090a6f4100b00213202d77e1so2404732pjk.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 06:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/7r41NzDQ594Y8pt6MVvc8KFKWlcHXvbAGJzUDVuHk=;
        b=5Doq91Nf3YZaMbK44FSH+A+PPdwbiZqUTAVNyXcWiQoyTMyARgx/UGcWgxyB1Evqbr
         TYGKexgFMNImueIOUsy7BZ/Nw1pss4mRxGSDGPPFISlu3NNFkIZOd06GGqZhb4Zv6fHA
         9oGrLb5R9BV0LyQ/MaxYkHTLdI+FNc9+c6fmXX+blGWRQgCEI8z+/GdZ5IEDrT8ZEAxe
         nOKfGdwZmALA5MhUiM57mskL7ODLRjUZvpuZZqj/GDU/1sueB1+mEfK192RPtYuNtG3Q
         6nz0tkjdCm2MBFRIQI31xoduRLuR/mhOM7PGrcVRQnAxLJE46DcwgU9a5UYzlsGTSajv
         ltww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/7r41NzDQ594Y8pt6MVvc8KFKWlcHXvbAGJzUDVuHk=;
        b=OCh6IfcfMm3mjh5BFpKFJhNdpb71UQUe/9tEt83itACqeWfTBsKm0zsC316q+ZTD8Z
         U6Qed+xqItxYGA20udvjyA49nOaeFtfgvE2m7ReGzuUxe0e1QKhOwVemOGek4TYKFVaq
         T22yOYFLUTB2VBhbxuoE5dQycqrgjZfb/LWo073CKn2JQwGTHVtiYJpvxlMUw6fdnaMt
         EetBalL/UPpKCONQ7PCcROxondwK72fHOYR7oVM2uhg2JVBVXE1io01pQ1RuxjcInhQK
         HJ10WQ0O7p17IoMLaslEmI9zS/Kd1rDNZe3zdQjSVXETOWf2W+LDOFB4fCtn43mfc89T
         QINA==
X-Gm-Message-State: ANoB5plP1JbTLmabTQVIq0dtTLDIlaiUGNzX/nrlrPPaNqpM0gkchHPe
	wkkOEQxgtzK8HoOpnK8+LUlM1IptaEZvf/JnMYs=
X-Google-Smtp-Source: AA0mqf7sFGO1H6o3UI2yLCxCLwBVo95ayYeEoQUZyJBfxarR0WnpRN5HaDe913TvjqD4N9nvfOvJ7g==
X-Received: by 2002:a17:90b:524f:b0:20d:5587:805b with SMTP id sh15-20020a17090b524f00b0020d5587805bmr3894874pjb.190.1668607725363;
        Wed, 16 Nov 2022 06:08:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id 6-20020a17090a194600b0020b7de675a4sm1601133pjh.41.2022.11.16.06.08.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 06:08:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/9] Pull request (cover letter only)
Date: Wed, 16 Nov 2022 04:08:38 -1000
Message-Id: <cover.1668607673.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 14:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173386

The following changes since commit 0c0723757fbba9a4b88c0f98477a18d1e220da2e:

  mirrors.bbclass: use shallow tarball for binutils-native (2022-11-06 06:00:05 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexander Kanavin (2):
  lttng-modules: upgrade 2.13.4 -> 2.13.5
  quilt: backport a patch to address grep 3.8 failures

Hitendra Prajapati (1):
  QEMU: CVE-2022-3165 VNC: integer underflow in vnc_client_cut_text_ext
    leads to CPU exhaustion

Michael Opdenacker (1):
  create-spdx.bbclass: remove unused SPDX_INCLUDE_PACKAGED

Narpat Mali (1):
  python3-mako: backport fix for CVE-2022-40023

Ross Burton (3):
  pixman: backport fix for CVE-2022-44638
  sanity: check for GNU tar specifically
  qemu: add io_uring PACKAGECONFIG

ciarancourtney (1):
  wic: swap partitions are not added to fstab

 meta/classes/create-spdx.bbclass              |   2 -
 meta/classes/sanity.bbclass                   |   8 +
 .../python/python3-mako/CVE-2022-40023.patch  | 119 +++++++++++++++
 .../python/python3-mako_1.1.6.bb              |   2 +
 meta/recipes-devtools/qemu/qemu.inc           |   3 +-
 .../qemu/qemu/CVE-2022-3165.patch             |  61 ++++++++
 meta/recipes-devtools/quilt/quilt.inc         |   1 +
 .../quilt/quilt/fix-grep-3.8.patch            | 144 ++++++++++++++++++
 .../xorg-lib/pixman/CVE-2022-44638.patch      |  33 ++++
 .../xorg-lib/pixman_0.40.0.bb                 |   1 +
 .../lttng-modules/0001-fix-compaction.patch   |  68 ---------
 ...c-fix-tracepoint-mm_page_alloc_zone_.patch | 106 -------------
 ...oduce-kfree_skb_reason-v5.15.58.v5.1.patch |  53 -------
 ...ags-parameter-from-aops-write_begin-.patch |  76 ---------
 ...Fix-type-of-cpu-in-trace-event-v5.19.patch | 124 ---------------
 ...ules_2.13.4.bb => lttng-modules_2.13.5.bb} |   7 +-
 scripts/lib/wic/plugins/imager/direct.py      |   2 +-
 17 files changed, 373 insertions(+), 437 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-mako/CVE-2022-40023.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-3165.patch
 create mode 100644 meta/recipes-devtools/quilt/quilt/fix-grep-3.8.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.4.bb => lttng-modules_2.13.5.bb} (78%)

-- 
2.25.1


