Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.8657.1626791468630518181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 07:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xOSRGHK5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 70so19300535pgh.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jul 2021 07:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8mNIWFXghMZVu93KGEJHmS3FE4VJaJFyCCFjtrstYko=;
        b=xOSRGHK5K9BGrK7z+PrzIDuqL27osPNF5N3gY7NTz810WGnR/kuFqJHEcDcYh+1EBc
         cvfS/RCFz7fZ9iD+Uuj8HwecA5i7UZs2VLUfbb3bXthGrfTpQl9gG5DfUmdGuIg7F5TB
         Q/RaXmTLzdb4Ujw3iREhS8RDsaDtmumICADlratEOMw7eVq5rglRcl2AeYIKqmspFeAO
         Pdk4xyWWvuu4Pw8wiqqFCwdEPTRVm7puXeVK5+xsvBkwMM35v9J5k1JZ0Izy7iXN9PHO
         qyDkIfLrTDe9YsjadTZT+9vvwBZ8Jxj+kSK5rmK63ZOeOLhbDETJH6PWJqPvm3Y5KqIu
         cN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8mNIWFXghMZVu93KGEJHmS3FE4VJaJFyCCFjtrstYko=;
        b=k9jBU3m7V0MPYBOi+JdswoGNRCY4TshMkt4Cv3hNxjyWcOTSly/cOVpbrX3udT6JMY
         RJAbEq3KIqQBFFB6sUQGJzslZxjn51zH8wzzBWUIbEf/SlAhIfIH6dQkU/TbgyyAmuDj
         9o/IgrpC2aviIWX2cGEC4oUta8VkKRNJH+nGWusGbMyrj9+069BT1hO/K+zkAAeMbHr8
         zc69Wt5GtBrw1T8CuQcGYdOMAGbm3Hr0lJMw1Sle7C5FGYAdxFI8Ayg5zrb1y32ST6p8
         oQVEb8hVIpqZ8Hrg2ha/aodY2ei8+e6ScscdEEhf4bXy35h2CYrG5jKU6MyY5QTuBQJh
         sHKg==
X-Gm-Message-State: AOAM530yY6AtwrU8Bkwh9IYWwkzy6ldoF58fSrBGKUBA7p8PGXAe/8L6
	kkiR3XeT4YFf4UoiEvIlcq/U4NyJxWO1FYAr
X-Google-Smtp-Source: ABdhPJxxZKorthu6vqXKCctad2KEDQqsQq9xk3O4JpesjnSv1/sm3Wve1u8amnxMO0BeHphMGvifOQ==
X-Received: by 2002:a05:6a00:1c6d:b029:338:322:137d with SMTP id s45-20020a056a001c6db02903380322137dmr22149050pfw.38.1626791467516;
        Tue, 20 Jul 2021 07:31:07 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r15sm27338937pgk.72.2021.07.20.07.31.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 07:31:07 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Pull request (cover letter only)
Date: Tue, 20 Jul 2021 04:30:56 -1000
Message-Id: <cover.1626791384.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cfd74f2bae51413d9c327e0f08ecf751325c2d74:

  report-error: Drop pointless inherit (2021-07-11 06:19:43 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Andrej Valek (1):
  busybox: add tmpdir option into mktemp applet

Richard Purdie (3):
  pseudo: Add uninative configuration sanity check
  pseudo: Update to latest version including statx fix
  sstate: Drop pseudo exclusion

Steve Sakoman (3):
  bluez: fix CVE-2021-3588
  gstreamer-plugins-base: ignore CVE-2021-3522 since it is fixed
  gstreamer-plugins-good: ignore CVE-2021-3497/8 since they are fixed

 meta/classes/sstate.bbclass                   |  2 -
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../bluez5/bluez5/CVE-2021-3588.patch         | 34 ++++++++
 .../0001-mktemp-add-tmpdir-option.patch       | 81 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |  1 +
 meta/recipes-devtools/pseudo/pseudo.inc       | 13 +++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +-
 .../gstreamer1.0-plugins-base_1.16.3.bb       |  4 +
 .../gstreamer1.0-plugins-good_1.16.3.bb       |  5 ++
 9 files changed, 140 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2021-3588.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch

-- 
2.25.1

