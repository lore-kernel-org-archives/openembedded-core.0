Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C92CC4453C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:00 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5508.1784741038126134225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aeMAVpBk;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so68986575e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741036; x=1785345836; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9UKsAcC8Bdq9ju9uf2QuRjQzQlh9kbsEPHGV4jMItVw=;
        b=aeMAVpBkUzsSk/MklhZDaFvTuthXxOe1HOygTyjYcHfltt2ZpAXV2V/FMudE8lEQ7e
         YA9RmWQzdrm4SnC2iA87ZYLNFSzYM73Eu0F/zSNuXfQ30HZyOe94KMn3unm7mjGt8Ttu
         5DSOstEvAjoP//UnsActG/C9jhk1yl7xbxpgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741036; x=1785345836;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UKsAcC8Bdq9ju9uf2QuRjQzQlh9kbsEPHGV4jMItVw=;
        b=q68Ma/FYCQJ1GHpMEb/PqXxEY7Mo4wcCboVCAVWZzz7HW+3hqTQaz5mX919fUDDpT5
         XR/GQW3anR/oEdW5CjwraWMWoEtBLajSUBRWROdLqzMZQuNnEu/3F2mzuo1C176sGvTH
         I6KOuDQjbGsPbZ0gf9dhaAb98SUjcLql9fBrdMUFVQk5MzMGdNpwVMrP6nN+SPUMHYnN
         bNarjVLqGnePK+jk04E4Rz0KLOwWCuHnDc21IxavWqTpMvaEuxDhuC7qe7z25YgIraa1
         75eYzimUPi8pxNdqAdrn7cf5EtmW1lxPGQbI5qaM1MW1Q3QYdJ23N771ngS2TqtstbW0
         IDTA==
X-Gm-Message-State: AOJu0YyPcwm/+Fn3fALMNRRG2SNt9Fh25Y6+gQ+WQkPsh6fTG9yZwwAR
	qavvFiPpp7cMQkzn0burwj7nGrphHlkG4ylc1wrKYsQ1Q8w/tnvrqoKDP6JSmC47+Yq0owOOJVw
	Y/MnUHDE=
X-Gm-Gg: AR+sD10c3mBIXElbWxLYrUj2jeGvnzLpHLExe/oVYR+xjlshUkOmktU4EfvHovlmbd7
	RK/19O1pxdcLbKdkraVPut4OfwRMxvZ/OaVnDPGH51/rA017JQStuzcJd3U7AEgFnhjHyt/Okgj
	lXWA8TxMmy0rbK89WBz8sC67OIdZOChMfT1Rb1xPkTJHqDmTbZzfIE4hN+B6g1GEiGRKMSgaERn
	+hLhaYdxY5nitndaLpOB8qEGOs4ilUcz5aExFjXBIpKgZbRaDu26zco/c3FIIma8Lvbl9WAG6dz
	tQF30vf9HUe1dtDZwMMoZiXWADY/Op6KZmsbbz3pKiLi1166C63BJU1LJkSdirFCtA4awSS3hzh
	WsGHAZvEPR2hqy1yfsP1rrAZST6kAXxHRJJpUq7gtiYaWKprej0XF8SYFpCDUXKpI8Id0t6AjTn
	v5M9fdmJhlJrefjtmFj2g3C0uVhvOBtmXZ2r51FN8cDfdTpmpGrQ88W7XiJ6pNDrQMtQ37ha8a2
	lZ8doSNef2c
X-Received: by 2002:a05:600c:138c:b0:493:c845:bc20 with SMTP id 5b1f17b1804b1-4954a3d0080mr253309895e9.4.1784741035986;
        Wed, 22 Jul 2026 10:23:55 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.23.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:23:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 00/27] Patch review
Date: Wed, 22 Jul 2026 19:23:13 +0200
Message-ID: <cover.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241710

Please review this set of changes for wrynose and have comments back by
end of day Friday, July 24.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4255
3 builds failed because of low disk space on ubuntu2504-vk-1.
Retried in:
* https://autobuilder.yoctoproject.org/valkyrie/?#/builders/2/builds/4188
* https://autobuilder.yoctoproject.org/valkyrie/?#/builders/58/builds/1912
* https://autobuilder.yoctoproject.org/valkyrie/?#/builders/92/builds/4158

