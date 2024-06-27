Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA43CC2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 22:18:21 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.4477.1719526692663478793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 15:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e8g3yAsW;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3d55f476494so14808b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 15:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719526690; x=1720131490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9opXK6P4euOzzd2u7Ani6mSqXbbEi061brNbOlEdYG8=;
        b=e8g3yAsWbID5vdq19c6k7ymv1WzRkEcVgF4DBTqG8/LII5J75tiWwcx9I/3uuGc3Db
         ZjD2v6nYFVPCKs68ZspBbMzFywVPQWTmvmdfdzc+OjWFRQNZPePM746paZ2prBYkmAyM
         z1HF2IKq+a048/n/p3sJuFgYaH/Hb71EThHiVVB+NN4JLvscdrTQGvSBl9XFW/ilty8r
         A64tjHmBR1xup94LYLie+9op1o+VGZIIcZJYghzbK3vytXUcDGKEWH5RJ9APrFr6vCX9
         nCdyS7E+SaBKR/lbi4fRDnQ7a44rAiE1BFl6i3/2qH1Twxo7CGFub3UxPS0D5mzKFD9T
         ckxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719526690; x=1720131490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9opXK6P4euOzzd2u7Ani6mSqXbbEi061brNbOlEdYG8=;
        b=fpagvJnh4DtRlnsb1lRJHnBsMz7wpNRfJkIeUrnhE5pHoJsVpkFoLCPgC/KG3PpwrP
         OmKbTL1m4mDmK9OMpl1KJLxlFspr7k4rkefECbpFMKRE0fiGS/Xr5ka8Bh2wkQOtLXY0
         MQKxYk6d5PLCGWz36sbXIHF4+S2Af0jZg9cyuQ4WU0TexQR6duNmYC3Q0CQ6X4VttR5I
         LAYzo84jzKSdi6rujJnXueZ/1tcYUAR61XJgnPDhSIWD+qfSUqsiOaIh0PAEumXqxrKa
         yGaCKgjHODzQpW54Wq9Y56PLzocniWXqK1tRlUqpyIM64QgbnMfAFuQnFaw0Wg03m5zR
         08Pw==
X-Gm-Message-State: AOJu0Yx1Brl2yfMtvMgP6+Dw9Q0EuSQvZJrrEswRvJo3Rs9q2tuoJbb/
	6wYWSWq0rjq6WHGV4gCoj1H9kuE18FcQQ5POMMFTXlEVl4y2HhLyWFaQcw==
X-Google-Smtp-Source: AGHT+IHsPKwj4WSAJKIOqKUBMcxHHl16oGe+JsBJU9FER+Y/3Slla/OsVwLwtNOVVqbdunbaa/ibtA==
X-Received: by 2002:a05:6808:1209:b0:3d1:ec2d:7b74 with SMTP id 5614622812f47-3d59eb47409mr1409722b6e.16.1719526690252;
        Thu, 27 Jun 2024 15:18:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::56b2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d62fb5234esm81571b6e.58.2024.06.27.15.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 15:18:09 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 0/2] Update to latest version of SPDX licenses
Date: Thu, 27 Jun 2024 16:16:54 -0600
Message-ID: <20240627221804.599573-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 22:18:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201212

Adds a script to read the released SPDX license JSON data, and uses it
to update the common license files

