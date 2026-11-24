Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31013.1795560738304305409
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=aO6zavif;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so3612889f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560736; x=1796165536; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZuhprueNQMzLH7Vvs+Webq0ABGBML/jCm4eUDQl/iw=;
        b=aO6zavifYcIWk7xLRTDlN7F0gCzmzHauSlgcJPr3UAYR/6rlQ+xv0zcIf2Wiz1klWr
         YSRh5dskoMUW/zRkuiZKxfAOypKBmg7RJjCcjI+S4tMxlQMzkqXr2r3Cb5RfcRzIr7jr
         hBcQpMmgqDco+fF21xvXRQ6X83SEVw0U7YR0nc/4I4YfJdXeo8bqXnKZPMyprr6ETkL6
         R2oncx0IMaYjWBpIH+j9X5T3K6CmifLo7w1PGSUrNHtn3lkYA9BtqJmXHq2wvpWuizso
         sRL6FueXAYO9xfsHI1UyLegojsriXsbvj6/v88C7nSlhcoistp7KTMdqJI/kP2tl9J3c
         YVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560736; x=1796165536;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZuhprueNQMzLH7Vvs+Webq0ABGBML/jCm4eUDQl/iw=;
        b=A15TaJrVmNaXxhUfQmzgtU8+inZzCHz2VA/EmguS3wZjaAmeAzKaGXJOnChX+pfUz/
         qamN7L8HmXxMU/TWE2UA3QAKLO/rkl8BVqCG1NmAHVIpO0o6rKV23v6Nd1XEl2F49B08
         z0iGsIBT9/c+mOnAmXdLTd2z6LjojdhOxzwjY3cYteH8/r6NOGL/O+dNAHSUfrTZKPCu
         p8bC3buvNLJggUzc6MKOxXLphzZ1MRSoT53dI0PZXy68ML6Pho1KWjrnZcFeCukDerVL
         JNxNPlfM8uDuju+VYDqtMZoMWGKLFTzfhy4P5Z+owWTwhEVeQo+imaZ8CoufGtmxLzeA
         YjAg==
X-Gm-Message-State: APuU4Z8RNlwJr7IneD/I1DEcsOhZuii3S3afgtoRsn4D3xhEV7AtJepy
	eouxMjy67E6JUNaHvhnsFkiK1AZbFsykyZlJl2CPkE8QtZzTdpj0DkMCNtufRQS4hAYO/B0XEfX
	peXsmouo=
X-Gm-Gg: AZFdTZe8jDJ9pdZHcvAEBfdv0iMacMsvMBfH1Yqn92pcFW1JHo+P/Y2Ifmq1I7r2jIp
	9/k7R4Fju3DLS+KCqHei+19APIPdDLxj/LAx3fwSgYDDBHzooaFonteBKnopKy9rIOwcDxhIFna
	b391ifTNRDkY6ioru88F5IuIIW+4UykjZ9J/A8RQZ37n7qFM2dwCOVLROcC5yIF8aqvfjRjstEp
	100si+fVQdCbF/oCT3rdqRQTWrnYzr4u5OYdQEuPJdVWl8X/pBZcB33A0Kp61LdNjZuAjyuyGvi
	ljkyQ4eefZ62NDeQu0Bkic/t4UbAZR2YcGJFKTH5/azSgP5RrDKcZeGXTZeJcUE/0PxaJc8WYBj
	PX+afEJfme79Sdn+t8wK6wJ9Ay2k5c6y7qHqNqFXBL4wsvA71xpf5SWZePYLEy7/MPaDjb/BhjM
	X57jNyvrQv5FZTMo/Ja2XLU3U1BtysE3TCPbQ8llZoQ1du3F7coDmCvrWU4KdNPJeNlSDDm2gU6
	V4w1Mey549llpWfqsNGa97m4F0siJ5gpcdqGYHxqDLU/Bz6MCmMVDT1Vpxq/j99Ppy7AbV24ZNQ
	IEIFrlDjaUOuedSjRNRouRL767vAAcuCsVncuWabpIzsRMDl40pI6cEa3Qsy6xaV7va7ryLxslo
	kuZ29tIFgkrmD/PNrQP+pP5n2WK1V
X-Received: by 2002:a05:6000:2dc7:b0:4a5:bb9f:9c3c with SMTP id ffacd0b85a97d-4abb4c7ac0dmr38703369f8f.53.1795560736091;
        Tue, 24 Nov 2026 14:52:16 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm30462488f8f.52.2026.11.24.14.52.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:15 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 00/21] Patch review
Date: Tue, 24 Nov 2026 23:51:07 +0100
Message-ID: <cover.1795560335.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251080
Content-Type: text/plain; charset="utf-8"

Please review this set of changes for blacksail and have comments back by
end of day Thursday, November 26.

