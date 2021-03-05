Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.7501.1614916469586095446
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 19:54:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dsk7qBjt;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id s7so778538qkg.4
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Mar 2021 19:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tLuRqKJRDHvJj6BXO3MMNlwNdMnpwRrd1qqhdy9d4mY=;
        b=Dsk7qBjtAQYDpyN2OyzCrnH9hnbf1ury5ZmnzxPOPcVOgmtAy2VcitRow5CIqexg+d
         Id49tPqlFtbt6HtVh7/w2BGcr5jtHQIz6FzZcVvXD8XkMOmsXT+v0IuvyxRmkoax7L7e
         zMQNbQ4Fm6MKkFDrAn7DRfHC6r0oNRc3oAJTxPYIOPtwYBMRmvcKPmO88t1zpry2LcHC
         njUoF4uGeFsL81DerQA2pbhkjNuOOzZfSSQtHSXQUQRgnst4d/9IGxEUz377pOlxLX2T
         +1JofmIzUdjREQb7FnwJ+wdVH1Qv2L/Q+/DL+Tpx9x6OfXsS5Dh8aR6jW+27Rii1LxPQ
         8eBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tLuRqKJRDHvJj6BXO3MMNlwNdMnpwRrd1qqhdy9d4mY=;
        b=KomwinRA+udyqvDOtlGENvSrMsjEnVI6vd4g8UVc7ONCoaNa/ngGqcxk3vlgpw9QKI
         MPd8CSduFLNa2mkrlWMVWOIkyWI4FkMB/MQTLKHt5XkjZn93kHVWEgpkAy/QCfHnbEYC
         ALVUHRBvO3RdlEpjHQYOOUczoWvQ0bIeKzcrdzhE/JGeQA+v4NWJI8shViLZtv3kguvP
         tVflUR6nkiLrX91LX9MlUALlHTHmjkSOwmPISTjiAA2VN764NGQpQEhDfrQFezwWemwn
         cqH6bCIh39N22yGTm5QbxhDMTPyZFpk1UwCiurtVq2cgZYArmGhJapY6Noil6yzItYex
         LSIQ==
X-Gm-Message-State: AOAM533dk0yJ1gMsmzW47j+l6gpabkGUmABbgpb5jnyWM95azOHEhe/O
	rbHUsxMDw4TCNBggYj3nsGs=
X-Google-Smtp-Source: ABdhPJxNt/ACpwrzSfCRfWFsmRoAjnUie8OygcDXLjFBRfbgOJSo5O56ieZbXghWaOWvlyT1OKoktg==
X-Received: by 2002:a05:620a:13a6:: with SMTP id m6mr7492977qki.64.1614916468605;
        Thu, 04 Mar 2021 19:54:28 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id 66sm997383qkk.18.2021.03.04.19.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 19:54:28 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] linux-yocto: consolidated pull request
Date: Thu,  4 Mar 2021 22:54:20 -0500
Message-Id: <cover.1614916283.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

As mentioned previously, here's my next set of -stable version bumps and
two boot/traces fixes.

These have been building and booting here without issue, so I don't expect
much trouble from them.

Cheers,

Bruce


The following changes since commit ed7151f9856791fc4a24b1a0a88f87c442b29f38:

  systemd-bootchart: Disable LTO to fix reproducibility (2021-03-01 11:12:16 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto/5.10: fix x86 32bit boot warnings
  linux-yocto/5.10: fix qemumips testimage failures
  linux-yocto/5.10: update to v5.10.17 and -rt31
  linux-yocto/5.4: update to v5.4.99
  linux-yocto/5.10: update to v5.10.19
  linux-yocto/5.4: update to v5.4.101

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 6 files changed, 36 insertions(+), 36 deletions(-)

-- 
2.19.1

