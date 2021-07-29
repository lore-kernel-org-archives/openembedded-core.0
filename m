Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web08.5458.1627534206327842839
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 21:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fLnDfFG4;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id 184so4746797qkh.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 21:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WlXibDU+f2JLbDvVHEulJGvY1jlmcUgaiAIksbA3jhA=;
        b=fLnDfFG4LSEj8w/DOeFjrKVJI2ds0DzsyDn2C0nh5ZdjAEh60A7i3Sun/7LUOBovER
         VCKNh+Au/AEvKlW/+fv0/F+84trmmLJEnrif1OM7ZKK3Is+yTuNNLBAYicq7bhqOl7Kp
         nXPWi5X9dymMbnlILdGiRGoY9VKYRUIij0VyKHc3Ce52kz4msGGLudlli3LcwFbIXwct
         +/rN0KuA/Dctx0IM6EfFfAR27lGCtAFA6URrwN0qgliCmI3QUy8uTws7QCgrq9BDJzgl
         8iDFDHldzicexKOCBhQ6NIgqcezk92KD4lwk60o9kSw+5yy31jFh8RUfqrYBOtwWLDWO
         XUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WlXibDU+f2JLbDvVHEulJGvY1jlmcUgaiAIksbA3jhA=;
        b=dilGDF8sTM6AHvKHFsDCyOX3q2oYN0UaIDETL/XnVzLMMiSjrzW6jfNLv/dGJ/zxMy
         ze3/2BAuFIR1nd582+V/fj+iWVv2PP/RJDSOKZYYZUU+PnhYt81Oyy0eFOIHMFYCkh6Z
         BhDUvxbcbfHLVyb+bi1r3bjvlAG/KzrF/W6MDA7otrk2aHQ/3HMOwIWOfMFBh+541P7i
         oXpIMmJC9yivhNGy0ZsNH1I87tfg0Yw/CFHPVph6Tdzddolv4KWdtBWa1bZ1oFThCuaO
         hGSuMKUZZbNWk29VTMDb9w4lTbtk9MTtsXw+clAqHJhwt+nhBTFJ15vk2dlRrtcRFFtE
         g8hA==
X-Gm-Message-State: AOAM533Rf/aeCzZhsz1f2o1a8AeVD0zpcb+F2cq1AVRcaqD1+KRtLJZC
	b+887LrjKVdV/643mN1sBMM=
X-Google-Smtp-Source: ABdhPJwHbhSRqLGC6kpk9fNfMcn2Qi2PevK+m8sqsGcGhwCqHzqQfJrLcFZkd5I6r8pHnGhNOFUyvA==
X-Received: by 2002:a05:620a:235:: with SMTP id u21mr3478058qkm.450.1627534205455;
        Wed, 28 Jul 2021 21:50:05 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id t26sm826147qtc.44.2021.07.28.21.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 21:50:05 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel-yocto: consolidated pull request
Date: Thu, 29 Jul 2021 00:49:57 -0400
Message-Id: <cover.1627533955.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next set of -stable updates to the active kernels, a -rt
bugfix import and some configuration tweaks requested by Ross.

I do have commits locally to make 5.13 the default kernel for the
reference poky layers, but I'm heading out on vacation and won't
be around to do a lot of debugging if they cause issues.

I was planning on holding them and sending them, plus the 5.4 removal
in mid August. If you want them sooner, or for testing, I can make
them available .. just let me know.

Bruce

The following changes since commit 4a1381d350aa1acc75ca1e6d03b8067483c162f5:

  archiver.bbclass: fix do_ar_configured failure for kernel (2021-07-28 23:47:00 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto/5.10: update to v5.10.53
  linux-yocto/5.13: update to v5.13.5
  linux-yocto/5.4: update to v5.4.135
  linux-yocto-rt/5.10: update to -rt47
  linux-yocto/5.10: enable TYPEC_TCPCI in usbc fragment
  linux-yocto/5.13: enable TYPEC_TCPCI in usbc fragment

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.13.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.13.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 26 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++++++--------
 9 files changed, 57 insertions(+), 57 deletions(-)

-- 
2.19.1

