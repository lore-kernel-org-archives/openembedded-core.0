Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.10542.1594990597741720896
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 05:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dA2AtZ2T;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id b4so8579292qkn.11
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 05:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=twSwWdOp5GCkmQMVjd/I1CDSXFx+7yja9AEhhtTEbfA=;
        b=dA2AtZ2T8a6Js8x2xyYmI8wrL1I2rwICWvHoh9i3uwVRy+3UgqV4UtJ5wvVJcYXnWb
         t0dXnp2OHmpr7YFo5yw2ZHlSwPs7UL3uBsPqzyFeb6HXEY01QSOeXTOvX1Bs+4aelO4F
         W8m0Duehplpjfa49tnBZkF34gNji5xMRP2o5KNHHJO2ZFfM8mWDbBXamHsk4DZpqe0fp
         LS/9aSBtGdDCPlH7F9nm6H9DS7np0Z0wCcdWWoYrapwNtDFczg5rTzzjoJ94PzbGdlux
         W1gPrbLUcL12Ja3Vp9zvZqrIvCia+lLQPEAt029PCUvi9+ZAODb47fxsN0f5rPzcRBmM
         Ubhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=twSwWdOp5GCkmQMVjd/I1CDSXFx+7yja9AEhhtTEbfA=;
        b=T3GGV1qZx/u5UJgmtf+v40RnebZ0IFsXvdRjWxYQRwccO7E0u8VX6CnODMxhztFs2G
         lKRipqjX0XM289KI/duWw1PeixSs6r84r0RCWMISGmMKNapRD69bZt8B4vrZ4nvI61e5
         26yR64dZzrX1wtZHle9Gn28BqFiuOOnT2/GxNCDMbty1+qGcKJaweTFlaCvzOGs7Paiw
         Ghq4twH9inYkJooIuDTnYr2WAJ8Y86S8dTt1U1O5lErB74rexmJIZbdTWG8EKJh7ywm+
         kJKoW2LgAigHIbsrem5vIqz+clRvpsrmQgUjkhxoit8YxaLJ7rj2KbPYzzB/MkT0l4vd
         5klw==
X-Gm-Message-State: AOAM532OKSlHIvydFXDMCw0i7TnV6iQujSy4/mfZb4e8sUVGcFHo+Uc2
	M+RMCdMt8rJuXl3grtiFGmg=
X-Google-Smtp-Source: ABdhPJzanrkXFmnBjoL4y5Oc8TivEyd0BZP2tfrPMIXEpaO/9Og79Ya98xxLeyxxzlMtHXxcmnvJ8w==
X-Received: by 2002:a37:8905:: with SMTP id l5mr8383375qkd.302.1594990596771;
        Fri, 17 Jul 2020 05:56:36 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 79sm10431808qkd.134.2020.07.17.05.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 05:56:36 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] kernel/yocto: conslidated pull request
Date: Fri, 17 Jul 2020 08:56:30 -0400
Message-Id: <cover.1594989620.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's my latest set of patches.

For 5.4: a -stable update, and -rt bug fix

For the build: a tweak to the config generation (as reported
and discussed on the mailing list)

For 5.8 (aka the next reference kernel): a fix for devsrc and
on target kernel building. With this tweak, I have all of the
refrences booting and passing most tests on 5.8, so we are in
good shape on that front. I'll be doing libc-headers testing
next.

I ran these through the AB and local testing, no issues popped
up, except a warning on qemuarm-alt in my last run. It was
about a console login and didn't look related to the change,
but I'm keeping my eye on it.

Cheers,

Bruce

The following changes since commit 968fcf4989f86a0a41fd1ccf08be3e73af428136:

  bitbake: server/process: Increase timeout for commands (2020-07-08 12:12:45 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/5.4: update to v5.4.51
  linux-yocto-rt/5.4: fix mmdrop stress test issues
  kernel-yocto: account for extracted defconfig in elements check
  kernel-devsrc: fix on-target module build for v5.8+

 meta/classes/kernel-yocto.bbclass             |  2 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb    | 16 ++++++++++++++
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 5 files changed, 35 insertions(+), 19 deletions(-)

-- 
2.19.1

