Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.5509.1624803240809145732
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 07:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oFi8CvfZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id g12so11525780qtb.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 07:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+yJCeHIavM+Rfqfu2lgHARv2zF+iCH3+L7c2zYnLLdg=;
        b=oFi8CvfZWUIRM9oKTvY1lqWf52bW/0vZ8Mf7nNerNZAY18fIBGN0DQH4DHTlLxkg24
         nLzS3HwWEa3ZaKf6A8JD7XZyF02EkIrRK4fVvtEmmZJM9oAKtgcuxlfXtbCTAv7FPibR
         S/8rOSjQnt/3h4HqF0PKlVcf/AzfbUSVK1IKT3VYa8ZROFiEpKIW/O/cK5PkmAao6DKC
         PunSADll9GInJWQH+jrmizNUXjang118HNkUk1OudjZ7e+frbSg/FkTzhnEbuGnu/iwJ
         6XKUyAlyeMHR32XPQM8n+NB0c4IdEn+QtDJ17o5CVKidcI68S+SdjPmJfc1qoalpa2PF
         gkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+yJCeHIavM+Rfqfu2lgHARv2zF+iCH3+L7c2zYnLLdg=;
        b=URsSMN1K1mflLoE5qmh1eB00WvoH6h4VVdHna1w2VDubQKWz0k83YrNupqu/N3/Cx9
         jWxqphucL5pgOC1VY+hZ2mEoBU85T0C1KtklX1S5EVhCs+tzI3Bgx2BoHlZMmB6L0NDv
         XkDfN9xdyYwyK7d0faklIG0Rs7uUmHLGlvvIbeDHHmnNidGojpCedg2LIMMcNcFs0JAk
         3anQciCAw93Do81FAM2wAE82StyoerGFqgBuizWVVInjfZdxHfCHXSUbPj9JFgFpqKob
         jkjuh/E8cd/EeFGaFyB8N50Q+1SBwARHsS16ankeOgeTtn2t6yYc/1f571tVWiYPzwR6
         G62A==
X-Gm-Message-State: AOAM532jwkIfrKH+PpDT8CkQHPiE4NzbX95WLK583aI1ZDHhYQlLAbT2
	bZvIbjmPuyDsmBz2UE3ZeXk=
X-Google-Smtp-Source: ABdhPJxkP/+8bV643EPC8WBJJtZTmM6IdeN6qNtxIWoDdOsKAveuXGk+r0nvUKUan8Rr71/3W07Epg==
X-Received: by 2002:ac8:41d3:: with SMTP id o19mr17902372qtm.90.1624803239923;
        Sun, 27 Jun 2021 07:13:59 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id j8sm5496142qti.20.2021.06.27.07.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 07:13:59 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto: consolidated pull request
Date: Sun, 27 Jun 2021 10:13:53 -0400
Message-Id: <cover.1624803046.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here are the next -stable integrations, along with some kconfig cleanup
and a backport of the identified rcu looking issue.

Next up will be libc-headers updates, along with the 5.13 reference
kernel (and the dropping of 5.4 from active in master).

Cheers,

Bruce

The following changes since commit 2834c2f853bd0d988dd1e35d4300005be05f8b19:

  populate_sdk_ext: copy BBMULTICONFIG files (2021-06-22 15:18:11 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/5.10: update to v5.10.46
  linux-yocto/5.4: update to v5.4.128
  linux-yocto/5.10: features/nft_tables: refresh config options
  linux-yocto/5.10: rcu: Fix stall-warning deadlock due to non-release
    of rcu_node ->lock

 .../linux/linux-yocto_5.10.bbappend           |  8 +++----
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 7 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.19.1

