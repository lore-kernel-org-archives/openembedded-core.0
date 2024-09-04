Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8562CD4F34
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 21:33:10 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.62084.1725485585974430051
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 14:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZmHNB3bM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2d8b68bddeaso28103a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 14:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725485585; x=1726090385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GxSk9Gz7i/eA3ilvLtoK2XFQjFO4B1RIJ88oLf647bo=;
        b=ZmHNB3bMBnxQ501RIO+idqA3cjhR8Uv8F4/oSspbBl+edaaqVKiDl9aIEQnLvrbngQ
         bKzgwI8MQvLtHOkB3E2bFMKdTemxE0PKPluUcuBGbLdoS3IZYx06J5z1OhT0t4FMfbKR
         a9y9nqM0XWWIEf7a4l4hXdUMrTxEmCtBti5ee9dnUAufXr8+F4EKdECzAjtr3qrFfql1
         1neyw2nIBoSXNBMerHfKypT+SOHiftt4KSS1I34lbOSGwc6bs0D6ziwzPg9cqOqh5wkG
         yb/PyYEfpV040nIfYa7eGq+NHaENdoadbghQRJyzo5GZZ8l6dYnB2hHq1PIqvUe8//2L
         BokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725485585; x=1726090385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxSk9Gz7i/eA3ilvLtoK2XFQjFO4B1RIJ88oLf647bo=;
        b=sr0L35FdoU3h9LN0riNK+TIQ2snNKubSGhPItjOQf+zNRPPKn50wjqVrQQ6vTejLes
         H2wurWyzQCQH8qyzTuxrLl4GdkBMHOt5nc0WaNreR06nAoqLao+bDqBv2vnDYrBjgV/7
         xUGapzpeTTO2Tjw5uWbl75aMJWgylxgvJjMlC+vlNc3dDAOTf60AnkMpUGll1HXhWIWN
         PorDyLRSmtycRI9nWNdCqcZLDl+hQNd0VcuCZAX/wOgSFmsh4nrG3jKwZ598//6XuaCJ
         dSlzfqyV34wSoqlIq2slqoHO4/NyOQVcodsekh/jgPRmftpEQmMW061ZoI6m8TaTMN1D
         A/FA==
X-Gm-Message-State: AOJu0YypZcapk8/Bgf/N94Bi0hmLLD2qA0la6pXf2BG5b2UTbA1FmY0l
	5BU5Zob7FxL1N+hXdN1/obtJnl41nKanhoDMTYxY50LrQHuNbiztpAa5LLPe+bnvwMkO+9THZN/
	f/BE=
X-Google-Smtp-Source: AGHT+IH3uuMWnBvDwUixDFirglbaUbH4S7wWTLsSSVpft1Bpjsj/sPSZvA02kAD9XIff0ostKk/x9g==
X-Received: by 2002:a17:90a:db8a:b0:2d8:8808:5154 with SMTP id 98e67ed59e1d1-2d88e6f57c2mr15064466a91.40.1725485584896;
        Wed, 04 Sep 2024 14:33:04 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8e3e8c580sm6693767a91.40.2024.09.04.14.33.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:33:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/14] Patch review
Date: Wed,  4 Sep 2024 14:32:41 -0700
Message-Id: <cover.1725456307.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 21:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204212

Please review this set of changes for scarthgap and have comments back by
end of day Friday, September 6

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7306

The following changes since commit 553f31396a5d966ab827f1c4b807ef46649080d0:

  linux-firmware: add a package for ath12k firmware (2024-08-28 05:15:47 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Alexander Kanavin (1):
  apr: drop
    0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch

Benjamin Szőke (1):
  mc: fix source URL

Dmitry Baryshkov (1):
  xserver-xorg: fix CVE-2023-5574 status

Jon Mason (2):
  oeqa/runtime/ssh: increase the number of attempts
  openssh: add backported header file include

Siddharth Doshi (1):
  wpa-supplicant: Upgrade 2.10 -> 2.11

Soumya Sambu (3):
  python3-setuptools: Fix CVE-2024-6345
  python3: Fix CVE-2024-7592
  python3: Fix CVE-2024-8088

Vijay Anusuri (1):
  apr: upgrade 1.7.4 -> 1.7.5

Wang Mingyu (4):
  cups: upgrade 2.4.9 -> 2.4.10
  libadwaita: upgrade 1.5.1 -> 1.5.2
  libdnf: upgrade 0.73.1 -> 0.73.2
  wireless-regdb: upgrade 2024.05.08 -> 2024.07.04

 meta/lib/oeqa/runtime/cases/ssh.py            |   2 +-
 ...sing-header-for-systemd-notification.patch |  27 ++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 ...all-wpa_passphrase-when-not-disabled.patch |  33 --
 ...te-Phase-2-authentication-requiremen.patch | 213 ------------
 ...options-for-libwpa_client.so-and-wpa.patch |  73 ----
 ...oval-of-wpa_passphrase-on-make-clean.patch |  26 --
 ...plicant_2.10.bb => wpa-supplicant_2.11.bb} |  10 +-
 .../{libdnf_0.73.1.bb => libdnf_0.73.2.bb}    |   2 +-
 .../python3-setuptools/CVE-2024-6345.patch    | 312 ++++++++++++++++++
 .../python/python3-setuptools_69.1.1.bb       |   4 +-
 .../python/python3/CVE-2024-7592.patch        | 143 ++++++++
 .../python/python3/CVE-2024-8088.patch        | 128 +++++++
 .../recipes-devtools/python/python3_3.12.4.bb |   2 +
 .../cups/0001-use-echo-only-in-init.patch     |  11 +-
 ...-don-t-try-to-run-generated-binaries.patch |  16 +-
 ...-fix-multilib-install-file-conflicts.patch |  12 +-
 .../cups/{cups_2.4.9.bb => cups_2.4.10.bb}    |   2 +-
 meta/recipes-extended/mc/mc_4.8.31.bb         |   2 +-
 ...ibadwaita_1.5.1.bb => libadwaita_1.5.2.bb} |   2 +-
 .../xorg-xserver/xserver-xorg.inc             |   2 +-
 ....05.08.bb => wireless-regdb_2024.07.04.bb} |   2 +-
 ...-runtime-test-for-mmap-that-can-map-.patch |   2 +-
 ...libapr-against-phtread-to-make-gold-.patch |  50 ---
 .../apr/{apr_1.7.4.bb => apr_1.7.5.bb}        |   3 +-
 25 files changed, 642 insertions(+), 438 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-Fix-missing-header-for-systemd-notification.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-Install-wpa_passphrase-when-not-disabled.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-build-Re-enable-options-for-libwpa_client.so-and-wpa.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-Fix-removal-of-wpa_passphrase-on-make-clean.patch
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.10.bb => wpa-supplicant_2.11.bb} (90%)
 rename meta/recipes-devtools/libdnf/{libdnf_0.73.1.bb => libdnf_0.73.2.bb} (97%)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/CVE-2024-6345.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2024-7592.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2024-8088.patch
 rename meta/recipes-extended/cups/{cups_2.4.9.bb => cups_2.4.10.bb} (51%)
 rename meta/recipes-gnome/libadwaita/{libadwaita_1.5.1.bb => libadwaita_1.5.2.bb} (88%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.05.08.bb => wireless-regdb_2024.07.04.bb} (94%)
 delete mode 100644 meta/recipes-support/apr/apr/0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch
 rename meta/recipes-support/apr/{apr_1.7.4.bb => apr_1.7.5.bb} (96%)

-- 
2.34.1


