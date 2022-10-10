Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6097EC433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 16:10:46 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.7950.1665418244191171130
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=b9G1mSA2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id pq16so10213550pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uK1boIStxAR2RoY2rOk8Sy7Tnb0aUpOgyZ9o+9qsMWk=;
        b=b9G1mSA2vay4W3mnqSMrFdYLpbBdE1QvQpTWkh9i7F2cqE4x1H0BDQkxOo1r8yQB8c
         TXa0fM0bUTe0xucFyt6zwSzg6IG8QReUhWdL3UZYB/Pdblt/VsnytIkQLrgSOuzvxC6g
         adPVzTUmDM3MmfrvfzK8VFyaScrH+72S41yQ5RfTdsDct+5vUpNPAyAAY9OkUcxsX3ch
         rHO5I/gQlNWzhGI/FUFhrRM2lHkeDNo8ThHhTvUWYXTpos/Xow0YpuagePg5u+viyHwG
         YzuCdb4Rgz+zU/Gd0YlMIgQ9XpIHxiIIQVa1QrqNuPy5BTMACtlb8nehFfmFFGFzc4bC
         xScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uK1boIStxAR2RoY2rOk8Sy7Tnb0aUpOgyZ9o+9qsMWk=;
        b=1djvdwMObXcVW2OlaW4Zdt24l0wOBK6Msk5oIJY0e86YXK3tSszCYCPoHjr0jInJB0
         HLFc/Nne9SPkARKNMnYFH5jEu/FyC6mNl0GxTWM+PUrDS13uZjjDc/i3LKyeWz+h2nJ5
         jZGfX+eLVoaQBl1rKQjfSDkGDWR5JXPSeL3/eX2TJ0HEMw0JwL9m7AWYCEr06oeGigEK
         32FOCxigj6nGb4iEubuMdZrbTf+ARq0YpHsCj+4nnBtur1CCXe9okQ/qEwDbUaCI3T52
         rw1tLIc7p6qsAx24zcGRDEhWjqo6ZCl8SQ3f5pAvYL1T/dFBQ+cxB7nMfmo9hXkhbV70
         qtZQ==
X-Gm-Message-State: ACrzQf0KzvJ2jqGO8baVxuJPoTUKszEygiQmNDC7zJ/6ALrlM/9IRUjb
	emqxMYo8zQbt1iXawlYmsVZiLm0A9YBPPbGf
X-Google-Smtp-Source: 
 AMsMyM7HSnTHQ5SK1u2xGpbOSUknmxY9+TxszmgPdaL5d9mZ7Gxxgq8bFo4vdz6VQD3KbufTBKdyDA==
X-Received: by 2002:a17:902:ec8d:b0:178:2914:b5a0 with SMTP id
 x13-20020a170902ec8d00b001782914b5a0mr19663387plg.17.1665418242806;
        Mon, 10 Oct 2022 09:10:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 l26-20020a635b5a000000b00460c67afbd5sm3655660pgm.7.2022.10.10.09.10.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 09:10:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/17] Pull request (cover letter only)
Date: Mon, 10 Oct 2022 06:10:33 -1000
Message-Id: <cover.1665418156.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 16:10:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171578

