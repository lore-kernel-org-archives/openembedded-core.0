Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0FD4C54F50
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:09 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43787.1785192962676712201
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=x4EcFo3H;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so23933175e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785192961; x=1785797761; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4FQBKb1rtnuKC+ZfQZNObal0GdrDUJ7n4msXaX/zbM=;
        b=x4EcFo3H8Xyq76xluHO9L2ZT6qW/KBfoswx/gKS+iOr3Zfh2EsVerv8zDMCIgpqFu5
         fw2PaLMtDHL2f9Y3275PXquFIKFyv6MnO2gklYLQhGrkEpYjPWhG4WCLanuU04zrhKFe
         CrG10BjX/ec3CNMrXLiWnw4WNDE2/nQkz/mYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785192961; x=1785797761;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4FQBKb1rtnuKC+ZfQZNObal0GdrDUJ7n4msXaX/zbM=;
        b=kx783kL/Mu+2BTyou4iLq7k72F1JUE0Yc3XE7dGKXafbQ0Q6mY8OnYBB8hLJAaBMHl
         ZMmFaf0DdOvH+5mFBvKy/mIaDFplOIrM6JH1pSw3ZtpU3QbIu9NlGofBMW0ercLWPYfW
         neqUVb3lXALujKFID7IeaVDkpZ7etteF29UQpW+LfZQhB6f9EzLFrQJ8dOUYOuhnbkh5
         y5R3Oe8J8uP4HafPfyWG1d8rl7OCqw1t+b7T6FECqjgyyKi3RQ5sHtzIaO0OwMWNoBG4
         iuhrp5aUpJpHkEbWsyMVTuF0UCH2NWWepwZBcrJMco0+apBAaTjpsBfymWlbdWHxMdtU
         4j9Q==
X-Gm-Message-State: AOJu0Yx53UjB9HpyWmpzBkskinrfefDBdHsRDfk6gOosm5dvuHg602gN
	G7E734gHKm3xl7r7f5j21/yYVDLmf+0ubUBqr/Bt6jTUAEOsJpZNA74KuqYU1EOUfdDYrTVsPMc
	4cpOX9EI=
X-Gm-Gg: AR+sD11DTKEELds1yq18dgwqKVYXcZnrIBcAwGjCZTQrg0VoYIOqM3k4q1Rs3wk9eXN
	N9jMiJGHWf5RuOXrG7gX7FEQuzC8+e6hfNiPmvlbysPvO3v1x3stGSWVJDhJtynKjnleonq2RrV
	IyZTXRk3k7cj3FiTL9JaOUmvdsadPRd6CfRnHbfHQNhJQ7PQT9V3ZhLUVCgmkx8SXgqrdlXilcz
	Y0oLLUcFrz+9Vhx4iXvFpo+9uYqCa4KROvyAvZ67Mrn5FNF+qCj9bxLJH5jGqHa1iUu/heHgXa1
	5XKVufvcVNYRubHDvyv8n4rNO/4qVFTNhEaV+g6wYle6R5+MAt3pvNA009YUSGRIdZUFmJp5Jli
	E08gjGzO+E/jN9yyuj9ikutQ450p8ef3dQReMZ0gl2pFjsL0CE0c7l5Y0MoH+7P4j2csiqbDZj/
	NweOCJEpRCYu0M4xYA4WfheB0RkC84n/79h8D8VYYA1FCUUQvznGBdz/LKbxguDPI0oGj8f77ak
	ILhjQ==
X-Received: by 2002:a05:600c:6a14:b0:495:4a22:d684 with SMTP id 5b1f17b1804b1-496b56f342emr86051665e9.10.1785192960676;
        Mon, 27 Jul 2026 15:56:00 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.55.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:55:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 00/36] Patch review
Date: Tue, 28 Jul 2026 00:55:14 +0200
Message-ID: <cover.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242108

Please review this set of changes for wrynose and have comments back by
end of day Wednesday, July 29.

Note: the Rsync patches of this series are bigger than usual CVE
patches (and also AI generated) so they might need extra care.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4303

