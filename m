Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.31426.1629987824657192536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 07:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kk2ZTQF5;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id bk29so3483187qkb.8
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 07:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hgyK8JSibFLiH4ishy08NMO6MqIEoxIAe9ZcE5LkIiQ=;
        b=Kk2ZTQF5BOkaBSwgXPL0qoV+ZOikDtdRKzCKKFr0NzdF4gu3agiNpGjzq08ZIoIQLa
         ikHVsdo4eD211p3nIwX70nJggByVKb2qPCsIeoN+Vvjckq2dNvbxXIjlYy7ksqRRSQXA
         ZTIJD++9I6pw8n6n3HoxXNcIGDGERd2EbmMMcuLAo2Vg+NBR02zLDz5/w8iHxuRKZMkd
         dDa05tS8iKWe7jL3NtPbm2HtmZ+pED2LPkpFlZL9B12p90uLmIe7fgLkxNMicPXGw1bi
         Aq5m2bommzbKYWcG577TpEGUyksMhD1HxjqoMbyMAyE82IPnVkoBzWAcx6ckaC4eu8F3
         Zp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hgyK8JSibFLiH4ishy08NMO6MqIEoxIAe9ZcE5LkIiQ=;
        b=t2UEDaMSZUVkJWsjRUN4GfdzIRYNipVQSehIy1yx+99w7uh3eaiKuxYtb5lea3uMRN
         XLrwKKG2HFmzOe5jrRMrlTw4Cf4Og/8rfgy1CEvxKvQQr/w0sMvRJ6azp7fice0eiyAV
         tekQ+Sk3Exe+sxiKmyECN56zi7kT7SJcrMouJNB1nruE54cQ4SpcEPOR9I2hrkPxvqc3
         PnBQLeBbsqUx2Okaax3R4SJfYXVrN4/wmnM7iDtxNPmUsLSliHxRbaV3ExS1G4X34le7
         O4cJuJifuAlBTOLzQVrfXF/5UgEpWE6gHWE/bRY6R9J1eE3+SMstgf6re0nfVydyc61g
         ShMQ==
X-Gm-Message-State: AOAM531hDGXD50QBVqwz+8u8RkJe43W5v10YglJoUKvXiBsWnPDN2Lv6
	WfA2DlyTVl4qM1rEHrMxFEbC0EJaD8g1kA==
X-Google-Smtp-Source: ABdhPJwhO2yk0oJUCW1aJiuFp4Euiost8H3lqiXah2ePipU6VdyYnXVKP3v4JsuAUWWacx1mw31D3g==
X-Received: by 2002:a37:803:: with SMTP id 3mr4029229qki.127.1629987823644;
        Thu, 26 Aug 2021 07:23:43 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id q10sm2676124qke.108.2021.08.26.07.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 07:23:43 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4][v2]: kernel-yocto: -stable version bumps
Date: Thu, 26 Aug 2021 10:23:37 -0400
Message-Id: <cover.1629987648.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

v2: The one time I skip a step, my scripts went off into the weeds and
    didn't bump all branches (due to me messing with supporting both
    dunfell and master).

    The only updated patch is the 5.13.12 bump, but I've resent them all.

    I still didn't do an AB run on this, but visually, you can see all
    the SRCREVs have been udpated.

v1: Nothing too exciting here. These have all build locally and I haven't picked
    up any issues (I've stayed off the AB, due to the extra load you mentioned
    it has been under).

Cheers,

Bruce

The following changes since commit c3e72164e7a0c51de04a9295e5f50c2e233965f7:

  libjitterentropy: remove contaminated hashequiv entry (2021-08-24 09:37:22 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/5.13: update to v5.13.11
  linux-yocto/5.10: update to v5.10.59
  linux-yocto/5.13: update to v5.13.12
  linux-yocto/5.10: update to v5.10.60

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.13.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.13.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 26 +++++++++----------
 6 files changed, 39 insertions(+), 39 deletions(-)

-- 
2.19.1

