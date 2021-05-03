Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web08.32997.1620046477217413716
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 05:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VV03PILF;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id 76so2992514qkn.13
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 05:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4pvbrQgHz927jblHEfn1fHQHsLz/wXRzjyiOUazi9cs=;
        b=VV03PILFvIRT5Nn5rb9u7pvcnBdoeVtH6sZI93pXxh/TB7rlEazWai9lE9R2Dkwclj
         XpE5yn7txfn/qG+VRiMkO+VSI2jQsT3BUSGMJEgOxpc4vEUJR/DOtglPmEQ0cpPvl2fx
         H+VHn0Zy8WRBkDoNFEt/AWKgQGyV2bJh4C1RXdVseIMiElhtcGDdGp8NHdfLDUIuiFj9
         dBVMKOcjn1e1c1FBaATGi9MapG5h47eJwKVMFq/XPn9dLJPCZ0ndiWfxJ4muAwhbso4p
         Qbat0PyWD+tpGJmeg2hvAfqnmphUYFsBavjY/qR1W2nzH8no64o+/aKKNGgAlKzzj2KR
         poRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4pvbrQgHz927jblHEfn1fHQHsLz/wXRzjyiOUazi9cs=;
        b=IBqisZKNme+aUudT7FP1/WHnoJaUGtJcQBNHVIWMWKjeA7XVMvwOUlLo4pSntkBfzj
         7OSyb/Y2IB5qACrOiI2jf1e6qr3F7Jh/0JL6Ur/30/wYkjOGm73XmeO7sai3f3ecgAn+
         txjN5qDpN965aRgsk0A2tfk/Kd3potR/zKnRkfI1U1+dAkE1hbbJ3zpeAJq4Wu0fugIq
         hVPM6eZqzsjZemV+cFynWuGKURkzJEfULZiHnjvh33dacILw3T5DacAGpmAEorsfC68Q
         8MvnVRmhgJVq3NXzii8igiqiajcpeTU9woRV1UMKkktL7ZatK45iUG/82Wpap8xUUwNi
         o4VQ==
X-Gm-Message-State: AOAM532u7IkXGKXSzgb1ladko8XfiRijddY1LnRiA95ehILhPFp0UAlT
	oP0oK8pEa1OxlE8T3K9P304=
X-Google-Smtp-Source: ABdhPJyBYZRwa7RYbSLxSN9njezziOXWsVvo0qyZj7kAQJZ93dduXHe5ZkjnlVKM5qINTai7UGNkWA==
X-Received: by 2002:a37:4553:: with SMTP id s80mr18877596qka.167.1620046476317;
        Mon, 03 May 2021 05:54:36 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id 19sm1940867qkn.111.2021.05.03.05.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 05:54:35 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] kernel: consolidated pull request
Date: Mon,  3 May 2021 08:54:26 -0400
Message-Id: <cover.1620046297.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next queue of kernel related changes. Nothing particularly out
of the ordinary here. -stable updates and config tweaks.

There is a perf change for an issue reported on IRC. Clearly no one uses
the audit functionality much, since when I was doing the python3 conversion
and over zealous replace broke the audit-python RDEPENDS.

I've now added audit to my local perf PAKCAGECONFIG, and have confirmed
that it builds and runs.

Cheers,

Bruce

The following changes since commit f353ba0ec23a26dc9058e272dc769382ebd5c32f:

  wireless-regdb: upgrade 2020.11.20 -> 2021.04.21 (2021-05-02 23:21:42 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/5.10: aufs fixes
  linux-yocto/5.10: qemuriscv32.cfg: RV32 only supports 1G physical
    memory
  linux-yocto/5.10: update to v5.10.32
  linux-yocto/5.4: update to v5.4.114
  perf: fix python-audit RDEPENDS
  linux-yocto/5.10: update to v5.10.34
  linux-yocto/5.4: update to v5.4.116

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++++++---------
 meta/recipes-kernel/perf/perf.bb              |  2 +-
 7 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.19.1

