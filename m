Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31029.1795560764652567579
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 14:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=SXgP1Ekg;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-497614c95f0so2888483f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795560763; x=1796165563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NCGsequrJ09De8fTL7Y/jtXakvZ0I8qiFMTMO5Wibl0=;
        b=SXgP1EkgrzyhJHxoNAVGpY0GFVxbRqISGeNqPtHFWfgnAxoJv6Gdcj+f8wMt45+YWC
         B6zWFYelHlRCQPlXHEkX+XQkBSckCtNnV+IyJsSecclRh0R7ZCsYcwa5wvgDqUuKmGer
         qVbUJqepgznxOBjzacwxI/QTmGjtg+p0P/LUUsr+5BfBJvbTyEEvSvztt+Bd2SDldBVp
         vYtpzIFstIs4vavrGrLs3gPFrxznhyyVYcN50xviU0LOdEJv3sl4VOugxOQ8yFBM+Fhg
         3z8zh87O/lrfEwa48qk2FxNLGDqc7yiThOw8na3mliZ1jUCqBEFjDvyepz8CnbKSEh/o
         +IdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560763; x=1796165563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NCGsequrJ09De8fTL7Y/jtXakvZ0I8qiFMTMO5Wibl0=;
        b=eg9OAnQwcwA65NTuKlznet5aLHuNwdQkINes7lH+jWqglIWL7cRD/RDIP5WnB9tiX1
         GIVi4HahihB4o0GwI/eUlpewtOJEqRjsbnoW+xv79PTL8Ls+j5OD+lTNhkyHaI6+/clh
         /DI4hH4RfJhwE48tJEOyEzBNvT/y7QRI/E05I60qHLCVBOcXDWDvZod9Q4UvlbpMO/xu
         RnE9UkzLj630UCtWZ1e/LzlRozYV3M9Sae9o63wioybyG9WlmpBTUP83wVaHN+FpV06n
         eMT74JPbuZNDqRLN+Nq3UJRolx45sfI3UjcJFoVWShJfhiPUmzwxyv5G6EFkdPe5P/X2
         JnjA==
X-Gm-Message-State: APuU4Z+vQcw9Sup2iaVuO59hl0A202sjkYyvqm+lyAjL4JbXtPdFZNmp
	NuHtE0rZu8otLbOtaf7RrJp7Uz+01mvnpgzst6hQRRH3ibSUZV24j7ua3xY6vNbfAVqG10pOXut
	J/E6HKN8=
X-Gm-Gg: AZFdTZfts+EON1GEBIY+Peag4awEmrJ7awLnQX+7xO3FmpeE+0OD8q4HV2Gy5p7yHQs
	66czdu0dofcfEwaZ9sfeTp9ZyAv3/w/3cRlnz//5lTcLerwUQ9dCqjT1Ul1SPBtLGNxfReb0mS/
	DlEwpW+9caFmoCpOAHcWc09QiNkDOAe87JWgHfR2OBl+8z/DplWyzup9lhG/RIovlaLnk82zwWe
	KgBIRKuDXz/rJkq4Og3EuZNRIQH8D19T1L32/EcNgulqstf3hSqHpodFnYPQrQ8wMz1bKW6laso
	G3zPaOrYq993KkvuBezKhDpUONL9zmD0fQ09JZg0TL5gjtgx5oiETAiZ1L2FFalVgXSlpFiYVZ2
	X2IbscGDWFdbPUSjw8LkRqQaHeazUA20rqEvcNygZ5/nMcO+Wd+v9F9q8OX8jAiZgbqpHipUQEZ
	DWPL/d/XiCpQ4mt37ZdSay2iYOMANI0GChiDtUGiAmJCkzpjQeJqoM23eL6AqZgpfzI3cfGiFQt
	SdDD5QQGuIlpje5vK2rdkvbx6K1CFswYJg1OKVaxaLpeys/DQhqi7HMh+mLUGs1C8YUGHL1HhKj
	TbGCNzu638TTy3GwIoYD6D4L+542G4sUwr/GQ5W2rhPiEX8sRTenAZm9Mjwu5OweLLmiEbYDhMH
	xYXrYpPSTKFOFpTRktlJ7P5dYXp4c
