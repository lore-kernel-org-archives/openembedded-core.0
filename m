Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2C4C19F2A
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 13:54:05 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.5888.1660139636021877409
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 06:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=R3tJaBvW;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id s206so14430460pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 06:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=H031+Efrf6O1kBbKFS8NrgZvKtFweRzrQJ08hQsXWuQ=;
        b=R3tJaBvW0f+z4yg51YpLs9jkmjQwmKr5WxhP3AtLVIoT10/e/SD8xwGUZm1xJVh7qZ
         AXVXD6Z+xyJLgkt+WlhccztJMOIB0solmiUnBXqmNk6IdZYjk/ojXPU49GHRlz4bJ4dE
         qs91dziY33eR0PGWyAZeFeLFSp9N50kfhBHFpfKl9ogNK9QtK5leklFLIlQfV2IPRmp8
         t1/5M8MDNmMZJIqiZHWbIn3OklrDkJXM/pVmEPbyRWtyB2fKtKBBkVIx8ywGJWDgWi2x
         1dVMUhtJEegANpIqnWQPCBqTG+DzfBMvAXfFN07pX5XUJfoYpwiweXBGBddkGM3pkyqX
         WR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=H031+Efrf6O1kBbKFS8NrgZvKtFweRzrQJ08hQsXWuQ=;
        b=7TnZJPD6UUMz7llnQxH2jXEsLfoDRfSZTX61NalGZS4eIkWsOYFNcRb2dOigWMWTg6
         Sj7zv0zIuuqTCMZmFnoEqhvM0p3sC7CqCmoxVLeNeORr3lA9xR1HAnFOevbKv3Gf0I48
         y1SAUjJYDj7u/n+ilcaiXzoCCmLTTWk++ZXKf2EkmHIvKRolkxWjAmY3ei6+mb5UwXb9
         oG9xazSpOQASjf6IFNoQpG7gVY0kKTFh6L2/LE3LYV/8xgBvUiXo03hVBhjh9sIRXxLs
         Wwyk4IFNOxo51Z+TD3K1U786MI8X/LE0T3eAM13AX0v6wHSvG/HCW+B3qNXY4GCpRR7g
         +orQ==
X-Gm-Message-State: ACgBeo3QtGvetA+VuvrK8HxflC6dFy7tpQJE9FxaNF0DkqDPRV2MSXs9
	VVemgv5p3N47V3mXFPJ5WRoqgSNQXLX65MuQ
X-Google-Smtp-Source: 
 AA6agR6RXFXjUu28N1JbvOzrJXS+cROoB79GBtGBe2fAMLkqib8LUn0cZ6Hpm+GWC092ZMluribcGQ==
X-Received: by 2002:a63:e751:0:b0:41b:b3a6:c00a with SMTP id
 j17-20020a63e751000000b0041bb3a6c00amr22821140pgk.492.1660139634812;
        Wed, 10 Aug 2022 06:53:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 oj7-20020a17090b4d8700b001df264610c4sm8088439pjb.0.2022.08.10.06.53.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 06:53:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/9] Pull request (cover letter only)
Date: Wed, 10 Aug 2022 03:53:40 -1000
Message-Id: <cover.1660139506.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 13:54:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169191

Final pull request for 4.0.3 release.

The following changes since commit c33eb7fb1d1e91a005b22b65d221d4b899ec69dc:

  openssh: Add openssh-sftp-server to openssh RDEPENDS (2022-08-02 12:32:44 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexander Kanavin (1):
  lttng-modules: update 2.13.3 -> 2.13.4

Bruce Ashfield (5):
  linux-yocto/5.10: update to v5.10.135
  linux-yocto/5.15: update to v5.15.58
  linux-yocto-rt/5.15: update to -rt48 (and fix -stable merge)
  linux-yocto/5.15: update to v5.15.59
  linux-yocto/5.15: fix reproducibility issues

He Zhe (1):
  lttng-modules: Fix build failure for kernel v5.15.58

Martin Jansa (1):
  glibc: revert one upstream change to work around broken DEBUG_BUILD
    build

Sundeep KOKKONDA (1):
  glibc : stable 2.35 branch updates

 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 ...lement-a-useful-version-of-_startup_.patch | 128 ++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   2 +
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +--
 ...x-compaction-migratepages-event-name.patch |  37 ----
 ...oduce-kfree_skb_reason-v5.15.58.v5.1.patch |  53 +++++
 ...emove-unused-tracepoints-v5.10-v5.15.patch |  44 -----
 ...g-Append-prev_state-to-tp-args-inste.patch |  59 ------
 ...vent-allow-same-provider-and-event-n.patch |  48 -----
 ...g-Don-t-re-read-p-state-when-emittin.patch | 183 ------------------
 .../0004-fix-block-remove-genhd.h-v5.18.patch |  45 -----
 ...emove-REQ_OP_WRITE_SAME-support-v5.1.patch |  79 --------
 ...ndom-remove-unused-tracepoints-v5.18.patch |  47 -----
 ...rethook-for-kretprobe-if-possible-v5.patch |  72 -------
 ...ore-Remove-scsi-scsi_request.h-v5.18.patch |  44 -----
 ...n-cleanup-the-compaction-trace-event.patch | 106 ----------
 ...ules_2.13.3.bb => lttng-modules_2.13.4.bb} |  16 +-
 22 files changed, 225 insertions(+), 816 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-compaction-migratepages-event-name.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-net-skb-introduce-kfree_skb_reason-v5.15.58.v5.1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-sched-tracing-Append-prev_state-to-tp-args-inste.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-tracepoint-event-allow-same-provider-and-event-n.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-sched-tracing-Don-t-re-read-p-state-when-emittin.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-block-remove-genhd.h-v5.18.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-scsi-block-Remove-REQ_OP_WRITE_SAME-support-v5.1.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-random-remove-unused-tracepoints-v5.18.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-kprobes-Use-rethook-for-kretprobe-if-possible-v5.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-fix-scsi-core-Remove-scsi-scsi_request.h-v5.18.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.3.bb => lttng-modules_2.13.4.bb} (60%)

-- 
2.25.1


