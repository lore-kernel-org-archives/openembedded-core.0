Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53A7C433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 22:22:56 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.2854.1668205368004683564
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 14:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=cgY7cNSM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id b1-20020a17090a7ac100b00213fde52d49so5794557pjl.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 14:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IipYpif57SfudtbhX/VZOHAQqqAW+y9KwC/Zpx4sSZ8=;
        b=cgY7cNSMQlN0pLPX8AIacT5x+NniPuRKMdG1ymxTMubdq6gHqcOYTuCgS7LsGQLNTu
         dDxltV4g3Baw8Q8l2JjS/6Ewssz5Mp5vi9waI4GooEZkhZOpQk858h/abSzm9y2kOClJ
         DDO6OqP4KQSdN8PlGgxmLoB/9HrHH/zAHGL44yr4h8R5l28NkS6eAcnNqCkYGYy9VEoE
         bTo19ouUWzNml76czpon4C+APTVgnzagrjtEG6uRon5Su62i/YSsxSzujpdic5apJoWu
         IDPDIL/OXqUZYwKNNvL1QKcEI+QuGLbXyb7Z3IHmpzCkdPxvjJi5ZNGwDC9W+4Y7EYMn
         VA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IipYpif57SfudtbhX/VZOHAQqqAW+y9KwC/Zpx4sSZ8=;
        b=VjEzRw0JwajvxOlOySA+lo7ZhLKNtkmcEjiwO4+8KSmOLIC0T9WJ+okmGjBEMDCDbW
         tQUjbbEjEE2TXcv5hQpkp5prEKBkDMQlZnDyHockKpsyurwQNK1vLa6z3Bqt9xpF25+I
         viF/2xKpLd+IKrcfWkXVye4WX1dpOjAUIPB++8yvWznMBW8abnNl55OLsw3Mnhr1cxuw
         1557gTorLdVnhJcM/wLPW5GQAiqWAUh6JVKnI4sx6/Xhv82wtVt1Vo/dQUDZZJusbnnq
         8DeKN13I0pq09KGKtAUyqObdYbBi6ZsKj9z3V89zPMO23OyknijIHktXqO+FxCf/bkBn
         tVTA==
X-Gm-Message-State: ANoB5plHYCdmVxOiuvJgtkFsCeBvB7TNQVMHeRyJVhEd1RY2TRJmTnJj
	vJVL8HPs9nJrBT+OFzpj4zYTPvc7wBl/IHep
X-Google-Smtp-Source: AA0mqf5YViyHfedB3kAUUSuxGbTveBrSGu1x29HyP+70ByUZw58t3A1msjEoNn83BL6nVj2CuoVwHw==
X-Received: by 2002:a17:902:da88:b0:186:a185:1314 with SMTP id j8-20020a170902da8800b00186a1851314mr4469606plx.36.1668205366709;
        Fri, 11 Nov 2022 14:22:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id e65-20020a621e44000000b005544229b992sm2075708pfe.22.2022.11.11.14.22.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 14:22:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/10] Pull request (cover letter only)
Date: Fri, 11 Nov 2022 12:22:40 -1000
Message-Id: <cover.1668205283.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 22:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173145

This is the final pull request for the 4.1.1 release.

The following changes since commit 0eee57ef03908c04e1567889f72d7187b5c1f657:

  mirrors.bbclass: use shallow tarball for binutils-native (2022-11-04 09:16:52 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-next

Alexander Kanavin (3):
  shadow: update 4.12.1 -> 4.12.3
  lttng-modules: upgrade 2.13.4 -> 2.13.5
  quilt: backport a patch to address grep 3.8 failures

Bernhard Rosenkränzer (1):
  cmake-native: Fix host tool contamination

Michael Opdenacker (1):
  create-spdx.bbclass: remove unused SPDX_INCLUDE_PACKAGED

Robert Joslyn (1):
  curl: Backport CVE fixes

Ross Burton (3):
  pixman: backport fix for CVE-2022-44638
  sudo: backport fix for CVE-2022-43995
  sanity: check for GNU tar specifically

ciarancourtney (1):
  wic: swap partitions are not added to fstab

 meta/classes-global/sanity.bbclass            |   8 +
 meta/classes/create-spdx.bbclass              |   2 -
 .../cmake/cmake-native_3.24.0.bb              |   1 +
 meta/recipes-devtools/quilt/quilt.inc         |   1 +
 .../quilt/quilt/fix-grep-3.8.patch            | 144 ++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |   2 +-
 .../{shadow_4.12.1.bb => shadow_4.12.3.bb}    |   0
 .../sudo/files/CVE-2022-43995.patch           |  54 +++++++
 meta/recipes-extended/sudo/sudo_1.9.11p3.bb   |   1 +
 .../xorg-lib/pixman/CVE-2022-44638.patch      |  33 ++++
 .../xorg-lib/pixman_0.40.0.bb                 |   1 +
 .../lttng-modules/0001-fix-compaction.patch   |  68 ---------
 ...c-fix-tracepoint-mm_page_alloc_zone_.patch | 106 -------------
 ...oduce-kfree_skb_reason-v5.15.58.v5.1.patch |  53 -------
 ...ags-parameter-from-aops-write_begin-.patch |  76 ---------
 ...Fix-type-of-cpu-in-trace-event-v5.19.patch | 124 ---------------
 ...ules_2.13.4.bb => lttng-modules_2.13.5.bb} |   7 +-
 .../curl/curl/CVE-2022-32221.patch            |  27 ++++
 .../curl/curl/CVE-2022-35260.patch            |  73 +++++++++
 .../curl/curl/CVE-2022-42915.patch            |  53 +++++++
 .../curl/curl/CVE-2022-42916.patch            | 134 ++++++++++++++++
 meta/recipes-support/curl/curl_7.85.0.bb      |   4 +
 scripts/lib/wic/plugins/imager/direct.py      |   2 +-
 23 files changed, 537 insertions(+), 437 deletions(-)
 create mode 100644 meta/recipes-devtools/quilt/quilt/fix-grep-3.8.patch
 rename meta/recipes-extended/shadow/{shadow_4.12.1.bb => shadow_4.12.3.bb} (100%)
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2022-43995.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/CVE-2022-44638.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-compaction.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-page_alloc-fix-tracepoint-mm_page_alloc_zone_.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-fs-Remove-flags-parameter-from-aops-write_begin-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-workqueue-Fix-type-of-cpu-in-trace-event-v5.19.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.4.bb => lttng-modules_2.13.5.bb} (76%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32221.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-35260.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-42915.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-42916.patch

-- 
2.25.1


