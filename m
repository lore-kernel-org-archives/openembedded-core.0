Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.17362.1610489653465511994
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 14:14:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U87Cc/s8;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id e22so7518018iom.5
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 14:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i9Xw7KP53js31RfmnA6OnzX9OTjBi/8Y6KRxbNHk6G8=;
        b=U87Cc/s8v2BYJfBcB89+iQE8LJWh0MHab8k/V+RgPK1wOjPfbDgtbCWfZTK3Zm6OSH
         NjvRyimubSft+Hjhw+8PBPQd9GmQDEhLxPVl+cR6+DDk0qpZe4u2VDHpKitaq05+LqcJ
         xnqjAMUPbmOPlJ0JRF53VPGg9So2NiuvGpv86lezyIGSzZkaag8Hs8V4ftkOUpI4D4Um
         M8S5gCjF847oNKiovJqdyXQrnmWtcUCyh69szvdj8Yokp03Do2MeDe0qeX85XPV4g8qf
         qxhWEbJCHouJ2ISHRIuyysicoTnDD4UCXyN0HgBVt2PAyuGT2nnBAT1cklP0HPN+j9yR
         OkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i9Xw7KP53js31RfmnA6OnzX9OTjBi/8Y6KRxbNHk6G8=;
        b=LYA03d3IKh5NBAgG/hDGaOTU5Gsnsvps5DFXB1Uarfi+HJX4m5h7b3SFFyEh2q0IEM
         N32NOEPaWBVC0bhciL7ePZlnvRyoi0/bpCC1bnYCd1jWiO0W/qSOV6ir6OUkAUjeFgv5
         7aPDOO87dIDkwpu017zrr0aYNemnHLLm27LsRtmJCmdSbQC+O8CrBdJ8LfDroI+9CH4z
         mkDuycANuTjD9FLdJWzQFBo2YW3/Hjuol0salPbtjvxXRoWIy3uQEQS6wKqEwH1tfPP9
         4xOtqiBcED0MCgIygxUFQH/a59vWHec76wsU8vblik1f48DHHux6Y2gREJoEaz4utkhs
         MsvQ==
X-Gm-Message-State: AOAM530zzo16adVSV6TPJ7uA1qdfE8WHa7hwrnWXFmVoMyV4JYbZb4Mc
	MAGAIUJhRAsn+wwFZZu+Cuk=
X-Google-Smtp-Source: ABdhPJyYauGrEcPQsP1B+ObWv9+dNAD6Lb2dTSj7WPfKBLlrgtFEKmKHCxhNmzzANxhxoKy8KHNvcw==
X-Received: by 2002:a92:c692:: with SMTP id o18mr1255531ilg.215.1610489652731;
        Tue, 12 Jan 2021 14:14:12 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id s10sm62356iob.4.2021.01.12.14.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 14:14:12 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto: consolidated pull request
Date: Tue, 12 Jan 2021 17:14:06 -0500
Message-Id: <cover.1610489445.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next set of -stable and configuration tweaks for the reference
kernels.

I'm holding back the 5.8 removal just a bit longer, since I want to see that
these + the 5.10 hardware reference bumps aren't causing issues before I
shake that branch.

Cheers,

Bruce

The following changes since commit eee3a23be1768986a51f8612efb78ce115d51368:

  net-tools: correct version check (2021-01-10 22:39:27 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/5.10: update to v5.10.4
  linux-yocto/5.10: update to v5.10.5
  linux-yocto/5.4: update to v5.4.87
  linux-yocto/5.10/cfg: x86 and beaglebone config fixes

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 6 files changed, 36 insertions(+), 36 deletions(-)

-- 
2.19.1

