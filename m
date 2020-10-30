Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.8714.1604029725467827254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 20:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xUJT455c;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id h6so4075640pgk.4
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 20:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=bGEPGnQBnQ2IPjuss94U69xT/Asj9L9l9Uv8Lf+wrj0=;
        b=xUJT455ca7rU958y2pyeaz0NirIVnYW5J7Wf6sw25k9JinecEBVAh9t/R9RwF4aq0L
         ZYMkD5TqdbK3TXH/y9SThtxtJVKuCemP2EmjAgUU1FWK46FgPVy6ZNORvaYEq4OknHim
         4kzxqMZbybvXBUfYR6ykgiactxwvRs2zDqYQzoEaQubwnl0OMeyZByK80C5f8EvB8tHH
         raP6kKW9rt8Fw60yJaUevr0G3DAsMed7cW4Iib5D4BcFjwLISk4XFkRQUUI4DiWATZ5T
         LFRdw7NuKvwXztLZ1SzLfB9sDM5cZELI0j7+F3Ek1sxqEhYtCbKjHvXrbjKVRrkP1i3F
         QnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=bGEPGnQBnQ2IPjuss94U69xT/Asj9L9l9Uv8Lf+wrj0=;
        b=tJs7VynvrMRiV9p9J31UTZpBnPbOVw51teuC7PowQ8fpVwTMQAlmrhpucHOjopMwdF
         uOVlVtNzM39Kn+35mwikzY/qWyF1vXqEbxhd6xxuamUjfwJIesj5cGhKct1K/7UFGG9q
         41IL4sWC8MKaUgLqWgKcCL7bdtWNRqjOd9LMnI1tyFV2mwSB6O50jki8sQxx5+T8XFgO
         rcehhrMQXEx+u37W/WG9yiL65ZohoLyVY5Cxwqh64AL3GVA9u+Rq01prXCp9/AncYYit
         /4D2lqGGkZoHuu/iX2rNXqodYnlzSGl0G4bQTfn03BXem2niGpWrwLqFzqqe1now4nct
         doPQ==
X-Gm-Message-State: AOAM53175cyiFV6z6Tqcu7ckw3B6jrCwkFPgu10UWgqT7a6i41D6qMB6
	iR6cqFDykMNCAj6YYGoqNgIJMKRKFJh/K4y7
X-Google-Smtp-Source: ABdhPJwn0SQwg5cAElHbEfSvOyu1vzqs12Z8s1vCPGa/ckmPbGtUd7oHDeGBMJAxpNH0NPWM3DKsBw==
X-Received: by 2002:a17:90a:de5:: with SMTP id 92mr385799pjv.179.1604029724124;
        Thu, 29 Oct 2020 20:48:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v16sm3858669pgk.26.2020.10.29.20.48.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 20:48:43 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/16] Pull request (cover letter only)
Date: Thu, 29 Oct 2020 17:48:31 -1000
Message-Id: <cover.1604029622.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit 89e6fc44a378cb3489376d7193672cdf94c504b6:

  qemu: change TLBs number to 64 in 34Kf mips cpu model (2020-10-21 04:42:42 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Jose Quaresma (12):
  gstreamer1.0: Fix reproducibility issue around libcap
  gstreamer1.0: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-plugins-base: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-plugins-good: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-plugins-bad: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-plugins-ugly: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-libav: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-vaapi: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-rtsp-server: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-omx: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-python: Update 1.16.2 -> Update 1.16.3
  gst-validate: Update 1.16.2 -> Update 1.16.3

Lee Chee Yang (1):
  ffmpeg: fix CVE-2020-12284

Richard Purdie (1):
  oeqa: Add sync call to command execution

Ross Burton (2):
  gcc: mitigate the Straight-line Speculation attack
  glib-2.0: fix parsing of slim encoded tzdata

 meta/lib/oeqa/selftest/cases/runcmd.py        |  16 +-
 meta/lib/oeqa/utils/commands.py               |   8 +-
 .../glib-2.0/glib-2.0/tzdata-update.patch     | 458 ++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb |   1 +
 meta/recipes-devtools/gcc/gcc-9.3.inc         |   3 +
 ...ight-Line-Speculation-SLS-mitigation.patch | 204 ++++++
 ...e-SLS-mitigation-for-RET-and-BR-inst.patch | 600 ++++++++++++++++
 ...h64-Mitigate-SLS-for-BLR-instruction.patch | 659 ++++++++++++++++++
 .../ffmpeg/ffmpeg/CVE-2020-12284.patch        |  36 +
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |   1 +
 ...idate_1.16.2.bb => gst-validate_1.16.3.bb} |   4 +-
 ...1.16.2.bb => gstreamer1.0-libav_1.16.3.bb} |   4 +-
 ...x_1.16.2.bb => gstreamer1.0-omx_1.16.3.bb} |   4 +-
 ....bb => gstreamer1.0-plugins-bad_1.16.3.bb} |   4 +-
 ...bb => gstreamer1.0-plugins-base_1.16.3.bb} |   4 +-
 ...bb => gstreamer1.0-plugins-good_1.16.3.bb} |   4 +-
 ...bb => gstreamer1.0-plugins-ugly_1.16.3.bb} |   4 +-
 ...son.build-fix-builds-with-python-3.8.patch |  24 -
 ....16.2.bb => gstreamer1.0-python_1.16.3.bb} |   8 +-
 ....bb => gstreamer1.0-rtsp-server_1.16.3.bb} |   4 +-
 ...1.16.2.bb => gstreamer1.0-vaapi_1.16.3.bb} |   4 +-
 .../gstreamer/gstreamer1.0/capfix.patch       |  37 -
 ...er1.0_1.16.2.bb => gstreamer1.0_1.16.3.bb} |   9 +-
 23 files changed, 2002 insertions(+), 98 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/tzdata-update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-12284.patch
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.16.2.bb => gst-validate_1.16.3.bb} (87%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.16.2.bb => gstreamer1.0-libav_1.16.3.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.16.3.bb} (92%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.16.2.bb => gstreamer1.0-plugins-bad_1.16.3.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.16.2.bb => gstreamer1.0-plugins-base_1.16.3.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.2.bb => gstreamer1.0-plugins-good_1.16.3.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.16.3.bb} (90%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.2.bb => gstreamer1.0-python_1.16.3.bb} (80%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.16.2.bb => gstreamer1.0-rtsp-server_1.16.3.bb} (86%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.16.2.bb => gstreamer1.0-vaapi_1.16.3.bb} (93%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.2.bb => gstreamer1.0_1.16.3.bb} (90%)

-- 
2.17.1

