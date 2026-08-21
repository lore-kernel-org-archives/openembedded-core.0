Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4137DC5DF89
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 15:08:05 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9554.1787324881575996817
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 08:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=R50sDYON;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so4822945e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 08:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787324880; x=1787929680; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWAbPBZBdwA3cQE1rMUQhpf0MwP5bTGpfpCw2zMHuQ4=;
        b=R50sDYONhpLUZtHMU7UI1AcGi5Erf3Iqpyikydf8HzDWZNkfyDENjnrumZ5TJInpBg
         lgsoNE63GlhrHfNgMqVol0prqFB/Cyv9uQ4TT8k2t3UbWIvNcPohBEkX+KMThRravT8S
         Mmn9k/eHhj3BAakWX7rKNwzHYDmC955q14gUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787324880; x=1787929680;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZWAbPBZBdwA3cQE1rMUQhpf0MwP5bTGpfpCw2zMHuQ4=;
        b=iDw3jh2IXRor8SaU3yAUKm6Pozj0vLL26qJOrhBAcSTcOHgRvtNbJqSkM1A2NscSKm
         cnkBYWIyoI0Xnzax59vC808xKpkdWbjnfM/AkABTXy/S/j2FdeANnfIvM4+ezbVK0Jnp
         eFe2AF+fF3MTkw72WQiZpxgwhbTRFYIND0WfLGGYPge0ghDW6BUUvVuzF7XgVlpYkOum
         d4P0Ib88UWBo1IyZkx6ygBcZTJvz6teR3Bz5SCatIB/zdn7xxgzHPj5ILfvb2CYPNr5X
         NlyS6kWIVfw+2yFJ1P9qkmEHBx979AaSyUZSMAVSBzfUG8Qp013sIE2rqfwkCWQ4zV7g
         xDLg==
X-Gm-Message-State: AOJu0YxAvZ5DFTXOamMYYFDoYhgVYEdp8qfNzpBZsoj4m0koloA0aLvO
	GvmBrutkqs13LQWprr4XwqWlnan/+eakBD/Rqa5ogPX7V0e+/s+c87N70u/YE2hlRndmvTFIhTF
	EZatoA+A=
X-Gm-Gg: AR+sD12N7D4KbR5FdawLAmzoNFR31B740lv+thD66X20SaF8c08N56VdLU9eqt//2vV
	bunc0IOAw81ekmFdIg4cYw8/l8cZ1MPJRg/Hw9E4F0mYU2KIM7IlNI3lD7KLM0MvGfjk+9dseVD
	50TCWJNb03bYq8Xjqm9vLXfIhZ1p/pqj5VLl4HFr0VHs4PNwcipAR3AIF6S9a7/tfh9bWv1mB99
	rlqVTYXCto25gEDNBpu1p+LMq9JGAGe4xC4REx9DEUvd2hCbDkVfqmQaB8gwAKL0LWiqujyBETJ
	LJqksybmB2S/ECU9XqvHIWDVv4FdVZ2UELXpR/bPxgW93eVUkAK7Dh4EEzMaSA+TOyokJgkiHXu
	T5SwAUYvH4MaRr9mmlhgTKetxqlwlPLOmNoUYo5q7JElEWVh8PI704rlsHKMdaQfREXkKM/sb/1
	F2MUP/tsCjRZ+THJTxHsZSAHYdXGOsegl9r8aBbZrvPmAkl40U1mJ2BnmATHWUC+pRptjUrNxdi
	VHmodmTWfyvIGG6qRMPunqutqLGz6Dyribi6Y+xu6RNBD6lw4Pru96ksQFRDJV9X5M=
X-Received: by 2002:a05:600c:4f87:b0:499:5a50:b022 with SMTP id 5b1f17b1804b1-499b830d220mr96216075e9.3.1787324879683;
        Fri, 21 Aug 2026 08:07:59 -0700 (PDT)
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b90e7fdbsm30691785e9.6.2026.08.21.08.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:07:59 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/35] Pull request (cover letter only)
Date: Fri, 21 Aug 2026 17:07:49 +0200
Message-ID: <cover.1787322600.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 15:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243946

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1787154074.git.fabien.thomas@smile.fr/
From this series, two patches were removed:
* curl: fix CVE-2026-6429
* curl: fix CVE-2026-7168
See : https://lore.kernel.org/openembedded-core/DKTP3XEC9P8X.3NH15CYC35F07@smile.fr/

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4529

