Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7028C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 23:50:13 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web09.2024.1649799966788728878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 14:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qORU1FlQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id a14so1511434uan.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 14:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6dvAn02XS5ZMLvT3Nlsp7ulsmUOgO1s0ygc0hxDRmQw=;
        b=qORU1FlQM+1NM0RswYogr1QdtbXov5f6YrGyuGhYPgIqL5reDZcari/fZ6YF6OlEY5
         PNV12xw8fqGOkZonWPcP6Hz0szppngsuGnkmhpoRHlDkGiXWd+JRfOHz/A9nTI+NidK3
         FEE3z5z42Niw9JSQnpCrDfgWDpLNpBsBttNiu/FBAV+zVYJ2zOvIUQ9JvwOzHkKxicV0
         jGjveULOHG1/kutkxcUUs6LfC1GGQW7AhUrminj4c1zE1+UJZXE3MF9rweR2in0XnU/9
         abt6P2shMblxIOgV/k6vM7Hdiz3YylFQF2Fikd0DS1a9nfPd4ZfZ8Sq5CPk3BhsyuV0t
         imhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6dvAn02XS5ZMLvT3Nlsp7ulsmUOgO1s0ygc0hxDRmQw=;
        b=b2ZrpZH41KQHbbcr5TEqBENUzi70PuqRZKdyF5aEA1fmWZdbywkxor++aeUS3ta76A
         Os25XMXFHq9sW+lF5BbAx2VMa0T3VAgNs2/SFY5Bwp5IQ4lOtOF/y/4ioyAoD3QxnyGK
         vPPkaMccFdVxwNkYJAz/8CjCcZB93FhM7twoukKTGzqNkbBLY0TFDXr9sj9XJNbIUKT9
         FI/irpzmcdv9sG0QStnz6qvATeNW2G5EKH3jGLsfUmkDvakqq9m4aDOi5Fmq38BN/a4A
         o5f+UCyRc43nsaTcnMIvXgcuQ9v5F/qgL+Ualz3nLX56s709SVbUzmICU0WaxiGQRYoW
         2ZIw==
X-Gm-Message-State: AOAM532CKHHwq8nSARJFj5N89muFcEc7q2uaMS60eHmh0kZUKwBuIOeT
	r4BBC0cRfMQS192K//wVJFxaie3qNyyH2Q==
X-Google-Smtp-Source: 
 ABdhPJwsTLvnM11aeV1khmlCYQCeQk1TOx2d7PLDepzcV8P0nbi+9/ngl1iLKN1mqB4Gng/Zndvx1g==
X-Received: by 2002:ab0:204a:0:b0:35c:d019:e027 with SMTP id
 g10-20020ab0204a000000b0035cd019e027mr2006532ual.21.1649799965724;
        Tue, 12 Apr 2022 14:46:05 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 n14-20020a9f3ece000000b0035d20c94b68sm1527638uaj.29.2022.04.12.14.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 14:46:04 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] kernel: consolidated pull request
Date: Tue, 12 Apr 2022 17:45:55 -0400
Message-Id: <cover.1649799823.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 23:50:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164283

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the collection of -stable, fixes and tweaks that I was talking
about during the engineering sync on Tuesday.

Feel free to take what you want, or just wait on them all until the
release is over.

It is worth taking the 5.18 -dev and lttng fixes IMHO, since they do
make the release a bit more future proof. Likewise with Jon's -tiny
changes.

Cheers,

Bruce

The following changes since commit 632c83ab787211ef927a999f4ecde1d3ce40621d:

  license_image.bbclass: close package.manifest file (2022-04-10 08:31:17 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto/5.15: arm: poky-tiny cleanup and fixes
  linux-yocto/5.15: update to v5.15.33
  linux-yocto/5.10: update to v5.10.110
  linux-yocto/5.10: base: enable kernel crypto userspace API
  linux-yocto/5.15: base: enable kernel crypto userspace API
  linux-yocto/5.15: kasan: fix BUG: sleeping function called from
    invalid context
  lttng-modules: support kernel 5.18+
  linux-yocto-dev: update to v5.18+

 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   4 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +--
 ...x-compaction-migratepages-event-name.patch |  37 ++++
 ...vent-allow-same-provider-and-event-n.patch |  48 +++++
 ...g-Don-t-re-read-p-state-when-emittin.patch | 183 ++++++++++++++++++
 .../0004-fix-block-remove-genhd.h-v5.18.patch |  45 +++++
 ...emove-REQ_OP_WRITE_SAME-support-v5.1.patch |  79 ++++++++
 ...ndom-remove-unused-tracepoints-v5.18.patch |  47 +++++
 ...rethook-for-kretprobe-if-possible-v5.patch |  72 +++++++
 ...ore-Remove-scsi-scsi_request.h-v5.18.patch |  44 +++++
 .../0009-Rename-genhd-wrapper-to-blkdev.patch |  76 ++++++++
 ...n-cleanup-the-compaction-trace-event.patch | 106 ++++++++++
 .../lttng/lttng-modules_2.13.3.bb             |  14 +-
 18 files changed, 791 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-compaction-migratepages-event-name.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-tracepoint-event-allow-same-provider-and-event-n.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-sched-tracing-Don-t-re-read-p-state-when-emittin.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-block-remove-genhd.h-v5.18.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-scsi-block-Remove-REQ_OP_WRITE_SAME-support-v5.1.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-random-remove-unused-tracepoints-v5.18.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-kprobes-Use-rethook-for-kretprobe-if-possible-v5.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-fix-scsi-core-Remove-scsi-scsi_request.h-v5.18.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-Rename-genhd-wrapper-to-blkdev.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch

-- 
2.19.1