This series is a subset of the review queue aimed at unblocking as much
scarthgap patches as possible for the upcoming 5.0.22 release.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/5179

The following changes since commit 5b458838c126051c884c8cb5225c7265d1483ea6:

  build-appliance-image: Update to blacksail head revisions (2026-11-14 20:26:33 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/blacksail-review
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/blacksail-review

for you to fetch changes up to 28fa337f9075c8f991441e713cbf5a56d66737af:

  python3-certifi: correct license to MPL-2.0 (2026-11-24 14:29:24 +0100)

----------------------------------------------------------------

Anders Heimer (1):
  python3-certifi: correct license to MPL-2.0

Ankur Tyagi (2):
  aspell: upgrade 0.60.8.2 -> 0.60.8.3
  tzdata/tzcode-native: upgrade 2026e -> 2026f

Arpit Patel (10):
  sqlite3: Fix CVE-2026-119377
  sqlite3: fix CVE-2026-119373
  sqlite3: fix CVE-2026-119374
  sqlite3: fix CVE-2026-119375
  sqlite3: fix CVE-2026-119379
  sqlite3: fix CVE-2026-119372
  sqlite3: fix CVE-2026-119378
  sqlite3: fix CVE-2026-119376
  sqlite3: fix CVE-2026-119371
  sqlite3: fix CVE-2026-119591

Jaipaul Cheernam (1):
  glibc: stable 2.44 branch updates to f715e9491c

João Marcos Costa (Schneider Electric) (1):
  curl: fix CVE-2026-87865

Peter Marko (6):
  popt: correct CVE-2026-18739.patch metadata
  popt: patch CVE-2026-18839
  libsndfile1: patch CVE-2024-50613
  libsndfile1: patch CVE-2025-52194
  libsndfile1: patch CVE-2026-109828
  speex: patch CVE-2026-116741

 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/glibc/glibc_2.44.bb         |   1 +
 .../python/python3-certifi_2026.10.19.bb      |   2 +-
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../libsndfile1/CVE-2024-50613.patch          | 348 +++++++++++++++
 .../libsndfile1/CVE-2025-52194.patch          |  27 ++
 .../libsndfile1/CVE-2026-109828-01.patch      | 234 ++++++++++
 .../libsndfile1/CVE-2026-109828-02.patch      |  26 ++
 .../libsndfile/libsndfile1_1.2.2.bb           |   4 +
 .../speex/speex/CVE-2026-116741.patch         |  29 ++
 meta/recipes-multimedia/speex/speex_1.2.1.bb  |   5 +-
 ...{aspell_0.60.8.2.bb => aspell_0.60.8.3.bb} |   2 +-
 .../curl/curl/CVE-2026-87865.patch            | 216 +++++++++
 meta/recipes-support/curl/curl_8.22.0.bb      |   1 +
 .../popt/popt/CVE-2026-18739.patch            |   2 +-
 .../popt/popt/CVE-2026-18839-01.patch         |  89 ++++
 .../popt/popt/CVE-2026-18839-02.patch         | 419 ++++++++++++++++++
 meta/recipes-support/popt/popt_1.19.bb        |   4 +-
 .../sqlite/sqlite3/CVE-2026-119371.patch      | 103 +++++
 .../sqlite/sqlite3/CVE-2026-119372.patch      |  56 +++
 .../sqlite/sqlite3/CVE-2026-119373.patch      |  56 +++
 .../sqlite/sqlite3/CVE-2026-119374.patch      |  78 ++++
 .../sqlite/sqlite3/CVE-2026-119375.patch      |  47 ++
 .../sqlite/sqlite3/CVE-2026-119376.patch      |  75 ++++
 .../CVE-2026-119377-dependent_p1.patch        |  86 ++++
 .../CVE-2026-119377-dependent_p2.patch        |  61 +++
 .../sqlite/sqlite3/CVE-2026-119377_p1.patch   |  52 +++
 .../sqlite/sqlite3/CVE-2026-119377_p2.patch   |  51 +++
 .../sqlite/sqlite3/CVE-2026-119378.patch      |  52 +++
 .../sqlite/sqlite3/CVE-2026-119379.patch      |  79 ++++
 .../sqlite/sqlite3/CVE-2026-119591.patch      |  40 ++
 meta/recipes-support/sqlite/sqlite3_3.53.4.bb |  17 +-
 32 files changed, 2259 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50613.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-52194.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-109828-01.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-109828-02.patch
 create mode 100644 meta/recipes-multimedia/speex/speex/CVE-2026-116741.patch
 rename meta/recipes-support/aspell/{aspell_0.60.8.2.bb => aspell_0.60.8.3.bb} (93%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87865.patch
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18839-01.patch
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18839-02.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119371.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119372.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119373.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119374.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119375.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119376.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p1.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377-dependent_p2.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p1.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119377_p2.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119378.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119379.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119591.patch

