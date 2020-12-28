Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.46274.1609166168238076414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 06:36:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yjn1fIId;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id j1so5727830pld.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 06:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=VlkpWchkmgw25/d6D65kMBeU7yxMKzZSKJcKX4L4PbY=;
        b=yjn1fIIdSaQyisKat9pN7/7/sZ401NTRdiucVJxu7mckZO75an5DqvDODyCbpSQnxs
         JN8wJeKJrS/GKk076V4HYvHMPqDKBW4wZBQ/8bYTPMyZN0uNAno/txoOx3WFKoV2oFog
         34HjOopkTkGpWTvKrds4kJAVEu94aqMUg8YiRLgQ/cx1kzRlIboAAJY6OLi+Vwo+9F28
         N5Z/V4mfnE2Q237/Qk4OVolxi+pE6HzDE6htNGq/KkAZScQAFurGyd8zlBniL7v5IKmK
         xG0NkaHD3A4MAoJXa2JseSW8ZOB3NzGVZwbcPG/s8bKFM+coCi5mI8AYJRimtL8bfZdY
         ytww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=VlkpWchkmgw25/d6D65kMBeU7yxMKzZSKJcKX4L4PbY=;
        b=B6nwKgWuXlNunpT/JbHsXtF2Ks/vL5n8qL64TNRHDIr264kfFlzvLwhsaMEAvq6Pj1
         1IDCG0kl4Z/dK7sOU4v4u7NqIB7pfspKlpmBcT3f3MPOYDyz8NMRbk8JznXa8u4jNgx5
         HUw3Xef1NwntNF5d5THmOdxs5A05UoYXSkUMEpqD8AlAI5Py81CXUvrj23iGerzuh/b1
         TdysNqGlp9kvlQlBxj3YwhPuOI8HHdaVRcoDnb1ei3K0DxrQrTbUPKpZBk22Lrr2I7jb
         OE27G130otReYyL6o3dnEfuPqqgd3RSpwbzVxQ1pmfTjhveNyKMJO7ym2NuVz02SnLam
         aOAQ==
X-Gm-Message-State: AOAM531SJtWxpl3P2tnE7YEUoyy9RSw1dR4lIGVMF+w5rSUEnACLUzli
	YurDinMHjSaKVUK+I6gGhp8RAZ9cXppESrp7pWo=
X-Google-Smtp-Source: ABdhPJyALaRadHie7bDyvFKnnZthyZnCexVg6NuO8JM15FsN7tpqPF+lmYMcdhR5AJbnc+s5AmThBw==
X-Received: by 2002:a17:902:599d:b029:da:fcfd:7088 with SMTP id p29-20020a170902599db02900dafcfd7088mr44680424pli.68.1609166167063;
        Mon, 28 Dec 2020 06:36:07 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b22sm36422469pfo.163.2020.12.28.06.36.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 06:36:06 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/8] Patch review
Date: Mon, 28 Dec 2020 04:35:40 -1000
Message-Id: <cover.1609165912.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back by
end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1700

The following changes since commit 02870c7fbaaa1c3869ecb439f5c58fcf40a533be:

  binutils: fix CVE-2020-16592/16598 (2020-12-14 05:58:27 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (2):
  selftest/reproducible: enable world reproducibility test
  selftest/reproducible: add an exclusion list for items that are not
    yet reproducible

Richard Purdie (5):
  grub: Fix build reproducibility issue
  grub: Add second fix for determinism issue
  u-boot-tools: Fix reproducibility issue
  groff: Fix reproducibility issue
  man-db: Avoid reproducibility failures after fixing groff-native

Steve Sakoman (1):
  selftest/reproducible: add packages to exclusion list for dunfell

 meta/lib/oeqa/selftest/cases/reproducible.py  | 96 ++++++++++++++++++-
 meta/recipes-bsp/grub/files/determinism.patch | 40 ++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 meta/recipes-bsp/u-boot/u-boot-tools.inc      | 15 +++
 meta/recipes-extended/groff/groff_1.22.4.bb   |  2 +-
 meta/recipes-extended/man-db/man-db_2.9.0.bb  |  5 +
 6 files changed, 154 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/determinism.patch

-- 
2.17.1