Joshua Watt (2):
  scripts/pull-spdx-licenses.py: Add script
  licenses: Update to SPDX license version 3.24.0

 meta/files/common-licenses/3D-Slicer-1.0      |   190 +
 meta/files/common-licenses/AMD-newlib         |    11 +
 meta/files/common-licenses/AML-glslang        |    41 +
 .../common-licenses/ASWF-Digital-Assets-1.0   |    17 +
 .../common-licenses/ASWF-Digital-Assets-1.1   |    17 +
 meta/files/common-licenses/AdaCore-doc        |     1 +
 .../common-licenses/Adobe-Display-PostScript  |    30 +
 meta/files/common-licenses/Adobe-Utopia       |    12 +
 meta/files/common-licenses/App-s2p            |     5 +
 meta/files/common-licenses/Arphic-1999        |    58 +
 .../files/common-licenses/BSD-2-Clause-Darwin |    28 +
 .../common-licenses/BSD-2-Clause-first-lines  |    28 +
 meta/files/common-licenses/BSD-3-Clause-HP    |    23 +
 meta/files/common-licenses/BSD-3-Clause-Sun   |    29 +
 .../files/common-licenses/BSD-3-Clause-acpica |    26 +
 meta/files/common-licenses/BSD-3-Clause-flex  |    42 +
 meta/files/common-licenses/BSD-4.3RENO        |     9 +
 meta/files/common-licenses/BSD-4.3TAHOE       |    11 +
 .../BSD-Advertising-Acknowledgement           |    37 +
 .../BSD-Attribution-HPND-disclaimer           |    37 +
 .../common-licenses/BSD-Inferno-Nettverk      |    42 +
 .../common-licenses/BSD-Source-beginning-file |    23 +
 meta/files/common-licenses/BSD-Systemics      |    39 +
 .../common-licenses/BSD-Systemics-W3Works     |    62 +
 meta/files/common-licenses/Baekmuk            |     9 +
 meta/files/common-licenses/Bitstream-Charter  |     9 +
 meta/files/common-licenses/Bitstream-Vera     |    15 +
 meta/files/common-licenses/Boehm-GC           |    12 +
 .../common-licenses/Brian-Gladman-2-Clause    |    17 +
 .../common-licenses/Brian-Gladman-3-Clause    |    26 +
 meta/files/common-licenses/CC-BY-3.0-AU       |   136 +
 meta/files/common-licenses/CC-BY-3.0-IGO      |   101 +
 meta/files/common-licenses/CC-BY-NC-SA-2.0-DE |    85 +
 meta/files/common-licenses/CC-BY-SA-3.0-IGO   |   107 +
 meta/files/common-licenses/CFITSIO            |     7 +
 meta/files/common-licenses/CMU-Mach           |    22 +
 meta/files/common-licenses/CMU-Mach-nodoc     |    11 +
 meta/files/common-licenses/COIL-1.0           |    30 +
 .../files/common-licenses/Caldera-no-preamble |    35 +
 meta/files/common-licenses/Catharon           |   121 +
 meta/files/common-licenses/Clips              |    15 +
 meta/files/common-licenses/Community-Spec-1.0 |   293 +
 .../common-licenses/Cornell-Lossless-JPEG     |    20 +
 meta/files/common-licenses/Cronyx             |    11 +
 meta/files/common-licenses/DEC-3-Clause       |    28 +
 meta/files/common-licenses/DL-DE-BY-2.0       |    45 +
 meta/files/common-licenses/DL-DE-ZERO-2.0     |    25 +
 meta/files/common-licenses/DRL-1.1            |    17 +
 meta/files/common-licenses/Elastic-2.0        |    93 +
 meta/files/common-licenses/FBM                |     6 +
 meta/files/common-licenses/FDK-AAC            |    79 +
 .../FSFAP-no-warranty-disclaimer              |     5 +
 meta/files/common-licenses/FSFULLRWD          |    11 +
 meta/files/common-licenses/Ferguson-Twofish   |    15 +
 meta/files/common-licenses/Furuseth           |    13 +
 meta/files/common-licenses/GCR-docs           |    30 +
 meta/files/common-licenses/Graphics-Gems      |     5 +
 meta/files/common-licenses/Gutmann            |     2 +
 meta/files/common-licenses/HP-1986            |    10 +
 meta/files/common-licenses/HP-1989            |    16 +
 meta/files/common-licenses/HPND-DEC           |    22 +
 .../common-licenses/HPND-Fenneberg-Livingston |    13 +
 meta/files/common-licenses/HPND-INRIA-IMAG    |     9 +
 meta/files/common-licenses/HPND-Intel         |    25 +
 meta/files/common-licenses/HPND-Kevlin-Henney |    10 +
 .../files/common-licenses/HPND-MIT-disclaimer |    18 +
 meta/files/common-licenses/HPND-Markus-Kuhn   |     3 +
 meta/files/common-licenses/HPND-Pbmplus       |     8 +
 meta/files/common-licenses/HPND-UC            |     8 +
 meta/files/common-licenses/HPND-UC-export-US  |    10 +
 meta/files/common-licenses/HPND-doc           |     8 +
 meta/files/common-licenses/HPND-doc-sell      |     9 +
 meta/files/common-licenses/HPND-export-US     |     5 +
 .../HPND-export-US-acknowledgement            |    22 +
 .../common-licenses/HPND-export-US-modify     |    24 +
 meta/files/common-licenses/HPND-export2-US    |    21 +
 .../HPND-merchantability-variant              |     9 +
 .../HPND-sell-MIT-disclaimer-xserver          |    12 +
 meta/files/common-licenses/HPND-sell-regexpr  |     9 +
 .../HPND-sell-variant-MIT-disclaimer          |    20 +
 .../HPND-sell-variant-MIT-disclaimer-rev      |    15 +
 .../common-licenses/IEC-Code-Components-EULA  |    37 +
 meta/files/common-licenses/IJG-short          |    35 +
 meta/files/common-licenses/ISC-Veillard       |     9 +
 meta/files/common-licenses/Inner-Net-2.0      |    34 +
 meta/files/common-licenses/JPL-image          |    21 +
 meta/files/common-licenses/Jam                |     5 +
 meta/files/common-licenses/Kastrup            |     3 +
 meta/files/common-licenses/Kazlib             |     4 +
 meta/files/common-licenses/Knuth-CTAN         |     5 +
 meta/files/common-licenses/LOOP               |    44 +
 meta/files/common-licenses/LPD-document       |     8 +
 .../common-licenses/LZMA-SDK-9.11-to-9.20     |     8 +
 meta/files/common-licenses/LZMA-SDK-9.22      |    15 +
 .../common-licenses/Latex2e-translated-notice |    26 +
 .../common-licenses/Linux-man-pages-1-para    |     4 +
 .../common-licenses/Linux-man-pages-copyleft  |    21 +
 .../Linux-man-pages-copyleft-2-para           |     8 +
 .../Linux-man-pages-copyleft-var              |    16 +
 .../files/common-licenses/Lucida-Bitmap-Fonts |    53 +
 meta/files/common-licenses/MIT-Festival       |    22 +
 meta/files/common-licenses/MIT-Khronos-old    |    23 +
 meta/files/common-licenses/MIT-Wu             |    28 +
 meta/files/common-licenses/MIT-testregex      |    17 +
 meta/files/common-licenses/MMIXware           |    17 +
 meta/files/common-licenses/MPEG-SSG           |    25 +
 meta/files/common-licenses/MS-LPL             |    24 +
 meta/files/common-licenses/Mackerras-3-Clause |    25 +
 .../Mackerras-3-Clause-acknowledgment         |    25 +
 meta/files/common-licenses/Martin-Birgmeier   |     5 +
 meta/files/common-licenses/McPhee-slideshow   |     6 +
 meta/files/common-licenses/Minpack            |    51 +
 meta/files/common-licenses/NCBI-PD            |    19 +
 meta/files/common-licenses/NCL                |    32 +
 meta/files/common-licenses/NICTA-1.0          |    61 +
 meta/files/common-licenses/NIST-Software      |    28 +
 meta/files/common-licenses/OAR                |    12 +
 meta/files/common-licenses/OFFIS              |    22 +
 meta/files/common-licenses/OLFL-1.3           |   220 +
 meta/files/common-licenses/OPL-UK-3.0         |   114 +
 meta/files/common-licenses/OpenPBS-2.3        |    77 +
 meta/files/common-licenses/OpenSSL-standalone |    50 +
 meta/files/common-licenses/OpenVision         |    33 +
 meta/files/common-licenses/PADL               |     6 +
 meta/files/common-licenses/PPL                |    96 +
 meta/files/common-licenses/Pixar              |   175 +
 meta/files/common-licenses/Python-2.0.1       |   193 +
 meta/files/common-licenses/QPL-1.0-INRIA-2004 |   102 +
 meta/files/common-licenses/SAX-PD-2.0         |    10 +
 meta/files/common-licenses/SGI-OpenGL         |    34 +
 meta/files/common-licenses/SGP4               |     1 +
 meta/files/common-licenses/SL                 |     4 +
 meta/files/common-licenses/SSLeay-standalone  |    58 +
 meta/files/common-licenses/SchemeReport       |     3 +
 meta/files/common-licenses/Soundex            |     9 +
 meta/files/common-licenses/Sun-PPP            |    13 +
 meta/files/common-licenses/Sun-PPP-2000       |    14 +
 meta/files/common-licenses/SunPro             |     6 +
 meta/files/common-licenses/Symlinks           |    10 +
 meta/files/common-licenses/TGPPL-1.0          |   181 +
 meta/files/common-licenses/TPDL               |     2 +
 meta/files/common-licenses/TPL-1.0            |   475 +
 meta/files/common-licenses/TTWL               |     8 +
 meta/files/common-licenses/TTYP0              |    30 +
 meta/files/common-licenses/TermReadKey        |     1 +
 meta/files/common-licenses/UCAR               |    32 +
 meta/files/common-licenses/UMich-Merit        |    19 +
 meta/files/common-licenses/URT-RLE            |    15 +
 meta/files/common-licenses/Unicode-3.0        |    39 +
 meta/files/common-licenses/UnixCrypt          |     6 +
 meta/files/common-licenses/Widget-Workshop    |    19 +
 .../X11-distribute-modifications-variant      |    25 +
 meta/files/common-licenses/Xdebug-1.03        |    60 +
 meta/files/common-licenses/Xfig               |     7 +
 meta/files/common-licenses/Zeeff              |     3 +
 meta/files/common-licenses/any-OSI            |     3 +
 .../common-licenses/bcrypt-Solar-Designer     |    11 +
 meta/files/common-licenses/check-cvs          |     2 +
 meta/files/common-licenses/checkmk            |     9 +
 meta/files/common-licenses/cve-tou            |    16 +
 meta/files/common-licenses/dtoa               |    14 +
 meta/files/common-licenses/fwlw               |     5 +
 meta/files/common-licenses/gtkbook            |     6 +
 meta/files/common-licenses/hdparm             |     9 +
 .../common-licenses/libutil-David-Nugent      |    15 +
 meta/files/common-licenses/lsof               |    26 +
 meta/files/common-licenses/magaz              |     4 +
 meta/files/common-licenses/mailprio           |     9 +
 meta/files/common-licenses/metamail           |    12 +
 meta/files/common-licenses/mpi-permissive     |    15 +
 meta/files/common-licenses/mplus              |     6 +
 meta/files/common-licenses/pnmstitch          |    23 +
 meta/files/common-licenses/python-ldap        |    10 +
 meta/files/common-licenses/radvd              |    37 +
 meta/files/common-licenses/snprintf           |     3 +
 meta/files/common-licenses/softSurfer         |     6 +
 meta/files/common-licenses/ssh-keyscan        |     5 +
 meta/files/common-licenses/swrule             |     1 +
 meta/files/common-licenses/threeparttable     |     3 +
 meta/files/common-licenses/ulem               |     4 +
 meta/files/common-licenses/w3m                |    11 +
 .../common-licenses/xkeyboard-config-Zinoviev |    15 +
 meta/files/common-licenses/xlock              |    14 +
 meta/files/common-licenses/xzoom              |    12 +
 meta/files/spdx-licenses.json                 | 10510 ++++++++++------
 scripts/pull-sdpx-licenses.py                 |   101 +
 186 files changed, 12359 insertions(+), 4086 deletions(-)
 create mode 100644 meta/files/common-licenses/3D-Slicer-1.0
 create mode 100644 meta/files/common-licenses/AMD-newlib
 create mode 100644 meta/files/common-licenses/AML-glslang
 create mode 100644 meta/files/common-licenses/ASWF-Digital-Assets-1.0
 create mode 100644 meta/files/common-licenses/ASWF-Digital-Assets-1.1
 create mode 100644 meta/files/common-licenses/AdaCore-doc
 create mode 100644 meta/files/common-licenses/Adobe-Display-PostScript
 create mode 100644 meta/files/common-licenses/Adobe-Utopia
 create mode 100644 meta/files/common-licenses/App-s2p
 create mode 100644 meta/files/common-licenses/Arphic-1999
 create mode 100644 meta/files/common-licenses/BSD-2-Clause-Darwin
 create mode 100644 meta/files/common-licenses/BSD-2-Clause-first-lines
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-HP
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-Sun
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-acpica
 create mode 100644 meta/files/common-licenses/BSD-3-Clause-flex
 create mode 100644 meta/files/common-licenses/BSD-4.3RENO
 create mode 100644 meta/files/common-licenses/BSD-4.3TAHOE
 create mode 100644 meta/files/common-licenses/BSD-Advertising-Acknowledgement
 create mode 100644 meta/files/common-licenses/BSD-Attribution-HPND-disclaimer
 create mode 100644 meta/files/common-licenses/BSD-Inferno-Nettverk
 create mode 100644 meta/files/common-licenses/BSD-Source-beginning-file
 create mode 100644 meta/files/common-licenses/BSD-Systemics
 create mode 100644 meta/files/common-licenses/BSD-Systemics-W3Works
 create mode 100644 meta/files/common-licenses/Baekmuk
 create mode 100644 meta/files/common-licenses/Bitstream-Charter
 create mode 100644 meta/files/common-licenses/Bitstream-Vera
 create mode 100644 meta/files/common-licenses/Boehm-GC
 create mode 100644 meta/files/common-licenses/Brian-Gladman-2-Clause
 create mode 100644 meta/files/common-licenses/Brian-Gladman-3-Clause
 create mode 100644 meta/files/common-licenses/CC-BY-3.0-AU
 create mode 100644 meta/files/common-licenses/CC-BY-3.0-IGO
 create mode 100644 meta/files/common-licenses/CC-BY-NC-SA-2.0-DE
 create mode 100644 meta/files/common-licenses/CC-BY-SA-3.0-IGO
 create mode 100644 meta/files/common-licenses/CFITSIO
 create mode 100644 meta/files/common-licenses/CMU-Mach
 create mode 100644 meta/files/common-licenses/CMU-Mach-nodoc
 create mode 100644 meta/files/common-licenses/COIL-1.0
 create mode 100644 meta/files/common-licenses/Caldera-no-preamble
 create mode 100644 meta/files/common-licenses/Catharon
 create mode 100644 meta/files/common-licenses/Clips
 create mode 100644 meta/files/common-licenses/Community-Spec-1.0
 create mode 100644 meta/files/common-licenses/Cornell-Lossless-JPEG
 create mode 100644 meta/files/common-licenses/Cronyx
 create mode 100644 meta/files/common-licenses/DEC-3-Clause
 create mode 100644 meta/files/common-licenses/DL-DE-BY-2.0
 create mode 100644 meta/files/common-licenses/DL-DE-ZERO-2.0
 create mode 100644 meta/files/common-licenses/DRL-1.1
 create mode 100644 meta/files/common-licenses/Elastic-2.0
 create mode 100644 meta/files/common-licenses/FBM
 create mode 100644 meta/files/common-licenses/FDK-AAC
 create mode 100644 meta/files/common-licenses/FSFAP-no-warranty-disclaimer
 create mode 100644 meta/files/common-licenses/FSFULLRWD
 create mode 100644 meta/files/common-licenses/Ferguson-Twofish
 create mode 100644 meta/files/common-licenses/Furuseth
 create mode 100644 meta/files/common-licenses/GCR-docs
 create mode 100644 meta/files/common-licenses/Graphics-Gems
 create mode 100644 meta/files/common-licenses/Gutmann
 create mode 100644 meta/files/common-licenses/HP-1986
 create mode 100644 meta/files/common-licenses/HP-1989
 create mode 100644 meta/files/common-licenses/HPND-DEC
 create mode 100644 meta/files/common-licenses/HPND-Fenneberg-Livingston
 create mode 100644 meta/files/common-licenses/HPND-INRIA-IMAG
 create mode 100644 meta/files/common-licenses/HPND-Intel
 create mode 100644 meta/files/common-licenses/HPND-Kevlin-Henney
 create mode 100644 meta/files/common-licenses/HPND-MIT-disclaimer
 create mode 100644 meta/files/common-licenses/HPND-Markus-Kuhn
 create mode 100644 meta/files/common-licenses/HPND-Pbmplus
 create mode 100644 meta/files/common-licenses/HPND-UC
 create mode 100644 meta/files/common-licenses/HPND-UC-export-US
 create mode 100644 meta/files/common-licenses/HPND-doc
 create mode 100644 meta/files/common-licenses/HPND-doc-sell
 create mode 100644 meta/files/common-licenses/HPND-export-US
 create mode 100644 meta/files/common-licenses/HPND-export-US-acknowledgement
 create mode 100644 meta/files/common-licenses/HPND-export-US-modify
 create mode 100644 meta/files/common-licenses/HPND-export2-US
 create mode 100644 meta/files/common-licenses/HPND-merchantability-variant
 create mode 100644 meta/files/common-licenses/HPND-sell-MIT-disclaimer-xserver
 create mode 100644 meta/files/common-licenses/HPND-sell-regexpr
 create mode 100644 meta/files/common-licenses/HPND-sell-variant-MIT-disclaimer
 create mode 100644 meta/files/common-licenses/HPND-sell-variant-MIT-disclaimer-rev
 create mode 100644 meta/files/common-licenses/IEC-Code-Components-EULA
 create mode 100644 meta/files/common-licenses/IJG-short
 create mode 100644 meta/files/common-licenses/ISC-Veillard
 create mode 100644 meta/files/common-licenses/Inner-Net-2.0
 create mode 100644 meta/files/common-licenses/JPL-image
 create mode 100644 meta/files/common-licenses/Jam
 create mode 100644 meta/files/common-licenses/Kastrup
 create mode 100644 meta/files/common-licenses/Kazlib
 create mode 100644 meta/files/common-licenses/Knuth-CTAN
 create mode 100644 meta/files/common-licenses/LOOP
 create mode 100644 meta/files/common-licenses/LPD-document
 create mode 100644 meta/files/common-licenses/LZMA-SDK-9.11-to-9.20
 create mode 100644 meta/files/common-licenses/LZMA-SDK-9.22
 create mode 100644 meta/files/common-licenses/Latex2e-translated-notice
 create mode 100644 meta/files/common-licenses/Linux-man-pages-1-para
 create mode 100644 meta/files/common-licenses/Linux-man-pages-copyleft
 create mode 100644 meta/files/common-licenses/Linux-man-pages-copyleft-2-para
 create mode 100644 meta/files/common-licenses/Linux-man-pages-copyleft-var
 create mode 100644 meta/files/common-licenses/Lucida-Bitmap-Fonts
 create mode 100644 meta/files/common-licenses/MIT-Festival
 create mode 100644 meta/files/common-licenses/MIT-Khronos-old
 create mode 100644 meta/files/common-licenses/MIT-Wu
 create mode 100644 meta/files/common-licenses/MIT-testregex
 create mode 100644 meta/files/common-licenses/MMIXware
 create mode 100644 meta/files/common-licenses/MPEG-SSG
 create mode 100644 meta/files/common-licenses/MS-LPL
 create mode 100644 meta/files/common-licenses/Mackerras-3-Clause
 create mode 100644 meta/files/common-licenses/Mackerras-3-Clause-acknowledgment
 create mode 100644 meta/files/common-licenses/Martin-Birgmeier
 create mode 100644 meta/files/common-licenses/McPhee-slideshow
 create mode 100644 meta/files/common-licenses/Minpack
 create mode 100644 meta/files/common-licenses/NCBI-PD
 create mode 100644 meta/files/common-licenses/NCL
 create mode 100644 meta/files/common-licenses/NICTA-1.0
 create mode 100644 meta/files/common-licenses/NIST-Software
 create mode 100644 meta/files/common-licenses/OAR
 create mode 100644 meta/files/common-licenses/OFFIS
 create mode 100644 meta/files/common-licenses/OLFL-1.3
 create mode 100644 meta/files/common-licenses/OPL-UK-3.0
 create mode 100644 meta/files/common-licenses/OpenPBS-2.3
 create mode 100644 meta/files/common-licenses/OpenSSL-standalone
 create mode 100644 meta/files/common-licenses/OpenVision
 create mode 100644 meta/files/common-licenses/PADL
 create mode 100644 meta/files/common-licenses/PPL
 create mode 100644 meta/files/common-licenses/Pixar
 create mode 100644 meta/files/common-licenses/Python-2.0.1
 create mode 100644 meta/files/common-licenses/QPL-1.0-INRIA-2004
 create mode 100644 meta/files/common-licenses/SAX-PD-2.0
 create mode 100644 meta/files/common-licenses/SGI-OpenGL
 create mode 100644 meta/files/common-licenses/SGP4
 create mode 100644 meta/files/common-licenses/SL
 create mode 100644 meta/files/common-licenses/SSLeay-standalone
 create mode 100644 meta/files/common-licenses/SchemeReport
 create mode 100644 meta/files/common-licenses/Soundex
 create mode 100644 meta/files/common-licenses/Sun-PPP
 create mode 100644 meta/files/common-licenses/Sun-PPP-2000
 create mode 100644 meta/files/common-licenses/SunPro
 create mode 100644 meta/files/common-licenses/Symlinks
 create mode 100644 meta/files/common-licenses/TGPPL-1.0
 create mode 100644 meta/files/common-licenses/TPDL
 create mode 100644 meta/files/common-licenses/TPL-1.0
 create mode 100644 meta/files/common-licenses/TTWL
 create mode 100644 meta/files/common-licenses/TTYP0
 create mode 100644 meta/files/common-licenses/TermReadKey
 create mode 100644 meta/files/common-licenses/UCAR
 create mode 100644 meta/files/common-licenses/UMich-Merit
 create mode 100644 meta/files/common-licenses/URT-RLE
 create mode 100644 meta/files/common-licenses/Unicode-3.0
 create mode 100644 meta/files/common-licenses/UnixCrypt
 create mode 100644 meta/files/common-licenses/Widget-Workshop
 create mode 100644 meta/files/common-licenses/X11-distribute-modifications-variant
 create mode 100644 meta/files/common-licenses/Xdebug-1.03
 create mode 100644 meta/files/common-licenses/Xfig
 create mode 100644 meta/files/common-licenses/Zeeff
 create mode 100644 meta/files/common-licenses/any-OSI
 create mode 100644 meta/files/common-licenses/bcrypt-Solar-Designer
 create mode 100644 meta/files/common-licenses/check-cvs
 create mode 100644 meta/files/common-licenses/checkmk
 create mode 100644 meta/files/common-licenses/cve-tou
 create mode 100644 meta/files/common-licenses/dtoa
 create mode 100644 meta/files/common-licenses/fwlw
 create mode 100644 meta/files/common-licenses/gtkbook
 create mode 100644 meta/files/common-licenses/hdparm
 create mode 100644 meta/files/common-licenses/libutil-David-Nugent
 create mode 100644 meta/files/common-licenses/lsof
 create mode 100644 meta/files/common-licenses/magaz
 create mode 100644 meta/files/common-licenses/mailprio
 create mode 100644 meta/files/common-licenses/metamail
 create mode 100644 meta/files/common-licenses/mpi-permissive
 create mode 100644 meta/files/common-licenses/mplus
 create mode 100644 meta/files/common-licenses/pnmstitch
 create mode 100644 meta/files/common-licenses/python-ldap
 create mode 100644 meta/files/common-licenses/radvd
 create mode 100644 meta/files/common-licenses/snprintf
 create mode 100644 meta/files/common-licenses/softSurfer
 create mode 100644 meta/files/common-licenses/ssh-keyscan
 create mode 100644 meta/files/common-licenses/swrule
 create mode 100644 meta/files/common-licenses/threeparttable
 create mode 100644 meta/files/common-licenses/ulem
 create mode 100644 meta/files/common-licenses/w3m
 create mode 100644 meta/files/common-licenses/xkeyboard-config-Zinoviev
 create mode 100644 meta/files/common-licenses/xlock
 create mode 100644 meta/files/common-licenses/xzoom
 create mode 100755 scripts/pull-sdpx-licenses.py

-- 
2.45.2


