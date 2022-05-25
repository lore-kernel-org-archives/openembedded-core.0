Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B722DC433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:36:36 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.7490.1653489386530371110
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=iTa3Nnfk;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 o10-20020a17090a4e8a00b001df2fcdc165so1850772pjh.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5BbwIHWQsZDaMPM6PHs6i5I4soxu7oWVzxdJ7i+RAU0=;
        b=iTa3NnfkRnZp7nDe/MHxHSm4zZmb6/NGH+M0DxtD8RwNr5yu+UKoGLQsaBXLQzmx/C
         KVqaiFJQPz4/xwpVt5Eqo3EKdC5qoN+08bD7eaZmKjGKXCq59cMRrw+ldkV9AaNzY6EZ
         w9xh8dOLWVPNZzfRBIBPw1Ei29SE2vXLzbNczPGA/IPF2QUpyis93MBZdAkLyYKiLalS
         x8KWaYmYz3wKDcJINc3jK+a/M0blrvRbTcnMgpDXxlFNkW/IHivgo/f9JsUJvKwBPej0
         0C24v9/Jo4TMJKau/KC1CzQLPjK0yI4PqYwr4r6/ptN4mQ9FEmr21JG19ToEnvWhQ3il
         5hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5BbwIHWQsZDaMPM6PHs6i5I4soxu7oWVzxdJ7i+RAU0=;
        b=fIdfKEqoCsRr1eIwUnIdMtY6znpeZ/haqPPu60+cAbcFDe6q4uAwiq7C/AoBA//9iC
         /BIuXVdWWwgiDJpN04Dm2SBCgolKBirCZwMM1BXIJAleMWY/yuoO2r9tNnxQ6abDWxPS
         TPdKp7RjbxHsQFn+NHoiKIw3SYEYfS/5bnll7Olv4a9PJ2kiYhVx4sFJUdZ683ar19gM
         s01g5MlcNZMHDSQcuF8R4mKLW7GEik51J2SSA3ozBrHG10Pk0Vp6vinOgNvUfisy9l8f
         6eZX1kudu8QFy253XreUxMEEBsM3tuL0JvjwFfTiJ5aPv28Mxc+Rp4Xjf7cHz5hAZC3j
         H4YA==
X-Gm-Message-State: AOAM530afDuK6CN1b9//2gDROvMLZQ2T3WC0PA9+SAhXZLWa9wXhbjjZ
	36l2V/T/Br6oTqyJh3DUg92we08jHV3nRlXZ
X-Google-Smtp-Source: 
 ABdhPJxcfbFic2or11m19KfbKKDx+/BJnFXNxNGj9QjwvecVsQbQYZIFBsZ+0XKPAdCdQfw/zfBndg==
X-Received: by 2002:a17:90a:684f:b0:1e0:8e34:5dc2 with SMTP id
 e15-20020a17090a684f00b001e08e345dc2mr7427743pjm.104.1653489385262;
        Wed, 25 May 2022 07:36:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h6-20020a170902f70600b0015eb200cc00sm9399287plo.138.2022.05.25.07.36.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:36:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/4] Patch review
Date: Wed, 25 May 2022 04:36:08 -1000
Message-Id: <cover.1653489126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:36:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166146

Please review this set of patches for dunfell and have comments back by end
of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3702
The following changes since commit 665f981fccbb09d51349c4bd4cfe4ca91001e3bd:

  cve-check: Fix report generation (2022-05-18 05:41:41 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (1):
  mobile-broadband-provider-info: upgrade 20220315 -> 20220511

Hitendra Prajapati (1):
  pcre2: CVE-2022-1586 Out-of-bounds read

Minjae Kim (1):
  libdrm: add libdrm-{nouveau,radeon,intel} to RPROVIDES

Ross Burton (1):
  oeqa/selftest/cve_check: add tests for recipe and image reports

 meta/lib/oeqa/selftest/cases/cve_check.py     | 77 ++++++++++++++++++-
 .../mobile-broadband-provider-info_git.bb     |  4 +-
 meta/recipes-graphics/drm/libdrm_2.4.101.bb   |  6 ++
 .../libpcre/libpcre2/CVE-2022-1586.patch      | 59 ++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.34.bb |  1 +
 5 files changed, 144 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch

-- 
2.25.1


