Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D136C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 18:23:44 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.10997.1642184622883820444
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TxV3y6TR;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id l17so11538351qtk.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jan 2022 10:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tMvKhwJqDqSv9xtFKKomUi8PtFIISAn/I4pmd0vyb30=;
        b=TxV3y6TRjRVXRzjTUJFopRmQ4Ej9NWoDd5oLADbASjosrydod+RZd8oB0TPH1JvSGl
         N+4Ep6ksKW7dF0MXNrBU/028h+nIQgBycF43ISBizdHMFPavI3zAcznkQuiDRmMuWgOV
         MO9gCb/CaJNM7E8iBkqCd3HNIox4bZ5Yef4LZ/vgxCkHyev99C8NzSDr+y6z1KSZ6tt0
         tVosv3T3VfAHR6DiApq+rcHtggeKKQP+eMUdlTf644Lf1HcyhilGmPYmGl5AZQVJtwjd
         uhUD+H/HNHGyZ6os/3AdLCfDvFGCyS45vbdZjTVWB4jMN2NGHch0/vDsNnI+h+PDGx6N
         X9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tMvKhwJqDqSv9xtFKKomUi8PtFIISAn/I4pmd0vyb30=;
        b=z0IdF0ojiNpshXasV7pdqThIOrj94873v39a5VzJatuuDRW32oxTXt6FHKFOO3Vbn6
         jVfp9DeJ4kdrJvmeka1EFgSvsJNie6umvlDbH+1bfoMnD3njU8IAuz47MSXvyyvJpALI
         4oyxF5jrmINoGloap00OFRAUbxNN80k0e70flx/NJ1hmIDryoL+1UMAVM8DWeKQWZ2G3
         0CkyBUpC+QD9+ToJgBvJHGOWK5Y4Lvw4NO2JIzfrBm6Figj6/YtuFwNYF2laa2l4h/5X
         qXmJ25VyihMSo88xg4T3NpCh+HB+z004moggGCIrvr2cZFy0SzdVOUD2E7f7MsPOYFAI
         qHgw==
X-Gm-Message-State: AOAM532AYAUnq1TzGzajB1TbCvBjWamxMGRR2K2FgvUQwgFzf46ts+QI
	PpBQ0/Y3LLxLfy3WMvWvLlA=
X-Google-Smtp-Source: 
 ABdhPJwyjgSp83Z0Qg8IAGx605v/YP0aEI/da8uv/nwhu+r9xHmCScld8qcLYu3nnYlhaaD5lojpBg==
X-Received: by 2002:a05:622a:1a19:: with SMTP id
 f25mr7170076qtb.329.1642184621869;
        Fri, 14 Jan 2022 10:23:41 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 z14sm4448995qtw.59.2022.01.14.10.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:23:41 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel: consolidated pull request
Date: Fri, 14 Jan 2022 13:23:33 -0500
Message-Id: <cover.1642184457.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 18:23:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160584

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the latest round of configuration, CVE, warning and -stable
fixes against the active kernels.

I've also included the lttng-modules fix again, since it supports the
5.16 work that is underway.

Bruce

The following changes since commit f9f3e1bd3e1144f237598c6e20874bc621de6190:

  go: fix building without SECURITY_LDFLAGS (2022-01-14 09:25:31 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  lttng-modules: update to 2.13.1
  linux-yocto/5.15: fix arm defconfig warnings
  linux-yocto/5.10: amdgpu: updates for CVE-2021-42327
  linux-yocto/5.15: update to v5.15.14
  linux-yocto/5.10: update to v5.10.91
  linux-yocto-rt/5.15: update to -rt22

 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 ...Remove-deprecated-CPU-hotplug-functi.patch | 394 ---------
 ...ile-Enable-Wimplicit-fallthrough-for.patch | 829 ------------------
 ...ules_2.13.0.bb => lttng-modules_2.13.1.bb} |   4 +-
 9 files changed, 40 insertions(+), 1265 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-cpu-hotplug-Remove-deprecated-CPU-hotplug-functi.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-Revert-Makefile-Enable-Wimplicit-fallthrough-for.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.0.bb => lttng-modules_2.13.1.bb} (86%)

-- 
2.19.1