The following changes since commit f66b182e2ff431b624dfc3a506d25dc8f1fc6db2:

  gzip: Fix CVE-2026-41991 (2026-07-27 09:47:02 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-nut

for you to fetch changes up to d174aa123d5a3e7dab771a060b2d173192e11535:

  vim: Security Fix for CVE-2026-57452 (2026-07-27 12:48:07 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  gnutls: fix CVE-2026-3833

AshishKumar Mishra (1):
  package.bbclass: hardcode emit_pkgdata to run last

Ashishkumar Parmar (6):
  rsync: Fix CVE-2026-29518
  rsync: Fix CVE-2026-43619
  rsync: Fix CVE-2026-43618
  rsync: Fix CVE-2026-43620
  rsync: Fix CVE-2026-43617
  rsync: Fix CVE-2026-45232

Bruce Ashfield (4):
  linux-yocto/6.18: update to v6.18.36
  linux-yocto/6.18: update to v6.18.38
  linux-yocto/6.18: update to v6.18.39
  linux-yocto/6.18: drm/virtio: fix deadlock in display_info_cb by
    removing hotplug from dequeue worker

Daniel Turull (2):
  systemd-systemctl-native: disable libpam meson option
  xmlto: correct srcrev to point to released version

Darsh Kelaiya (5):
  gawk: Fix CVE-2026-40467
  gawk: Fix CVE-2026-40468
  gawk: Fix CVE-2026-40469
  gawk: Fix CVE-2026-40553
  python3-setuptools: Fix CVE-2026-59890

Deepak Rathore (2):
  curl: fix CVE-2026-7168
  sqlite3: fix CVE-2026-11822 and CVE-2026-11824

Devansh Patel (1):
  openssh: set status for CVE-2026-59998

João Marcos Costa (1):
  curl: add annotation for CVE-2026-10536

Leonid Iziumtsev (2):
  libgcrypt: fix CVE-2026-41989
  libgcrypt: fix CVE-2026-41990

Peter Marko (1):
  libpng: set status for CVE-2026-40930

Siddharth Doshi (6):
  vim: Security Fix for CVE-2026-42307
  vim: Security Fix for CVE-2026-43961
  vim: Security Fix for CVE-2026-47162
  vim: Security Fix for CVE-2026-47167
  vim: Security Fix for CVE-2026-55892
  vim: Security Fix for CVE-2026-57452

Siva Balasubramanian (1):
  util-linux: upgrade 2.41.3 -> 2.41.5

mark.yang (3):
  python3-cryptography: set CVE_PRODUCT
  python3-ply: set CVE_PRODUCT
  python3-pyasn1: set CVE_PRODUCT

 meta/classes-global/package.bbclass           |    7 +-
 .../openssh/openssh_10.3p1.bb                 |    1 +
 .../systemd/systemd-systemctl-native_259.5.bb |    1 +
 ...2.41.3.bb => util-linux-libuuid_2.41.5.bb} |    0
 meta/recipes-core/util-linux/util-linux.inc   |    4 +-
 ...DEV_FL_NOFOLLOW-to-prevent-symlink-a.patch |  114 --
 .../util-linux/CVE-2026-13595.patch           |  148 --
 ...l-linux_2.41.3.bb => util-linux_2.41.5.bb} |    0
 .../python/python3-cryptography.bb            |    2 +
 .../python/python3-ply_3.11.bb                |    2 +
 .../python/python3-pyasn1_0.6.2.bb            |    2 +
 .../python3-setuptools/CVE-2026-59890.patch   |  194 ++
 .../python/python3-setuptools_82.0.1.bb       |    3 +-
 .../rsync/files/CVE-2026-29518_p1.patch       |  392 ++++
 .../rsync/files/CVE-2026-29518_p2.patch       |   98 +
 .../rsync/files/CVE-2026-29518_p3.patch       |  328 +++
 .../rsync/files/CVE-2026-29518_p4.patch       |   71 +
 .../rsync/files/CVE-2026-43617.patch          |  201 ++
 .../rsync/files/CVE-2026-43618.patch          |  248 +++
 .../rsync/files/CVE-2026-43619_p1.patch       |  471 +++++
 .../rsync/files/CVE-2026-43619_p2.patch       |  205 ++
 .../rsync/files/CVE-2026-43619_p3.patch       | 1783 +++++++++++++++++
 .../rsync/files/CVE-2026-43619_p4.patch       |  568 ++++++
 .../rsync/files/CVE-2026-43619_p5.patch       |   69 +
 .../rsync/files/CVE-2026-43619_p6.patch       |  258 +++
 .../rsync/files/CVE-2026-43620.patch          |  122 ++
 .../rsync/files/CVE-2026-45232.patch          |  240 +++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   14 +
 meta/recipes-devtools/xmlto/xmlto_0.0.29.bb   |    4 +-
 .../gawk/gawk/CVE-2026-40467.patch            |   62 +
 .../gawk/gawk/CVE-2026-40468.patch            |   61 +
 .../gawk/gawk/CVE-2026-40469.patch            |   90 +
 .../gawk/gawk/CVE-2026-40553_p1.patch         |   50 +
 .../gawk/gawk/CVE-2026-40553_p2.patch         |   44 +
 meta/recipes-extended/gawk/gawk_5.4.0.bb      |    5 +
 .../linux/linux-yocto-rt_6.18.bb              |    6 +-
 .../linux/linux-yocto-tiny_6.18.bb            |    6 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |   24 +-
 .../libpng/libpng_1.6.56.bb                   |    2 +
 .../curl/curl/CVE-2026-7168.patch             |  376 ++++
 meta/recipes-support/curl/curl_8.19.0.bb      |    2 +
 .../gnutls/gnutls/CVE-2026-3833.patch         |   90 +
 meta/recipes-support/gnutls/gnutls_3.8.12.bb  |    1 +
 .../libgcrypt/files/CVE-2026-41989.patch      |   42 +
 .../libgcrypt/files/CVE-2026-41990.patch      |  316 +++
 .../libgcrypt/libgcrypt_1.12.1.bb             |    2 +
 .../CVE-2026-11822_CVE-2026-11824.patch       |   41 +
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |    5 +-
 .../vim/files/CVE-2026-42307.patch            |  177 ++
 .../vim/files/CVE-2026-43961.patch            |  104 +
 .../vim/files/CVE-2026-47162.patch            |   83 +
 .../vim/files/CVE-2026-47167.patch            |  102 +
 .../vim/files/CVE-2026-55892.patch            |   95 +
 .../vim/files/CVE-2026-57452.patch            |   90 +
 meta/recipes-support/vim/vim.inc              |    6 +
 55 files changed, 7143 insertions(+), 289 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.41.3.bb => util-linux-libuuid_2.41.5.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch
 rename meta/recipes-core/util-linux/{util-linux_2.41.3.bb => util-linux_2.41.5.bb} (100%)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2026-59890.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p1.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p2.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p3.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-29518_p4.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43617.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43618.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p1.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p2.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p3.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p4.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p5.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43619_p6.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43620.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-45232.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40467.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40468.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40469.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p1.patch
 create mode 100644 meta/recipes-extended/gawk/gawk/CVE-2026-40553_p2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-7168.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41989.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2026-41990.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-11822_CVE-2026-11824.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-42307.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-43961.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-47162.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-47167.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-55892.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-57452.patch


