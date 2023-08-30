Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C615C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:48:40 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.1277.1693417713603642351
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fXm73qKF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-68730bafa6bso790543b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417712; x=1694022512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MdRiKKyGvNqe2hCaU3LDKIxnSs/KjpPa9lCkGwL8NDM=;
        b=fXm73qKFGZ4i+vwTkcxJNcHELwR8wj9v3uvZkdrdeP/3axfFl8p8XzfRJl6oPFJ9dS
         sQAW/LuYQ7R+qy7aN2yLYTlbkllxFlTyKRHXWEeLLXmV1p3SYH07c1bDg5yEnW9WntUn
         M0yak75ENonyQt2i5UlKOzdjgvR0Xj71mYYF2A/Bb5YH8CM0TlpVrmImp9vc8Pi/58NO
         k1zqTBUsiJCMDbhg1rPtHq4cqiqQuuZZlvcspklJLZNmNxvHTZ4dNZGJsJY+XDCGhi5g
         c7qzKtTAkeze0/By3LUqY4BvfOdkDJ4MbZwSkILsrlSCzCFBVbqhPb7O5oi8ACYMViPg
         Zy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417712; x=1694022512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MdRiKKyGvNqe2hCaU3LDKIxnSs/KjpPa9lCkGwL8NDM=;
        b=P7+igwSJe4FiwRZqH0onHUkb9CeZv5M0RIDTZOIGvIbjksjBFQcfB4oMcirG+wM8yK
         wg1Lg6LNlEwfPy7PxMboWSMaBeW3kWeVow65esibVj9SS0/yC4hMAVuu2uKX+wP5ZVen
         21lbTatGVGe1zwPQk9XqNJv3EUgP6IXDNtaaqgbd3AXGd5pzFil7hX0ZxeEDifmHXvtZ
         KNMGgVHienLvNCKZd94MuEWE4Y9CIbF7eMtOhT/vITA5o71QKDIj1Y2ekyE5+C7a342s
         1xdXPEUBeSLh1Zd8QUKhlj8kXjmy8dyDkQnGQV1gjmF5c2ar/U2DQ6OhrViTvCjKn1rg
         aT6A==
X-Gm-Message-State: AOJu0YzV+zq2XPTuHZOapewA15WktTVmTC0Snvg4AU/QKd0RddsCsjQw
	6nxZSaUT03eDGSGzU5m6E4C9f1RqD/2uo1HCn+g=
X-Google-Smtp-Source: AGHT+IHxgewma7EpJ6ENgL+xw5eTG6IS9dg7dcP/q8YSmMHyUebhHgkSBAJzeLRbrlcuQFvTAwpu1g==
X-Received: by 2002:a05:6a20:1451:b0:123:152d:d46b with SMTP id a17-20020a056a20145100b00123152dd46bmr522381pzi.26.1693417712446;
        Wed, 30 Aug 2023 10:48:32 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.48.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:48:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/20] Patch review
Date: Wed, 30 Aug 2023 07:48:04 -1000
Message-Id: <cover.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186902

Please review this set of patches for mickledore and have comments back by
end of day Friday, September 1.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5798

