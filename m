Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1926.1795803045167112316
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 10:10:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=dxMYOwWv;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a358881793so4445406f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 10:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795803043; x=1796407843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0HAW8NA/MQSzwb/dGpqQZ6Wst9irsF+n+k9Pz6nYeVQ=;
        b=dxMYOwWvjjwikvP6VnRCs0Z9zBk0kppbOc4m39gW3VDzcNP4v0wVUUKBHbwcC2MuY8
         t72TW7tMVGMhYqKy1RuDzTkcCwGXFB1oHU9kP1pEa2qWbA4fs4e0ZJpFTB4kIBdx8yLJ
         y3VOs8Yf4p6sJ/Jql0mLKA99XOSM3aEicgeKBmmA9boXspmo7uRhl6T6UoiA0eN49msu
         3xoKzUPbnuPK59NFWddQZUdw518AQJTp/fOMs6V/WErgkqNdJ+JLZqQC3ySHct3YeI1W
         f4zfiLskNO+LJ7WNTYN67dp/rL94qWmpZ1TQZQDg8Fi4Y2XmsxJowouSsJXHYu1fvwqR
         zzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795803043; x=1796407843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0HAW8NA/MQSzwb/dGpqQZ6Wst9irsF+n+k9Pz6nYeVQ=;
        b=zXLuJqem5RqpcGi8kbyu9EWPWhKmlUQ5zEtKBtXFwxDh5E/RhiaA6eS9GzrXO1cAfz
         Kyh85gvDlAAk5LzXDF19otCEfHKI2xngXaW8BQWw8FMPxn6rRLmsWi1HEHQEupILadiK
         dGCvU5AV36/XF6ok0stXpLoUIt8DoPOOPuql5+/deRq+wCht494FfA9Dvdm8/DPBkZQZ
         6RkA8y9i26UzJw6UV6+ZZgzQs/5/UXDQAWPxLKejitEWmoKMDBXOOgobDr3EFzl+SHUh
         ZtEUpE6WMDtQUy8Yh4ch0FkJOkd5TUVxCFYsAqFH8Y1Zr5P4czjkk9vUIQnbK/neMZS8
         PUvg==
X-Gm-Message-State: APuU4Z+pMOR2Bj2pPwxAcuo5vrbaL+R3Q4LJARQOtnqiNr4ZO9PXltwa
	AAdM3wYOj6gDEAE7WHrp9UDpDXZxW9/AnLgUiJFiHTtBDsWXwKQa+7WqeFNGr4Qf5dMWFa6YXVF
	yh317Des=
X-Gm-Gg: AZFdTZe1M4fwiYZtL/jnGLlqpNbvmreVwkPbPMd4omOoHc/KCO/ayNl8x6UcPuC6Jsn
	hNnaSnABwoFdS8F3PVJ+H+TanoWE6uPFqCk5rm4JQmI6NbVBUv3pNproQBY39LBHg1yMNkCx4m9
	BcTL9Rzjtn/TcPvUo0o5RY2IeJX4AhAbVfkhgzkgXzWQSfMMJSNzIomMg+BNoOFDlrlYX+xbvpG
	FkWQS9q/vI4QDYpfLPGP/p8VxtMQB6HPu/G6GHblKelwvOB1y9FhF1eWh2qpPT7pizGj51rQbtX
	alFCsLfIZ1y3GbHmvhjBwk+n9NIJIYq90y8AfzLk5OZnsBbuRsYK39tybVWIvm8Xq636k4CKStL
	oXo9yyGAsn5l2t65vlfkFekrOwEoqsuCnSilByMOX5KjfgICSg9xqsnYrBqomXO3c5AUJykq3Lw
	0dXAKv6LDAjU2WM88AGESIG0nZAbiEzhhK+lAl7st9I7/3cb+0CEk7MP/idxcoPO+31+h6lyJKX
	zyfl4a2X738mSc415bp83YKv3bW7lU7UJEY14dypfl3rZrPeOMIfVfGAsn1jk+0vGj8Q7w/GwHC
	vN37UxgP9PPEJC09QFHsNd/1nRo3xb7hxC1Lz4yDo1DdsoucQCDbr/uMUBimcD+FBIfBckbbOqk
	2TQAj5lm2x/Lp2nogJB538hNvIJeK
X-Received: by 2002:a05:6000:2310:b0:4a2:ee0f:4fa3 with SMTP id ffacd0b85a97d-4abad6a4224mr52152226f8f.8.1795803043355;
        Fri, 27 Nov 2026 10:10:43 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm47949362f8f.40.2026.11.27.10.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:10:42 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 00/21] Pull request (cover letter only)
Date: Fri, 27 Nov 2026 19:10:40 +0100
Message-ID: <cover.1795802959.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 18:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251447
Content-Type: text/plain; charset="utf-8"

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1795560372.git.yoann.congal@smile.fr/
(No review, no change)

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/5180

The following changes since commit 16a03ed6c2db2fa1d7edac4f288a74958a00eb9f:

  build-appliance-image: Update to wrynose head revisions (2026-11-20 10:24:35 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

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