X-Received: by 2002:a05:6000:258a:b0:4a6:4f35:1bdb with SMTP id ffacd0b85a97d-4abb44d3448mr32298846f8f.39.1795560762817;
        Tue, 24 Nov 2026 14:52:42 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm27446707f8f.17.2026.11.24.14.52.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:52:42 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 00/21] Patch review
Date: Tue, 24 Nov 2026 23:52:17 +0100
Message-ID: <cover.1795560372.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 22:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251102
Content-Type: text/plain; charset="utf-8"

Please review this set of changes for wrynose and have comments back by
end of day Thursday, November 26.

This series is a subset of the review queue aimed at unblocking as much
scarthgap patches as possible for the upcoming 5.0.22 release.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/5180

The following changes since commit 16a03ed6c2db2fa1d7edac4f288a74958a00eb9f:

  build-appliance-image: Update to wrynose head revisions (2026-11-20 10:24:35 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-review
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-review

for you to fetch changes up to 1dc4b90903b014a610c753ce0cc65b343a17796b:

  python3-certifi: correct license to MPL-2.0 (2026-11-24 14:36:27 +0100)

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

Hetvi Thakar (1):
  glibc: stable 2.43 branch updates to 124e9adcd4

Peter Marko (6):
  popt: correct CVE-2026-18739.patch metadata
  popt: patch CVE-2026-18839
  libsndfile1: patch CVE-2024-50613
  libsndfile1: patch CVE-2025-52194
  libsndfile1: patch CVE-2026-109828
  speex: patch CVE-2026-116741

Yogita Urade (1):
  bison: Fix CVE-2026-56390

 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/glibc/glibc_2.43.bb         |   1 +
 .../bison/bison/CVE-2026-56390.patch          | 233 ++++++++++
 meta/recipes-devtools/bison/bison_3.8.2.bb    |   1 +
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
 .../popt/popt/CVE-2026-18739.patch            |   2 +-
 .../popt/popt/CVE-2026-18839-01.patch         |  89 ++++
 .../popt/popt/CVE-2026-18839-02.patch         | 419 ++++++++++++++++++
 meta/recipes-support/popt/popt_1.19.bb        |   4 +-
 .../sqlite3/CVE-2026-119371-dependent.patch   | 109 +++++
 .../sqlite/sqlite3/CVE-2026-119371.patch      | 103 +++++
 .../sqlite/sqlite3/CVE-2026-119372.patch      |  56 +++
 .../sqlite/sqlite3/CVE-2026-119373.patch      |  56 +++
 .../sqlite/sqlite3/CVE-2026-119374.patch      |  76 ++++
 .../sqlite/sqlite3/CVE-2026-119375.patch      |  47 ++
 .../sqlite/sqlite3/CVE-2026-119376.patch      |  75 ++++
 .../CVE-2026-119377-dependent_p1.patch        |  86 ++++
 .../CVE-2026-119377-dependent_p2.patch        |  59 +++
 .../sqlite/sqlite3/CVE-2026-119377_p1.patch   |  52 +++
 .../sqlite/sqlite3/CVE-2026-119377_p2.patch   |  51 +++
 .../sqlite/sqlite3/CVE-2026-119378.patch      |  52 +++
 .../sqlite/sqlite3/CVE-2026-119379.patch      |  79 ++++
 .../sqlite/sqlite3/CVE-2026-119591.patch      |  40 ++
 meta/recipes-support/sqlite/sqlite3_3.51.3.bb |  14 +
 33 files changed, 2380 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-devtools/bison/bison/CVE-2026-56390.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50613.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-52194.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-109828-01.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2026-109828-02.patch
 create mode 100644 meta/recipes-multimedia/speex/speex/CVE-2026-116741.patch
 rename meta/recipes-support/aspell/{aspell_0.60.8.2.bb => aspell_0.60.8.3.bb} (93%)
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18839-01.patch
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18839-02.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3/CVE-2026-119371-dependent.patch
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