The following changes since commit a46782c9f54bcb0389ea1016e37b6939aae79bfb:

  resulttool/report: Avoid divide by zero (2023-08-25 12:24:11 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Anuj Mittal (1):
  gstreamer1.0: upgrade 1.22.4 -> 1.22.5

Bruce Ashfield (7):
  linux-yocto/6.1: update to v6.1.41
  linux-yocto/6.1: update to v6.1.43
  linux-yocto/6.1: update to v6.1.44
  linux-yocto/6.1: update to v6.1.45
  linux-yocto/6.1: fix uninitialized read in nohz_full/isolcpus setup
  linux-yocto/6.1: update to v6.1.46
  linux-yocto/6.1: fix IRQ-80 warnings

Etienne Cordonnier (1):
  vim: update obsolete comment

Khem Raj (1):
  build-sysroots: Add SUMMARY field

Markus Niebel (1):
  wic: fix wrong attempt to create file system in upartitioned regions

Martin Jansa (1):
  tcl: prevent installing another copy of tzdata

Narpat Mali (1):
  python3-pygments: fix for CVE-2022-40896

Ovidiu Panait (1):
  mdadm: skip running 04update-uuid and 07revert-inplace testcases

Poonam Jadhav (1):
  pixman: Remove duplication of license MIT

Richard Purdie (1):
  build-sysroots: Ensure dependency chains are minimal

Ross Burton (2):
  procps: backport fix for CVE-2023-4016
  graphene: fix runtime detection of IEEE754 behaviour

Wang Mingyu (1):
  tar: upgrade 1.34 -> 1.35

Yogita Urade (1):
  inetutils: fix CVE-2023-40303

 ...tpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch | 284 +++++++++++++++++
 ...03-Indent-changes-in-previous-commit.patch | 258 +++++++++++++++
 .../inetutils/inetutils_2.4.bb                |   2 +
 meta/recipes-core/meta/build-sysroots.bb      |   7 +-
 .../CVE-2022-40896-0001.patch                 |  49 +++
 .../CVE-2022-40896-0002.patch                 | 301 ++++++++++++++++++
 .../python/python3-pygments_2.14.0.bb         |   4 +
 meta/recipes-devtools/tcltk/tcl_8.6.13.bb     |   6 +
 ...n-files-for-04update-uuid-and-07reve.patch |  39 +++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |   1 +
 .../procps/procps/CVE-2023-4016.patch         |  73 +++++
 meta/recipes-extended/procps/procps_4.0.3.bb  |   1 +
 .../tar/tar/CVE-2022-48303.patch              |  43 ---
 .../tar/{tar_1.34.bb => tar_1.35.bb}          |   8 +-
 .../graphene/files/float-div.patch            |  28 ++
 .../graphene/graphene_1.10.8.bb               |   2 +
 .../xorg-lib/pixman_0.42.2.bb                 |   2 +-
 .../linux/linux-yocto-rt_6.1.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.1.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |  28 +-
 ...tools_1.22.4.bb => gst-devtools_1.22.5.bb} |   2 +-
 ...1.22.4.bb => gstreamer1.0-libav_1.22.5.bb} |   2 +-
 ...x_1.22.4.bb => gstreamer1.0-omx_1.22.5.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.22.5.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.22.5.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-good_1.22.5.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.22.5.bb} |   2 +-
 ....22.4.bb => gstreamer1.0-python_1.22.5.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.22.5.bb} |   2 +-
 ...1.22.4.bb => gstreamer1.0-vaapi_1.22.5.bb} |   2 +-
 ...er1.0_1.22.4.bb => gstreamer1.0_1.22.5.bb} |   2 +-
 meta/recipes-support/vim/vim.inc              |   5 +-
 scripts/lib/wic/partition.py                  |   2 +-
 33 files changed, 1092 insertions(+), 85 deletions(-)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch
 create mode 100644 meta/recipes-devtools/python/python3-pygments/CVE-2022-40896-0001.patch
 create mode 100644 meta/recipes-devtools/python/python3-pygments/CVE-2022-40896-0002.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-add-.broken-files-for-04update-uuid-and-07reve.patch
 create mode 100644 meta/recipes-extended/procps/procps/CVE-2023-4016.patch
 delete mode 100644 meta/recipes-extended/tar/tar/CVE-2022-48303.patch
 rename meta/recipes-extended/tar/{tar_1.34.bb => tar_1.35.bb} (87%)
 create mode 100644 meta/recipes-graphics/graphene/files/float-div.patch
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.4.bb => gst-devtools_1.22.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.4.bb => gstreamer1.0-libav_1.22.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.4.bb => gstreamer1.0-omx_1.22.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.4.bb => gstreamer1.0-plugins-bad_1.22.5.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.4.bb => gstreamer1.0-plugins-base_1.22.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.4.bb => gstreamer1.0-plugins-good_1.22.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.4.bb => gstreamer1.0-plugins-ugly_1.22.5.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.4.bb => gstreamer1.0-python_1.22.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.4.bb => gstreamer1.0-rtsp-server_1.22.5.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.4.bb => gstreamer1.0-vaapi_1.22.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.4.bb => gstreamer1.0_1.22.5.bb} (97%)

-- 
2.34.1


