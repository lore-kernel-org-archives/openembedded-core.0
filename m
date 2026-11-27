Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1814.1795802625506546280
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 10:03:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=MNUMSGL/;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so4611249f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 10:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795802624; x=1796407424; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aeUJD5p18L/7L2Oj743Txqw8qtpXirxpB2Umpu9E3VQ=;
        b=MNUMSGL/RcvGO2nYsm6tOVcNJ+LRKC8M/pip5dMqH0Zj2LiAkB8w+MF78LOU8wHRIP
         1s9eIhbRAXXxfQ3yazbxTjtxyv7/fih/z+pU8yXQlNMdyN8C5j4ITSOIAgX6DRrinPAb
         WuToV6xl1oDrjnld2DF/F0Y6B6U4X/I4bCBuCRAvFGia8oq9DpyidbmdTNzjIANsRjQB
         YC+XikCS5/yOnekjSM3Q7PXFOGNsdQGLKDBUg9/RhUfmaz5/J8kN7PX+2SYkawoaYYy9
         FzlddV0IWQtwmaJxuaap+Xfd2Lfr/fLWJGjCZwZVSmpsQIRq0nKqtA1iXEewzn9DhRyk
         Tf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802624; x=1796407424;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aeUJD5p18L/7L2Oj743Txqw8qtpXirxpB2Umpu9E3VQ=;
        b=nms13BX17wGv7ZTC6zGLts4zahMIvAI2N/TEKtUXYOGfQ3bo5mxQgVaGj3+cQAaD/w
         hj8ktzwQ7cNnBDd4VxaIHnm+hAtCPkTXkS143NGUVPLzVuuPEsxFYK3olxAUkZD0Im/2
         AnvdyBa+eUZnczDmbQRon6dOPVEkPKPDnUrMAu7AuLyudv7G4Kx675E2v3Jwkv4vJQb+
         n+5izZaEJzThdhx4bDShHI5XScw+qHdcOQssu+G+QMPXgVojAG2mIWCn2CTqJdutVp0p
         dhQ1rmWUmPH7UN4rvoOTQ66BdLxl+b7sZ/3tU11L9xMt1XW6fBHI+EpTo8oGskkDkFDc
         ExHQ==
X-Gm-Message-State: APuU4Z9bgzmvo0I6qK+/H/+t9vDZ/Gzm/EgUV67DwJIyizhpHHi70dEd
	JejfHgjr/rq9iE9d6DzoQNoP//n4pcqbbp8pnOc2cNioFoRGHOuih8QigRPSWS2y0e7X3S9UQmz
	8hGnfBPY=
X-Gm-Gg: AZFdTZdqs+bVaglf59fCOFOeOCKEkps2RmspZf8XDKtnST9GiTixoiP/k9frdgCR1/W
	1KS/5ofgzGNiIfc35AZEbZ0n0eRef/EYEHrZLazwjnUW3iHWY69pI4/w/L3d0eJYEjYMHG8Zteq
	j3lBtTDqUcx5W2gp4/diIPsqWfapPZV6tceIXIqN3j0y2cSqXgF7mCQZpDaTxM7wOEFZObH2gD+
	DaOp9I85ah4jJ4eoWasiPhn6ukIrC4TxcpG9DC/nZq7EPTz2wwQvqdfOhE/3xrJ9tTaw5h17ThI
	YXZ3deuOm3hS1c+teTl8u/4TQr183mF/HzOLh/xMBLAHpiKh9XOxrXx4Nsh4n5z6XhZte1uX9t7
	Mi4LuA4zOcWaYxhmY+fTwQsJEojQ2l3fBbAmOtiuD7JtRpGcWp9G6xmXaBkHeAinuBn9gHbTY19
	YclSqKleKaE//SHl7ZQpfCakHaQ7y4n8IWQkReOjOTXIrBsuliolsQQzY97O3hzYJhVoqIOs3WD
	YiWpuQ35CFL2GW7eH2Jg5ebUpkBpZqRKKgujvu9RxePjbJDBclBRyl/pcNiTf0TCrgQyc4XwMIt
	f2CIEUl73iJ3Tut+j3bQyNKJDbPc5EtzPGR4Or3yBgHaUyKbxfT+dcQg1LESEYR0scstLsvTvrG
	fUJroQdf4CRb+pk5hsuM/YJmHEo08egIXBVbEUOBr4eqWHlRdlQ==
X-Received: by 2002:a05:6000:41cb:b0:4ba:a47a:f21d with SMTP id ffacd0b85a97d-4baa47af4fbmr17982624f8f.1.1795802623513;
        Fri, 27 Nov 2026 10:03:43 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf680fsm55722536f8f.14.2026.11.27.10.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:03:43 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][blacksail 00/21] Pull request (cover letter only)
Date: Fri, 27 Nov 2026 19:03:38 +0100
Message-ID: <cover.1795802558.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 18:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251446
Content-Type: text/plain; charset="utf-8"

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1795560335.git.yoann.congal@smile.fr/

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/5179

The following changes since commit 5b458838c126051c884c8cb5225c7265d1483ea6:

  build-appliance-image: Update to blacksail head revisions (2026-11-14 20:26:33 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/blacksail-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/blacksail-next

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