The following changes since commit 543550522f831479f07d332a40ba343c53ae1065:

  openssh: set status for CVE-2026-59998 (2026-07-28 15:30:13 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to 735dd46d8557280b0a4a79dd5d5bd0467a18fe5f:

  linux-yocto/6.6: update to v6.6.147 (2026-08-20 15:11:42 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (1):
  gnutls: fix CVE-2026-3833

Alexander Kanavin (1):
  perf: drop newt from tui build requirements

Amaury Couderc (1):
  python3: fix CVE-2026-7210

Bruce Ashfield (1):
  linux-yocto/6.6: update to v6.6.147

David Nyström (1):
  libssh2: Fix CVE-2025-15661

Deepak Rathore (13):
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
  curl: fix CVE-2026-5545
  curl: fix CVE-2026-6253
  curl: fix CVE-2026-4873

Himanshu Jadon (1):
  python3-pip: set CVE_PRODUCT

Jaipaul Cheernam (4):
  libssh2: fix CVE-2026-66032
  libssh2: fix CVE-2026-66033
  libssh2: fix CVE-2026-66034
  libssh2: fix CVE-2026-66035

Maik Otto (1):
  u-boot: Set CVE_PRODUCT

Marta Rybczynska (1):
  flex: update CVE_PRODUCT

Peter Marko (5):
  xserver-org: update CVE_PRODUCT
  shadow: set CVE_PRODUCT
  sudo: set CVE_PRODUCT
  busybox: patch CVE-2026-38754
  libsndfile1: patch CVE-2026-37555

mark.yang (5):
  python3-pyopenssl: set CVE_PRODUCT
  python3-idna: set CVE_PRODUCT
  python3-certifi: set CVE_PRODUCT
  python3-xmltodict: set CVE_PRODUCT
  python3-pyyaml: set CVE_PRODUCT

 meta/recipes-bsp/u-boot/u-boot.inc            |   2 +
 .../busybox/busybox/CVE-2026-38754.patch      | 155 +++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   1 +
 .../expat/expat/CVE-2026-56132_p1.patch       |  80 ++++
 .../expat/expat/CVE-2026-56132_p2.patch       |  60 +++
 .../expat/expat/CVE-2026-56132_p3.patch       |  74 ++++
 .../expat/expat/CVE-2026-56132_p4.patch       |  60 +++
 .../expat/expat/CVE-2026-56132_p5.patch       |  56 +++
 .../expat/expat/CVE-2026-56403_p1.patch       |  81 ++++
 .../expat/expat/CVE-2026-56403_p2.patch       |  52 +++
 .../expat/expat/CVE-2026-56404.patch          |  45 ++
 .../expat/expat/CVE-2026-56405.patch          |  30 ++
 .../expat/CVE-2026-56406-dependent.patch      |  59 +++
 .../expat/expat/CVE-2026-56406.patch          |  34 ++
 .../expat/expat/CVE-2026-56407.patch          |  41 ++
 .../expat/expat/CVE-2026-56408.patch          |  29 ++
 .../expat/expat/CVE-2026-56409.patch          |  51 +++
 .../expat/expat/CVE-2026-56410_p1.patch       |  46 ++
 .../expat/expat/CVE-2026-56410_p2.patch       |  39 ++
 .../expat/expat/CVE-2026-56411.patch          |  50 +++
 meta/recipes-core/expat/expat_2.6.4.bb        |  17 +
 meta/recipes-devtools/flex/flex_2.6.4.bb      |   2 +-
 .../python/python3-certifi_2024.2.2.bb        |   2 +
 .../python/python3-idna_3.7.bb                |   2 +
 .../python/python3-pip_24.0.bb                |   2 +
 .../python/python3-pyopenssl_24.0.0.bb        |   1 +
 .../python/python3-pyyaml_6.0.1.bb            |   2 +
 .../python/python3-xmltodict_0.13.0.bb        |   2 +
 .../python/python3/CVE-2026-7210.patch        | 148 +++++++
 .../python/python3_3.12.13.bb                 |   1 +
 meta/recipes-extended/shadow/shadow.inc       |   2 +
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |   2 +
 .../xorg-xserver/xserver-xorg.inc             |   2 +-
 .../linux/linux-yocto-rt_6.6.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  28 +-
 meta/recipes-kernel/perf/perf.bb              |   5 +-
 .../libsndfile1/CVE-2026-37555.patch          |  44 ++
 .../libsndfile/libsndfile1_1.2.2.bb           |   1 +
 .../curl/curl/CVE-2026-4873.patch             |  58 +++
 .../curl/curl/CVE-2026-5545.patch             |  42 ++
 .../curl/curl/CVE-2026-6253.patch             | 392 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   3 +
 .../gnutls/gnutls/CVE-2026-3833.patch         |  90 ++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   1 +
 .../libssh2/libssh2/CVE-2025-15661-1.patch    |  45 ++
 .../libssh2/libssh2/CVE-2025-15661-2.patch    | 131 ++++++
 .../libssh2/libssh2/CVE-2025-15661-3.patch    |  57 +++
 .../libssh2/libssh2/CVE-2026-66032.patch      |  36 ++
 .../libssh2/libssh2/CVE-2026-66033.patch      |  45 ++
 .../libssh2/libssh2/CVE-2026-66034.patch      |  40 ++
 .../libssh2/libssh2/CVE-2026-66035.patch      |  56 +++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   7 +
 53 files changed, 2297 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2026-38754.patch
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
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-7210.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-37555.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-4873.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5545.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6253.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3833.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2025-15661-1.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2025-15661-2.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2025-15661-3.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66032.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66033.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66034.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66035.patch


