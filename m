Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.25042.1588520673975235186
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 08:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NRo5HD4p;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id k81so11426920qke.5
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 08:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mJCQCnfDVOPEDWxJx1xhaPzCnYS3ZRh33r8LA370P1U=;
        b=NRo5HD4peZ+q2OsqZEA5q9thmAf7flTOvuvYEW3K5O3Llyf4jZtgs+AJoLcpshecNU
         VZhIvbkSLHHt1Mk4hNUh+9KCA523E3cIXqb/C6SOheJjscyfvBLQG5eCGYhcb0jMSu4b
         1Xm/U01Obs6QLCUdD9t5La46DhlRoCxlFzeSDzuVgeBDtU/X1rCDF5bveK4ji5w1nCW4
         tuT0pW9Srl7Mfd5SFwL63R1Ne5a09BVRnAGJDe49VjTgWV9ku58OjqECJQk1TwksD2OD
         lLSijJSaTC0tx1ysJeqIyWYBTRrsme4edEspIs2Wt2kuc9ScIs6ktDhq1P+eB8Vz2EYB
         R6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mJCQCnfDVOPEDWxJx1xhaPzCnYS3ZRh33r8LA370P1U=;
        b=KJEQ5gEv59IpHyX3dwyhTFWseatV2YmA2wQXXDV5TDE9OHGOoa97pRi3gaaudrktmJ
         OAheI861IdW6ylJ/dqafOEjLz9mh0PzqGrsw3x5FaohHUGLojTLaDDNn9l9V2+8Keil+
         T1wsXpLDtW92YJo46/kYfbXQbLhuUgxvgyZBNDvvyimsZKGtWAvleGrn0DR1/RLPHJl7
         SR1goNAGGS+SCz9HWk84sOCGgzMMFvkxivHYZig+hiBDLS3Nn4PNPc4kWyETwBVRiDPz
         ZwNq1mRHBok0Ia1VrCnY7lrr2SvF6V/iDXy6FqeS1f1AvfAlygwpkjnK2W+Wx73JzUMp
         mzHw==
X-Gm-Message-State: AGi0PuaxUTI+RIaWH3HcC+KYax5OdM/4ZqDo63sxeWqJ032W+gsYpUyP
	ihTP8VDZcwbgPsew4ieuVdE=
X-Google-Smtp-Source: APiQypJcCtfcSWM918CKF7tvxsHyvONZjnO0QnudF3fpMfeseMZeD9mQ3L0Ci/c+bPC+mf1O5B9WWA==
X-Received: by 2002:a37:7ac2:: with SMTP id v185mr11724133qkc.386.1588520673059;
        Sun, 03 May 2020 08:44:33 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id p4sm7771506qkg.48.2020.05.03.08.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 08:44:32 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Subject: [PATCH 0/5] linux-yocto: consolidated pull request
Date: Sun,  3 May 2020 11:44:25 -0400
Message-Id: <cover.1588520452.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Here are the -stable updates I've collected since m3 of dunfell. I ran
things through the autobuilder, and no new kernel issues were picked up.

The -dev bump is good for master, while all of the 5.4-stable bumps are
good for both master and dunfell.

Cheers,

Bruce

The following changes since commit 2e11d97b6c95e89aa1f9d3603a966c94c442469e:

  oeqa/qemurunner: Clean up failure handling (2020-04-26 14:00:51 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/5.4: update to v5.4.28
  linux-yocto/5.4: update to v5.4.32
  linux-yocto/5.4: update to v5.4.34
  linux-yocto/5.4: update to v5.4.38
  linux-yocto-dev: bump to v5.7-rc

 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  2 +-
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 4 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.19.1