The following changes since commit d19cd09b43a7009d660b28ac9dcb21b8038e399f:

  busybox: add devmem 128-bit support (2022-09-24 04:03:56 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexander Kanavin (2):
  rpm: update 4.17.0 -> 4.17.1
  tzdata: update to 2022d

Daniel McGregor (1):
  coreutils: add openssl PACKAGECONFIG

Denys Dmytriyenko (1):
  glibc-locale: explicitly remove empty dirs in ${libdir}

Florin Diaconescu (2):
  rsync: update 3.2.3 -> 3.2.4
  rsync: update 3.2.4 -> 3.2.5

He Zhe (3):
  lttng-tools: Disable on qemuriscv32
  stress-cpu: disable float128 math on powerpc64 to avoid SIGILL
  lttng-tools: Disable on riscv32

Khem Raj (3):
  webkitgtk: Upgrade to 2.36.6 minor update
  webkitgtk: Update to 2.36.7
  rpm: Remove -Wimplicit-function-declaration warnings

Martin Jansa (1):
  create-pull-request: don't switch the git remote protocol to git://

Richard Purdie (1):
  vim: Upgrade 9.0.0541 -> 9.0.0598

Teoh Jay Shen (1):
  bind: upgrade 9.18.6 -> 9.18.7

pgowda (1):
  binutils : Fix CVE-2022-38127

wangmy (1):
  bind: upgrade 9.18.5 -> 9.18.6

 ...1-avoid-start-failure-with-bind-user.patch |    0
 ...d-V-and-start-log-hide-build-options.patch |    0
 ...ching-for-json-headers-searches-sysr.patch |    0
 .../bind/{bind-9.18.5 => bind-9.18.7}/bind9   |    0
 .../{bind-9.18.5 => bind-9.18.7}/conf.patch   |    0
 .../generate-rndc-key.sh                      |    0
 ...t.d-add-support-for-read-only-rootfs.patch |    0
 .../make-etc-initd-bind-stop-work.patch       |    0
 .../named.service                             |    0
 .../bind/{bind_9.18.5.bb => bind_9.18.7.bb}   |    2 +-
 meta/recipes-core/coreutils/coreutils_9.0.bb  |    1 +
 meta/recipes-core/glibc/glibc-locale.inc      |    5 +-
 .../binutils/binutils-2.38.inc                |    4 +
 .../binutils/0017-CVE-2022-38127-1.patch      | 1224 +++++++++++++++++
 .../binutils/0017-CVE-2022-38127-2.patch      |  188 +++
 .../binutils/0017-CVE-2022-38127-3.patch      |  211 +++
 .../binutils/0017-CVE-2022-38127-4.patch      |   43 +
 .../rpm/files/0001-CVE-2021-3521.patch        |   57 -
 ...lib-rpm-as-the-installation-path-for.patch |   14 +-
 ...lling-execute-package-scriptlets-wit.patch |   18 +-
 ...-linux-gnux32-variant-to-triplet-han.patch |   31 +
 .../rpm/files/0002-CVE-2021-3521.patch        |   64 -
 .../rpm/files/0003-CVE-2021-3521.patch        |  329 -----
 .../rpm/{rpm_4.17.0.bb => rpm_4.17.1.bb}      |    6 +-
 ...-the-hostname-in-the-certificate-whe.patch |   31 -
 .../rsync/files/makefile-no-rebuild.patch     |   12 +-
 .../rsync/{rsync_3.2.3.bb => rsync_3.2.5.bb}  |   17 +-
 ...le-float128-math-on-powerpc64-to-avo.patch |   43 +
 .../stress-ng/stress-ng_0.13.12.bb            |    4 +-
 meta/recipes-extended/timezone/timezone.inc   |    6 +-
 meta/recipes-kernel/lttng/lttng-platforms.inc |    4 +
 ...ebkitgtk_2.36.5.bb => webkitgtk_2.36.7.bb} |    3 +-
 meta/recipes-support/vim/vim.inc              |    4 +-
 scripts/create-pull-request                   |    2 +-
 34 files changed, 1801 insertions(+), 522 deletions(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.7}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.7}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.7}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.7}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.7}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.7}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.7}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.7}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.5 => bind-9.18.7}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.5.bb => bind_9.18.7.bb} (97%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-2.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-3.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2022-38127-4.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CVE-2021-3521.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-configure.ac-add-linux-gnux32-variant-to-triplet-han.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0002-CVE-2021-3521.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0003-CVE-2021-3521.patch
 rename meta/recipes-devtools/rpm/{rpm_4.17.0.bb => rpm_4.17.1.bb} (97%)
 delete mode 100644 meta/recipes-devtools/rsync/files/0001-rsync-ssl-Verify-the-hostname-in-the-certificate-whe.patch
 rename meta/recipes-devtools/rsync/{rsync_3.2.3.bb => rsync_3.2.5.bb} (67%)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng-0.13.12/0001-stress-cpu-disable-float128-math-on-powerpc64-to-avo.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.5.bb => webkitgtk_2.36.7.bb} (98%)

-- 
2.25.1