The following changes since commit b5a6cada82d7ffb362bda9081c354dcc0b6ee264:

  openssh: set status for CVE-2026-3497 (2026-07-20 17:24:44 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-nut

for you to fetch changes up to 0dfe86a27167689ded394d72ebb5e22157fb9184:

  gzip: Fix CVE-2026-41991 (2026-07-21 17:06:45 +0200)

----------------------------------------------------------------

Darsh Kelaiya (1):
  gzip: Fix CVE-2026-41991

David Nyström (1):
  libssh2: Fix CVE-2025-15661

Deepak Rathore (17):
  expat: fix CVE-2026-56403
  expat: fix CVE-2026-56408
  expat: fix CVE-2026-56404
  expat: fix CVE-2026-56405
  expat: fix CVE-2026-56410
  expat: fix CVE-2026-56406
  expat: fix CVE-2026-56409
  expat: fix CVE-2026-56411
  expat: fix CVE-2026-56407
  expat: fix CVE-2026-56132
  gnutls: Fix CVE-2026-3832
  gnutls: Fix CVE-2026-42009
  curl: ignore CVE-2026-4873
  curl: fix CVE-2026-5545
  curl: fix CVE-2026-6253
  curl: fix CVE-2026-6429
  libpng: fix CVE-2026-34757

Devansh Patel (7):
  openssh: Fix CVE-2026-59999
  openssh: Fix CVE-2026-59997
  openssh: Fix CVE-2026-59996
  openssh: Fix CVE-2026-59995
  openssh: Fix CVE-2026-60001
  openssh: Fix CVE-2026-60002
  openssh: Fix CVE-2026-60000

Peter Marko (1):
  glib-2.0: upgrade 2.88.0 -> 2.88.2

 .../openssh/openssh/CVE-2026-59995.patch      |  44 ++
 .../openssh/openssh/CVE-2026-59996.patch      |  39 ++
 .../openssh/openssh/CVE-2026-59997.patch      |  60 ++
 .../openssh/openssh/CVE-2026-59999.patch      |  38 ++
 .../openssh/openssh/CVE-2026-60000.patch      | 140 +++++
 .../openssh/openssh/CVE-2026-60001.patch      | 130 +++++
 .../openssh/openssh/CVE-2026-60002.patch      | 225 ++++++++
 .../openssh/openssh_10.3p1.bb                 |   7 +
 .../expat/expat/CVE-2026-56132_p1.patch       |  90 +++
 .../expat/expat/CVE-2026-56132_p2.patch       |  63 +++
 .../expat/expat/CVE-2026-56132_p3.patch       |  77 +++
 .../expat/expat/CVE-2026-56132_p4.patch       |  63 +++
 .../expat/expat/CVE-2026-56132_p5.patch       |  58 ++
 .../expat/expat/CVE-2026-56403_p1.patch       |  83 +++
 .../expat/expat/CVE-2026-56403_p2.patch       |  40 ++
 .../expat/expat/CVE-2026-56404.patch          |  47 ++
 .../expat/expat/CVE-2026-56405.patch          |  32 ++
 .../expat/CVE-2026-56406-dependent.patch      |  58 ++
 .../expat/expat/CVE-2026-56406.patch          |  37 ++
 .../expat/expat/CVE-2026-56407.patch          |  44 ++
 .../expat/expat/CVE-2026-56408.patch          |  36 ++
 .../expat/expat/CVE-2026-56409.patch          |  53 ++
 .../expat/expat/CVE-2026-56410_p1.patch       |  40 ++
 .../expat/expat/CVE-2026-56410_p2.patch       |  41 ++
 .../expat/expat/CVE-2026-56411.patch          |  47 ++
 meta/recipes-core/expat/expat_2.7.5.bb        |  17 +
 .../glib-2.0/files/CVE-2026-58016-1.patch     |  12 +-
 .../glib-2.0/files/CVE-2026-58016-2.patch     |  30 +-
 ...l_2.88.0.bb => glib-2.0-initial_2.88.2.bb} |   0
 ...{glib-2.0_2.88.0.bb => glib-2.0_2.88.2.bb} |   0
 meta/recipes-core/glib-2.0/glib.inc           |   2 +-
 .../gzip/gzip-1.14/CVE-2026-41991.patch       |  75 +++
 meta/recipes-extended/gzip/gzip_1.14.bb       |   1 +
 .../libpng/files/CVE-2026-34757_p1.patch      | 518 ++++++++++++++++++
 .../libpng/files/CVE-2026-34757_p2.patch      | 481 ++++++++++++++++
 .../libpng/libpng_1.6.56.bb                   |   4 +-
 .../curl/curl/CVE-2026-5545.patch             |  43 ++
 .../curl/curl/CVE-2026-6253.patch             | 389 +++++++++++++
 .../curl/curl/CVE-2026-6429-dependent.patch   |  81 +++
 .../curl/curl/CVE-2026-6429.patch             | 325 +++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   5 +
 .../gnutls/gnutls/CVE-2026-3832_p1.patch      |  52 ++
 .../gnutls/gnutls/CVE-2026-3832_p2.patch      | 114 ++++
 .../gnutls/gnutls/CVE-2026-42009_p1.patch     |  62 +++
 .../gnutls/gnutls/CVE-2026-42009_p2.patch     |  48 ++
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   4 +
 .../libssh2/libssh2/CVE-2025-15661-1.patch    |  45 ++
 .../libssh2/libssh2/CVE-2025-15661-2.patch    | 131 +++++
 .../libssh2/libssh2/CVE-2025-15661-3.patch    |  57 ++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   3 +
 50 files changed, 4068 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59995.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59996.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59997.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-59999.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60000.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60001.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-60002.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56404.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56405.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56407.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56408.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56409.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56411.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.0.bb => glib-2.0-initial_2.88.2.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.0.bb => glib-2.0_2.88.2.bb} (100%)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41991.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-34757_p1.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-34757_p2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5545.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6253.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429-dependent.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3832_p2.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p1.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-42009_p2.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2025-15661-1.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2025-15661-2.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2025-15661-3.patch


