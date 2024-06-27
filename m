Return-Path: <JPEWhacker@gmail.com>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA7DC2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 22:18:31 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.4510.1719526703753263759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 15:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hAEuyl/j;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3d55f198f1eso10198b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 15:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719526702; x=1720131502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMJGsuYWUjEJE0sjVPszT5A6p4mVIk8YRGc3yfN+pY4=;
        b=hAEuyl/javO+7i9wsU03wznw/rfWlisHI0JGuc34a3zFO7zAyhVWap88QEkghduzqw
         vkGnKQo1dvvoLtIRGzNC7fPijNN6MmNNLHWKIae5jidgTfJ7Qp2iV7OB4XF8mqDUSy2Y
         /BX+eMPAqSejZW7JvHnXZw1loX/5GslDH8Mvm6yF78OnuvlZU01ewegJVMtxhonNNAIL
         xbiL6eEd+nEQaxlqHGlU6ypob4h+XHN5fplLdTwa4POufC6shhc7rqkOclTd2zaTNCuz
         tR882qjU69u1s8I1BWpLOXR4ZAFe/yKKqc+8Qb8NEkvsPodginxStOR8WXVAkE+eld40
         cejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719526702; x=1720131502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMJGsuYWUjEJE0sjVPszT5A6p4mVIk8YRGc3yfN+pY4=;
        b=ZE2sR4vX0lX5ult0HICaDUfDQGJviwSqKfQvHVWIQyBgUXpdLj1vmINhh8XIj+qNTf
         14Zg/Uj8v3F4ZjyCSQ6xorV+z/hTfSp21lqJMmndqI8zpkUCbnq+/XCzbCe8yYgRvxOo
         vPgVV5AZ7ZJf2sF2gsY8PCM9xP6Se1mo5Z2zU8Z0ti9KnT+5+BW1d/8o2f0yNzJ4O9nu
         bTbZCQJGliT8yTe0FnuW5CzqHgIJW/uHdFtkCXJhHCUjzNCPYqziE6V2ByKFOjN8ytyv
         5LAwJcoq5ZRYBbERsjUenEGIcqDlKed0UmQ/A3IOrcZZfImabqspeE8nOr0pTIVUBYSe
         odyA==
X-Gm-Message-State: AOJu0YxweYSwZvhMcFV5RnPnTm/0BxNaOYnr3SElpbjGP/JnO+h8qXIT
	FtZHVkKiuIc9+r9bB9N77Q8fo5nhDMgyuKKqCpQKsBTAF+257xoyeoBzcw==
X-Google-Smtp-Source: AGHT+IGmKS7QmbEl3b7hs2YRYEcTAhHkD6gRDv3XP6mXwWg4IwXl7fwKKOQdXY5tAUcIu+6GMpGIOw==
X-Received: by 2002:a05:6808:18a9:b0:3d6:2e6c:a29e with SMTP id 5614622812f47-3d62e6ca554mr1862162b6e.22.1719526694864;
        Thu, 27 Jun 2024 15:18:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::56b2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d62fb5234esm81571b6e.58.2024.06.27.15.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 15:18:12 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/2] licenses: Update to SPDX license version 3.24.0
Date: Thu, 27 Jun 2024 16:16:56 -0600
Message-ID: <20240627221804.599573-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627221804.599573-1-JPEWhacker@gmail.com>
References: <20240627221804.599573-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 22:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201214

Updates to the latest version of the SPDX license list and pulls in all
the missing license files

[YOCTO #15502]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
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
 185 files changed, 12258 insertions(+), 4086 deletions(-)
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
 create mode 100644 meta/files/common-licenses/BSD-Advertising-Acknowledgem=
ent
 create mode 100644 meta/files/common-licenses/BSD-Attribution-HPND-disclai=
mer
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
 create mode 100644 meta/files/common-licenses/HPND-export-US-acknowledgeme=
nt
 create mode 100644 meta/files/common-licenses/HPND-export-US-modify
 create mode 100644 meta/files/common-licenses/HPND-export2-US
 create mode 100644 meta/files/common-licenses/HPND-merchantability-variant
 create mode 100644 meta/files/common-licenses/HPND-sell-MIT-disclaimer-xse=
rver
 create mode 100644 meta/files/common-licenses/HPND-sell-regexpr
 create mode 100644 meta/files/common-licenses/HPND-sell-variant-MIT-discla=
imer
 create mode 100644 meta/files/common-licenses/HPND-sell-variant-MIT-discla=
imer-rev
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
 create mode 100644 meta/files/common-licenses/Linux-man-pages-copyleft-2-p=
ara
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
 create mode 100644 meta/files/common-licenses/Mackerras-3-Clause-acknowled=
gment
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
 create mode 100644 meta/files/common-licenses/X11-distribute-modifications=
-variant
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

diff --git a/meta/files/common-licenses/3D-Slicer-1.0 b/meta/files/common-l=
icenses/3D-Slicer-1.0
new file mode 100644
index 00000000000..38bd5230c67
--- /dev/null
+++ b/meta/files/common-licenses/3D-Slicer-1.0
@@ -0,0 +1,190 @@
+3D Slicer Contribution and Software License Agreement ("Agreement")
+Version 1.0 (December 20, 2005)
+
+This Agreement covers contributions to and downloads from the 3D
+Slicer project ("Slicer") maintained by The Brigham and Women's
+Hospital, Inc. ("Brigham"). Part A of this Agreement applies to
+contributions of software and/or data to Slicer (including making
+revisions of or additions to code and/or data already in Slicer). Part
+B of this Agreement applies to downloads of software and/or data from
+Slicer. Part C of this Agreement applies to all transactions with
+Slicer. If you distribute Software (as defined below) downloaded from
+Slicer, all of the paragraphs of Part B of this Agreement must be
+included with and apply to such Software.
+
+Your contribution of software and/or data to Slicer (including prior
+to the date of the first publication of this Agreement, each a
+"Contribution") and/or downloading, copying, modifying, displaying,
+distributing or use of any software and/or data from Slicer
+(collectively, the "Software") constitutes acceptance of all of the
+terms and conditions of this Agreement. If you do not agree to such
+terms and conditions, you have no right to contribute your
+Contribution, or to download, copy, modify, display, distribute or use
+the Software.
+
+PART A. CONTRIBUTION AGREEMENT - License to Brigham with Right to
+Sublicense ("Contribution Agreement").
+
+1. As used in this Contribution Agreement, "you" means the individual
+   contributing the Contribution to Slicer and the institution or
+   entity which employs or is otherwise affiliated with such
+   individual in connection with such Contribution.
+
+2. This Contribution Agreement applies to all Contributions made to
+   Slicer, including without limitation Contributions made prior to
+   the date of first publication of this Agreement. If at any time you
+   make a Contribution to Slicer, you represent that (i) you are
+   legally authorized and entitled to make such Contribution and to
+   grant all licenses granted in this Contribution Agreement with
+   respect to such Contribution; (ii) if your Contribution includes
+   any patient data, all such data is de-identified in accordance with
+   U.S. confidentiality and security laws and requirements, including
+   but not limited to the Health Insurance Portability and
+   Accountability Act (HIPAA) and its regulations, and your disclosure
+   of such data for the purposes contemplated by this Agreement is
+   properly authorized and in compliance with all applicable laws and
+   regulations; and (iii) you have preserved in the Contribution all
+   applicable attributions, copyright notices and licenses for any
+   third party software or data included in the Contribution.
+
+3. Except for the licenses granted in this Agreement, you reserve all
+   right, title and interest in your Contribution.
+
+4. You hereby grant to Brigham, with the right to sublicense, a
+   perpetual, worldwide, non-exclusive, no charge, royalty-free,
+   irrevocable license to use, reproduce, make derivative works of,
+   display and distribute the Contribution. If your Contribution is
+   protected by patent, you hereby grant to Brigham, with the right to
+   sublicense, a perpetual, worldwide, non-exclusive, no-charge,
+   royalty-free, irrevocable license under your interest in patent
+   rights covering the Contribution, to make, have made, use, sell and
+   otherwise transfer your Contribution, alone or in combination with
+   any other code.
+
+5. You acknowledge and agree that Brigham may incorporate your
+   Contribution into Slicer and may make Slicer available to members
+   of the public on an open source basis under terms substantially in
+   accordance with the Software License set forth in Part B of this
+   Agreement. You further acknowledge and agree that Brigham shall
+   have no liability arising in connection with claims resulting from
+   your breach of any of the terms of this Agreement.
+
+6. YOU WARRANT THAT TO THE BEST OF YOUR KNOWLEDGE YOUR CONTRIBUTION
+   DOES NOT CONTAIN ANY CODE THAT REQUIRES OR PRESCRIBES AN "OPEN
+   SOURCE LICENSE" FOR DERIVATIVE WORKS (by way of non-limiting
+   example, the GNU General Public License or other so-called
+   "reciprocal" license that requires any derived work to be licensed
+   under the GNU General Public License or other "open source
+   license").
+
+PART B. DOWNLOADING AGREEMENT - License from Brigham with Right to
+Sublicense ("Software License").
+
+1. As used in this Software License, "you" means the individual
+   downloading and/or using, reproducing, modifying, displaying and/or
+   distributing the Software and the institution or entity which
+   employs or is otherwise affiliated with such individual in
+   connection therewith. The Brigham and Women's Hospital,
+   Inc. ("Brigham") hereby grants you, with right to sublicense, with
+   respect to Brigham's rights in the software, and data, if any,
+   which is the subject of this Software License (collectively, the
+   "Software"), a royalty-free, non-exclusive license to use,
+   reproduce, make derivative works of, display and distribute the
+   Software, provided that:
+
+(a) you accept and adhere to all of the terms and conditions of this
+Software License;
+
+(b) in connection with any copy of or sublicense of all or any portion
+of the Software, all of the terms and conditions in this Software
+License shall appear in and shall apply to such copy and such
+sublicense, including without limitation all source and executable
+forms and on any user documentation, prefaced with the following
+words: "All or portions of this licensed product (such portions are
+the "Software") have been obtained under license from The Brigham and
+Women's Hospital, Inc. and are subject to the following terms and
+conditions:"
+
+(c) you preserve and maintain all applicable attributions, copyright
+notices and licenses included in or applicable to the Software;
+
+(d) modified versions of the Software must be clearly identified and
+marked as such, and must not be misrepresented as being the original
+Software; and
+
+(e) you consider making, but are under no obligation to make, the
+source code of any of your modifications to the Software freely
+available to others on an open source basis.
+
+2. The license granted in this Software License includes without
+   limitation the right to (i) incorporate the Software into
+   proprietary programs (subject to any restrictions applicable to
+   such programs), (ii) add your own copyright statement to your
+   modifications of the Software, and (iii) provide additional or
+   different license terms and conditions in your sublicenses of
+   modifications of the Software; provided that in each case your use,
+   reproduction or distribution of such modifications otherwise
+   complies with the conditions stated in this Software License.
+
+3. This Software License does not grant any rights with respect to
+   third party software, except those rights that Brigham has been
+   authorized by a third party to grant to you, and accordingly you
+   are solely responsible for (i) obtaining any permissions from third
+   parties that you need to use, reproduce, make derivative works of,
+   display and distribute the Software, and (ii) informing your
+   sublicensees, including without limitation your end-users, of their
+   obligations to secure any such required permissions.
+
+4. The Software has been designed for research purposes only and has
+   not been reviewed or approved by the Food and Drug Administration
+   or by any other agency. YOU ACKNOWLEDGE AND AGREE THAT CLINICAL
+   APPLICATIONS ARE NEITHER RECOMMENDED NOR ADVISED. Any
+   commercialization of the Software is at the sole risk of the party
+   or parties engaged in such commercialization. You further agree to
+   use, reproduce, make derivative works of, display and distribute
+   the Software in compliance with all applicable governmental laws,
+   regulations and orders, including without limitation those relating
+   to export and import control.
+
+5. The Software is provided "AS IS" and neither Brigham nor any
+   contributor to the software (each a "Contributor") shall have any
+   obligation to provide maintenance, support, updates, enhancements
+   or modifications thereto. BRIGHAM AND ALL CONTRIBUTORS SPECIFICALLY
+   DISCLAIM ALL EXPRESS AND IMPLIED WARRANTIES OF ANY KIND INCLUDING,
+   BUT NOT LIMITED TO, ANY WARRANTIES OF MERCHANTABILITY, FITNESS FOR
+   A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
+   BRIGHAM OR ANY CONTRIBUTOR BE LIABLE TO ANY PARTY FOR DIRECT,
+   INDIRECT, SPECIAL, INCIDENTAL, EXEMPLARY OR CONSEQUENTIAL DAMAGES
+   HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY ARISING IN ANY WAY
+   RELATED TO THE SOFTWARE, EVEN IF BRIGHAM OR ANY CONTRIBUTOR HAS
+   BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. TO THE MAXIMUM
+   EXTENT NOT PROHIBITED BY LAW OR REGULATION, YOU FURTHER ASSUME ALL
+   LIABILITY FOR YOUR USE, REPRODUCTION, MAKING OF DERIVATIVE WORKS,
+   DISPLAY, LICENSE OR DISTRIBUTION OF THE SOFTWARE AND AGREE TO
+   INDEMNIFY AND HOLD HARMLESS BRIGHAM AND ALL CONTRIBUTORS FROM AND
+   AGAINST ANY AND ALL CLAIMS, SUITS, ACTIONS, DEMANDS AND JUDGMENTS
+   ARISING THEREFROM.
+
+6. None of the names, logos or trademarks of Brigham or any of
+   Brigham's affiliates or any of the Contributors, or any funding
+   agency, may be used to endorse or promote products produced in
+   whole or in part by operation of the Software or derived from or
+   based on the Software without specific prior written permission
+   from the applicable party.
+
+7. Any use, reproduction or distribution of the Software which is not
+   in accordance with this Software License shall automatically revoke
+   all rights granted to you under this Software License and render
+   Paragraphs 1 and 2 of this Software License null and void.
+
+8. This Software License does not grant any rights in or to any
+   intellectual property owned by Brigham or any Contributor except
+   those rights expressly granted hereunder.
+
+PART C. MISCELLANEOUS
+
+This Agreement shall be governed by and construed in accordance with
+the laws of The Commonwealth of Massachusetts without regard to
+principles of conflicts of law. This Agreement shall supercede and
+replace any license terms that you may have agreed to previously with
+respect to Slicer.
diff --git a/meta/files/common-licenses/AMD-newlib b/meta/files/common-lice=
nses/AMD-newlib
new file mode 100644
index 00000000000..1b2f1abd6fd
--- /dev/null
+++ b/meta/files/common-licenses/AMD-newlib
@@ -0,0 +1,11 @@
+Copyright 1989, 1990 Advanced Micro Devices, Inc.
+
+This software is the property of Advanced Micro Devices, Inc  (AMD)  which
+specifically  grants the user the right to modify, use and distribute this
+software provided this notice is not removed or altered.  All other rights
+are reserved by AMD.
+
+AMD MAKES NO WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, WITH REGARD TO THIS
+SOFTWARE.  IN NO EVENT SHALL AMD BE LIABLE FOR INCIDENTAL OR CONSEQUENTIAL
+DAMAGES IN CONNECTION WITH OR ARISING FROM THE FURNISHING, PERFORMANCE, OR
+USE OF THIS SOFTWARE.
diff --git a/meta/files/common-licenses/AML-glslang b/meta/files/common-lic=
enses/AML-glslang
new file mode 100644
index 00000000000..2a24aeac224
--- /dev/null
+++ b/meta/files/common-licenses/AML-glslang
@@ -0,0 +1,41 @@
+Copyright (c) 2002, NVIDIA Corporation.
+
+NVIDIA Corporation("NVIDIA") supplies this software to you in
+consideration of your agreement to the following terms, and your use,
+installation, modification or redistribution of this NVIDIA software
+constitutes acceptance of these terms.  If you do not agree with these
+terms, please do not use, install, modify or redistribute this NVIDIA
+software.
+
+In consideration of your agreement to abide by the following terms, and
+subject to these terms, NVIDIA grants you a personal, non-exclusive
+license, under NVIDIA's copyrights in this original NVIDIA software (the
+"NVIDIA Software"), to use, reproduce, modify and redistribute the
+NVIDIA Software, with or without modifications, in source and/or binary
+forms; provided that if you redistribute the NVIDIA Software, you must
+retain the copyright notice of NVIDIA, this notice and the following
+text and disclaimers in all such redistributions of the NVIDIA Software.
+Neither the name, trademarks, service marks nor logos of NVIDIA
+Corporation may be used to endorse or promote products derived from the
+NVIDIA Software without specific prior written permission from NVIDIA.
+Except as expressly stated in this notice, no other rights or licenses
+express or implied, are granted by NVIDIA herein, including but not
+limited to any patent rights that may be infringed by your derivative
+works or by other works in which the NVIDIA Software may be
+incorporated. No hardware is licensed hereunder.
+
+THE NVIDIA SOFTWARE IS BEING PROVIDED ON AN "AS IS" BASIS, WITHOUT
+WARRANTIES OR CONDITIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED,
+INCLUDING WITHOUT LIMITATION, WARRANTIES OR CONDITIONS OF TITLE,
+NON-INFRINGEMENT, MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR
+ITS USE AND OPERATION EITHER ALONE OR IN COMBINATION WITH OTHER
+PRODUCTS.
+
+IN NO EVENT SHALL NVIDIA BE LIABLE FOR ANY SPECIAL, INDIRECT,
+INCIDENTAL, EXEMPLARY, CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
+TO, LOST PROFITS; PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
+USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) OR ARISING IN ANY WAY
+OUT OF THE USE, REPRODUCTION, MODIFICATION AND/OR DISTRIBUTION OF THE
+NVIDIA SOFTWARE, HOWEVER CAUSED AND WHETHER UNDER THEORY OF CONTRACT,
+TORT (INCLUDING NEGLIGENCE), STRICT LIABILITY OR OTHERWISE, EVEN IF
+NVIDIA HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/ASWF-Digital-Assets-1.0 b/meta/file=
s/common-licenses/ASWF-Digital-Assets-1.0
new file mode 100644
index 00000000000..27e45b19c99
--- /dev/null
+++ b/meta/files/common-licenses/ASWF-Digital-Assets-1.0
@@ -0,0 +1,17 @@
+ASWF Digital Assets License v1.0
+
+License for <Asset Name> (the "Asset Name").
+
+<Asset Name> Copyright <Year> <Asset Owner>. All rights reserved.
+
+Redistribution and use of these digital assets, with or without modificati=
on, solely for education, training, research, software and hardware develop=
ment, performance benchmarking (including publication of benchmark results =
and permitting reproducibility of the benchmark results by third parties), =
or software and hardware product demonstrations, are permitted provided tha=
t the following conditions are met:
+
+1. Redistributions of these digital assets or any part of them must includ=
e the above copyright notice, this list of conditions and the disclaimer be=
low.
+
+2. Publications showing images derived from these digital assets must incl=
ude the above copyright notice.
+
+3. The names of copyright holder or the names of its contributors may NOT =
be used to promote or to imply endorsement, sponsorship, or affiliation wit=
h products developed or tested utilizing these digital assets or benchmarki=
ng results obtained from these digital assets, without prior written permis=
sion from copyright holder.
+
+4. The assets and their output may only be referred to as the Asset Name l=
isted above, and your use of the Asset Name shall be solely to identify the=
 digital assets. Other than as expressly permitted by this License, you may=
 NOT use any trade names, trademarks, service marks, or product names of th=
e copyright holder for any purpose.
+
+DISCLAIMER: THESE DIGITAL ASSETS ARE PROVIDED BY THE COPYRIGHT HOLDER "AS =
IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, T=
HE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPO=
SE, ARE DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDER BE LIABLE FOR ANY DI=
RECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (I=
NCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; =
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND=
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT=
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF T=
HESE DIGITAL ASSETS, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/ASWF-Digital-Assets-1.1 b/meta/file=
s/common-licenses/ASWF-Digital-Assets-1.1
new file mode 100644
index 00000000000..566604a100f
--- /dev/null
+++ b/meta/files/common-licenses/ASWF-Digital-Assets-1.1
@@ -0,0 +1,17 @@
+ASWF Digital Assets License v1.1
+
+License for <Asset Name> (the "Asset Name").
+
+<Asset Name> Copyright <Year> <Asset Owner>. All rights reserved.
+
+Redistribution and use of these digital assets, with or without modificati=
on, solely for education, training, research, software and hardware develop=
ment, performance benchmarking (including publication of benchmark results =
and permitting reproducibility of the benchmark results by third parties), =
or software and hardware product demonstrations, are permitted provided tha=
t the following conditions are met:
+
+1. Redistributions of these digital assets or any part of them must includ=
e the above copyright notice, this list of conditions and the disclaimer be=
low, and if applicable, a description of how the redistributed versions of =
the digital assets differ from the originals.
+
+2. Publications showing images derived from these digital assets must incl=
ude the above copyright notice.
+
+3. The names of copyright holder or the names of its contributors may NOT =
be used to promote or to imply endorsement, sponsorship, or affiliation wit=
h products developed or tested utilizing these digital assets or benchmarki=
ng results obtained from these digital assets, without prior written permis=
sion from copyright holder.
+
+4. The assets and their output may only be referred to as the Asset Name l=
isted above, and your use of the Asset Name shall be solely to identify the=
 digital assets. Other than as expressly permitted by this License, you may=
 NOT use any trade names, trademarks, service marks, or product names of th=
e copyright holder for any purpose.
+
+DISCLAIMER: THESE DIGITAL ASSETS ARE PROVIDED BY THE COPYRIGHT HOLDER "AS =
IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, T=
HE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPO=
SE, ARE DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDER BE LIABLE FOR ANY DI=
RECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (I=
NCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; =
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND=
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT=
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF T=
HESE DIGITAL ASSETS, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/AdaCore-doc b/meta/files/common-lic=
enses/AdaCore-doc
new file mode 100644
index 00000000000..0a1dab1b2c3
--- /dev/null
+++ b/meta/files/common-licenses/AdaCore-doc
@@ -0,0 +1 @@
+This document may be copied, in whole or in part, in any form or by any me=
ans, as is or with alterations, provided that (1) alterations are clearly m=
arked as alterations and (2) this copyright notice is included unmodified i=
n any copy.
diff --git a/meta/files/common-licenses/Adobe-Display-PostScript b/meta/fil=
es/common-licenses/Adobe-Display-PostScript
new file mode 100644
index 00000000000..6df57d3c80e
--- /dev/null
+++ b/meta/files/common-licenses/Adobe-Display-PostScript
@@ -0,0 +1,30 @@
+(c)Copyright 1988,1991 Adobe Systems Incorporated.
+All rights reserved.
+
+Permission to use, copy, modify, distribute, and sublicense this software =
and its
+documentation for any purpose and without fee is hereby granted, provided =
that
+the above copyright notices appear in all copies and that both those copyr=
ight
+notices and this permission notice appear in supporting documentation and =
that
+the name of Adobe Systems Incorporated not be used in advertising or publi=
city
+pertaining to distribution of the software without specific, written prior
+permission.  No trademark license to use the Adobe trademarks is hereby
+granted.  If the Adobe trademark "Display PostScript"(tm) is used to descr=
ibe
+this software, its functionality or for any other purpose, such use shall =
be
+limited to a statement that this software works in conjunction with the Di=
splay
+PostScript system.  Proper trademark attribution to reflect Adobe's owners=
hip
+of the trademark shall be given whenever any such reference to the Display
+PostScript system is made.
+
+ADOBE MAKES NO REPRESENTATIONS ABOUT THE SUITABILITY OF THE SOFTWARE FOR A=
NY
+PURPOSE.  IT IS PROVIDED "AS IS" WITHOUT EXPRESS OR IMPLIED WARRANTY.  ADO=
BE
+DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLI=
ED
+WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-
+INFRINGEMENT OF THIRD PARTY RIGHTS.  IN NO EVENT SHALL ADOBE BE LIABLE TO =
YOU
+OR ANY OTHER PARTY FOR ANY SPECIAL, INDIRECT, OR CONSEQUENTIAL DAMAGES OR =
ANY
+DAMAGES WHATSOEVER WHETHER IN AN ACTION OF CONTRACT,NEGLIGENCE, STRICT
+LIABILITY OR ANY OTHER ACTION ARISING OUT OF OR IN CONNECTION WITH THE USE=
 OR
+PERFORMANCE OF THIS SOFTWARE.  ADOBE WILL NOT PROVIDE ANY TRAINING OR OTHER
+SUPPORT FOR THE SOFTWARE.
+
+Adobe, PostScript, and Display PostScript are trademarks of Adobe Systems
+Incorporated which may be registered in certain jurisdictions.
diff --git a/meta/files/common-licenses/Adobe-Utopia b/meta/files/common-li=
censes/Adobe-Utopia
new file mode 100644
index 00000000000..4aa04503b54
--- /dev/null
+++ b/meta/files/common-licenses/Adobe-Utopia
@@ -0,0 +1,12 @@
+Permission to use, reproduce, display and distribute the listed typefaces
+is hereby granted, provided that the Adobe Copyright notice appears in all
+whole and partial copies of the software and that the following trademark
+symbol and attribution appear in all unmodified copies of the software:
+
+The Adobe typefaces (Type 1 font program, bitmaps and Adobe Font Metric
+files) donated are:
+
+        Utopia Regular
+        Utopia Italic
+        Utopia Bold
+        Utopia Bold Italic
diff --git a/meta/files/common-licenses/App-s2p b/meta/files/common-license=
s/App-s2p
new file mode 100644
index 00000000000..b19eabf068f
--- /dev/null
+++ b/meta/files/common-licenses/App-s2p
@@ -0,0 +1,5 @@
+COPYRIGHT and LICENSE
+
+This program is free and open software. You may use, modify,
+distribute, and sell this program (and any modified variants) in any
+way you wish, provided you do not restrict others from doing the same.
diff --git a/meta/files/common-licenses/Arphic-1999 b/meta/files/common-lic=
enses/Arphic-1999
new file mode 100644
index 00000000000..c1aba41d3f5
--- /dev/null
+++ b/meta/files/common-licenses/Arphic-1999
@@ -0,0 +1,58 @@
+ARPHIC PUBLIC LICENSE
+
+Copyright (C) 1999 Arphic Technology Co., Ltd.
+11Fl. No.168, Yung Chi Rd., Taipei, 110 Taiwan
+All rights reserved except as specified below.
+
+Everyone is permitted to copy and distribute verbatim copies of this licen=
se document, but changing it is forbidden.
+
+Preamble
+
+   The licenses for most software are designed to take away your freedom t=
o share and change it. By contrast, the ARPHIC PUBLIC LICENSE specifically =
permits and encourages you to use this software, provided that you give the=
 recipients all the rights that we gave you and make sure they can get the =
modifications of this software.
+
+Legal Terms
+
+0. Definitions:
+   Throughout this License, "Font" means the TrueType fonts "AR PL Mingti2=
L Big5", "AR PL KaitiM Big5" (BIG-5 character set) and "AR PL SungtiL GB", =
"AR PL KaitiM GB" (GB character set) which are originally distributed by Ar=
phic, and the derivatives of those fonts created through any modification i=
ncluding modifying glyph, reordering glyph, converting format, changing fon=
t name, or adding/deleting some characters in/from glyph table.
+
+   "PL" means "Public License".
+
+   "Copyright Holder" means whoever is named in the copyright or copyright=
s for the Font.
+
+   "You" means the licensee, or person copying, redistributing or modifyin=
g the Font.
+
+   "Freely Available" means that you have the freedom to copy or modify th=
e Font as well as redistribute copies of the Font under the same conditions=
 you received, not price. If you wish, you can charge for this service.
+
+1. Copying & Distribution
+   You may copy and distribute verbatim copies of this Font in any medium,=
 without restriction, provided that you retain this license file (ARPHICPL.=
TXT) unaltered in all copies.
+
+2. Modification
+   You may otherwise modify your copy of this Font in any way, including m=
odifying glyph, reordering glyph, converting format, changing font name, or=
 adding/deleting some characters in/from glyph table, and copy and distribu=
te such modifications under the terms of Section 1 above, provided that the=
 following conditions are met:
+
+   a) You must insert a prominent notice in each modified file stating how=
 and when you changed that file.
+
+   b) You must make such modifications Freely Available as a whole to all =
third parties under the terms of this License, such as by offering access t=
o copy the modifications from a designated place, or distributing the modif=
ications on a medium customarily used for software interchange.
+
+   c) If the modified fonts normally reads commands interactively when run=
, you must cause it, when started running for such interactive use in the m=
ost ordinary way, to print or display an announcement including an appropri=
ate copyright notice and a notice that there is no warranty (or else, sayin=
g that you provide a warranty) and that users may redistribute the Font und=
er these conditions, and telling the user how to view a copy of this Licens=
e.
+
+   These requirements apply to the modified work as a whole. If identifiab=
le sections of that work are not derived from the Font, and can be reasonab=
ly considered independent and separate works in themselves, then this Licen=
se and its terms, do not apply to those sections when you distribute them a=
s separate works. Therefore, mere aggregation of another work not based on =
the Font with the Font on a volume of a storage or distribution medium does=
 not bring the other work under the scope of this License.
+
+3. Condition Subsequent
+   You may not copy, modify, sublicense, or distribute the Font except as =
expressly provided under this License. Any attempt otherwise to copy, modif=
y, sublicense or distribute the Font will automatically retroactively void =
your rights under this License. However, parties who have received copies o=
r rights from you under this License will keep their licenses valid so long=
 as such parties remain in full compliance.
+
+4. Acceptance
+   You are not required to accept this License, since you have not signed =
it. However, nothing else grants you permission to copy, modify, sublicense=
 or distribute the Font. These actions are prohibited by law if you do not =
accept this License. Therefore, by copying, modifying, sublicensing or dist=
ributing the Font, you indicate your acceptance of this License and all its=
 terms and conditions.
+
+5. Automatic Receipt
+   Each time you redistribute the Font, the recipient automatically receiv=
es a license from the original licensor to copy, distribute or modify the F=
ont subject to these terms and conditions. You may not impose any further r=
estrictions on the recipients' exercise of the rights granted herein. You a=
re not responsible for enforcing compliance by third parties to this Licens=
e.=20
+
+6. Contradiction
+   If, as a consequence of a court judgment or allegation of patent infrin=
gement or for any other reason (not limited to patent issues), conditions a=
re imposed on you (whether by court order, agreement or otherwise) that con=
tradict the conditions of this License, they do not excuse you from the con=
ditions of this License. If you cannot distribute so as to satisfy simultan=
eously your obligations under this License and any other pertinent obligati=
ons, then as a consequence you may not distribute the Font at all. For exam=
ple, if a patent license would not permit royalty-free redistribution of th=
e Font by all those who receive copies directly or indirectly through you, =
then the only way you could satisfy both it and this License would be to re=
frain entirely from distribution of the Font.
+
+   If any portion of this section is held invalid or unenforceable under a=
ny particular circumstance, the balance of the section is intended to apply=
 and the section as a whole is intended to apply in other circumstances.=20
+
+7. NO WARRANTY
+   BECAUSE THE FONT IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR T=
HE FONT, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE S=
TATED IN WRITING THE COPYRIGHT HOLDERS OR OTHER PARTIES PROVIDE THE FONT "A=
S IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING =
BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FO=
R A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE O=
F THE FONT IS WITH YOU. SHOULD THE FONT PROVE DEFECTIVE, YOU ASSUME THE COS=
T OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION.
+
+8. DAMAGES WAIVER
+   UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING, IN NO EVENT =
WILL ANY COPYRIGHTT HOLDERS, OR OTHER PARTIES WHO MAY COPY, MODIFY OR REDIS=
TRIBUTE THE FONT AS PERMITTED ABOVE, BE LIABLE TO YOU FOR ANY DIRECT, INDIR=
ECT, CONSEQUENTIAL, INCIDENTAL, SPECIAL OR EXEMPLARY DAMAGES ARISING OUT OF=
 THE USE OR INABILITY TO USE THE FONT (INCLUDING BUT NOT LIMITED TO PROCURE=
MENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA OR PROFITS; OR BUSI=
NESS INTERRUPTION), EVEN IF SUCH HOLDERS OR OTHER PARTIES HAVE BEEN ADVISED=
 OF THE POSSIBILITY OF SUCH DAMAGES.
diff --git a/meta/files/common-licenses/BSD-2-Clause-Darwin b/meta/files/co=
mmon-licenses/BSD-2-Clause-Darwin
new file mode 100644
index 00000000000..d582399763d
--- /dev/null
+++ b/meta/files/common-licenses/BSD-2-Clause-Darwin
@@ -0,0 +1,28 @@
+Copyright (c) Ian F. Darwin 1986, 1987, 1989, 1990, 1991, 1992, 1994, 1995.
+Software written by Ian F. Darwin and others;
+maintained 1994- Christos Zoulas.
+
+This software is not subject to any export provision of the United States
+Department of Commerce, and may be exported to any country or planet.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions
+are met:
+1. Redistributions of source code must retain the above copyright
+   notice immediately at the beginning of the file, without modification,
+   this list of conditions, and the following disclaimer.
+2. Redistributions in binary form must reproduce the above copyright
+   notice, this list of conditions and the following disclaimer in the
+   documentation and/or other materials provided with the distribution.
+
+THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
+ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR
+ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+SUCH DAMAGE.
diff --git a/meta/files/common-licenses/BSD-2-Clause-first-lines b/meta/fil=
es/common-licenses/BSD-2-Clause-first-lines
new file mode 100644
index 00000000000..d293da27830
--- /dev/null
+++ b/meta/files/common-licenses/BSD-2-Clause-first-lines
@@ -0,0 +1,28 @@
+Copyright (C) 2006,2007,2009 NTT (Nippon Telegraph and Telephone
+Corporation).  All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions
+are met:
+
+1. Redistributions of source code must retain the above
+   copyright notice, this list of conditions and the following
+   disclaimer as the first lines of this file unmodified.
+
+2. Redistributions in binary form must reproduce the above
+   copyright notice, this list of conditions and the following
+   disclaimer in the documentation and/or other materials provided
+   with the distribution.
+
+THIS SOFTWARE IS PROVIDED BY NTT "AS IS" AND ANY EXPRESS OR IMPLIED
+WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
+OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+DISCLAIMED. IN NO EVENT SHALL NTT BE LIABLE FOR ANY DIRECT,
+INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
+SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
+STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
+OF THE POSSIBILITY OF SUCH DAMAGE.
+
diff --git a/meta/files/common-licenses/BSD-3-Clause-HP b/meta/files/common=
-licenses/BSD-3-Clause-HP
new file mode 100644
index 00000000000..e16195729ad
--- /dev/null
+++ b/meta/files/common-licenses/BSD-3-Clause-HP
@@ -0,0 +1,23 @@
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions
+are met:
+1. Redistributions of source code must retain the above copyright
+   notice, this list of conditions and the following disclaimer.
+2. Redistributions in binary form must reproduce the above copyright
+   notice, this list of conditions and the following disclaimer in the
+   documentation and/or other materials provided with the distribution.
+3. Neither the name of the HP nor the names of its
+   contributors may be used to endorse or promote products derived
+   from this software without specific prior written permission.
+
+THIS SOFTWARE IS PROVIDED BY THE AUTHOR "AS IS" AND ANY EXPRESS OR
+IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
+OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
+IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
+NOT LIMITED TO, PATENT INFRINGEMENT; PROCUREMENT OF SUBSTITUTE GOODS OR
+SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
+STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
+IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/BSD-3-Clause-Sun b/meta/files/commo=
n-licenses/BSD-3-Clause-Sun
new file mode 100644
index 00000000000..1d86449d90a
--- /dev/null
+++ b/meta/files/common-licenses/BSD-3-Clause-Sun
@@ -0,0 +1,29 @@
+Copyright (c) 2001-2013 Oracle and/or its affiliates. All rights reserved.
+
+Redistribution and  use in  source and binary  forms, with  or without
+modification, are permitted provided that the following conditions are
+met:
+
+- Redistributions  of  source code  must  retain  the above  copyright
+  notice, this list of conditions and the following disclaimer.
+
+- Redistribution  in binary  form must  reproduct the  above copyright
+  notice, this list of conditions  and the following disclaimer in the
+  documentation and/or other materials provided with the distribution.
+
+Neither  the  name   of  Sun  Microsystems,  Inc.  or   the  names  of
+contributors may be  used to endorse or promote  products derived from
+this software without specific prior written permission.
+
+This software is provided "AS IS," without a warranty of any kind. ALL
+EXPRESS  OR   IMPLIED  CONDITIONS,  REPRESENTATIONS   AND  WARRANTIES,
+INCLUDING  ANY  IMPLIED WARRANTY  OF  MERCHANTABILITY,  FITNESS FOR  A
+PARTICULAR PURPOSE  OR NON-INFRINGEMENT, ARE HEREBY  EXCLUDED. SUN AND
+ITS  LICENSORS SHALL  NOT BE  LIABLE  FOR ANY  DAMAGES OR  LIABILITIES
+SUFFERED BY LICENSEE  AS A RESULT OF OR  RELATING TO USE, MODIFICATION
+OR DISTRIBUTION OF  THE SOFTWARE OR ITS DERIVATIVES.  IN NO EVENT WILL
+SUN OR ITS  LICENSORS BE LIABLE FOR ANY LOST  REVENUE, PROFIT OR DATA,
+OR  FOR  DIRECT,   INDIRECT,  SPECIAL,  CONSEQUENTIAL,  INCIDENTAL  OR
+PUNITIVE  DAMAGES, HOWEVER  CAUSED  AND REGARDLESS  OF  THE THEORY  OF
+LIABILITY, ARISING  OUT OF  THE USE OF  OR INABILITY TO  USE SOFTWARE,
+EVEN IF SUN HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
diff --git a/meta/files/common-licenses/BSD-3-Clause-acpica b/meta/files/co=
mmon-licenses/BSD-3-Clause-acpica
new file mode 100644
index 00000000000..9fb56c585a8
--- /dev/null
+++ b/meta/files/common-licenses/BSD-3-Clause-acpica
@@ -0,0 +1,26 @@
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions
+are met:
+1. Redistributions of source code must retain the above copyright
+   notice, this list of conditions, and the following disclaimer,
+   without modification.
+2. Redistributions in binary form must reproduce at minimum a disclaimer
+   substantially similar to the "NO WARRANTY" disclaimer below
+   ("Disclaimer") and any redistribution must be conditioned upon
+   including a substantially similar Disclaimer requirement for further
+   binary redistribution.
+3. Neither the names of the above-listed copyright holders nor the names
+   of any contributors may be used to endorse or promote products derived
+   from this software without specific prior written permission.
+
+THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/BSD-3-Clause-flex b/meta/files/comm=
on-licenses/BSD-3-Clause-flex
new file mode 100644
index 00000000000..684b011026d
--- /dev/null
+++ b/meta/files/common-licenses/BSD-3-Clause-flex
@@ -0,0 +1,42 @@
+Flex carries the copyright used for BSD software, slightly modified
+because it originated at the Lawrence Berkeley (not Livermore!) Laboratory,
+which operates under a contract with the Department of Energy:
+
+Copyright (c) 2001, 2002, 2003, 2004, 2005, 2006, 2007 The Flex Project.
+
+Copyright (c) 1990, 1997 The Regents of the University of California.
+All rights reserved.
+
+This code is derived from software contributed to Berkeley by
+Vern Paxson.
+
+The United States Government has rights in this work pursuant
+to contract no. DE-AC03-76SF00098 between the United States
+Department of Energy and the University of California.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions
+are met:
+
+1. Redistributions of source code must retain the above copyright
+   notice, this list of conditions and the following disclaimer.
+2. Redistributions in binary form must reproduce the above copyright
+   notice, this list of conditions and the following disclaimer in the
+   documentation and/or other materials provided with the distribution.
+
+Neither the name of the University nor the names of its contributors
+may be used to endorse or promote products derived from this software
+without specific prior written permission.
+
+THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
+IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
+WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+PURPOSE.
+
+This basically says "do whatever you please with this software except
+remove this notice or take advantage of the University's (or the flex
+authors') name".
+
+Note that the "flex.skl" scanner skeleton carries no copyright notice.
+You are free to do whatever you please with scanners generated using flex;
+for them, you are not even bound by the above copyright.
diff --git a/meta/files/common-licenses/BSD-4.3RENO b/meta/files/common-lic=
enses/BSD-4.3RENO
new file mode 100644
index 00000000000..c05b03cc0f6
--- /dev/null
+++ b/meta/files/common-licenses/BSD-4.3RENO
@@ -0,0 +1,9 @@
+Copyright (c) 1987 Regents of the University of California.
+All rights reserved.
+
+Redistribution and use in source and binary forms are permitted
+provided that this notice is preserved and that due credit is given
+to the University of California at Berkeley. The name of the University
+may not be used to endorse or promote products derived from this
+software without specific written prior permission. This software
+is provided ``as is'' without express or implied warranty.
diff --git a/meta/files/common-licenses/BSD-4.3TAHOE b/meta/files/common-li=
censes/BSD-4.3TAHOE
new file mode 100644
index 00000000000..413098d93c0
--- /dev/null
+++ b/meta/files/common-licenses/BSD-4.3TAHOE
@@ -0,0 +1,11 @@
+Copyright (c) 1987 Regents of the University of California. All rights res=
erved.=20
+
+Redistribution and use in source and binary forms are permitted provided=20
+that the above copyright notice and this paragraph are duplicated in all=20
+such forms and that any documentation, advertising materials, and other=20
+materials related to such distribution and use acknowledge that the softwa=
re=20
+was developed by the University of California, Berkeley. The name of the=20
+University may not be used to endorse or promote products derived from thi=
s=20
+software without specific prior written permission. THIS SOFTWARE IS PROVI=
DED=20
+``AS IS'' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOU=
T=20
+LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PA=
RTICULAR PURPOSE.
diff --git a/meta/files/common-licenses/BSD-Advertising-Acknowledgement b/m=
eta/files/common-licenses/BSD-Advertising-Acknowledgement
new file mode 100644
index 00000000000..cedb72e6774
--- /dev/null
+++ b/meta/files/common-licenses/BSD-Advertising-Acknowledgement
@@ -0,0 +1,37 @@
+Copyright (c) 2001 David Giffin.
+All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions
+are met:
+
+1. Redistributions of source code must retain the above copyright
+notice, this list of conditions and the following disclaimer.
+
+2. Redistributions in binary form must reproduce the above copyright
+notice, this list of conditions and the following disclaimer in
+the documentation and/or other materials provided with the
+distribution.
+
+3. All advertising materials mentioning features or use of this
+software must display the following acknowledgment:
+"This product includes software developed by
+David Giffin <david@giffin.org>."
+
+4. Redistributions of any form whatsoever must retain the following
+acknowledgment:
+"This product includes software developed by
+David Giffin <david@giffin.org>."
+
+THIS SOFTWARE IS PROVIDED BY DAVID GIFFIN ``AS IS'' AND ANY
+EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL DAVID GIFFIN OR
+ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
+NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
+STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
+OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/BSD-Attribution-HPND-disclaimer b/m=
eta/files/common-licenses/BSD-Attribution-HPND-disclaimer
new file mode 100644
index 00000000000..1272e1fe26a
--- /dev/null
+++ b/meta/files/common-licenses/BSD-Attribution-HPND-disclaimer
@@ -0,0 +1,37 @@
+Copyright (c) 1998-2003 Carnegie Mellon University.  All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions
+are met:
+
+1. Redistributions of source code must retain the above copyright
+   notice, this list of conditions and the following disclaimer.
+
+2. Redistributions in binary form must reproduce the above copyright
+   notice, this list of conditions and the following disclaimer in
+   the documentation and/or other materials provided with the
+   distribution.
+
+3. The name "Carnegie Mellon University" must not be used to
+   endorse or promote products derived from this software without
+   prior written permission. For permission or any other legal
+   details, please contact
+     Office of Technology Transfer
+     Carnegie Mellon University
+     5000 Forbes Avenue
+     Pittsburgh, PA  15213-3890
+     (412) 268-4387, fax: (412) 268-7395
+     tech-transfer@andrew.cmu.edu
+
+4. Redistributions of any form whatsoever must retain the following
+   acknowledgment:
+   "This product includes software developed by Computing Services
+    at Carnegie Mellon University (http://www.cmu.edu/computing/)."
+
+CARNEGIE MELLON UNIVERSITY DISCLAIMS ALL WARRANTIES WITH REGARD TO
+THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
+AND FITNESS, IN NO EVENT SHALL CARNEGIE MELLON UNIVERSITY BE LIABLE
+FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
+AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
+OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
diff --git a/meta/files/common-licenses/BSD-Inferno-Nettverk b/meta/files/c=
ommon-licenses/BSD-Inferno-Nettverk
new file mode 100644
index 00000000000..4821a550a0e
--- /dev/null
+++ b/meta/files/common-licenses/BSD-Inferno-Nettverk
@@ -0,0 +1,42 @@
+  Copyright (c) 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006,
+                2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016
+                2017, 2018, 2019, 2020
+       Inferno Nettverk A/S, Norway.  All rights reserved.
+=20
+  Redistribution and use in source and binary forms, with or without
+  modification, are permitted provided that the following conditions
+  are met:
+  1. The above copyright notice, this list of conditions and the following
+     disclaimer must appear in all copies of the software, derivative works
+     or modified versions, and any portions thereof, aswell as in all
+     supporting documentation.
+  2. All advertising materials mentioning features or use of this software
+     must display the following acknowledgement:
+       This product includes software developed by
+       Inferno Nettverk A/S, Norway.
+  3. The name of the author may not be used to endorse or promote products
+     derived from this software without specific prior written permission.
+=20
+  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
+  IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
+  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
+  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
+  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
+  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
+  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+=20
+  Inferno Nettverk A/S requests users of this software to return to
+=20
+   Software Distribution Coordinator  or  sdc@inet.no
+   Inferno Nettverk A/S
+   Oslo Research Park
+   Gaustadall=C3=A9en 21
+   NO-0349 Oslo
+   Norway
+=20
+  any improvements or extensions that they make and grant Inferno Nettverk=
 A/S
+  the rights to redistribute these changes.
+
diff --git a/meta/files/common-licenses/BSD-Source-beginning-file b/meta/fi=
les/common-licenses/BSD-Source-beginning-file
new file mode 100644
index 00000000000..6265f97608d
--- /dev/null
+++ b/meta/files/common-licenses/BSD-Source-beginning-file
@@ -0,0 +1,23 @@
+Copyright (c) 1997 Justin T. Gibbs.
+All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions
+are met:
+1. Redistributions of source code must retain the above copyright
+   notice, this list of conditions, and the following disclaimer,
+   without modification, immediately at the beginning of the file.
+2. The name of the author may not be used to endorse or promote products
+   derived from this software without specific prior written permission.
+
+THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
+ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR
+ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+SUCH DAMAGE.
diff --git a/meta/files/common-licenses/BSD-Systemics b/meta/files/common-l=
icenses/BSD-Systemics
new file mode 100644
index 00000000000..6ca8a26c330
--- /dev/null
+++ b/meta/files/common-licenses/BSD-Systemics
@@ -0,0 +1,39 @@
+Copyright (C) 1995, 1996 Systemics Ltd (http://www.systemics.com/)
+All rights reserved.
+=20
+This library and applications are FREE FOR COMMERCIAL AND NON-COMMERCIAL U=
SE
+as long as the following conditions are adhered to.
+=20
+Copyright remains with Systemics Ltd, and as such any Copyright notices
+in the code are not to be removed.  If this code is used in a product,
+Systemics should be given attribution as the author of the parts used.
+This can be in the form of a textual message at program startup or
+in documentation (online or textual) provided with the package.
+=20
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions
+are met:
+1. Redistributions of source code must retain the copyright
+   notice, this list of conditions and the following disclaimer.
+2. Redistributions in binary form must reproduce the above copyright
+   notice, this list of conditions and the following disclaimer in the
+   documentation and/or other materials provided with the distribution.
+3. All advertising materials mentioning features or use of this software
+   must display the following acknowledgement:
+   This product includes software developed by Systemics Ltd (http://www.s=
ystemics.com/)=20=20=20
+=20
+THIS SOFTWARE IS PROVIDED BY SYSTEMICS LTD ``AS IS'' AND
+ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
+FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
+LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+SUCH DAMAGE.
+=20
+The licence and distribution terms for any publically available version or
+derivative of this code cannot be changed.  i.e. this code cannot simply be
+copied and put under another distribution licence [including the GNU Publi=
c Licence.]
diff --git a/meta/files/common-licenses/BSD-Systemics-W3Works b/meta/files/=
common-licenses/BSD-Systemics-W3Works
new file mode 100644
index 00000000000..73428e86cab
--- /dev/null
+++ b/meta/files/common-licenses/BSD-Systemics-W3Works
@@ -0,0 +1,62 @@
+Copyright (C) 1995, 1996 Systemics Ltd (http://www.systemics.com/)
+=20
+Modifications and Current Implimentation Copyright (C) 2000 W3Works, LLC.
+=20
+All rights reserved.
+=20
+Current implimentation contains modifications made by W3Works, LLC.  The=20
+modifications remain copyright of W3Works, LLC and attribution for these=20
+modification should be made to W3Works, LLC.  These modifications and=20
+this copyright must remain with this package.
+=20
+Additions to the Restrictions set out below are:
+1. All advertising materials mentioning features or use of this software
+   must display the following acknowledgement:
+   This product inculdes software developed by W3Works, LLC (http://www.w3=
works.com)
+=20
+   NO ADDITIONAL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITE=
D TO,
+   THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR =
PURPOSE
+   ARE EXTENDED BY THIS DISTRIBUTION.
+=20
+   Any subsequent derrivations of this package must retainl this copyright.
+=20
+=20
+Original Copyright Below
+=20
+This library and applications are FREE FOR COMMERCIAL AND NON-COMMERCIAL U=
SE
+as long as the following conditions are adhered to.
+=20
+Copyright remains with Systemics Ltd, and as such any Copyright notices
+in the code are not to be removed.  If this code is used in a product,
+Systemics should be given attribution as the author of the parts used.
+This can be in the form of a textual message at program startup or
+in documentation (online or textual) provided with the package.
+=20
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions
+are met:
+1. Redistributions of source code must retain the copyright
+   notice, this list of conditions and the following disclaimer.
+2. Redistributions in binary form must reproduce the above copyright
+   notice, this list of conditions and the following disclaimer in the
+   documentation and/or other materials provided with the distribution.
+3. All advertising materials mentioning features or use of this software
+   must display the following acknowledgement:
+   This product includes software developed by Systemics Ltd (http://www.s=
ystemics.com/)=20=20=20
+=20
+   THIS SOFTWARE IS PROVIDED BY SYSTEMICS LTD ``AS IS'' AND
+   ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURP=
OSE
+   ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
+   FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENT=
IAL
+   DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+   OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+   HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STR=
ICT
+   LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY W=
AY
+   OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+   SUCH DAMAGE.
+=20
+   The licence and distribution terms for any publically available version=
 or
+   derivative of this code cannot be changed.  i.e. this code cannot simpl=
y be
+   copied and put under another distribution licence
+   [including the GNU Public Licence.]
diff --git a/meta/files/common-licenses/Baekmuk b/meta/files/common-license=
s/Baekmuk
new file mode 100644
index 00000000000..b86efc04a08
--- /dev/null
+++ b/meta/files/common-licenses/Baekmuk
@@ -0,0 +1,9 @@
+Copyright (c) 1986-2002 Kim Jeong-Hwan All rights reserved.
+=20=20=20=20=20=20=20=20=20
+Permission to use, copy, modify and distribute this font
+is hereby granted, provided that both the copyright notice
+and this permission notice appear in all copies of the
+font, derivative works or modified versions, and that the
+following acknowledgement appear in supporting documentation:
+Baekmuk Batang, Baekmuk Dotum, Baekmuk Gulim, and Baekmuk
+Headline are registered trademarks owned by Kim Jeong-Hwan.
diff --git a/meta/files/common-licenses/Bitstream-Charter b/meta/files/comm=
on-licenses/Bitstream-Charter
new file mode 100644
index 00000000000..7a0cf97a0c9
--- /dev/null
+++ b/meta/files/common-licenses/Bitstream-Charter
@@ -0,0 +1,9 @@
+(c) Copyright 1989-1992, Bitstream Inc., Cambridge, MA.=20
+
+You are hereby granted permission under all Bitstream propriety rights=20
+to use, copy, modify, sublicense, sell, and redistribute the 4 Bitstream=20
+Charter (r) Type 1 outline fonts and the 4 Courier Type 1 outline fonts fo=
r=20
+any purpose and without restriction; provided, that this notice is left=20
+intact on all copies of such fonts and that Bitstream's trademark is ackno=
wledged=20
+as shown below on all unmodified copies of the 4 Charter Type 1 fonts.=20
+BITSTREAM CHARTER is a registered trademark of Bitstream Inc.=20
diff --git a/meta/files/common-licenses/Bitstream-Vera b/meta/files/common-=
licenses/Bitstream-Vera
new file mode 100644
index 00000000000..f353aa2d04e
--- /dev/null
+++ b/meta/files/common-licenses/Bitstream-Vera
@@ -0,0 +1,15 @@
+Copyright Copyright (c) 2003 by Bitstream, Inc. All Rights Reserved. Bitst=
ream Vera is a trademark of Bitstream, Inc.
+
+Permission is hereby granted, free of charge, to any person obtaining a co=
py of the fonts accompanying this license ("Fonts") and associated document=
ation files (the "Font Software"), to reproduce and distribute the Font Sof=
tware, including without limitation the rights to use, copy, merge, publish=
, distribute, and/or sell copies of the Font Software, and to permit person=
s to whom the Font Software is furnished to do so, subject to the following=
 conditions:
+
+The above copyright and trademark notices and this permission notice shall=
 be included in all copies of one or more of the Font Software typefaces.
+
+The Font Software may be modified, altered, or added to, and in particular=
 the designs of glyphs or characters in the Fonts may be modified and addit=
ional glyphs or characters may be added to the Fonts, only if the fonts are=
 renamed to names not containing either the words "Bitstream" or the word "=
Vera".
+
+This License becomes null and void to the extent applicable to Fonts or Fo=
nt Software that has been modified and is distributed under the "Bitstream =
Vera" names.
+
+The Font Software may be sold as part of a larger software package but no =
copy of one or more of the Font Software typefaces may be sold by itself.
+
+THE FONT SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF MERCHANTABILI=
TY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF COPYRIGHT, PATE=
NT, TRADEMARK, OR OTHER RIGHT. IN NO EVENT SHALL BITSTREAM OR THE GNOME FOU=
NDATION BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, INCLUDING ANY =
GENERAL, SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, WHETHER I=
N AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF THE USE OR=
 INABILITY TO USE THE FONT SOFTWARE OR FROM OTHER DEALINGS IN THE FONT SOFT=
WARE.
+
+Except as contained in this notice, the names of Gnome, the Gnome Foundati=
on, and Bitstream Inc., shall not be used in advertising or otherwise to pr=
omote the sale, use or other dealings in this Font Software without prior w=
ritten authorization from the Gnome Foundation or Bitstream Inc., respectiv=
ely. For further information, contact: fonts at gnome dot org.
diff --git a/meta/files/common-licenses/Boehm-GC b/meta/files/common-licens=
es/Boehm-GC
new file mode 100644
index 00000000000..95427c0b590
--- /dev/null
+++ b/meta/files/common-licenses/Boehm-GC
@@ -0,0 +1,12 @@
+Copyright (c) ...
+
+THIS MATERIAL IS PROVIDED AS IS, WITH ABSOLUTELY NO WARRANTY EXPRESSED
+OR IMPLIED.  ANY USE IS AT YOUR OWN RISK.
+
+Permission is hereby granted to use or copy this program
+for any purpose,  provided the above notices are retained on all copies.
+Permission to modify the code and to distribute modified code is granted,
+provided the above notices are retained, and a notice that the code was
+modified is included with the above copyright notice.
+
+A few files have other copyright holders.
diff --git a/meta/files/common-licenses/Brian-Gladman-2-Clause b/meta/files=
/common-licenses/Brian-Gladman-2-Clause
new file mode 100644
index 00000000000..7276f63e9e6
--- /dev/null
+++ b/meta/files/common-licenses/Brian-Gladman-2-Clause
@@ -0,0 +1,17 @@
+Copyright (C) 1998-2013, Brian Gladman, Worcester, UK. All
+   rights reserved.
+
+The redistribution and use of this software (with or without
+changes) is allowed without the payment of fees or royalties
+provided that:
+
+   source code distributions include the above copyright notice,
+   this list of conditions and the following disclaimer;
+
+   binary distributions include the above copyright notice, this
+   list of conditions and the following disclaimer in their
+   documentation.
+
+This software is provided 'as is' with no explicit or implied
+warranties in respect of its operation, including, but not limited
+to, correctness and fitness for purpose.
diff --git a/meta/files/common-licenses/Brian-Gladman-3-Clause b/meta/files=
/common-licenses/Brian-Gladman-3-Clause
new file mode 100644
index 00000000000..984c95e3e86
--- /dev/null
+++ b/meta/files/common-licenses/Brian-Gladman-3-Clause
@@ -0,0 +1,26 @@
+Copyright (c) 2003, Dr Brian Gladman, Worcester, UK.   All rights reserved.
+
+LICENSE TERMS
+
+The free distribution and use of this software in both source and binary
+form is allowed (with or without changes) provided that:
+
+  1. distributions of this source code include the above copyright
+     notice, this list of conditions and the following disclaimer;
+
+  2. distributions in binary form include the above copyright
+     notice, this list of conditions and the following disclaimer
+     in the documentation and/or other associated materials;
+
+  3. the copyright holder's name is not used to endorse products
+     built using this software without specific written permission.
+
+ALTERNATIVELY, provided that this notice is retained in full, this product
+may be distributed under the terms of the GNU General Public License (GPL),
+in which case the provisions of the GPL apply INSTEAD OF those given above.
+
+DISCLAIMER
+
+This software is provided 'as is' with no explicit or implied warranties
+in respect of its properties, including, but not limited to, correctness
+and/or fitness for purpose.
diff --git a/meta/files/common-licenses/CC-BY-3.0-AU b/meta/files/common-li=
censes/CC-BY-3.0-AU
new file mode 100644
index 00000000000..c6cd4400540
--- /dev/null
+++ b/meta/files/common-licenses/CC-BY-3.0-AU
@@ -0,0 +1,136 @@
+Creative Commons Attribution 3.0 Australia
+
+CREATIVE COMMONS CORPORATION IS NOT A LAW FIRM AND DOES NOT PROVIDE LEGAL =
SERVICES. DISTRIBUTION OF THIS LICENCE DOES NOT CREATE AN ATTORNEY-CLIENT R=
ELATIONSHIP. CREATIVE COMMONS PROVIDES THIS INFORMATION ON AN "AS-IS" BASIS=
. CREATIVE COMMONS MAKES NO WARRANTIES REGARDING THE INFORMATION PROVIDED, =
AND DISCLAIMS LIABILITY FOR DAMAGES RESULTING FROM ITS USE.
+Licence
+
+THE WORK (AS DEFINED BELOW) IS PROVIDED UNDER THE TERMS OF THIS CREATIVE C=
OMMONS PUBLIC LICENCE ("LICENCE"). THE WORK IS PROTECTED BY COPYRIGHT AND/O=
R OTHER APPLICABLE LAW. ANY USE OF THE WORK OTHER THAN AS AUTHORISED UNDER =
THIS LICENCE OR COPYRIGHT LAW IS PROHIBITED.
+
+BY EXERCISING ANY RIGHTS TO THE WORK PROVIDED HERE, YOU ACCEPT AND AGREE T=
O BE BOUND BY THE TERMS OF THIS LICENCE. THE LICENSOR GRANTS YOU THE RIGHTS=
 CONTAINED HERE IN CONSIDERATION OF YOUR ACCEPTANCE OF SUCH TERMS AND CONDI=
TIONS.
+
+1. Definitions
+
+    a. "Collection" means the Work in its entirety in unmodified form alon=
g with one or more other separate and independent works, assembled into a c=
ollective whole. A Collection may, for example, include a periodical, encyc=
lopedia or anthology. A Collection will not be considered a Derivative Work=
 for the purposes of this Licence.
+    b. "Derivative Work" means material in any form that is created by edi=
ting, modifying or adapting the Work, a substantial part of the Work, or th=
e Work and other pre-existing works. Derivative Works may, for example, inc=
lude a translation, adaptation, musical arrangement, dramatisation, motion =
picture version, sound recording, art reproduction, abridgment, condensatio=
n, or any other form in which the Work may be transformed or adapted, excep=
t that a Collection will not be considered a Derivative Work for the purpos=
e of this Licence. For the avoidance of doubt, where the Work is a musical =
composition or sound recording, the synchronization of the Work in timed-re=
lation with a moving image ("synching") will be considered a Derivative Wor=
k for the purpose of this Licence.
+    c. "Distribute" means to make available to the public by any means, in=
cluding publication, electronic communication, or broadcast.
+    d. "Licensor" means the individual, individuals, entity or entities th=
at offer(s) the Work under the terms of this Licence.
+    e. "Original Author" means the individual, individuals, entity or enti=
ties who created the Work.
+    f. "Reproduce" means to make a copy of the Work in any material form (=
eg storage in digital form).
+    g. "Work" means the material (including any work or other subject matt=
er) protected by copyright which is offered under the terms of this Licence=
. This may include (without limitation) a literary, dramatic, musical or ar=
tistic work; a sound recording or cinematograph film; a published edition o=
f a literary, dramatic, musical or artistic work; or a television or sound =
broadcast.
+    h. "You" means an individual or entity exercising rights under this Li=
cence who has not previously violated the terms of this Licence with respec=
t to the Work, or who has received express permission from the Licensor to =
exercise rights under this Licence despite a previous violation.
+
+2. Fair Dealing and Other Rights
+
+Nothing in this Licence is intended to reduce, limit, or restrict any uses=
 free from copyright or rights arising from limitations or exceptions under=
 copyright law or any other applicable laws.
+
+3. Licence Grant
+
+3A Grant of Rights
+
+Provided that the terms set out in this Licence are satisfied, the Licenso=
r grants to You a worldwide, royalty-free, non-exclusive, perpetual (for th=
e duration of the applicable copyright) licence to exercise the following r=
ights:
+    a. Reproduce the Work;
+    b. incorporate the Work into one or more Collections;
+    c. Reproduce the Work as incorporated in any Collection;
+    d. create and Reproduce one or more Derivative Works; and
+    e. Distribute and publicly perform the Work, a Derivative Work or the =
Work as incorporated in any Collection.
+
+3B Media and Formats
+
+The above rights may be exercised in any media or format whether now known=
 or hereafter created. They include the right to make modifications that ar=
e technically necessary to exercise the rights in other media and formats.
+
+3C Other Rights Reserved
+
+All rights not expressly granted by the Licensor are reserved. The Licenso=
r waives the right to collect royalties for any exercise by You of the righ=
ts granted under this Licence.
+
+4. Restrictions
+
+The licence granted above is limited by the following restrictions.
+
+4A Restrictions on Distribution and Public Performance of the Work
+
+    a. You may Distribute and publicly perform the Work only under the ter=
ms of this Licence.
+    b. You must include a copy of, or the Uniform Resource Identifier (suc=
h as a web link) for, this Licence with every copy of the Work You Distribu=
te or publicly perform.
+    c. You must not offer or impose any terms on the Work that restrict th=
is Licence or the ability of a recipient of the Work from You to exercise t=
he rights granted to them by this Licence.
+    d. You are not granted the right to sublicense the Work. The rights of=
 recipients of the Work from You are governed by clause 9.
+    e. You must keep intact all notices that refer to this Licence and to =
the disclaimer of warranties with every copy of the Work You Distribute or =
publicly perform.
+    f. When You Distribute or publicly perform the Work, You must not impo=
se any technological measures on it that restrict the ability of a recipien=
t of the Work from You to exercise the rights granted to them by this Licen=
ce.
+    g. For the avoidance of doubt, while this clause 4A applies to the Wor=
k as incorporated into a Collection, it does not require other material wit=
hin the Collection, or the Collection apart from the Work itself, to be mad=
e subject to this Licence.
+
+4B Attribution and Notice Requirements
+
+    a. When You Distribute or publicly perform the Work or any Derivative =
Work or Collection You must keep intact all copyright notices for the Work.
+    b. When You Distribute or publicly perform the Work or any Derivative =
Work or Collection You must provide, in a manner reasonable to the medium o=
r means You are using:
+        i. the name or pseudonym (if provided) of the Original Author and/=
or of any other party (such as a sponsor institute, publishing entity or jo=
urnal) that the Original Author or Licensor has requested be attributed (su=
ch as in the copyright notice or terms of use). In this clause 4B these par=
ties are referred to as "Attribution Parties";
+        ii. the title of the Work (if provided); and
+        iii. to the extent reasonably practicable, any Uniform Resource Id=
entifier (such as a web link) that the Licensor specifies should be associa=
ted with the Work that refers to the copyright notice or licensing informat=
ion for the Work.
+    c. For any Derivative Work You Distribute or publicly perform, You mus=
t take reasonable steps to clearly identify that changes were made to the W=
ork. For example, a translation could be marked "The original work was tran=
slated from English to Spanish".
+    d. In the case of a Derivative Work or Collection, the above attributi=
on should, at a minimum, appear as part of any credits for other contributi=
ng authors and be as prominent as the credits for those other authors.
+    e. You must, to the extent practicable, remove the above attribution f=
rom any Collection or Derivative Work if requested to do so by the Licensor=
 or Original Author.
+    f. For the avoidance of doubt, You may only use the credit required by=
 this clause 4B for the purpose of attribution in the manner set out above.=
 By exercising Your rights under this Licence, You must not assert or imply:
+        i. any connection between the Original Author, Licensor or any oth=
er Attribution Party and You or Your use of the Work; or
+        ii. sponsorship or endorsement by the Original Author, Licensor or=
 any other Attribution Party of You or Your use of the Work,
+    without their separate, express prior written permission.
+
+4C Moral Rights
+
+Moral rights remain unaffected to the extent they are recognised and nonwa=
ivable at law. In this clause 4C, "moral rights" means the personal rights =
granted by law to the Original Author of a copyright work. For example, Par=
t IX of the Copyright Act 1968 (Cth) grants authors the right of integrity =
of authorship, the right of attribution of authorship, and the right not to=
 have authorship falsely attributed.
+
+5. Representations, Warranties and Disclaimer
+
+Except as expressly stated in this Licence or otherwise agreed to by the p=
arties in writing, and to the full extent permitted by applicable law, the =
Licensor offers the Work "as-is" and makes no representations, warranties o=
r conditions of any kind concerning the Work, express, implied, statutory o=
r otherwise. This includes, without limitation, any representations, warran=
ties or conditions regarding:
+    a. the contents or accuracy of the Work;
+        i. title, merchantability, or fitness for a particular purpose;
+        ii. non-infringement;
+        iii. the absence of latent or other defects; or
+        iv. the presence or absence of errors, whether or not discoverable.
+    b. The Trade Practices Act 1974 (Cth), and the corresponding State and=
 Territory fair trading legislation, imply certain warranties and condition=
s in certain circumstances, such as the right to supply or fitness for purp=
ose of goods or services supplied to a consumer. Clause 5(a) cannot and is =
not intended to exclude, restrict or modify these warranties.
+
+6. Limit of Liability
+
+    a. To the full extent permitted by applicable law, and except for any =
liability arising from contrary agreement, in no event will the Licensor be=
 liable to You on any legal basis (including without limitation, negligence=
) for any loss or damage whatsoever, including (without limitation):
+        i. loss of production or operation time, loss, damage or corruptio=
n of data or records; or
+        ii. loss of anticipated savings, opportunity, revenue, profit or g=
oodwill, or other economic loss; or
+        iii. any special, incidental, consequential, punitive or exemplary=
 damages arising out of or in connection with this Licence or the use of th=
e Work, even if the Licensor has been advised of the possibility of such da=
mages.
+    b. If applicable legislation implies warranties or conditions, or impo=
ses obligations or liability on the Licensor in respect of this Licence tha=
t cannot be wholly or partly excluded, restricted or modified, the Licensor=
=E2=80=99s liability is limited, to the full extent permitted by the applic=
able legislation, at its option, to:
+        i. in the case of goods, any one or more of the following:
+            * the replacement of the goods or the supply of equivalent goo=
ds;
+            * the repair of the goods;
+            * the payment of the cost of replacing the goods or of acquiri=
ng equivalent goods;
+            * the payment of the cost of having the goods repaired; or
+        ii. in the case of services:
+            * the supplying of the services again; or
+            * the payment of the cost of having the services supplied agai=
n.
+    c. The Trade Practices Act 1974 (Cth), and the corresponding State and=
 Territory fair trading legislation, restrict the limitation of liability i=
n certain circumstances, such as a contract for the supply of goods or serv=
ices of a kind ordinarily acquired for personal, domestic, or household use=
. Clauses 6(a) and 6(b) cannot and are not intended to apply in circumstanc=
es where it is prohibited by law.
+
+7. Termination
+
+This Licence and the rights granted to You under this Licence shall termin=
ate automatically upon any breach by You of the terms of the Licence. Indiv=
iduals or entities who have received a Derivative Work or a Collection from=
 You pursuant to this Licence, however, will not have their licences termin=
ated provided they remain in full compliance with those licences. Clauses 1=
, 2, 5, 6, 7, 8, 9, 10, 11, 12 and 13 shall survive any termination of this=
 Licence.
+
+8. Licensor=E2=80=99s Rights Retained
+
+Subject to the above terms, the Licence granted here is perpetual (for the=
 duration of the applicable copyright in the Work). Notwithstanding this, t=
he Licensor reserves the right to release the Work under different licence =
terms or to stop distributing the Work at any time. However, any such relea=
se will not serve to withdraw this Licence (or any other licence that has b=
een granted under the terms of this Licence), and this Licence will continu=
e in full force and effect unless terminated as stated above.
+
+9. Licence Grant to Recipients of the Work from You
+
+Each time You Distribute or publicly perform the Work, a Derivative Work o=
r a Collection the Licensor offers the recipient a licence to the Work on t=
he same terms as are granted to You under this Licence.
+
+10. Severability
+
+If any provision of this Licence is invalid or unenforceable under applica=
ble law, it shall not affect the validity or enforceability of the remainde=
r of the terms of this Licence. Without further action by the parties to th=
is agreement, such provision shall be reformed to the minimum extent necess=
ary to make such provision valid and enforceable.
+
+11. Waivers and Consents
+
+No term of this Licence shall be deemed waived and no breach consented to =
unless such waiver or consent is in writing and signed by the relevant part=
y.
+
+12. Entire Agreement
+
+This Licence constitutes the entire agreement between the parties. To the =
full extent permitted by law, there are no understandings, agreements or re=
presentations with respect to the Work not specified here. The Licensor sha=
ll not be bound by any additional provisions that may appear in any communi=
cation from You. This Licence may not be modified without the written agree=
ment of the Licensor and You.
+
+13. Governing Law
+
+The construction, validity and performance of this Licence shall be govern=
ed by the laws in force in the Australian Capital Territory, Australia.
+
+Creative Commons Notice
+
+Creative Commons is not a party to this Licence, and, to the full extent p=
ermitted by applicable law, makes no representation or warranty whatsoever =
in connection with the Work. To the full extent permitted by applicable law=
, Creative Commons will not be liable to You or any party on any legal theo=
ry (including, without limitation, negligence) for any damages whatsoever, =
including without limitation any general, special, incidental or consequent=
ial damages arising in connection to this licence. Notwithstanding the fore=
going two (2) sentences, if Creative Commons has expressly identified itsel=
f as the Licensor hereunder, it shall have all rights and obligations of Li=
censor. Except for the limited purpose of indicating to the public that the=
 Work is licensed under the Licence, neither party will use the trademark "=
Creative Commons" or any related trademark or logo of Creative Commons with=
out the prior written consent of Creative Commons. Any permitted use will b=
e in compliance with Creative Commons=E2=80=99 then-current trademark usage=
 guidelines, as may be published on its website or otherwise made available=
 upon request from time to time.
+
+Creative Commons may be contacted at https://creativecommons.org/ .
diff --git a/meta/files/common-licenses/CC-BY-3.0-IGO b/meta/files/common-l=
icenses/CC-BY-3.0-IGO
new file mode 100644
index 00000000000..13ab9536e17
--- /dev/null
+++ b/meta/files/common-licenses/CC-BY-3.0-IGO
@@ -0,0 +1,101 @@
+Creative Commons Attribution 3.0 IGO
+
+CREATIVE COMMONS CORPORATION IS NOT A LAW FIRM AND DOES NOT PROVIDE LEGAL =
SERVICES. DISTRIBUTION OF THIS LICENSE DOES NOT CREATE AN ATTORNEY-CLIENT R=
ELATIONSHIP. CREATIVE COMMONS PROVIDES THIS INFORMATION ON AN "AS-IS" BASIS=
. CREATIVE COMMONS MAKES NO WARRANTIES REGARDING THE INFORMATION PROVIDED, =
AND DISCLAIMS LIABILITY FOR DAMAGES RESULTING FROM ITS USE. THE LICENSOR IS=
 NOT NECESSARILY AN INTERGOVERNMENTAL ORGANIZATION (IGO), AS DEFINED IN THE=
 LICENSE BELOW.=20
+
+License
+
+THE WORK (AS DEFINED BELOW) IS PROVIDED UNDER THE TERMS OF THIS CREATIVE C=
OMMONS PUBLIC LICENSE ("LICENSE"). THE LICENSOR (DEFINED BELOW) HOLDS COPYR=
IGHT AND OTHER RIGHTS IN THE WORK. ANY USE OF THE WORK OTHER THAN AS AUTHOR=
IZED UNDER THIS LICENSE IS PROHIBITED.
+
+BY EXERCISING ANY RIGHTS TO THE WORK PROVIDED HERE, YOU ACCEPT AND AGREE T=
O BE BOUND BY THE TERMS OF THIS LICENSE. THE LICENSOR GRANTS YOU THE RIGHTS=
 CONTAINED HERE IN CONSIDERATION FOR YOUR ACCEPTANCE AND AGREEMENT TO THE T=
ERMS OF THE LICENSE.
+
+1. Definitions
+
+    a. "IGO" means, solely and exclusively for purposes of this License, a=
n organization established by a treaty or other instrument governed by inte=
rnational law and possessing its own international legal personality. Other=
 organizations established to carry out activities across national borders =
and that accordingly enjoy immunity from legal process are also IGOs for th=
e sole and exclusive purposes of this License. IGOs may include as members,=
 in addition to states, other entities.
+
+    b. "Work" means the literary and/or artistic work eligible for copyrig=
ht protection, whatever may be the mode or form of its expression including=
 digital form, and offered under the terms of this License. It is understoo=
d that a database, which by reason of the selection and arrangement of its =
contents constitutes an intellectual creation, is considered a Work.
+
+    c. "Licensor" means the individual, individuals, entity or entities th=
at offer(s) the Work under the terms of this License and may be, but is not=
 necessarily, an IGO.
+
+    d. "You" means an individual or entity exercising rights under this Li=
cense.
+
+    e. "Reproduce" means to make a copy of the Work in any manner or form,=
 and by any means.
+
+    f. "Distribute" means the activity of making publicly available the Wo=
rk or Adaptation (or copies of the Work or Adaptation), as applicable, by s=
ale, rental, public lending or any other known form of transfer of ownershi=
p or possession of the Work or copy of the Work.
+
+    g. "Publicly Perform" means to perform public recitations of the Work =
and to communicate to the public those public recitations, by any means or =
process, including by wire or wireless means or public digital performances=
; to make available to the public Works in such a way that members of the p=
ublic may access these Works from a place and at a place individually chose=
n by them; to perform the Work to the public by any means or process and th=
e communication to the public of the performances of the Work, including by=
 public digital performance; to broadcast and rebroadcast the Work by any m=
eans including signs, sounds or images.
+
+    h. "Adaptation" means a work derived from or based upon the Work, or u=
pon the Work and other pre-existing works. Adaptations may include works su=
ch as translations, derivative works, or any alterations and arrangements o=
f any kind involving the Work. For purposes of this License, where the Work=
 is a musical work, performance, or phonogram, the synchronization of the W=
ork in timed-relation with a moving image is an Adaptation. For the avoidan=
ce of doubt, including the Work in a Collection is not an Adaptation.
+
+    i. "Collection" means a collection of literary or artistic works or ot=
her works or subject matter other than works listed in Section 1(b) which b=
y reason of the selection and arrangement of their contents, constitute int=
ellectual creations, in which the Work is included in its entirety in unmod=
ified form along with one or more other contributions, each constituting se=
parate and independent works in themselves, which together are assembled in=
to a collective whole. For the avoidance of doubt, a Collection will not be=
 considered as an Adaptation.
+
+2. Scope of this License. Nothing in this License is intended to reduce, l=
imit, or restrict any uses free from copyright protection.
+
+3. License Grant. Subject to the terms and conditions of this License, the=
 Licensor hereby grants You a worldwide, royalty-free, non-exclusive licens=
e to exercise the rights in the Work as follows:
+
+    a. to Reproduce, Distribute and Publicly Perform the Work, to incorpor=
ate the Work into one or more Collections, and to Reproduce, Distribute and=
 Publicly Perform the Work as incorporated in the Collections; and,
+
+    b. to create, Reproduce, Distribute and Publicly Perform Adaptations, =
provided that You clearly label, demarcate or otherwise identify that chang=
es were made to the original Work.
+
+    c. For the avoidance of doubt:
+
+        i. Non-waivable Compulsory License Schemes. In those jurisdictions=
 in which the right to collect royalties through any statutory or compulsor=
y licensing scheme cannot be waived, the Licensor reserves the exclusive ri=
ght to collect such royalties for any exercise by You of the rights granted=
 under this License;
+
+        ii. Waivable Compulsory License Schemes. In those jurisdictions in=
 which the right to collect royalties through any statutory or compulsory l=
icensing scheme can be waived, the Licensor waives the exclusive right to c=
ollect such royalties for any exercise by You of the rights granted under t=
his License; and,
+
+        iii. Voluntary License Schemes. To the extent possible, the Licens=
or waives the right to collect royalties from You for the exercise of the L=
icensed Rights, whether directly or through a collecting society under any =
voluntary licensing scheme.
+
+This License lasts for the duration of the term of the copyright in the Wo=
rk licensed by the Licensor. The above rights may be exercised in all media=
 and formats whether now known or hereafter devised. The above rights inclu=
de the right to make such modifications as are technically necessary to exe=
rcise the rights in other media and formats. All rights not expressly grant=
ed by the Licensor are hereby reserved.
+
+4. Restrictions. The license granted in Section 3 above is expressly made =
subject to and limited by the following restrictions:
+
+    a. You may Distribute or Publicly Perform the Work only under the term=
s of this License. You must include a copy of, or the Uniform Resource Iden=
tifier (URI) for, this License with every copy of the Work You Distribute o=
r Publicly Perform. You may not offer or impose any terms on the Work that =
restrict the terms of this License or the ability of the recipient of the W=
ork to exercise the rights granted to that recipient under the terms of the=
 License. You may not sublicense the Work (see section 8(a)). You must keep=
 intact all notices that refer to this License and to the disclaimer of war=
ranties with every copy of the Work You Distribute or Publicly Perform. Whe=
n You Distribute or Publicly Perform the Work, You may not impose any effec=
tive technological measures on the Work that restrict the ability of a reci=
pient of the Work from You to exercise the rights granted to that recipient=
 under the terms of the License. This Section 4(a) applies to the Work as i=
ncorporated in a Collection, but this does not require the Collection apart=
 from the Work itself to be made subject to the terms of this License. If Y=
ou create a Collection, upon notice from a Licensor You must, to the extent=
 practicable, remove from the Collection any credit (inclusive of any logo,=
 trademark, official mark or official emblem) as required by Section 4(b), =
as requested. If You create an Adaptation, upon notice from a Licensor You =
must, to the extent practicable, remove from the Adaptation any credit (inc=
lusive of any logo, trademark, official mark or official emblem) as require=
d by Section 4(b), as requested.
+
+    b. If You Distribute, or Publicly Perform the Work or any Adaptations =
or Collections, You must, unless a request has been made pursuant to Sectio=
n 4(a), keep intact all copyright notices for the Work and provide, reasona=
ble to the medium or means You are utilizing: (i) any attributions that the=
 Licensor indicates be associated with the Work as indicated in a copyright=
 notice, (ii) the title of the Work if supplied; (iii) to the extent reason=
ably practicable, the URI, if any, that the Licensor specifies to be associ=
ated with the Work, unless such URI does not refer to the copyright notice =
or licensing information for the Work; and, (iv) consistent with Section 3(=
b), in the case of an Adaptation, a credit identifying the use of the Work =
in the Adaptation. The credit required by this Section 4(b) may be implemen=
ted in any reasonable manner; provided, however, that in the case of an Ada=
ptation or Collection, at a minimum such credit will appear, if a credit fo=
r all contributors to the Adaptation or Collection appears, then as part of=
 these credits and in a manner at least as prominent as the credits for the=
 other contributors. For the avoidance of doubt, You may only use the credi=
t required by this Section for the purpose of attribution in the manner set=
 out above and, by exercising Your rights under this License, You may not i=
mplicitly or explicitly assert or imply any connection with, sponsorship or=
 endorsement by the Licensor or others designated for attribution, of You o=
r Your use of the Work, without the separate, express prior written permiss=
ion of the Licensor or such others.
+
+    c. Except as otherwise agreed in writing by the Licensor, if You Repro=
duce, Distribute or Publicly Perform the Work either by itself or as part o=
f any Adaptations or Collections, You must not distort, mutilate, modify or=
 take other derogatory action in relation to the Work which would be prejud=
icial to the honor or reputation of the Licensor where moral rights apply.
+
+5. Representations, Warranties and Disclaimer
+
+THE LICENSOR OFFERS THE WORK AS-IS AND MAKES NO REPRESENTATIONS OR WARRANT=
IES OF ANY KIND CONCERNING THE WORK, EXPRESS, IMPLIED, STATUTORY OR OTHERWI=
SE, INCLUDING, WITHOUT LIMITATION, WARRANTIES OF TITLE, MERCHANTABILITY, FI=
TNESS FOR A PARTICULAR PURPOSE, NONINFRINGEMENT, OR THE ABSENCE OF LATENT O=
R OTHER DEFECTS, ACCURACY, OR THE PRESENCE OF ERRORS, WHETHER OR NOT DISCOV=
ERABLE.
+
+6. Limitation on Liability
+
+IN NO EVENT WILL THE LICENSOR BE LIABLE TO YOU ON ANY LEGAL THEORY FOR ANY=
 SPECIAL, INCIDENTAL, CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES ARISING =
OUT OF THIS LICENSE OR THE USE OF THE WORK, EVEN IF THE LICENSOR HAS BEEN A=
DVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+
+7. Termination
+
+    a. Subject to the terms and conditions set forth in this License, the =
license granted here lasts for the duration of the term of the copyright in=
 the Work licensed by the Licensor as stated in Section 3. Notwithstanding =
the above, the Licensor reserves the right to release the Work under differ=
ent license terms or to stop distributing the Work at any time; provided, h=
owever that any such election will not serve to withdraw this License (or a=
ny other license that has been, or is required to be, granted under the ter=
ms of this License), and this License will continue in full force and effec=
t unless terminated as stated below.
+
+    b. If You fail to comply with this License, then this License and the =
rights granted hereunder will terminate automatically upon any breach by Yo=
u of the terms of this License. Individuals or entities who have received A=
daptations or Collections from You under this License, however, will not ha=
ve their licenses terminated provided such individuals or entities remain i=
n full compliance with those licenses. Sections 1, 2, 5, 6, 7, and 8 will s=
urvive any termination of this License. Notwithstanding the foregoing, this=
 License reinstates automatically as of the date the violation is cured, pr=
ovided it is cured within 30 days of You discovering the violation, or upon=
 express reinstatement by the Licensor. For the avoidance of doubt, this Se=
ction 7(b) does not affect any rights the Licensor may have to seek remedie=
s for violations of this License by You.
+
+8. Miscellaneous
+
+    a. Each time You Distribute or Publicly Perform the Work or a Collecti=
on, the Licensor offers to the recipient a license to the Work on the same =
terms and conditions as the license granted to You under this License.
+
+    b. Each time You Distribute or Publicly Perform an Adaptation, the Lic=
ensor offers to the recipient a license to the original Work on the same te=
rms and conditions as the license granted to You under this License.
+
+    c. If any provision of this License is invalid or unenforceable, it sh=
all not affect the validity or enforceability of the remainder of the terms=
 of this License, and without further action, such provision shall be refor=
med to the minimum extent necessary to make such provision valid and enforc=
eable.
+
+    d. No term or provision of this License shall be deemed waived and no =
breach consented to unless such waiver or consent shall be in writing and s=
igned by the Licensor.
+
+    e. This License constitutes the entire agreement between You and the L=
icensor with respect to the Work licensed here. There are no understandings=
, agreements or representations with respect to the Work not specified here=
. The Licensor shall not be bound by any additional provisions that may app=
ear in any communication from You. This License may not be modified without=
 the mutual written agreement of the Licensor and You.
+
+    f. The rights granted under, and the subject matter referenced, in thi=
s License were drafted utilizing the terminology of the Berne Convention fo=
r the Protection of Literary and Artistic Works (as amended on September 28=
, 1979), the Rome Convention of 1961, the WIPO Copyright Treaty of 1996, th=
e WIPO Performances and Phonograms Treaty of 1996 and the Universal Copyrig=
ht Convention (as revised on July 24, 1971). Interpretation of the scope of=
 the rights granted by the Licensor and the conditions imposed on You under=
 this License, this License, and the rights and conditions set forth herein=
 shall be made with reference to copyright as determined in accordance with=
 general principles of international law, including the above mentioned con=
ventions.
+
+    g. Nothing in this License constitutes or may be interpreted as a limi=
tation upon or waiver of any privileges and immunities that may apply to th=
e Licensor or You, including immunity from the legal processes of any juris=
diction, national court or other authority.
+
+    h. Where the Licensor is an IGO, any and all disputes arising under th=
is License that cannot be settled amicably shall be resolved in accordance =
with the following procedure:
+
+        i. Pursuant to a notice of mediation communicated by reasonable me=
ans by either You or the Licensor to the other, the dispute shall be submit=
ted to non-binding mediation conducted in accordance with rules designated =
by the Licensor in the copyright notice published with the Work, or if none=
 then in accordance with those communicated in the notice of mediation. The=
 language used in the mediation proceedings shall be English unless otherwi=
se agreed.
+
+        ii. If any such dispute has not been settled within 45 days follow=
ing the date on which the notice of mediation is provided, either You or th=
e Licensor may, pursuant to a notice of arbitration communicated by reasona=
ble means to the other, elect to have the dispute referred to and finally d=
etermined by arbitration. The arbitration shall be conducted in accordance =
with the rules designated by the Licensor in the copyright notice published=
 with the Work, or if none then in accordance with the UNCITRAL Arbitration=
 Rules as then in force. The arbitral tribunal shall consist of a sole arbi=
trator and the language of the proceedings shall be English unless otherwis=
e agreed. The place of arbitration shall be where the Licensor has its head=
quarters. The arbitral proceedings shall be conducted remotely (e.g., via t=
elephone conference or written submissions) whenever practicable.
+
+        iii. Interpretation of this License in any dispute submitted to me=
diation or arbitration shall be as set forth in Section 8(f), above.
+
+Creative Commons Notice
+
+Creative Commons is not a party to this License, and makes no warranty wha=
tsoever in connection with the Work. Creative Commons will not be liable to=
 You or any party on any legal theory for any damages whatsoever, including=
 without limitation any general, special, incidental or consequential damag=
es arising in connection to this license. Notwithstanding the foregoing two=
 (2) sentences, if Creative Commons has expressly identified itself as the =
Licensor hereunder, it shall have all rights and obligations of the Licenso=
r.
+
+Except for the limited purpose of indicating to the public that the Work i=
s licensed under the CCPL, Creative Commons does not authorize the use by e=
ither party of the trademark "Creative Commons" or any related trademark or=
 logo of Creative Commons without the prior written consent of Creative Com=
mons. Any permitted use will be in compliance with Creative Commons' then-c=
urrent trademark usage guidelines, as may be published on its website or ot=
herwise made available upon request from time to time. For the avoidance of=
 doubt, this trademark restriction does not form part of this License.
+
+Creative Commons may be contacted at https://creativecommons.org/.
diff --git a/meta/files/common-licenses/CC-BY-NC-SA-2.0-DE b/meta/files/com=
mon-licenses/CC-BY-NC-SA-2.0-DE
new file mode 100644
index 00000000000..ba4b72ac30b
--- /dev/null
+++ b/meta/files/common-licenses/CC-BY-NC-SA-2.0-DE
@@ -0,0 +1,85 @@
+Creative Commons Namensnennung =E2=80=94 Nicht-kommerziell =E2=80=94 Weite=
rgabe unter gleichen Bedingungen 2.0
+
+CREATIVE COMMONS IST KEINE RECHTSANWALTSGESELLSCHAFT UND LEISTET KEINE REC=
HTSBERATUNG. DIE WEITERGABE DIESES LIZENZENTWURFES F=C3=9CHRT ZU KEINEM MAN=
DATSVERH=C3=84LTNIS. CREATIVE COMMONS ERBRINGT DIESE INFORMATIONEN OHNE GEW=
=C3=84HR. CREATIVE COMMONS =C3=9CBERNIMMT KEINE GEW=C3=84HRLEISTUNG F=C3=9C=
R DIE GELIEFERTEN INFORMATIONEN UND SCHLIE=C3=9FT DIE HAFTUNG F=C3=9CR SCH=
=C3=84DEN AUS, DIE SICH AUS IHREM GEBRAUCH ERGEBEN.
+
+Lizenzvertrag
+
+DAS URHEBERRECHTLICH GESCH=C3=9CTZTE WERK ODER DER SONSTIGE SCHUTZGEGENSTA=
ND (WIE UNTEN BESCHRIEBEN) WIRD UNTER DEN BEDINGUNGEN DIESER CREATIVE COMMO=
NS PUBLIC LICENSE (=E2=80=9ECCPL=E2=80=9C ODER =E2=80=9ELIZENZVERTRAG=E2=80=
=9C) ZUR VERF=C3=9CGUNG GESTELLT. DER SCHUTZGEGENSTAND IST DURCH DAS URHEBE=
RRECHT UND/ODER EINSCHL=C3=84GIGE GESETZE GESCH=C3=9CTZT.
+
+DURCH DIE AUS=C3=9CBUNG EINES DURCH DIESEN LIZENZVERTRAG GEW=C3=84HRTEN RE=
CHTS AN DEM SCHUTZGEGENSTAND ERKL=C3=84REN SIE SICH MIT DEN LIZENZBEDINGUNG=
EN RECHTSVERBINDLICH EINVERSTANDEN. DER LIZENZGEBER R=C3=84UMT IHNEN DIE HI=
ER BESCHRIEBENEN RECHTE UNTER DER VORAUSSETZUNGEIN, DASS SIE SICH MIT DIESE=
N VERTRAGSBEDINGUNGEN EINVERSTANDEN ERKL=C3=84REN.
+
+1. Definitionen
+
+      a. Unter einer =E2=80=9EBearbeitung=E2=80=9C wird eine =C3=9Cbersetz=
ung oder andere Bearbeitung des Werkes verstanden, die Ihre pers=C3=B6nlich=
e geistige Sch=C3=B6pfung  ist. Eine freie Benutzung des Werkes wird nicht =
als Bearbeitung angesehen.
+
+      b. Unter den =E2=80=9ELizenzelementen=E2=80=9C werden die folgenden =
Lizenzcharakteristika verstanden, die vom Lizenzgeber ausgew=C3=A4hlt und  =
in der Bezeichnung  der Lizenz genannt werden: =E2=80=9ENamensnennung=E2=80=
=9C, =E2=80=9ENicht-kommerziell=E2=80=9C, =E2=80=9EWeitergabe unter gleiche=
n Bedingungen=E2=80=9C.
+
+      c. Unter dem =E2=80=9ELizenzgeber=E2=80=9C wird die nat=C3=BCrliche =
oder juristische Person verstanden, die den Schutzgegenstand unter den Bedi=
ngungen dieser Lizenz anbietet.
+
+      d. Unter einem =E2=80=9ESammelwerk=E2=80=9C wird eine Sammlung von W=
erken, Daten oder anderen unabh=C3=A4ngigen Elementen verstanden, die aufgr=
und der Auswahl oder Anordnung der Elemente eine pers=C3=B6nliche geistige =
Sch=C3=B6pfung ist. Darunter fallen auch solche Sammelwerke, deren Elemente=
 systematisch oder methodisch angeordnet und einzeln mit Hilfe elektronisch=
er Mittel oder auf andere Weise zug=C3=A4nglich sind (Datenbankwerke). Ein =
Sammelwerk wird im Zusammenhang mit dieser Lizenz nicht als Bearbeitung (wi=
e oben beschrieben) angesehen.
+
+      e. Mit =E2=80=9ESIE=E2=80=9C und =E2=80=9EIhnen=E2=80=9C ist die nat=
=C3=BCrliche oder juristische Person gemeint, die die durch diese Lizenz ge=
w=C3=A4hrten Nutzungsrechte aus=C3=BCbt und die zuvor die Bedingungen diese=
r Lizenz im Hinblick auf das Werk nicht verletzt hat, oder die die ausdr=C3=
=BCckliche Erlaubnis des Lizenzgebers erhalten hat, die durch diese Lizenz =
gew=C3=A4hrten Nutzungsrechte trotz einer vorherigen Verletzung auszu=C3=BC=
ben.
+
+      f. Unter dem  =E2=80=9ESchutzgegenstand=E2=80=9Cwird  das Werk oder =
Sammelwerk oder das Schutzobjekt eines verwandten Schutzrechts, das Ihnen u=
nter den Bedingungen dieser Lizenz angeboten wird, verstanden
+
+      g. Unter dem =E2=80=9EUrheber=E2=80=9C wird die nat=C3=BCrliche Pers=
on verstanden, die das Werk geschaffen hat.
+
+      h. Unter einem =E2=80=9Everwandten Schutzrecht=E2=80=9C wird das Rec=
ht an einem anderen urheberrechtlichen Schutzgegenstand als einem Werk vers=
tanden, zum Beispiel einer wissenschaftlichen Ausgabe, einem nachgelassenen=
 Werk, einem Lichtbild, einer Datenbank, einem Tontr=C3=A4ger, einer Funkse=
ndung, einem Laufbild oder einer Darbietung eines aus=C3=BCbenden K=C3=BCns=
tlers.
+
+      i. Unter dem =E2=80=9EWerk=E2=80=9C wird eine pers=C3=B6nliche geist=
ige Sch=C3=B6pfung verstanden, die Ihnen unter den Bedingungen dieser Lizen=
z angeboten wird.
+
+2. Schranken des Urheberrechts. Diese Lizenz l=C3=A4sst s=C3=A4mtliche Bef=
ugnisse unber=C3=BChrt, die sich aus den Schranken des Urheberrechts,aus de=
m Ersch=C3=B6pfungsgrundsatz oder anderen Beschr=C3=A4nkungen der Ausschlie=
=C3=9Flichkeitsrechte des Rechtsinhabers ergeben.
+
+3. Lizenzierung. Unter den Bedingungen dieses Lizenzvertrages r=C3=A4umt I=
hnen der Lizenzgeber ein lizenzgeb=C3=BChrenfreies, r=C3=A4umlich und zeitl=
ich (f=C3=BCr die Dauer des Urheberrechts oder verwandten Schutzrechts) unb=
eschr=C3=A4nktes einfaches Nutzungsrecht ein, den Schutzgegenstand in der f=
olgenden Art und Weise zu nutzen:
+
+      a. den Schutzgegenstand in k=C3=B6rperlicher Form zu verwerten, insb=
esondere zu vervielf=C3=A4ltigen, zu verbreiten und auszustellen;
+
+      b. den Schutzgegenstand in unk=C3=B6rperlicher Form =C3=B6ffentlich =
wiederzugeben, insbesondere vorzutragen, aufzuf=C3=BChren und vorzuf=C3=BCh=
ren, =C3=B6ffentlich zug=C3=A4nglich zu machen, zu senden, durch Bild- und =
Tontr=C3=A4ger wiederzugeben sowie Funksendungen und =C3=B6ffentliche Zug=
=C3=A4nglichmachungen wiederzugeben;
+
+      c. den Schutzgegenstand auf Bild- oder Tontr=C3=A4ger aufzunehmen, L=
ichtbilder davon herzustellen, weiterzusenden und in dem in a. und b. genan=
nten Umfang zu verwerten;
+
+      d. den Schutzgegenstand zu bearbeiten oder in anderer Weise umzugest=
alten und die Bearbeitungen zu ver=C3=B6ffentlichen und in dem in a. bis c.=
 genannten Umfang zu verwerten;
+
+Die genannten Nutzungsrechte k=C3=B6nnen f=C3=BCr alle bekannten Nutzungsa=
rten ausge=C3=BCbt werden. Die genannten Nutzungsrechte beinhalten das Rech=
t, solche Ver=C3=A4nderungen an dem Werk vorzunehmen, die technisch erforde=
rlich sind, um die Nutzungsrechte f=C3=BCr alle Nutzungsarten wahrzunehmen.=
 Insbesondere sind davon die Anpassung an andere Medien und auf andere Date=
iformate umfasst.
+
+4. Beschr=C3=A4nkungen. Die Einr=C3=A4umung der Nutzungsrechte gem=C3=A4=
=C3=9F Ziffer 3 erfolgt ausdr=C3=BCcklich nur unter den folgenden Bedingung=
en:
+
+      a. Sie d=C3=BCrfen den Schutzgegenstand ausschlie=C3=9Flich unter de=
n Bedingungen dieser Lizenz vervielf=C3=A4ltigen, verbreiten oder =C3=B6ffe=
ntlich wiedergeben, und Sie m=C3=BCssen stets eine Kopie oder die vollst=C3=
=A4ndige Internetadresse in Form des Uniform-Resource-Identifier (URI) dies=
er Lizenz beif=C3=BCgen, wenn Sie den Schutzgegenstandvervielf=C3=A4ltigen,=
 verbreiten oder =C3=B6ffentlich wiedergeben. Sie d=C3=BCrfen keine Vertrag=
sbedingungen anbieten oder fordern, die die Bedingungen dieser Lizenz oder =
die durch sie gew=C3=A4hrten Rechte =C3=A4ndern oder beschr=C3=A4nken. Sie =
d=C3=BCrfen den Schutzgegenstand nicht unterlizenzieren. Sie m=C3=BCssen al=
le Hinweise unver=C3=A4ndert lassen, die auf diese Lizenz und den Haftungsa=
usschluss hinweisen. Sie d=C3=BCrfen den Schutzgegenstand mit keinen techni=
schen Schutzma=C3=9Fnahmen versehen, die den Zugang oder den Gebrauch des S=
chutzgegenstandes in einer Weise kontrollieren, die mit den Bedingungen die=
ser Lizenz im Widerspruch stehen. Die genannten Beschr=C3=A4nkungen gelten =
auch f=C3=BCr den Fall, dass der Schutzgegenstand einen Bestandteil eines S=
ammelwerkes bildet; sie verlangen aber nicht, dass das Sammelwerk insgesamt=
 zum Gegenstand dieser Lizenz gemacht wird. Wenn Sie ein Sammelwerk erstell=
en, m=C3=BCssen Sie - soweit dies praktikabel ist - auf die Mitteilung eine=
s Lizenzgebers oder Urhebers hin aus dem Sammelwerk jeglichen Hinweis auf d=
iesen Lizenzgeber oder diesen Urheber entfernen. Wenn Sie den Schutzgegenst=
and bearbeiten, m=C3=BCssen Sie - soweit dies praktikabel ist- auf die Auff=
orderung eines Rechtsinhabers hin  von der Bearbeitung jeglichen Hinweis au=
f diesen Rechtsinhaber entfernen.
+
+      b. Sie d=C3=BCrfen eine Bearbeitung ausschlie=C3=9Flich unter den Be=
dingungen dieser Lizenz, einer sp=C3=A4teren Version dieser Lizenz mit dens=
elben Lizenzelementen wie diese Lizenz oder einer Creative Commons iCommons=
 Lizenz, die dieselben Lizenzelemente wie diese Lizenz enth=C3=A4lt (z.B. N=
amensnennung - Nicht-kommerziell - Weitergabe unter gleichen Bedingungen 2.=
0 Japan), vervielf=C3=A4ltigen, verbreiten oder =C3=B6ffentlich wiedergeben=
. Sie m=C3=BCssen stets eine Kopie oder die Internetadresse in Form des Uni=
form-Resource-Identifier (URI) dieser Lizenz oder einer anderen  Lizenz der=
 im vorhergehenden Satz beschriebenen Art beif=C3=BCgen, wenn Sie die Bearb=
eitung vervielf=C3=A4ltigen, verbreiten oder =C3=B6ffentlich wiedergeben. S=
ie d=C3=BCrfen keine Vertragsbedingungen anbieten oder fordern, die die Bed=
ingungen dieser Lizenz oder die durch sie gew=C3=A4hrten Rechte =C3=A4ndern=
 oder beschr=C3=A4nken, und Sie m=C3=BCssen alle Hinweise unver=C3=A4ndert =
lassen, die auf diese Lizenz und den Haftungsausschluss hinweisen. Sie d=C3=
=BCrfen eine Bearbeitung nicht mit technischen Schutzma=C3=9Fnahmen versehe=
n, die den Zugang oder den Gebrauch der Bearbeitung in einer Weise kontroll=
ieren, die mit den Bedingungen dieser Lizenz im Widerspruch stehen. Die gen=
annten Beschr=C3=A4nkungen gelten auch f=C3=BCr eine Bearbeitung als Bestan=
dteil eines Sammelwerkes; sie erfordern aber nicht, dass das Sammelwerk ins=
gesamt zum Gegenstand dieser Lizenz gemacht wird.
+
+      c. Sie d=C3=BCrfen die in Ziffer 3 gew=C3=A4hrten Nutzungsrechte in =
keiner Weise verwenden, die haupts=C3=A4chlich auf einen gesch=C3=A4ftliche=
n Vorteil oder eine vertraglich geschuldete geldwerte Verg=C3=BCtung abziel=
t oder darauf gerichtet ist. Erhalten Sie im Zusammenhang mit der Einr=C3=
=A4umung der Nutzungsrechte ebenfalls einen Schutzgegenstand, ohne dass ein=
e vertragliche Verpflichtung hierzu besteht, so wird dies nicht als gesch=
=C3=A4ftlicher Vorteil oder vertraglich geschuldete geldwerte Verg=C3=BCtun=
g angesehen, wenn keine Zahlung oder geldwerte Verg=C3=BCtung in Verbindung=
 mit dem Austausch der Schutzgegenst=C3=A4nde geleistet wird (z.B. File-Sha=
ring).
+
+      d. Wenn Sie den Schutzgegenstand oder eine Bearbeitung oder ein Samm=
elwerk vervielf=C3=A4ltigen, verbreiten oder =C3=B6ffentlich wiedergeben, m=
=C3=BCssen Sie alle Urhebervermerke f=C3=BCr den Schutzgegenstand unver=C3=
=A4ndert lassen und die Urheberschaft oder Rechtsinhaberschaft in einer der=
 von Ihnen vorgenommenen Nutzung angemessenen Form anerkennen, indem Sie de=
n Namen (oder das Pseudonym, falls ein solches verwendet wird) des Urhebers=
 oder Rechteinhabers nennen, wenn dieser angegeben ist. Dies gilt auch f=C3=
=BCr den Titel des Schutzgegenstandes, wenn dieser angeben ist, sowie - in =
einem vern=C3=BCnftigerweise durchf=C3=BChrbaren Umfang - f=C3=BCr die mit =
dem Schutzgegenstand zu verbindende Internetadresse in Form des Uniform-Res=
ource-Identifier (URI), wie sie der Lizenzgeber angegeben hat, sofern dies =
geschehen ist, es sei denn, diese Internetadresse verweist nicht auf den Ur=
hebervermerk oder die Lizenzinformationen zu dem  Schutzgegenstand. Bei ein=
er Bearbeitung ist ein Hinweis darauf aufzuf=C3=BChren, in welcher Form der=
 Schutzgegenstand in die Bearbeitung eingegangen ist (z.B. =E2=80=9EFranz=
=C3=B6sische =C3=9Cbersetzung des ... (Werk) durch ... (Urheber)=E2=80=9C o=
der =E2=80=9EDas Drehbuch beruht auf dem Werk des ... (Urheber)=E2=80=9C). =
Ein solcher Hinweis kann in jeder angemessenen Weise erfolgen, wobei jedoch=
 bei einer Bearbeitung, einer Datenbank oder einem Sammelwerk der Hinweis z=
umindest an gleicher Stelle und in ebenso auff=C3=A4lliger Weise zu erfolge=
n hat wie vergleichbare Hinweise auf andere Rechtsinhaber.
+
+      e. Obwohl die gem=C3=A4ss Ziffer 3 gew=C3=A4hrten Nutzungsrechte in =
umfassender Weise ausge=C3=BCbt werden d=C3=BCrfen, findet diese Erlaubnis =
ihre gesetzliche Grenze in den Pers=C3=B6nlichkeitsrechten der Urheber und =
aus=C3=BCbenden K=C3=BCnstler, deren berechtigte geistige und pers=C3=B6nli=
che Interessen bzw. deren Ansehen oder Ruf nicht dadurch gef=C3=A4hrdet wer=
den d=C3=BCrfen, dass ein Schutzgegenstand =C3=BCber das gesetzlich zul=C3=
=A4ssige Ma=C3=9F hinaus beeintr=C3=A4chtigt wird.
+
+5. Gew=C3=A4hrleistung. Sofern dies von den Vertragsparteien nicht anderwe=
itig schriftlich vereinbart,, bietet der Lizenzgeber keine Gew=C3=A4hrleist=
ung f=C3=BCr die erteilten Rechte, au=C3=9Fer f=C3=BCr den Fall, dass M=C3=
=A4ngel arglistig verschwiegen wurden. F=C3=BCr M=C3=A4ngel anderer Art, in=
sbesondere bei der mangelhaften Lieferung von Verk=C3=B6rperungen des Schut=
zgegenstandes, richtet sich die Gew=C3=A4hrleistung nach der Regelung, die =
die Person, die Ihnen den Schutzgegenstand zur Verf=C3=BCgung stellt, mit I=
hnen au=C3=9Ferhalb dieser Lizenz vereinbart, oder - wenn eine solche Regel=
ung nicht getroffen wurde - nach den gesetzlichen Vorschriften.
+
+6. Haftung. =C3=9Cber die in Ziffer 5 genannte Gew=C3=A4hrleistung hinaus =
haftet Ihnen der Lizenzgeber nur f=C3=BCr Vorsatz und grobe Fahrl=C3=A4ssig=
keit.
+
+7. Vertragsende
+
+      a. Dieser Lizenzvertrag und die durch ihn einger=C3=A4umten Nutzungs=
rechte enden automatisch bei jeder Verletzung der Vertragsbedingungen durch=
 Sie. F=C3=BCr nat=C3=BCrliche und juristische Personen, die von Ihnen eine=
 Bearbeitung, eine Datenbank oder ein Sammelwerk unter diesen Lizenzbedingu=
ngen erhalten haben, gilt die Lizenz jedoch weiter, vorausgesetzt, diese na=
t=C3=BCrlichen oder juristischen Personen erf=C3=BCllen s=C3=A4mtliche Vert=
ragsbedingungen. Die Ziffern 1, 2, 5, 6, 7 und 8 gelten bei einer Vertragsb=
eendigung fort.
+
+      b. Unter den oben genannten Bedingungen  erfolgt die Lizenz auf unbe=
grenzte Zeit (f=C3=BCr die Dauer des Schutzrechts). Dennoch beh=C3=A4lt sic=
h der Lizenzgeber das Recht vor, den Schutzgegenstand unter anderen Lizenzb=
edingungen zu nutzen oder die eigene Weitergabe des Schutzgegenstandes jede=
rzeit zu beenden, vorausgesetzt, dass solche Handlungen nicht dem Widerruf =
dieser Lizenz dienen (oder jeder anderen Lizenzierung, die auf Grundlage di=
eser Lizenz erfolgt ist oder erfolgen muss) und diese Lizenz wirksam bleibt=
, bis Sie unter den oben genannten Voraussetzungen endet.
+
+8. Schlussbestimmungen
+
+      a. Jedes Mal, wenn Sie den Schutzgegenstand vervielf=C3=A4ltigen, ve=
rbreiten oder =C3=B6ffentlich wiedergeben, bietet der Lizenzgeber dem Erwer=
ber eine Lizenz f=C3=BCr den Schutzgegenstand unter denselben Vertragsbedin=
gungen an, unter denen er Ihnen die Lizenz einger=C3=A4umt hat.
+
+      b. Jedes Mal, wenn Sie eine Bearbeitung vervielf=C3=A4ltigen, verbre=
iten oder =C3=B6ffentlich wiedergeben, bietet der Lizenzgeber dem Erwerber =
eine Lizenz f=C3=BCr den urspr=C3=BCnglichen Schutzgegenstand unter denselb=
en Vertragsbedingungen an, unter denen er Ihnen die Lizenz einger=C3=A4umt =
hat.
+
+      c. Sollte eine Bestimmung dieses Lizenzvertrages unwirksam sein, so =
wird die Wirksamkeit der =C3=BCbrigen Lizenzbestimmungen dadurch nicht ber=
=C3=BChrt, und an die Stelle der unwirksamen Bestimmung tritt eine Ersatzre=
gelung, die dem mit der unwirksamen Bestimmung angestrebten Zweck am n=C3=
=A4chsten kommt.
+
+      d. Nichts soll dahingehend ausgelegt werden, dass auf eine Bestimmun=
g dieses Lizenzvertrages verzichtet oder einer Vertragsverletzung zugestimm=
t wird, so lange ein solcher Verzicht oder eine solche Zustimmung nicht sch=
riftlich vorliegen und von der verzichtenden oder zustimmenden Vertragspart=
ei unterschrieben sind
+
+      e. Dieser Lizenzvertrag stellt die vollst=C3=A4ndige Vereinbarung zw=
ischen den Vertragsparteien hinsichtlich des Schutzgegenstandes dar. Es gib=
t keine weiteren erg=C3=A4nzenden Vereinbarungen oder m=C3=BCndlichen Abred=
en im Hinblick auf den Schutzgegenstand. Der Lizenzgeber ist an keine zus=
=C3=A4tzlichen Abreden gebunden, die aus irgendeiner Absprache mit Ihnen en=
tstehen k=C3=B6nnten. Der Lizenzvertrag kann nicht ohne eine =C3=BCbereinst=
immende schriftliche Vereinbarung zwischen dem Lizenzgeber und Ihnen abge=
=C3=A4ndert werden.
+
+      f. Auf diesen Lizenzvertrag findet das Recht der Bundesrepublik Deut=
schland Anwendung.
+
+CREATIVE COMMONS IST KEINE VERTRAGSPARTEI DIESES LIZENZVERTRAGES UND =C3=
=9CBERNIMMT KEINERLEI GEW=C3=84HRLEISTUNG F=C3=9CR DAS WERK. CREATIVE COMMO=
NS IST IHNEN ODER DRITTEN GEGEN=C3=9CBER NICHT HAFTBAR F=C3=9CR SCH=C3=84DE=
N JEDWEDER ART. UNGEACHTET DER VORSTEHENDEN ZWEI (2) S=C3=84TZE HAT CREATIV=
E COMMONS ALL RECHTE UND PFLICHTEN EINES LIZENSGEBERS, WENN SICH CREATIVE C=
OMMONS AUSDR=C3=9CCKLICH ALS LIZENZGEBER BEZEICHNET.
+
+AUSSER F=C3=9CR DEN BESCHR=C3=84NKTEN ZWECK EINES HINWEISES AN DIE =C3=96F=
FENTLICHKEIT, DASS DAS WERK UNTER DER CCPL LIZENSIERT WIRD, DARF KENIE VERT=
RAGSPARTEI DIE MARKE =E2=80=9CCREATIVE COMMONS=E2=80=9D ODER EINE =C3=84HNL=
ICHE MARKE ODER DAS LOGO VON CREATIVE COMMONS OHNE VORHERIGE GENEHMIGUNG VO=
N CREATIVE COMMONS NUTZEN. JEDE GESTATTETE NUTZUNG HAT IN =C3=9CBREEINSTIMM=
UNG MIT DEN JEWEILS G=C3=9CLTIGEN NUTZUNGSBEDINGUNGEN F=C3=9CR MARKEN VON C=
REATIVE COMMONS ZU ERFOLGEN, WIE SIE AUF DER WEBSITE ODER IN ANDERER WEISE =
AUF ANFRAGE VON ZEIT ZU ZEIT ZUG=C3=84NGLICH GEMACHT WERDEN.
+
+CREATIVE COMMONS KANN UNTER https://creativecommons.org KONTAKTIERT WERDEN.
diff --git a/meta/files/common-licenses/CC-BY-SA-3.0-IGO b/meta/files/commo=
n-licenses/CC-BY-SA-3.0-IGO
new file mode 100644
index 00000000000..2b8b0f8f233
--- /dev/null
+++ b/meta/files/common-licenses/CC-BY-SA-3.0-IGO
@@ -0,0 +1,107 @@
+Creative Commons Attribution-ShareAlike 3.0 IGO
+
+CREATIVE COMMONS CORPORATION IS NOT A LAW FIRM AND DOES NOT PROVIDE LEGAL =
SERVICES. DISTRIBUTION OF THIS LICENSE DOES NOT CREATE AN ATTORNEY-CLIENT R=
ELATIONSHIP. CREATIVE COMMONS PROVIDES THIS INFORMATION ON AN "AS-IS" BASIS=
. CREATIVE COMMONS MAKES NO WARRANTIES REGARDING THE INFORMATION PROVIDED, =
AND DISCLAIMS LIABILITY FOR DAMAGES RESULTING FROM ITS USE. THE LICENSOR IS=
 NOT NECESSARILY AN INTERGOVERNMENTAL ORGANIZATION (IGO), AS DEFINED IN THE=
 LICENSE BELOW.=20
+
+License
+
+THE WORK (AS DEFINED BELOW) IS PROVIDED UNDER THE TERMS OF THIS CREATIVE C=
OMMONS PUBLIC LICENSE ("LICENSE"). THE LICENSOR (DEFINED BELOW) HOLDS COPYR=
IGHT AND OTHER RIGHTS IN THE WORK. ANY USE OF THE WORK OTHER THAN AS AUTHOR=
IZED UNDER THIS LICENSE IS PROHIBITED.
+
+BY EXERCISING ANY RIGHTS TO THE WORK PROVIDED HERE, YOU ACCEPT AND AGREE T=
O BE BOUND BY THE TERMS OF THIS LICENSE. THE LICENSOR GRANTS YOU THE RIGHTS=
 CONTAINED HERE IN CONSIDERATION FOR YOUR ACCEPTANCE AND AGREEMENT TO THE T=
ERMS OF THE LICENSE.
+
+1. Definitions
+
+    a. "IGO" means, solely and exclusively for purposes of this License, a=
n organization established by a treaty or other instrument governed by inte=
rnational law and possessing its own international legal personality. Other=
 organizations established to carry out activities across national borders =
and that accordingly enjoy immunity from legal process are also IGOs for th=
e sole and exclusive purposes of this License. IGOs may include as members,=
 in addition to states, other entities.
+
+    b. "Work" means the literary and/or artistic work eligible for copyrig=
ht protection, whatever may be the mode or form of its expression including=
 digital form, and offered under the terms of this License. It is understoo=
d that a database, which by reason of the selection and arrangement of its =
contents constitutes an intellectual creation, is considered a Work.
+
+    c. "Licensor" means the individual, individuals, entity or entities th=
at offer(s) the Work under the terms of this License and may be, but is not=
 necessarily, an IGO.
+
+    d. "You" means an individual or entity exercising rights under this Li=
cense.
+
+    e. "License Elements" means the following high-level license attribute=
s as selected by the Licensor and indicated in the title of this License: A=
ttribution, ShareAlike.
+
+    f. "Reproduce" means to make a copy of the Work in any manner or form,=
 and by any means.
+
+    g. "Distribute" means the activity of making publicly available the Wo=
rk or Adaptation (or copies of the Work or Adaptation), as applicable, by s=
ale, rental, public lending or any other known form of transfer of ownershi=
p or possession of the Work or copy of the Work.
+=09
+    h. "Publicly Perform" means to perform public recitations of the Work =
and to communicate to the public those public recitations, by any means or =
process, including by wire or wireless means or public digital performances=
; to make available to the public Works in such a way that members of the p=
ublic may access these Works from a place and at a place individually chose=
n by them; to perform the Work to the public by any means or process and th=
e communication to the public of the performances of the Work, including by=
 public digital performance; to broadcast and rebroadcast the Work by any m=
eans including signs, sounds or images.
+
+    i. "Adaptation" means a work derived from or based upon the Work, or u=
pon the Work and other pre-existing works. Adaptations may include works su=
ch as translations, derivative works, or any alterations and arrangements o=
f any kind involving the Work. For purposes of this License, where the Work=
 is a musical work, performance, or phonogram, the synchronization of the W=
ork in timed-relation with a moving image is an Adaptation. For the avoidan=
ce of doubt, including the Work in a Collection is not an Adaptation.
+
+    j. "Collection" means a collection of literary or artistic works or ot=
her works or subject matter other than works listed in Section 1(b) which b=
y reason of the selection and arrangement of their contents, constitute int=
ellectual creations, in which the Work is included in its entirety in unmod=
ified form along with one or more other contributions, each constituting se=
parate and independent works in themselves, which together are assembled in=
to a collective whole. For the avoidance of doubt, a Collection will not be=
 considered as an Adaptation.
+
+    k. "Creative Commons Compatible License" means a license that is liste=
d at https://creativecommons.org/compatiblelicenses that has been approved =
by Creative Commons as being essentially equivalent to this License, includ=
ing, at a minimum, because that license: (i) contains terms that have the s=
ame purpose, meaning and effect as the License Elements of this License; an=
d, (ii) explicitly permits the relicensing of adaptations of works made ava=
ilable under that license under this License or a Creative Commons jurisdic=
tion license with the same License Elements as this License.
+
+2. Scope of this License. Nothing in this License is intended to reduce, l=
imit, or restrict any uses free from copyright protection.
+
+3. License Grant. Subject to the terms and conditions of this License, the=
 Licensor hereby grants You a worldwide, royalty-free, non-exclusive licens=
e to exercise the rights in the Work as follows:
+
+    a. to Reproduce, Distribute and Publicly Perform the Work, to incorpor=
ate the Work into one or more Collections, and to Reproduce, Distribute and=
 Publicly Perform the Work as incorporated in the Collections; and,
+
+    b. to create, Reproduce, Distribute and Publicly Perform Adaptations, =
provided that You clearly label, demarcate or otherwise identify that chang=
es were made to the original Work.
+
+    c. For the avoidance of doubt:
+
+        i. Non-waivable Compulsory License Schemes. In those jurisdictions=
 in which the right to collect royalties through any statutory or compulsor=
y licensing scheme cannot be waived, the Licensor reserves the exclusive ri=
ght to collect such royalties for any exercise by You of the rights granted=
 under this License;
+
+        ii. Waivable Compulsory License Schemes. In those jurisdictions in=
 which the right to collect royalties through any statutory or compulsory l=
icensing scheme can be waived, the Licensor waives the exclusive right to c=
ollect such royalties for any exercise by You of the rights granted under t=
his License; and,
+
+        ii. Voluntary License Schemes. To the extent possible, the Licenso=
r waives the right to collect royalties from You for the exercise of the Li=
censed Rights, whether directly or through a collecting society under any v=
oluntary licensing scheme.
+
+This License lasts for the duration of the term of the copyright in the Wo=
rk licensed by the Licensor. The above rights may be exercised in all media=
 and formats whether now known or hereafter devised. The above rights inclu=
de the right to make such modifications as are technically necessary to exe=
rcise the rights in other media and formats. All rights not expressly grant=
ed by the Licensor are hereby reserved.
+
+4. Restrictions. The license granted in Section 3 above is expressly made =
subject to and limited by the following restrictions:
+
+    a. You may Distribute or Publicly Perform the Work only under the term=
s of this License. You must include a copy of, or the Uniform Resource Iden=
tifier (URI) for, this License with every copy of the Work You Distribute o=
r Publicly Perform. You may not offer or impose any terms on the Work that =
restrict the terms of this License or the ability of the recipient of the W=
ork to exercise the rights granted to that recipient under the terms of the=
 License. You may not sublicense the Work (see section 8(a)). You must keep=
 intact all notices that refer to this License and to the disclaimer of war=
ranties with every copy of the Work You Distribute or Publicly Perform. Whe=
n You Distribute or Publicly Perform the Work, You may not impose any effec=
tive technological measures on the Work that restrict the ability of a reci=
pient of the Work from You to exercise the rights granted to that recipient=
 under the terms of the License. This Section 4(a) applies to the Work as i=
ncorporated in a Collection, but this does not require the Collection apart=
 from the Work itself to be made subject to the terms of this License. If Y=
ou create a Collection, upon notice from a Licensor You must, to the extent=
 practicable, remove from the Collection any credit (inclusive of any logo,=
 trademark, official mark or official emblem) as required by Section 4(c), =
as requested. If You create an Adaptation, upon notice from a Licensor You =
must, to the extent practicable, remove from the Adaptation any credit (inc=
lusive of any logo, trademark, official mark or official emblem) as require=
d by Section 4(c), as requested.
+
+    b. You may Distribute or Publicly Perform an Adaptation only under the=
 terms of: (i) this License; (ii) a later version of this License with the =
same License Elements as this License; (iii) either the unported Creative C=
ommons license or a ported Creative Commons license (either this or a later=
 license version) containing the same License Elements; or (iv) a Creative =
Commons Compatible License. If You license the Adaptation under one of the =
licenses mentioned in (iv), You must comply with the terms of that license.=
 If you license the Adaptation under the terms of any of the licenses menti=
oned in (i), (ii) or (iii) (the "Applicable License"), You must comply with=
 terms of the Applicable License generally and the following provisions: (I=
) You must include a copy of, or the URI for, the Applicable License with e=
very copy of each Adaptation You Distribute or Publicly Perform. (II) You m=
ay not offer or impose any terms on the Adaptation that restrict the terms =
of the Applicable License or the ability of the recipient of the Adaptation=
 to exercise the rights granted to that recipient under the terms of the Ap=
plicable License. (III) You must keep intact all notices that refer to this=
 License and to the disclaimer of warranties with every copy of the Work as=
 included in the Adaptation You Distribute or Publicly Perform. (IV) When Y=
ou Distribute or Publicly Perform the Adaptation, You may not impose any ef=
fective technological measures on the Adaptation that restrict the ability =
of a recipient of the Adaptation from You to exercise the rights granted to=
 that recipient under the terms of the Applicable License. This Section 4(b=
) applies to the Adaptation as incorporated in a Collection, but this does =
not require the Collection apart from the Adaptation itself to be made subj=
ect to the terms of the Applicable License.
+
+    c. If You Distribute, or Publicly Perform the Work or any Adaptations =
or Collections, You must, unless a request has been made pursuant to Sectio=
n 4(a), keep intact all copyright notices for the Work and provide, reasona=
ble to the medium or means You are utilizing: (i) any attributions that the=
 Licensor indicates be associated with the Work as indicated in a copyright=
 notice, (ii) the title of the Work if supplied; (iii) to the extent reason=
ably practicable, the URI, if any, that the Licensor specifies to be associ=
ated with the Work, unless such URI does not refer to the copyright notice =
or licensing information for the Work; and, (iv) consistent with Section 3(=
b), in the case of an Adaptation, a credit identifying the use of the Work =
in the Adaptation. The credit required by this Section 4(c) may be implemen=
ted in any reasonable manner; provided, however, that in the case of an Ada=
ptation or Collection, at a minimum such credit will appear, if a credit fo=
r all contributors to the Adaptation or Collection appears, then as part of=
 these credits and in a manner at least as prominent as the credits for the=
 other contributors. For the avoidance of doubt, You may only use the credi=
t required by this Section for the purpose of attribution in the manner set=
 out above and, by exercising Your rights under this License, You may not i=
mplicitly or explicitly assert or imply any connection with, sponsorship or=
 endorsement by the Licensor or others designated for attribution, of You o=
r Your use of the Work, without the separate, express prior written permiss=
ion of the Licensor or such others.
+
+    d. Except as otherwise agreed in writing by the Licensor, if You Repro=
duce, Distribute or Publicly Perform the Work either by itself or as part o=
f any Adaptations or Collections, You must not distort, mutilate, modify or=
 take other derogatory action in relation to the Work which would be prejud=
icial to the honor or reputation of the Licensor where moral rights apply.
+
+5. Representations, Warranties and Disclaimer
+
+THE LICENSOR OFFERS THE WORK AS-IS AND MAKES NO REPRESENTATIONS OR WARRANT=
IES OF ANY KIND CONCERNING THE WORK, EXPRESS, IMPLIED, STATUTORY OR OTHERWI=
SE, INCLUDING, WITHOUT LIMITATION, WARRANTIES OF TITLE, MERCHANTABILITY, FI=
TNESS FOR A PARTICULAR PURPOSE, NONINFRINGEMENT, OR THE ABSENCE OF LATENT O=
R OTHER DEFECTS, ACCURACY, OR THE PRESENCE OF ERRORS, WHETHER OR NOT DISCOV=
ERABLE.
+
+6. Limitation on Liability
+
+IN NO EVENT WILL THE LICENSOR BE LIABLE TO YOU ON ANY LEGAL THEORY FOR ANY=
 SPECIAL, INCIDENTAL, CONSEQUENTIAL, PUNITIVE OR EXEMPLARY DAMAGES ARISING =
OUT OF THIS LICENSE OR THE USE OF THE WORK, EVEN IF THE LICENSOR HAS BEEN A=
DVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+
+7. Termination
+
+    a. Subject to the terms and conditions set forth in this License, the =
license granted here lasts for the duration of the term of the copyright in=
 the Work licensed by the Licensor as stated in Section 3. Notwithstanding =
the above, the Licensor reserves the right to release the Work under differ=
ent license terms or to stop distributing the Work at any time; provided, h=
owever that any such election will not serve to withdraw this License (or a=
ny other license that has been, or is required to be, granted under the ter=
ms of this License), and this License will continue in full force and effec=
t unless terminated as stated below.
+
+    b. If You fail to comply with this License, then this License and the =
rights granted hereunder will terminate automatically upon any breach by Yo=
u of the terms of this License. Individuals or entities who have received A=
daptations or Collections from You under this License, however, will not ha=
ve their licenses terminated provided such individuals or entities remain i=
n full compliance with those licenses. Sections 1, 2, 5, 6, 7, and 8 will s=
urvive any termination of this License. Notwithstanding the foregoing, this=
 License reinstates automatically as of the date the violation is cured, pr=
ovided it is cured within 30 days of You discovering the violation, or upon=
 express reinstatement by the Licensor. For the avoidance of doubt, this Se=
ction 7(b) does not affect any rights the Licensor may have to seek remedie=
s for violations of this License by You.
+
+8. Miscellaneous
+
+    a. Each time You Distribute or Publicly Perform the Work or a Collecti=
on, the Licensor offers to the recipient a license to the Work on the same =
terms and conditions as the license granted to You under this License.
+
+    b. Each time You Distribute or Publicly Perform an Adaptation, the Lic=
ensor offers to the recipient a license to the original Work on the same te=
rms and conditions as the license granted to You under this License.
+=09
+    c. If any provision of this License is invalid or unenforceable, it sh=
all not affect the validity or enforceability of the remainder of the terms=
 of this License, and without further action, such provision shall be refor=
med to the minimum extent necessary to make such provision valid and enforc=
eable.
+=09
+    d. No term or provision of this License shall be deemed waived and no =
breach consented to unless such waiver or consent shall be in writing and s=
igned by the Licensor.
+
+    e. This License constitutes the entire agreement between You and the L=
icensor with respect to the Work licensed here. There are no understandings=
, agreements or representations with respect to the Work not specified here=
. The Licensor shall not be bound by any additional provisions that may app=
ear in any communication from You. This License may not be modified without=
 the mutual written agreement of the Licensor and You.
+
+    f. The rights granted under, and the subject matter referenced, in thi=
s License were drafted utilizing the terminology of the Berne Convention fo=
r the Protection of Literary and Artistic Works (as amended on September 28=
, 1979), the Rome Convention of 1961, the WIPO Copyright Treaty of 1996, th=
e WIPO Performances and Phonograms Treaty of 1996 and the Universal Copyrig=
ht Convention (as revised on July 24, 1971). Interpretation of the scope of=
 the rights granted by the Licensor and the conditions imposed on You under=
 this License, this License, and the rights and conditions set forth herein=
 shall be made with reference to copyright as determined in accordance with=
 general principles of international law, including the above mentioned con=
ventions.
+
+    g. Nothing in this License constitutes or may be interpreted as a limi=
tation upon or waiver of any privileges and immunities that may apply to th=
e Licensor or You, including immunity from the legal processes of any juris=
diction, national court or other authority.
+
+    h. Where the Licensor is an IGO, any and all disputes arising under th=
is License that cannot be settled amicably shall be resolved in accordance =
with the following procedure:
+
+        i. Pursuant to a notice of mediation communicated by reasonable me=
ans by either You or the Licensor to the other, the dispute shall be submit=
ted to non-binding mediation conducted in accordance with rules designated =
by the Licensor in the copyright notice published with the Work, or if none=
 then in accordance with those communicated in the notice of mediation. The=
 language used in the mediation proceedings shall be English unless otherwi=
se agreed.
+
+        ii. If any such dispute has not been settled within 45 days follow=
ing the date on which the notice of mediation is provided, either You or th=
e Licensor may, pursuant to a notice of arbitration communicated by reasona=
ble means to the other, elect to have the dispute referred to and finally d=
etermined by arbitration. The arbitration shall be conducted in accordance =
with the rules designated by the Licensor in the copyright notice published=
 with the Work, or if none then in accordance with the UNCITRAL Arbitration=
 Rules as then in force. The arbitral tribunal shall consist of a sole arbi=
trator and the language of the proceedings shall be English unless otherwis=
e agreed. The place of arbitration shall be where the Licensor has its head=
quarters. The arbitral proceedings shall be conducted remotely (e.g., via t=
elephone conference or written submissions) whenever practicable.
+
+        iii. Interpretation of this License in any dispute submitted to me=
diation or arbitration shall be as set forth in Section 8(f), above.
+
+Creative Commons Notice
+
+Creative Commons is not a party to this License, and makes no warranty wha=
tsoever in connection with the Work. Creative Commons will not be liable to=
 You or any party on any legal theory for any damages whatsoever, including=
 without limitation any general, special, incidental or consequential damag=
es arising in connection to this license. Notwithstanding the foregoing two=
 (2) sentences, if Creative Commons has expressly identified itself as the =
Licensor hereunder, it shall have all rights and obligations of the Licenso=
r.
+
+Except for the limited purpose of indicating to the public that the Work i=
s licensed under the CCPL, Creative Commons does not authorize the use by e=
ither party of the trademark "Creative Commons" or any related trademark or=
 logo of Creative Commons without the prior written consent of Creative Com=
mons. Any permitted use will be in compliance with Creative Commons' then-c=
urrent trademark usage guidelines, as may be published on its website or ot=
herwise made available upon request from time to time. For the avoidance of=
 doubt, this trademark restriction does not form part of this License.
+
+Creative Commons may be contacted at https://creativecommons.org/.
diff --git a/meta/files/common-licenses/CFITSIO b/meta/files/common-license=
s/CFITSIO
new file mode 100644
index 00000000000..f2c50205726
--- /dev/null
+++ b/meta/files/common-licenses/CFITSIO
@@ -0,0 +1,7 @@
+Copyright (Unpublished-all rights reserved under the copyright laws of the=
 United States), U.S. Government as represented by the Administrator of the=
 National Aeronautics and Space Administration. No copyright is claimed in =
the United States under Title 17, U.S. Code.
+
+Permission to freely use, copy, modify, and distribute this software and i=
ts documentation without fee is hereby granted, provided that this copyrigh=
t notice and disclaimer of warranty appears in all copies.
+
+DISCLAIMER:
+
+THE SOFTWARE IS PROVIDED 'AS IS' WITHOUT ANY WARRANTY OF ANY KIND, EITHER =
EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, ANY WARRAN=
TY THAT THE SOFTWARE WILL CONFORM TO SPECIFICATIONS, ANY IMPLIED WARRANTIES=
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND FREEDOM FROM INF=
RINGEMENT, AND ANY WARRANTY THAT THE DOCUMENTATION WILL CONFORM TO THE SOFT=
WARE, OR ANY WARRANTY THAT THE SOFTWARE WILL BE ERROR FREE. IN NO EVENT SHA=
LL NASA BE LIABLE FOR ANY DAMAGES, INCLUDING, BUT NOT LIMITED TO, DIRECT, I=
NDIRECT, SPECIAL OR CONSEQUENTIAL DAMAGES, ARISING OUT OF, RESULTING FROM, =
OR IN ANY WAY CONNECTED WITH THIS SOFTWARE, WHETHER OR NOT BASED UPON WARRA=
NTY, CONTRACT, TORT , OR OTHERWISE, WHETHER OR NOT INJURY WAS SUSTAINED BY =
PERSONS OR PROPERTY OR OTHERWISE, AND WHETHER OR NOT LOSS WAS SUSTAINED FRO=
M, OR AROSE OUT OF THE RESULTS OF, OR USE OF, THE SOFTWARE OR SERVICES PROV=
IDED HEREUNDER."
diff --git a/meta/files/common-licenses/CMU-Mach b/meta/files/common-licens=
es/CMU-Mach
new file mode 100644
index 00000000000..1bb895d4eca
--- /dev/null
+++ b/meta/files/common-licenses/CMU-Mach
@@ -0,0 +1,22 @@
+Copyright (c) 1991,1990,1989 Carnegie Mellon University
+All Rights Reserved.
+
+Permission to use, copy, modify and distribute this software and its
+documentation is hereby granted, provided that both the copyright
+notice and this permission notice appear in all copies of the
+software, derivative works or modified versions, and any portions
+thereof, and that both notices appear in supporting documentation.
+
+CARNEGIE MELLON ALLOWS FREE USE OF THIS SOFTWARE IN ITS "AS IS"
+CONDITION.  CARNEGIE MELLON DISCLAIMS ANY LIABILITY OF ANY KIND FOR
+ANY DAMAGES WHATSOEVER RESULTING FROM THE USE OF THIS SOFTWARE.
+
+Carnegie Mellon requests users of this software to return to
+
+ Software Distribution Coordinator  or  Software.Distribution@CS.CMU.EDU
+ School of Computer Science
+ Carnegie Mellon University
+ Pittsburgh PA 15213-3890
+
+any improvements or extensions that they make and grant Carnegie Mellon
+the rights to redistribute these changes.
diff --git a/meta/files/common-licenses/CMU-Mach-nodoc b/meta/files/common-=
licenses/CMU-Mach-nodoc
new file mode 100644
index 00000000000..c81d74fee71
--- /dev/null
+++ b/meta/files/common-licenses/CMU-Mach-nodoc
@@ -0,0 +1,11 @@
+Copyright (C) 2002 Naval Research Laboratory (NRL/CCS)
+
+Permission to use, copy, modify and distribute this software and
+its documentation is hereby granted, provided that both the
+copyright notice and this permission notice appear in all copies of
+the software, derivative works or modified versions, and any
+portions thereof.
+
+NRL ALLOWS FREE USE OF THIS SOFTWARE IN ITS "AS IS" CONDITION AND
+DISCLAIMS ANY LIABILITY OF ANY KIND FOR ANY DAMAGES WHATSOEVER
+RESULTING FROM THE USE OF THIS SOFTWARE.
diff --git a/meta/files/common-licenses/COIL-1.0 b/meta/files/common-licens=
es/COIL-1.0
new file mode 100644
index 00000000000..c24c539e318
--- /dev/null
+++ b/meta/files/common-licenses/COIL-1.0
@@ -0,0 +1,30 @@
+# Copyfree Open Innovation License
+
+This is version 1.0 of the Copyfree Open Innovation License.
+
+## Terms and Conditions
+
+Redistributions, modified or unmodified, in whole or in part, must retain
+applicable notices of copyright or other legal privilege, these conditions=
, and
+the following license terms and disclaimer.  Subject to these conditions, =
each
+holder of copyright or other legal privileges, author or assembler, and
+contributor of this work, henceforth "licensor", hereby grants to any pers=
on
+who obtains a copy of this work in any form:
+
+1. Permission to reproduce, modify, distribute, publish, sell, sublicense,=
 use,
+and/or otherwise deal in the licensed material without restriction.
+
+2. A perpetual, worldwide, non-exclusive, royalty-free, gratis, irrevocable
+patent license to make, have made, provide, transfer, import, use, and/or
+otherwise deal in the licensed material without restriction, for any and a=
ll
+patents held by such licensor and necessarily infringed by the form of the=
 work
+upon distribution of that licensor's contribution to the work under the te=
rms
+of this license.
+
+NO WARRANTY OF ANY KIND IS IMPLIED BY, OR SHOULD BE INFERRED FROM, THIS LI=
CENSE
+OR THE ACT OF DISTRIBUTION UNDER THE TERMS OF THIS LICENSE, INCLUDING BUT =
NOT
+LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PUR=
POSE,
+AND NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS, ASSEMBLERS, OR HOLDER=
S OF
+COPYRIGHT OR OTHER LEGAL PRIVILEGE BE LIABLE FOR ANY CLAIM, DAMAGES, OR OT=
HER
+LIABILITY, WHETHER IN ACTION OF CONTRACT, TORT, OR OTHERWISE ARISING FROM,=
 OUT
+OF, OR IN CONNECTION WITH THE WORK OR THE USE OF OR OTHER DEALINGS IN THE =
WORK.
diff --git a/meta/files/common-licenses/Caldera-no-preamble b/meta/files/co=
mmon-licenses/Caldera-no-preamble
new file mode 100644
index 00000000000..f70f34b32b7
--- /dev/null
+++ b/meta/files/common-licenses/Caldera-no-preamble
@@ -0,0 +1,35 @@
+Copyright(C) Caldera International Inc.  2001-2002.  All rights reserved.
+=20=20
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions are
+met:
+
+Redistributions of source code and documentation must retain the above
+copyright notice, this list of conditions and the following disclaimer.
+
+Redistributions in binary form must reproduce the above copyright
+notice, this list of conditions and the following disclaimer in the
+documentation and/or other materials provided with the distribution.
+
+All advertising materials mentioning features or use of this software
+must display the following acknowledgement:
+
+   This product includes software developed or owned by  Caldera
+   International, Inc.
+
+Neither the name of Caldera International, Inc. nor the names of other
+contributors may be used to endorse or promote products derived from
+this software without specific prior written permission.
+
+USE OF THE SOFTWARE PROVIDED FOR UNDER THIS LICENSE BY CALDERA
+INTERNATIONAL, INC. AND CONTRIBUTORS ``AS IS'' AND ANY EXPRESS OR IMPLIED
+WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN
+NO EVENT SHALL CALDERA INTERNATIONAL, INC. BE LIABLE FOR ANY DIRECT,
+INDIRECT INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
+SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
+STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
+ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/Catharon b/meta/files/common-licens=
es/Catharon
new file mode 100644
index 00000000000..8d0ac128bc7
--- /dev/null
+++ b/meta/files/common-licenses/Catharon
@@ -0,0 +1,121 @@
+                  The Catharon Open Source LICENSE
+                    ----------------------------
+
+                            2000-Jul-04
+
+          Copyright (C) 2000 by Catharon Productions, Inc.
+
+
+
+Introduction
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+  This  license  applies to  source  files  distributed by  Catharon
+  Productions,  Inc.  in  several  archive packages.   This  license
+  applies  to all files  found in  such packages  which do  not fall
+  under their own explicit license.
+
+  This  license   was  inspired  by  the  BSD,   Artistic,  and  IJG
+  (Independent JPEG  Group) licenses, which  all encourage inclusion
+  and  use of  free  software in  commercial  and freeware  products
+  alike.  As a consequence, its main points are that:
+
+    o We  don't promise that  this software works.  However,  we are
+      interested in any kind of bug reports. (`as is' distribution)
+
+    o You can  use this software for whatever you  want, in parts or
+      full form, without having to pay us. (`royalty-free' usage)
+
+    o You may not pretend that  you wrote this software.  If you use
+      it, or  only parts of it,  in a program,  you must acknowledge
+      somewhere  in  your  documentation  that  you  have  used  the
+      Catharon Code. (`credits')
+
+  We  specifically  permit  and  encourage  the  inclusion  of  this
+  software, with  or without modifications,  in commercial products.
+  We disclaim  all warranties  covering the packages  distributed by
+  Catharon  Productions, Inc.  and  assume no  liability related  to
+  their use.
+
+
+Legal Terms
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+0. Definitions
+--------------
+
+  Throughout this license,  the terms `Catharon Package', `package',
+  and  `Catharon  Code'  refer   to  the  set  of  files  originally
+  distributed by Catharon Productions, Inc.
+
+  `You' refers to  the licensee, or person using  the project, where
+  `using' is a generic term including compiling the project's source
+  code as  well as linking it  to form a  `program' or `executable'.
+  This  program  is referred  to  as `a  program  using  one of  the
+  Catharon Packages'.
+
+  This  license applies  to all  files distributed  in  the original
+  Catharon  Package(s),  including  all  source code,  binaries  and
+  documentation,  unless  otherwise  stated   in  the  file  in  its
+  original, unmodified form as  distributed in the original archive.
+  If you are  unsure whether or not a particular  file is covered by
+  this license, you must contact us to verify this.
+
+  The  Catharon   Packages  are  copyright  (C)   2000  by  Catharon
+  Productions, Inc.  All rights reserved except as specified below.
+
+1. No Warranty
+--------------
+
+  THE CATHARON PACKAGES ARE PROVIDED `AS IS' WITHOUT WARRANTY OF ANY
+  KIND, EITHER  EXPRESS OR IMPLIED,  INCLUDING, BUT NOT  LIMITED TO,
+  WARRANTIES  OF  MERCHANTABILITY   AND  FITNESS  FOR  A  PARTICULAR
+  PURPOSE.  IN NO EVENT WILL ANY OF THE AUTHORS OR COPYRIGHT HOLDERS
+  BE LIABLE FOR ANY DAMAGES CAUSED BY THE USE OF OR THE INABILITY TO
+  USE THE CATHARON PACKAGE.
+
+2. Redistribution
+-----------------
+
+  This  license  grants  a  worldwide, royalty-free,  perpetual  and
+  irrevocable right  and license to use,  execute, perform, compile,
+  display,  copy,   create  derivative  works   of,  distribute  and
+  sublicense the  Catharon Packages (in both source  and object code
+  forms)  and  derivative works  thereof  for  any  purpose; and  to
+  authorize others  to exercise  some or all  of the  rights granted
+  herein, subject to the following conditions:
+
+    o Redistribution  of source code  must retain this  license file
+      (`license.txt') unaltered; any additions, deletions or changes
+      to   the  original   files  must   be  clearly   indicated  in
+      accompanying  documentation.   The  copyright notices  of  the
+      unaltered, original  files must be preserved in  all copies of
+      source files.
+
+    o Redistribution  in binary form must provide  a disclaimer that
+      states  that the  software is  based in  part on  the  work of
+      Catharon Productions, Inc. in the distribution documentation.
+
+  These conditions  apply to any  software derived from or  based on
+  the Catharon Packages, not just  the unmodified files.  If you use
+  our work, you  must acknowledge us.  However, no  fee need be paid
+  to us.
+
+3. Advertising
+--------------
+
+  Neither Catharon Productions, Inc.  and contributors nor you shall
+  use  the  name  of  the  other  for  commercial,  advertising,  or
+  promotional purposes without specific prior written permission.
+
+  We suggest, but do not  require, that you use the following phrase
+  to refer to this software in your documentation: 'this software is
+  based in part on the Catharon Typography Project'.
+
+  As  you have  not signed  this license,  you are  not  required to
+  accept  it.  However,  as  the Catharon  Packages are  copyrighted
+  material, only  this license, or  another one contracted  with the
+  authors, grants you  the right to use, distribute,  and modify it.
+  Therefore,  by  using,  distributing,  or modifying  the  Catharon
+  Packages,  you indicate  that you  understand and  accept  all the
+  terms of this license.
diff --git a/meta/files/common-licenses/Clips b/meta/files/common-licenses/=
Clips
new file mode 100644
index 00000000000..ff5afdd2931
--- /dev/null
+++ b/meta/files/common-licenses/Clips
@@ -0,0 +1,15 @@
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of this software and associated documentation files (the
+"Software"), to deal in the Software without restriction, including
+without limitation the rights to use, copy, modify, merge, publish,
+distribute, and/or sell copies of the Software, and to permit persons=20
+to whom the Software is furnished to do so.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
+OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT=20
+OF THIRD PARTY RIGHTS. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
+CLAIM, OR ANY SPECIAL INDIRECT OR CONSEQUENTIAL DAMAGES, OR ANY DAMAGES
+WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN=20
+ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF=20
+OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
diff --git a/meta/files/common-licenses/Community-Spec-1.0 b/meta/files/com=
mon-licenses/Community-Spec-1.0
new file mode 100644
index 00000000000..cdf7c64c07c
--- /dev/null
+++ b/meta/files/common-licenses/Community-Spec-1.0
@@ -0,0 +1,293 @@
+Community Specification License 1.0
+
+The Purpose of this License. This License sets forth the terms under which
+1) Contributor will participate in and contribute to the development
+of specifications, standards, best practices, guidelines, and other
+similar materials under this Working Group, and 2) how the materials
+developed under this License may be used. It is not intended for source
+code. Capitalized terms are defined in the License=E2=80=99s last section.
+
+1. Copyright.
+
+1.1. Copyright License. Contributor grants everyone a non-sublicensable,
+perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable
+(except as expressly stated in this License) copyright license, without
+any obligation for accounting, to reproduce, prepare derivative works
+of, publicly display, publicly perform, and distribute any materials
+it submits to the full extent of its copyright interest in those
+materials. Contributor also acknowledges that the Working Group may
+exercise copyright rights in the Specification, including the rights to
+submit the Specification to another standards organization.
+
+1.2. Copyright Attribution. As a condition, anyone exercising this
+copyright license must include attribution to the Working Group in any
+derivative work based on materials developed by the Working Group.
+That attribution must include, at minimum, the material=E2=80=99s name,
+version number, and source from where the materials were retrieved.
+Attribution is not required for implementations of the Specification.
+
+2. Patents.
+
+2.1. Patent License.
+
+2.1.1. As a Result of Contributions.
+
+2.1.1.1. As a Result of Contributions to Draft Specifications.
+Contributor grants Licensee a non-sublicensable, perpetual, worldwide,
+non-exclusive, no-charge, royalty-free, irrevocable (except as
+expressly stated in this License) license to its Necessary Claims in 1)
+Contributor=E2=80=99s Contributions and 2) to the Draft Specification that
+is within Scope as of the date of that Contribution, in both cases for
+Licensee=E2=80=99s Implementation of the Draft Specification, except for t=
hose
+patent claims excluded by Contributor under Section 3.
+
+2.1.1.2. For Approved Specifications. Contributor grants Licensee a
+non-sublicensable, perpetual, worldwide, non-exclusive, no-charge,
+royalty-free, irrevocable (except as expressly stated in this License)
+license to its Necessary Claims included the Approved Specification
+that are within Scope for Licensee=E2=80=99s Implementation of the Approved
+Specification, except for those patent claims excluded by Contributor
+under Section 3.
+
+2.1.2. Patent Grant from Licensee. Licensee grants each other Licensee
+a non-sublicensable, perpetual, worldwide, non-exclusive, no-charge,
+royalty-free, irrevocable (except as expressly stated in this License)
+license to its Necessary Claims for its Implementation, except for those
+patent claims excluded under Section 3.
+
+2.1.3. Licensee Acceptance. The patent grants set forth in Section 2.1
+extend only to Licensees that have indicated their agreement to this
+License as follows:
+
+2.1.3.1. Source Code Distributions. For distribution in source code,
+by including this License in the root directory of the source code with
+the Implementation;
+
+2.1.3.2. Non-Source Code Distributions. For distribution in any form
+other than source code, by including this License in the documentation,
+legal notices, via notice in the software, and/or other written materials
+provided with the Implementation; or
+
+2.1.3.3. Via Notices.md. By issuing pull request or commit to the
+Specification=E2=80=99s repository=E2=80=99s Notices.md file by the Implem=
enter=E2=80=99s
+authorized representative, including the Implementer=E2=80=99s name, autho=
rized
+individual and system identifier, and Specification version.
+
+2.1.4. Defensive Termination. If any Licensee files or maintains a
+claim in a court asserting that a Necessary Claim is infringed by an
+Implementation, any licenses granted under this License to the Licensee
+are immediately terminated unless 1) that claim is directly in response
+to a claim against Licensee regarding an Implementation, or 2) that claim
+was brought to enforce the terms of this License, including intervention
+in a third-party action by a Licensee.
+
+2.1.5. Additional Conditions. This License is not an assurance (i)
+that any of Contributor=E2=80=99s copyrights or issued patent claims cover
+an Implementation of the Specification or are enforceable or (ii) that
+an Implementation of the Specification would not infringe intellectual
+property rights of any third party.
+
+2.2. Patent Licensing Commitment. In addition to the rights granted
+in Section 2.1, Contributor agrees to grant everyone a no charge,
+royalty-free license on reasonable and non-discriminatory terms
+to Contributor=E2=80=99s Necessary Claims that are within Scope for:
+1) Implementations of a Draft Specification, where such license
+applies only to those Necessary Claims infringed by implementing
+Contributor's Contribution(s) included in that Draft Specification,
+and 2) Implementations of the Approved Specification.
+
+This patent licensing commitment does not apply to those claims subject
+to Contributor=E2=80=99s Exclusion Notice under Section 3.
+
+2.3. Effect of Withdrawal. Contributor may withdraw from the Working Group
+by issuing a pull request or commit providing notice of withdrawal to
+the Working Group repository=E2=80=99s Notices.md file. All of Contributor=
=E2=80=99s
+existing commitments and obligations with respect to the Working Group
+up to the date of that withdrawal notice will remain in effect, but no
+new obligations will be incurred.
+
+2.4. Binding Encumbrance. This License is binding on any future owner,
+assignee, or party who has been given the right to enforce any Necessary
+Claims against third parties.
+
+3. Patent Exclusion.
+
+3.1. As a Result of Contributions. Contributor may exclude Necessary
+Claims from its licensing commitments incurred under Section 2.1.1
+by issuing an Exclusion Notice within 45 days of the date of that
+Contribution. Contributor may not issue an Exclusion Notice for any
+material that has been included in a Draft Deliverable for more than 45
+days prior to the date of that Contribution.
+
+3.2. As a Result of a Draft Specification Becoming an Approved
+Specification. Prior to the adoption of a Draft Specification as an
+Approved Specification, Contributor may exclude Necessary Claims from
+its licensing commitments under this Agreement by issuing an Exclusion
+Notice. Contributor may not issue an Exclusion Notice for patents that
+were eligible to have been excluded pursuant to Section 3.1.
+
+4. Source Code License. Any source code developed by the Working Group is
+solely subject the source code license included in the Working Group=E2=80=
=99s
+repository for that code. If no source code license is included, the
+source code will be subject to the MIT License.
+
+5. No Other Rights. Except as specifically set forth in this License, no
+other express or implied patent, trademark, copyright, or other rights are
+granted under this License, including by implication, waiver, or estoppel.
+
+6. Antitrust Compliance. Contributor acknowledge that it may compete
+with other participants in various lines of business and that it is
+therefore imperative that they and their respective representatives
+act in a manner that does not violate any applicable antitrust laws and
+regulations. This License does not restrict any Contributor from engaging
+in similar specification development projects. Each Contributor may
+design, develop, manufacture, acquire or market competitive deliverables,
+products, and services, and conduct its business, in whatever way it
+chooses. No Contributor is obligated to announce or market any products
+or services. Without limiting the generality of the foregoing, the
+Contributors agree not to have any discussion relating to any product
+pricing, methods or channels of product distribution, division of markets,
+allocation of customers or any other topic that should not be discussed
+among competitors under the auspices of the Working Group.
+
+7. Non-Circumvention. Contributor agrees that it will not intentionally
+take or willfully assist any third party to take any action for the
+purpose of circumventing any obligations under this License.
+
+8. Representations, Warranties and Disclaimers.
+
+8.1. Representations, Warranties and Disclaimers. Contributor and Licensee
+represents and warrants that 1) it is legally entitled to grant the
+rights set forth in this License and 2) it will not intentionally include
+any third party materials in any Contribution unless those materials are
+available under terms that do not conflict with this License. IN ALL OTHER
+RESPECTS ITS CONTRIBUTIONS ARE PROVIDED "AS IS." The entire risk as to
+implementing or otherwise using the Contribution or the Specification
+is assumed by the implementer and user. Except as stated herein,
+CONTRIBUTOR AND LICENSEE EXPRESSLY DISCLAIM ANY WARRANTIES (EXPRESS,
+IMPLIED, OR OTHERWISE), INCLUDING IMPLIED WARRANTIES OF MERCHANTABILITY,
+NON-INFRINGEMENT, FITNESS FOR A PARTICULAR PURPOSE, CONDITIONS OF QUALITY,
+OR TITLE, RELATED TO THE CONTRIBUTION OR THE SPECIFICATION. IN NO EVENT
+WILL ANY PARTY BE LIABLE TO ANY OTHER PARTY FOR LOST PROFITS OR ANY
+FORM OF INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES OF
+ANY CHARACTER FROM ANY CAUSES OF ACTION OF ANY KIND WITH RESPECT TO
+THIS AGREEMENT, WHETHER BASED ON BREACH OF CONTRACT, TORT (INCLUDING
+NEGLIGENCE), OR OTHERWISE, AND WHETHER OR NOT THE OTHER PARTY HAS BEEN
+ADVISED OF THE POSSIBILITY OF SUCH DAMAGE. Any obligations regarding
+the transfer, successors in interest, or assignment of Necessary Claims
+will be satisfied if Contributor or Licensee notifies the transferee
+or assignee of any patent that it knows contains Necessary Claims or
+necessary claims under this License. Nothing in this License requires
+Contributor to undertake a patent search. If Contributor is 1) employed by
+or acting on behalf of an employer, 2) is making a Contribution under the
+direction or control of a third party, or 3) is making the Contribution
+as a consultant, contractor, or under another similar relationship with
+a third party, Contributor represents that they have been authorized by
+that party to enter into this License on its behalf.
+
+8.2. Distribution Disclaimer. Any distributions of technical
+information to third parties must include a notice materially similar
+to the following: =E2=80=9CTHESE MATERIALS ARE PROVIDED =E2=80=9CAS IS.=E2=
=80=9D The
+Contributors and Licensees expressly disclaim any warranties (express,
+implied, or otherwise), including implied warranties of merchantability,
+non-infringement, fitness for a particular purpose, or title, related to
+the materials. The entire risk as to implementing or otherwise using the
+materials is assumed by the implementer and user. IN NO EVENT WILL THE
+CONTRIBUTORS OR LICENSEES BE LIABLE TO ANY OTHER PARTY FOR LOST PROFITS
+OR ANY FORM OF INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
+OF ANY CHARACTER FROM ANY CAUSES OF ACTION OF ANY KIND WITH RESPECT TO
+THIS DELIVERABLE OR ITS GOVERNING AGREEMENT, WHETHER BASED ON BREACH OF
+CONTRACT, TORT (INCLUDING NEGLIGENCE), OR OTHERWISE, AND WHETHER OR NOT
+THE OTHER MEMBER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.=E2=80=
=9D
+
+9. Definitions.
+
+9.1. Affiliate. =E2=80=9CAffiliate=E2=80=9D means an entity that directly =
or
+indirectly Controls, is Controlled by, or is under common Control of
+that party.
+
+9.2. Approved Specification. =E2=80=9CApproved Specification=E2=80=9D mean=
s the final
+version and contents of any Draft Specification designated as an Approved
+Specification as set forth in the accompanying Governance.md file.
+
+9.3. Contribution. =E2=80=9CContribution=E2=80=9D means any original work =
of
+authorship, including any modifications or additions to an existing
+work, that Contributor submits for inclusion in a Draft Specification,
+which is included in a Draft Specification or Approved Specification.
+
+9.4. Contributor. =E2=80=9CContributor=E2=80=9D means any person or entity=
 that has
+indicated its acceptance of the License 1) by making a Contribution to
+the Specification, or 2) by entering into the Community Specification
+Contributor License Agreement for the Specification. Contributor includes
+its Affiliates, assigns, agents, and successors in interest.
+
+9.5. Control. =E2=80=9CControl=E2=80=9D means direct or indirect control o=
f more
+than 50% of the voting power to elect directors of that corporation,
+or for any other entity, the power to direct management of such entity.
+
+9.6. Draft Specification. =E2=80=9CDraft Specification=E2=80=9D means all =
versions
+of the material (except an Approved Specification) developed by this
+Working Group for the purpose of creating, commenting on, revising,
+updating, modifying, or adding to any document that is to be considered
+for inclusion in the Approved Specification.
+
+9.7. Exclusion Notice. =E2=80=9CExclusion Notice=E2=80=9D means a written =
notice
+made by making a pull request or commit to the repository=E2=80=99s Notice=
s.md
+file that identifies patents that Contributor is excluding from its
+patent licensing commitments under this License. The Exclusion Notice
+for issued patents and published applications must include the Draft
+Specification=E2=80=99s name, patent number(s) or title and application
+number(s), as the case may be, for each of the issued patent(s) or
+pending patent application(s) that the Contributor is excluding from the
+royalty-free licensing commitment set forth in this License. If an issued
+patent or pending patent application that may contain Necessary Claims
+is not set forth in the Exclusion Notice, those Necessary Claims shall
+continue to be subject to the licensing commitments under this License.
+The Exclusion Notice for unpublished patent applications must provide
+either: (i) the text of the filed application; or (ii) identification
+of the specific part(s) of the Draft Specification whose implementation
+makes the excluded claim a Necessary Claim. If (ii) is chosen, the
+effect of the exclusion will be limited to the identified part(s) of
+the Draft Specification.
+
+9.8. Implementation. =E2=80=9CImplementation=E2=80=9D means making, using,=
 selling,
+offering for sale, importing or distributing any implementation of the
+Specification 1) only to the extent it implements the Specification and 2)
+so long as all required portions of the Specification are implemented.
+
+9.9. License. =E2=80=9CLicense=E2=80=9D means this Community Specification=
 License.
+
+9.10. Licensee. =E2=80=9CLicensee=E2=80=9D means any person or entity that=
 has
+indicated its acceptance of the License as set forth in Section 2.1.3.
+Licensee includes its Affiliates, assigns, agents, and successors in
+interest.
+
+9.11. Necessary Claims. =E2=80=9CNecessary Claims=E2=80=9D are those paten=
t claims, if
+any, that a party owns or controls, including those claims later acquired,
+that are necessary to implement the required portions (including the
+required elements of optional portions) of the Specification that are
+described in detail and not merely referenced in the Specification.
+
+9.12. Specification. =E2=80=9CSpecification=E2=80=9D means a Draft Specifi=
cation
+or Approved Specification included in the Working Group=E2=80=99s reposito=
ry
+subject to this License, and the version of the Specification implemented
+by the Licensee.
+
+9.13. Scope. =E2=80=9CScope=E2=80=9D has the meaning as set forth in the a=
ccompanying
+Scope.md file included in this Specification=E2=80=99s repository. Changes
+to Scope do not apply retroactively. If no Scope is provided, each
+Contributor=E2=80=99s Necessary Claims are limited to that Contributor=E2=
=80=99s
+Contributions.
+
+9.14. Working Group. =E2=80=9CWorking Group=E2=80=9D means this project to=
 develop
+specifications, standards, best practices, guidelines, and other similar
+materials under this License.
+
+
+
+The text of this Community Specification License is Copyright 2020
+Joint Development Foundation and is licensed under the Creative
+Commons Attribution 4.0 International License available at
+https://creativecommons.org/licenses/by/4.0/.
+
+SPDX-License-Identifier: CC-BY-4.0
diff --git a/meta/files/common-licenses/Cornell-Lossless-JPEG b/meta/files/=
common-licenses/Cornell-Lossless-JPEG
new file mode 100644
index 00000000000..7d2d44394d2
--- /dev/null
+++ b/meta/files/common-licenses/Cornell-Lossless-JPEG
@@ -0,0 +1,20 @@
+Copyright (c) 1993 Cornell University, Kongji Huang
+All rights reserved.
+
+Permission to use, copy, modify, and distribute this software and its
+documentation for any purpose, without fee, and without written
+agreement is hereby granted, provided that the above copyright notice
+and the following two paragraphs appear in all copies of this
+software.
+
+IN NO EVENT SHALL THE CORNELL UNIVERSITY BE LIABLE TO ANY PARTY FOR
+DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING
+OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF CORNELL
+UNIVERSITY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+THE CORNELL UNIVERSITY SPECIFICALLY DISCLAIMS ANY WARRANTIES,
+INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE
+PROVIDED HEREUNDER IS ON AN "AS IS" BASIS, AND CORNELL UNIVERSITY HAS
+NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS,
+OR MODIFICATIONS.
diff --git a/meta/files/common-licenses/Cronyx b/meta/files/common-licenses=
/Cronyx
new file mode 100644
index 00000000000..10fa8e70673
--- /dev/null
+++ b/meta/files/common-licenses/Cronyx
@@ -0,0 +1,11 @@
+This package contains a set of Russian fonts for X11 Release 6.
+Copyright (C) 1994-1995 Cronyx Ltd.
+Changes Copyright (C) 1996 by Sergey Vovk
+Changes Copyright (C) 1999-2000 by Serge Winitzki
+Changes Copyright (C) 1996-2000 by Andrey A. Chernov, Moscow, Russia.
+
+This software may be used, modified, copied, distributed, and sold,
+in both source and binary form provided that the copyright
+and these terms are retained. Under no circumstances is the author
+responsible for the proper functioning of this software, nor does
+the author assume any responsibility for damages incurred with its use.
diff --git a/meta/files/common-licenses/DEC-3-Clause b/meta/files/common-li=
censes/DEC-3-Clause
new file mode 100644
index 00000000000..112edaa70d5
--- /dev/null
+++ b/meta/files/common-licenses/DEC-3-Clause
@@ -0,0 +1,28 @@
+Copyright 1997 Digital Equipment Corporation.
+All rights reserved.
+
+This software is furnished under license and may be used and copied only in
+accordance with the following terms and conditions.  Subject to these
+conditions, you may download, copy, install, use, modify and distribute
+this software in source and/or binary form. No title or ownership is
+transferred hereby.
+
+1) Any source code used, modified or distributed must reproduce and retain
+   this copyright notice and list of conditions as they appear in the
+   source file.
+
+2) No right is granted to use any trade name, trademark, or logo of Digital
+   Equipment Corporation. Neither the "Digital Equipment Corporation"
+   name nor any trademark or logo of Digital Equipment Corporation may be
+   used to endorse or promote products derived from this software without
+   the prior written permission of Digital Equipment Corporation.
+
+3) This software is provided "AS-IS" and any express or implied warranties,
+   including but not limited to, any implied warranties of merchantability,
+   fitness for a particular purpose, or non-infringement are disclaimed.
+   In no event shall DIGITAL be liable for any damages whatsoever, and in
+   particular, DIGITAL shall not be liable for special, indirect,
+   consequential, or incidental damages or damages for lost profits, loss
+   of revenue or loss of use, whether such damages arise in contract,
+   negligence, tort, under statute, in equity, at law or otherwise, even
+   if advised of the possibility of such damage.
diff --git a/meta/files/common-licenses/DL-DE-BY-2.0 b/meta/files/common-li=
censes/DL-DE-BY-2.0
new file mode 100644
index 00000000000..20c3a19c2f5
--- /dev/null
+++ b/meta/files/common-licenses/DL-DE-BY-2.0
@@ -0,0 +1,45 @@
+DL-DE->BY-2.0
+Datenlizenz Deutschland =E2=80=93 Namensnennung =E2=80=93 Version 2.0
+
+(1) Jede Nutzung ist unter den Bedingungen dieser =E2=80=9EDatenlizenz Deu=
tschland =E2=80=93 Namensnennung =E2=80=93 Version 2.0" zul=C3=A4ssig.
+
+Die bereitgestellten Daten und Metadaten d=C3=BCrfen f=C3=BCr die kommerzi=
elle und nicht kommerzielle Nutzung insbesondere
+
+    vervielf=C3=A4ltigt, ausgedruckt, pr=C3=A4sentiert, ver=C3=A4ndert, be=
arbeitet sowie an Dritte =C3=BCbermittelt werden;
+    mit eigenen Daten und Daten Anderer zusammengef=C3=BChrt und zu selbst=
=C3=A4ndigen neuen Datens=C3=A4tzen verbunden werden;
+    in interne und externe Gesch=C3=A4ftsprozesse, Produkte und Anwendunge=
n in =C3=B6ffentlichen und nicht =C3=B6ffentlichen elektronischen Netzwerke=
n eingebunden werden.
+
+(2) Bei der Nutzung ist sicherzustellen, dass folgende Angaben als Quellen=
vermerk enthalten sind:
+
+    Bezeichnung des Bereitstellers nach dessen Ma=C3=9Fgabe,
+    der Vermerk =E2=80=9EDatenlizenz Deutschland =E2=80=93 Namensnennung =
=E2=80=93 Version 2.0" oder =E2=80=9Edl-de/by-2-0" mit Verweis auf den Lize=
nztext unter www.govdata.de/dl-de/by-2-0 sowie
+    einen Verweis auf den Datensatz (URI).
+
+Dies gilt nur soweit die datenhaltende Stelle die Angaben 1. bis 3. zum Qu=
ellenvermerk bereitstellt.
+
+(3) Ver=C3=A4nderungen, Bearbeitungen, neue Gestaltungen oder sonstige Abw=
andlungen sind im Quellenvermerk mit dem Hinweis zu versehen, dass die Date=
n ge=C3=A4ndert wurden.
+
+
+Data licence Germany =E2=80=93 attribution =E2=80=93 version 2.0
+
+(1) Any use will be permitted provided it fulfils the requirements of this=
 "Data licence Germany =E2=80=93 attribution =E2=80=93 Version 2.0".
+
+The data and meta-data provided may, for commercial and non-commercial use=
, in particular
+
+    be copied, printed, presented, altered, processed and transmitted to t=
hird parties;
+    be merged with own data and with the data of others and be combined to=
 form new and independent datasets;
+    be integrated in internal and external business processes, products an=
d applications in public and non-public electronic networks.
+
+(2) The user must ensure that the source note contains the following infor=
mation:
+
+    the name of the provider,
+    the annotation "Data licence Germany =E2=80=93 attribution =E2=80=93 V=
ersion 2.0" or "dl-de/by-2-0" referring to the licence text available at ww=
w.govdata.de/dl-de/by-2-0, and
+    a reference to the dataset (URI).
+
+This applies only if the entity keeping the data provides the pieces of in=
formation 1-3 for the source note.
+
+(3) Changes, editing, new designs or other amendments must be marked as su=
ch in the source note.
+
+
+
+URL: http://www.govdata.de/dl-de/by-2-0
diff --git a/meta/files/common-licenses/DL-DE-ZERO-2.0 b/meta/files/common-=
licenses/DL-DE-ZERO-2.0
new file mode 100644
index 00000000000..7daacde13d3
--- /dev/null
+++ b/meta/files/common-licenses/DL-DE-ZERO-2.0
@@ -0,0 +1,25 @@
+DL-DE->Zero-2.0
+Datenlizenz Deutschland =E2=80=93 Zero =E2=80=93 Version 2.0
+
+Jede Nutzung ist ohne Einschr=C3=A4nkungen oder Bedingungen zul=C3=A4ssig.
+
+Die bereitgestellten Daten und Metadaten d=C3=BCrfen f=C3=BCr die kommerzi=
elle und nicht kommerzielle Nutzung insbesondere
+
+    vervielf=C3=A4ltigt, ausgedruckt, pr=C3=A4sentiert, ver=C3=A4ndert, be=
arbeitet sowie an Dritte =C3=BCbermittelt werden;
+    mit eigenen Daten und Daten Anderer zusammengef=C3=BChrt und zu selbst=
=C3=A4ndigen neuen Datens=C3=A4tzen verbunden werden;
+    in interne und externe Gesch=C3=A4ftsprozesse, Produkte und Anwendunge=
n in =C3=B6ffentlichen und nicht =C3=B6ffentlichen elektronischen Netzwerke=
n eingebunden werden.
+
+
+Data licence Germany =E2=80=93 Zero =E2=80=93 version 2.0
+
+Any use is permitted without restrictions or conditions.
+
+The data and meta-data provided may, for commercial and non-commercial use=
, in particular
+
+    be copied, printed, presented, altered, processed and transmitted to t=
hird parties;
+    be merged with own data and with the data of others and be combined to=
 form new and independent datasets;
+    be integrated in internal and external business processes, products an=
d applications in public and non-public electronic networks.
+
+
+
+URL: https://www.govdata.de/dl-de/zero-2-0
diff --git a/meta/files/common-licenses/DRL-1.1 b/meta/files/common-license=
s/DRL-1.1
new file mode 100644
index 00000000000..a6445601ff4
--- /dev/null
+++ b/meta/files/common-licenses/DRL-1.1
@@ -0,0 +1,17 @@
+Detection Rule License (DRL) 1.1
+
+Permission is hereby granted, free of charge, to any person obtaining a co=
py of this rule set and associated documentation files (the "Rules"), to de=
al in the Rules without restriction, including without limitation the right=
s to use, copy, modify, merge, publish, distribute, sublicense, and/or sell=
 copies of the Rules, and to permit persons to whom the Rules are furnished=
 to do so, subject to the following conditions:
+
+If you share the Rules (including in modified form), you must retain the f=
ollowing if it is supplied within the Rules:
+
+identification of the authors(s) ("author" field) of the Rule and any othe=
rs designated to receive attribution, in any reasonable manner requested by=
 the Rule author (including by pseudonym if designated).
+
+a URI or hyperlink to the Rule set or explicit Rule to the extent reasonab=
ly practicable
+
+indicate the Rules are licensed under this Detection Rule License, and inc=
lude the text of, or the URI or hyperlink to, this Detection Rule License t=
o the extent reasonably practicable
+
+If you use the Rules (including in modified form) on data, messages based =
on matches with the Rules must retain the following if it is supplied withi=
n the Rules:
+
+identification of the authors(s) ("author" field) of the Rule and any othe=
rs designated to receive attribution, in any reasonable manner requested by=
 the Rule author (including by pseudonym if designated).
+
+THE RULES ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR I=
MPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FIT=
NESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AU=
THORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABIL=
ITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT=
 OF OR IN CONNECTION WITH THE RULES OR THE USE OR OTHER DEALINGS IN THE RUL=
ES.
diff --git a/meta/files/common-licenses/Elastic-2.0 b/meta/files/common-lic=
enses/Elastic-2.0
new file mode 100644
index 00000000000..809108b857f
--- /dev/null
+++ b/meta/files/common-licenses/Elastic-2.0
@@ -0,0 +1,93 @@
+Elastic License 2.0
+
+URL: https://www.elastic.co/licensing/elastic-license
+
+## Acceptance
+
+By using the software, you agree to all of the terms and conditions below.
+
+## Copyright License
+
+The licensor grants you a non-exclusive, royalty-free, worldwide,
+non-sublicensable, non-transferable license to use, copy, distribute, make
+available, and prepare derivative works of the software, in each case subj=
ect to
+the limitations and conditions below.
+
+## Limitations
+
+You may not provide the software to third parties as a hosted or managed
+service, where the service provides users with access to any substantial s=
et of
+the features or functionality of the software.
+
+You may not move, change, disable, or circumvent the license key functiona=
lity
+in the software, and you may not remove or obscure any functionality in the
+software that is protected by the license key.
+
+You may not alter, remove, or obscure any licensing, copyright, or other n=
otices
+of the licensor in the software. Any use of the licensor=E2=80=99s tradema=
rks is subject
+to applicable law.
+
+## Patents
+
+The licensor grants you a license, under any patent claims the licensor can
+license, or becomes able to license, to make, have made, use, sell, offer =
for
+sale, import and have imported the software, in each case subject to the
+limitations and conditions in this license. This license does not cover any
+patent claims that you cause to be infringed by modifications or additions=
 to
+the software. If you or your company make any written claim that the softw=
are
+infringes or contributes to infringement of any patent, your patent licens=
e for
+the software granted under these terms ends immediately. If your company m=
akes
+such a claim, your patent license ends immediately for work on behalf of y=
our
+company.
+
+## Notices
+
+You must ensure that anyone who gets a copy of any part of the software fr=
om you
+also gets a copy of these terms.
+
+If you modify the software, you must include in any modified copies of the
+software prominent notices stating that you have modified the software.
+
+## No Other Rights
+
+These terms do not imply any licenses other than those expressly granted in
+these terms.
+
+## Termination
+
+If you use the software in violation of these terms, such use is not licen=
sed,
+and your licenses will automatically terminate. If the licensor provides y=
ou
+with a notice of your violation, and you cease all violation of this licen=
se no
+later than 30 days after you receive that notice, your licenses will be
+reinstated retroactively. However, if you violate these terms after such
+reinstatement, any additional violation of these terms will cause your lic=
enses
+to terminate automatically and permanently.
+
+## No Liability
+
+*As far as the law allows, the software comes as is, without any warranty =
or
+condition, and the licensor will not be liable to you for any damages aris=
ing
+out of these terms or the use or nature of the software, under any kind of
+legal claim.*
+
+## Definitions
+
+The **licensor** is the entity offering these terms, and the **software** =
is the
+software the licensor makes available under these terms, including any por=
tion
+of it.
+
+**you** refers to the individual or entity agreeing to these terms.
+
+**your company** is any legal entity, sole proprietorship, or other kind of
+organization that you work for, plus all organizations that have control o=
ver,
+are under the control of, or are under common control with that
+organization. **control** means ownership of substantially all the assets =
of an
+entity, or the power to direct its management and policies by vote, contra=
ct, or
+otherwise. Control can be direct or indirect.
+
+**your licenses** are all the licenses granted to you for the software und=
er
+these terms.
+
+**use** means anything you do with the software requiring one of your lice=
nses.
+
+**trademark** means trademarks, service marks, and similar rights.
diff --git a/meta/files/common-licenses/FBM b/meta/files/common-licenses/FBM
new file mode 100644
index 00000000000..68d9149b903
--- /dev/null
+++ b/meta/files/common-licenses/FBM
@@ -0,0 +1,6 @@
+Portions of this code Copyright (C) 1989 by Michael Mauldin.
+Permission is granted to use this file in whole or in
+part for any purpose, educational, recreational or commercial,
+provided that this copyright notice is retained unchanged.
+This software is available to all free of charge by anonymous
+FTP and in the UUNET archives.
diff --git a/meta/files/common-licenses/FDK-AAC b/meta/files/common-license=
s/FDK-AAC
new file mode 100644
index 00000000000..e506d69d5ee
--- /dev/null
+++ b/meta/files/common-licenses/FDK-AAC
@@ -0,0 +1,79 @@
+Software License for The Fraunhofer FDK AAC Codec Library for Android
+
+=C2=A9 Copyright  1995 - 2012 Fraunhofer-Gesellschaft zur F=C3=B6rderung d=
er angewandten Forschung e.V.
+  All rights reserved.
+
+1.    INTRODUCTION
+The Fraunhofer FDK AAC Codec Library for Android ("FDK AAC Codec") is soft=
ware that implements
+the MPEG Advanced Audio Coding ("AAC") encoding and decoding scheme for di=
gital audio.
+This FDK AAC Codec software is intended to be used on a wide variety of An=
droid devices.
+
+AAC's HE-AAC and HE-AAC v2 versions are regarded as today's most efficient=
 general perceptual
+audio codecs. AAC-ELD is considered the best-performing full-bandwidth com=
munications codec by
+independent studies and is widely deployed. AAC has been standardized by I=
SO and IEC as part
+of the MPEG specifications.
+
+Patent licenses for necessary patent claims for the FDK AAC Codec (includi=
ng those of Fraunhofer)
+may be obtained through Via Licensing (www.vialicensing.com) or through th=
e respective patent owners
+individually for the purpose of encoding or decoding bit streams in produc=
ts that are compliant with
+the ISO/IEC MPEG audio standards. Please note that most manufacturers of A=
ndroid devices already license
+these patent claims through Via Licensing or directly from the patent owne=
rs, and therefore FDK AAC Codec
+software may already be covered under those patent licenses when it is use=
d for those licensed purposes only.
+
+Commercially-licensed AAC software libraries, including floating-point ver=
sions with enhanced sound quality,
+are also available from Fraunhofer. Users are encouraged to check the Frau=
nhofer website for additional
+applications information and documentation.
+
+2.    COPYRIGHT LICENSE
+
+Redistribution and use in source and binary forms, with or without modific=
ation, are permitted without
+payment of copyright license fees provided that you satisfy the following =
conditions:
+
+You must retain the complete text of this software license in redistributi=
ons of the FDK AAC Codec or
+your modifications thereto in source code form.
+
+You must retain the complete text of this software license in the document=
ation and/or other materials
+provided with redistributions of the FDK AAC Codec or your modifications t=
hereto in binary form.
+You must make available free of charge copies of the complete source code =
of the FDK AAC Codec and your
+modifications thereto to recipients of copies in binary form.
+
+The name of Fraunhofer may not be used to endorse or promote products deri=
ved from this library without
+prior written permission.
+
+You may not charge copyright license fees for anyone to use, copy or distr=
ibute the FDK AAC Codec
+software or your modifications thereto.
+
+Your modified versions of the FDK AAC Codec must carry prominent notices s=
tating that you changed the software
+and the date of any change. For modified versions of the FDK AAC Codec, th=
e term
+"Fraunhofer FDK AAC Codec Library for Android" must be replaced by the term
+"Third-Party Modified Version of the Fraunhofer FDK AAC Codec Library for =
Android."
+
+3.    NO PATENT LICENSE
+
+NO EXPRESS OR IMPLIED LICENSES TO ANY PATENT CLAIMS, including without lim=
itation the patents of Fraunhofer,
+ARE GRANTED BY THIS SOFTWARE LICENSE. Fraunhofer provides no warranty of p=
atent non-infringement with
+respect to this software.
+
+You may use this FDK AAC Codec software or modifications thereto only for =
purposes that are authorized
+by appropriate patent licenses.
+
+4.    DISCLAIMER
+
+This FDK AAC Codec software is provided by Fraunhofer on behalf of the cop=
yright holders and contributors
+"AS IS" and WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, including but not l=
imited to the implied warranties
+of merchantability and fitness for a particular purpose. IN NO EVENT SHALL=
 THE COPYRIGHT HOLDER OR
+CONTRIBUTORS BE LIABLE for any direct, indirect, incidental, special, exem=
plary, or consequential damages,
+including but not limited to procurement of substitute goods or services; =
loss of use, data, or profits,
+or business interruption, however caused and on any theory of liability, w=
hether in contract, strict
+liability, or tort (including negligence), arising in any way out of the u=
se of this software, even if
+advised of the possibility of such damage.
+
+5.    CONTACT INFORMATION
+
+Fraunhofer Institute for Integrated Circuits IIS
+Attention: Audio and Multimedia Departments - FDK AAC LL
+Am Wolfsmantel 33
+91058 Erlangen, Germany
+
+www.iis.fraunhofer.de/amm
+amm-info@iis.fraunhofer.de
diff --git a/meta/files/common-licenses/FSFAP-no-warranty-disclaimer b/meta=
/files/common-licenses/FSFAP-no-warranty-disclaimer
new file mode 100644
index 00000000000..2cc8a933201
--- /dev/null
+++ b/meta/files/common-licenses/FSFAP-no-warranty-disclaimer
@@ -0,0 +1,5 @@
+Copyright (C) 2008 Micah J. Cowan
+
+Copying and distribution of this file, with or without modification,
+are permitted in any medium without royalty provided the copyright
+notice and this notice are preserved.
diff --git a/meta/files/common-licenses/FSFULLRWD b/meta/files/common-licen=
ses/FSFULLRWD
new file mode 100644
index 00000000000..8dc0b2e5f0f
--- /dev/null
+++ b/meta/files/common-licenses/FSFULLRWD
@@ -0,0 +1,11 @@
+Copyright (C) 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002,
+2003, 2004, 2005, 2006, 2007, 2008, 2009  Free Software Foundation, Inc.
+
+This Makefile.in is free software; the Free Software Foundation
+gives unlimited permission to copy and/or distribute it,
+with or without modifications, as long as this notice is preserved.
+
+This program is distributed in the hope that it will be useful,
+but WITHOUT ANY WARRANTY, to the extent permitted by law; without
+even the implied warranty of MERCHANTABILITY or FITNESS FOR A
+PARTICULAR PURPOSE.
diff --git a/meta/files/common-licenses/Ferguson-Twofish b/meta/files/commo=
n-licenses/Ferguson-Twofish
new file mode 100644
index 00000000000..43bb00c3ee7
--- /dev/null
+++ b/meta/files/common-licenses/Ferguson-Twofish
@@ -0,0 +1,15 @@
+ The author hereby grants a perpetual license to everybody to=20
+ use this code for any purpose as long as the copyright message is include=
d=20
+ in the source code of this or any derived work.=20
+=20=20
+ Yes, this means that you, your company, your club, and anyone else=20
+ can use this code anywhere you want. You can change it and distribute it=
=20
+ under the GPL, include it in your commercial product without releasing=20
+ the source code, put it on the web, etc.=20=20
+ The only thing you cannot do is remove my copyright message,=20=20
+ or distribute any source code based on this implementation that does not=
=20=20
+ include my copyright message.=20=20
+=20=20
+ I appreciate a mention in the documentation or credits,=20=20
+ but I understand if that is difficult to do.=20
+ I also appreciate it if you tell me where and why you used my code.=20
diff --git a/meta/files/common-licenses/Furuseth b/meta/files/common-licens=
es/Furuseth
new file mode 100644
index 00000000000..55feeef90b8
--- /dev/null
+++ b/meta/files/common-licenses/Furuseth
@@ -0,0 +1,13 @@
+Portions Copyright 1999-2008 Howard Y.H. Chu.
+Portions Copyright 1999-2008 Symas Corporation.
+Portions Copyright 1998-2003 Hallvard B. Furuseth.
+Portions Copyright 2007-2011 Gavin Henry.
+Portions Copyright 2007-2011 Suretec Systems Ltd.
+All rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that this notice is preserved.
+The names of the copyright holders may not be used to endorse or
+promote products derived from this software without their specific
+prior written permission.  This software is provided ``as is''
+without express or implied warranty.
diff --git a/meta/files/common-licenses/GCR-docs b/meta/files/common-licens=
es/GCR-docs
new file mode 100644
index 00000000000..d5c1293c965
--- /dev/null
+++ b/meta/files/common-licenses/GCR-docs
@@ -0,0 +1,30 @@
+This work may be reproduced and distributed in whole or in part, in
+any medium, physical or electronic, so as long as this copyright
+notice remains intact and unchanged on all copies.  Commercial
+redistribution is permitted and encouraged, but you may not
+redistribute, in whole or in part, under terms more restrictive than
+those under which you received it. If you redistribute a modified or
+translated version of this work, you must also make the source code to
+the modified or translated version available in electronic form
+without charge.  However, mere aggregation as part of a larger work
+shall not count as a modification for this purpose.
+
+All code examples in this work are placed into the public domain,
+and may be used, modified and redistributed without restriction.
+
+BECAUSE THIS WORK IS LICENSED FREE OF CHARGE, THERE IS NO
+WARRANTY FOR THE WORK, TO THE EXTENT PERMITTED BY APPLICABLE LAW.
+EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR
+OTHER PARTIES PROVIDE THE WORK "AS IS" WITHOUT WARRANTY OF ANY
+KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+PURPOSE.  SHOULD THE WORK PROVE DEFECTIVE, YOU ASSUME
+THE COST OF ALL NECESSARY REPAIR OR CORRECTION.
+
+IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN
+WRITING WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY
+AND/OR REDISTRIBUTE THE WORK AS PERMITTED ABOVE, BE LIABLE TO YOU
+FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR
+CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE
+WORK, EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
+POSSIBILITY OF SUCH DAMAGES.
diff --git a/meta/files/common-licenses/Graphics-Gems b/meta/files/common-l=
icenses/Graphics-Gems
new file mode 100644
index 00000000000..ec28c465636
--- /dev/null
+++ b/meta/files/common-licenses/Graphics-Gems
@@ -0,0 +1,5 @@
+LICENSE
+
+This code repository predates the concept of Open Source, and predates mos=
t licenses along such lines. As such, the official license truly is:
+
+EULA: The Graphics Gems code is copyright-protected. In other words, you c=
annot claim the text of the code as your own and resell it. Using the code =
is permitted in any program, product, or library, non-commercial or commerc=
ial. Giving credit is not required, though is a nice gesture. The code come=
s as-is, and if there are any flaws or problems with any Gems code, nobody =
involved with Gems - authors, editors, publishers, or webmasters - are to b=
e held responsible. Basically, don't be a jerk, and remember that anything =
free comes with no guarantee.
diff --git a/meta/files/common-licenses/Gutmann b/meta/files/common-license=
s/Gutmann
new file mode 100644
index 00000000000..c33f4ee3a2f
--- /dev/null
+++ b/meta/files/common-licenses/Gutmann
@@ -0,0 +1,2 @@
+You can use this code in whatever way you want, as long as you don't try
+to claim you wrote it.
diff --git a/meta/files/common-licenses/HP-1986 b/meta/files/common-license=
s/HP-1986
new file mode 100644
index 00000000000..35844cb4d85
--- /dev/null
+++ b/meta/files/common-licenses/HP-1986
@@ -0,0 +1,10 @@
+(c) Copyright 1986 HEWLETT-PACKARD COMPANY=20
+
+To anyone who acknowledges that this file is provided "AS IS"=20
+without any express or implied warranty: permission to use, copy,=20
+modify, and distribute this file for any purpose is hereby granted=20
+without fee, provided that the above copyright notice and this notice=20
+appears in all copies, and that the name of Hewlett-Packard Company=20
+not be used in advertising or publicity pertaining to distribution=20
+of the software without specific, written prior permission. Hewlett-Packar=
d=20
+Company makes no representations about the suitability of this software fo=
r any purpose.
diff --git a/meta/files/common-licenses/HP-1989 b/meta/files/common-license=
s/HP-1989
new file mode 100644
index 00000000000..7422055d95b
--- /dev/null
+++ b/meta/files/common-licenses/HP-1989
@@ -0,0 +1,16 @@
+Copyright (c) 1990- 1993, 1996 Open Software Foundation, Inc.
+Copyright (c) 1989 by Hewlett-Packard Company, Palo Alto, Ca.
+Digital Equipment Corporation, Maynard, Mass.
+Copyright (c) 1998 Microsoft.
+To anyone who acknowledges that this file is provided "AS IS"
+without any express or implied warranty: permission to use, copy,
+modify, and distribute this file for any purpose is hereby
+granted without fee, provided that the above copyright notices and
+this notice appears in all source code copies, and that none of
+the names of Open Software Foundation, Inc., Hewlett-Packard
+Company, Microsoft, or Digital Equipment Corporation be used in
+advertising or publicity pertaining to distribution of the software
+without specific, written prior permission. Neither Open Software
+Foundation, Inc., Hewlett-Packard Company, Microsoft, nor Digital
+Equipment Corporation makes any representations about the
+suitability of this software for any purpose.
diff --git a/meta/files/common-licenses/HPND-DEC b/meta/files/common-licens=
es/HPND-DEC
new file mode 100644
index 00000000000..d014f1fabce
--- /dev/null
+++ b/meta/files/common-licenses/HPND-DEC
@@ -0,0 +1,22 @@
+COPYRIGHT 1990
+DIGITAL EQUIPMENT CORPORATION
+MAYNARD, MASSACHUSETTS
+ALL RIGHTS RESERVED.
+
+THE INFORMATION IN THIS SOFTWARE IS SUBJECT TO CHANGE WITHOUT NOTICE AND S=
HOULD NOT BE CONSTRUED AS A COMMITMENT BY DIGITAL EQUIPMENT CORPORATION.
+DIGITAL MAKES NO REPRESENTATIONS ABOUT THE SUITABILITY OF THIS SOFTWARE
+FOR ANY PURPOSE. IT IS SUPPLIED "AS IS" WITHOUT EXPRESS OR IMPLIED
+WARRANTY.
+
+IF THE SOFTWARE IS MODIFIED IN A MANNER CREATING DERIVATIVE COPYRIGHT
+RIGHTS, APPROPRIATE LEGENDS MAY BE PLACED ON THE DERIVATIVE WORK IN
+ADDITION TO THAT SET FORTH ABOVE.
+
+Permission to use, copy, modify, and distribute this software and
+its documentation for any purpose and without fee is hereby granted,
+provided that the above copyright notice appear in all copies
+and that both that copyright notice and this permission notice appear in s=
upporting
+documentation,
+and that the name of Digital Equipment Corporation not be
+used in advertising or publicity pertaining to distribution of the
+software without specific, written prior permission.
diff --git a/meta/files/common-licenses/HPND-Fenneberg-Livingston b/meta/fi=
les/common-licenses/HPND-Fenneberg-Livingston
new file mode 100644
index 00000000000..aaf524f3aa2
--- /dev/null
+++ b/meta/files/common-licenses/HPND-Fenneberg-Livingston
@@ -0,0 +1,13 @@
+Copyright (C) 1995,1996,1997,1998 Lars Fenneberg <lf@elemental.net>
+
+Permission to use, copy, modify, and distribute this software for any
+purpose and without fee is hereby granted, provided that this copyright and
+permission notice appear on all copies and supporting documentation, the
+name of Lars Fenneberg not be used in advertising or publicity pertaining =
to
+distribution of the program without specific prior permission, and notice =
be
+given in supporting documentation that copying and distribution is by
+permission of Lars Fenneberg.
+
+Lars Fenneberg makes no representations about the suitability of this
+software for any purpose.  It is provided "as is" without express or impli=
ed
+warranty.
diff --git a/meta/files/common-licenses/HPND-INRIA-IMAG b/meta/files/common=
-licenses/HPND-INRIA-IMAG
new file mode 100644
index 00000000000..87d09d92cb8
--- /dev/null
+++ b/meta/files/common-licenses/HPND-INRIA-IMAG
@@ -0,0 +1,9 @@
+This software is available with usual "research" terms with
+the aim of retain credits of the software. Permission to use,
+copy, modify and distribute this software for any purpose and
+without fee is hereby granted, provided that the above copyright
+notice and this permission notice appear in all copies, and
+the name of INRIA, IMAG, or any contributor not be used in
+advertising or publicity pertaining to this material without
+the prior explicit permission. The software is provided "as
+is" without any warranties, support or liabilities of any kind.
diff --git a/meta/files/common-licenses/HPND-Intel b/meta/files/common-lice=
nses/HPND-Intel
new file mode 100644
index 00000000000..98f0ceb4fde
--- /dev/null
+++ b/meta/files/common-licenses/HPND-Intel
@@ -0,0 +1,25 @@
+Copyright (c) 1993 Intel Corporation
+
+Intel hereby grants you permission to copy, modify, and distribute this
+software and its documentation.  Intel grants this permission provided
+that the above copyright notice appears in all copies and that both the
+copyright notice and this permission notice appear in supporting
+documentation.  In addition, Intel grants this permission provided that
+you prominently mark as "not part of the original" any modifications
+made to this software or documentation, and that the name of Intel
+Corporation not be used in advertising or publicity pertaining to
+distribution of the software or the documentation without specific,
+written prior permission.
+
+Intel Corporation provides this AS IS, WITHOUT ANY WARRANTY, EXPRESS OR
+IMPLIED, INCLUDING, WITHOUT LIMITATION, ANY WARRANTY OF MERCHANTABILITY
+OR FITNESS FOR A PARTICULAR PURPOSE.  Intel makes no guarantee or
+representations regarding the use of, or the results of the use of,
+the software and documentation in terms of correctness, accuracy,
+reliability, currentness, or otherwise; and you rely on the software,
+documentation and results solely at your own risk.
+
+IN NO EVENT SHALL INTEL BE LIABLE FOR ANY LOSS OF USE, LOSS OF BUSINESS,
+LOSS OF PROFITS, INDIRECT, INCIDENTAL, SPECIAL OR CONSEQUENTIAL DAMAGES
+OF ANY KIND.  IN NO EVENT SHALL INTEL'S TOTAL LIABILITY EXCEED THE SUM
+PAID TO INTEL FOR THE PRODUCT LICENSED HEREUNDER.
diff --git a/meta/files/common-licenses/HPND-Kevlin-Henney b/meta/files/com=
mon-licenses/HPND-Kevlin-Henney
new file mode 100644
index 00000000000..ddf9bd6dca0
--- /dev/null
+++ b/meta/files/common-licenses/HPND-Kevlin-Henney
@@ -0,0 +1,10 @@
+Copyright Kevlin Henney, 1997, 2003, 2012. All rights reserved.
+
+Permission to use, copy, modify, and distribute this software and its
+documentation for any purpose is hereby granted without fee, provided
+that this copyright and permissions notice appear in all copies and
+derivatives.
+
+This software is supplied "as is" without express or implied warranty.
+
+But that said, if there are any problems please get in touch.
diff --git a/meta/files/common-licenses/HPND-MIT-disclaimer b/meta/files/co=
mmon-licenses/HPND-MIT-disclaimer
new file mode 100644
index 00000000000..bf035915cfd
--- /dev/null
+++ b/meta/files/common-licenses/HPND-MIT-disclaimer
@@ -0,0 +1,18 @@
+        LICENSE
+        =3D=3D=3D=3D=3D=3D=3D
+=20
+Permission to use, copy, modify, and distribute this software and its
+documentation for any purpose and without fee is hereby granted, provided
+that the original copyright notices appear in all copies and that both
+copyright notice and this permission notice appear in supporting
+documentation, and that the name of the author not be used in advertising
+or publicity pertaining to distribution of the software without specific
+prior written permission.
+=20
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+DEALINGS IN THE SOFTWARE.
diff --git a/meta/files/common-licenses/HPND-Markus-Kuhn b/meta/files/commo=
n-licenses/HPND-Markus-Kuhn
new file mode 100644
index 00000000000..ca41db16188
--- /dev/null
+++ b/meta/files/common-licenses/HPND-Markus-Kuhn
@@ -0,0 +1,3 @@
+Permission to use, copy, modify, and distribute this software
+for any purpose and without fee is hereby granted. The author
+disclaims all warranties with regard to this software.
diff --git a/meta/files/common-licenses/HPND-Pbmplus b/meta/files/common-li=
censes/HPND-Pbmplus
new file mode 100644
index 00000000000..5627d2646f8
--- /dev/null
+++ b/meta/files/common-licenses/HPND-Pbmplus
@@ -0,0 +1,8 @@
+Copyright (C) 1991 by Jef Poskanzer.
+
+Permission to use, copy, modify, and distribute this software and its
+documentation for any purpose and without fee is hereby granted, provided
+that the above copyright notice appear in all copies and that both that
+copyright notice and this permission notice appear in supporting
+documentation.  This software is provided "as is" without express or
+implied warranty.
diff --git a/meta/files/common-licenses/HPND-UC b/meta/files/common-license=
s/HPND-UC
new file mode 100644
index 00000000000..adfbd238628
--- /dev/null
+++ b/meta/files/common-licenses/HPND-UC
@@ -0,0 +1,8 @@
+Copyright 1989 Regents of the University of California=20
+
+Permission to use,
+copy, modify, and distribute this software and its documentation for any
+purpose and without fee is hereby granted, provided that the above
+copyright notice appear in all copies. The University of California makes
+no representations about the suitability of this software for any purpose.
+It is provided "as is" without express or implied warranty.
diff --git a/meta/files/common-licenses/HPND-UC-export-US b/meta/files/comm=
on-licenses/HPND-UC-export-US
new file mode 100644
index 00000000000..015556c5f97
--- /dev/null
+++ b/meta/files/common-licenses/HPND-UC-export-US
@@ -0,0 +1,10 @@
+Copyright (C) 1985, 1990 Regents of the University of California.
+
+Permission to use, copy, modify, and distribute this
+software and its documentation for any purpose and without
+fee is hereby granted, provided that the above copyright
+notice appear in all copies.  The University of California
+makes no representations about the suitability of this
+software for any purpose.  It is provided "as is" without
+express or implied warranty.  Export of this software outside
+of the United States of America may require an export license.
diff --git a/meta/files/common-licenses/HPND-doc b/meta/files/common-licens=
es/HPND-doc
new file mode 100644
index 00000000000..bd85a2816e5
--- /dev/null
+++ b/meta/files/common-licenses/HPND-doc
@@ -0,0 +1,8 @@
+Copyright <year> <copyright holder>
+
+Permission to use, copy, modify, and distribute this documentation for
+any purpose and without fee is hereby granted, provided that the above
+copyright notice and this permission notice appear in all copies.
+<copyright holder> makes no representations about the suitability for
+any purpose of the information in this document.  This documentation is
+provided ``as is'' without express or implied warranty.
diff --git a/meta/files/common-licenses/HPND-doc-sell b/meta/files/common-l=
icenses/HPND-doc-sell
new file mode 100644
index 00000000000..ad4aed3e608
--- /dev/null
+++ b/meta/files/common-licenses/HPND-doc-sell
@@ -0,0 +1,9 @@
+Copyright <year> <copyright holder>
+
+Permission to use, copy, modify, distribute, and sell this
+documentation for any purpose is hereby granted without fee,
+provided that the above copyright notice and this permission
+notice appear in all copies. <copyright holder>
+makes no representations about the suitability for any purpose
+of the information in this document. This documentation
+is provided "as is" without express or implied warranty.
diff --git a/meta/files/common-licenses/HPND-export-US b/meta/files/common-=
licenses/HPND-export-US
new file mode 100644
index 00000000000..b0cd3939697
--- /dev/null
+++ b/meta/files/common-licenses/HPND-export-US
@@ -0,0 +1,5 @@
+Copyright (C) 1990 by the Massachusetts Institute of Technology
+
+Export of this software from the United States of America may  require a s=
pecific license from the United States Government.  It is the responsibilit=
y of any person or organization contemplating  export to obtain such a lice=
nse before exporting.
+
+WITHIN THAT CONSTRAINT, permission to use, copy, modify, and  distribute t=
his software and its documentation for any purpose and  without fee is here=
by granted, provided that the above copyright  notice appear in all copies =
and that both that copyright notice and  this permission notice appear in s=
upporting documentation, and that  the name of M.I.T. not be used in advert=
ising or publicity pertaining  to distribution of the software without spec=
ific, written prior  permission. M.I.T. makes no representations about the =
suitability of  this software for any purpose. It is provided "as is" witho=
ut express  or implied warranty.
diff --git a/meta/files/common-licenses/HPND-export-US-acknowledgement b/me=
ta/files/common-licenses/HPND-export-US-acknowledgement
new file mode 100644
index 00000000000..645df4c9aaa
--- /dev/null
+++ b/meta/files/common-licenses/HPND-export-US-acknowledgement
@@ -0,0 +1,22 @@
+Copyright (C) 1994 by the University of Southern California
+
+   EXPORT OF THIS SOFTWARE from the United States of America may
+   require a specific license from the United States Government. It
+   is the responsibility of any person or organization
+   contemplating export to obtain such a license before exporting.
+
+WITHIN THAT CONSTRAINT, permission to copy, modify, and distribute
+this software and its documentation in source and binary forms is
+hereby granted, provided that any documentation or other materials
+related to such distribution or use acknowledge that the software
+was developed by the University of Southern California.
+
+DISCLAIMER OF WARRANTY.  THIS SOFTWARE IS PROVIDED "AS IS".  The
+University of Southern California MAKES NO REPRESENTATIONS OR
+WARRANTIES, EXPRESS OR IMPLIED.  By way of example, but not
+limitation, the University of Southern California MAKES NO
+REPRESENTATIONS OR WARRANTIES OF MERCHANTABILITY OR FITNESS FOR ANY
+PARTICULAR PURPOSE. The University of Southern California shall not
+be held liable for any liability nor for any direct, indirect, or
+consequential damages with respect to any claim by the user or
+distributor of the ksu software.
diff --git a/meta/files/common-licenses/HPND-export-US-modify b/meta/files/=
common-licenses/HPND-export-US-modify
new file mode 100644
index 00000000000..3c62651c0f4
--- /dev/null
+++ b/meta/files/common-licenses/HPND-export-US-modify
@@ -0,0 +1,24 @@
+Copyright (C) 1994 CyberSAFE Corporation.
+Copyright 1990,1991,2007,2008 by the Massachusetts
+Institute of Technology.
+All Rights Reserved.
+
+Export of this software from the United States of America may
+require a specific license from the United States Government.  It
+is the responsibility of any person or organization
+contemplating export to obtain such a license before exporting.
+
+WITHIN THAT CONSTRAINT, permission to use, copy, modify, and
+distribute this software and its documentation for any purpose and
+without fee is hereby granted, provided that the above copyright
+notice appear in all copies and that both that copyright notice and
+this permission notice appear in supporting documentation, and that
+the name of M.I.T. not be used in advertising or publicity
+pertaining to distribution of the software without specific,
+written prior permission.  Furthermore if you modify this software
+you must label your software as modified software and not
+distribute it in such a fashion that it might be confused with the
+original M.I.T. software.  Neither M.I.T., the Open Computing
+Security Group, nor CyberSAFE Corporation make any representations
+about the suitability of this software for any purpose.  It is
+provided "as is" without express or implied warranty.
diff --git a/meta/files/common-licenses/HPND-export2-US b/meta/files/common=
-licenses/HPND-export2-US
new file mode 100644
index 00000000000..1dda23a88ce
--- /dev/null
+++ b/meta/files/common-licenses/HPND-export2-US
@@ -0,0 +1,21 @@
+Copyright 2004-2008 Apple Inc.  All Rights Reserved.
+
+   Export of this software from the United States of America may
+   require a specific license from the United States Government.
+   It is the responsibility of any person or organization
+   contemplating export to obtain such a license before exporting.
+
+WITHIN THAT CONSTRAINT, permission to use, copy, modify, and
+distribute this software and its documentation for any purpose and
+without fee is hereby granted, provided that the above copyright
+notice appear in all copies and that both that copyright notice and
+this permission notice appear in supporting documentation, and that
+the name of Apple Inc. not be used in advertising or publicity
+pertaining to distribution of the software without specific,
+written prior permission.  Apple Inc. makes no representations
+about the suitability of this software for any purpose.  It is
+provided "as is" without express or implied warranty.
+
+THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
+IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
+WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
diff --git a/meta/files/common-licenses/HPND-merchantability-variant b/meta=
/files/common-licenses/HPND-merchantability-variant
new file mode 100644
index 00000000000..421b9ff96bb
--- /dev/null
+++ b/meta/files/common-licenses/HPND-merchantability-variant
@@ -0,0 +1,9 @@
+Copyright (C) 2004 Christian Groessler <chris@groessler.org>
+
+Permission to use, copy, modify, and distribute this file
+for any purpose is hereby granted without fee, provided that
+the above copyright notice and this notice appears in all
+copies.
+
+This file is distributed WITHOUT ANY WARRANTY; without even the implied
+warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
diff --git a/meta/files/common-licenses/HPND-sell-MIT-disclaimer-xserver b/=
meta/files/common-licenses/HPND-sell-MIT-disclaimer-xserver
new file mode 100644
index 00000000000..e7bea21d16e
--- /dev/null
+++ b/meta/files/common-licenses/HPND-sell-MIT-disclaimer-xserver
@@ -0,0 +1,12 @@
+Permission to use, copy, modify, distribute, and sell this software and its
+documentation for any purpose is hereby granted without fee, provided that
+this permission notice appear in supporting documentation.  This permission
+notice shall be included in all copies or substantial portions of the
+Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL T=
HE
+AUTHOR BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
+AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
diff --git a/meta/files/common-licenses/HPND-sell-regexpr b/meta/files/comm=
on-licenses/HPND-sell-regexpr
new file mode 100644
index 00000000000..b0cd0fb1126
--- /dev/null
+++ b/meta/files/common-licenses/HPND-sell-regexpr
@@ -0,0 +1,9 @@
+Author: Tatu Ylonen <ylo@ngs.fi>
+
+Copyright (c) 1991 Tatu Ylonen, Espoo, Finland
+
+Permission to use, copy, modify, distribute, and sell this software
+and its documentation for any purpose is hereby granted without
+fee, provided that the above copyright notice appear in all copies.
+This software is provided "as is" without express or implied
+warranty.
diff --git a/meta/files/common-licenses/HPND-sell-variant-MIT-disclaimer b/=
meta/files/common-licenses/HPND-sell-variant-MIT-disclaimer
new file mode 100644
index 00000000000..d4464e0c35c
--- /dev/null
+++ b/meta/files/common-licenses/HPND-sell-variant-MIT-disclaimer
@@ -0,0 +1,20 @@
+by Jim Knoble <jmknoble@pobox.com>
+  Copyright (C) 1999,2000,2001 Jim Knoble
+=20=20
+  Permission to use, copy, modify, distribute, and sell this software
+  and its documentation for any purpose is hereby granted without fee,
+  provided that the above copyright notice appear in all copies and
+  that both that copyright notice and this permission notice appear in
+  supporting documentation.
+
++------------+
+| Disclaimer |
++------------+
+
+  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+  express or implied, including but not limited to the warranties of
+  merchantability, fitness for a particular purpose and
+  noninfringement. In no event shall the author(s) be liable for any
+  claim, damages or other liability, whether in an action of contract,
+  tort or otherwise, arising from, out of or in connection with the
+  software or the use or other dealings in the software.
diff --git a/meta/files/common-licenses/HPND-sell-variant-MIT-disclaimer-re=
v b/meta/files/common-licenses/HPND-sell-variant-MIT-disclaimer-rev
new file mode 100644
index 00000000000..f68aff5c990
--- /dev/null
+++ b/meta/files/common-licenses/HPND-sell-variant-MIT-disclaimer-rev
@@ -0,0 +1,15 @@
+Disclaimer:
+
+The software is provided "as is", without warranty of any kind,
+express or implied, including but not limited to the warranties
+of merchantability, fitness for a particular purpose and
+noninfringement. In no event shall the author(s) be liable for
+any claim, damages or other liability, whether in an action of
+contract, tort or otherwise, arising from, out of or in connection
+with the software or the use or other dealings in the software.
+=20=20=20=20=20=20=20=20=20
+Permission to use, copy, modify, distribute, and sell this
+software and its documentation for any purpose is hereby
+granted without fee, provided that the above copyright notice
+appear in all copies and that both that copyright notice and
+this permission notice appear in supporting documentation.
diff --git a/meta/files/common-licenses/IEC-Code-Components-EULA b/meta/fil=
es/common-licenses/IEC-Code-Components-EULA
new file mode 100644
index 00000000000..b74269afd9b
--- /dev/null
+++ b/meta/files/common-licenses/IEC-Code-Components-EULA
@@ -0,0 +1,37 @@
+IEC Code Components End-user licence agreement
+
+Code Components in IEC standards (International Standards, Technical Speci=
fications or
+Technical Reports) which have been identified and approved for licensing, =
are licensed subject to
+the following conditions:
+
+- Redistributions of software must retain the Copyright Notice, this list =
of conditions and the
+disclaimer below (=E2=80=9CDisclaimer=E2=80=9D).
+- The software license extends to modifications permitted under the releva=
nt IEC standard.
+- The software license extends to clarifications and corrections approved =
by IEC.
+- Neither the name of IEC, nor the names of specific contributors, may be =
used to endorse or
+promote products derived from this software without specific prior written=
 permission. The
+relevant IEC standard may be referenced when claiming compliance with the =
relevant IEC
+standard.
+- The user of Code Components shall attribute each such Code Component to =
IEC and identify
+the IEC standard from which it is taken. Such attribution (e.g., =E2=80=9C=
This code was derived from IEC
+[insert standard reference number:publication year] within modifications p=
ermitted in the
+relevant IEC standard. Please reproduce this note if possible.=E2=80=9D), =
may be placed in the code itself
+or any other reasonable location.
+
+Code Components means components included in IEC standards that are intend=
ed to be directly
+processed by a computer and also includes any text found between the marke=
rs <CODE
+BEGINS> and <CODE ENDS>, or otherwise clearly labeled in this standard as =
a Code
+Component.
+
+The Disclaimer is:
+EACH OF THE CODE COMPONENTS IS PROVIDED BY THE COPYRIGHT HOLDERS AND
+CONTRIBUTORS =E2=80=9CAS IS=E2=80=9D AND ANY EXPRESS OR IMPLIED WARRANTIES=
, INCLUDING, BUT
+NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
+PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
+OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THE CODE
+COMPONENTS, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.=20
diff --git a/meta/files/common-licenses/IJG-short b/meta/files/common-licen=
ses/IJG-short
new file mode 100644
index 00000000000..bbb0859d804
--- /dev/null
+++ b/meta/files/common-licenses/IJG-short
@@ -0,0 +1,35 @@
+The authors make NO WARRANTY or representation, either express or
+implied, with respect to this software, its quality, accuracy,
+merchantability, or fitness for a particular purpose.  This software is
+provided "AS IS", and you, its user, assume the entire risk as to its
+quality and accuracy.
+
+This software is copyright (C) 1991, 1992, Thomas G. Lane.  All Rights
+Reserved except as specified below.
+
+Permission is hereby granted to use, copy, modify, and distribute this
+software (or portions thereof) for any purpose, without fee, subject to
+these conditions:=20=20
+
+(1) If any part of the source code for this software
+is distributed, then this README file must be included, with this
+copyright and no-warranty notice unaltered; and any additions,
+deletions, or changes to the original files must be clearly indicated
+in accompanying documentation.=20=20
+
+(2) If only executable code is
+distributed, then the accompanying documentation must state that "this
+software is based in part on the work of the Independent JPEG Group".
+
+(3) Permission for use of this software is granted only if the user
+accepts full responsibility for any undesirable consequences; the
+authors accept NO LIABILITY for damages of any kind.
+
+Permission is NOT granted for the use of any IJG author's name or
+company name in advertising or publicity relating to this software or
+products derived from it.  This software may be referred to only as
+"the Independent JPEG Group's software".
+
+We specifically permit and encourage the use of this software as the
+basis of commercial products, provided that all warranty or liability
+claims are assumed by the product vendor.
diff --git a/meta/files/common-licenses/ISC-Veillard b/meta/files/common-li=
censes/ISC-Veillard
new file mode 100644
index 00000000000..c3bd5455c95
--- /dev/null
+++ b/meta/files/common-licenses/ISC-Veillard
@@ -0,0 +1,9 @@
+Copyright (C) 2003-2012 Daniel Veillard.=20
+Permission to use, copy,
+modify, and distribute this software for any purpose with or
+without fee is hereby granted, provided that the above copyright
+notice and this permission notice appear in all copies. THIS
+SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED
+WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES
+OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE AUTHORS
+AND CONTRIBUTORS ACCEPT NO RESPONSIBILITY IN ANY CONCEIVABLE MANNER.
diff --git a/meta/files/common-licenses/Inner-Net-2.0 b/meta/files/common-l=
icenses/Inner-Net-2.0
new file mode 100644
index 00000000000..f8db440f2ae
--- /dev/null
+++ b/meta/files/common-licenses/Inner-Net-2.0
@@ -0,0 +1,34 @@
+The Inner Net License, Version 2.00
+
+The author(s) grant permission for redistribution and use in source and
+binary forms, with or without modification, of the software and documentat=
ion
+provided that the following conditions are met:
+
+0. If you receive a version of the software that is specifically labelled
+   as not being for redistribution (check the version message and/or READM=
E),
+   you are not permitted to redistribute that version of the software in a=
ny
+   way or form.
+1. All terms of the all other applicable copyrights and licenses must be
+   followed.
+2. Redistributions of source code must retain the authors' copyright
+   notice(s), this list of conditions, and the following disclaimer.
+3. Redistributions in binary form must reproduce the authors' copyright
+   notice(s), this list of conditions, and the following disclaimer in the
+   documentation and/or other materials provided with the distribution.
+4. [The copyright holder has authorized the removal of this clause.]
+5. Neither the name(s) of the author(s) nor the names of its contributors
+   may be used to endorse or promote products derived from this software
+   without specific prior written permission.
+
+THIS SOFTWARE IS PROVIDED BY ITS AUTHORS AND CONTRIBUTORS ``AS IS'' AND ANY
+EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+DISCLAIMED. IN NO EVENT SHALL THE AUTHORS OR CONTRIBUTORS BE LIABLE FOR ANY
+DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICE=
S;
+LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AN=
D ON
+ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF T=
HIS
+SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+If these license terms cause you a real problem, contact the author.
diff --git a/meta/files/common-licenses/JPL-image b/meta/files/common-licen=
ses/JPL-image
new file mode 100644
index 00000000000..828b1b5424e
--- /dev/null
+++ b/meta/files/common-licenses/JPL-image
@@ -0,0 +1,21 @@
+JPL Image Use Policy
+
+Unless otherwise noted, images and video on JPL public web sites (public s=
ites ending with a jpl.nasa.gov address) may be used for any purpose withou=
t prior permission, subject to the special cases noted below. Publishers wh=
o wish to have authorization may print this page and retain it for their re=
cords; JPL does not issue image permissions on an image by image basis.
+
+By electing to download the material from this web site the user agrees:
+
+1. that Caltech makes no representations or warranties with respect to own=
ership of copyrights in the images, and does not represent others who may c=
laim to be authors or owners of copyright of any of the images, and makes n=
o warranties as to the quality of the images. Caltech shall not be responsi=
ble for any loss or expenses resulting from the use of the images, and you =
release and hold Caltech harmless from all liability arising from such use.
+2. to use a credit line in connection with images. Unless otherwise noted =
in the caption information for an image, the credit line should be "Courtes=
y NASA/JPL-Caltech."
+3. that the endorsement of any product or service by Caltech, JPL or NASA =
must not be claimed or implied.
+
+Special Cases:
+
+* Prior written approval must be obtained to use the NASA insignia logo (t=
he blue "meatball" insignia), the NASA logotype (the red "worm" logo) and t=
he NASA seal. These images may not be used by persons who are not NASA empl=
oyees or on products (including Web pages) that are not NASA sponsored. In =
addition, no image may be used to explicitly or implicitly suggest endorsem=
ent by NASA, JPL or Caltech of commercial goods or services. Requests to us=
e NASA logos may be directed to Bert Ulrich, Public Services Division, NASA=
 Headquarters, Code POS, Washington, DC 20546, telephone (202) 358-1713, fa=
x (202) 358-4331, email bert.ulrich@hq.nasa.gov.
+
+* Prior written approval must be obtained to use the JPL logo (stylized JP=
L letters in red or other colors). Requests to use the JPL logo may be dire=
cted to the Institutional Communications Office, email instcomm@jpl.nasa.go=
v.
+
+* If an image includes an identifiable person, using the image for commerc=
ial purposes may infringe that person's right of privacy or publicity, and =
permission should be obtained from the person. NASA and JPL generally do no=
t permit likenesses of current employees to appear on commercial products. =
For more information, consult the NASA and JPL points of contact listed abo=
ve.
+
+* JPL/Caltech contractors and vendors who wish to use JPL images in advert=
ising or public relation materials should direct requests to the Institutio=
nal Communications Office, email instcomm@jpl.nasa.gov.
+
+* Some image and video materials on JPL public web sites are owned by orga=
nizations other than JPL or NASA. These owners have agreed to make their im=
ages and video available for journalistic, educational and personal uses, b=
ut restrictions are placed on commercial uses. To obtain permission for com=
mercial use, contact the copyright owner listed in each image caption. Owne=
rship of images and video by parties other than JPL and NASA is noted in th=
e caption material with each image.
diff --git a/meta/files/common-licenses/Jam b/meta/files/common-licenses/Jam
new file mode 100644
index 00000000000..78d9abe6e5a
--- /dev/null
+++ b/meta/files/common-licenses/Jam
@@ -0,0 +1,5 @@
+License is hereby granted to use this software and distribute it freely,
+as long as this copyright notice is retained and modifications are
+clearly marked.
+
+ALL WARRANTIES ARE HEREBY DISCLAIMED.
diff --git a/meta/files/common-licenses/Kastrup b/meta/files/common-license=
s/Kastrup
new file mode 100644
index 00000000000..46d1e9e0e49
--- /dev/null
+++ b/meta/files/common-licenses/Kastrup
@@ -0,0 +1,3 @@
+Copyright(c) 2001 by David Kastrup
+Any use of the code is permitted as long as this copyright=20
+notice is preserved in the code.
diff --git a/meta/files/common-licenses/Kazlib b/meta/files/common-licenses=
/Kazlib
new file mode 100644
index 00000000000..714f2eabf9c
--- /dev/null
+++ b/meta/files/common-licenses/Kazlib
@@ -0,0 +1,4 @@
+Copyright (C) 1999 Kaz Kylheku=20
+
+Free Software License:=20
+All rights are reserved by the author, with the following exceptions: Perm=
ission is granted to freely reproduce and distribute this software, possibl=
y in exchange for a fee, provided that this copyright notice appears intact=
. Permission is also granted to adapt this software to produce derivative w=
orks, as long as the modified versions carry this copyright notice and addi=
tional notices stating that the work has been modified. This source code ma=
y be translated into executable form and incorporated into proprietary soft=
ware; there is no requirement for such software to contain a copyright noti=
ce related to this source.
diff --git a/meta/files/common-licenses/Knuth-CTAN b/meta/files/common-lice=
nses/Knuth-CTAN
new file mode 100644
index 00000000000..cd91789fd01
--- /dev/null
+++ b/meta/files/common-licenses/Knuth-CTAN
@@ -0,0 +1,5 @@
+This software is copyrighted. Unlimited copying and redistribution
+of this package and/or its individual files are permitted
+as long as there are no modifications. Modifications, and
+redistribution of modifications, are also permitted, but
+only if the resulting package and/or files are renamed.
diff --git a/meta/files/common-licenses/LOOP b/meta/files/common-licenses/L=
OOP
new file mode 100644
index 00000000000..434d2c45e22
--- /dev/null
+++ b/meta/files/common-licenses/LOOP
@@ -0,0 +1,44 @@
+Portions of LOOP are Copyright (c) 1986 by the Massachusetts Institute of =
Technology.
+All Rights Reserved.
+
+Permission to use, copy, modify and distribute this software and its
+documentation for any purpose and without fee is hereby granted,
+provided that the M.I.T. copyright notice appear in all copies and that
+both that copyright notice and this permission notice appear in
+supporting documentation.  The names "M.I.T." and "Massachusetts
+Institute of Technology" may not be used in advertising or publicity
+pertaining to distribution of the software without specific, written
+prior permission.  Notice must be given in supporting documentation that
+copying distribution is by permission of M.I.T.  M.I.T. makes no
+representations about the suitability of this software for any purpose.
+It is provided "as is" without express or implied warranty.
+
+Massachusetts Institute of Technology
+77 Massachusetts Avenue
+Cambridge, Massachusetts  02139
+United States of America
++1-617-253-1000
+
+Portions of LOOP are Copyright (c) 1989, 1990, 1991, 1992 by Symbolics, In=
c.
+All Rights Reserved.
+
+Permission to use, copy, modify and distribute this software and its
+documentation for any purpose and without fee is hereby granted,
+provided that the Symbolics copyright notice appear in all copies and
+that both that copyright notice and this permission notice appear in
+supporting documentation.  The name "Symbolics" may not be used in
+advertising or publicity pertaining to distribution of the software
+without specific, written prior permission.  Notice must be given in
+supporting documentation that copying distribution is by permission of
+Symbolics.  Symbolics makes no representations about the suitability of
+this software for any purpose.  It is provided "as is" without express
+or implied warranty.
+
+Symbolics, CLOE Runtime, and Minima are trademarks, and CLOE, Genera,
+and Zetalisp are registered trademarks of Symbolics, Inc.
+
+Symbolics, Inc.
+8 New England Executive Park, East
+Burlington, Massachusetts  01803
+United States of America
++1-617-221-1000
diff --git a/meta/files/common-licenses/LPD-document b/meta/files/common-li=
censes/LPD-document
new file mode 100644
index 00000000000..0b46392e2fe
--- /dev/null
+++ b/meta/files/common-licenses/LPD-document
@@ -0,0 +1,8 @@
+Copyright (c) 1996 L. Peter Deutsch
+
+Permission is granted to copy and distribute this
+document for any purpose and without charge, including
+translations into other languages and incorporation
+into compilations, provided that the copyright notice
+and this notice are preserved, and that any substantive
+changes or deletions from the original are clearly marked.
diff --git a/meta/files/common-licenses/LZMA-SDK-9.11-to-9.20 b/meta/files/=
common-licenses/LZMA-SDK-9.11-to-9.20
new file mode 100644
index 00000000000..5da25bf883c
--- /dev/null
+++ b/meta/files/common-licenses/LZMA-SDK-9.11-to-9.20
@@ -0,0 +1,8 @@
+LICENSE
+-------
+
+LZMA SDK is written and placed in the public domain by Igor Pavlov.
+
+Some code in LZMA is based on public domain code from another developers:
+  1) PPMd var.H (2001): Dmitry Shkarin
+  2) SHA-256: Wei Dai (Crypto++ library)
diff --git a/meta/files/common-licenses/LZMA-SDK-9.22 b/meta/files/common-l=
icenses/LZMA-SDK-9.22
new file mode 100644
index 00000000000..ef4768d2a72
--- /dev/null
+++ b/meta/files/common-licenses/LZMA-SDK-9.22
@@ -0,0 +1,15 @@
+LICENSE
+-------
+
+LZMA SDK is written and placed in the public domain by Igor Pavlov.
+
+Some code in LZMA SDK is based on public domain code from another develope=
rs:
+  1) PPMd var.H (2001): Dmitry Shkarin
+  2) SHA-256: Wei Dai (Crypto++ library)
+
+Anyone is free to copy, modify, publish, use, compile, sell, or distribute=
 the
+original LZMA SDK code, either in source code form or as a compiled binary=
, for
+any purpose, commercial or non-commercial, and by any means.
+
+LZMA SDK code is compatible with open source licenses, for example, you can
+include it to GNU GPL or GNU LGPL code.
diff --git a/meta/files/common-licenses/Latex2e-translated-notice b/meta/fi=
les/common-licenses/Latex2e-translated-notice
new file mode 100644
index 00000000000..5ac100f4cb9
--- /dev/null
+++ b/meta/files/common-licenses/Latex2e-translated-notice
@@ -0,0 +1,26 @@
+Copyright @copyright{} 1989, 1992, 1993, 1994, 1995, 1996, 2014 Free Softw=
are
+Foundation, Inc.
+
+Copyright @copyright{} 1995, 1996 Joseph Arceneaux.
+
+Copyright @copyright{} 1999, Carlo Wood.
+
+Copyright @copyright{} 2001, David Ingamells.
+
+Copyright @copyright{} 2013, =C5=81ukasz Stelmach.
+
+Copyright @copyright{} 2015, Tim Hentenaar.
+
+Permission is granted to make and distribute verbatim copies of
+this manual provided the copyright notice and this permission notice
+are preserved on all copies.
+
+Permission is granted to copy and distribute modified versions of this
+manual under the conditions for verbatim copying, provided that the entire
+resulting derived work is distributed under the terms of a permission
+notice identical to this one.
+
+Permission is granted to copy and distribute translations of this manual
+into another language, under the above conditions for modified versions,
+except that this permission notice may be stated in a translation approved
+by the Foundation.
diff --git a/meta/files/common-licenses/Linux-man-pages-1-para b/meta/files=
/common-licenses/Linux-man-pages-1-para
new file mode 100644
index 00000000000..6eff9081a03
--- /dev/null
+++ b/meta/files/common-licenses/Linux-man-pages-1-para
@@ -0,0 +1,4 @@
+Permission is granted to distribute possibly modified
+copies of this page provided the header is included
+verbatim, and in case of nontrivial modification author
+and date of the modification is added to the header.
diff --git a/meta/files/common-licenses/Linux-man-pages-copyleft b/meta/fil=
es/common-licenses/Linux-man-pages-copyleft
new file mode 100644
index 00000000000..764635ae5c8
--- /dev/null
+++ b/meta/files/common-licenses/Linux-man-pages-copyleft
@@ -0,0 +1,21 @@
+Copyright (c) <year> <owner> All rights reserved.
+
+Permission is granted to make and distribute verbatim copies of this
+manual provided the copyright notice and this permission notice are
+preserved on all copies.
+
+Permission is granted to copy and distribute modified versions of
+this manual under the conditions for verbatim copying, provided that
+the entire resulting derived work is distributed under the terms of
+a permission notice identical to this one.
+
+Since the Linux kernel and libraries are constantly changing, this
+manual page may be incorrect or out-of-date.  The author(s) assume
+no responsibility for errors or omissions, or for damages resulting
+from the use of the information contained herein.  The author(s) may
+not have taken the same level of care in the production of this
+manual, which is licensed free of charge, as they might when working
+professionally.
+
+Formatted or processed versions of this manual, if unaccompanied by
+the source, must acknowledge the copyright and authors of this work.
diff --git a/meta/files/common-licenses/Linux-man-pages-copyleft-2-para b/m=
eta/files/common-licenses/Linux-man-pages-copyleft-2-para
new file mode 100644
index 00000000000..b0871675b3c
--- /dev/null
+++ b/meta/files/common-licenses/Linux-man-pages-copyleft-2-para
@@ -0,0 +1,8 @@
+Permission is granted to make and distribute verbatim copies of this
+manual provided the copyright notice and this permission notice are
+preserved on all copies.
+
+Permission is granted to copy and distribute modified versions of this
+manual under the conditions for verbatim copying, provided that the
+entire resulting derived work is distributed under the terms of a
+permission notice identical to this one.
diff --git a/meta/files/common-licenses/Linux-man-pages-copyleft-var b/meta=
/files/common-licenses/Linux-man-pages-copyleft-var
new file mode 100644
index 00000000000..1742303553b
--- /dev/null
+++ b/meta/files/common-licenses/Linux-man-pages-copyleft-var
@@ -0,0 +1,16 @@
+Permission is granted to make and distribute verbatim copies of=20
+this manual provided the copyright notice and this permission=20
+notice are preserved on all copies.
+
+Permission is granted to copy and distribute modified versions of=20
+this manual under the conditions for verbatim copying, provided=20
+that the entire resulting derived work is distributed under the=20
+terms of a permission notice identical to this one.
+
+Since the Linux kernel and libraries are constantly changing, this=20
+manual page may be incorrect or out-of-date. The author(s) assume=20
+no responsibility for errors or omissions, or for damages resulting=20
+from the use of the information contained herein.
+
+Formatted or processed versions of this manual, if unaccompanied by=20
+the source, must acknowledge the copyright and authors of this work.
diff --git a/meta/files/common-licenses/Lucida-Bitmap-Fonts b/meta/files/co=
mmon-licenses/Lucida-Bitmap-Fonts
new file mode 100644
index 00000000000..35be63ed33d
--- /dev/null
+++ b/meta/files/common-licenses/Lucida-Bitmap-Fonts
@@ -0,0 +1,53 @@
+This is the LEGAL NOTICE pertaining to the Lucida fonts from Bigelow & Hol=
mes:
+
+	NOTICE TO USER: The source code, including the glyphs or icons
+	forming a par of the OPEN LOOK TM Graphic User Interface, on this
+	tape and in these files is copyrighted under U.S. and international
+	laws. Sun Microsystems, Inc. of Mountain View, California owns
+	the copyright and has design patents pending on many of the icons.
+	AT&T is the owner of the OPEN LOOK trademark associated with the
+	materials on this tape. Users and possessors of this source code
+	are hereby granted a nonexclusive, royalty-free copyright and
+	design patent license to use this code in individual and
+	commercial software. A royalty-free, nonexclusive trademark
+	license to refer to the code and output as "OPEN LOOK" compatible
+	is available from AT&T if, and only if, the appearance of the
+	icons or glyphs is not changed in any manner except as absolutely
+	necessary to accommodate the standard resolution of the screen or
+	other output device, the code and output is not changed except as
+	authorized herein, and the code and output is validated by AT&T.
+	Bigelow & Holmes is the owner of the Lucida (R) trademark for the
+	fonts and bit-mapped images associated with the materials on this
+	tape. Users are granted a royalty-free, nonexclusive license to use
+	the trademark only to identify the fonts and bit-mapped images if,
+	and only if, the fonts and bit-mapped images are not modified in any
+	way by the user.
+
+	Any use of this source code must include, in the user documentation
+	and internal comments to the code, notices to the end user as
+	follows:
+
+	(c) Copyright 1989 Sun Microsystems, Inc. Sun design patents
+	pending in the U.S. and foreign countries. OPEN LOOK is a
+	trademark of AT&T. Used by written permission of the owners.
+
+        (c) Copyright Bigelow & Holmes 1986, 1985. Lucida is a registered
+	trademark of Bigelow & Holmes. Permission to use the Lucida
+	trademark is hereby granted only in association with the images
+	and fonts described in this file.
+
+	SUN MICROSYSTEMS, INC., AT&T, AND BIGELOW & HOLMES
+	MAKE NO REPRESENTATIONS ABOUT THE SUITABILITY OF
+        THIS SOURCE CODE FOR ANY PURPOSE. IT IS PROVIDED "AS IS"
+	WITHOUT EXPRESS OR IMPLIED WARRANTY OF ANY KIND.
+	SUN  MICROSYSTEMS, INC., AT&T AND BIGELOW  & HOLMES,
+	SEVERALLY AND INDIVIDUALLY, DISCLAIM ALL WARRANTIES
+	WITH REGARD TO THIS SOURCE CODE, INCLUDING ALL IMPLIED
+	WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
+	PARTICULAR PURPOSE. IN NO EVENT SHALL SUN MICROSYSTEMS,
+	INC., AT&T OR BIGELOW & HOLMES BE LIABLE FOR ANY
+	SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL DAMAGES,
+	OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA
+	OR PROFITS, WHETHER IN AN ACTION OF  CONTRACT, NEGLIGENCE
+	OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION
+	WITH THE USE OR PERFORMANCE OF THIS SOURCE CODE.
diff --git a/meta/files/common-licenses/MIT-Festival b/meta/files/common-li=
censes/MIT-Festival
new file mode 100644
index 00000000000..6ec072db0a1
--- /dev/null
+++ b/meta/files/common-licenses/MIT-Festival
@@ -0,0 +1,22 @@
+Permission is hereby granted, free of charge, to use and distribute
+this software and its documentation without restriction, including
+without limitation the rights to use, copy, modify, merge, publish,
+distribute, sublicense, and/or sell copies of this work, and to
+permit persons to whom this work is furnished to do so, subject to
+the following conditions:
+1. The code must retain the above copyright notice, this list of
+conditions and the following disclaimer.
+2. Any modifications must be clearly marked as such.
+3. Original authors' names are not deleted.
+4. The authors' names are not used to endorse or promote products
+derived from this software without specific prior written
+permission.
+THE UNIVERSITY OF EDINBURGH AND THE CONTRIBUTORS TO THIS WORK
+DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
+ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT
+SHALL THE UNIVERSITY OF EDINBURGH NOR THE CONTRIBUTORS BE LIABLE
+FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
+AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
+ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF
+THIS SOFTWARE.
diff --git a/meta/files/common-licenses/MIT-Khronos-old b/meta/files/common=
-licenses/MIT-Khronos-old
new file mode 100644
index 00000000000..430863bc98a
--- /dev/null
+++ b/meta/files/common-licenses/MIT-Khronos-old
@@ -0,0 +1,23 @@
+Copyright (c) 2014-2020 The Khronos Group Inc.
+
+Permission is hereby granted, free of charge, to any person obtaining a co=
py
+of this software and/or associated documentation files (the "Materials"),
+to deal in the Materials without restriction, including without limitation
+the rights to use, copy, modify, merge, publish, distribute, sublicense,
+and/or sell copies of the Materials, and to permit persons to whom the
+Materials are furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in
+all copies or substantial portions of the Materials.
+
+MODIFICATIONS TO THIS FILE MAY MEAN IT NO LONGER ACCURATELY REFLECTS KHRON=
OS
+STANDARDS. THE UNMODIFIED, NORMATIVE VERSIONS OF KHRONOS SPECIFICATIONS AND
+HEADER INFORMATION ARE LOCATED AT https://www.khronos.org/registry/
+
+THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
+OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+FROM,OUT OF OR IN CONNECTION WITH THE MATERIALS OR THE USE OR OTHER DEALIN=
GS
+IN THE MATERIALS.
diff --git a/meta/files/common-licenses/MIT-Wu b/meta/files/common-licenses=
/MIT-Wu
new file mode 100644
index 00000000000..86eec3c517a
--- /dev/null
+++ b/meta/files/common-licenses/MIT-Wu
@@ -0,0 +1,28 @@
+Copyright (c) 2003-2005  Tom Wu
+All Rights Reserved.
+
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of this software and associated documentation files (the
+"Software"), to deal in the Software without restriction, including
+without limitation the rights to use, copy, modify, merge, publish,
+distribute, sublicense, and/or sell copies of the Software, and to
+permit persons to whom the Software is furnished to do so, subject to
+the following conditions:
+
+The above copyright notice and this permission notice shall be
+included in all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS-IS" AND WITHOUT WARRANTY OF ANY KIND,
+EXPRESS, IMPLIED OR OTHERWISE, INCLUDING WITHOUT LIMITATION, ANY
+WARRANTY OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.
+
+IN NO EVENT SHALL TOM WU BE LIABLE FOR ANY SPECIAL, INCIDENTAL,
+INDIRECT OR CONSEQUENTIAL DAMAGES OF ANY KIND, OR ANY DAMAGES WHATSOEVER
+RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER OR NOT ADVISED OF
+THE POSSIBILITY OF DAMAGE, AND ON ANY THEORY OF LIABILITY, ARISING OUT
+OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+
+In addition, the following condition applies:
+
+All redistributions must retain an intact copy of this copyright notice
+and disclaimer.
diff --git a/meta/files/common-licenses/MIT-testregex b/meta/files/common-l=
icenses/MIT-testregex
new file mode 100644
index 00000000000..321b4bf9bba
--- /dev/null
+++ b/meta/files/common-licenses/MIT-testregex
@@ -0,0 +1,17 @@
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of THIS SOFTWARE FILE (the "Software"), to deal in the Software
+ * without restriction, including without limitation the rights to use,
+ * copy, modify, merge, publish, distribute, and/or sell copies of the
+ * Software, and to permit persons to whom the Software is furnished to do
+ * so, subject to the following disclaimer:
+ *
+ * THIS SOFTWARE IS PROVIDED BY AT&T ``AS IS'' AND ANY EXPRESS OR IMPLIED
+ * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
+ * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
+ * IN NO EVENT SHALL AT&T BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/MMIXware b/meta/files/common-licens=
es/MMIXware
new file mode 100644
index 00000000000..04e08142088
--- /dev/null
+++ b/meta/files/common-licenses/MMIXware
@@ -0,0 +1,17 @@
+copyright 1999 Donald E. Knuth
+
+This file may be freely copied and distributed, provided that
+no changes whatsoever are made. All users are asked to help keep
+the MMIXware files consistent and ``uncorrupted,''
+identical everywhere in the world. Changes are permissible only
+if the modified file is given a new name, different from the names of
+existing files in the MMIXware package,
+and only if the modified file is clearly identified
+as not being part of that package.
+(The CWEB system has a ``change file'' facility by
+which users can easily make minor alterations without modifying
+the master source files in any way. Everybody is supposed to use
+change files instead of changing the files.)
+The author has tried his best to produce correct and useful programs,
+in order to help promote computer science research,
+but no warranty of any kind should be assumed.
diff --git a/meta/files/common-licenses/MPEG-SSG b/meta/files/common-licens=
es/MPEG-SSG
new file mode 100644
index 00000000000..66fde683d2a
--- /dev/null
+++ b/meta/files/common-licenses/MPEG-SSG
@@ -0,0 +1,25 @@
+Copyright (C) 1994, MPEG Software Simulation Group. All Rights Reserved. */
+
+Disclaimer of Warranty
+=20=20=20=20
+These software programs are available to the user without any license fee =
or
+royalty on an "as is" basis. The MPEG Software Simulation Group disclaims
+any and all warranties, whether express, implied, or statuary, including a=
ny
+implied warranties or merchantability or of fitness for a particular
+purpose. In no event shall the copyright-holder be liable for any
+incidental, punitive, or consequential damages of any kind whatsoever
+arising from the use of these programs.
+=20=20=20=20
+This disclaimer of warranty extends to the user of these programs and user=
's
+customers, employees, agents, transferees, successors, and assigns.
+=20=20=20=20
+The MPEG Software Simulation Group does not represent or warrant that the
+programs furnished hereunder are free of infringement of any third-party
+patents.
+=20=20=20=20
+Commercial implementations of MPEG-1 and MPEG-2 video, including shareware,
+are subject to royalty fees to patent holders. Many of these patents are
+general enough such that they are unavoidable regardless of implementation
+design.
+
+
diff --git a/meta/files/common-licenses/MS-LPL b/meta/files/common-licenses=
/MS-LPL
new file mode 100644
index 00000000000..ea8bffcaae2
--- /dev/null
+++ b/meta/files/common-licenses/MS-LPL
@@ -0,0 +1,24 @@
+Microsoft Limited Public License (Ms-LPL)
+
+This license governs use of the accompanying software. If you use the soft=
ware, you accept this license. If you do not accept the license, do not use=
 the software.
+
+1.  Definitions
+The terms "reproduce," "reproduction," "derivative works," and "distributi=
on" have the same meaning here as under U.S. copyright law. A "contribution=
" is the original software, or any additions or changes to the software. A =
"contributor" is any person that distributes its contribution under this li=
cense. "Licensed patents" are a contributor's patent claims that read direc=
tly on its contribution.
+
+2.  Grant of Rights
+     (A) Copyright Grant- Subject to the terms of this license, including =
the license conditions and limitations in section 3, each contributor grant=
s you a non-exclusive, worldwide, royalty-free copyright license to reprodu=
ce its contribution, prepare derivative works of its contribution, and dist=
ribute its contribution or any derivative works that you create.
+
+     (B) Patent Grant- Subject to the terms of this license, including the=
 license conditions and limitations in section 3, each contributor grants y=
ou a non-exclusive, worldwide, royalty-free license under its licensed pate=
nts to make, have made, use, sell, offer for sale, import, and/or otherwise=
 dispose of its contribution in the software or derivative works of the con=
tribution in the software.
+
+3.  Conditions and Limitations
+     (A) No Trademark License- This license does not grant you rights to u=
se any contributors' name, logo, or trademarks.
+
+     (B) If you bring a patent claim against any contributor over patents =
that you claim are infringed by the software, your patent license from such=
 contributor to the software ends automatically.
+
+     (C) If you distribute any portion of the software, you must retain al=
l copyright, patent, trademark, and attribution notices that are present in=
 the software.
+
+     (D) If you distribute any portion of the software in source code form=
, you may do so only under this license by including a complete copy of thi=
s license with your distribution. If you distribute any portion of the soft=
ware in compiled or object code form, you may only do so under a license th=
at complies with this license.
+
+     (E) The software is licensed "as-is." You bear the risk of using it. =
The contributors give no express warranties, guarantees, or conditions. You=
 may have additional consumer rights under your local laws which this licen=
se cannot change. To the extent permitted under your local laws, the contri=
butors exclude the implied warranties of merchantability, fitness for a par=
ticular purpose and non-infringement.
+
+     (F) Platform Limitation- The licenses granted in sections 2(A) & 2(B)=
 extend only to the software or derivative works that you create that run o=
n a Microsoft Windows operating system product.
diff --git a/meta/files/common-licenses/Mackerras-3-Clause b/meta/files/com=
mon-licenses/Mackerras-3-Clause
new file mode 100644
index 00000000000..6467f0c98e1
--- /dev/null
+++ b/meta/files/common-licenses/Mackerras-3-Clause
@@ -0,0 +1,25 @@
+Copyright (c) 1995 Eric Rosenquist.  All rights reserved.
+=20=20
+   Redistribution and use in source and binary forms, with or without
+   modification, are permitted provided that the following conditions
+   are met:
+=20=20
+   1. Redistributions of source code must retain the above copyright
+      notice, this list of conditions and the following disclaimer.
+=20=20
+   2. Redistributions in binary form must reproduce the above copyright
+      notice, this list of conditions and the following disclaimer in
+      the documentation and/or other materials provided with the
+      distribution.
+=20=20
+   3. The name(s) of the authors of this software must not be used to
+      endorse or promote products derived from this software without
+      prior written permission.
+=20=20
+   THE AUTHORS OF THIS SOFTWARE DISCLAIM ALL WARRANTIES WITH REGARD TO
+   THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
+   AND FITNESS, IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
+   SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+   WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
+   AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
+   OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
diff --git a/meta/files/common-licenses/Mackerras-3-Clause-acknowledgment b=
/meta/files/common-licenses/Mackerras-3-Clause-acknowledgment
new file mode 100644
index 00000000000..5f0187add7e
--- /dev/null
+++ b/meta/files/common-licenses/Mackerras-3-Clause-acknowledgment
@@ -0,0 +1,25 @@
+Copyright (c) 1993-2002 Paul Mackerras. All rights reserved.
+
+ Redistribution and use in source and binary forms, with or without
+ modification, are permitted provided that the following conditions
+ are met:
+=20
+ 1. Redistributions of source code must retain the above copyright
+     notice, this list of conditions and the following disclaimer.
+=20
+2. The name(s) of the authors of this software must not be used to
+   endorse or promote products derived from this software without
+   prior written permission.
+
+3. Redistributions of any form whatsoever must retain the following
+   acknowledgment:
+   "This product includes software developed by Paul Mackerras
+   <paulus@ozlabs.org>".
+
+THE AUTHORS OF THIS SOFTWARE DISCLAIM ALL WARRANTIES WITH REGARD TO
+THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
+AND FITNESS, IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
+SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
+AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
+OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
diff --git a/meta/files/common-licenses/Martin-Birgmeier b/meta/files/commo=
n-licenses/Martin-Birgmeier
new file mode 100644
index 00000000000..48d32f846e5
--- /dev/null
+++ b/meta/files/common-licenses/Martin-Birgmeier
@@ -0,0 +1,5 @@
+Copyright (c) 1993 Martin Birgmeier All rights reserved.=20
+
+You may redistribute unmodified or modified versions of this source code p=
rovided that the above copyright notice and this and the following conditio=
ns are retained.=20
+
+This software is provided ``as is'', and comes with no warranties of any k=
ind. I shall in no event be liable for anything that happens to anyone/anyt=
hing when using this software.
diff --git a/meta/files/common-licenses/McPhee-slideshow b/meta/files/commo=
n-licenses/McPhee-slideshow
new file mode 100644
index 00000000000..0ddf7ba3506
--- /dev/null
+++ b/meta/files/common-licenses/McPhee-slideshow
@@ -0,0 +1,6 @@
+Copyright 2001, Patrick TJ McPhee
+everyone is welcome to use this code for any purpose, to modify it, and
+to copy it in whole or in part for use in other macro sets, with the
+conditions that this copyright notice be preserved with any significant
+portion of the code, and that modifications to this file be clearly
+marked.
diff --git a/meta/files/common-licenses/Minpack b/meta/files/common-license=
s/Minpack
new file mode 100644
index 00000000000..132cc3f33fa
--- /dev/null
+++ b/meta/files/common-licenses/Minpack
@@ -0,0 +1,51 @@
+Minpack Copyright Notice (1999) University of Chicago.  All rights reserved
+
+Redistribution and use in source and binary forms, with or
+without modification, are permitted provided that the
+following conditions are met:
+
+1. Redistributions of source code must retain the above
+copyright notice, this list of conditions and the following
+disclaimer.
+
+2. Redistributions in binary form must reproduce the above
+copyright notice, this list of conditions and the following
+disclaimer in the documentation and/or other materials
+provided with the distribution.
+
+3. The end-user documentation included with the
+redistribution, if any, must include the following
+acknowledgment:
+
+   "This product includes software developed by the
+   University of Chicago, as Operator of Argonne National
+   Laboratory.
+
+Alternately, this acknowledgment may appear in the software
+itself, if and wherever such third-party acknowledgments
+normally appear.
+
+4. WARRANTY DISCLAIMER. THE SOFTWARE IS SUPPLIED "AS IS"
+WITHOUT WARRANTY OF ANY KIND. THE COPYRIGHT HOLDER, THE
+UNITED STATES, THE UNITED STATES DEPARTMENT OF ENERGY, AND
+THEIR EMPLOYEES: (1) DISCLAIM ANY WARRANTIES, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO ANY IMPLIED WARRANTIES
+OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE
+OR NON-INFRINGEMENT, (2) DO NOT ASSUME ANY LEGAL LIABILITY
+OR RESPONSIBILITY FOR THE ACCURACY, COMPLETENESS, OR
+USEFULNESS OF THE SOFTWARE, (3) DO NOT REPRESENT THAT USE OF
+THE SOFTWARE WOULD NOT INFRINGE PRIVATELY OWNED RIGHTS, (4)
+DO NOT WARRANT THAT THE SOFTWARE WILL FUNCTION
+UNINTERRUPTED, THAT IT IS ERROR-FREE OR THAT ANY ERRORS WILL
+BE CORRECTED.
+
+5. LIMITATION OF LIABILITY. IN NO EVENT WILL THE COPYRIGHT
+HOLDER, THE UNITED STATES, THE UNITED STATES DEPARTMENT OF
+ENERGY, OR THEIR EMPLOYEES: BE LIABLE FOR ANY INDIRECT,
+INCIDENTAL, CONSEQUENTIAL, SPECIAL OR PUNITIVE DAMAGES OF
+ANY KIND OR NATURE, INCLUDING BUT NOT LIMITED TO LOSS OF
+PROFITS OR LOSS OF DATA, FOR ANY REASON WHATSOEVER, WHETHER
+SUCH LIABILITY IS ASSERTED ON THE BASIS OF CONTRACT, TORT
+(INCLUDING NEGLIGENCE OR STRICT LIABILITY), OR OTHERWISE,
+EVEN IF ANY OF SAID PARTIES HAS BEEN WARNED OF THE
+POSSIBILITY OF SUCH LOSS OR DAMAGES.
diff --git a/meta/files/common-licenses/NCBI-PD b/meta/files/common-license=
s/NCBI-PD
new file mode 100644
index 00000000000..d838cf36b9d
--- /dev/null
+++ b/meta/files/common-licenses/NCBI-PD
@@ -0,0 +1,19 @@
+PUBLIC DOMAIN NOTICE
+National Center for Biotechnology Information
+
+This software is a "United States Government Work" under the terms of the
+United States Copyright Act.  It was written as part of the authors'
+official duties as United States Government employees and thus cannot
+be copyrighted.  This software is freely available to the public for
+use. The National Library of Medicine and the U.S. Government have not
+placed any restriction on its use or reproduction.
+
+Although all reasonable efforts have been taken to ensure the accuracy
+and reliability of the software and data, the NLM and the U.S.
+Government do not and cannot warrant the performance or results that
+may be obtained by using this software or data. The NLM and the U.S.
+Government disclaim all warranties, express or implied, including
+warranties of performance, merchantability or fitness for any
+particular purpose.
+
+Please cite the author in any work or product based on this material.
diff --git a/meta/files/common-licenses/NCL b/meta/files/common-licenses/NCL
new file mode 100644
index 00000000000..3bfb658c267
--- /dev/null
+++ b/meta/files/common-licenses/NCL
@@ -0,0 +1,32 @@
+Copyright (c) 2004 the University Corporation for Atmospheric
+Research ("UCAR"). All rights reserved. Developed by NCAR's
+Computational and Information Systems Laboratory, UCAR,
+www.cisl.ucar.edu.
+
+Redistribution and use of the Software in source and binary forms,
+with or without modification, is permitted provided that the
+following conditions are met:
+
+- Neither the names of NCAR's Computational and Information Systems
+Laboratory, the University Corporation for Atmospheric Research,
+nor the names of its sponsors or contributors may be used to
+endorse or promote products derived from this Software without
+specific prior written permission.
+
+- Redistributions of source code must retain the above copyright
+notices, this list of conditions, and the disclaimer below.
+
+- Redistributions in binary form must reproduce the above copyright
+notice, this list of conditions, and the disclaimer below in the
+documentation and/or other materials provided with the
+distribution.
+
+THIS SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+NONINFRINGEMENT. IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT
+HOLDERS BE LIABLE FOR ANY CLAIM, INDIRECT, INCIDENTAL, SPECIAL,
+EXEMPLARY, OR CONSEQUENTIAL DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE
+SOFTWARE.
diff --git a/meta/files/common-licenses/NICTA-1.0 b/meta/files/common-licen=
ses/NICTA-1.0
new file mode 100644
index 00000000000..04622e308d1
--- /dev/null
+++ b/meta/files/common-licenses/NICTA-1.0
@@ -0,0 +1,61 @@
+NICTA Public Software Licence
+Version 1.0
+
+Copyright =C2=A9 2004 National ICT Australia Ltd
+
+All rights reserved.
+
+By this licence, National ICT Australia Ltd (NICTA) grants permission,
+free of charge, to any person who obtains a copy of this software
+and any associated documentation files ("the Software") to use and
+deal with the Software in source code and binary forms without
+restriction, with or without modification, and to permit persons
+to whom the Software is furnished to do so, provided that the
+following conditions are met:
+
+- Redistributions of source code must retain the above copyright
+  notice, this list of conditions and the following disclaimers.
+- Redistributions in binary form must reproduce the above copyright
+  notice, this list of conditions and the following disclaimers in
+  the documentation and/or other materials provided with the
+  distribution.
+- The name of NICTA may not be used to endorse or promote products
+  derived from this Software without specific prior written permission.
+
+EXCEPT AS EXPRESSLY STATED IN THIS LICENCE AND TO THE FULL EXTENT
+PERMITTED BY APPLICABLE LAW, THE SOFTWARE IS PROVIDED "AS-IS" AND
+NICTA MAKES NO REPRESENTATIONS, WARRANTIES OR CONDITIONS OF ANY
+KIND, EXPRESS OR IMPLIED, INCLUDING, WITHOUT LIMITATION, ANY
+REPRESENTATIONS, WARRANTIES OR CONDITIONS REGARDING THE CONTENTS
+OR ACCURACY OF THE SOFTWARE, OR OF TITLE, MERCHANTABILITY, FITNESS
+FOR A PARTICULAR PURPOSE, NONINFRINGEMENT, THE ABSENCE OF LATENT
+OR OTHER DEFECTS, OR THE PRESENCE OR ABSENCE OF ERRORS, WHETHER OR
+NOT DISCOVERABLE.
+
+TO THE FULL EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT WILL
+NICTA BE LIABLE ON ANY LEGAL THEORY (INCLUDING, WITHOUT LIMITATION,
+NEGLIGENCE) FOR ANY LOSS OR DAMAGE WHATSOEVER, INCLUDING (WITHOUT
+LIMITATION) LOSS OF PRODUCTION OR OPERATION TIME, LOSS, DAMAGE OR
+CORRUPTION OF DATA OR RECORDS; OR LOSS OF ANTICIPATED SAVINGS,
+OPPORTUNITY, REVENUE, PROFIT OR GOODWILL, OR OTHER ECONOMIC LOSS;
+OR ANY SPECIAL, INCIDENTAL, INDIRECT, CONSEQUENTIAL, PUNITIVE OR
+EXEMPLARY DAMAGES ARISING OUT OF OR IN CONNECTION WITH THIS LICENCE,
+THE SOFTWARE OR THE USE OF THE SOFTWARE, EVEN IF NICTA HAS BEEN
+ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
+
+If applicable legislation implies warranties or conditions, or
+imposes obligations or liability on NICTA in respect of the Software
+that cannot be wholly or partly excluded, restricted or modified,
+NICTA's liability is limited, to the full extent permitted by the
+applicable legislation, at its option, to:
+
+a. in the case of goods, any one or more of the following:
+  i.   the replacement of the goods or the supply of equivalent goods;
+  ii.  the repair of the goods;
+  iii. the payment of the cost of replacing the goods or of acquiring
+       equivalent goods;
+  iv.  the payment of the cost of having the goods repaired; or
+b. in the case of services:
+  i.   the supplying of the services again; or=20
+  ii.  the payment of the cost of having the services supplied
+       again.
diff --git a/meta/files/common-licenses/NIST-Software b/meta/files/common-l=
icenses/NIST-Software
new file mode 100644
index 00000000000..0ae22d9052b
--- /dev/null
+++ b/meta/files/common-licenses/NIST-Software
@@ -0,0 +1,28 @@
+NIST-developed software is provided by NIST as a public service.=20
+You may use, copy, and distribute copies of the software in any=20
+medium, provided that you keep intact this entire notice. You may=20
+improve, modify, and create derivative works of the software or any=20
+portion of the software, and you may copy and distribute such=20
+modifications or works. Modified works should carry a notice stating=20
+that you changed the software and should note the date and nature of=20
+any such change. Please explicitly acknowledge the National Institute=20
+of Standards and Technology as the source of the software.
+
+NIST-developed software is expressly provided "AS IS." NIST MAKES NO=20
+WARRANTY OF ANY KIND, EXPRESS, IMPLIED, IN FACT, OR ARISING BY OPERATION=20
+OF LAW, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTY OF MERCHANTABI=
LITY,=20
+FITNESS FOR A PARTICULAR PURPOSE, NON-INFRINGEMENT, AND DATA ACCURACY. NIS=
T=20
+NEITHER REPRESENTS NOR WARRANTS THAT THE OPERATION OF THE SOFTWARE WILL BE=
=20
+UNINTERRUPTED OR ERROR-FREE, OR THAT ANY DEFECTS WILL BE CORRECTED. NIST D=
OES=20
+NOT WARRANT OR MAKE ANY REPRESENTATIONS REGARDING THE USE OF THE SOFTWARE =
OR=20
+THE RESULTS THEREOF, INCLUDING BUT NOT LIMITED TO THE CORRECTNESS, ACCURAC=
Y,=20
+RELIABILITY, OR USEFULNESS OF THE SOFTWARE.
+
+You are solely responsible for determining the appropriateness of using an=
d=20
+distributing the software and you assume all risks associated with its use=
,=20
+including but not limited to the risks and costs of program errors, compli=
ance=20
+with applicable laws, damage to or loss of data, programs or equipment, an=
d the=20
+unavailability or interruption of operation. This software is not intended=
 to be=20
+used in any situation where a failure could cause risk of injury or damage=
 to=20
+property. The software developed by NIST employees is not subject to copyr=
ight=20
+protection within the United States.
diff --git a/meta/files/common-licenses/OAR b/meta/files/common-licenses/OAR
new file mode 100644
index 00000000000..ca5c4b9617f
--- /dev/null
+++ b/meta/files/common-licenses/OAR
@@ -0,0 +1,12 @@
+COPYRIGHT (c) 1989-2013, 2015.
+On-Line Applications Research Corporation (OAR).
+
+Permission to use, copy, modify, and distribute this software for any
+purpose without fee is hereby granted, provided that this entire notice
+is included in all copies of any software which is or includes a copy
+or modification of this software.
+
+THIS SOFTWARE IS BEING PROVIDED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED
+WARRANTY.  IN PARTICULAR,  THE AUTHOR MAKES NO REPRESENTATION
+OR WARRANTY OF ANY KIND CONCERNING THE MERCHANTABILITY OF THIS
+SOFTWARE OR ITS FITNESS FOR ANY PARTICULAR PURPOSE.
diff --git a/meta/files/common-licenses/OFFIS b/meta/files/common-licenses/=
OFFIS
new file mode 100644
index 00000000000..ad48f181c39
--- /dev/null
+++ b/meta/files/common-licenses/OFFIS
@@ -0,0 +1,22 @@
+Copyright (C) 1994-2001, OFFIS
+
+This software and supporting documentation were developed by
+=20
+Kuratorium OFFIS e.V.
+Healthcare Information and Communication Systems
+Escherweg 2
+D-26121 Oldenburg, Germany
+=20
+THIS SOFTWARE IS MADE AVAILABLE,  AS IS,  AND OFFIS MAKES NO  WARRANTY
+REGARDING  THE  SOFTWARE,  ITS  PERFORMANCE,  ITS  MERCHANTABILITY  OR
+FITNESS FOR ANY PARTICULAR USE, FREEDOM FROM ANY COMPUTER DISEASES  OR
+ITS CONFORMITY TO ANY SPECIFICATION. THE ENTIRE RISK AS TO QUALITY AND
+PERFORMANCE OF THE SOFTWARE IS WITH THE USER.
+
+Copyright of the software  and  supporting  documentation  is,  unless
+otherwise stated, owned by OFFIS, and free access is hereby granted as
+a license to  use  this  software,  copy  this  software  and  prepare
+derivative works based upon this software.  However, any  distribution
+of this software source code or supporting documentation or derivative
+works  (source code and  supporting documentation)  must  include  the
+three paragraphs of this copyright notice.
diff --git a/meta/files/common-licenses/OLFL-1.3 b/meta/files/common-licens=
es/OLFL-1.3
new file mode 100644
index 00000000000..77ffc8dc077
--- /dev/null
+++ b/meta/files/common-licenses/OLFL-1.3
@@ -0,0 +1,220 @@
+Open Logistics Foundation License
+Version 1.3, January 2023
+https://www.openlogisticsfoundation.org/licenses/
+
+TERMS AND CONDITIONS FOR USE, REPRODUCTION AND DISTRIBUTION
+
+=C2=A71 Definitions
+
+(1) "Subject Matter of the License" shall mean the works of software compo=
nents
+in Source or Object form as well as any other components protected under
+copyright, design and/or patent law which are made available under this Li=
cense.
+
+(2) "License" shall mean the terms and conditions for the use, reproductio=
n and
+distribution of the Subject Matter of the License in accordance with the
+provisions of this document.
+
+(3) "Licensor(s)" shall mean the copyright holder(s) or the entity authori=
zed by
+law or contract by the copyright holder(s) to grant the License.
+
+(4) "You" (or "Your") shall mean a natural or legal person exercising the
+permissions granted by this License.
+
+(5) "Source" form shall mean the preferred form for making modifications,
+including but not limited to software source code, documentation source, a=
nd
+configuration files.
+
+(6) "Object" form shall mean any form resulting from mechanical transforma=
tion
+or translation of a Source form, including but not limited to compiled obj=
ect
+code, generated documentation, and conversions to other media types.
+
+(7) "Derivative Works" shall mean any work, whether in Source or Object fo=
rm or
+any other form, that is based on (or derived from) the Subject Matter of t=
he
+License and for which the editorial revisions, annotations, elaborations, =
or
+other modifications represent, as a whole, an original work of authorship.=
 For
+the purposes of this License, Derivative Works shall not include works that
+remain separable from, or merely link (or bind by name) to the interfaces =
of,
+the Subject Matter of the License and Derivative Works thereof.
+
+(8) "Contribution" shall mean any proprietary work, including the original
+version of the Subject Matter of the License and any changes or additions =
to
+such work, or Derivative Works of such work, that the rights holder, or a
+natural or legal person authorized to make submissions, intentionally subm=
its to
+a Licensor to be incorporated into the Subject Matter of the License. For =
the
+purposes of this definition, "submit" shall mean any form of electronic or
+written communication which is sent to a Licensor or its representatives f=
or the
+purpose of discussing or improving the Subject Matter of the License, incl=
uding
+but not limited to communications sent via electronic mailing lists, sourc=
e code
+control systems and issue tracking systems; however, communications that a=
re
+clearly marked by the copyright holder as "not a contribution" or otherwise
+identified as such in writing are excluded.
+
+(9) "Contributor" shall mean the Licensor(s) and/or any natural or legal p=
erson
+on whose behalf the Licensor(s) receive(s) any Contribution subsequently
+incorporated into the Subject Matter of the License.
+
+=C2=A72 Grant of usage rights
+
+Subject to the terms and conditions of this License and compliance with the
+provisions of this License, You are hereby granted by each Contributor, in=
sofar
+as applicable to the respective Subject Matter of the License the
+
+- royalty-free and non-exclusive,
+- sub-licensable for commercial and non-commercial purposes,
+- worldwide and perpetual,
+- irrevocable and non-terminable
+
+right to reproduce, prepare Derivative Works of, publicly display, publicly
+perform, and distribute the Subject Matter of the License and such Derivat=
ive
+Works in any form. This right of use includes but is not limited to the ri=
ght
+
+- to use the Subject Matter of the License in any hardware and software
+  environment (with regard to the software and data components), in partic=
ular
+  to store or load it permanently or temporarily, to display it and run it,
+  including to the extent reproductions are necessary to that end,
+- to otherwise modify, interpret, edit or redesign it,
+- to store, reproduce, exhibit, publish, distribute it in tangible or inta=
ngible
+  form, on any medium or in any other way, for commercial and non-commerci=
al
+  purposes, in particular to communicate it privately or publicly, includi=
ng via
+  image, audio and other information carriers, irrespective of whether by =
wire
+  or wireless means,
+- to use it in databases, data networks and online services, including the=
 right
+  to make the software and data components of the Subject Matter of the Li=
cense
+  available in Source or Object form to users of the aforementioned databa=
ses,
+  networks and online services for research and retrieval purposes,
+- to allow third parties to use or operate it,
+- to use it for own purposes but also to provide services to third parties,
+- to distribute it
+
+in its original or modified, interpreted, edited or redesigned form.
+
+The foregoing right of use relates to the Subject Matter of the License, in
+particular to its Source and Object form of software components (including
+design rights, where applicable).
+
+=C2=A73 Grant of patent license
+
+Subject to the terms and conditions of this License and compliance with the
+provisions of this License, You are hereby granted by each Contributor a=20
+- royalty-free and non-exclusive,
+- worldwide and perpetual,
+- irrevocable (with the exception of the restrictions set out in this Sect=
ion 3)
+
+patent license in all rights deriving from the patents, owned and licensab=
le by
+the Contributor at the time of the submission of the Contribution, to
+
+- produce,
+- have produced,
+- use,
+- offer for sale,
+- sell,
+- import and otherwise transfer
+
+the Subject Matter of the License.
+
+However, said patent license shall cover only those rights deriving from t=
he
+patents of the respective Contributors which are indispensable in order no=
t to
+infringe that patent and only to the extent that the use of the Contributo=
r=E2=80=99s
+respective Contributions, whether alone or in combination with other
+Contributions of the Contributors or any third parties together with the S=
ubject
+Matter of the License for which these Contributions were submitted, would
+otherwise infringe that patent. The grant of license shall not include rig=
hts
+deriving from the patents which may in future become necessary for their l=
awful
+use due to subsequent modifications to the Subject Matter or Contributions=
 made
+by third parties after the original submission.
+
+In the event that You institute patent litigation against any entity or pe=
rson
+(including a counterclaim or countersuit in a legal action), alleging that=
 the
+Subject Matter of the License or a Contribution incorporated or contained
+therein constitutes patent infringement or indirect infringement, all pate=
nt
+licenses which have been granted to You under this License for the Subject
+Matter of the License as well as this License itself shall be deemed termi=
nated
+as of the date on which the action is filed.
+
+=C2=A74 Distribution
+
+You may reproduce and distribute copies of the Subject Matter of the Licen=
se or
+Derivative Works on any medium, with or without modifications (with regard=
 to
+software components in Source or Object form), provided that You comply wi=
th
+the following rules:
+
+- You must provide all other recipients of the Subject Matter of the Licen=
se or
+  of Derivative Works with a copy of this License and inform them that the
+  Subject Matter of the License was originally licensed under this License.
+- You must ensure that modified files contain prominent notices indicating=
 that
+  You have modified the files.
+- You must retain all copyright, patent, trademark and attribution notices=
 in
+  the Subject Matter of the License in the Source form of any Derivative W=
orks
+  You distribute, with the exception of those notices that do not pertain =
to any
+  part of the Derivative Works.
+
+You may add Your own copyright notices to Your modifications and state any
+additional or different license conditions and conditions for the use,
+reproduction or distribution of Your modifications or for those Derivative=
 Works
+as a whole, provided that Your use, reproduction and distribution of the w=
ork
+complies with the terms and conditions set out in this License in all other
+respects.
+
+=C2=A75 Submission of Contributions
+
+Unless expressly stated otherwise, every Contribution that You have
+intentionally submitted for inclusion in the Subject Matter of the License=
 is
+subject to this License without any additional terms or conditions applyin=
g.
+Irrespective of the above, none of the terms or conditions contained herei=
n may
+be interpreted to supersede or modify the terms or conditions of any separ=
ate
+licensing agreement that You may have concluded with a Licensor for such
+Contributions, such as a so-called "Contributor License Agreement" (CLA).
+
+=C2=A76 Trademarks
+
+This License does not grant permission to use the trade names, trademarks,
+service marks or product names of the Licensor(s) or of a Contributor.
+
+=C2=A77 Limited warranty
+
+This License is granted free of charge and thus constitutes a gift. Accord=
ingly,
+any warranty is excluded. The Subject Matter of the License is a work in
+progress; it is constantly being improved by countless Contributors. The S=
ubject
+Matter of the License is not complete and may therefore contain errors ("b=
ugs")
+or additional patents of Contributors or third parties, as is inherent in =
this
+type of development.
+
+=C2=A78 Limitation of liability
+
+Except in cases of intentional and grossly negligent conduct, the Contribu=
tors,
+their legal representatives, trustees, officers and employees shall not be
+liable for direct or indirect, material or immaterial loss or damage of an=
y kind
+arising from the License or the use of the Subject Matter of the License; =
this
+applies, among other things, but not exclusively, to loss of goodwill, los=
s of
+production, computer failures or errors, loss of data or economic loss or
+damage, even if the Contributor has been notified of the possibility of su=
ch
+loss or damage. Irrespective of the above, the Licensor shall only be liab=
le
+within the scope of statutory product liability to the extent that the
+respective provisions are applicable to the Subject Matter of the License =
or the
+Contribution.
+
+Except in cases of intentional conduct, the Contributors, their legal
+representatives, trustees, officers and employees shall not be liable for =
any
+infringement of third-party patent or intellectual property rights arising=
 from
+the Contributions nor do they warrant that the Contributions are accurate,
+devoid of mistakes, complete and/or fit for any particular purpose.
+
+=C2=A79 Provision of warranties or assumption of additional liability in t=
he event of
+distribution of the Subject Matter of the License
+
+In the event of distribution of the Subject Matter of the License or Deriv=
ative
+Works, You are free to accept support, warranty, indemnity or other liabil=
ity
+obligations and/or rights consistent with this License and to charge a fee=
 in
+return. However, in accepting such obligations, You may act only on Your o=
wn
+behalf and on Your sole responsibility, not on behalf of any other Contrib=
utor,
+and You hereby agree to indemnify, defend, and hold each Contributor harml=
ess
+for any liability incurred by, or claims asserted against, such Contributo=
r by
+reason of Your accepting any such warranty or additional liability.
+
+=C2=A710 Applicable law
+
+This License is governed by German law, excluding its conflict of laws
+provisions and the provisions of the UN Convention on Contracts for the
+International Sale of Goods (CISG).
+
+END OF TERMS AND CONDITIONS
diff --git a/meta/files/common-licenses/OPL-UK-3.0 b/meta/files/common-lice=
nses/OPL-UK-3.0
new file mode 100644
index 00000000000..ee8ca4dd81c
--- /dev/null
+++ b/meta/files/common-licenses/OPL-UK-3.0
@@ -0,0 +1,114 @@
+United Kingdom Open Parliament Licence v3.0
+
+Open Parliament Licence
+
+You are encouraged to use and re-use the information that
+is available under this licence freely and flexibly, with
+only a few conditions. Using information under this licence
+
+Use of copyright and database right material made
+available under this licence (the =E2=80=98information=E2=80=99) indicates
+your acceptance of the terms and conditions below.
+
+The Licensor grants you a worldwide, royalty-free,
+perpetual, non-exclusive licence to use the
+information subject to the conditions below.
+
+This licence does not affect your freedom under
+fair dealing or fair use or any other copyright
+or database right exceptions and limitations.
+
+You are free to:
+    * copy, publish, distribute and transmit the information
+    * adapt the information=20
+    * exploit the information commercially and non-commercially,=20
+    for example, by combining it with other information,=20
+    or by  including it in your own product or application
+
+You must (where you do any of the above):
+    * acknowledge the source of the information in your
+    product or application by including the following
+    attribution statement and, where possible, provide a
+    link to this licence: Contains Parliamentary information
+    licensed under the Open Parliament Licence v3.0.
+
+These are important conditions of this licence and
+if you fail to comply with them the rights granted to
+you under this licence, or any similar licence granted
+by the Licensor, will end automatically.=20
+
+Exemptions
+
+This licence does not cover the use of:
+    * personal data in the information;
+    * information that has neither been published nor disclosed
+    under information access legislation (including the=20
+    Freedom of Information Acts for the UK and Scotland) by or
+    with the consent of the Licensor;
+    * the Royal Arms and the Crowned Portcullis;
+    * third party rights the Licensor is not authorised to license;=20
+    * information subject to other intellectual property rights,
+    including patents, trademarks, and design rights
+
+Non-endorsment
+
+This licence does not grant you any right to use the
+information in a way that suggests any official status or
+that the Licensor endorses you or your use of the Information.
+
+No warranty
+
+The information is licensed =E2=80=98as is=E2=80=99 and the
+Licensor excludes all representations, warranties,
+obligations and liabilities in relation to the
+information to the maximum extent permitted by law.
+The Licensor is not liable for any errors or omissions in
+the information and shall not be liable for any loss, injury
+or damage of any kind caused by its use. The Licensor does
+not guarantee the continued supply of the information.
+
+Governing law
+
+This licence is governed by the laws of England and Wales.
+
+Definitions
+
+In this licence, the terms below have the following meanings:
+
+=E2=80=98Information=E2=80=99 means information protected by copyright
+or by database right (for example, literary and
+artistic works, content, data and source code)
+offered for use under the terms of this licence.
+
+=E2=80=98Information Provider=E2=80=99 means either House of Parliament.
+
+=E2=80=98Licensor=E2=80=99 means=E2=80=94
+(a) in relation to copyright, the Speaker of the House of
+Commons and the Clerk of the Parliaments representing
+the House of Commons and House of Lords respectively, and
+(b) in relation to database right, the Corporate
+Officer of the House of Commons and the Corporate
+Officer of the House of Lords respectively.
+
+=E2=80=98Use=E2=80=99 means doing any act which is restricted by copyright
+or database right, whether in the original medium or in any
+other medium, and includes without limitation distributing,
+copying, adapting and modifying as may be technically
+necessary to use it in a different mode or format.
+
+=E2=80=98You=E2=80=99 means the natural or legal person, or body of persons
+corporate or incorporate, acquiring rights under this licence.
+
+About the Open Parliament Licence
+
+This is version 3.0 of the Open Parliament Licence. The
+Licensor may, from time to time, issue new versions of the
+Open Parliament Licence. However, you may continue to use
+information licensed under this version should you wish to do so.
+
+The information licensed under the Open Parliament
+Licence includes Parliamentary information in which
+Crown copyright subsists. Further context, best practice
+and guidance relating to the re-use of public sector
+information can be found in the UK Government Licensing
+Framework section on The National Archives website.
diff --git a/meta/files/common-licenses/OpenPBS-2.3 b/meta/files/common-lic=
enses/OpenPBS-2.3
new file mode 100644
index 00000000000..220fbe92708
--- /dev/null
+++ b/meta/files/common-licenses/OpenPBS-2.3
@@ -0,0 +1,77 @@
+
+        OpenPBS (Portable Batch System) v2.3 Software License
+
+Copyright (c) 1999-2000 Veridian Information Solutions, Inc.
+All rights reserved.
+
+---------------------------------------------------------------------------
+For a license to use or redistribute the OpenPBS software under conditions
+other than those described below, or to purchase support for this software,
+please contact Veridian Systems, PBS Products Department ("Licensor") at:
+
+   www.OpenPBS.org  +1 650 967-4675                  sales@OpenPBS.org
+                       877 902-4PBS (US toll-free)
+---------------------------------------------------------------------------
+
+This license covers use of the OpenPBS v2.3 software (the "Software") at
+your site or location, and, for certain users, redistribution of the
+Software to other sites and locations.  Use and redistribution of
+OpenPBS v2.3 in source and binary forms, with or without modification,
+are permitted provided that all of the following conditions are met.
+After December 31, 2001, only conditions 3-6 must be met:
+
+1. Commercial and/or non-commercial use of the Software is permitted
+   provided a current software registration is on file at www.OpenPBS.org.
+   If use of this software contributes to a publication, product, or
+   service, proper attribution must be given; see www.OpenPBS.org/credit.h=
tml
+
+2. Redistribution in any form is only permitted for non-commercial,
+   non-profit purposes.  There can be no charge for the Software or any
+   software incorporating the Software.  Further, there can be no
+   expectation of revenue generated as a consequence of redistributing
+   the Software.
+
+3. Any Redistribution of source code must retain the above copyright notice
+   and the acknowledgment contained in paragraph 6, this list of conditions
+   and the disclaimer contained in paragraph 7.
+
+4. Any Redistribution in binary form must reproduce the above copyright
+   notice and the acknowledgment contained in paragraph 6, this list of
+   conditions and the disclaimer contained in paragraph 7 in the
+   documentation and/or other materials provided with the distribution.
+
+5. Redistributions in any form must be accompanied by information on how to
+   obtain complete source code for the OpenPBS software and any
+   modifications and/or additions to the OpenPBS software.  The source code
+   must either be included in the distribution or be available for no more
+   than the cost of distribution plus a nominal fee, and all modifications
+   and additions to the Software must be freely redistributable by any par=
ty
+   (including Licensor) without restriction.
+
+6. All advertising materials mentioning features or use of the Software mu=
st
+   display the following acknowledgment:
+
+    "This product includes software developed by NASA Ames Research Center,
+    Lawrence Livermore National Laboratory, and Veridian Information Solut=
ions,
+    Inc.  Visit www.OpenPBS.org for OpenPBS software support,
+    products, and information."
+
+7. DISCLAIMER OF WARRANTY
+
+THIS SOFTWARE IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND. ANY EXPRESS
+OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTI=
ES
+OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT
+ARE EXPRESSLY DISCLAIMED.
+
+IN NO EVENT SHALL VERIDIAN CORPORATION, ITS AFFILIATED COMPANIES, OR THE
+U.S. GOVERNMENT OR ANY OF ITS AGENCIES BE LIABLE FOR ANY DIRECT OR INDIREC=
T,
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT N=
OT
+LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
+OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWAR=
E,
+EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+This license will be governed by the laws of the Commonwealth of Virginia,
+without reference to its choice of law rules.
+
diff --git a/meta/files/common-licenses/OpenSSL-standalone b/meta/files/com=
mon-licenses/OpenSSL-standalone
new file mode 100644
index 00000000000..82b14c736d8
--- /dev/null
+++ b/meta/files/common-licenses/OpenSSL-standalone
@@ -0,0 +1,50 @@
+Copyright (c) 1998-2019 The OpenSSL Project.  All rights reserved.
+=20
+  Redistribution and use in source and binary forms, with or without
+  modification, are permitted provided that the following conditions
+  are met:
+=20
+  1. Redistributions of source code must retain the above copyright
+     notice, this list of conditions and the following disclaimer.
+=20
+  2. Redistributions in binary form must reproduce the above copyright
+     notice, this list of conditions and the following disclaimer in
+     the documentation and/or other materials provided with the
+     distribution.
+=20
+  3. All advertising materials mentioning features or use of this
+     software must display the following acknowledgment:
+     "This product includes software developed by the OpenSSL Project
+     for use in the OpenSSL Toolkit. (http://www.openssl.org/)"
+=20
+  4. The names "OpenSSL Toolkit" and "OpenSSL Project" must not be used to
+     endorse or promote products derived from this software without
+     prior written permission. For written permission, please contact
+     openssl-core@openssl.org.
+=20
+  5. Products derived from this software may not be called "OpenSSL"
+     nor may "OpenSSL" appear in their names without prior written
+     permission of the OpenSSL Project.
+=20
+  6. Redistributions of any form whatsoever must retain the following
+     acknowledgment:
+     "This product includes software developed by the OpenSSL Project
+     for use in the OpenSSL Toolkit (http://www.openssl.org/)"
+=20
+  THIS SOFTWARE IS PROVIDED BY THE OpenSSL PROJECT ``AS IS'' AND ANY
+  EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+  PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE OpenSSL PROJECT OR
+  ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
+  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
+  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
+  OF THE POSSIBILITY OF SUCH DAMAGE.
+  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+=20
+  This product includes cryptographic software written by Eric Young
+  (eay@cryptsoft.com).  This product includes software written by Tim
+  Hudson (tjh@cryptsoft.com).
diff --git a/meta/files/common-licenses/OpenVision b/meta/files/common-lice=
nses/OpenVision
new file mode 100644
index 00000000000..983505389e4
--- /dev/null
+++ b/meta/files/common-licenses/OpenVision
@@ -0,0 +1,33 @@
+Copyright, OpenVision Technologies, Inc., 1993-1996, All Rights
+Reserved
+
+WARNING:  Retrieving the OpenVision Kerberos Administration system
+source code, as described below, indicates your acceptance of the
+following terms.  If you do not agree to the following terms, do
+not retrieve the OpenVision Kerberos administration system.
+
+You may freely use and distribute the Source Code and Object Code
+compiled from it, with or without modification, but this Source
+Code is provided to you "AS IS" EXCLUSIVE OF ANY WARRANTY,
+INCLUDING, WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY OR
+FITNESS FOR A PARTICULAR PURPOSE, OR ANY OTHER WARRANTY, WHETHER
+EXPRESS OR IMPLIED. IN NO EVENT WILL OPENVISION HAVE ANY LIABILITY
+FOR ANY LOST PROFITS, LOSS OF DATA OR COSTS OF PROCUREMENT OF
+SUBSTITUTE GOODS OR SERVICES, OR FOR ANY SPECIAL, INDIRECT, OR
+CONSEQUENTIAL DAMAGES ARISING OUT OF THIS AGREEMENT, INCLUDING,
+WITHOUT LIMITATION, THOSE RESULTING FROM THE USE OF THE SOURCE
+CODE, OR THE FAILURE OF THE SOURCE CODE TO PERFORM, OR FOR ANY
+OTHER REASON.
+
+OpenVision retains all copyrights in the donated Source Code.
+OpenVision also retains copyright to derivative works of the Source
+Code, whether created by OpenVision or by a third party. The
+OpenVision copyright notice must be preserved if derivative works
+are made based on the donated Source Code.
+
+OpenVision Technologies, Inc. has donated this Kerberos
+Administration system to MIT for inclusion in the standard Kerberos
+5 distribution. This donation underscores our commitment to
+continuing Kerberos technology development and our gratitude for
+the valuable work which has been performed by MIT and the Kerberos
+community.
diff --git a/meta/files/common-licenses/PADL b/meta/files/common-licenses/P=
ADL
new file mode 100644
index 00000000000..84ba0b4db99
--- /dev/null
+++ b/meta/files/common-licenses/PADL
@@ -0,0 +1,6 @@
+Portions (C) Copyright PADL Software Pty Ltd. 1999
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that this notice is preserved
+and that due credit is given to PADL Software Pty Ltd. This software
+is provided ``as is'' without express or implied warranty.
diff --git a/meta/files/common-licenses/PPL b/meta/files/common-licenses/PPL
new file mode 100644
index 00000000000..013303699e5
--- /dev/null
+++ b/meta/files/common-licenses/PPL
@@ -0,0 +1,96 @@
+Peer Production License
+
+Created by John Magyar, B.A., J.D. and Dmytri Kleiner, the following Peer =
Production License, a model for a Copyfarleft license, has been derived fro=
m the Creative Commons =E2=80=98Attribution-NonCommercial-ShareAlike' licen=
se available at http://creativecommons.org/licenses/by-nc-sa/3.0/legalcode.
+
+LICENSE
+
+THE WORK (AS DEFINED BELOW) IS PROVIDED UNDER THE TERMS OF THIS COPYFARLEF=
T PUBLIC LICENSE ("LICENSE"). THE WORK IS PROTECTED BY COPYRIGHT AND ALL OT=
HER APPLICABLE LAWS. ANY USE OF THE WORK OTHER THAN AS AUTHORIZED UNDER THI=
S LICENSE OR COPYRIGHT LAW IS PROHIBITED. BY EXERCISING ANY RIGHTS TO THE W=
ORK PROVIDED IN THIS LICENSE, YOU AGREE TO BE BOUND BY THE TERMS OF THIS LI=
CENSE. TO THE EXTENT THIS LICENSE MAY BE CONSIDERED TO BE A CONTRACT, THE L=
ICENSOR GRANTS YOU THE RIGHTS CONTAINED HERE IN AS CONSIDERATION FOR ACCEPT=
ING THE TERMS AND CONDITIONS OF THIS LICENSE AND FOR AGREEING TO BE BOUND B=
Y THE TERMS AND CONDITIONS OF THIS LICENSE.
+
+1. DEFINITIONS
+
+    a. "Adaptation" means a work based upon the Work, or upon the Work and=
 other pre-existing works, such as a translation, adaptation, derivative wo=
rk, arrangement of music or other alterations of a literary or artistic wor=
k, or phonogram or performance and includes cinematographic adaptations or =
any other form in which the Work may be recast, transformed, or adapted inc=
luding in any form recognizably derived from the original, except that a wo=
rk that constitutes a Collection will not be considered an Adaptation for t=
he purpose of this License. For the avoidance of doubt, where the Work is a=
 musical work, performance or phonogram, the synchronization of the Work in=
 timed-relation with a moving image ("synching") will be considered an Adap=
tation for the purpose of this License.
+
+    b. "Collection" means a collection of literary or artistic works, such=
 as encyclopedias and anthologies, or performances, phonograms or broadcast=
s, or other works or subject matter other than works listed in Section 1(f)=
 below, which, by reason of the selection and arrangement of their contents=
, constitute intellectual creations, in which the Work is included in its e=
ntirety in unmodified form along with one or more other contributions, each=
 constituting separate and independent works in themselves, which together =
are assembled into a collective whole. A work that constitutes a Collection=
 will not be considered an Adaptation (as defined above) for the purposes o=
f this License.
+
+    c. "Distribute" means to make available to the public the original and=
 copies of the Work or Adaptation, as appropriate, through sale, gift or an=
y other transfer of possession or ownership.
+
+    d. "Licensor" means the individual, individuals, entity or entities th=
at offer(s) the Work under the terms of this License.
+
+    e. "Original Author" means, in the case of a literary or artistic work=
, the individual, individuals, entity or entities who created the Work or i=
f no individual or entity can be identified, the publisher; and in addition=
 (i) in the case of a performance the actors, singers, musicians, dancers, =
and other persons who act, sing, deliver, declaim, play in, interpret or ot=
herwise perform literary or artistic works or expressions of folklore; (ii)=
 in the case of a phonogram the producer being the person or legal entity w=
ho first fixes the sounds of a performance or other sounds; and, (iii) in t=
he case of broadcasts, the organization that transmits the broadcast.
+
+    f. "Work" means the literary and/or artistic work offered under the te=
rms of this License including without limitation any production in the lite=
rary, scientific and artistic domain, whatever may be the mode or form of i=
ts expression including digital form, such as a book, pamphlet and other wr=
iting; a lecture, address, sermon or other work of the same nature; a drama=
tic or dramatico-musical work; a choreographic work or entertainment in dum=
b show; a musical composition with or without words; a cinematographic work=
 to which are assimilated works expressed by a process analogous to cinemat=
ography; a work of drawing, painting, architecture, sculpture, engraving or=
 lithography; a photographic work to which are assimilated works expressed =
by a process analogous to photography; a work of applied art; an illustrati=
on, map, plan, sketch or three-dimensional work relative to geography, topo=
graphy, architecture or science; a performance; a broadcast; a phonogram; a=
 compilation of data to the extent it is protected as a copyrightable work;=
 or a work performed by a variety or circus performer to the extent it is n=
ot otherwise considered a literary or artistic work.
+
+    g. "You" means an individual or entity exercising rights under this Li=
cense who has not previously violated the terms of this License with respec=
t to the Work, or who has received express permission from the Licensor to =
exercise rights under this License despite a previous violation.
+
+    h. "Publicly Perform" means to perform public recitations of the Work =
and to communicate to the public those public recitations, by any means or =
process, including by wire or wireless means or public digital performances=
; to make available to the public Works in such a way that members of the p=
ublic may access these Works from a place and at a place individually chose=
n by them; to perform the Work to the public by any means or process and th=
e communication to the public of the performances of the Work, including by=
 public digital performance; to broadcast and rebroadcast the Work by any m=
eans including signs, sounds or images.
+
+    i. "Reproduce" means to make copies of the Work by any means including=
 without limitation by sound or visual recordings and the right of fixation=
 and reproducing fixations of the Work, including storage of a protected pe=
rformance or phonogram in digital form or other electronic medium.
+
+2. FAIR DEALING RIGHTS
+Nothing in this License is intended to reduce, limit, or restrict any uses=
 free from copyright or rights arising from limitations or exceptions that =
are provided for in connection with the copyright protection under copyrigh=
t law or other applicable laws.
+
+3. LICENSE GRANT
+Subject to the terms and conditions of this License, Licensor hereby grant=
s You a worldwide, royalty-free, non-exclusive, perpetual (for the duration=
 of the applicable copyright) license to exercise the rights in the Work as=
 stated below:
+
+    a. to Reproduce the Work, to incorporate the Work into one or more Col=
lections, and to Reproduce the Work as incorporated in the Collections;
+
+    b. to create and Reproduce Adaptations provided that any such Adaptati=
on, including any translation in any medium, takes reasonable steps to clea=
rly label, demarcate or otherwise identify that changes were made to the or=
iginal Work. For example, a translation could be marked "The original work =
was translated from English to Spanish," or a modification could indicate "=
The original work has been modified.";
+
+    c. to Distribute and Publicly Perform the Work including as incorporat=
ed in Collections; and,
+
+    d. to Distribute and Publicly Perform Adaptations. The above rights ma=
y be exercised in all media and formats whether now known or hereafter devi=
sed. The above rights include the right to make such modifications as are t=
echnically necessary to exercise the rights in other media and formats. Sub=
ject to Section 8(f), all rights not expressly granted by Licensor are here=
by reserved, including but not limited to the rights set forth in Section 4=
(f).
+
+4. RESTRICTIONS
+The license granted in Section 3 above is expressly made subject to and li=
mited by the following restrictions:
+
+    a. You may Distribute or Publicly Perform the Work only under the term=
s of this License. You must include a copy of, or the Uniform Resource Iden=
tifier (URI) for, this License with every copy of the Work You Distribute o=
r Publicly Perform. You may not offer or impose any terms on the Work that =
restrict the terms of this License or the ability of the recipient of the W=
ork to exercise the rights granted to that recipient under the terms of the=
 License. You may not sublicense the Work. You must keep intact all notices=
 that refer to this License and to the disclaimer of warranties with every =
copy of the Work You Distribute or Publicly Perform. When You Distribute or=
 Publicly Perform the Work, You may not impose any effective technological =
measures on the Work that restrict the ability of a recipient of the Work f=
rom You to exercise the rights granted to that recipient under the terms of=
 the License. This Section 4(a) applies to the Work as incorporated in a Co=
llection, but this does not require the Collection apart from the Work itse=
lf to be made subject to the terms of this License. If You create a Collect=
ion, upon notice from any Licensor You must, to the extent practicable, rem=
ove from the Collection any credit as required by Section 4(d), as requeste=
d. If You create an Adaptation, upon notice from any Licensor You must, to =
the extent practicable, remove from the Adaptation any credit as required b=
y Section 4(d), as requested.
+
+    b. Subject to the exception in Section 4(c), you may not exercise any =
of the rights granted to You in Section 3 above in any manner that is prima=
rily intended for or directed toward commercial advantage or private moneta=
ry compensation. The exchange of the Work for other copyrighted works by me=
ans of digital file-sharing or otherwise shall not be considered to be inte=
nded for or directed toward commercial advantage or private monetary compen=
sation, provided there is no payment of any monetary compensation in connec=
tion with the exchange of copyrighted works.
+
+    c. You may exercise the rights granted in Section 3 for commercial pur=
poses only if:
+
+        i. You are a worker-owned business or worker-owned collective; and
+
+	ii. all financial gain, surplus, profits and benefits produced by the bus=
iness or collective are distributed among the worker-owners
+
+    d. Any use by a business that is privately owned and managed, and that=
 seeks to generate profit from the labor of employees paid by salary or oth=
er wages, is not permitted under this license.
+
+    e. If You Distribute, or Publicly Perform the Work or any Adaptations =
or Collections, You must, unless a request has been made pursuant to Sectio=
n 4(a), keep intact all copyright notices for the Work and provide, reasona=
ble to the medium or means You are utilizing: (i) the name of the Original =
Author (or pseudonym, if applicable) if supplied, and/or if the Original Au=
thor and/or Licensor designate another party or parties (e.g., a sponsor in=
stitute, publishing entity, journal) for attribution ("Attribution Parties"=
) in Licensor's copyright notice, terms of service or by other reasonable m=
eans, the name of such party or parties; (ii) the title of the Work if supp=
lied; (iii) to the extent reasonably practicable, the URI, if any, that Lic=
ensor specifies to be associated with the Work, unless such URI does not re=
fer to the copyright notice or licensing information for the Work; and, (iv=
) consistent with Section 3(b), in the case of an Adaptation, a credit iden=
tifying the use of the Work in the Adaptation (e.g., "French translation of=
 the Work by Original Author," or "Screenplay based on original Work by Ori=
ginal Author"). The credit required by this Section 4(d) may be implemented=
 in any reasonable manner; provided, however, that in the case of a Adaptat=
ion or Collection, at a minimum such credit will appear, if a credit for al=
l contributing authors of the Adaptation or Collection appears, then as par=
t of these credits and in a manner at least as prominent as the credits for=
 the other contributing authors. For the avoidance of doubt, You may only u=
se the credit required by this Section for the purpose of attribution in th=
e manner set out above and, by exercising Your rights under this License, Y=
ou may not implicitly or explicitly assert or imply any connection with, sp=
onsorship or endorsement by the Original Author, Licensor and/or Attributio=
n Parties, as appropriate, of You or Your use of the Work, without the sepa=
rate, express prior written permission of the Original Author, Licensor and=
/or Attribution Parties.
+
+    f. For the avoidance of doubt:
+
+        i. Non-waivable Compulsory License Schemes. In those jurisdictions=
 in which the right to collect royalties through any statutory or compulsor=
y licensing scheme cannot be waived, the Licensor reserves the exclusive ri=
ght to collect such royalties for any exercise by You of the rights granted=
 under this License;
+
+	ii. Waivable Compulsory License Schemes. In those jurisdictions in which =
the right to collect royalties through any statutory or compulsory licensin=
g scheme can be waived, the Licensor reserves the exclusive right to collec=
t such royalties for any exercise by You of the rights granted under this L=
icense if Your exercise of such rights is for a purpose or use which is oth=
erwise than noncommercial as permitted under Section 4(b) and otherwise wai=
ves the right to collect royalties through any statutory or compulsory lice=
nsing scheme; and,
+
+	iii.Voluntary License Schemes. The Licensor reserves the right to collect=
 royalties, whether individually or, in the event that the Licensor is a me=
mber of a collecting society that administers voluntary licensing schemes, =
via that society, from any exercise by You of the rights granted under this=
 License that is for a purpose or use which is otherwise than noncommercial=
 as permitted under Section 4(b).
+
+    g. Except as otherwise agreed in writing by the Licensor or as may be =
otherwise permitted by applicable law, if You Reproduce, Distribute or Publ=
icly Perform the Work either by itself or as part of any Adaptations or Col=
lections, You must not distort, mutilate, modify or take other derogatory a=
ction in relation to the Work which would be prejudicial to the Original Au=
thor's honor or reputation. Licensor agrees that in those jurisdictions (e.=
g. Japan), in which any exercise of the right granted in Section 3(b) of th=
is License (the right to make Adaptations) would be deemed to be a distorti=
on, mutilation, modification or other derogatory action prejudicial to the =
Original Author's honor and reputation, the Licensor will waive or not asse=
rt, as appropriate, this Section, to the fullest extent permitted by the ap=
plicable national law, to enable You to reasonably exercise Your right unde=
r Section 3(b) of this License (right to make Adaptations) but not otherwis=
e.
+
+5. REPRESENTATIONS, WARRANTIES AND DISCLAIMER
+
+UNLESS OTHERWISE MUTUALLY AGREED TO BY THE PARTIES IN WRITING, LICENSOR OF=
FERS THE WORK AS-IS AND MAKES NO REPRESENTATIONS OR WARRANTIES OF ANY KIND =
CONCERNING THE WORK, EXPRESS, IMPLIED, STATUTORY OR OTHERWISE, INCLUDING, W=
ITHOUT LIMITATION, WARRANTIES OF TITLE, MERCHANTIBILITY, FITNESS FOR A PART=
ICULAR PURPOSE, NONINFRINGEMENT, OR THE ABSENCE OF LATENT OR OTHER DEFECTS,=
 ACCURACY, OR THE PRESENCE OF ABSENCE OF ERRORS, WHETHER OR NOT DISCOVERABL=
E. SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION OF IMPLIED WARRANTIES, SO =
SUCH EXCLUSION MAY NOT APPLY TO YOU.
+
+6. LIMITATION ON LIABILITY
+
+EXCEPT TO THE EXTENT REQUIRED BY APPLICABLE LAW, IN NO EVENT WILL LICENSOR=
 BE LIABLE TO YOU ON ANY LEGAL THEORY FOR ANY SPECIAL, INCIDENTAL, CONSEQUE=
NTIAL, PUNITIVE OR EXEMPLARY DAMAGES ARISING OUT OF THIS LICENSE OR THE USE=
 OF THE WORK, EVEN IF LICENSOR HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH =
DAMAGES.
+
+7. TERMINATION
+
+    a. This License and the rights granted hereunder will terminate automa=
tically upon any breach by You of the terms of this License. Individuals or=
 entities who have received Adaptations or Collections from You under this =
License, however, will not have their licenses terminated provided such ind=
ividuals or entities remain in full compliance with those licenses. Section=
s 1, 2, 5, 6, 7, and 8 will survive any termination of this License.
+
+    b. Subject to the above terms and conditions, the license granted here=
 is perpetual (for the duration of the applicable copyright in the Work). N=
otwithstanding the above, Licensor reserves the right to release the Work u=
nder different license terms or to stop distributing the Work at any time; =
provided, however that any such election will not serve to withdraw this Li=
cense (or any other license that has been, or is required to be, granted un=
der the terms of this License), and this License will continue in full forc=
e and effect unless terminated as stated above.
+
+8. MISCELLANEOUS
+
+    a. Each time You Distribute or Publicly Perform the Work or a Collecti=
on, the Licensor offers to the recipient a license to the Work on the same =
terms and conditions as the license granted to You under this License.
+
+    b. Each time You Distribute or Publicly Perform an Adaptation, Licenso=
r offers to the recipient a license to the original Work on the same terms =
and conditions as the license granted to You under this License.
+
+    c. If any provision of this License is invalid or unenforceable under =
applicable law, it shall not affect the validity or enforceability of the r=
emainder of the terms of this License, and without further action by the pa=
rties to this agreement, such provision shall be reformed to the minimum ex=
tent necessary to make such provision valid and enforceable.
+
+    d. No term or provision of this License shall be deemed waived and no =
breach consented to unless such waiver or consent shall be in writing and s=
igned by the party to be charged with such waiver or consent.
+
+    e. This License constitutes the entire agreement between the parties w=
ith respect to the Work licensed here. There are no understandings, agreeme=
nts or representations with respect to the Work not specified here. Licenso=
r shall not be bound by any additional provisions that may appear in any co=
mmunication from You. This License may not be modified without the mutual w=
ritten agreement of the Licensor and You.
+
+    f. The rights granted under, and the subject matter referenced, in thi=
s License were drafted utilizing the terminology of the Berne Convention fo=
r the Protection of Literary and Artistic Works (as amended on September 28=
, 1979), the Rome Convention of 1961, the WIPO Copyright Treaty of 1996, th=
e WIPO Performances and Phonograms Treaty of 1996 and the Universal Copyrig=
ht Convention (as revised on July 24, 1971). These rights and subject matte=
r take effect in the relevant jurisdiction in which the License terms are s=
ought to be enforced according to the corresponding provisions of the imple=
mentation of those treaty provisions in the applicable national law. If the=
 standard suite of rights granted under applicable copyright law includes a=
dditional rights not granted under this License, such additional rights are=
 deemed to be included in the License; this License is not intended to rest=
rict the license of any rights under applicable law.
diff --git a/meta/files/common-licenses/Pixar b/meta/files/common-licenses/=
Pixar
new file mode 100644
index 00000000000..d621dab1624
--- /dev/null
+++ b/meta/files/common-licenses/Pixar
@@ -0,0 +1,175 @@
+
+                               Modified Apache 2.0 License
+
+
+   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
+
+   1. Definitions.
+
+      "License" shall mean the terms and conditions for use, reproduction,
+      and distribution as defined by Sections 1 through 9 of this document.
+
+      "Licensor" shall mean the copyright owner or entity authorized by
+      the copyright owner that is granting the License.
+
+      "Legal Entity" shall mean the union of the acting entity and all
+      other entities that control, are controlled by, or are under common
+      control with that entity. For the purposes of this definition,
+      "control" means (i) the power, direct or indirect, to cause the
+      direction or management of such entity, whether by contract or
+      otherwise, or (ii) ownership of fifty percent (50%) or more of the
+      outstanding shares, or (iii) beneficial ownership of such entity.
+
+      "You" (or "Your") shall mean an individual or Legal Entity
+      exercising permissions granted by this License.
+
+      "Source" form shall mean the preferred form for making modifications,
+      including but not limited to software source code, documentation
+      source, and configuration files.
+
+      "Object" form shall mean any form resulting from mechanical
+      transformation or translation of a Source form, including but
+      not limited to compiled object code, generated documentation,
+      and conversions to other media types.
+
+      "Work" shall mean the work of authorship, whether in Source or
+      Object form, made available under the License, as indicated by a
+      copyright notice that is included in or attached to the work
+      (an example is provided in the Appendix below).
+
+      "Derivative Works" shall mean any work, whether in Source or Object
+      form, that is based on (or derived from) the Work and for which the
+      editorial revisions, annotations, elaborations, or other modificatio=
ns
+      represent, as a whole, an original work of authorship. For the purpo=
ses
+      of this License, Derivative Works shall not include works that remain
+      separable from, or merely link (or bind by name) to the interfaces o=
f,
+      the Work and Derivative Works thereof.
+
+      "Contribution" shall mean any work of authorship, including
+      the original version of the Work and any modifications or additions
+      to that Work or Derivative Works thereof, that is intentionally
+      submitted to Licensor for inclusion in the Work by the copyright own=
er
+      or by an individual or Legal Entity authorized to submit on behalf of
+      the copyright owner. For the purposes of this definition, "submitted"
+      means any form of electronic, verbal, or written communication sent
+      to the Licensor or its representatives, including but not limited to
+      communication on electronic mailing lists, source code control syste=
ms,
+      and issue tracking systems that are managed by, or on behalf of, the
+      Licensor for the purpose of discussing and improving the Work, but
+      excluding communication that is conspicuously marked or otherwise
+      designated in writing by the copyright owner as "Not a Contribution."
+
+      "Contributor" shall mean Licensor and any individual or Legal Entity
+      on behalf of whom a Contribution has been received by Licensor and
+      subsequently incorporated within the Work.
+
+   2. Grant of Copyright License. Subject to the terms and conditions of
+      this License, each Contributor hereby grants to You a perpetual,
+      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
+      copyright license to reproduce, prepare Derivative Works of,
+      publicly display, publicly perform, sublicense, and distribute the
+      Work and such Derivative Works in Source or Object form.
+
+   3. Grant of Patent License. Subject to the terms and conditions of
+      this License, each Contributor hereby grants to You a perpetual,
+      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
+      (except as stated in this section) patent license to make, have made,
+      use, offer to sell, sell, import, and otherwise transfer the Work,
+      where such license applies only to those patent claims licensable
+      by such Contributor that are necessarily infringed by their
+      Contribution(s) alone or by combination of their Contribution(s)
+      with the Work to which such Contribution(s) was submitted. If You
+      institute patent litigation against any entity (including a
+      cross-claim or counterclaim in a lawsuit) alleging that the Work
+      or a Contribution incorporated within the Work constitutes direct
+      or contributory patent infringement, then any patent licenses
+      granted to You under this License for that Work shall terminate
+      as of the date such litigation is filed.
+
+   4. Redistribution. You may reproduce and distribute copies of the
+      Work or Derivative Works thereof in any medium, with or without
+      modifications, and in Source or Object form, provided that You
+      meet the following conditions:
+
+      (a) You must give any other recipients of the Work or
+          Derivative Works a copy of this License; and
+
+      (b) You must cause any modified files to carry prominent notices
+          stating that You changed the files; and
+
+      (c) You must retain, in the Source form of any Derivative Works
+          that You distribute, all copyright, patent, trademark, and
+          attribution notices from the Source form of the Work,
+          excluding those notices that do not pertain to any part of
+          the Derivative Works; and
+
+      (d) If the Work includes a "NOTICE" text file as part of its
+          distribution, then any Derivative Works that You distribute must
+          include a readable copy of the attribution notices contained
+          within such NOTICE file, excluding those notices that do not
+          pertain to any part of the Derivative Works, in at least one
+          of the following places: within a NOTICE text file distributed
+          as part of the Derivative Works; within the Source form or
+          documentation, if provided along with the Derivative Works; or,
+          within a display generated by the Derivative Works, if and
+          wherever such third-party notices normally appear. The contents
+          of the NOTICE file are for informational purposes only and
+          do not modify the License. You may add Your own attribution
+          notices within Derivative Works that You distribute, alongside
+          or as an addendum to the NOTICE text from the Work, provided
+          that such additional attribution notices cannot be construed
+          as modifying the License.
+
+      You may add Your own copyright statement to Your modifications and
+      may provide additional or different license terms and conditions
+      for use, reproduction, or distribution of Your modifications, or
+      for any such Derivative Works as a whole, provided Your use,
+      reproduction, and distribution of the Work otherwise complies with
+      the conditions stated in this License.
+
+   5. Submission of Contributions. Unless You explicitly state otherwise,
+      any Contribution intentionally submitted for inclusion in the Work
+      by You to the Licensor shall be under the terms and conditions of
+      this License, without any additional terms or conditions.
+      Notwithstanding the above, nothing herein shall supersede or modify
+      the terms of any separate license agreement you may have executed
+      with Licensor regarding such Contributions.
+
+   6. Trademarks. This License does not grant permission to use the trade
+      names, trademarks, service marks, or product names of the Licensor
+      and its affiliates, except as required to comply with Section 4(c) of
+      the License and to reproduce the content of the NOTICE file.
+
+   7. Disclaimer of Warranty. Unless required by applicable law or
+      agreed to in writing, Licensor provides the Work (and each
+      Contributor provides its Contributions) on an "AS IS" BASIS,
+      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
+      implied, including, without limitation, any warranties or conditions
+      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
+      PARTICULAR PURPOSE. You are solely responsible for determining the
+      appropriateness of using or redistributing the Work and assume any
+      risks associated with Your exercise of permissions under this Licens=
e.
+
+   8. Limitation of Liability. In no event and under no legal theory,
+      whether in tort (including negligence), contract, or otherwise,
+      unless required by applicable law (such as deliberate and grossly
+      negligent acts) or agreed to in writing, shall any Contributor be
+      liable to You for damages, including any direct, indirect, special,
+      incidental, or consequential damages of any character arising as a
+      result of this License or out of the use or inability to use the
+      Work (including but not limited to damages for loss of goodwill,
+      work stoppage, computer failure or malfunction, or any and all
+      other commercial damages or losses), even if such Contributor
+      has been advised of the possibility of such damages.
+
+   9. Accepting Warranty or Additional Liability. While redistributing
+      the Work or Derivative Works thereof, You may choose to offer,
+      and charge a fee for, acceptance of support, warranty, indemnity,
+      or other liability obligations and/or rights consistent with this
+      License. However, in accepting such obligations, You may act only
+      on Your own behalf and on Your sole responsibility, not on behalf
+      of any other Contributor, and only if You agree to indemnify,
+      defend, and hold each Contributor harmless for any liability
+      incurred by, or claims asserted against, such Contributor by reason
+      of your accepting any such warranty or additional liability.
+
diff --git a/meta/files/common-licenses/Python-2.0.1 b/meta/files/common-li=
censes/Python-2.0.1
new file mode 100644
index 00000000000..22f32578d40
--- /dev/null
+++ b/meta/files/common-licenses/Python-2.0.1
@@ -0,0 +1,193 @@
+PYTHON SOFTWARE FOUNDATION LICENSE VERSION 2
+--------------------------------------------
+
+1. This LICENSE AGREEMENT is between the Python Software Foundation
+("PSF"), and the Individual or Organization ("Licensee") accessing and
+otherwise using this software ("Python") in source or binary form and
+its associated documentation.
+
+2. Subject to the terms and conditions of this License Agreement, PSF here=
by
+grants Licensee a nonexclusive, royalty-free, world-wide license to reprod=
uce,
+analyze, test, perform and/or display publicly, prepare derivative works,
+distribute, and otherwise use Python alone or in any derivative version,
+provided, however, that PSF's License Agreement and PSF's notice of copyri=
ght,
+i.e., "Copyright (c) 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009,=
 2010,
+2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022 Pyt=
hon Software Foundation;
+All Rights Reserved" are retained in Python alone or in any derivative ver=
sion
+prepared by Licensee.
+
+3. In the event Licensee prepares a derivative work that is based on
+or incorporates Python or any part thereof, and wants to make
+the derivative work available to others as provided herein, then
+Licensee hereby agrees to include in any such work a brief summary of
+the changes made to Python.
+
+4. PSF is making Python available to Licensee on an "AS IS"
+basis.  PSF MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
+IMPLIED.  BY WAY OF EXAMPLE, BUT NOT LIMITATION, PSF MAKES NO AND
+DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
+FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF PYTHON WILL NOT
+INFRINGE ANY THIRD PARTY RIGHTS.
+
+5. PSF SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF PYTHON
+FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS AS
+A RESULT OF MODIFYING, DISTRIBUTING, OR OTHERWISE USING PYTHON,
+OR ANY DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.
+
+6. This License Agreement will automatically terminate upon a material
+breach of its terms and conditions.
+
+7. Nothing in this License Agreement shall be deemed to create any
+relationship of agency, partnership, or joint venture between PSF and
+Licensee.  This License Agreement does not grant permission to use PSF
+trademarks or trade name in a trademark sense to endorse or promote
+products or services of Licensee, or any third party.
+
+8. By copying, installing or otherwise using Python, Licensee
+agrees to be bound by the terms and conditions of this License
+Agreement.
+
+
+BEOPEN.COM LICENSE AGREEMENT FOR PYTHON 2.0
+-------------------------------------------
+
+BEOPEN PYTHON OPEN SOURCE LICENSE AGREEMENT VERSION 1
+
+1. This LICENSE AGREEMENT is between BeOpen.com ("BeOpen"), having an
+office at 160 Saratoga Avenue, Santa Clara, CA 95051, and the
+Individual or Organization ("Licensee") accessing and otherwise using
+this software in source or binary form and its associated
+documentation ("the Software").
+
+2. Subject to the terms and conditions of this BeOpen Python License
+Agreement, BeOpen hereby grants Licensee a non-exclusive,
+royalty-free, world-wide license to reproduce, analyze, test, perform
+and/or display publicly, prepare derivative works, distribute, and
+otherwise use the Software alone or in any derivative version,
+provided, however, that the BeOpen Python License is retained in the
+Software, alone or in any derivative version prepared by Licensee.
+
+3. BeOpen is making the Software available to Licensee on an "AS IS"
+basis.  BEOPEN MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
+IMPLIED.  BY WAY OF EXAMPLE, BUT NOT LIMITATION, BEOPEN MAKES NO AND
+DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
+FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF THE SOFTWARE WILL NOT
+INFRINGE ANY THIRD PARTY RIGHTS.
+
+4. BEOPEN SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF THE
+SOFTWARE FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS
+AS A RESULT OF USING, MODIFYING OR DISTRIBUTING THE SOFTWARE, OR ANY
+DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.
+
+5. This License Agreement will automatically terminate upon a material
+breach of its terms and conditions.
+
+6. This License Agreement shall be governed by and interpreted in all
+respects by the law of the State of California, excluding conflict of
+law provisions.  Nothing in this License Agreement shall be deemed to
+create any relationship of agency, partnership, or joint venture
+between BeOpen and Licensee.  This License Agreement does not grant
+permission to use BeOpen trademarks or trade names in a trademark
+sense to endorse or promote products or services of Licensee, or any
+third party.  As an exception, the "BeOpen Python" logos available at
+http://www.pythonlabs.com/logos.html may be used according to the
+permissions granted on that web page.
+
+7. By copying, installing or otherwise using the software, Licensee
+agrees to be bound by the terms and conditions of this License
+Agreement.
+
+
+CNRI LICENSE AGREEMENT FOR PYTHON 1.6.1
+---------------------------------------
+
+1. This LICENSE AGREEMENT is between the Corporation for National
+Research Initiatives, having an office at 1895 Preston White Drive,
+Reston, VA 20191 ("CNRI"), and the Individual or Organization
+("Licensee") accessing and otherwise using Python 1.6.1 software in
+source or binary form and its associated documentation.
+
+2. Subject to the terms and conditions of this License Agreement, CNRI
+hereby grants Licensee a nonexclusive, royalty-free, world-wide
+license to reproduce, analyze, test, perform and/or display publicly,
+prepare derivative works, distribute, and otherwise use Python 1.6.1
+alone or in any derivative version, provided, however, that CNRI's
+License Agreement and CNRI's notice of copyright, i.e., "Copyright (c)
+1995-2001 Corporation for National Research Initiatives; All Rights
+Reserved" are retained in Python 1.6.1 alone or in any derivative
+version prepared by Licensee.  Alternately, in lieu of CNRI's License
+Agreement, Licensee may substitute the following text (omitting the
+quotes): "Python 1.6.1 is made available subject to the terms and
+conditions in CNRI's License Agreement.  This Agreement together with
+Python 1.6.1 may be located on the internet using the following
+unique, persistent identifier (known as a handle): 1895.22/1013.  This
+Agreement may also be obtained from a proxy server on the internet
+using the following URL: http://hdl.handle.net/1895.22/1013".
+
+3. In the event Licensee prepares a derivative work that is based on
+or incorporates Python 1.6.1 or any part thereof, and wants to make
+the derivative work available to others as provided herein, then
+Licensee hereby agrees to include in any such work a brief summary of
+the changes made to Python 1.6.1.
+
+4. CNRI is making Python 1.6.1 available to Licensee on an "AS IS"
+basis.  CNRI MAKES NO REPRESENTATIONS OR WARRANTIES, EXPRESS OR
+IMPLIED.  BY WAY OF EXAMPLE, BUT NOT LIMITATION, CNRI MAKES NO AND
+DISCLAIMS ANY REPRESENTATION OR WARRANTY OF MERCHANTABILITY OR FITNESS
+FOR ANY PARTICULAR PURPOSE OR THAT THE USE OF PYTHON 1.6.1 WILL NOT
+INFRINGE ANY THIRD PARTY RIGHTS.
+
+5. CNRI SHALL NOT BE LIABLE TO LICENSEE OR ANY OTHER USERS OF PYTHON
+1.6.1 FOR ANY INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES OR LOSS AS
+A RESULT OF MODIFYING, DISTRIBUTING, OR OTHERWISE USING PYTHON 1.6.1,
+OR ANY DERIVATIVE THEREOF, EVEN IF ADVISED OF THE POSSIBILITY THEREOF.
+
+6. This License Agreement will automatically terminate upon a material
+breach of its terms and conditions.
+
+7. This License Agreement shall be governed by the federal
+intellectual property law of the United States, including without
+limitation the federal copyright law, and, to the extent such
+U.S. federal law does not apply, by the law of the Commonwealth of
+Virginia, excluding Virginia's conflict of law provisions.
+Notwithstanding the foregoing, with regard to derivative works based
+on Python 1.6.1 that incorporate non-separable material that was
+previously distributed under the GNU General Public License (GPL), the
+law of the Commonwealth of Virginia shall govern this License
+Agreement only as to issues arising under or with respect to
+Paragraphs 4, 5, and 7 of this License Agreement.  Nothing in this
+License Agreement shall be deemed to create any relationship of
+agency, partnership, or joint venture between CNRI and Licensee.  This
+License Agreement does not grant permission to use CNRI trademarks or
+trade name in a trademark sense to endorse or promote products or
+services of Licensee, or any third party.
+
+8. By clicking on the "ACCEPT" button where indicated, or by copying,
+installing or otherwise using Python 1.6.1, Licensee agrees to be
+bound by the terms and conditions of this License Agreement.
+
+        ACCEPT
+
+
+CWI LICENSE AGREEMENT FOR PYTHON 0.9.0 THROUGH 1.2
+--------------------------------------------------
+
+Copyright (c) 1991 - 1995, Stichting Mathematisch Centrum Amsterdam,
+The Netherlands.  All rights reserved.
+
+Permission to use, copy, modify, and distribute this software and its
+documentation for any purpose and without fee is hereby granted,
+provided that the above copyright notice appear in all copies and that
+both that copyright notice and this permission notice appear in
+supporting documentation, and that the name of Stichting Mathematisch
+Centrum or CWI not be used in advertising or publicity pertaining to
+distribution of the software without specific, written prior
+permission.
+
+STICHTING MATHEMATISCH CENTRUM DISCLAIMS ALL WARRANTIES WITH REGARD TO
+THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
+FITNESS, IN NO EVENT SHALL STICHTING MATHEMATISCH CENTRUM BE LIABLE
+FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
+OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
diff --git a/meta/files/common-licenses/QPL-1.0-INRIA-2004 b/meta/files/com=
mon-licenses/QPL-1.0-INRIA-2004
new file mode 100644
index 00000000000..45d946e2e23
--- /dev/null
+++ b/meta/files/common-licenses/QPL-1.0-INRIA-2004
@@ -0,0 +1,102 @@
+                   THE Q PUBLIC LICENSE version 1.0
+
+              Copyright (C) 1999 Troll Tech AS, Norway.
+                  Everyone is permitted to copy and
+                  distribute this license document.
+
+The intent of this license is to establish freedom to share and change
+the software regulated by this license under the open source model.
+
+This license applies to any software containing a notice placed by the
+copyright holder saying that it may be distributed under the terms of
+the Q Public License version 1.0. Such software is herein referred to
+as the Software. This license covers modification and distribution of
+the Software, use of third-party application programs based on the
+Software, and development of free software which uses the Software.
+
+                            Granted Rights
+
+1. You are granted the non-exclusive rights set forth in this license
+provided you agree to and comply with any and all conditions in this
+license. Whole or partial distribution of the Software, or software
+items that link with the Software, in any form signifies acceptance of
+this license.
+
+2. You may copy and distribute the Software in unmodified form
+provided that the entire package, including - but not restricted to -
+copyright, trademark notices and disclaimers, as released by the
+initial developer of the Software, is distributed.
+
+3. You may make modifications to the Software and distribute your
+modifications, in a form that is separate from the Software, such as
+patches. The following restrictions apply to modifications:
+
+      a. Modifications must not alter or remove any copyright notices
+      in the Software.
+
+      b. When modifications to the Software are released under this
+      license, a non-exclusive royalty-free right is granted to the
+      initial developer of the Software to distribute your
+      modification in future versions of the Software provided such
+      versions remain available under these terms in addition to any
+      other license(s) of the initial developer.
+
+4. You may distribute machine-executable forms of the Software or
+machine-executable forms of modified versions of the Software,
+provided that you meet these restrictions:
+
+      a. You must include this license document in the distribution.
+
+      b. You must ensure that all recipients of the machine-executable
+      forms are also able to receive the complete machine-readable
+      source code to the distributed Software, including all
+      modifications, without any charge beyond the costs of data
+      transfer, and place prominent notices in the distribution
+      explaining this.
+
+      c. You must ensure that all modifications included in the
+      machine-executable forms are available under the terms of this
+      license.
+
+5. You may use the original or modified versions of the Software to
+compile, link and run application programs legally developed by you or
+by others.
+
+6. You may develop application programs, reusable components and other
+software items that link with the original or modified versions of the
+Software. These items, when distributed, are subject to the following
+requirements:
+
+      a. You must ensure that all recipients of machine-executable
+      forms of these items are also able to receive and use the
+      complete machine-readable source code to the items without any
+      charge beyond the costs of data transfer.
+
+      b. You must explicitly license all recipients of your items to
+      use and re-distribute original and modified versions of the
+      items in both machine-executable and source code forms. The
+      recipients must be able to do so without any charges whatsoever,
+      and they must be able to re-distribute to anyone they choose.
+
+      c. If the items are not available to the general public, and the
+      initial developer of the Software requests a copy of the items,
+      then you must supply one.
+
+                       Limitations of Liability
+
+In no event shall the initial developers or copyright holders be
+liable for any damages whatsoever, including - but not restricted to -
+lost revenue or profits or other direct, indirect, special, incidental
+or consequential damages, even if they have been advised of the
+possibility of such damages, except to the extent invariable law, if
+any, provides otherwise.
+
+                             No Warranty
+
+The Software and this license document are provided AS IS with NO
+WARRANTY OF ANY KIND, INCLUDING THE WARRANTY OF DESIGN,
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+
+                            Choice of Law
+
+This license is governed by the Laws of France.
diff --git a/meta/files/common-licenses/SAX-PD-2.0 b/meta/files/common-lice=
nses/SAX-PD-2.0
new file mode 100644
index 00000000000..b329db3bb50
--- /dev/null
+++ b/meta/files/common-licenses/SAX-PD-2.0
@@ -0,0 +1,10 @@
+SAX2 is Free!
+
+I hereby abandon any property rights to SAX 2.0 (the Simple API for
+XML), and release all of the SAX 2.0 source code, compiled code, and
+documentation contained in this distribution into the Public Domain.
+SAX comes with NO WARRANTY or guarantee of fitness for any
+purpose.
+
+David Megginson, david@megginson.com
+2000-05-05
diff --git a/meta/files/common-licenses/SGI-OpenGL b/meta/files/common-lice=
nses/SGI-OpenGL
new file mode 100644
index 00000000000..2b4c542aa03
--- /dev/null
+++ b/meta/files/common-licenses/SGI-OpenGL
@@ -0,0 +1,34 @@
+(c) Copyright 1993, Silicon Graphics, Inc.
+ALL RIGHTS RESERVED
+Permission to use, copy, modify, and distribute this software for
+any purpose and without fee is hereby granted, provided that the above
+copyright notice appear in all copies and that both the copyright notice
+and this permission notice appear in supporting documentation, and that
+the name of Silicon Graphics, Inc. not be used in advertising
+or publicity pertaining to distribution of the software without specific,
+written prior permission.
+
+THE MATERIAL EMBODIED ON THIS SOFTWARE IS PROVIDED TO YOU "AS-IS"
+AND WITHOUT WARRANTY OF ANY KIND, EXPRESS, IMPLIED OR OTHERWISE,
+INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF MERCHANTABILITY OR
+FITNESS FOR A PARTICULAR PURPOSE.  IN NO EVENT SHALL SILICON
+GRAPHICS, INC.  BE LIABLE TO YOU OR ANYONE ELSE FOR ANY DIRECT,
+SPECIAL, INCIDENTAL, INDIRECT OR CONSEQUENTIAL DAMAGES OF ANY
+KIND, OR ANY DAMAGES WHATSOEVER, INCLUDING WITHOUT LIMITATION,
+LOSS OF PROFIT, LOSS OF USE, SAVINGS OR REVENUE, OR THE CLAIMS OF
+THIRD PARTIES, WHETHER OR NOT SILICON GRAPHICS, INC.  HAS BEEN
+ADVISED OF THE POSSIBILITY OF SUCH LOSS, HOWEVER CAUSED AND ON
+ANY THEORY OF LIABILITY, ARISING OUT OF OR IN CONNECTION WITH THE
+POSSESSION, USE OR PERFORMANCE OF THIS SOFTWARE.
+
+US Government Users Restricted Rights
+Use, duplication, or disclosure by the Government is subject to
+restrictions set forth in FAR 52.227.19(c)(2) or subparagraph
+(c)(1)(ii) of the Rights in Technical Data and Computer Software
+clause at DFARS 252.227-7013 and/or in similar or successor
+clauses in the FAR or the DOD or NASA FAR Supplement.
+Unpublished-- rights reserved under the copyright laws of the
+United States.  Contractor/manufacturer is Silicon Graphics,
+Inc., 2011 N.  Shoreline Blvd., Mountain View, CA 94039-7311.
+
+OpenGL(TM) is a trademark of Silicon Graphics, Inc.
diff --git a/meta/files/common-licenses/SGP4 b/meta/files/common-licenses/S=
GP4
new file mode 100644
index 00000000000..1b86e057c7d
--- /dev/null
+++ b/meta/files/common-licenses/SGP4
@@ -0,0 +1 @@
+There is no license associated with the code and you may use it for any pu=
rpose=E2=80=94personal or commercial=E2=80=94as you wish. We ask only that =
you include citations in your documentation and source code to show the sou=
rce of the code and provide links to the main page, to facilitate communica=
tions regarding any questions on the theory or source code.
diff --git a/meta/files/common-licenses/SL b/meta/files/common-licenses/SL
new file mode 100644
index 00000000000..cc3857d2247
--- /dev/null
+++ b/meta/files/common-licenses/SL
@@ -0,0 +1,4 @@
+Everyone is permitted to do anything on this program including copying,
+modifying, and improving, unless you try to pretend that you wrote it.
+i.e., the above copyright notice has to appear in all copies.
+THE AUTHOR DISCLAIMS ANY RESPONSIBILITY WITH REGARD TO THIS SOFTWARE.
diff --git a/meta/files/common-licenses/SSLeay-standalone b/meta/files/comm=
on-licenses/SSLeay-standalone
new file mode 100644
index 00000000000..61618b40eb2
--- /dev/null
+++ b/meta/files/common-licenses/SSLeay-standalone
@@ -0,0 +1,58 @@
+Original SSLeay License
+ -----------------------
+
+  Copyright (C) 1995-1998 Eric Young (eay@cryptsoft.com)
+  All rights reserved.
+=20
+  This package is an SSL implementation written
+  by Eric Young (eay@cryptsoft.com).
+  The implementation was written so as to conform with Netscapes SSL.
+=20
+  This library is free for commercial and non-commercial use as long as
+  the following conditions are aheared to.  The following conditions
+  apply to all code found in this distribution, be it the RC4, RSA,
+  lhash, DES, etc., code; not just the SSL code.  The SSL documentation
+  included with this distribution is covered by the same copyright terms
+  except that the holder is Tim Hudson (tjh@cryptsoft.com).
+=20
+  Copyright remains Eric Young's, and as such any Copyright notices in
+  the code are not to be removed.
+  If this package is used in a product, Eric Young should be given attribu=
tion
+  as the author of the parts of the library used.
+  This can be in the form of a textual message at program startup or
+  in documentation (online or textual) provided with the package.
+=20
+  Redistribution and use in source and binary forms, with or without
+  modification, are permitted provided that the following conditions
+  are met:
+  1. Redistributions of source code must retain the copyright
+     notice, this list of conditions and the following disclaimer.
+  2. Redistributions in binary form must reproduce the above copyright
+     notice, this list of conditions and the following disclaimer in the
+     documentation and/or other materials provided with the distribution.
+  3. All advertising materials mentioning features or use of this software
+     must display the following acknowledgement:
+     "This product includes cryptographic software written by
+      Eric Young (eay@cryptsoft.com)"
+     The word 'cryptographic' can be left out if the rouines from the libr=
ary
+     being used are not cryptographic related :-).
+  4. If you include any Windows specific code (or a derivative thereof) fr=
om
+     the apps directory (application code) you must include an acknowledge=
ment:
+     "This product includes software written by Tim Hudson (tjh@cryptsoft.=
com)"
+=20
+  THIS SOFTWARE IS PROVIDED BY ERIC YOUNG ``AS IS'' AND
+  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPO=
SE
+  ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
+  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTI=
AL
+  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
+  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
+  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRI=
CT
+  LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
+  OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
+  SUCH DAMAGE.
+=20
+  The licence and distribution terms for any publically available version =
or
+  derivative of this code cannot be changed.  i.e. this code cannot simply=
 be
+  copied and put under another distribution licence
+  [including the GNU Public Licence.]
diff --git a/meta/files/common-licenses/SchemeReport b/meta/files/common-li=
censes/SchemeReport
new file mode 100644
index 00000000000..943b512adfc
--- /dev/null
+++ b/meta/files/common-licenses/SchemeReport
@@ -0,0 +1,3 @@
+We intend this report to belong to the entire Scheme community, and so we =
grant permission=20
+to copy it in whole or in part without fee. In particular, we encourage im=
plementors of Scheme
+to use this report as a starting point for manuals and other documentation=
, modifying it as necessary.
diff --git a/meta/files/common-licenses/Soundex b/meta/files/common-license=
s/Soundex
new file mode 100644
index 00000000000..16c3fa76642
--- /dev/null
+++ b/meta/files/common-licenses/Soundex
@@ -0,0 +1,9 @@
+(c) Copyright 1998-2007 by Mark Mielke
+
+Freedom to use these sources for whatever you want, as long as credit
+is given where credit is due, is hereby granted. You may make modifications
+where you see fit but leave this copyright somewhere visible. As well, try
+to initial any changes you make so that if I like the changes I can
+incorporate them into later versions.
+
+     - Mark Mielke <mark@mielke.cc>
diff --git a/meta/files/common-licenses/Sun-PPP b/meta/files/common-license=
s/Sun-PPP
new file mode 100644
index 00000000000..5f94a134370
--- /dev/null
+++ b/meta/files/common-licenses/Sun-PPP
@@ -0,0 +1,13 @@
+Copyright (c) 2001 by Sun Microsystems, Inc.
+All rights reserved.
+
+Non-exclusive rights to redistribute, modify, translate, and use
+this software in source and binary forms, in whole or in part, is
+hereby granted, provided that the above copyright notice is
+duplicated in any source form, and that neither the name of the
+copyright holder nor the author is used to endorse or promote
+products derived from this software.
+
+THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
+IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
+WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
diff --git a/meta/files/common-licenses/Sun-PPP-2000 b/meta/files/common-li=
censes/Sun-PPP-2000
new file mode 100644
index 00000000000..b4116925a42
--- /dev/null
+++ b/meta/files/common-licenses/Sun-PPP-2000
@@ -0,0 +1,14 @@
+Copyright (c) 2000 by Sun Microsystems, Inc.
+All rights reserved.
+
+Permission to use, copy, modify, and distribute this software and its
+documentation is hereby granted, provided that the above copyright
+notice appears in all copies.
+
+SUN MAKES NO REPRESENTATION OR WARRANTIES ABOUT THE SUITABILITY OF
+THE SOFTWARE, EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
+TO THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
+PARTICULAR PURPOSE, OR NON-INFRINGEMENT.  SUN SHALL NOT BE LIABLE FOR
+ANY DAMAGES SUFFERED BY LICENSEE AS A RESULT OF USING, MODIFYING OR
+DISTRIBUTING THIS SOFTWARE OR ITS DERIVATIVES
+
diff --git a/meta/files/common-licenses/SunPro b/meta/files/common-licenses=
/SunPro
new file mode 100644
index 00000000000..1ccb78add07
--- /dev/null
+++ b/meta/files/common-licenses/SunPro
@@ -0,0 +1,6 @@
+Copyright (C) 1993 by Sun Microsystems, Inc. All rights reserved.
+
+Developed at SunSoft, a Sun Microsystems, Inc. business.
+Permission to use, copy, modify, and distribute this
+software is freely granted, provided that this notice=20
+is preserved.
diff --git a/meta/files/common-licenses/Symlinks b/meta/files/common-licens=
es/Symlinks
new file mode 100644
index 00000000000..35420d2ba9b
--- /dev/null
+++ b/meta/files/common-licenses/Symlinks
@@ -0,0 +1,10 @@
+ My "symlinks" utility pre-dates the "open source licensing"
+fad by a number of years. Just to clarify, this is 100%
+freeware, written entirely by myself. The intent is to use
+it to detect missing/obsolete symlink targets on an installed
+distro, before creating the "gold" (or "final") release discs.
+
+Use and distribute and modify as you (or anyone
+else) sees fit. There have no formal restrictions or
+requirements whatsoever regarding distribution of either
+binaries or source code, whether modified or original.
diff --git a/meta/files/common-licenses/TGPPL-1.0 b/meta/files/common-licen=
ses/TGPPL-1.0
new file mode 100644
index 00000000000..fbafe92c82d
--- /dev/null
+++ b/meta/files/common-licenses/TGPPL-1.0
@@ -0,0 +1,181 @@
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+Transitive Grace Period Public Licence ("TGPPL") v. 1.0
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+
+This Transitive Grace Period Public Licence (the "License") applies to any
+original work of authorship (the "Original Work") whose owner (the
+"Licensor") has placed the following licensing notice adjacent to the
+copyright notice for the Original Work:
+
+ *Licensed under the Transitive Grace Period Public Licence version 1.0*
+
+1.  **Grant of Copyright License.** Licensor grants You a worldwide,
+    royalty-free, non-exclusive, sublicensable license, for the duration of
+    the copyright, to do the following:
+
+    a. to reproduce the Original Work in copies, either alone or as part o=
f a
+       collective work;
+
+    b. to translate, adapt, alter, transform, modify, or arrange the Origi=
nal
+       Work, thereby creating derivative works ("Derivative Works") based =
upon
+       the Original Work;
+
+    c. to distribute or communicate copies of the Original Work and Deriva=
tive
+       Works to the public, with the proviso that copies of Original Work =
or
+       Derivative Works that You distribute or communicate shall be licens=
ed
+       under this Transitive Grace Period Public Licence no later than 12
+       months after You distributed or communicated said copies;
+
+    d. to perform the Original Work publicly; and
+
+    e. to display the Original Work publicly.
+
+2.  **Grant of Patent License.** Licensor grants You a worldwide,
+    royalty-free, non-exclusive, sublicensable license, under patent claims
+    owned or controlled by the Licensor that are embodied in the Original
+    Work as furnished by the Licensor, for the duration of the patents, to
+    make, use, sell, offer for sale, have made, and import the Original Wo=
rk
+    and Derivative Works.
+
+3.  **Grant of Source Code License.** The term "Source Code" means the
+    preferred form of the Original Work for making modifications to it and
+    all available documentation describing how to modify the Original
+    Work. Licensor agrees to provide a machine-readable copy of the Source
+    Code of the Original Work along with each copy of the Original Work th=
at
+    Licensor distributes. Licensor reserves the right to satisfy this
+    obligation by placing a machine-readable copy of the Source Code in an
+    information repository reasonably calculated to permit inexpensive and
+    convenient access by You for as long as Licensor continues to distribu=
te
+    the Original Work.
+
+4.  **Exclusions From License Grant.** Neither the names of Licensor, nor =
the
+    names of any contributors to the Original Work, nor any of their
+    trademarks or service marks, may be used to endorse or promote products
+    derived from this Original Work without express prior permission of the
+    Licensor. Except as expressly stated herein, nothing in this License
+    grants any license to Licensor's trademarks, copyrights, patents, trade
+    secrets or any other intellectual property. No patent license is grant=
ed
+    to make, use, sell, offer for sale, have made, or import embodiments of
+    any patent claims other than the licensed claims defined in Section 2.=
 No
+    license is granted to the trademarks of Licensor even if such marks are
+    included in the Original Work. Nothing in this License shall be
+    interpreted to prohibit Licensor from licensing under terms different
+    from this License any Original Work that Licensor otherwise would have=
 a
+    right to license.
+
+5.  **External Deployment.** The term "External Deployment" means the use,
+    distribution, or communication of the Original Work or Derivative Works
+    in any way such that the Original Work or Derivative Works may be used=
 by
+    anyone other than You, whether those works are distributed or
+    communicated to those persons or made available as an application
+    intended for use over a network. As an express condition for the grants
+    of license hereunder, You must treat any External Deployment by You of
+    the Original Work or a Derivative Work as a distribution under section
+    1(c).
+
+6.  **Attribution Rights.** You must retain, in the Source Code of any
+    Derivative Works that You create, all copyright, patent, or trademark
+    notices from the Source Code of the Original Work, as well as any noti=
ces
+    of licensing and any descriptive text identified therein as an
+    "Attribution Notice." You must cause the Source Code for any Derivative
+    Works that You create to carry a prominent Attribution Notice reasonab=
ly
+    calculated to inform recipients that You have modified the Original Wo=
rk.
+
+7.  **Warranty of Provenance and Disclaimer of Warranty.** Licensor warran=
ts
+    that the copyright in and to the Original Work and the patent rights
+    granted herein by Licensor are owned by the Licensor or are sublicensed
+    to You under the terms of this License with the permission of the
+    contributor(s) of those copyrights and patent rights. Except as expres=
sly
+    stated in the immediately preceding sentence, the Original Work is
+    provided under this License on an "AS IS" BASIS and WITHOUT WARRANTY,
+    either express or implied, including, without limitation, the warranti=
es
+    of non-infringement, merchantability or fitness for a particular
+    purpose. THE ENTIRE RISK AS TO THE QUALITY OF THE ORIGINAL WORK IS WITH
+    YOU. This DISCLAIMER OF WARRANTY constitutes an essential part of this
+    License. No license to the Original Work is granted by this License
+    except under this disclaimer.
+
+8.  **Limitation of Liability.** Under no circumstances and under no legal
+    theory, whether in tort (including negligence), contract, or otherwise,
+    shall the Licensor be liable to anyone for any indirect, special,
+    incidental, or consequential damages of any character arising as a res=
ult
+    of this License or the use of the Original Work including, without
+    limitation, damages for loss of goodwill, work stoppage, computer fail=
ure
+    or malfunction, or any and all other commercial damages or losses. This
+    limitation of liability shall not apply to the extent applicable law
+    prohibits such limitation.
+
+9.  **Acceptance and Termination.** If, at any time, You expressly assented
+    to this License, that assent indicates your clear and irrevocable
+    acceptance of this License and all of its terms and conditions. If You
+    distribute or communicate copies of the Original Work or a Derivative
+    Work, You must make a reasonable effort under the circumstances to obt=
ain
+    the express assent of recipients to the terms of this License. This
+    License conditions your rights to undertake the activities listed in
+    Section 1, including your right to create Derivative Works based upon =
the
+    Original Work, and doing so without honoring these terms and conditions
+    is prohibited by copyright law and international treaty. Nothing in th=
is
+    License is intended to affect copyright exceptions and limitations
+    (including 'fair use' or 'fair dealing'). This License shall terminate
+    immediately and You may no longer exercise any of the rights granted to
+    You by this License upon your failure to honor the conditions in Secti=
on
+    1(c).
+
+10. **Termination for Patent Action.** This License shall terminate
+    automatically and You may no longer exercise any of the rights granted=
 to
+    You by this License as of the date You commence an action, including a
+    cross-claim or counterclaim, against Licensor or any licensee alleging
+    that the Original Work infringes a patent. This termination provision
+    shall not apply for an action alleging patent infringement by
+    combinations of the Original Work with other software or hardware.
+
+11. **Jurisdiction, Venue and Governing Law.** Any action or suit relating=
 to
+    this License may be brought only in the courts of a jurisdiction where=
in
+    the Licensor resides or in which Licensor conducts its primary busines=
s,
+    and under the laws of that jurisdiction excluding its conflict-of-law
+    provisions. The application of the United Nations Convention on Contra=
cts
+    for the International Sale of Goods is expressly excluded. Any use of =
the
+    Original Work outside the scope of this License or after its terminati=
on
+    shall be subject to the requirements and penalties of copyright or pat=
ent
+    law in the appropriate jurisdiction. This section shall survive the
+    termination of this License.
+
+12. **Attorneys' Fees.** In any action to enforce the terms of this License
+    or seeking damages relating thereto, the prevailing party shall be
+    entitled to recover its costs and expenses, including, without
+    limitation, reasonable attorneys' fees and costs incurred in connection
+    with such action, including any appeal of such action. This section sh=
all
+    survive the termination of this License.
+
+13. **Miscellaneous.** If any provision of this License is held to be
+    unenforceable, such provision shall be reformed only to the extent
+    necessary to make it enforceable.
+
+14. **Definition of "You" in This License.** "You" throughout this License,
+    whether in upper or lower case, means an individual or a legal entity
+    exercising rights under, and complying with all of the terms of, this
+    License. For legal entities, "You" includes any entity that controls, =
is
+    controlled by, or is under common control with you. For purposes of th=
is
+    definition, "control" means (i) the power, direct or indirect, to cause
+    the direction or management of such entity, whether by contract or
+    otherwise, or (ii) ownership of fifty percent (50%) or more of the
+    outstanding shares, or (iii) beneficial ownership of such entity.
+
+15. **Right to Use.** You may use the Original Work in all ways not otherw=
ise
+    restricted or conditioned by this License or by law, and Licensor
+    promises not to interfere with or be responsible for such uses by You.
+
+16. **Modification of This License.** This License is Copyright =C2=A9 200=
7 Zooko
+    Wilcox-O'Hearn. Permission is granted to copy, distribute, or communic=
ate
+    this License without modification. Nothing in this License permits You=
 to
+    modify this License as applied to the Original Work or to Derivative
+    Works. However, You may modify the text of this License and copy,
+    distribute or communicate your modified version (the "Modified License=
")
+    and apply it to other original works of authorship subject to the
+    following conditions: (i) You may not indicate in any way that your
+    Modified License is the "Transitive Grace Period Public Licence" or
+    "TGPPL" and you may not use those names in the name of your Modified
+    License; and (ii) You must replace the notice specified in the first
+    paragraph above with the notice "Licensed under <insert your license n=
ame
+    here>" or with a notice of your own that is not confusingly similar to
+    the notice in this License.
diff --git a/meta/files/common-licenses/TPDL b/meta/files/common-licenses/T=
PDL
new file mode 100644
index 00000000000..d950f8f19e5
--- /dev/null
+++ b/meta/files/common-licenses/TPDL
@@ -0,0 +1,2 @@
+Copyright (C) 1996-2010 David Muir Sharnoff. Copyright (C) 2011 Google, In=
c.=20
+License hereby granted for anyone to use, modify or redistribute this modu=
le at their own risk. Please feed useful changes back to cpan@dave.sharnoff=
.org.
diff --git a/meta/files/common-licenses/TPL-1.0 b/meta/files/common-license=
s/TPL-1.0
new file mode 100644
index 00000000000..1634db4912e
--- /dev/null
+++ b/meta/files/common-licenses/TPL-1.0
@@ -0,0 +1,475 @@
+THOR Public Licence (TPL)
+
+0. Notes of Origin
+
+0.1 As required by paragraph 6.3 of the "Mozilla Public Licence",
+"MPL" in the following, it is hereby stated that this Licence
+condition ("TPL") differs in the following items from the original
+"Mozilla Public Licence" as provided by "Netscape Communications
+Corporation":
+
+a) Paragraphs 6.2 and 6.3 of the MPL has been modified to bind licence
+modifications to the Author of this Licence, Thomas Richter.
+
+b) Paragraph 11 has been modified to gover this Licence by German
+law rather than Californian Law.
+
+c) The licence has been renamed to "TPL" and "THOR Public
+Licence". All references towards "MPL" have been removed except in
+section 0 to indicate the difference from "MPL".
+
+No other modifications have been made.
+
+
+1. Definitions.
+
+1.0.1. "Commercial Use" means distribution or otherwise making the
+Covered Code available to a third party.
+
+1.1. "Contributor" means each entity that creates or contributes to
+the creation of Modifications.
+
+1.2. "Contributor Version" means the combination of the Original Code,
+prior Modifications used by a Contributor, and the Modifications made
+by that particular Contributor.
+
+1.3. "Covered Code" means the Original Code or Modifications or the
+combination of the Original Code and Modifications, in each case
+including portions thereof.
+
+1.4. "Electronic Distribution Mechanism" means a mechanism generally
+accepted in the software development community for the electronic
+transfer of data.
+
+1.5. "Executable" means Covered Code in any form other than Source
+Code.
+
+1.6. "Initial Developer" means the individual or entity identified as
+the Initial Developer in the Source Code notice required by Exhibit A.
+
+1.7. "Larger Work" means a work which combines Covered Code or
+portions thereof with code not governed by the terms of this License.
+
+1.8. "License" means this document.
+
+1.8.1. "Licensable" means having the right to grant, to the maximum
+extent possible, whether at the time of the initial grant or
+subsequently acquired, any and all of the rights conveyed herein.
+
+1.9. "Modifications" means any addition to or deletion from the
+substance or structure of either the Original Code or any previous
+Modifications. When Covered Code is released as a series of files, a
+Modification is: A. Any addition to or deletion from the contents of a
+file containing Original Code or previous Modifications.
+
+B. Any new file that contains any part of the Original Code or
+previous Modifications.
+=20
+1.10. "Original Code" means Source Code of computer software code
+which is described in the Source Code notice required by Exhibit A as
+Original Code, and which, at the time of its release under this
+License is not already Covered Code governed by this License.
+
+1.10.1. "Patent Claims" means any patent claim(s), now owned or
+hereafter acquired, including without limitation, method, process, and
+apparatus claims, in any patent Licensable by grantor.
+
+1.11. "Source Code" means the preferred form of the Covered Code for
+making modifications to it, including all modules it contains, plus
+any associated interface definition files, scripts used to control
+compilation and installation of an Executable, or source code
+differential comparisons against either the Original Code or another
+well known, available Covered Code of the Contributor's choice. The
+Source Code can be in a compressed or archival form, provided the
+appropriate decompression or de-archiving software is widely available
+for no charge.
+
+1.12. "You" (or "Your") means an individual or a legal entity
+exercising rights under, and complying with all of the terms of, this
+License or a future version of this License issued under Section
+6.1. For legal entities, "You" includes any entity which controls, is
+controlled by, or is under common control with You. For purposes of
+this definition, "control" means (a) the power, direct or indirect, to
+cause the direction or management of such entity, whether by contract
+or otherwise, or (b) ownership of more than fifty percent (50%) of the
+outstanding shares or beneficial ownership of such entity.
+
+2. Source Code License.
+
+2.1. The Initial Developer Grant.  The Initial Developer hereby grants
+You a world-wide, royalty-free, non-exclusive license, subject to
+third party intellectual property claims: (a) under intellectual
+property rights (other than patent or trademark) Licensable by Initial
+Developer to use, reproduce, modify, display, perform, sublicense and
+distribute the Original Code (or portions thereof) with or without
+Modifications, and/or as part of a Larger Work; and
+
+(b) under Patents Claims infringed by the making, using or selling of
+Original Code, to make, have made, use, practice, sell, and offer for
+sale, and/or otherwise dispose of the Original Code (or portions
+thereof).=20=20
+
+(c) the licenses granted in this Section 2.1(a) and (b) are effective
+on the date Initial Developer first distributes Original Code under
+the terms of this License.
+
+(d) Notwithstanding Section 2.1(b) above, no patent license is
+granted: 1) for code that You delete from the Original Code; 2)
+separate from the Original Code; or 3) for infringements caused by: i)
+the modification of the Original Code or ii) the combination of the
+Original Code with other software or devices.
+=20
+2.2. Contributor Grant.  Subject to third party intellectual property
+claims, each Contributor hereby grants You a world-wide, royalty-free,
+non-exclusive license
+=20
+(a) under intellectual property rights (other than patent or
+trademark) Licensable by Contributor, to use, reproduce, modify,
+display, perform, sublicense and distribute the Modifications created
+by such Contributor (or portions thereof) either on an unmodified
+basis, with other Modifications, as Covered Code and/or as part of a
+Larger Work; and
+
+(b) under Patent Claims infringed by the making, using, or selling of
+Modifications made by that Contributor either alone and/or in
+combination with its Contributor Version (or portions of such
+combination), to make, use, sell, offer for sale, have made, and/or
+otherwise dispose of: 1) Modifications made by that Contributor (or
+portions thereof); and 2) the combination of Modifications made by
+that Contributor with its Contributor Version (or portions of such
+combination).
+
+(c) the licenses granted in Sections 2.2(a) and 2.2(b) are effective
+on the date Contributor first makes Commercial Use of the Covered
+Code.
+
+(d) Notwithstanding Section 2.2(b) above, no patent license is
+granted: 1) for any code that Contributor has deleted from the
+Contributor Version; 2) separate from the Contributor Version; 3) for
+infringements caused by: i) third party modifications of Contributor
+Version or ii) the combination of Modifications made by that
+Contributor with other software (except as part of the Contributor
+Version) or other devices; or 4) under Patent Claims infringed by
+Covered Code in the absence of Modifications made by that Contributor.
+
+
+3. Distribution Obligations.
+
+3.1. Application of License.  The Modifications which You create or to
+which You contribute are governed by the terms of this License,
+including without limitation Section 2.2. The Source Code version of
+Covered Code may be distributed only under the terms of this License
+or a future version of this License released under Section 6.1, and
+You must include a copy of this License with every copy of the Source
+Code You distribute. You may not offer or impose any terms on any
+Source Code version that alters or restricts the applicable version of
+this License or the recipients' rights hereunder. However, You may
+include an additional document offering the additional rights
+described in Section 3.5.
+
+3.2. Availability of Source Code.  Any Modification which You create
+or to which You contribute must be made available in Source Code form
+under the terms of this License either on the same media as an
+Executable version or via an accepted Electronic Distribution
+Mechanism to anyone to whom you made an Executable version available;
+and if made available via Electronic Distribution Mechanism, must
+remain available for at least twelve (12) months after the date it
+initially became available, or at least six (6) months after a
+subsequent version of that particular Modification has been made
+available to such recipients. You are responsible for ensuring that
+the Source Code version remains available even if the Electronic
+Distribution Mechanism is maintained by a third party.
+
+3.3. Description of Modifications.  You must cause all Covered Code to
+which You contribute to contain a file documenting the changes You
+made to create that Covered Code and the date of any change. You must
+include a prominent statement that the Modification is derived,
+directly or indirectly, from Original Code provided by the Initial
+Developer and including the name of the Initial Developer in (a) the
+Source Code, and (b) in any notice in an Executable version or related
+documentation in which You describe the origin or ownership of the
+Covered Code.
+
+3.4. Intellectual Property Matters (a) Third Party Claims.  If
+Contributor has knowledge that a license under a third party's
+intellectual property rights is required to exercise the rights
+granted by such Contributor under Sections 2.1 or 2.2, Contributor
+must include a text file with the Source Code distribution titled
+"LEGAL" which describes the claim and the party making the claim in
+sufficient detail that a recipient will know whom to contact. If
+Contributor obtains such knowledge after the Modification is made
+available as described in Section 3.2, Contributor shall promptly
+modify the LEGAL file in all copies Contributor makes available
+thereafter and shall take other steps (such as notifying appropriate
+mailing lists or newsgroups) reasonably calculated to inform those who
+received the Covered Code that new knowledge has been obtained.
+
+(b) Contributor APIs.  If Contributor's Modifications include an
+application programming interface and Contributor has knowledge of
+patent licenses which are reasonably necessary to implement that API,
+Contributor must also include this information in the LEGAL file.
+=20
+(c) Representations.  Contributor represents that, except as disclosed
+pursuant to Section 3.4(a) above, Contributor believes that
+Contributor's Modifications are Contributor's original creation(s)
+and/or Contributor has sufficient rights to grant the rights conveyed
+by this License.
+
+
+3.5. Required Notices.  You must duplicate the notice in Exhibit A in
+each file of the Source Code.  If it is not possible to put such
+notice in a particular Source Code file due to its structure, then You
+must include such notice in a location (such as a relevant directory)
+where a user would be likely to look for such a notice.  If You
+created one or more Modification(s) You may add your name as a
+Contributor to the notice described in Exhibit A.  You must also
+duplicate this License in any documentation for the Source Code where
+You describe recipients' rights or ownership rights relating to
+Covered Code.  You may choose to offer, and to charge a fee for,
+warranty, support, indemnity or liability obligations to one or more
+recipients of Covered Code. However, You may do so only on Your own
+behalf, and not on behalf of the Initial Developer or any
+Contributor. You must make it absolutely clear than any such warranty,
+support, indemnity or liability obligation is offered by You alone,
+and You hereby agree to indemnify the Initial Developer and every
+Contributor for any liability incurred by the Initial Developer or
+such Contributor as a result of warranty, support, indemnity or
+liability terms You offer.
+
+3.6. Distribution of Executable Versions.  You may distribute Covered
+Code in Executable form only if the requirements of Section 3.1-3.5
+have been met for that Covered Code, and if You include a notice
+stating that the Source Code version of the Covered Code is available
+under the terms of this License, including a description of how and
+where You have fulfilled the obligations of Section 3.2. The notice
+must be conspicuously included in any notice in an Executable version,
+related documentation or collateral in which You describe recipients'
+rights relating to the Covered Code. You may distribute the Executable
+version of Covered Code or ownership rights under a license of Your
+choice, which may contain terms different from this License, provided
+that You are in compliance with the terms of this License and that the
+license for the Executable version does not attempt to limit or alter
+the recipient's rights in the Source Code version from the rights set
+forth in this License. If You distribute the Executable version under
+a different license You must make it absolutely clear that any terms
+which differ from this License are offered by You alone, not by the
+Initial Developer or any Contributor. You hereby agree to indemnify
+the Initial Developer and every Contributor for any liability incurred
+by the Initial Developer or such Contributor as a result of any such
+terms You offer.
+
+3.7. Larger Works.  You may create a Larger Work by combining Covered
+Code with other code not governed by the terms of this License and
+distribute the Larger Work as a single product. In such a case, You
+must make sure the requirements of this License are fulfilled for the
+Covered Code.
+
+4. Inability to Comply Due to Statute or Regulation.
+
+If it is impossible for You to comply with any of the terms of this
+License with respect to some or all of the Covered Code due to
+statute, judicial order, or regulation then You must: (a) comply with
+the terms of this License to the maximum extent possible; and (b)
+describe the limitations and the code they affect. Such description
+must be included in the LEGAL file described in Section 3.4 and must
+be included with all distributions of the Source Code. Except to the
+extent prohibited by statute or regulation, such description must be
+sufficiently detailed for a recipient of ordinary skill to be able to
+understand it.
+
+5. Application of this License.
+
+This License applies to code to which the Initial Developer has
+attached the notice in Exhibit A and to related Covered Code.
+
+6. Versions of the License.
+
+6.1. New Versions.  Thomas Richter may publish revised and/or new
+versions of the License from time to time. Each version will be given
+a distinguishing version number.
+
+6.2. Effect of New Versions.  Once Covered Code has been published
+under a particular version of the License, You may always continue to
+use it under the terms of that version. You may also choose to use
+such Covered Code under the terms of any subsequent version of the
+License published by Thomas Richter. No one other than Thomas Richter
+has the right to modify the terms applicable to Covered Code created
+under this License.
+
+6.3. Derivative Works.  If You create or use a modified version of
+this License (which you may only do in order to apply it to code which
+is not already Covered Code governed by this License), You must (a)
+rename Your license so that the phrases "TPL", "THOR Software",
+"Thomas Richter" or any confusingly similar phrase do not appear in
+your license (except to note that your license differs from this
+License) and (b) otherwise make it clear that Your version of the
+license contains terms which differ from the THOR Public
+License. (Filling in the name of the Initial Developer, Original Code
+or Contributor in the notice described in Exhibit A shall not of
+themselves be deemed to be modifications of this License.)
+
+7. DISCLAIMER OF WARRANTY.
+
+COVERED CODE IS PROVIDED UNDER THIS LICENSE ON AN "AS IS" BASIS,
+WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING,
+WITHOUT LIMITATION, WARRANTIES THAT THE COVERED CODE IS FREE OF
+DEFECTS, MERCHANTABLE, FIT FOR A PARTICULAR PURPOSE OR
+NON-INFRINGING. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF
+THE COVERED CODE IS WITH YOU. SHOULD ANY COVERED CODE PROVE DEFECTIVE
+IN ANY RESPECT, YOU (NOT THE INITIAL DEVELOPER OR ANY OTHER
+CONTRIBUTOR) ASSUME THE COST OF ANY NECESSARY SERVICING, REPAIR OR
+CORRECTION. THIS DISCLAIMER OF WARRANTY CONSTITUTES AN ESSENTIAL PART
+OF THIS LICENSE. NO USE OF ANY COVERED CODE IS AUTHORIZED HEREUNDER
+EXCEPT UNDER THIS DISCLAIMER.
+
+8. TERMINATION.
+
+8.1.  This License and the rights granted hereunder will terminate
+automatically if You fail to comply with terms herein and fail to cure
+such breach within 30 days of becoming aware of the breach. All
+sublicenses to the Covered Code which are properly granted shall
+survive any termination of this License. Provisions which, by their
+nature, must remain in effect beyond the termination of this License
+shall survive.
+
+8.2.  If You initiate litigation by asserting a patent infringement
+claim (excluding declatory judgment actions) against Initial Developer
+or a Contributor (the Initial Developer or Contributor against whom
+You file such action is referred to as "Participant") alleging that:
+
+(a) such Participant's Contributor Version directly or indirectly
+infringes any patent, then any and all rights granted by such
+Participant to You under Sections 2.1 and/or 2.2 of this License
+shall, upon 60 days notice from Participant terminate prospectively,
+unless if within 60 days after receipt of notice You either: (i) agree
+in writing to pay Participant a mutually agreeable reasonable royalty
+for Your past and future use of Modifications made by such
+Participant, or (ii) withdraw Your litigation claim with respect to
+the Contributor Version against such Participant.  If within 60 days
+of notice, a reasonable royalty and payment arrangement are not
+mutually agreed upon in writing by the parties or the litigation claim
+is not withdrawn, the rights granted by Participant to You under
+Sections 2.1 and/or 2.2 automatically terminate at the expiration of
+the 60 day notice period specified above.
+
+(b) any software, hardware, or device, other than such Participant's
+Contributor Version, directly or indirectly infringes any patent, then
+any rights granted to You by such Participant under Sections 2.1(b)
+and 2.2(b) are revoked effective as of the date You first made, used,
+sold, distributed, or had made, Modifications made by that
+Participant.
+
+8.3.  If You assert a patent infringement claim against Participant
+alleging that such Participant's Contributor Version directly or
+indirectly infringes any patent where such claim is resolved (such as
+by license or settlement) prior to the initiation of patent
+infringement litigation, then the reasonable value of the licenses
+granted by such Participant under Sections 2.1 or 2.2 shall be taken
+into account in determining the amount or value of any payment or
+license.
+
+8.4.  In the event of termination under Sections 8.1 or 8.2 above, all
+end user license agreements (excluding distributors and resellers)
+which have been validly granted by You or any distributor hereunder
+prior to termination shall survive termination.
+
+9. LIMITATION OF LIABILITY.
+
+UNDER NO CIRCUMSTANCES AND UNDER NO LEGAL THEORY, WHETHER TORT
+(INCLUDING NEGLIGENCE), CONTRACT, OR OTHERWISE, SHALL YOU, THE INITIAL
+DEVELOPER, ANY OTHER CONTRIBUTOR, OR ANY DISTRIBUTOR OF COVERED CODE,
+OR ANY SUPPLIER OF ANY OF SUCH PARTIES, BE LIABLE TO ANY PERSON FOR
+ANY INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES OF ANY
+CHARACTER INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF GOODWILL,
+WORK STOPPAGE, COMPUTER FAILURE OR MALFUNCTION, OR ANY AND ALL OTHER
+COMMERCIAL DAMAGES OR LOSSES, EVEN IF SUCH PARTY SHALL HAVE BEEN
+INFORMED OF THE POSSIBILITY OF SUCH DAMAGES. THIS LIMITATION OF
+LIABILITY SHALL NOT APPLY TO LIABILITY FOR DEATH OR PERSONAL INJURY
+RESULTING FROM SUCH PARTY'S NEGLIGENCE TO THE EXTENT APPLICABLE LAW
+PROHIBITS SUCH LIMITATION. SOME JURISDICTIONS DO NOT ALLOW THE
+EXCLUSION OR LIMITATION OF INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO
+THIS EXCLUSION AND LIMITATION MAY NOT APPLY TO YOU.
+
+10. U.S. GOVERNMENT END USERS.
+
+The Covered Code is a "commercial item," as that term is defined in 48
+C.F.R. 2.101 (Oct. 1995), consisting of "commercial computer software"
+and "commercial computer software documentation," as such terms are
+used in 48 C.F.R. 12.212 (Sept. 1995). Consistent with 48
+C.F.R. 12.212 and 48 C.F.R. 227.7202-1 through 227.7202-4 (June 1995),
+all U.S. Government End Users acquire Covered Code with only those
+rights set forth herein.
+
+11. MISCELLANEOUS.
+
+This License represents the complete agreement concerning subject
+matter hereof. If any provision of this License is held to be
+unenforceable, such provision shall be reformed only to the extent
+necessary to make it enforceable. This License shall be governed by
+German law provisions (except to the extent applicable law, if any,
+provides otherwise), excluding its conflict-of-law provisions. With
+respect to disputes in which at least one party is a citizen of, or an
+entity chartered or registered to do business in Federal Republic of
+Germany, any litigation relating to this License shall be subject to
+the jurisdiction of the Federal Courts of the Federal Republic of
+Germany, with the losing party responsible for costs, including
+without limitation, court costs and reasonable attorneys' fees and
+expenses. Any law or regulation which provides that the language of a
+contract shall be construed against the drafter shall not apply to
+this License.
+
+12. RESPONSIBILITY FOR CLAIMS.
+
+As between Initial Developer and the Contributors, each party is
+responsible for claims and damages arising, directly or indirectly,
+out of its utilization of rights under this License and You agree to
+work with Initial Developer and Contributors to distribute such
+responsibility on an equitable basis. Nothing herein is intended or
+shall be deemed to constitute any admission of liability.
+
+13. MULTIPLE-LICENSED CODE.
+
+Initial Developer may designate portions of the Covered Code as
+Multiple-Licensed.  Multiple-Licensed means that the Initial Developer
+permits you to utilize portions of the Covered Code under Your choice
+of the TPL or the alternative licenses, if any, specified by the
+Initial Developer in the file described in Exhibit A.
+
+
+EXHIBIT A - THOR Public License.
+
+The contents of this file are subject to the THOR Public License
+Version 1.0 (the "License"); you may not use this file except in
+compliance with the License.=20
+
+Software distributed under the License is distributed on an "AS IS"
+basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
+the License for the specificlanguage governing rights and limitations
+under the License.
+
+The Original Code is ______________________________________.
+
+The Initial Developer of the Original Code is _____________.=20
+
+Portions created by  ______________________ are=20
+Copyright (C) ______ _______________________.=20
+
+All Rights Reserved.
+
+Contributor(s): ______________________________________.
+
+Alternatively, the contents of this file may be used under the terms
+of the _____ license (the [___] License), in which case the provisions
+of [______] License are applicable instead of those above.  If you
+wish to allow use of your version of this file only under the terms of
+the [____] License and not to allow others to use your version of this
+file under the TPL, indicate your decision by deleting the provisions
+above and replace them with the notice and other provisions required
+by the [___] License.  If you do not delete the provisions above, a
+recipient may use your version of this file under either the TPL or
+the [___] License."
+
+[NOTE: The text of this Exhibit A may differ slightly from the text of
+the notices in the Source Code files of the Original Code. You should
+use the text of this Exhibit A rather than the text found in the
+Original Code Source Code for Your Modifications.]
diff --git a/meta/files/common-licenses/TTWL b/meta/files/common-licenses/T=
TWL
new file mode 100644
index 00000000000..c13d3fbe04a
--- /dev/null
+++ b/meta/files/common-licenses/TTWL
@@ -0,0 +1,8 @@
+Copyright (C) 1996-2002,2005,2006 David Muir Sharnoff.=20=20
+Copyright (C) 2005 Aristotle Pagaltzis=20
+Copyright (C) 2012-2013 Google, Inc.
+
+This module may be modified, used, copied, and redistributed at your own r=
isk.
+Although allowed by the preceding license, please do not publicly
+redistribute modified versions of this code with the name "Text::Tabs"
+unless it passes the unmodified Text::Tabs test suite.
diff --git a/meta/files/common-licenses/TTYP0 b/meta/files/common-licenses/=
TTYP0
new file mode 100644
index 00000000000..cd163f96acb
--- /dev/null
+++ b/meta/files/common-licenses/TTYP0
@@ -0,0 +1,30 @@
+THE TTYP0 LICENSE
+
+Permission is hereby granted, free of charge, to any person obtaining
+a copy of this font software and associated files (the "Software"),
+to deal in the Software without restriction, including without
+limitation the rights to use, copy, modify, merge, publish,
+distribute, embed, sublicense, and/or sell copies of the Software,
+and to permit persons to whom the Software is furnished to do so,
+subject to the following conditions:
+
+(1) The above copyright notice, this permission notice, and the
+    disclaimer below shall be included in all copies or substantial
+    portions of the Software.
+
+(2) If the design of any glyphs in the fonts that are contained in the
+    Software or generated during the installation process is modified
+    or if additional glyphs are added to the fonts, the fonts
+    must be renamed. The new names may not contain the word "UW",
+    irrespective of capitalisation; the new names may contain the word
+    "ttyp0", irrespective of capitalisation, only if preceded by a
+    foundry name different from "UW".
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
+CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
+TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
+SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+
diff --git a/meta/files/common-licenses/TermReadKey b/meta/files/common-lic=
enses/TermReadKey
new file mode 100644
index 00000000000..ee668e0f313
--- /dev/null
+++ b/meta/files/common-licenses/TermReadKey
@@ -0,0 +1 @@
+Unlimited distribution and/or modification is allowed as long as this copy=
right notice remains intact.
diff --git a/meta/files/common-licenses/UCAR b/meta/files/common-licenses/U=
CAR
new file mode 100644
index 00000000000..36e1810283e
--- /dev/null
+++ b/meta/files/common-licenses/UCAR
@@ -0,0 +1,32 @@
+Copyright 2014 University Corporation for Atmospheric Research and contrib=
utors.
+All rights reserved.
+
+This software was developed by the Unidata Program Center of the
+University Corporation for Atmospheric Research (UCAR)
+<http://www.unidata.ucar.edu>.
+
+Redistribution and use in source and binary forms, with or without modific=
ation,
+are permitted provided that the following conditions are met:
+
+   1) Redistributions of source code must retain the above copyright notic=
e,
+      this list of conditions and the following disclaimer.
+   2) Redistributions in binary form must reproduce the above copyright no=
tice,
+      this list of conditions and the following disclaimer in the document=
ation
+      and/or other materials provided with the distribution.
+   3) Neither the names of the development group, the copyright holders, n=
or the
+      names of contributors may be used to endorse or promote products der=
ived
+      from this software without specific prior written permission.
+   4) This license shall terminate automatically and you may no longer exe=
rcise
+      any of the rights granted to you by this license as of the date you
+      commence an action, including a cross-claim or counterclaim, against
+      the copyright holders or any contributor alleging that this software
+      infringes a patent. This termination provision shall not apply for an
+      action alleging patent infringement by combinations of this software=
 with
+      other software or hardware.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, F=
ITNESS
+FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE CONTRI=
BUTORS
+OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF =
OR IN
+CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWAR=
E.
diff --git a/meta/files/common-licenses/UMich-Merit b/meta/files/common-lic=
enses/UMich-Merit
new file mode 100644
index 00000000000..93e304b90ee
--- /dev/null
+++ b/meta/files/common-licenses/UMich-Merit
@@ -0,0 +1,19 @@
+[C] The Regents of the University of Michigan and Merit Network, Inc. 1992,
+1993, 1994, 1995 All Rights Reserved
+
+Permission to use, copy, modify, and distribute this software and its
+documentation for any purpose and without fee is hereby granted, provided
+that the above copyright notice and this permission notice appear in all
+copies of the software and derivative works or modified versions thereof,
+and that both the copyright notice and this permission and disclaimer
+notice appear in supporting documentation.
+
+THIS SOFTWARE IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
+EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION WARRANTIES OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE REGENTS OF THE
+UNIVERSITY OF MICHIGAN AND MERIT NETWORK, INC. DO NOT WARRANT THAT THE
+FUNCTIONS CONTAINED IN THE SOFTWARE WILL MEET LICENSEE'S REQUIREMENTS OR
+THAT OPERATION WILL BE UNINTERRUPTED OR ERROR FREE.  The Regents of the
+University of Michigan and Merit Network, Inc. shall not be liable for any
+special, indirect, incidental or consequential damages with respect to any
+claim by Licensee or any third party arising from use of the software.
diff --git a/meta/files/common-licenses/URT-RLE b/meta/files/common-license=
s/URT-RLE
new file mode 100644
index 00000000000..11dad58c210
--- /dev/null
+++ b/meta/files/common-licenses/URT-RLE
@@ -0,0 +1,15 @@
+ * This software is copyrighted as noted below.  It may be freely copied,
+ * modified, and redistributed, provided that the copyright notice is
+ * preserved on all copies.
+ *
+ * There is no warranty or other guarantee of fitness for this software,
+ * it is provided solely "as is".  Bug reports or fixes may be sent
+ * to the author, who may or may not act on them as he desires.
+ *
+ * You may not include this software in a program or other software product
+ * without supplying the source, or without informing the end-user that the
+ * source is available for no extra charge.
+ *
+ * If you modify this software, you should include a notice giving the
+ * name of the person performing the modification, the date of modificatio=
n,
+ * and the reason for such modification.
diff --git a/meta/files/common-licenses/Unicode-3.0 b/meta/files/common-lic=
enses/Unicode-3.0
new file mode 100644
index 00000000000..11f2842a303
--- /dev/null
+++ b/meta/files/common-licenses/Unicode-3.0
@@ -0,0 +1,39 @@
+UNICODE LICENSE V3
+
+COPYRIGHT AND PERMISSION NOTICE
+
+Copyright =C2=A9 1991-2023 Unicode, Inc.
+
+NOTICE TO USER: Carefully read the following legal agreement. BY
+DOWNLOADING, INSTALLING, COPYING OR OTHERWISE USING DATA FILES, AND/OR
+SOFTWARE, YOU UNEQUIVOCALLY ACCEPT, AND AGREE TO BE BOUND BY, ALL OF THE
+TERMS AND CONDITIONS OF THIS AGREEMENT. IF YOU DO NOT AGREE, DO NOT
+DOWNLOAD, INSTALL, COPY, DISTRIBUTE OR USE THE DATA FILES OR SOFTWARE.
+
+Permission is hereby granted, free of charge, to any person obtaining a
+copy of data files and any associated documentation (the "Data Files") or
+software and any associated documentation (the "Software") to deal in the
+Data Files or Software without restriction, including without limitation
+the rights to use, copy, modify, merge, publish, distribute, and/or sell
+copies of the Data Files or Software, and to permit persons to whom the
+Data Files or Software are furnished to do so, provided that either (a)
+this copyright and permission notice appear with all copies of the Data
+Files or Software, or (b) this copyright and permission notice appear in
+associated Documentation.
+
+THE DATA FILES AND SOFTWARE ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
+KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF
+THIRD PARTY RIGHTS.
+
+IN NO EVENT SHALL THE COPYRIGHT HOLDER OR HOLDERS INCLUDED IN THIS NOTICE
+BE LIABLE FOR ANY CLAIM, OR ANY SPECIAL INDIRECT OR CONSEQUENTIAL DAMAGES,
+OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
+WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,
+ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THE DATA
+FILES OR SOFTWARE.
+
+Except as contained in this notice, the name of a copyright holder shall
+not be used in advertising or otherwise to promote the sale, use or other
+dealings in these Data Files or Software without prior written
+authorization of the copyright holder.
diff --git a/meta/files/common-licenses/UnixCrypt b/meta/files/common-licen=
ses/UnixCrypt
new file mode 100644
index 00000000000..280853382b5
--- /dev/null
+++ b/meta/files/common-licenses/UnixCrypt
@@ -0,0 +1,6 @@
+Copyright (c) 1996 Aki Yoshida. All rights reserved.
+
+Permission to use, copy, modify and distribute this software
+for non-commercial or commercial purposes and without fee is
+hereby granted provided that this copyright notice appears in
+all copies.
diff --git a/meta/files/common-licenses/Widget-Workshop b/meta/files/common=
-licenses/Widget-Workshop
new file mode 100644
index 00000000000..d4df9b5067d
--- /dev/null
+++ b/meta/files/common-licenses/Widget-Workshop
@@ -0,0 +1,19 @@
+Copyright (c) 1996 Widget Workshop, Inc. All Rights Reserved.=20
+
+Permission to use, copy, modify, and distribute this software and=20
+its documentation for NON-COMMERCIAL or COMMERCIAL purposes and=20
+without fee is hereby granted, provided that this copyright notice=20
+is kept intact. WIDGET WORKSHOP MAKES NO REPRESENTATIONS OR WARRANTIES=20
+ABOUT THE SUITABILITY OF THE SOFTWARE, EITHER EXPRESS OR IMPLIED,=20
+INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY,=20
+FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT. WIDGET WORKSHOP=20
+SHALL NOT BE LIABLE FOR ANY DAMAGES SUFFERED BY LICENSEE AS A RESULT=20
+OF USING, MODIFYING OR DISTRIBUTING THIS SOFTWARE OR ITS DERIVATIVES.=20
+THIS SOFTWARE IS NOT DESIGNED OR INTENDED FOR USE OR RESALE AS ON-LINE=20
+CONTROL EQUIPMENT IN HAZARDOUS ENVIRONMENTS REQUIRING FAIL-SAFE PERFORMANC=
E,=20
+SUCH AS IN THE OPERATION OF NUCLEAR FACILITIES, AIRCRAFT NAVIGATION OR=20
+COMMUNICATION SYSTEMS, AIR TRAFFIC CONTROL, DIRECT LIFE SUPPORT MACHINES,=
=20
+OR WEAPONS SYSTEMS, IN WHICH THE FAILURE OF THE SOFTWARE COULD LEAD=20
+DIRECTLY TO DEATH, PERSONAL INJURY, OR SEVERE PHYSICAL OR ENVIRONMENTAL=20
+DAMAGE ("HIGH RISK ACTIVITIES"). WIDGET WORKSHOP SPECIFICALLY DISCLAIMS=20
+ANY EXPRESS OR IMPLIED WARRANTY OF FITNESS FOR HIGH RISK ACTIVITIES.
diff --git a/meta/files/common-licenses/X11-distribute-modifications-varian=
t b/meta/files/common-licenses/X11-distribute-modifications-variant
new file mode 100644
index 00000000000..978c1997316
--- /dev/null
+++ b/meta/files/common-licenses/X11-distribute-modifications-variant
@@ -0,0 +1,25 @@
+Copyright (c) <year> <copyright holders>
+
+Permission is hereby granted, free of charge, to any person obtaining a
+copy of this software and associated documentation files (the
+"Software"), to deal in the Software without restriction, including
+without limitation the rights to use, copy, modify, merge, publish,
+distribute, distribute with modifications, sublicense, and/or sell
+copies of the Software, and to permit persons to whom the Software is
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included
+in all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
+OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
+IN NO EVENT SHALL THE ABOVE COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
+DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
+OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
+THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+
+Except as contained in this notice, the name(s) of the above copyright
+holders shall not be used in advertising or otherwise to promote the
+sale, use or other dealings in this Software without prior written
+authorization.
diff --git a/meta/files/common-licenses/Xdebug-1.03 b/meta/files/common-lic=
enses/Xdebug-1.03
new file mode 100644
index 00000000000..548e74455c8
--- /dev/null
+++ b/meta/files/common-licenses/Xdebug-1.03
@@ -0,0 +1,60 @@
+--------------------------------------------------------------------=20
+                 The Xdebug License, version 1.03
+             (Based on "The PHP License", version 3.01)
+   Copyright (c) 2003-2022 Derick Rethans. All rights reserved.
+--------------------------------------------------------------------=20
+
+Redistribution and use in source and binary forms, with or without
+modification, is permitted provided that the following conditions
+are met:
+
+  1. Redistributions of source code must retain the above copyright
+     notice, this list of conditions and the following disclaimer.
+=20
+  2. Redistributions in binary form must reproduce the above copyright
+     notice, this list of conditions and the following disclaimer in
+     the documentation and/or other materials provided with the
+     distribution.
+=20
+  3. The name "Xdebug" must not be used to endorse or promote products
+     derived from this software without prior written permission. For
+     written permission, please contact derick@xdebug.org.
+=20=20
+  4. Products derived from this software may not be called "Xdebug", nor
+     may "Xdebug" appear in their name, without prior written permission
+     from derick@xdebug.org.
+=20
+  5. Derick Rethans may publish revised and/or new versions of the
+     license from time to time. Each version will be given a
+     distinguishing version number.  Once covered code has been
+     published under a particular version of the license, you may
+     always continue to use it under the terms of that version. You
+     may also choose to use such covered code under the terms of any
+     subsequent version of the license published by Derick Rethans. No
+     one other than Derick Rethans has the right to modify the terms
+     applicable to covered code created under this License.
+
+  6. Redistributions of any form whatsoever must retain the following
+     acknowledgment: "This product includes Xdebug software, freely
+     available from <https://xdebug.org/>".
+
+THIS SOFTWARE IS PROVIDED BY DERICK RETHANS ``AS IS'' AND ANY
+EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE PHP DEVELOPMENT TEAM OR
+ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+--------------------------------------------------------------------
+
+This software consists of voluntary contributions made by some
+individuals on behalf of Derick Rethans.
+
+Derick Rethans can be contacted via e-mail at derick@xdebug.org.
+
+For more information on Xdebug, please see <https://xdebug.org>.
diff --git a/meta/files/common-licenses/Xfig b/meta/files/common-licenses/X=
fig
new file mode 100644
index 00000000000..c2d56093d54
--- /dev/null
+++ b/meta/files/common-licenses/Xfig
@@ -0,0 +1,7 @@
+Any party obtaining a copy of these files is granted, free of charge,=20
+a full and unrestricted irrevocable, world-wide, paid up, royalty-free,=20
+nonexclusive right and license to deal in this software and documentation=
=20
+files (the "Software"), including without limitation the rights to use,=20
+copy, modify, merge, publish and/or distribute copies of the Software,=20
+and to permit persons who receive copies from any such party to do so,=20
+with the only requirement being that this copyright notice remain intact.
diff --git a/meta/files/common-licenses/Zeeff b/meta/files/common-licenses/=
Zeeff
new file mode 100644
index 00000000000..408efb2ffda
--- /dev/null
+++ b/meta/files/common-licenses/Zeeff
@@ -0,0 +1,3 @@
+Copyright 1988 Jon Zeeff (zeeff@b-tech.ann-arbor.mi.us)=20=20
+You can use this code in any manner, as long as you leave my=20
+name on it and don't hold me responsible for any problems with it.
diff --git a/meta/files/common-licenses/any-OSI b/meta/files/common-license=
s/any-OSI
new file mode 100644
index 00000000000..5f69e02b8a6
--- /dev/null
+++ b/meta/files/common-licenses/any-OSI
@@ -0,0 +1,3 @@
+Pick your favourite OSI approved license :)
+
+http://www.opensource.org/licenses/alphabetical
diff --git a/meta/files/common-licenses/bcrypt-Solar-Designer b/meta/files/=
common-licenses/bcrypt-Solar-Designer
new file mode 100644
index 00000000000..8cb05017fc5
--- /dev/null
+++ b/meta/files/common-licenses/bcrypt-Solar-Designer
@@ -0,0 +1,11 @@
+Written by Solar Designer <solar at openwall.com> in 1998-2014.
+No copyright is claimed, and the software is hereby placed in the public
+domain.  In case this attempt to disclaim copyright and place the software
+in the public domain is deemed null and void, then the software is
+Copyright (c) 1998-2014 Solar Designer and it is hereby released to the
+general public under the following terms:
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted.
+
+There's ABSOLUTELY NO WARRANTY, express or implied.
diff --git a/meta/files/common-licenses/check-cvs b/meta/files/common-licen=
ses/check-cvs
new file mode 100644
index 00000000000..85fee4791eb
--- /dev/null
+++ b/meta/files/common-licenses/check-cvs
@@ -0,0 +1,2 @@
+Permission is granted to copy and/or distribute this file, with or
+without modifications, provided this notice is preserved.
diff --git a/meta/files/common-licenses/checkmk b/meta/files/common-license=
s/checkmk
new file mode 100644
index 00000000000..46c6b74278c
--- /dev/null
+++ b/meta/files/common-licenses/checkmk
@@ -0,0 +1,9 @@
+# Copyright (c) 2006, 2010  Micah Cowan
+#
+# Redistribution of this program in any form, with or without
+# modifications, is permitted, provided that the above copyright is
+# retained in distributions of this program in source form.
+#
+# (This is a free, non-copyleft license compatible with pretty much any
+# other free or proprietary license, including the GPL. It's essentially
+# a scaled-down version of the "modified" BSD license.)
diff --git a/meta/files/common-licenses/cve-tou b/meta/files/common-license=
s/cve-tou
new file mode 100644
index 00000000000..c7b2f02e3e5
--- /dev/null
+++ b/meta/files/common-licenses/cve-tou
@@ -0,0 +1,16 @@
+CVE Usage: MITRE hereby grants you a perpetual, worldwide, non-exclusive,
+no-charge, royalty-free, irrevocable copyright license to reproduce, prepa=
re
+derivative works of, publicly display, publicly perform, sublicense, and
+distribute Common Vulnerabilities and Exposures (CVE=C2=AE). Any copy you =
make for
+such purposes is authorized provided that you reproduce MITRE's copyright
+designation and this license in any such copy.
+
+DISCLAIMERS
+
+ALL DOCUMENTS AND THE INFORMATION CONTAINED THEREIN PROVIDED BY MITRE ARE
+PROVIDED ON AN "AS IS" BASIS AND THE CONTRIBUTOR, THE ORGANIZATION HE/SHE
+REPRESENTS OR IS SPONSORED BY (IF ANY), THE MITRE CORPORATION, ITS BOARD OF
+TRUSTEES, OFFICERS, AGENTS, AND EMPLOYEES, DISCLAIM ALL WARRANTIES, EXPRES=
S OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTY THAT THE USE OF THE
+INFORMATION THEREIN WILL NOT INFRINGE ANY RIGHTS OR ANY IMPLIED WARRANTIES=
 OF
+MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.
diff --git a/meta/files/common-licenses/dtoa b/meta/files/common-licenses/d=
toa
new file mode 100644
index 00000000000..6de2b084fc6
--- /dev/null
+++ b/meta/files/common-licenses/dtoa
@@ -0,0 +1,14 @@
+The author of this software is David M. Gay.
+
+Copyright (c) 1991, 2000, 2001 by Lucent Technologies.
+
+Permission to use, copy, modify, and distribute this software for any
+purpose without fee is hereby granted, provided that this entire notice
+is included in all copies of any software which is or includes a copy
+or modification of this software and in all copies of the supporting
+documentation for such software.
+
+THIS SOFTWARE IS BEING PROVIDED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED
+WARRANTY.  IN PARTICULAR, NEITHER THE AUTHOR NOR LUCENT MAKES ANY
+REPRESENTATION OR WARRANTY OF ANY KIND CONCERNING THE MERCHANTABILITY
+OF THIS SOFTWARE OR ITS FITNESS FOR ANY PARTICULAR PURPOSE.
diff --git a/meta/files/common-licenses/fwlw b/meta/files/common-licenses/f=
wlw
new file mode 100644
index 00000000000..472a85a5644
--- /dev/null
+++ b/meta/files/common-licenses/fwlw
@@ -0,0 +1,5 @@
+Copyright (C) 1993,1995 by Donald Arseneau
+Vancouver, Canada, email asnd@triumf.ca
+
+This software package may be freely used, transmitted, reproduced, or modi=
fied provided that=20
+this notice is left intact.
diff --git a/meta/files/common-licenses/gtkbook b/meta/files/common-license=
s/gtkbook
new file mode 100644
index 00000000000..91215e80d6e
--- /dev/null
+++ b/meta/files/common-licenses/gtkbook
@@ -0,0 +1,6 @@
+Copyright 2005 Syd Logan, All Rights Reserved
+
+This code is distributed without warranty. You are free to use
+this code for any purpose, however, if this code is republished or
+redistributed in its original form, as hardcopy or electronically,
+then you must include this copyright notice along with the code.
diff --git a/meta/files/common-licenses/hdparm b/meta/files/common-licenses=
/hdparm
new file mode 100644
index 00000000000..280a1c07974
--- /dev/null
+++ b/meta/files/common-licenses/hdparm
@@ -0,0 +1,9 @@
+BSD-Style Open Source License:
+
+You may freely use, modify, and redistribute the hdparm program,
+as either binary or source, or both.
+
+The only condition is that my name and copyright notice
+remain in the source code as-is.
+
+Mark Lord (mlord@pobox.com)
diff --git a/meta/files/common-licenses/libutil-David-Nugent b/meta/files/c=
ommon-licenses/libutil-David-Nugent
new file mode 100644
index 00000000000..e04b03e3403
--- /dev/null
+++ b/meta/files/common-licenses/libutil-David-Nugent
@@ -0,0 +1,15 @@
+Copyright (c) 1995 David Nugent <davidn@blaze.net.au>
+All rights reserved.
+
+
+Redistribution and use in source and binary forms, with or without modific=
ation, is permitted provided that the following conditions are met:
+
+1.	Redistributions of source code must retain the above copyright notice i=
mmediately at the beginning of the file, without modification, this list of=
 conditions, and the following disclaimer.
+
+2.	Redistributions in binary form must reproduce the above copyright notic=
e, this list of conditions and the following disclaimer in the documentatio=
n and/or other materials provided with the distribution.
+
+3.	This work was done expressly for inclusion into FreeBSD. Other use is p=
ermitted provided this notation is included.
+
+4.	Absolutely no warranty of function or purpose is made by the author Dav=
id Nugent.
+
+5.	Modifications may be freely made to this file providing the above condi=
tions are met.
diff --git a/meta/files/common-licenses/lsof b/meta/files/common-licenses/l=
sof
new file mode 100644
index 00000000000..279721a90a6
--- /dev/null
+++ b/meta/files/common-licenses/lsof
@@ -0,0 +1,26 @@
+Copyright 2002 Purdue Research Foundation, West Lafayette,
+Indiana 47907.  All rights reserved.
+
+Written by Victor A. Abell
+
+This software is not subject to any license of the American
+Telephone and Telegraph Company or the Regents of the
+University of California.
+
+Permission is granted to anyone to use this software for
+any purpose on any computer system, and to alter it and
+redistribute it freely, subject to the following
+restrictions:
+
+1. Neither the authors nor Purdue University are responsible
+   for any consequences of the use of this software.
+
+2. The origin of this software must not be misrepresented,
+   either by explicit claim or by omission.  Credit to the
+   authors and Purdue University must appear in documentation
+   and sources.
+
+3. Altered versions must be plainly marked as such, and must
+   not be misrepresented as being the original software.
+
+4. This notice may not be removed or altered.
diff --git a/meta/files/common-licenses/magaz b/meta/files/common-licenses/=
magaz
new file mode 100644
index 00000000000..34d033c03eb
--- /dev/null
+++ b/meta/files/common-licenses/magaz
@@ -0,0 +1,4 @@
+Copyright 1999-2011, Donald Arseneau,   asnd@triumf.ca,  Vancouver, Canada
+
+This software may be freely used, transmitted, reproduced, or modified pro=
vided that=20
+the copyright notice and this permission is retained.
diff --git a/meta/files/common-licenses/mailprio b/meta/files/common-licens=
es/mailprio
new file mode 100644
index 00000000000..e004e4b683d
--- /dev/null
+++ b/meta/files/common-licenses/mailprio
@@ -0,0 +1,9 @@
+Copyright 1994, 1996, Tony Sanders <sanders@earth.com>
+
+Rights are hereby granted to download, use, modify, sell, copy, and
+redistribute this software so long as the original copyright notice
+and this list of conditions remain intact and modified versions are
+noted as such.
+
+I would also very much appreciate it if you could send me a copy of
+any changes you make so I can possibly integrate them into my version.
diff --git a/meta/files/common-licenses/metamail b/meta/files/common-licens=
es/metamail
new file mode 100644
index 00000000000..be7a8a4e5ac
--- /dev/null
+++ b/meta/files/common-licenses/metamail
@@ -0,0 +1,12 @@
+Copyright (c) 1991 Bell Communications Research, Inc. (Bellcore)
+
+Permission to use, copy, modify, and distribute this material
+for any purpose and without fee is hereby granted, provided
+that the above copyright notice and this permission notice
+appear in all copies, and that the name of Bellcore not be
+used in advertising or publicity pertaining to this
+material without the specific, prior written permission
+of an authorized representative of Bellcore.	BELLCORE
+MAKES NO REPRESENTATIONS ABOUT THE ACCURACY OR SUITABILITY
+OF THIS MATERIAL FOR ANY PURPOSE.  IT IS PROVIDED "AS IS",
+WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
diff --git a/meta/files/common-licenses/mpi-permissive b/meta/files/common-=
licenses/mpi-permissive
new file mode 100644
index 00000000000..2abcbe3ab0c
--- /dev/null
+++ b/meta/files/common-licenses/mpi-permissive
@@ -0,0 +1,15 @@
+* Copyright (C) 2000-2004 by Etnus, LLC
+ *
+ * Permission is hereby granted to use, reproduce, prepare derivative
+ * works, and to redistribute to others.
+ *
+ *				  DISCLAIMER
+ *
+ * Neither Etnus, nor any of their employees, makes any warranty
+ * express or implied, or assumes any legal liability or
+ * responsibility for the accuracy, completeness, or usefulness of any
+ * information, apparatus, product, or process disclosed, or
+ * represents that its use would not infringe privately owned rights.
+ *
+ * This code was written by
+ * James Cownie: Etnus, LLC. <jcownie@etnus.com>
diff --git a/meta/files/common-licenses/mplus b/meta/files/common-licenses/=
mplus
new file mode 100644
index 00000000000..7ff7d504d1a
--- /dev/null
+++ b/meta/files/common-licenses/mplus
@@ -0,0 +1,6 @@
+
+These fonts are free softwares. Unlimited permission is
+granted to use, copy, and distribute it, with or without
+modification, either commercially and noncommercially.
+THESE FONTS ARE PROVIDED "AS IS" WITHOUT WARRANTY.
+=20=20=20=20=20
diff --git a/meta/files/common-licenses/pnmstitch b/meta/files/common-licen=
ses/pnmstitch
new file mode 100644
index 00000000000..cb9dc762d91
--- /dev/null
+++ b/meta/files/common-licenses/pnmstitch
@@ -0,0 +1,23 @@
+Copyright (c) 2002 Mark Salyzyn
+All rights reserved.
+
+TERMS AND CONDITIONS OF USE
+
+Redistribution and use in source form, with or without modification, are
+permitted provided that redistributions of source code must retain the
+above copyright notice, this list of conditions and the following
+disclaimer.
+
+This software is provided `as is' by Mark Salyzyn and any express or impli=
ed
+warranties, including, but not limited to, the implied warranties of
+merchantability and fitness for a particular purpose, are disclaimed. In no
+event shall Mark Salyzyn be liable for any direct, indirect, incidental,
+special, exemplary or consequential damages (including, but not limited to,
+procurement of substitute goods or services; loss of use, data, or profits;
+or business interruptions) however caused and on any theory of liability,
+whether in contract, strict liability, or tort (including negligence or
+otherwise) arising in any way out of the use of this software, even if
+advised of the possibility of such damage.
+
+Any restrictions or encumberances added to this source code or derivitives,
+is prohibited.
diff --git a/meta/files/common-licenses/python-ldap b/meta/files/common-lic=
enses/python-ldap
new file mode 100644
index 00000000000..733e8cfc0af
--- /dev/null
+++ b/meta/files/common-licenses/python-ldap
@@ -0,0 +1,10 @@
+The python-ldap package is distributed under Python-style license.
+
+Standard disclaimer:
+   This software is made available by the author(s) to the public for free
+   and "as is".  All users of this free software are solely and entirely
+   responsible for their own choice and use of this software for their
+   own purposes.  By using this software, each user agrees that the
+   author(s) shall not be liable for damages of any kind in relation to
+   its use or performance. The author(s) do not warrant that this software
+   is fit for any purpose.
diff --git a/meta/files/common-licenses/radvd b/meta/files/common-licenses/=
radvd
new file mode 100644
index 00000000000..4e77909ed75
--- /dev/null
+++ b/meta/files/common-licenses/radvd
@@ -0,0 +1,37 @@
+  The author(s) grant permission for redistribution and use in source and
+binary forms, with or without modification, of the software and documentat=
ion
+provided that the following conditions are met:
+
+0. If you receive a version of the software that is specifically labelled
+   as not being for redistribution (check the version message and/or READM=
E),
+   you are not permitted to redistribute that version of the software in a=
ny
+   way or form.
+1. All terms of all other applicable copyrights and licenses must be
+   followed.
+2. Redistributions of source code must retain the authors' copyright
+   notice(s), this list of conditions, and the following disclaimer.
+3. Redistributions in binary form must reproduce the authors' copyright
+   notice(s), this list of conditions, and the following disclaimer in the
+   documentation and/or other materials provided with the distribution.
+4. All advertising materials mentioning features or use of this software
+   must display the following acknowledgement with the name(s) of the
+   authors as specified in the copyright notice(s) substituted where
+   indicated:
+
+        This product includes software developed by the authors which are
+	mentioned at the start of the source files and other contributors.
+
+5. Neither the name(s) of the author(s) nor the names of its contributors
+   may be used to endorse or promote products derived from this software
+   without specific prior written permission.
+
+THIS SOFTWARE IS PROVIDED BY ITS AUTHORS AND CONTRIBUTORS ``AS IS'' AND ANY
+EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+DISCLAIMED. IN NO EVENT SHALL THE AUTHORS OR CONTRIBUTORS BE LIABLE FOR ANY
+DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICE=
S;
+LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AN=
D ON
+ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF T=
HIS
+SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/meta/files/common-licenses/snprintf b/meta/files/common-licens=
es/snprintf
new file mode 100644
index 00000000000..9e4ae73daae
--- /dev/null
+++ b/meta/files/common-licenses/snprintf
@@ -0,0 +1,3 @@
+Copyright Patrick Powell 1995=20
+
+This code is based on code written by Patrick Powell (papowell@astart.com)=
 It may be used for any purpose as long as this notice remains intact on al=
l source code distributions
diff --git a/meta/files/common-licenses/softSurfer b/meta/files/common-lice=
nses/softSurfer
new file mode 100644
index 00000000000..1bbc88c34c3
--- /dev/null
+++ b/meta/files/common-licenses/softSurfer
@@ -0,0 +1,6 @@
+Copyright 2001, softSurfer (www.softsurfer.com)
+This code may be freely used and modified for any purpose=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
+providing that this copyright notice is included with it.
+SoftSurfer makes no warranty for this code, and cannot be held
+liable for any real or imagined damage resulting from its use.
+Users of this code must verify correctness for their application.
diff --git a/meta/files/common-licenses/ssh-keyscan b/meta/files/common-lic=
enses/ssh-keyscan
new file mode 100644
index 00000000000..6c97472c1eb
--- /dev/null
+++ b/meta/files/common-licenses/ssh-keyscan
@@ -0,0 +1,5 @@
+* Copyright 1995, 1996 by David Mazieres <dm@lcs.mit.edu>.
+*
+* Modification and redistribution in source and binary forms is
+* permitted provided that due credit is given to the author and the
+* OpenBSD project by leaving this copyright notice intact.
diff --git a/meta/files/common-licenses/swrule b/meta/files/common-licenses=
/swrule
new file mode 100644
index 00000000000..aebc5fd6d3d
--- /dev/null
+++ b/meta/files/common-licenses/swrule
@@ -0,0 +1 @@
+The style package is copyrighted but may be used and extended in any way, =
as long as a pointer to the original author is maintained. The author is no=
t liable for any problem that may or may not result from using this package=
. Use at your own risk.
diff --git a/meta/files/common-licenses/threeparttable b/meta/files/common-=
licenses/threeparttable
new file mode 100644
index 00000000000..498b7282263
--- /dev/null
+++ b/meta/files/common-licenses/threeparttable
@@ -0,0 +1,3 @@
+This file may be distributed, modified, and used in other works with just
+one restriction: modified versions must clearly indicate the modification
+(a name change, or a displayed message, or ?).
diff --git a/meta/files/common-licenses/ulem b/meta/files/common-licenses/u=
lem
new file mode 100644
index 00000000000..ee49efe8dd2
--- /dev/null
+++ b/meta/files/common-licenses/ulem
@@ -0,0 +1,4 @@
+Copyright 1989-2019 by Donald Arseneau (Vancouver, Canada, asnd@triumf.ca)
+
+This software may be freely transmitted, reproduced, or modified
+for any purpose provided that this copyright notice is left intact.
diff --git a/meta/files/common-licenses/w3m b/meta/files/common-licenses/w3m
new file mode 100644
index 00000000000..37081007bf3
--- /dev/null
+++ b/meta/files/common-licenses/w3m
@@ -0,0 +1,11 @@
+(C) Copyright 1994-2002 by Akinori Ito
+(C) Copyright 2002-2011 by Akinori Ito, Hironori Sakamoto, Fumitoshi Ukai
+
+Use, modification and redistribution of this software is hereby granted,
+provided that this entire copyright notice is included on any copies of
+this software and applications and derivations thereof.
+
+This software is provided on an "as is" basis, without warranty of any
+kind, either expressed or implied, as to any matter including, but not
+limited to warranty of fitness of purpose, or merchantability, or
+results obtained from use of this software.
diff --git a/meta/files/common-licenses/xkeyboard-config-Zinoviev b/meta/fi=
les/common-licenses/xkeyboard-config-Zinoviev
new file mode 100644
index 00000000000..509fc255e27
--- /dev/null
+++ b/meta/files/common-licenses/xkeyboard-config-Zinoviev
@@ -0,0 +1,15 @@
+Copyright (C) 1999, 2000 by Anton Zinoviev <anton@lml.bas.bg>
+
+This software may be used, modified, copied, distributed, and sold,
+in both source and binary form provided that the above copyright
+and these terms are retained. Under no circumstances is the author
+responsible for the proper functioning of this software, nor does
+the author assume any responsibility for damages incurred with its
+use.
+
+Permission is granted to anyone to use, distribute and modify
+this file in any way, provided that the above copyright notice
+is left intact and the author of the modification summarizes
+the changes in this header.
+
+This file is distributed without any expressed or implied warranty.
diff --git a/meta/files/common-licenses/xlock b/meta/files/common-licenses/=
xlock
new file mode 100644
index 00000000000..39ccda0b4d4
--- /dev/null
+++ b/meta/files/common-licenses/xlock
@@ -0,0 +1,14 @@
+Copyright (c) 1990 by Sun Microsystems, Inc.=20
+Author: Patrick J. Naughton naughton@wind.sun.com=20
+
+Permission to use, copy, modify, and distribute this software and its=20
+documentation for any purpose and without fee is hereby granted,=20
+provided that the above copyright notice appear in all copies and=20
+that both that copyright notice and this permission notice appear in=20
+supporting documentation.=20
+
+This file is provided AS IS with no warranties of any kind. The author=20
+shall have no liability with respect to the infringement of copyrights,=20
+trade secrets or any patents by this file or any part thereof. In no event=
=20
+will the author be liable for any lost revenue or profits or other special=
,=20
+indirect and consequential damages.
diff --git a/meta/files/common-licenses/xzoom b/meta/files/common-licenses/=
xzoom
new file mode 100644
index 00000000000..f312dedbc2c
--- /dev/null
+++ b/meta/files/common-licenses/xzoom
@@ -0,0 +1,12 @@
+Copyright Itai Nahshon 1995, 1996.
+This program is distributed with no warranty.
+
+Source files for this program may be distributed freely.
+Modifications to this file are okay as long as:
+ a. This copyright notice and comment are preserved and
+    left at the top of the file.
+ b. The man page is fixed to reflect the change.
+ c. The author of this change adds his name and change
+    description to the list of changes below.
+Executable files may be distributed with sources, or with
+exact location where the source code can be obtained.
diff --git a/meta/files/spdx-licenses.json b/meta/files/spdx-licenses.json
index ef926164ec0..1af30611213 100644
--- a/meta/files/spdx-licenses.json
+++ b/meta/files/spdx-licenses.json
@@ -1,5937 +1,8275 @@
 {
-  "licenseListVersion": "3.14",
+  "licenseListVersion": "3.24.0",
   "licenses": [
     {
-      "reference": "https://spdx.org/licenses/GPL-1.0.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GPL-1.0.json",
-      "referenceNumber": 0,
-      "name": "GNU General Public License v1.0 only",
-      "licenseId": "GPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/0BSD.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": true,
+      "licenseId": "0BSD",
+      "name": "BSD Zero Clause License",
+      "reference": "https://spdx.org/licenses/0BSD.html",
+      "referenceNumber": 537,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.html"
-      ],
-      "isOsiApproved": false
+        "http://landley.net/toybox/license.html",
+        "https://opensource.org/licenses/0BSD"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/bzip2-1.0.6.html",
+      "detailsUrl": "https://spdx.org/licenses/3D-Slicer-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/bzip2-1.0.6.json",
-      "referenceNumber": 1,
-      "name": "bzip2 and libbzip2 License v1.0.6",
-      "licenseId": "bzip2-1.0.6",
+      "isOsiApproved": false,
+      "licenseId": "3D-Slicer-1.0",
+      "name": "3D Slicer License v1.0",
+      "reference": "https://spdx.org/licenses/3D-Slicer-1.0.html",
+      "referenceNumber": 200,
       "seeAlso": [
-        "https://sourceware.org/git/?p\u003dbzip2.git;a\u003dblob;f\u003dL=
ICENSE;hb\u003dbzip2-1.0.6",
-        "http://bzip.org/1.0.5/bzip2-manual-1.0.5.html"
-      ],
-      "isOsiApproved": false
+        "https://slicer.org/LICENSE",
+        "https://github.com/Slicer/Slicer/blob/main/License.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Intel-ACPI.html",
+      "detailsUrl": "https://spdx.org/licenses/AAL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Intel-ACPI.json",
-      "referenceNumber": 2,
-      "name": "Intel ACPI Software License Agreement",
-      "licenseId": "Intel-ACPI",
+      "isOsiApproved": true,
+      "licenseId": "AAL",
+      "name": "Attribution Assurance License",
+      "reference": "https://spdx.org/licenses/AAL.html",
+      "referenceNumber": 406,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Intel_ACPI_Software_Lice=
nse_Agreement"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/attribution"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/XSkat.html",
+      "detailsUrl": "https://spdx.org/licenses/Abstyles.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/XSkat.json",
-      "referenceNumber": 3,
-      "name": "XSkat License",
-      "licenseId": "XSkat",
+      "isOsiApproved": false,
+      "licenseId": "Abstyles",
+      "name": "Abstyles License",
+      "reference": "https://spdx.org/licenses/Abstyles.html",
+      "referenceNumber": 526,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/XSkat_License"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/Abstyles"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/AdaCore-doc.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0.json",
-      "referenceNumber": 4,
-      "name": "Creative Commons Attribution Non Commercial Share Alike 2.0=
 Generic",
-      "licenseId": "CC-BY-NC-SA-2.0",
+      "isOsiApproved": false,
+      "licenseId": "AdaCore-doc",
+      "name": "AdaCore Doc License",
+      "reference": "https://spdx.org/licenses/AdaCore-doc.html",
+      "referenceNumber": 382,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc-sa/2.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://github.com/AdaCore/xmlada/blob/master/docs/index.rst",
+        "https://github.com/AdaCore/gnatcoll-core/blob/master/docs/index.r=
st",
+        "https://github.com/AdaCore/gnatcoll-db/blob/master/docs/index.rst"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Plexus.html",
+      "detailsUrl": "https://spdx.org/licenses/Adobe-2006.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Plexus.json",
-      "referenceNumber": 5,
-      "name": "Plexus Classworlds License",
-      "licenseId": "Plexus",
+      "isOsiApproved": false,
+      "licenseId": "Adobe-2006",
+      "name": "Adobe Systems Incorporated Source Code License Agreement",
+      "reference": "https://spdx.org/licenses/Adobe-2006.html",
+      "referenceNumber": 558,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Plexus_Classworlds_Licen=
se"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/AdobeLicense"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Giftware.html",
+      "detailsUrl": "https://spdx.org/licenses/Adobe-Display-PostScript.js=
on",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Giftware.json",
-      "referenceNumber": 6,
-      "name": "Giftware License",
-      "licenseId": "Giftware",
+      "isOsiApproved": false,
+      "licenseId": "Adobe-Display-PostScript",
+      "name": "Adobe Display PostScript License",
+      "reference": "https://spdx.org/licenses/Adobe-Display-PostScript.htm=
l",
+      "referenceNumber": 431,
       "seeAlso": [
-        "http://liballeg.org/license.html#allegro-4-the-giftware-license"
-      ],
-      "isOsiApproved": false
+        "https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/COPYING=
?ref_type=3Dheads#L752"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BitTorrent-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/Adobe-Glyph.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BitTorrent-1.0.json",
-      "referenceNumber": 7,
-      "name": "BitTorrent Open Source License v1.0",
-      "licenseId": "BitTorrent-1.0",
+      "isOsiApproved": false,
+      "licenseId": "Adobe-Glyph",
+      "name": "Adobe Glyph List License",
+      "reference": "https://spdx.org/licenses/Adobe-Glyph.html",
+      "referenceNumber": 297,
       "seeAlso": [
-        "http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/licenses/=
BitTorrent?r1\u003d1.1\u0026r2\u003d1.1.1.1\u0026diff_format\u003ds"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/MIT#AdobeGlyph"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/APSL-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/Adobe-Utopia.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/APSL-1.1.json",
-      "referenceNumber": 8,
-      "name": "Apple Public Source License 1.1",
-      "licenseId": "APSL-1.1",
+      "isOsiApproved": false,
+      "licenseId": "Adobe-Utopia",
+      "name": "Adobe Utopia Font License",
+      "reference": "https://spdx.org/licenses/Adobe-Utopia.html",
+      "referenceNumber": 532,
       "seeAlso": [
-        "http://www.opensource.apple.com/source/IOSerialFamily/IOSerialFam=
ily-7/APPLE_LICENSE"
-      ],
-      "isOsiApproved": true
+        "https://gitlab.freedesktop.org/xorg/font/adobe-utopia-100dpi/-/bl=
ob/master/COPYING?ref_type=3Dheads"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GPL-2.0-with-GCC-exception.h=
tml",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-GCC-exception.=
json",
-      "referenceNumber": 9,
-      "name": "GNU General Public License v2.0 w/GCC Runtime Library excep=
tion",
-      "licenseId": "GPL-2.0-with-GCC-exception",
+      "detailsUrl": "https://spdx.org/licenses/ADSL.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "ADSL",
+      "name": "Amazon Digital Services License",
+      "reference": "https://spdx.org/licenses/ADSL.html",
+      "referenceNumber": 463,
       "seeAlso": [
-        "https://gcc.gnu.org/git/?p\u003dgcc.git;a\u003dblob;f\u003dgcc/li=
bgcc1.c;h\u003d762f5143fc6eed57b6797c82710f3538aa52b40b;hb\u003dcb143a3ce4f=
b417c68f5fa2691a1b1b1053dfba9#l10"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/AmazonDigitalServicesLic=
ense"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/UPL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/AFL-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/UPL-1.0.json",
-      "referenceNumber": 10,
-      "name": "Universal Permissive License v1.0",
-      "licenseId": "UPL-1.0",
-      "seeAlso": [
-        "https://opensource.org/licenses/UPL"
-      ],
+      "isFsfLibre": true,
       "isOsiApproved": true,
-      "isFsfLibre": true
-    },
-    {
-      "reference": "https://spdx.org/licenses/wxWindows.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/wxWindows.json",
-      "referenceNumber": 11,
-      "name": "wxWindows Library License",
-      "licenseId": "wxWindows",
+      "licenseId": "AFL-1.1",
+      "name": "Academic Free License v1.1",
+      "reference": "https://spdx.org/licenses/AFL-1.1.html",
+      "referenceNumber": 601,
       "seeAlso": [
-        "https://opensource.org/licenses/WXwindows"
-      ],
-      "isOsiApproved": false
+        "http://opensource.linux-mirror.org/licenses/afl-1.1.txt",
+        "http://wayback.archive.org/web/20021004124254/http://www.opensour=
ce.org/licenses/academic.php"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Caldera.html",
+      "detailsUrl": "https://spdx.org/licenses/AFL-1.2.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Caldera.json",
-      "referenceNumber": 12,
-      "name": "Caldera License",
-      "licenseId": "Caldera",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "AFL-1.2",
+      "name": "Academic Free License v1.2",
+      "reference": "https://spdx.org/licenses/AFL-1.2.html",
+      "referenceNumber": 72,
       "seeAlso": [
-        "http://www.lemis.com/grog/UNIX/ancient-source-all.pdf"
-      ],
-      "isOsiApproved": false
+        "http://opensource.linux-mirror.org/licenses/afl-1.2.txt",
+        "http://wayback.archive.org/web/20021204204652/http://www.opensour=
ce.org/licenses/academic.php"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Zend-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/AFL-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Zend-2.0.json",
-      "referenceNumber": 13,
-      "name": "Zend License v2.0",
-      "licenseId": "Zend-2.0",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "AFL-2.0",
+      "name": "Academic Free License v2.0",
+      "reference": "https://spdx.org/licenses/AFL-2.0.html",
+      "referenceNumber": 187,
       "seeAlso": [
-        "https://web.archive.org/web/20130517195954/http://www.zend.com/li=
cense/2_00.txt"
-      ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+        "http://wayback.archive.org/web/20060924134533/http://www.opensour=
ce.org/licenses/afl-2.0.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CUA-OPL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/AFL-2.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CUA-OPL-1.0.json",
-      "referenceNumber": 14,
-      "name": "CUA Office Public License v1.0",
-      "licenseId": "CUA-OPL-1.0",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "AFL-2.1",
+      "name": "Academic Free License v2.1",
+      "reference": "https://spdx.org/licenses/AFL-2.1.html",
+      "referenceNumber": 383,
       "seeAlso": [
-        "https://opensource.org/licenses/CUA-OPL-1.0"
-      ],
-      "isOsiApproved": true
+        "http://opensource.linux-mirror.org/licenses/afl-2.1.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/JPNIC.html",
+      "detailsUrl": "https://spdx.org/licenses/AFL-3.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/JPNIC.json",
-      "referenceNumber": 15,
-      "name": "Japan Network Information Center License",
-      "licenseId": "JPNIC",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "AFL-3.0",
+      "name": "Academic Free License v3.0",
+      "reference": "https://spdx.org/licenses/AFL-3.0.html",
+      "referenceNumber": 369,
       "seeAlso": [
-        "https://gitlab.isc.org/isc-projects/bind9/blob/master/COPYRIGHT#L=
366"
-      ],
-      "isOsiApproved": false
+        "http://www.rosenlaw.com/AFL3.0.htm",
+        "https://opensource.org/licenses/afl-3.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SAX-PD.html",
+      "detailsUrl": "https://spdx.org/licenses/Afmparse.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SAX-PD.json",
-      "referenceNumber": 16,
-      "name": "Sax Public Domain Notice",
-      "licenseId": "SAX-PD",
+      "isOsiApproved": false,
+      "licenseId": "Afmparse",
+      "name": "Afmparse License",
+      "reference": "https://spdx.org/licenses/Afmparse.html",
+      "referenceNumber": 345,
       "seeAlso": [
-        "http://www.saxproject.org/copying.html"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/Afmparse"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-ND-2.5.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-2.5.json",
-      "referenceNumber": 17,
-      "name": "Creative Commons Attribution No Derivatives 2.5 Generic",
-      "licenseId": "CC-BY-ND-2.5",
+      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0.json",
+      "isDeprecatedLicenseId": true,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "AGPL-1.0",
+      "name": "Affero General Public License v1.0",
+      "reference": "https://spdx.org/licenses/AGPL-1.0.html",
+      "referenceNumber": 221,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nd/2.5/legalcode"
-      ],
-      "isOsiApproved": false
+        "http://www.affero.org/oagpl.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/eGenix.html",
+      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0-only.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/eGenix.json",
-      "referenceNumber": 18,
-      "name": "eGenix.com Public License 1.1.0",
-      "licenseId": "eGenix",
+      "isOsiApproved": false,
+      "licenseId": "AGPL-1.0-only",
+      "name": "Affero General Public License v1.0 only",
+      "reference": "https://spdx.org/licenses/AGPL-1.0-only.html",
+      "referenceNumber": 334,
       "seeAlso": [
-        "http://www.egenix.com/products/eGenix.com-Public-License-1.1.0.pd=
f",
-        "https://fedoraproject.org/wiki/Licensing/eGenix.com_Public_Licens=
e_1.1.0"
-      ],
-      "isOsiApproved": false
+        "http://www.affero.org/oagpl.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LGPLLR.html",
+      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0-or-later.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LGPLLR.json",
-      "referenceNumber": 19,
-      "name": "Lesser General Public License For Linguistic Resources",
-      "licenseId": "LGPLLR",
+      "isOsiApproved": false,
+      "licenseId": "AGPL-1.0-or-later",
+      "name": "Affero General Public License v1.0 or later",
+      "reference": "https://spdx.org/licenses/AGPL-1.0-or-later.html",
+      "referenceNumber": 527,
       "seeAlso": [
-        "http://www-igm.univ-mlv.fr/~unitex/lgpllr.html"
-      ],
-      "isOsiApproved": false
+        "http://www.affero.org/oagpl.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-2.2.2.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.2.2.json",
-      "referenceNumber": 20,
-      "name": "Open LDAP Public License 2.2.2",
-      "licenseId": "OLDAP-2.2.2",
+      "detailsUrl": "https://spdx.org/licenses/AGPL-3.0.json",
+      "isDeprecatedLicenseId": true,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "AGPL-3.0",
+      "name": "GNU Affero General Public License v3.0",
+      "reference": "https://spdx.org/licenses/AGPL-3.0.html",
+      "referenceNumber": 394,
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u0=
03dblob;f\u003dLICENSE;hb\u003ddf2cc1e21eb7c160695f5b7cffd6296c151ba188"
-      ],
-      "isOsiApproved": false
+        "https://www.gnu.org/licenses/agpl.txt",
+        "https://opensource.org/licenses/AGPL-3.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-ND-3.0-DE.html",
+      "detailsUrl": "https://spdx.org/licenses/AGPL-3.0-only.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-3.0-DE.json",
-      "referenceNumber": 21,
-      "name": "Creative Commons Attribution No Derivatives 3.0 Germany",
-      "licenseId": "CC-BY-ND-3.0-DE",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "AGPL-3.0-only",
+      "name": "GNU Affero General Public License v3.0 only",
+      "reference": "https://spdx.org/licenses/AGPL-3.0-only.html",
+      "referenceNumber": 123,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nd/3.0/de/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://www.gnu.org/licenses/agpl.txt",
+        "https://opensource.org/licenses/AGPL-3.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/IPA.html",
+      "detailsUrl": "https://spdx.org/licenses/AGPL-3.0-or-later.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/IPA.json",
-      "referenceNumber": 22,
-      "name": "IPA Font License",
-      "licenseId": "IPA",
-      "seeAlso": [
-        "https://opensource.org/licenses/IPA"
-      ],
+      "isFsfLibre": true,
       "isOsiApproved": true,
-      "isFsfLibre": true
-    },
-    {
-      "reference": "https://spdx.org/licenses/NCSA.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NCSA.json",
-      "referenceNumber": 23,
-      "name": "University of Illinois/NCSA Open Source License",
-      "licenseId": "NCSA",
+      "licenseId": "AGPL-3.0-or-later",
+      "name": "GNU Affero General Public License v3.0 or later",
+      "reference": "https://spdx.org/licenses/AGPL-3.0-or-later.html",
+      "referenceNumber": 105,
       "seeAlso": [
-        "http://otm.illinois.edu/uiuc_openSource",
-        "https://opensource.org/licenses/NCSA"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://www.gnu.org/licenses/agpl.txt",
+        "https://opensource.org/licenses/AGPL-3.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/W3C.html",
+      "detailsUrl": "https://spdx.org/licenses/Aladdin.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/W3C.json",
-      "referenceNumber": 24,
-      "name": "W3C Software Notice and License (2002-12-31)",
-      "licenseId": "W3C",
+      "isFsfLibre": false,
+      "isOsiApproved": false,
+      "licenseId": "Aladdin",
+      "name": "Aladdin Free Public License",
+      "reference": "https://spdx.org/licenses/Aladdin.html",
+      "referenceNumber": 168,
       "seeAlso": [
-        "http://www.w3.org/Consortium/Legal/2002/copyright-software-200212=
31.html",
-        "https://opensource.org/licenses/W3C"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "http://pages.cs.wisc.edu/~ghost/doc/AFPL/6.01/Public.htm"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Adobe-2006.html",
+      "detailsUrl": "https://spdx.org/licenses/AMD-newlib.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Adobe-2006.json",
-      "referenceNumber": 25,
-      "name": "Adobe Systems Incorporated Source Code License Agreement",
-      "licenseId": "Adobe-2006",
+      "isOsiApproved": false,
+      "licenseId": "AMD-newlib",
+      "name": "AMD newlib License",
+      "reference": "https://spdx.org/licenses/AMD-newlib.html",
+      "referenceNumber": 222,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/AdobeLicense"
-      ],
-      "isOsiApproved": false
+        "https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3Dne=
wlib/libc/sys/a29khif/_close.S;h=3D04f52ae00de1dafbd9055ad8d73c5c697a3aae7f=
;hb=3DHEAD"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Net-SNMP.html",
+      "detailsUrl": "https://spdx.org/licenses/AMDPLPA.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Net-SNMP.json",
-      "referenceNumber": 26,
-      "name": "Net-SNMP License",
-      "licenseId": "Net-SNMP",
+      "isOsiApproved": false,
+      "licenseId": "AMDPLPA",
+      "name": "AMD's plpa_map.c License",
+      "reference": "https://spdx.org/licenses/AMDPLPA.html",
+      "referenceNumber": 149,
       "seeAlso": [
-        "http://net-snmp.sourceforge.net/about/license.html"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/AMD_plpa_map_License"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-SA-4.0.html",
+      "detailsUrl": "https://spdx.org/licenses/AML.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-4.0.json",
-      "referenceNumber": 27,
-      "name": "Creative Commons Attribution Share Alike 4.0 International",
-      "licenseId": "CC-BY-SA-4.0",
-      "seeAlso": [
-        "https://creativecommons.org/licenses/by-sa/4.0/legalcode"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "AML",
+      "name": "Apple MIT License",
+      "reference": "https://spdx.org/licenses/AML.html",
+      "referenceNumber": 13,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Apple_MIT_License"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/YPL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/AML-glslang.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/YPL-1.0.json",
-      "referenceNumber": 28,
-      "name": "Yahoo! Public License v1.0",
-      "licenseId": "YPL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "AML-glslang",
+      "name": "AML glslang variant License",
+      "reference": "https://spdx.org/licenses/AML-glslang.html",
+      "referenceNumber": 1,
       "seeAlso": [
-        "http://www.zimbra.com/license/yahoo_public_license_1.0.html"
-      ],
-      "isOsiApproved": false
+        "https://github.com/KhronosGroup/glslang/blob/main/LICENSE.txt#L94=
9",
+        "https://docs.omniverse.nvidia.com/install-guide/latest/common/lic=
enses.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Nunit.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/Nunit.json",
-      "referenceNumber": 29,
-      "name": "Nunit License",
-      "licenseId": "Nunit",
+      "detailsUrl": "https://spdx.org/licenses/AMPAS.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "AMPAS",
+      "name": "Academy of Motion Picture Arts and Sciences BSD",
+      "reference": "https://spdx.org/licenses/AMPAS.html",
+      "referenceNumber": 420,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Nunit"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/BSD#AMPASBSD"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MITNFA.html",
+      "detailsUrl": "https://spdx.org/licenses/ANTLR-PD.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MITNFA.json",
-      "referenceNumber": 30,
-      "name": "MIT +no-false-attribs license",
-      "licenseId": "MITNFA",
+      "isOsiApproved": false,
+      "licenseId": "ANTLR-PD",
+      "name": "ANTLR Software Rights Notice",
+      "reference": "https://spdx.org/licenses/ANTLR-PD.html",
+      "referenceNumber": 576,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/MITNFA"
-      ],
-      "isOsiApproved": false
+        "http://www.antlr2.org/license.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/PHP-3.01.html",
+      "detailsUrl": "https://spdx.org/licenses/ANTLR-PD-fallback.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/PHP-3.01.json",
-      "referenceNumber": 31,
-      "name": "PHP License v3.01",
-      "licenseId": "PHP-3.01",
+      "isOsiApproved": false,
+      "licenseId": "ANTLR-PD-fallback",
+      "name": "ANTLR Software Rights Notice with license fallback",
+      "reference": "https://spdx.org/licenses/ANTLR-PD-fallback.html",
+      "referenceNumber": 194,
       "seeAlso": [
-        "http://www.php.net/license/3_01.txt"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "http://www.antlr2.org/license.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-Source-Code.html",
+      "detailsUrl": "https://spdx.org/licenses/any-OSI.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-Source-Code.json",
-      "referenceNumber": 32,
-      "name": "BSD Source Code Attribution",
-      "licenseId": "BSD-Source-Code",
+      "isOsiApproved": false,
+      "licenseId": "any-OSI",
+      "name": "Any OSI License",
+      "reference": "https://spdx.org/licenses/any-OSI.html",
+      "referenceNumber": 121,
       "seeAlso": [
-        "https://github.com/robbiehanson/CocoaHTTPServer/blob/master/LICEN=
SE.txt"
-      ],
-      "isOsiApproved": false
+        "https://metacpan.org/pod/Exporter::Tidy#LICENSE"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-SA-2.5.html",
+      "detailsUrl": "https://spdx.org/licenses/Apache-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.5.json",
-      "referenceNumber": 33,
-      "name": "Creative Commons Attribution Share Alike 2.5 Generic",
-      "licenseId": "CC-BY-SA-2.5",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "Apache-1.0",
+      "name": "Apache License 1.0",
+      "reference": "https://spdx.org/licenses/Apache-1.0.html",
+      "referenceNumber": 616,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-sa/2.5/legalcode"
-      ],
-      "isOsiApproved": false
+        "http://www.apache.org/licenses/LICENSE-1.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Motosoto.html",
+      "detailsUrl": "https://spdx.org/licenses/Apache-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Motosoto.json",
-      "referenceNumber": 34,
-      "name": "Motosoto License",
-      "licenseId": "Motosoto",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "Apache-1.1",
+      "name": "Apache License 1.1",
+      "reference": "https://spdx.org/licenses/Apache-1.1.html",
+      "referenceNumber": 313,
       "seeAlso": [
-        "https://opensource.org/licenses/Motosoto"
-      ],
-      "isOsiApproved": true
+        "http://apache.org/licenses/LICENSE-1.1",
+        "https://opensource.org/licenses/Apache-1.1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OSL-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/Apache-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OSL-1.1.json",
-      "referenceNumber": 35,
-      "name": "Open Software License 1.1",
-      "licenseId": "OSL-1.1",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "Apache-2.0",
+      "name": "Apache License 2.0",
+      "reference": "https://spdx.org/licenses/Apache-2.0.html",
+      "referenceNumber": 564,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/OSL1.1"
-      ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+        "https://www.apache.org/licenses/LICENSE-2.0",
+        "https://opensource.org/licenses/Apache-2.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/NGPL.html",
+      "detailsUrl": "https://spdx.org/licenses/APAFML.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NGPL.json",
-      "referenceNumber": 36,
-      "name": "Nethack General Public License",
-      "licenseId": "NGPL",
+      "isOsiApproved": false,
+      "licenseId": "APAFML",
+      "name": "Adobe Postscript AFM License",
+      "reference": "https://spdx.org/licenses/APAFML.html",
+      "referenceNumber": 136,
       "seeAlso": [
-        "https://opensource.org/licenses/NGPL"
-      ],
-      "isOsiApproved": true
+        "https://fedoraproject.org/wiki/Licensing/AdobePostscriptAFM"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-2.5-AU.html",
+      "detailsUrl": "https://spdx.org/licenses/APL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.5-AU.json",
-      "referenceNumber": 37,
-      "name": "Creative Commons Attribution 2.5 Australia",
-      "licenseId": "CC-BY-2.5-AU",
+      "isOsiApproved": true,
+      "licenseId": "APL-1.0",
+      "name": "Adaptive Public License 1.0",
+      "reference": "https://spdx.org/licenses/APL-1.0.html",
+      "referenceNumber": 515,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by/2.5/au/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/APL-1.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Unicode-TOU.html",
+      "detailsUrl": "https://spdx.org/licenses/App-s2p.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Unicode-TOU.json",
-      "referenceNumber": 38,
-      "name": "Unicode Terms of Use",
-      "licenseId": "Unicode-TOU",
+      "isOsiApproved": false,
+      "licenseId": "App-s2p",
+      "name": "App::s2p License",
+      "reference": "https://spdx.org/licenses/App-s2p.html",
+      "referenceNumber": 470,
       "seeAlso": [
-        "http://www.unicode.org/copyright.html"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/App-s2p"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Lice=
nse.html",
+      "detailsUrl": "https://spdx.org/licenses/APSL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Lic=
ense.json",
+      "isFsfLibre": false,
+      "isOsiApproved": true,
+      "licenseId": "APSL-1.0",
+      "name": "Apple Public Source License 1.0",
+      "reference": "https://spdx.org/licenses/APSL-1.0.html",
       "referenceNumber": 39,
-      "name": "BSD 3-Clause No Nuclear License",
-      "licenseId": "BSD-3-Clause-No-Nuclear-License",
       "seeAlso": [
-        "http://download.oracle.com/otn-pub/java/licenses/bsd.txt?AuthPara=
m\u003d1467140197_43d516ce1776bd08a58235a7785be1cc"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/Apple_Public_Source_Lice=
nse_1.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OPUBL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/APSL-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OPUBL-1.0.json",
-      "referenceNumber": 40,
-      "name": "Open Publication License v1.0",
-      "licenseId": "OPUBL-1.0",
+      "isOsiApproved": true,
+      "licenseId": "APSL-1.1",
+      "name": "Apple Public Source License 1.1",
+      "reference": "https://spdx.org/licenses/APSL-1.1.html",
+      "referenceNumber": 582,
       "seeAlso": [
-        "http://opencontent.org/openpub/",
-        "https://www.debian.org/opl",
-        "https://www.ctan.org/license/opl"
-      ],
-      "isOsiApproved": false
+        "http://www.opensource.apple.com/source/IOSerialFamily/IOSerialFam=
ily-7/APPLE_LICENSE"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-UK.html",
+      "detailsUrl": "https://spdx.org/licenses/APSL-1.2.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-UK.json",
-      "referenceNumber": 41,
-      "name": "Creative Commons Attribution Non Commercial Share Alike 2.0=
 England and Wales",
-      "licenseId": "CC-BY-NC-SA-2.0-UK",
+      "isOsiApproved": true,
+      "licenseId": "APSL-1.2",
+      "name": "Apple Public Source License 1.2",
+      "reference": "https://spdx.org/licenses/APSL-1.2.html",
+      "referenceNumber": 628,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc-sa/2.0/uk/legalcode"
-      ],
-      "isOsiApproved": false
+        "http://www.samurajdata.se/opensource/mirror/licenses/apsl.php"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/NLOD-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/APSL-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NLOD-2.0.json",
-      "referenceNumber": 42,
-      "name": "Norwegian Licence for Open Government Data (NLOD) 2.0",
-      "licenseId": "NLOD-2.0",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "APSL-2.0",
+      "name": "Apple Public Source License 2.0",
+      "reference": "https://spdx.org/licenses/APSL-2.0.html",
+      "referenceNumber": 144,
       "seeAlso": [
-        "http://data.norge.no/nlod/en/2.0"
-      ],
-      "isOsiApproved": false
+        "http://www.opensource.apple.com/license/apsl/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/gnuplot.html",
+      "detailsUrl": "https://spdx.org/licenses/Arphic-1999.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/gnuplot.json",
-      "referenceNumber": 43,
-      "name": "gnuplot License",
-      "licenseId": "gnuplot",
-      "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Gnuplot"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "Arphic-1999",
+      "name": "Arphic Public License",
+      "reference": "https://spdx.org/licenses/Arphic-1999.html",
+      "referenceNumber": 131,
+      "seeAlso": [
+        "http://ftp.gnu.org/gnu/non-gnu/chinese-fonts-truetype/LICENSE"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/EPICS.html",
+      "detailsUrl": "https://spdx.org/licenses/Artistic-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/EPICS.json",
-      "referenceNumber": 44,
-      "name": "EPICS Open License",
-      "licenseId": "EPICS",
+      "isFsfLibre": false,
+      "isOsiApproved": true,
+      "licenseId": "Artistic-1.0",
+      "name": "Artistic License 1.0",
+      "reference": "https://spdx.org/licenses/Artistic-1.0.html",
+      "referenceNumber": 388,
       "seeAlso": [
-        "https://epics.anl.gov/license/open.php"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/Artistic-1.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Info-ZIP.html",
+      "detailsUrl": "https://spdx.org/licenses/Artistic-1.0-cl8.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Info-ZIP.json",
-      "referenceNumber": 45,
-      "name": "Info-ZIP License",
-      "licenseId": "Info-ZIP",
+      "isOsiApproved": true,
+      "licenseId": "Artistic-1.0-cl8",
+      "name": "Artistic License 1.0 w/clause 8",
+      "reference": "https://spdx.org/licenses/Artistic-1.0-cl8.html",
+      "referenceNumber": 321,
       "seeAlso": [
-        "http://www.info-zip.org/license.html"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/Artistic-1.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/Artistic-1.0-Perl.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.0.json",
-      "referenceNumber": 46,
-      "name": "Open LDAP Public License v2.0 (or possibly 2.0A and 2.0B)",
-      "licenseId": "OLDAP-2.0",
+      "isOsiApproved": true,
+      "licenseId": "Artistic-1.0-Perl",
+      "name": "Artistic License 1.0 (Perl)",
+      "reference": "https://spdx.org/licenses/Artistic-1.0-Perl.html",
+      "referenceNumber": 652,
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u0=
03dblob;f\u003dLICENSE;hb\u003dcbf50f4e1185a21abd4c0a54d3f4341fe28f36ea"
-      ],
-      "isOsiApproved": false
+        "http://dev.perl.org/licenses/artistic.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CERN-OHL-P-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/Artistic-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-P-2.0.json",
-      "referenceNumber": 47,
-      "name": "CERN Open Hardware Licence Version 2 - Permissive",
-      "licenseId": "CERN-OHL-P-2.0",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "Artistic-2.0",
+      "name": "Artistic License 2.0",
+      "reference": "https://spdx.org/licenses/Artistic-2.0.html",
+      "referenceNumber": 355,
       "seeAlso": [
-        "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-ver=
sion-2"
-      ],
-      "isOsiApproved": true
+        "http://www.perlfoundation.org/artistic_license_2_0",
+        "https://www.perlfoundation.org/artistic-license-20.html",
+        "https://opensource.org/licenses/artistic-license-2.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Warr=
anty.html",
+      "detailsUrl": "https://spdx.org/licenses/ASWF-Digital-Assets-1.0.jso=
n",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-War=
ranty.json",
-      "referenceNumber": 48,
-      "name": "BSD 3-Clause No Nuclear Warranty",
-      "licenseId": "BSD-3-Clause-No-Nuclear-Warranty",
+      "isOsiApproved": false,
+      "licenseId": "ASWF-Digital-Assets-1.0",
+      "name": "ASWF Digital Assets License version 1.0",
+      "reference": "https://spdx.org/licenses/ASWF-Digital-Assets-1.0.html=
",
+      "referenceNumber": 330,
       "seeAlso": [
-        "https://jogamp.org/git/?p\u003dgluegen.git;a\u003dblob_plain;f\u0=
03dLICENSE.txt"
-      ],
-      "isOsiApproved": false
+        "https://github.com/AcademySoftwareFoundation/foundation/blob/main=
/digital_assets/aswf_digital_assets_license_v1.0.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/AML.html",
+      "detailsUrl": "https://spdx.org/licenses/ASWF-Digital-Assets-1.1.jso=
n",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/AML.json",
-      "referenceNumber": 49,
-      "name": "Apple MIT License",
-      "licenseId": "AML",
+      "isOsiApproved": false,
+      "licenseId": "ASWF-Digital-Assets-1.1",
+      "name": "ASWF Digital Assets License 1.1",
+      "reference": "https://spdx.org/licenses/ASWF-Digital-Assets-1.1.html=
",
+      "referenceNumber": 447,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Apple_MIT_License"
-      ],
-      "isOsiApproved": false
+        "https://github.com/AcademySoftwareFoundation/foundation/blob/main=
/digital_assets/aswf_digital_assets_license_v1.1.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MulanPSL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/Baekmuk.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MulanPSL-1.0.json",
-      "referenceNumber": 50,
-      "name": "Mulan Permissive Software License, Version 1",
-      "licenseId": "MulanPSL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "Baekmuk",
+      "name": "Baekmuk License",
+      "reference": "https://spdx.org/licenses/Baekmuk.html",
+      "referenceNumber": 436,
       "seeAlso": [
-        "https://license.coscl.org.cn/MulanPSL/",
-        "https://github.com/yuwenlong/longphp/blob/25dfb70cc2a466dc4bb55ba=
30901cbce08d164b5/LICENSE"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing:Baekmuk?rd=3DLicensing/B=
aekmuk"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Multics.html",
+      "detailsUrl": "https://spdx.org/licenses/Bahyph.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Multics.json",
-      "referenceNumber": 51,
-      "name": "Multics License",
-      "licenseId": "Multics",
+      "isOsiApproved": false,
+      "licenseId": "Bahyph",
+      "name": "Bahyph License",
+      "reference": "https://spdx.org/licenses/Bahyph.html",
+      "referenceNumber": 494,
       "seeAlso": [
-        "https://opensource.org/licenses/Multics"
-      ],
-      "isOsiApproved": true
+        "https://fedoraproject.org/wiki/Licensing/Bahyph"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/VSL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/Barr.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/VSL-1.0.json",
-      "referenceNumber": 52,
-      "name": "Vovida Software License v1.0",
-      "licenseId": "VSL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "Barr",
+      "name": "Barr License",
+      "reference": "https://spdx.org/licenses/Barr.html",
+      "referenceNumber": 48,
       "seeAlso": [
-        "https://opensource.org/licenses/VSL-1.0"
-      ],
-      "isOsiApproved": true
+        "https://fedoraproject.org/wiki/Licensing/Barr"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/RSA-MD.html",
+      "detailsUrl": "https://spdx.org/licenses/bcrypt-Solar-Designer.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/RSA-MD.json",
-      "referenceNumber": 53,
-      "name": "RSA Message-Digest License",
-      "licenseId": "RSA-MD",
+      "isOsiApproved": false,
+      "licenseId": "bcrypt-Solar-Designer",
+      "name": "bcrypt Solar Designer License",
+      "reference": "https://spdx.org/licenses/bcrypt-Solar-Designer.html",
+      "referenceNumber": 27,
       "seeAlso": [
-        "http://www.faqs.org/rfcs/rfc1321.html"
-      ],
-      "isOsiApproved": false
+        "https://github.com/bcrypt-ruby/bcrypt-ruby/blob/master/ext/mri/cr=
ypt_blowfish.c"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-PDDC.html",
+      "detailsUrl": "https://spdx.org/licenses/Beerware.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-PDDC.json",
-      "referenceNumber": 54,
-      "name": "Creative Commons Public Domain Dedication and Certification=
",
-      "licenseId": "CC-PDDC",
+      "isOsiApproved": false,
+      "licenseId": "Beerware",
+      "name": "Beerware License",
+      "reference": "https://spdx.org/licenses/Beerware.html",
+      "referenceNumber": 143,
       "seeAlso": [
-        "https://creativecommons.org/licenses/publicdomain/"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/Beerware",
+        "https://people.freebsd.org/~phk/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-SA-2.1-JP.html",
+      "detailsUrl": "https://spdx.org/licenses/Bitstream-Charter.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.1-JP.json",
-      "referenceNumber": 55,
-      "name": "Creative Commons Attribution Share Alike 2.1 Japan",
-      "licenseId": "CC-BY-SA-2.1-JP",
+      "isOsiApproved": false,
+      "licenseId": "Bitstream-Charter",
+      "name": "Bitstream Charter Font License",
+      "reference": "https://spdx.org/licenses/Bitstream-Charter.html",
+      "referenceNumber": 560,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-sa/2.1/jp/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/Charter#License_Text",
+        "https://raw.githubusercontent.com/blackhole89/notekit/master/data=
/fonts/Charter%20license.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LPPL-1.2.html",
+      "detailsUrl": "https://spdx.org/licenses/Bitstream-Vera.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LPPL-1.2.json",
-      "referenceNumber": 56,
-      "name": "LaTeX Project Public License v1.2",
-      "licenseId": "LPPL-1.2",
-      "seeAlso": [
-        "http://www.latex-project.org/lppl/lppl-1-2.txt"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "Bitstream-Vera",
+      "name": "Bitstream Vera Font License",
+      "reference": "https://spdx.org/licenses/Bitstream-Vera.html",
+      "referenceNumber": 581,
+      "seeAlso": [
+        "https://web.archive.org/web/20080207013128/http://www.gnome.org/f=
onts/",
+        "https://docubrain.com/sites/default/files/licenses/bitstream-vera=
.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Spencer-94.html",
+      "detailsUrl": "https://spdx.org/licenses/BitTorrent-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Spencer-94.json",
-      "referenceNumber": 57,
-      "name": "Spencer License 94",
-      "licenseId": "Spencer-94",
+      "isOsiApproved": false,
+      "licenseId": "BitTorrent-1.0",
+      "name": "BitTorrent Open Source License v1.0",
+      "reference": "https://spdx.org/licenses/BitTorrent-1.0.html",
+      "referenceNumber": 373,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Henry_Spencer_Reg-Ex_Lib=
rary_License"
-      ],
-      "isOsiApproved": false
+        "http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/licenses/=
BitTorrent?r1=3D1.1&r2=3D1.1.1.1&diff_format=3Ds"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-1.2.html",
+      "detailsUrl": "https://spdx.org/licenses/BitTorrent-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.2.json",
-      "referenceNumber": 58,
-      "name": "Open LDAP Public License v1.2",
-      "licenseId": "OLDAP-1.2",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "BitTorrent-1.1",
+      "name": "BitTorrent Open Source License v1.1",
+      "reference": "https://spdx.org/licenses/BitTorrent-1.1.html",
+      "referenceNumber": 288,
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u0=
03dblob;f\u003dLICENSE;hb\u003d42b0383c50c299977b5893ee695cf4e486fb0dc7"
-      ],
-      "isOsiApproved": false
+        "http://directory.fsf.org/wiki/License:BitTorrentOSL1.1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/O-UDA-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/blessing.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/O-UDA-1.0.json",
-      "referenceNumber": 59,
-      "name": "Open Use of Data Agreement v1.0",
-      "licenseId": "O-UDA-1.0",
+      "isOsiApproved": false,
+      "licenseId": "blessing",
+      "name": "SQLite Blessing",
+      "reference": "https://spdx.org/licenses/blessing.html",
+      "referenceNumber": 469,
       "seeAlso": [
-        "https://github.com/microsoft/Open-Use-of-Data-Agreement/blob/v1.0=
/O-UDA-1.0.md",
-        "https://cdla.dev/open-use-of-data-agreement-v1-0/"
-      ],
-      "isOsiApproved": false
+        "https://www.sqlite.org/src/artifact/e33a4df7e32d742a?ln=3D4-9",
+        "https://sqlite.org/src/artifact/df5091916dbb40e6"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-2.7.html",
+      "detailsUrl": "https://spdx.org/licenses/BlueOak-1.0.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.7.json",
+      "isOsiApproved": true,
+      "licenseId": "BlueOak-1.0.0",
+      "name": "Blue Oak Model License 1.0.0",
+      "reference": "https://spdx.org/licenses/BlueOak-1.0.0.html",
       "referenceNumber": 60,
-      "name": "Open LDAP Public License v2.7",
-      "licenseId": "OLDAP-2.7",
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u0=
03dblob;f\u003dLICENSE;hb\u003d47c2415c1df81556eeb39be6cad458ef87c534a2"
-      ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+        "https://blueoakcouncil.org/license/1.0.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Glulxe.html",
+      "detailsUrl": "https://spdx.org/licenses/Boehm-GC.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Glulxe.json",
-      "referenceNumber": 61,
-      "name": "Glulxe License",
-      "licenseId": "Glulxe",
+      "isOsiApproved": false,
+      "licenseId": "Boehm-GC",
+      "name": "Boehm-Demers-Weiser GC License",
+      "reference": "https://spdx.org/licenses/Boehm-GC.html",
+      "referenceNumber": 322,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Glulxe"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing:MIT#Another_Minimal_vari=
ant_(found_in_libatomic_ops)",
+        "https://github.com/uim/libgcroots/blob/master/COPYING",
+        "https://github.com/ivmai/libatomic_ops/blob/master/LICENSE"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/iMatix.html",
+      "detailsUrl": "https://spdx.org/licenses/Borceux.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/iMatix.json",
-      "referenceNumber": 62,
-      "name": "iMatix Standard Function Library Agreement",
-      "licenseId": "iMatix",
-      "seeAlso": [
-        "http://legacy.imatix.com/html/sfl/sfl4.htm#license"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "Borceux",
+      "name": "Borceux license",
+      "reference": "https://spdx.org/licenses/Borceux.html",
+      "referenceNumber": 552,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Borceux"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/TAPR-OHL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/Brian-Gladman-2-Clause.json=
",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/TAPR-OHL-1.0.json",
-      "referenceNumber": 63,
-      "name": "TAPR Open Hardware License v1.0",
-      "licenseId": "TAPR-OHL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "Brian-Gladman-2-Clause",
+      "name": "Brian Gladman 2-Clause License",
+      "reference": "https://spdx.org/licenses/Brian-Gladman-2-Clause.html",
+      "referenceNumber": 457,
       "seeAlso": [
-        "https://www.tapr.org/OHL"
-      ],
-      "isOsiApproved": false
+        "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L140-L=
156",
+        "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/NBPL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/Brian-Gladman-3-Clause.json=
",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NBPL-1.0.json",
-      "referenceNumber": 64,
-      "name": "Net Boolean Public License v1",
-      "licenseId": "NBPL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "Brian-Gladman-3-Clause",
+      "name": "Brian Gladman 3-Clause License",
+      "reference": "https://spdx.org/licenses/Brian-Gladman-3-Clause.html",
+      "referenceNumber": 409,
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u0=
03dblob;f\u003dLICENSE;hb\u003d37b4b3f6cc4bf34e1d3dec61e69914b9819d8894"
-      ],
-      "isOsiApproved": false
+        "https://github.com/SWI-Prolog/packages-clib/blob/master/sha1/brg_=
endian.h"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LiLiQ-R-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-1-Clause.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LiLiQ-R-1.1.json",
-      "referenceNumber": 65,
-      "name": "Licence Libre du Qu=C3=A9bec =E2=80=93 R=C3=A9ciprocit=C3=
=A9 version 1.1",
-      "licenseId": "LiLiQ-R-1.1",
+      "isOsiApproved": true,
+      "licenseId": "BSD-1-Clause",
+      "name": "BSD 1-Clause License",
+      "reference": "https://spdx.org/licenses/BSD-1-Clause.html",
+      "referenceNumber": 567,
       "seeAlso": [
-        "https://www.forge.gouv.qc.ca/participez/licence-logicielle/licenc=
e-libre-du-quebec-liliq-en-francais/licence-libre-du-quebec-reciprocite-lil=
iq-r-v1-1/",
-        "http://opensource.org/licenses/LiLiQ-R-1.1"
-      ],
-      "isOsiApproved": true
+        "https://svnweb.freebsd.org/base/head/include/ifaddrs.h?revision=
=3D326823"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Noweb.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Noweb.json",
-      "referenceNumber": 66,
-      "name": "Noweb License",
-      "licenseId": "Noweb",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "BSD-2-Clause",
+      "name": "BSD 2-Clause \"Simplified\" License",
+      "reference": "https://spdx.org/licenses/BSD-2-Clause.html",
+      "referenceNumber": 264,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Noweb"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/BSD-2-Clause"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC0-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-Darwin.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC0-1.0.json",
-      "referenceNumber": 67,
-      "name": "Creative Commons Zero v1.0 Universal",
-      "licenseId": "CC0-1.0",
-      "seeAlso": [
-        "https://creativecommons.org/publicdomain/zero/1.0/legalcode"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "BSD-2-Clause-Darwin",
+      "name": "BSD 2-Clause - Ian Darwin variant",
+      "reference": "https://spdx.org/licenses/BSD-2-Clause-Darwin.html",
+      "referenceNumber": 231,
+      "seeAlso": [
+        "https://github.com/file/file/blob/master/COPYING"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-Protection.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-first-lines.js=
on",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-Protection.json",
-      "referenceNumber": 68,
-      "name": "BSD Protection License",
-      "licenseId": "BSD-Protection",
+      "isOsiApproved": false,
+      "licenseId": "BSD-2-Clause-first-lines",
+      "name": "BSD 2-Clause - first lines requirement",
+      "reference": "https://spdx.org/licenses/BSD-2-Clause-first-lines.htm=
l",
+      "referenceNumber": 245,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/BSD_Protection_License"
-      ],
-      "isOsiApproved": false
+        "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L664-L=
690",
+        "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-2.5.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-2.5.json",
-      "referenceNumber": 69,
-      "name": "Creative Commons Attribution Non Commercial 2.5 Generic",
-      "licenseId": "CC-BY-NC-2.5",
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-FreeBSD.json",
+      "isDeprecatedLicenseId": true,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "BSD-2-Clause-FreeBSD",
+      "name": "BSD 2-Clause FreeBSD License",
+      "reference": "https://spdx.org/licenses/BSD-2-Clause-FreeBSD.html",
+      "referenceNumber": 192,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc/2.5/legalcode"
-      ],
-      "isOsiApproved": false
+        "http://www.freebsd.org/copyright/freebsd-license.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Zlib.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Zlib.json",
-      "referenceNumber": 70,
-      "name": "zlib License",
-      "licenseId": "Zlib",
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-NetBSD.json",
+      "isDeprecatedLicenseId": true,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "BSD-2-Clause-NetBSD",
+      "name": "BSD 2-Clause NetBSD License",
+      "reference": "https://spdx.org/licenses/BSD-2-Clause-NetBSD.html",
+      "referenceNumber": 449,
       "seeAlso": [
-        "http://www.zlib.net/zlib_license.html",
-        "https://opensource.org/licenses/Zlib"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "http://www.netbsd.org/about/redistribution.html#default"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.3-invariants-or-later=
.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-Patent.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-invariants-or-late=
r.json",
-      "referenceNumber": 71,
-      "name": "GNU Free Documentation License v1.3 or later - invariants",
-      "licenseId": "GFDL-1.3-invariants-or-later",
+      "isOsiApproved": true,
+      "licenseId": "BSD-2-Clause-Patent",
+      "name": "BSD-2-Clause Plus Patent License",
+      "reference": "https://spdx.org/licenses/BSD-2-Clause-Patent.html",
+      "referenceNumber": 612,
       "seeAlso": [
-        "https://www.gnu.org/licenses/fdl-1.3.txt"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/BSDplusPatent"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-3.0-AT.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-Views.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-AT.json",
-      "referenceNumber": 72,
-      "name": "Creative Commons Attribution 3.0 Austria",
-      "licenseId": "CC-BY-3.0-AT",
+      "isOsiApproved": false,
+      "licenseId": "BSD-2-Clause-Views",
+      "name": "BSD 2-Clause with views sentence",
+      "reference": "https://spdx.org/licenses/BSD-2-Clause-Views.html",
+      "referenceNumber": 657,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by/3.0/at/legalcode"
-      ],
-      "isOsiApproved": false
+        "http://www.freebsd.org/copyright/freebsd-license.html",
+        "https://people.freebsd.org/~ivoras/wine/patch-wine-nvidia.sh",
+        "https://github.com/protegeproject/protege/blob/master/license.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LPPL-1.3c.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LPPL-1.3c.json",
-      "referenceNumber": 73,
-      "name": "LaTeX Project Public License v1.3c",
-      "licenseId": "LPPL-1.3c",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "BSD-3-Clause",
+      "name": "BSD 3-Clause \"New\" or \"Revised\" License",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause.html",
+      "referenceNumber": 216,
       "seeAlso": [
-        "http://www.latex-project.org/lppl/lppl-1-3c.txt",
-        "https://opensource.org/licenses/LPPL-1.3c"
-      ],
-      "isOsiApproved": true
+        "https://opensource.org/licenses/BSD-3-Clause",
+        "https://www.eclipse.org/org/documents/edl-v10.php"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/EPL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-acpica.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/EPL-1.0.json",
-      "referenceNumber": 74,
-      "name": "Eclipse Public License 1.0",
-      "licenseId": "EPL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "BSD-3-Clause-acpica",
+      "name": "BSD 3-Clause acpica variant",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-acpica.html",
+      "referenceNumber": 408,
       "seeAlso": [
-        "http://www.eclipse.org/legal/epl-v10.html",
-        "https://opensource.org/licenses/EPL-1.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://github.com/acpica/acpica/blob/master/source/common/acfile=
io.c#L119"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.1-invariants-or-later=
.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Attribution.js=
on",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-invariants-or-late=
r.json",
-      "referenceNumber": 75,
-      "name": "GNU Free Documentation License v1.1 or later - invariants",
-      "licenseId": "GFDL-1.1-invariants-or-later",
+      "isOsiApproved": false,
+      "licenseId": "BSD-3-Clause-Attribution",
+      "name": "BSD with attribution",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-Attribution.htm=
l",
+      "referenceNumber": 14,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/BSD_with_Attribution"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/ANTLR-PD-fallback.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Clear.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/ANTLR-PD-fallback.json",
-      "referenceNumber": 76,
-      "name": "ANTLR Software Rights Notice with license fallback",
-      "licenseId": "ANTLR-PD-fallback",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "BSD-3-Clause-Clear",
+      "name": "BSD 3-Clause Clear License",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-Clear.html",
+      "referenceNumber": 347,
       "seeAlso": [
-        "http://www.antlr2.org/license.html"
-      ],
-      "isOsiApproved": false
+        "http://labs.metacarta.com/license-explanation.html#license"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-2.4.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-flex.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.4.json",
-      "referenceNumber": 77,
-      "name": "Open LDAP Public License v2.4",
-      "licenseId": "OLDAP-2.4",
+      "isOsiApproved": false,
+      "licenseId": "BSD-3-Clause-flex",
+      "name": "BSD 3-Clause Flex variant",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-flex.html",
+      "referenceNumber": 211,
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u0=
03dblob;f\u003dLICENSE;hb\u003dcd1284c4a91a8a380d904eee68d1583f989ed386"
-      ],
-      "isOsiApproved": false
+        "https://github.com/westes/flex/blob/master/COPYING"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-2.3.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-HP.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.3.json",
-      "referenceNumber": 78,
-      "name": "Open LDAP Public License v2.3",
-      "licenseId": "OLDAP-2.3",
-      "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u0=
03dblob;f\u003dLICENSE;hb\u003dd32cf54a32d581ab475d23c810b0a7fbaf8d63c3"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "BSD-3-Clause-HP",
+      "name": "Hewlett-Packard BSD variant license",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-HP.html",
+      "referenceNumber": 210,
+      "seeAlso": [
+        "https://github.com/zdohnal/hplip/blob/master/COPYING#L939"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/ZPL-2.1.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-LBNL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/ZPL-2.1.json",
-      "referenceNumber": 79,
-      "name": "Zope Public License 2.1",
-      "licenseId": "ZPL-2.1",
-      "seeAlso": [
-        "http://old.zope.org/Resources/ZPL/"
-      ],
       "isOsiApproved": true,
-      "isFsfLibre": true
+      "licenseId": "BSD-3-Clause-LBNL",
+      "name": "Lawrence Berkeley National Labs BSD variant license",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-LBNL.html",
+      "referenceNumber": 597,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/LBNLBSD"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Apache-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Modification.j=
son",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Apache-2.0.json",
-      "referenceNumber": 80,
-      "name": "Apache License 2.0",
-      "licenseId": "Apache-2.0",
+      "isOsiApproved": false,
+      "licenseId": "BSD-3-Clause-Modification",
+      "name": "BSD 3-Clause Modification",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-Modification.ht=
ml",
+      "referenceNumber": 364,
       "seeAlso": [
-        "https://www.apache.org/licenses/LICENSE-2.0",
-        "https://opensource.org/licenses/Apache-2.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://fedoraproject.org/wiki/Licensing:BSD#Modification_Variant"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SGI-B-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Military-Li=
cense.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SGI-B-2.0.json",
-      "referenceNumber": 81,
-      "name": "SGI Free Software License B v2.0",
-      "licenseId": "SGI-B-2.0",
-      "seeAlso": [
-        "http://oss.sgi.com/projects/FreeB/SGIFreeSWLicB.2.0.pdf"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "BSD-3-Clause-No-Military-License",
+      "name": "BSD 3-Clause No Military License",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Military-Lic=
ense.html",
+      "referenceNumber": 30,
+      "seeAlso": [
+        "https://gitlab.syncad.com/hive/dhive/-/blob/master/LICENSE",
+        "https://github.com/greymass/swift-eosio/blob/master/LICENSE"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Hippocratic-2.1.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Lic=
ense.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Hippocratic-2.1.json",
-      "referenceNumber": 82,
-      "name": "Hippocratic License 2.1",
-      "licenseId": "Hippocratic-2.1",
+      "isOsiApproved": false,
+      "licenseId": "BSD-3-Clause-No-Nuclear-License",
+      "name": "BSD 3-Clause No Nuclear License",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Lice=
nse.html",
+      "referenceNumber": 21,
       "seeAlso": [
-        "https://firstdonoharm.dev/version/2/1/license.html",
-        "https://github.com/EthicalSource/hippocratic-license/blob/58c0e64=
6d64ff6fbee275bfe2b9492f914e3ab2a/LICENSE.txt"
-      ],
-      "isOsiApproved": false
+        "http://download.oracle.com/otn-pub/java/licenses/bsd.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-DE.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Lic=
ense-2014.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0-DE.json",
-      "referenceNumber": 83,
-      "name": "Creative Commons Attribution Share Alike 3.0 Germany",
-      "licenseId": "CC-BY-SA-3.0-DE",
+      "isOsiApproved": false,
+      "licenseId": "BSD-3-Clause-No-Nuclear-License-2014",
+      "name": "BSD 3-Clause No Nuclear License 2014",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Lice=
nse-2014.html",
+      "referenceNumber": 543,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-sa/3.0/de/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://java.net/projects/javaeetutorial/pages/BerkeleyLicense"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-War=
ranty.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-1.0.json",
-      "referenceNumber": 84,
-      "name": "Creative Commons Attribution Non Commercial Share Alike 1.0=
 Generic",
-      "licenseId": "CC-BY-NC-SA-1.0",
+      "isOsiApproved": false,
+      "licenseId": "BSD-3-Clause-No-Nuclear-Warranty",
+      "name": "BSD 3-Clause No Nuclear Warranty",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Warr=
anty.html",
+      "referenceNumber": 402,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc-sa/1.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://jogamp.org/git/?p=3Dgluegen.git;a=3Dblob_plain;f=3DLICENS=
E.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LGPL-2.1-or-later.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Open-MPI.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1-or-later.json",
-      "referenceNumber": 85,
-      "name": "GNU Lesser General Public License v2.1 or later",
-      "licenseId": "LGPL-2.1-or-later",
+      "isOsiApproved": false,
+      "licenseId": "BSD-3-Clause-Open-MPI",
+      "name": "BSD 3-Clause Open MPI variant",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-Open-MPI.html",
+      "referenceNumber": 376,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.htm=
l",
-        "https://opensource.org/licenses/LGPL-2.1"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://www.open-mpi.org/community/license.php",
+        "http://www.netlib.org/lapack/LICENSE.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-3.0-US.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Sun.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-US.json",
-      "referenceNumber": 86,
-      "name": "Creative Commons Attribution 3.0 United States",
-      "licenseId": "CC-BY-3.0-US",
+      "isOsiApproved": false,
+      "licenseId": "BSD-3-Clause-Sun",
+      "name": "BSD 3-Clause Sun Microsystems",
+      "reference": "https://spdx.org/licenses/BSD-3-Clause-Sun.html",
+      "referenceNumber": 554,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by/3.0/us/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://github.com/xmlark/msv/blob/b9316e2f2270bc1606952ea4939ec8=
7fbba157f3/xsdlib/src/main/java/com/sun/msv/datatype/regexp/InternalImpl.ja=
va"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/TCP-wrappers.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-4-Clause.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/TCP-wrappers.json",
-      "referenceNumber": 87,
-      "name": "TCP Wrappers License",
-      "licenseId": "TCP-wrappers",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "BSD-4-Clause",
+      "name": "BSD 4-Clause \"Original\" or \"Old\" License",
+      "reference": "https://spdx.org/licenses/BSD-4-Clause.html",
+      "referenceNumber": 650,
       "seeAlso": [
-        "http://rc.quest.com/topics/openssh/license.php#tcpwrappers"
-      ],
-      "isOsiApproved": false
+        "http://directory.fsf.org/wiki/License:BSD_4Clause"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.2-invariants-or-later=
.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-4-Clause-Shortened.json=
",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-invariants-or-late=
r.json",
-      "referenceNumber": 88,
-      "name": "GNU Free Documentation License v1.2 or later - invariants",
-      "licenseId": "GFDL-1.2-invariants-or-later",
+      "isOsiApproved": false,
+      "licenseId": "BSD-4-Clause-Shortened",
+      "name": "BSD 4 Clause Shortened",
+      "reference": "https://spdx.org/licenses/BSD-4-Clause-Shortened.html",
+      "referenceNumber": 252,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
-      ],
-      "isOsiApproved": false
+        "https://metadata.ftp-master.debian.org/changelogs//main/a/arpwatc=
h/arpwatch_2.1a15-7_copyright"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Eurosym.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-4-Clause-UC.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Eurosym.json",
-      "referenceNumber": 89,
-      "name": "Eurosym License",
-      "licenseId": "Eurosym",
-      "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Eurosym"
-      ],
-      "isOsiApproved": false
-    },
-    {
-      "reference": "https://spdx.org/licenses/GFDL-1.1.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1.json",
-      "referenceNumber": 90,
-      "name": "GNU Free Documentation License v1.1",
-      "licenseId": "GFDL-1.1",
-      "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "BSD-4-Clause-UC",
+      "name": "BSD-4-Clause (University of California-Specific)",
+      "reference": "https://spdx.org/licenses/BSD-4-Clause-UC.html",
+      "referenceNumber": 117,
+      "seeAlso": [
+        "http://www.freebsd.org/copyright/license.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LPPL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-4.3RENO.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LPPL-1.0.json",
-      "referenceNumber": 91,
-      "name": "LaTeX Project Public License v1.0",
-      "licenseId": "LPPL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "BSD-4.3RENO",
+      "name": "BSD 4.3 RENO License",
+      "reference": "https://spdx.org/licenses/BSD-4.3RENO.html",
+      "referenceNumber": 298,
       "seeAlso": [
-        "http://www.latex-project.org/lppl/lppl-1-0.txt"
-      ],
-      "isOsiApproved": false
+        "https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblob;f=3Dlib=
iberty/strcasecmp.c;h=3D131d81c2ce7881fa48c363dc5bf5fb302c61ce0b;hb=3DHEAD",
+        "https://git.openldap.org/openldap/openldap/-/blob/master/COPYRIGH=
T#L55-63"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LGPL-2.0+.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0+.json",
-      "referenceNumber": 92,
-      "name": "GNU Library General Public License v2 or later",
-      "licenseId": "LGPL-2.0+",
+      "detailsUrl": "https://spdx.org/licenses/BSD-4.3TAHOE.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "BSD-4.3TAHOE",
+      "name": "BSD 4.3 TAHOE License",
+      "reference": "https://spdx.org/licenses/BSD-4.3TAHOE.html",
+      "referenceNumber": 0,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.htm=
l"
-      ],
-      "isOsiApproved": true
+        "https://github.com/389ds/389-ds-base/blob/main/ldap/include/sysex=
its-compat.h#L15",
+        "https://git.savannah.gnu.org/cgit/indent.git/tree/doc/indent.texi=
?id=3Da74c6b4ee49397cf330b333da1042bffa60ed14f#n1788"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SGI-B-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-Advertising-Acknowledge=
ment.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SGI-B-1.0.json",
-      "referenceNumber": 93,
-      "name": "SGI Free Software License B v1.0",
-      "licenseId": "SGI-B-1.0",
+      "isOsiApproved": false,
+      "licenseId": "BSD-Advertising-Acknowledgement",
+      "name": "BSD Advertising Acknowledgement License",
+      "reference": "https://spdx.org/licenses/BSD-Advertising-Acknowledgem=
ent.html",
+      "referenceNumber": 423,
       "seeAlso": [
-        "http://oss.sgi.com/projects/FreeB/SGIFreeSWLicB.1.0.html"
-      ],
-      "isOsiApproved": false
+        "https://github.com/python-excel/xlrd/blob/master/LICENSE#L33"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/APL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-Attribution-HPND-discla=
imer.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/APL-1.0.json",
-      "referenceNumber": 94,
-      "name": "Adaptive Public License 1.0",
-      "licenseId": "APL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "BSD-Attribution-HPND-disclaimer",
+      "name": "BSD with Attribution and HPND disclaimer",
+      "reference": "https://spdx.org/licenses/BSD-Attribution-HPND-disclai=
mer.html",
+      "referenceNumber": 171,
       "seeAlso": [
-        "https://opensource.org/licenses/APL-1.0"
-      ],
-      "isOsiApproved": true
+        "https://github.com/cyrusimap/cyrus-sasl/blob/master/COPYING"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/libtiff.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-Inferno-Nettverk.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/libtiff.json",
-      "referenceNumber": 95,
-      "name": "libtiff License",
-      "licenseId": "libtiff",
+      "isOsiApproved": false,
+      "licenseId": "BSD-Inferno-Nettverk",
+      "name": "BSD-Inferno-Nettverk",
+      "reference": "https://spdx.org/licenses/BSD-Inferno-Nettverk.html",
+      "referenceNumber": 401,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/libtiff"
-      ],
-      "isOsiApproved": false
+        "https://www.inet.no/dante/LICENSE"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/AFL-2.1.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-Protection.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/AFL-2.1.json",
-      "referenceNumber": 96,
-      "name": "Academic Free License v2.1",
-      "licenseId": "AFL-2.1",
+      "isOsiApproved": false,
+      "licenseId": "BSD-Protection",
+      "name": "BSD Protection License",
+      "reference": "https://spdx.org/licenses/BSD-Protection.html",
+      "referenceNumber": 403,
       "seeAlso": [
-        "http://opensource.linux-mirror.org/licenses/afl-2.1.txt"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://fedoraproject.org/wiki/Licensing/BSD_Protection_License"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-Source-beginning-file.j=
son",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-1.0.json",
+      "isOsiApproved": false,
+      "licenseId": "BSD-Source-beginning-file",
+      "name": "BSD Source Code Attribution - beginning of file variant",
+      "reference": "https://spdx.org/licenses/BSD-Source-beginning-file.ht=
ml",
       "referenceNumber": 97,
-      "name": "Creative Commons Attribution Non Commercial 1.0 Generic",
-      "licenseId": "CC-BY-NC-1.0",
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc/1.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://github.com/lattera/freebsd/blob/master/sys/cam/cam.c#L4"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GD.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-Source-Code.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GD.json",
-      "referenceNumber": 98,
-      "name": "GD License",
-      "licenseId": "GD",
+      "isOsiApproved": false,
+      "licenseId": "BSD-Source-Code",
+      "name": "BSD Source Code Attribution",
+      "reference": "https://spdx.org/licenses/BSD-Source-Code.html",
+      "referenceNumber": 22,
       "seeAlso": [
-        "https://libgd.github.io/manuals/2.3.0/files/license-txt.html"
-      ],
-      "isOsiApproved": false
+        "https://github.com/robbiehanson/CocoaHTTPServer/blob/master/LICEN=
SE.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/AFL-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-Systemics.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/AFL-1.1.json",
-      "referenceNumber": 99,
-      "name": "Academic Free License v1.1",
-      "licenseId": "AFL-1.1",
+      "isOsiApproved": false,
+      "licenseId": "BSD-Systemics",
+      "name": "Systemics BSD variant license",
+      "reference": "https://spdx.org/licenses/BSD-Systemics.html",
+      "referenceNumber": 178,
       "seeAlso": [
-        "http://opensource.linux-mirror.org/licenses/afl-1.1.txt",
-        "http://wayback.archive.org/web/20021004124254/http://www.opensour=
ce.org/licenses/academic.php"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://metacpan.org/release/DPARIS/Crypt-DES-2.07/source/COPYRIG=
HT"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-IGO.html",
+      "detailsUrl": "https://spdx.org/licenses/BSD-Systemics-W3Works.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-IGO.json",
-      "referenceNumber": 100,
-      "name": "Creative Commons Attribution Non Commercial No Derivatives =
3.0 IGO",
-      "licenseId": "CC-BY-NC-ND-3.0-IGO",
+      "isOsiApproved": false,
+      "licenseId": "BSD-Systemics-W3Works",
+      "name": "Systemics W3Works BSD variant license",
+      "reference": "https://spdx.org/licenses/BSD-Systemics-W3Works.html",
+      "referenceNumber": 350,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc-nd/3.0/igo/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://metacpan.org/release/DPARIS/Crypt-Blowfish-2.14/source/CO=
PYRIGHT#L7"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Unicode-DFS-2015.html",
+      "detailsUrl": "https://spdx.org/licenses/BSL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Unicode-DFS-2015.json",
-      "referenceNumber": 101,
-      "name": "Unicode License Agreement - Data Files and Software (2015)",
-      "licenseId": "Unicode-DFS-2015",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "BSL-1.0",
+      "name": "Boost Software License 1.0",
+      "reference": "https://spdx.org/licenses/BSL-1.0.html",
+      "referenceNumber": 514,
       "seeAlso": [
-        "https://web.archive.org/web/20151224134844/http://unicode.org/cop=
yright.html"
-      ],
-      "isOsiApproved": false
+        "http://www.boost.org/LICENSE_1_0.txt",
+        "https://opensource.org/licenses/BSL-1.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.2-only.html",
+      "detailsUrl": "https://spdx.org/licenses/BUSL-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-only.json",
-      "referenceNumber": 102,
-      "name": "GNU Free Documentation License v1.2 only",
-      "licenseId": "GFDL-1.2-only",
+      "isOsiApproved": false,
+      "licenseId": "BUSL-1.1",
+      "name": "Business Source License 1.1",
+      "reference": "https://spdx.org/licenses/BUSL-1.1.html",
+      "referenceNumber": 549,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
-      ],
+        "https://mariadb.com/bsl11/"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/bzip2-1.0.5.json",
+      "isDeprecatedLicenseId": true,
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "bzip2-1.0.5",
+      "name": "bzip2 and libbzip2 License v1.0.5",
+      "reference": "https://spdx.org/licenses/bzip2-1.0.5.html",
+      "referenceNumber": 419,
+      "seeAlso": [
+        "https://sourceware.org/bzip2/1.0.5/bzip2-manual-1.0.5.html",
+        "http://bzip.org/1.0.5/bzip2-manual-1.0.5.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MPL-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/bzip2-1.0.6.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MPL-1.1.json",
-      "referenceNumber": 103,
-      "name": "Mozilla Public License 1.1",
-      "licenseId": "MPL-1.1",
+      "isOsiApproved": false,
+      "licenseId": "bzip2-1.0.6",
+      "name": "bzip2 and libbzip2 License v1.0.6",
+      "reference": "https://spdx.org/licenses/bzip2-1.0.6.html",
+      "referenceNumber": 396,
       "seeAlso": [
-        "http://www.mozilla.org/MPL/MPL-1.1.html",
-        "https://opensource.org/licenses/MPL-1.1"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://sourceware.org/git/?p=3Dbzip2.git;a=3Dblob;f=3DLICENSE;hb=
=3Dbzip2-1.0.6",
+        "http://bzip.org/1.0.5/bzip2-manual-1.0.5.html",
+        "https://sourceware.org/cgit/valgrind/tree/mpi/libmpiwrap.c"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GPL-2.0-only.html",
+      "detailsUrl": "https://spdx.org/licenses/C-UDA-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-only.json",
-      "referenceNumber": 104,
-      "name": "GNU General Public License v2.0 only",
-      "licenseId": "GPL-2.0-only",
+      "isOsiApproved": false,
+      "licenseId": "C-UDA-1.0",
+      "name": "Computational Use of Data Agreement v1.0",
+      "reference": "https://spdx.org/licenses/C-UDA-1.0.html",
+      "referenceNumber": 432,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html=
",
-        "https://opensource.org/licenses/GPL-2.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://github.com/microsoft/Computational-Use-of-Data-Agreement/=
blob/master/C-UDA-1.0.md",
+        "https://cdla.dev/computational-use-of-data-agreement-v1-0/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-4.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CAL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-4.0.json",
-      "referenceNumber": 105,
-      "name": "Creative Commons Attribution Non Commercial 4.0 Internation=
al",
-      "licenseId": "CC-BY-NC-4.0",
+      "isOsiApproved": true,
+      "licenseId": "CAL-1.0",
+      "name": "Cryptographic Autonomy License 1.0",
+      "reference": "https://spdx.org/licenses/CAL-1.0.html",
+      "referenceNumber": 653,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc/4.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "http://cryptographicautonomylicense.com/license-text.html",
+        "https://opensource.org/licenses/CAL-1.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/FreeImage.html",
+      "detailsUrl": "https://spdx.org/licenses/CAL-1.0-Combined-Work-Excep=
tion.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/FreeImage.json",
-      "referenceNumber": 106,
-      "name": "FreeImage Public License v1.0",
-      "licenseId": "FreeImage",
+      "isOsiApproved": true,
+      "licenseId": "CAL-1.0-Combined-Work-Exception",
+      "name": "Cryptographic Autonomy License 1.0 (Combined Work Exception=
)",
+      "reference": "https://spdx.org/licenses/CAL-1.0-Combined-Work-Except=
ion.html",
+      "referenceNumber": 217,
       "seeAlso": [
-        "http://freeimage.sourceforge.net/freeimage-license.txt"
-      ],
-      "isOsiApproved": false
+        "http://cryptographicautonomylicense.com/license-text.html",
+        "https://opensource.org/licenses/CAL-1.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SHL-0.51.html",
+      "detailsUrl": "https://spdx.org/licenses/Caldera.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SHL-0.51.json",
-      "referenceNumber": 107,
-      "name": "Solderpad Hardware License, Version 0.51",
-      "licenseId": "SHL-0.51",
+      "isOsiApproved": false,
+      "licenseId": "Caldera",
+      "name": "Caldera License",
+      "reference": "https://spdx.org/licenses/Caldera.html",
+      "referenceNumber": 622,
       "seeAlso": [
-        "https://solderpad.org/licenses/SHL-0.51/"
-      ],
-      "isOsiApproved": false
+        "http://www.lemis.com/grog/UNIX/ancient-source-all.pdf"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CNRI-Jython.html",
+      "detailsUrl": "https://spdx.org/licenses/Caldera-no-preamble.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CNRI-Jython.json",
-      "referenceNumber": 108,
-      "name": "CNRI Jython License",
-      "licenseId": "CNRI-Jython",
+      "isOsiApproved": false,
+      "licenseId": "Caldera-no-preamble",
+      "name": "Caldera License (without preamble)",
+      "reference": "https://spdx.org/licenses/Caldera-no-preamble.html",
+      "referenceNumber": 585,
       "seeAlso": [
-        "http://www.jython.org/license.html"
-      ],
-      "isOsiApproved": false
+        "https://github.com/apache/apr/blob/trunk/LICENSE#L298C6-L298C29"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/ZPL-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/Catharon.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/ZPL-1.1.json",
-      "referenceNumber": 109,
-      "name": "Zope Public License 1.1",
-      "licenseId": "ZPL-1.1",
+      "isOsiApproved": false,
+      "licenseId": "Catharon",
+      "name": "Catharon License",
+      "reference": "https://spdx.org/licenses/Catharon.html",
+      "referenceNumber": 45,
       "seeAlso": [
-        "http://old.zope.org/Resources/License/ZPL-1.1"
-      ],
-      "isOsiApproved": false
+        "https://github.com/scummvm/scummvm/blob/v2.8.0/LICENSES/CatharonL=
icense.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Afmparse.html",
+      "detailsUrl": "https://spdx.org/licenses/CATOSL-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Afmparse.json",
-      "referenceNumber": 110,
-      "name": "Afmparse License",
-      "licenseId": "Afmparse",
+      "isOsiApproved": true,
+      "licenseId": "CATOSL-1.1",
+      "name": "Computer Associates Trusted Open Source License 1.1",
+      "reference": "https://spdx.org/licenses/CATOSL-1.1.html",
+      "referenceNumber": 193,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Afmparse"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/CATOSL-1.1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-2.1.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.1.json",
-      "referenceNumber": 111,
-      "name": "Open LDAP Public License v2.1",
-      "licenseId": "OLDAP-2.1",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-1.0",
+      "name": "Creative Commons Attribution 1.0 Generic",
+      "reference": "https://spdx.org/licenses/CC-BY-1.0.html",
+      "referenceNumber": 37,
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u0=
03dblob;f\u003dLICENSE;hb\u003db0d176738e96a0d3b9f85cb51e140a86f21be715"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by/1.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Rdisc.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Rdisc.json",
-      "referenceNumber": 112,
-      "name": "Rdisc License",
-      "licenseId": "Rdisc",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-2.0",
+      "name": "Creative Commons Attribution 2.0 Generic",
+      "reference": "https://spdx.org/licenses/CC-BY-2.0.html",
+      "referenceNumber": 241,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Rdisc_License"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by/2.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Imlib2.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.5.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Imlib2.json",
-      "referenceNumber": 113,
-      "name": "Imlib2 License",
-      "licenseId": "Imlib2",
-      "seeAlso": [
-        "http://trac.enlightenment.org/e/browser/trunk/imlib2/COPYING",
-        "https://git.enlightenment.org/legacy/imlib2.git/tree/COPYING"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "CC-BY-2.5",
+      "name": "Creative Commons Attribution 2.5 Generic",
+      "reference": "https://spdx.org/licenses/CC-BY-2.5.html",
+      "referenceNumber": 129,
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by/2.5/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-4-Clause-Shortened.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.5-AU.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-4-Clause-Shortened.json=
",
-      "referenceNumber": 114,
-      "name": "BSD 4 Clause Shortened",
-      "licenseId": "BSD-4-Clause-Shortened",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-2.5-AU",
+      "name": "Creative Commons Attribution 2.5 Australia",
+      "reference": "https://spdx.org/licenses/CC-BY-2.5-AU.html",
+      "referenceNumber": 583,
       "seeAlso": [
-        "https://metadata.ftp-master.debian.org/changelogs//main/a/arpwatc=
h/arpwatch_2.1a15-7_copyright"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by/2.5/au/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Sendmail.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Sendmail.json",
-      "referenceNumber": 115,
-      "name": "Sendmail License",
-      "licenseId": "Sendmail",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-3.0",
+      "name": "Creative Commons Attribution 3.0 Unported",
+      "reference": "https://spdx.org/licenses/CC-BY-3.0.html",
+      "referenceNumber": 302,
       "seeAlso": [
-        "http://www.sendmail.com/pdfs/open_source/sendmail_license.pdf",
-        "https://web.archive.org/web/20160322142305/https://www.sendmail.c=
om/pdfs/open_source/sendmail_license.pdf"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by/3.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-2.5.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-AT.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.5.json",
-      "referenceNumber": 116,
-      "name": "Creative Commons Attribution 2.5 Generic",
-      "licenseId": "CC-BY-2.5",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-3.0-AT",
+      "name": "Creative Commons Attribution 3.0 Austria",
+      "reference": "https://spdx.org/licenses/CC-BY-3.0-AT.html",
+      "referenceNumber": 324,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by/2.5/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by/3.0/at/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/AAL.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-AU.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/AAL.json",
-      "referenceNumber": 117,
-      "name": "Attribution Assurance License",
-      "licenseId": "AAL",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-3.0-AU",
+      "name": "Creative Commons Attribution 3.0 Australia",
+      "reference": "https://spdx.org/licenses/CC-BY-3.0-AU.html",
+      "referenceNumber": 342,
       "seeAlso": [
-        "https://opensource.org/licenses/attribution"
-      ],
-      "isOsiApproved": true
+        "https://creativecommons.org/licenses/by/3.0/au/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MPL-2.0-no-copyleft-exceptio=
n.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-DE.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MPL-2.0-no-copyleft-excepti=
on.json",
-      "referenceNumber": 118,
-      "name": "Mozilla Public License 2.0 (no copyleft exception)",
-      "licenseId": "MPL-2.0-no-copyleft-exception",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-3.0-DE",
+      "name": "Creative Commons Attribution 3.0 Germany",
+      "reference": "https://spdx.org/licenses/CC-BY-3.0-DE.html",
+      "referenceNumber": 239,
       "seeAlso": [
-        "http://www.mozilla.org/MPL/2.0/",
-        "https://opensource.org/licenses/MPL-2.0"
-      ],
-      "isOsiApproved": true
+        "https://creativecommons.org/licenses/by/3.0/de/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-2.5.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-IGO.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-2.5.json",
-      "referenceNumber": 119,
-      "name": "Creative Commons Attribution Non Commercial No Derivatives =
2.5 Generic",
-      "licenseId": "CC-BY-NC-ND-2.5",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-3.0-IGO",
+      "name": "Creative Commons Attribution 3.0 IGO",
+      "reference": "https://spdx.org/licenses/CC-BY-3.0-IGO.html",
+      "referenceNumber": 19,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc-nd/2.5/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by/3.0/igo/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-3.0-NL.html",
-      "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-NL.json",
-      "referenceNumber": 120,
-      "name": "Creative Commons Attribution 3.0 Netherlands",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
       "licenseId": "CC-BY-3.0-NL",
+      "name": "Creative Commons Attribution 3.0 Netherlands",
+      "reference": "https://spdx.org/licenses/CC-BY-3.0-NL.html",
+      "referenceNumber": 501,
       "seeAlso": [
         "https://creativecommons.org/licenses/by/3.0/nl/legalcode"
-      ],
-      "isOsiApproved": false
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LPL-1.02.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-US.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LPL-1.02.json",
-      "referenceNumber": 121,
-      "name": "Lucent Public License v1.02",
-      "licenseId": "LPL-1.02",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-3.0-US",
+      "name": "Creative Commons Attribution 3.0 United States",
+      "reference": "https://spdx.org/licenses/CC-BY-3.0-US.html",
+      "referenceNumber": 569,
       "seeAlso": [
-        "http://plan9.bell-labs.com/plan9/license.html",
-        "https://opensource.org/licenses/LPL-1.02"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://creativecommons.org/licenses/by/3.0/us/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/ECL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-4.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/ECL-1.0.json",
-      "referenceNumber": 122,
-      "name": "Educational Community License v1.0",
-      "licenseId": "ECL-1.0",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-4.0",
+      "name": "Creative Commons Attribution 4.0 International",
+      "reference": "https://spdx.org/licenses/CC-BY-4.0.html",
+      "referenceNumber": 265,
       "seeAlso": [
-        "https://opensource.org/licenses/ECL-1.0"
-      ],
-      "isOsiApproved": true
+        "https://creativecommons.org/licenses/by/4.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OFL-1.0-no-RFN.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OFL-1.0-no-RFN.json",
-      "referenceNumber": 123,
-      "name": "SIL Open Font License 1.0 with no Reserved Font Name",
-      "licenseId": "OFL-1.0-no-RFN",
+      "isFsfLibre": false,
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-1.0",
+      "name": "Creative Commons Attribution Non Commercial 1.0 Generic",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-1.0.html",
+      "referenceNumber": 167,
       "seeAlso": [
-        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL10_we=
b"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-nc/1.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-DE.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-DE.json",
-      "referenceNumber": 124,
-      "name": "Creative Commons Attribution Non Commercial Share Alike 3.0=
 Germany",
-      "licenseId": "CC-BY-NC-SA-3.0-DE",
+      "isFsfLibre": false,
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-2.0",
+      "name": "Creative Commons Attribution Non Commercial 2.0 Generic",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-2.0.html",
+      "referenceNumber": 92,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc-sa/3.0/de/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-nc/2.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-2.5.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0.json",
-      "referenceNumber": 125,
-      "name": "Creative Commons Attribution Share Alike 3.0 Unported",
-      "licenseId": "CC-BY-SA-3.0",
+      "isFsfLibre": false,
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-2.5",
+      "name": "Creative Commons Attribution Non Commercial 2.5 Generic",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-2.5.html",
+      "referenceNumber": 253,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-sa/3.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-nc/2.5/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/NTP.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-3.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NTP.json",
-      "referenceNumber": 126,
-      "name": "NTP License",
-      "licenseId": "NTP",
+      "isFsfLibre": false,
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-3.0",
+      "name": "Creative Commons Attribution Non Commercial 3.0 Unported",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-3.0.html",
+      "referenceNumber": 199,
       "seeAlso": [
-        "https://opensource.org/licenses/NTP"
-      ],
-      "isOsiApproved": true
+        "https://creativecommons.org/licenses/by-nc/3.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MPL-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-3.0-DE.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MPL-2.0.json",
-      "referenceNumber": 127,
-      "name": "Mozilla Public License 2.0",
-      "licenseId": "MPL-2.0",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-3.0-DE",
+      "name": "Creative Commons Attribution Non Commercial 3.0 Germany",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-3.0-DE.html",
+      "referenceNumber": 429,
       "seeAlso": [
-        "https://www.mozilla.org/MPL/2.0/",
-        "https://opensource.org/licenses/MPL-2.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://creativecommons.org/licenses/by-nc/3.0/de/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/APSL-1.2.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-4.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/APSL-1.2.json",
-      "referenceNumber": 128,
-      "name": "Apple Public Source License 1.2",
-      "licenseId": "APSL-1.2",
+      "isFsfLibre": false,
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-4.0",
+      "name": "Creative Commons Attribution Non Commercial 4.0 Internation=
al",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-4.0.html",
+      "referenceNumber": 188,
       "seeAlso": [
-        "http://www.samurajdata.se/opensource/mirror/licenses/apsl.php"
-      ],
-      "isOsiApproved": true
+        "https://creativecommons.org/licenses/by-nc/4.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.2-no-invariants-only.=
html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-no-invariants-only=
.json",
-      "referenceNumber": 129,
-      "name": "GNU Free Documentation License v1.2 only - no invariants",
-      "licenseId": "GFDL-1.2-no-invariants-only",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-ND-1.0",
+      "name": "Creative Commons Attribution Non Commercial No Derivatives =
1.0 Generic",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-1.0.html",
+      "referenceNumber": 365,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-nd-nc/1.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Artistic-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Artistic-2.0.json",
-      "referenceNumber": 130,
-      "name": "Artistic License 2.0",
-      "licenseId": "Artistic-2.0",
-      "seeAlso": [
-        "http://www.perlfoundation.org/artistic_license_2_0",
-        "https://www.perlfoundation.org/artistic-license-20.html",
-        "https://opensource.org/licenses/artistic-license-2.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
-    },
-    {
-      "reference": "https://spdx.org/licenses/GPL-2.0.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0.json",
-      "referenceNumber": 131,
-      "name": "GNU General Public License v2.0 only",
-      "licenseId": "GPL-2.0",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-ND-2.0",
+      "name": "Creative Commons Attribution Non Commercial No Derivatives =
2.0 Generic",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-2.0.html",
+      "referenceNumber": 416,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html=
",
-        "https://opensource.org/licenses/GPL-2.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://creativecommons.org/licenses/by-nc-nd/2.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/RSCPL.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-2.5.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/RSCPL.json",
-      "referenceNumber": 132,
-      "name": "Ricoh Source Code Public License",
-      "licenseId": "RSCPL",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-ND-2.5",
+      "name": "Creative Commons Attribution Non Commercial No Derivatives =
2.5 Generic",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-2.5.html",
+      "referenceNumber": 58,
       "seeAlso": [
-        "http://wayback.archive.org/web/20060715140826/http://www.risource=
.org/RPL/RPL-1.0A.shtml",
-        "https://opensource.org/licenses/RSCPL"
-      ],
-      "isOsiApproved": true
+        "https://creativecommons.org/licenses/by-nc-nd/2.5/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Sleepycat.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-3.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Sleepycat.json",
-      "referenceNumber": 133,
-      "name": "Sleepycat License",
-      "licenseId": "Sleepycat",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-ND-3.0",
+      "name": "Creative Commons Attribution Non Commercial No Derivatives =
3.0 Unported",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0.html",
+      "referenceNumber": 213,
       "seeAlso": [
-        "https://opensource.org/licenses/Sleepycat"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://creativecommons.org/licenses/by-nc-nd/3.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/xpp.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-DE.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/xpp.json",
-      "referenceNumber": 134,
-      "name": "XPP License",
-      "licenseId": "xpp",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-ND-3.0-DE",
+      "name": "Creative Commons Attribution Non Commercial No Derivatives =
3.0 Germany",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-DE.html",
+      "referenceNumber": 84,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/xpp"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-nc-nd/3.0/de/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CDLA-Sharing-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-IGO.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CDLA-Sharing-1.0.json",
-      "referenceNumber": 135,
-      "name": "Community Data License Agreement Sharing 1.0",
-      "licenseId": "CDLA-Sharing-1.0",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-ND-3.0-IGO",
+      "name": "Creative Commons Attribution Non Commercial No Derivatives =
3.0 IGO",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-IGO.html",
+      "referenceNumber": 587,
       "seeAlso": [
-        "https://cdla.io/sharing-1-0"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-nc-nd/3.0/igo/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/ClArtistic.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-4.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/ClArtistic.json",
-      "referenceNumber": 136,
-      "name": "Clarified Artistic License",
-      "licenseId": "ClArtistic",
-      "seeAlso": [
-        "http://gianluca.dellavedova.org/2011/01/03/clarified-artistic-lic=
ense/",
-        "http://www.ncftp.com/ncftp/doc/LICENSE.txt"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
-    },
-    {
-      "reference": "https://spdx.org/licenses/AGPL-1.0-only.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0-only.json",
-      "referenceNumber": 137,
-      "name": "Affero General Public License v1.0 only",
-      "licenseId": "AGPL-1.0-only",
+      "licenseId": "CC-BY-NC-ND-4.0",
+      "name": "Creative Commons Attribution Non Commercial No Derivatives =
4.0 International",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-4.0.html",
+      "referenceNumber": 296,
       "seeAlso": [
-        "http://www.affero.org/oagpl.html"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-3.0-DE.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0-DE.json",
-      "referenceNumber": 138,
-      "name": "Creative Commons Attribution 3.0 Germany",
-      "licenseId": "CC-BY-3.0-DE",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-SA-1.0",
+      "name": "Creative Commons Attribution Non Commercial Share Alike 1.0=
 Generic",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-1.0.html",
+      "referenceNumber": 170,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by/3.0/de/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-nc-sa/1.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/AFL-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/AFL-2.0.json",
-      "referenceNumber": 139,
-      "name": "Academic Free License v2.0",
-      "licenseId": "AFL-2.0",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-SA-2.0",
+      "name": "Creative Commons Attribution Non Commercial Share Alike 2.0=
 Generic",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0.html",
+      "referenceNumber": 484,
       "seeAlso": [
-        "http://wayback.archive.org/web/20060924134533/http://www.opensour=
ce.org/licenses/afl-2.0.txt"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://creativecommons.org/licenses/by-nc-sa/2.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Intel.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-DE.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Intel.json",
-      "referenceNumber": 140,
-      "name": "Intel Open Source License",
-      "licenseId": "Intel",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-SA-2.0-DE",
+      "name": "Creative Commons Attribution Non Commercial Share Alike 2.0=
 Germany",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-DE.html",
+      "referenceNumber": 184,
       "seeAlso": [
-        "https://opensource.org/licenses/Intel"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://creativecommons.org/licenses/by-nc-sa/2.0/de/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.1-no-invariants-or-la=
ter.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-FR.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-no-invariants-or-l=
ater.json",
-      "referenceNumber": 141,
-      "name": "GNU Free Documentation License v1.1 or later - no invariant=
s",
-      "licenseId": "GFDL-1.1-no-invariants-or-later",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-SA-2.0-FR",
+      "name": "Creative Commons Attribution-NonCommercial-ShareAlike 2.0 F=
rance",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-FR.html",
+      "referenceNumber": 116,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-nc-sa/2.0/fr/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/APAFML.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-UK.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/APAFML.json",
-      "referenceNumber": 142,
-      "name": "Adobe Postscript AFM License",
-      "licenseId": "APAFML",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-SA-2.0-UK",
+      "name": "Creative Commons Attribution Non Commercial Share Alike 2.0=
 England and Wales",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-UK.html",
+      "referenceNumber": 415,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/AdobePostscriptAFM"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-nc-sa/2.0/uk/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.2.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2.json",
-      "referenceNumber": 143,
-      "name": "GNU Free Documentation License v1.2",
-      "licenseId": "GFDL-1.2",
-      "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
-      ],
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.5.json",
+      "isDeprecatedLicenseId": false,
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "CC-BY-NC-SA-2.5",
+      "name": "Creative Commons Attribution Non Commercial Share Alike 2.5=
 Generic",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.5.html",
+      "referenceNumber": 106,
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nc-sa/2.5/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SISSL.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-3.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SISSL.json",
-      "referenceNumber": 144,
-      "name": "Sun Industry Standards Source License v1.1",
-      "licenseId": "SISSL",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-SA-3.0",
+      "name": "Creative Commons Attribution Non Commercial Share Alike 3.0=
 Unported",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0.html",
+      "referenceNumber": 323,
       "seeAlso": [
-        "http://www.openoffice.org/licenses/sissl_license.html",
-        "https://opensource.org/licenses/SISSL"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://creativecommons.org/licenses/by-nc-sa/3.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Naumen.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-DE.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Naumen.json",
-      "referenceNumber": 145,
-      "name": "Naumen Public License",
-      "licenseId": "Naumen",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-SA-3.0-DE",
+      "name": "Creative Commons Attribution Non Commercial Share Alike 3.0=
 Germany",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-DE.html",
+      "referenceNumber": 150,
       "seeAlso": [
-        "https://opensource.org/licenses/Naumen"
-      ],
-      "isOsiApproved": true
+        "https://creativecommons.org/licenses/by-nc-sa/3.0/de/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/HTMLTIDY.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-IGO.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/HTMLTIDY.json",
-      "referenceNumber": 146,
-      "name": "HTML Tidy License",
-      "licenseId": "HTMLTIDY",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-SA-3.0-IGO",
+      "name": "Creative Commons Attribution Non Commercial Share Alike 3.0=
 IGO",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-IGO.html",
+      "referenceNumber": 295,
       "seeAlso": [
-        "https://github.com/htacg/tidy-html5/blob/next/README/LICENSE.md"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-nc-sa/3.0/igo/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-2.8.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-4.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.8.json",
-      "referenceNumber": 147,
-      "name": "Open LDAP Public License v2.8",
-      "licenseId": "OLDAP-2.8",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-NC-SA-4.0",
+      "name": "Creative Commons Attribution Non Commercial Share Alike 4.0=
 International",
+      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-4.0.html",
+      "referenceNumber": 351,
       "seeAlso": [
-        "http://www.openldap.org/software/release/license.html"
-      ],
-      "isOsiApproved": true
+        "https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/blessing.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/blessing.json",
-      "referenceNumber": 148,
-      "name": "SQLite Blessing",
-      "licenseId": "blessing",
+      "isFsfLibre": false,
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-ND-1.0",
+      "name": "Creative Commons Attribution No Derivatives 1.0 Generic",
+      "reference": "https://spdx.org/licenses/CC-BY-ND-1.0.html",
+      "referenceNumber": 56,
       "seeAlso": [
-        "https://www.sqlite.org/src/artifact/e33a4df7e32d742a?ln\u003d4-9",
-        "https://sqlite.org/src/artifact/df5091916dbb40e6"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-nd/1.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-ND-2.0.html",
-      "isDeprecatedLicenseId": false,
       "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-2.0.json",
-      "referenceNumber": 149,
-      "name": "Creative Commons Attribution No Derivatives 2.0 Generic",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": false,
+      "isOsiApproved": false,
       "licenseId": "CC-BY-ND-2.0",
+      "name": "Creative Commons Attribution No Derivatives 2.0 Generic",
+      "reference": "https://spdx.org/licenses/CC-BY-ND-2.0.html",
+      "referenceNumber": 640,
       "seeAlso": [
         "https://creativecommons.org/licenses/by-nd/2.0/legalcode"
-      ],
-      "isOsiApproved": false
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OGTSL.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-2.5.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OGTSL.json",
-      "referenceNumber": 150,
-      "name": "Open Group Test Suite License",
-      "licenseId": "OGTSL",
-      "seeAlso": [
-        "http://www.opengroup.org/testing/downloads/The_Open_Group_TSL.txt=
",
-        "https://opensource.org/licenses/OGTSL"
-      ],
-      "isOsiApproved": true
+      "isFsfLibre": false,
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-ND-2.5",
+      "name": "Creative Commons Attribution No Derivatives 2.5 Generic",
+      "reference": "https://spdx.org/licenses/CC-BY-ND-2.5.html",
+      "referenceNumber": 276,
+      "seeAlso": [
+        "https://creativecommons.org/licenses/by-nd/2.5/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LGPL-2.0-or-later.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-3.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0-or-later.json",
-      "referenceNumber": 151,
-      "name": "GNU Library General Public License v2 or later",
-      "licenseId": "LGPL-2.0-or-later",
+      "isFsfLibre": false,
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-ND-3.0",
+      "name": "Creative Commons Attribution No Derivatives 3.0 Unported",
+      "reference": "https://spdx.org/licenses/CC-BY-ND-3.0.html",
+      "referenceNumber": 173,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.htm=
l"
-      ],
-      "isOsiApproved": true
+        "https://creativecommons.org/licenses/by-nd/3.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Parity-7.0.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-3.0-DE.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Parity-7.0.0.json",
-      "referenceNumber": 152,
-      "name": "The Parity Public License 7.0.0",
-      "licenseId": "Parity-7.0.0",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-ND-3.0-DE",
+      "name": "Creative Commons Attribution No Derivatives 3.0 Germany",
+      "reference": "https://spdx.org/licenses/CC-BY-ND-3.0-DE.html",
+      "referenceNumber": 525,
       "seeAlso": [
-        "https://paritylicense.com/versions/7.0.0.html"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-nd/3.0/de/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-ND-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-4.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-1.0.json",
-      "referenceNumber": 153,
-      "name": "Creative Commons Attribution No Derivatives 1.0 Generic",
-      "licenseId": "CC-BY-ND-1.0",
+      "isFsfLibre": false,
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-ND-4.0",
+      "name": "Creative Commons Attribution No Derivatives 4.0 Internation=
al",
+      "reference": "https://spdx.org/licenses/CC-BY-ND-4.0.html",
+      "referenceNumber": 328,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nd/1.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-nd/4.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/dvipdfm.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/dvipdfm.json",
-      "referenceNumber": 154,
-      "name": "dvipdfm License",
-      "licenseId": "dvipdfm",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-SA-1.0",
+      "name": "Creative Commons Attribution Share Alike 1.0 Generic",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-1.0.html",
+      "referenceNumber": 453,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/dvipdfm"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-sa/1.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CNRI-Python.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CNRI-Python.json",
-      "referenceNumber": 155,
-      "name": "CNRI Python License",
-      "licenseId": "CNRI-Python",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-SA-2.0",
+      "name": "Creative Commons Attribution Share Alike 2.0 Generic",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-2.0.html",
+      "referenceNumber": 174,
       "seeAlso": [
-        "https://opensource.org/licenses/CNRI-Python"
-      ],
-      "isOsiApproved": true
+        "https://creativecommons.org/licenses/by-sa/2.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-4-Clause-UC.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.0-UK.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-4-Clause-UC.json",
-      "referenceNumber": 156,
-      "name": "BSD-4-Clause (University of California-Specific)",
-      "licenseId": "BSD-4-Clause-UC",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-SA-2.0-UK",
+      "name": "Creative Commons Attribution Share Alike 2.0 England and Wa=
les",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-2.0-UK.html",
+      "referenceNumber": 387,
       "seeAlso": [
-        "http://www.freebsd.org/copyright/license.html"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-sa/2.0/uk/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/NLOD-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.1-JP.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NLOD-1.0.json",
-      "referenceNumber": 157,
-      "name": "Norwegian Licence for Open Government Data (NLOD) 1.0",
-      "licenseId": "NLOD-1.0",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-SA-2.1-JP",
+      "name": "Creative Commons Attribution Share Alike 2.1 Japan",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-2.1-JP.html",
+      "referenceNumber": 471,
       "seeAlso": [
-        "http://data.norge.no/nlod/en/1.0"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-sa/2.1/jp/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MS-RL.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.5.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MS-RL.json",
-      "referenceNumber": 158,
-      "name": "Microsoft Reciprocal License",
-      "licenseId": "MS-RL",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-SA-2.5",
+      "name": "Creative Commons Attribution Share Alike 2.5 Generic",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-2.5.html",
+      "referenceNumber": 461,
       "seeAlso": [
-        "http://www.microsoft.com/opensource/licenses.mspx",
-        "https://opensource.org/licenses/MS-RL"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://creativecommons.org/licenses/by-sa/2.5/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-4.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-4.0.json",
-      "referenceNumber": 159,
-      "name": "Creative Commons Attribution Non Commercial Share Alike 4.0=
 International",
-      "licenseId": "CC-BY-NC-SA-4.0",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-SA-3.0",
+      "name": "Creative Commons Attribution Share Alike 3.0 Unported",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0.html",
+      "referenceNumber": 621,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-sa/3.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/HaskellReport.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0-AT.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/HaskellReport.json",
-      "referenceNumber": 160,
-      "name": "Haskell Language Report License",
-      "licenseId": "HaskellReport",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-SA-3.0-AT",
+      "name": "Creative Commons Attribution Share Alike 3.0 Austria",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-AT.html",
+      "referenceNumber": 31,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Haskell_Language_Report_=
License"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-sa/3.0/at/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0-DE.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-1.0.json",
-      "referenceNumber": 161,
-      "name": "Creative Commons Attribution 1.0 Generic",
-      "licenseId": "CC-BY-1.0",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-SA-3.0-DE",
+      "name": "Creative Commons Attribution Share Alike 3.0 Germany",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-DE.html",
+      "referenceNumber": 325,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by/1.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-sa/3.0/de/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/UCL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0-IGO.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/UCL-1.0.json",
-      "referenceNumber": 162,
-      "name": "Upstream Compatibility License v1.0",
-      "licenseId": "UCL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-SA-3.0-IGO",
+      "name": "Creative Commons Attribution-ShareAlike 3.0 IGO",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-IGO.html",
+      "referenceNumber": 20,
       "seeAlso": [
-        "https://opensource.org/licenses/UCL-1.0"
-      ],
-      "isOsiApproved": true
+        "https://creativecommons.org/licenses/by-sa/3.0/igo/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Mup.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-4.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Mup.json",
-      "referenceNumber": 163,
-      "name": "Mup License",
-      "licenseId": "Mup",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "CC-BY-SA-4.0",
+      "name": "Creative Commons Attribution Share Alike 4.0 International",
+      "reference": "https://spdx.org/licenses/CC-BY-SA-4.0.html",
+      "referenceNumber": 155,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Mup"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/by-sa/4.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SMPPL.html",
+      "detailsUrl": "https://spdx.org/licenses/CC-PDDC.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SMPPL.json",
-      "referenceNumber": 164,
-      "name": "Secure Messaging Protocol Public License",
-      "licenseId": "SMPPL",
+      "isOsiApproved": false,
+      "licenseId": "CC-PDDC",
+      "name": "Creative Commons Public Domain Dedication and Certification=
",
+      "reference": "https://spdx.org/licenses/CC-PDDC.html",
+      "referenceNumber": 349,
       "seeAlso": [
-        "https://github.com/dcblake/SMP/blob/master/Documentation/License.=
txt"
-      ],
-      "isOsiApproved": false
+        "https://creativecommons.org/licenses/publicdomain/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/PHP-3.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CC0-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/PHP-3.0.json",
-      "referenceNumber": 165,
-      "name": "PHP License v3.0",
-      "licenseId": "PHP-3.0",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "CC0-1.0",
+      "name": "Creative Commons Zero v1.0 Universal",
+      "reference": "https://spdx.org/licenses/CC0-1.0.html",
+      "referenceNumber": 70,
       "seeAlso": [
-        "http://www.php.net/license/3_0.txt",
-        "https://opensource.org/licenses/PHP-3.0"
-      ],
-      "isOsiApproved": true
+        "https://creativecommons.org/publicdomain/zero/1.0/legalcode"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GL2PS.html",
+      "detailsUrl": "https://spdx.org/licenses/CDDL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GL2PS.json",
-      "referenceNumber": 166,
-      "name": "GL2PS License",
-      "licenseId": "GL2PS",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "CDDL-1.0",
+      "name": "Common Development and Distribution License 1.0",
+      "reference": "https://spdx.org/licenses/CDDL-1.0.html",
+      "referenceNumber": 282,
       "seeAlso": [
-        "http://www.geuz.org/gl2ps/COPYING.GL2PS"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/cddl1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CrystalStacker.html",
+      "detailsUrl": "https://spdx.org/licenses/CDDL-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CrystalStacker.json",
-      "referenceNumber": 167,
-      "name": "CrystalStacker License",
-      "licenseId": "CrystalStacker",
+      "isOsiApproved": false,
+      "licenseId": "CDDL-1.1",
+      "name": "Common Development and Distribution License 1.1",
+      "reference": "https://spdx.org/licenses/CDDL-1.1.html",
+      "referenceNumber": 130,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing:CrystalStacker?rd\u003dL=
icensing/CrystalStacker"
-      ],
-      "isOsiApproved": false
+        "http://glassfish.java.net/public/CDDL+GPL_1_1.html",
+        "https://javaee.github.io/glassfish/LICENSE"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/W3C-20150513.html",
+      "detailsUrl": "https://spdx.org/licenses/CDL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/W3C-20150513.json",
-      "referenceNumber": 168,
-      "name": "W3C Software Notice and Document License (2015-05-13)",
-      "licenseId": "W3C-20150513",
+      "isOsiApproved": false,
+      "licenseId": "CDL-1.0",
+      "name": "Common Documentation License 1.0",
+      "reference": "https://spdx.org/licenses/CDL-1.0.html",
+      "referenceNumber": 592,
       "seeAlso": [
-        "https://www.w3.org/Consortium/Legal/2015/copyright-software-and-d=
ocument"
-      ],
-      "isOsiApproved": false
+        "http://www.opensource.apple.com/cdl/",
+        "https://fedoraproject.org/wiki/Licensing/Common_Documentation_Lic=
ense",
+        "https://www.gnu.org/licenses/license-list.html#ACDL"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/NIST-PD-fallback.html",
+      "detailsUrl": "https://spdx.org/licenses/CDLA-Permissive-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NIST-PD-fallback.json",
-      "referenceNumber": 169,
-      "name": "NIST Public Domain Notice with license fallback",
-      "licenseId": "NIST-PD-fallback",
+      "isOsiApproved": false,
+      "licenseId": "CDLA-Permissive-1.0",
+      "name": "Community Data License Agreement Permissive 1.0",
+      "reference": "https://spdx.org/licenses/CDLA-Permissive-1.0.html",
+      "referenceNumber": 551,
       "seeAlso": [
-        "https://github.com/usnistgov/jsip/blob/59700e6926cbe96c5cdae897d9=
a7d2656b42abe3/LICENSE",
-        "https://github.com/usnistgov/fipy/blob/86aaa5c2ba2c6f1be19593c598=
6071cf6568cc34/LICENSE.rst"
-      ],
-      "isOsiApproved": false
+        "https://cdla.io/permissive-1-0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OGL-UK-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CDLA-Permissive-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OGL-UK-1.0.json",
-      "referenceNumber": 170,
-      "name": "Open Government Licence v1.0",
-      "licenseId": "OGL-UK-1.0",
+      "isOsiApproved": false,
+      "licenseId": "CDLA-Permissive-2.0",
+      "name": "Community Data License Agreement Permissive 2.0",
+      "reference": "https://spdx.org/licenses/CDLA-Permissive-2.0.html",
+      "referenceNumber": 319,
       "seeAlso": [
-        "http://www.nationalarchives.gov.uk/doc/open-government-licence/ve=
rsion/1/"
-      ],
-      "isOsiApproved": false
+        "https://cdla.dev/permissive-2-0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CPL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CDLA-Sharing-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CPL-1.0.json",
-      "referenceNumber": 171,
-      "name": "Common Public License 1.0",
-      "licenseId": "CPL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "CDLA-Sharing-1.0",
+      "name": "Community Data License Agreement Sharing 1.0",
+      "reference": "https://spdx.org/licenses/CDLA-Sharing-1.0.html",
+      "referenceNumber": 445,
       "seeAlso": [
-        "https://opensource.org/licenses/CPL-1.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://cdla.io/sharing-1-0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LGPL-2.1-only.html",
+      "detailsUrl": "https://spdx.org/licenses/CECILL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1-only.json",
-      "referenceNumber": 172,
-      "name": "GNU Lesser General Public License v2.1 only",
-      "licenseId": "LGPL-2.1-only",
+      "isOsiApproved": false,
+      "licenseId": "CECILL-1.0",
+      "name": "CeCILL Free Software License Agreement v1.0",
+      "reference": "https://spdx.org/licenses/CECILL-1.0.html",
+      "referenceNumber": 219,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.htm=
l",
-        "https://opensource.org/licenses/LGPL-2.1"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "http://www.cecill.info/licences/Licence_CeCILL_V1-fr.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/ZPL-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CECILL-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/ZPL-2.0.json",
-      "referenceNumber": 173,
-      "name": "Zope Public License 2.0",
-      "licenseId": "ZPL-2.0",
+      "isOsiApproved": false,
+      "licenseId": "CECILL-1.1",
+      "name": "CeCILL Free Software License Agreement v1.1",
+      "reference": "https://spdx.org/licenses/CECILL-1.1.html",
+      "referenceNumber": 38,
       "seeAlso": [
-        "http://old.zope.org/Resources/License/ZPL-2.0",
-        "https://opensource.org/licenses/ZPL-2.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "http://www.cecill.info/licences/Licence_CeCILL_V1.1-US.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Frameworx-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CECILL-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Frameworx-1.0.json",
-      "referenceNumber": 174,
-      "name": "Frameworx Open License 1.0",
-      "licenseId": "Frameworx-1.0",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "CECILL-2.0",
+      "name": "CeCILL Free Software License Agreement v2.0",
+      "reference": "https://spdx.org/licenses/CECILL-2.0.html",
+      "referenceNumber": 73,
       "seeAlso": [
-        "https://opensource.org/licenses/Frameworx-1.0"
-      ],
-      "isOsiApproved": true
+        "http://www.cecill.info/licences/Licence_CeCILL_V2-en.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/AGPL-3.0-only.html",
+      "detailsUrl": "https://spdx.org/licenses/CECILL-2.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/AGPL-3.0-only.json",
-      "referenceNumber": 175,
-      "name": "GNU Affero General Public License v3.0 only",
-      "licenseId": "AGPL-3.0-only",
-      "seeAlso": [
-        "https://www.gnu.org/licenses/agpl.txt",
-        "https://opensource.org/licenses/AGPL-3.0"
-      ],
       "isOsiApproved": true,
-      "isFsfLibre": true
+      "licenseId": "CECILL-2.1",
+      "name": "CeCILL Free Software License Agreement v2.1",
+      "reference": "https://spdx.org/licenses/CECILL-2.1.html",
+      "referenceNumber": 393,
+      "seeAlso": [
+        "http://www.cecill.info/licences/Licence_CeCILL_V2.1-en.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/DRL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CECILL-B.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/DRL-1.0.json",
-      "referenceNumber": 176,
-      "name": "Detection Rule License 1.0",
-      "licenseId": "DRL-1.0",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "CECILL-B",
+      "name": "CeCILL-B Free Software License Agreement",
+      "reference": "https://spdx.org/licenses/CECILL-B.html",
+      "referenceNumber": 354,
       "seeAlso": [
-        "https://github.com/Neo23x0/sigma/blob/master/LICENSE.Detection.Ru=
les.md"
-      ],
-      "isOsiApproved": false
+        "http://www.cecill.info/licences/Licence_CeCILL-B_V1-en.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/EFL-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CECILL-C.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/EFL-2.0.json",
-      "referenceNumber": 177,
-      "name": "Eiffel Forum License v2.0",
-      "licenseId": "EFL-2.0",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "CECILL-C",
+      "name": "CeCILL-C Free Software License Agreement",
+      "reference": "https://spdx.org/licenses/CECILL-C.html",
+      "referenceNumber": 271,
       "seeAlso": [
-        "http://www.eiffel-nice.org/license/eiffel-forum-license-2.html",
-        "https://opensource.org/licenses/EFL-2.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "http://www.cecill.info/licences/Licence_CeCILL-C_V1-en.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Spencer-99.html",
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Spencer-99.json",
-      "referenceNumber": 178,
-      "name": "Spencer License 99",
-      "licenseId": "Spencer-99",
+      "isOsiApproved": false,
+      "licenseId": "CERN-OHL-1.1",
+      "name": "CERN Open Hardware Licence v1.1",
+      "reference": "https://spdx.org/licenses/CERN-OHL-1.1.html",
+      "referenceNumber": 32,
       "seeAlso": [
-        "http://www.opensource.apple.com/source/tcl/tcl-5/tcl/generic/regf=
ronts.c"
-      ],
-      "isOsiApproved": false
+        "https://www.ohwr.org/project/licenses/wikis/cern-ohl-v1.1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CAL-1.0-Combined-Work-Except=
ion.html",
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-1.2.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CAL-1.0-Combined-Work-Excep=
tion.json",
-      "referenceNumber": 179,
-      "name": "Cryptographic Autonomy License 1.0 (Combined Work Exception=
)",
-      "licenseId": "CAL-1.0-Combined-Work-Exception",
+      "isOsiApproved": false,
+      "licenseId": "CERN-OHL-1.2",
+      "name": "CERN Open Hardware Licence v1.2",
+      "reference": "https://spdx.org/licenses/CERN-OHL-1.2.html",
+      "referenceNumber": 95,
       "seeAlso": [
-        "http://cryptographicautonomylicense.com/license-text.html",
-        "https://opensource.org/licenses/CAL-1.0"
-      ],
-      "isOsiApproved": true
+        "https://www.ohwr.org/project/licenses/wikis/cern-ohl-v1.2"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.1-invariants-only.htm=
l",
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-P-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-invariants-only.js=
on",
-      "referenceNumber": 180,
-      "name": "GNU Free Documentation License v1.1 only - invariants",
-      "licenseId": "GFDL-1.1-invariants-only",
+      "isOsiApproved": true,
+      "licenseId": "CERN-OHL-P-2.0",
+      "name": "CERN Open Hardware Licence Version 2 - Permissive",
+      "reference": "https://spdx.org/licenses/CERN-OHL-P-2.0.html",
+      "referenceNumber": 198,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
-      ],
-      "isOsiApproved": false
+        "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-ver=
sion-2"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/TCL.html",
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-S-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/TCL.json",
-      "referenceNumber": 181,
-      "name": "TCL/TK License",
-      "licenseId": "TCL",
+      "isOsiApproved": true,
+      "licenseId": "CERN-OHL-S-2.0",
+      "name": "CERN Open Hardware Licence Version 2 - Strongly Reciprocal",
+      "reference": "https://spdx.org/licenses/CERN-OHL-S-2.0.html",
+      "referenceNumber": 370,
       "seeAlso": [
-        "http://www.tcl.tk/software/tcltk/license.html",
-        "https://fedoraproject.org/wiki/Licensing/TCL"
-      ],
-      "isOsiApproved": false
+        "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-ver=
sion-2"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SHL-0.5.html",
+      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-W-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SHL-0.5.json",
-      "referenceNumber": 182,
-      "name": "Solderpad Hardware License v0.5",
-      "licenseId": "SHL-0.5",
+      "isOsiApproved": true,
+      "licenseId": "CERN-OHL-W-2.0",
+      "name": "CERN Open Hardware Licence Version 2 - Weakly Reciprocal",
+      "reference": "https://spdx.org/licenses/CERN-OHL-W-2.0.html",
+      "referenceNumber": 82,
       "seeAlso": [
-        "https://solderpad.org/licenses/SHL-0.5/"
-      ],
-      "isOsiApproved": false
+        "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-ver=
sion-2"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OFL-1.0-RFN.html",
+      "detailsUrl": "https://spdx.org/licenses/CFITSIO.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OFL-1.0-RFN.json",
-      "referenceNumber": 183,
-      "name": "SIL Open Font License 1.0 with Reserved Font Name",
-      "licenseId": "OFL-1.0-RFN",
+      "isOsiApproved": false,
+      "licenseId": "CFITSIO",
+      "name": "CFITSIO License",
+      "reference": "https://spdx.org/licenses/CFITSIO.html",
+      "referenceNumber": 96,
       "seeAlso": [
-        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL10_we=
b"
-      ],
-      "isOsiApproved": false
+        "https://heasarc.gsfc.nasa.gov/docs/software/fitsio/c/f_user/node9=
.html",
+        "https://heasarc.gsfc.nasa.gov/docs/software/ftools/fv/doc/license=
.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LGPL-2.0.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0.json",
-      "referenceNumber": 184,
-      "name": "GNU Library General Public License v2 only",
-      "licenseId": "LGPL-2.0",
+      "detailsUrl": "https://spdx.org/licenses/check-cvs.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "check-cvs",
+      "name": "check-cvs License",
+      "reference": "https://spdx.org/licenses/check-cvs.html",
+      "referenceNumber": 521,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.htm=
l"
-      ],
-      "isOsiApproved": true
+        "http://cvs.savannah.gnu.org/viewvc/cvs/ccvs/contrib/check_cvs.in?=
revision=3D1.1.4.3&view=3Dmarkup&pathrev=3Dcvs1-11-23#l2"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CERN-OHL-W-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/checkmk.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-W-2.0.json",
-      "referenceNumber": 185,
-      "name": "CERN Open Hardware Licence Version 2 - Weakly Reciprocal",
-      "licenseId": "CERN-OHL-W-2.0",
+      "isOsiApproved": false,
+      "licenseId": "checkmk",
+      "name": "Checkmk License",
+      "reference": "https://spdx.org/licenses/checkmk.html",
+      "referenceNumber": 272,
       "seeAlso": [
-        "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-ver=
sion-2"
-      ],
-      "isOsiApproved": true
+        "https://github.com/libcheck/check/blob/master/checkmk/checkmk.in"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Glide.html",
+      "detailsUrl": "https://spdx.org/licenses/ClArtistic.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Glide.json",
-      "referenceNumber": 186,
-      "name": "3dfx Glide License",
-      "licenseId": "Glide",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "ClArtistic",
+      "name": "Clarified Artistic License",
+      "reference": "https://spdx.org/licenses/ClArtistic.html",
+      "referenceNumber": 66,
       "seeAlso": [
-        "http://www.users.on.net/~triforce/glidexp/COPYING.txt"
-      ],
-      "isOsiApproved": false
+        "http://gianluca.dellavedova.org/2011/01/03/clarified-artistic-lic=
ense/",
+        "http://www.ncftp.com/ncftp/doc/LICENSE.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/mpich2.html",
+      "detailsUrl": "https://spdx.org/licenses/Clips.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/mpich2.json",
-      "referenceNumber": 187,
-      "name": "mpich2 License",
-      "licenseId": "mpich2",
+      "isOsiApproved": false,
+      "licenseId": "Clips",
+      "name": "Clips License",
+      "reference": "https://spdx.org/licenses/Clips.html",
+      "referenceNumber": 450,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/MIT"
-      ],
-      "isOsiApproved": false
+        "https://github.com/DrItanium/maya/blob/master/LICENSE.CLIPS"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/psutils.html",
+      "detailsUrl": "https://spdx.org/licenses/CMU-Mach.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/psutils.json",
-      "referenceNumber": 188,
-      "name": "psutils License",
-      "licenseId": "psutils",
+      "isOsiApproved": false,
+      "licenseId": "CMU-Mach",
+      "name": "CMU Mach License",
+      "reference": "https://spdx.org/licenses/CMU-Mach.html",
+      "referenceNumber": 410,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/psutils"
-      ],
-      "isOsiApproved": false
+        "https://www.cs.cmu.edu/~410/licenses.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SPL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CMU-Mach-nodoc.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SPL-1.0.json",
-      "referenceNumber": 189,
-      "name": "Sun Public License v1.0",
-      "licenseId": "SPL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "CMU-Mach-nodoc",
+      "name": "CMU    Mach - no notices-in-documentation variant",
+      "reference": "https://spdx.org/licenses/CMU-Mach-nodoc.html",
+      "referenceNumber": 111,
       "seeAlso": [
-        "https://opensource.org/licenses/SPL-1.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L718-L=
728",
+        "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Apache-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/CNRI-Jython.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Apache-1.1.json",
-      "referenceNumber": 190,
-      "name": "Apache License 1.1",
-      "licenseId": "Apache-1.1",
+      "isOsiApproved": false,
+      "licenseId": "CNRI-Jython",
+      "name": "CNRI Jython License",
+      "reference": "https://spdx.org/licenses/CNRI-Jython.html",
+      "referenceNumber": 509,
       "seeAlso": [
-        "http://apache.org/licenses/LICENSE-1.1",
-        "https://opensource.org/licenses/Apache-1.1"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "http://www.jython.org/license.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-ND-4.0.html",
+      "detailsUrl": "https://spdx.org/licenses/CNRI-Python.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-4.0.json",
-      "referenceNumber": 191,
-      "name": "Creative Commons Attribution No Derivatives 4.0 Internation=
al",
-      "licenseId": "CC-BY-ND-4.0",
+      "isOsiApproved": true,
+      "licenseId": "CNRI-Python",
+      "name": "CNRI Python License",
+      "reference": "https://spdx.org/licenses/CNRI-Python.html",
+      "referenceNumber": 611,
+      "seeAlso": [
+        "https://opensource.org/licenses/CNRI-Python"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/CNRI-Python-GPL-Compatible.=
json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "CNRI-Python-GPL-Compatible",
+      "name": "CNRI Python Open Source GPL Compatible License Agreement",
+      "reference": "https://spdx.org/licenses/CNRI-Python-GPL-Compatible.h=
tml",
+      "referenceNumber": 504,
+      "seeAlso": [
+        "http://www.python.org/download/releases/1.6.1/download_win/"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/COIL-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "COIL-1.0",
+      "name": "Copyfree Open Innovation License",
+      "reference": "https://spdx.org/licenses/COIL-1.0.html",
+      "referenceNumber": 286,
+      "seeAlso": [
+        "https://coil.apotheon.org/plaintext/01.0.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Community-Spec-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Community-Spec-1.0",
+      "name": "Community Specification License 1.0",
+      "reference": "https://spdx.org/licenses/Community-Spec-1.0.html",
+      "referenceNumber": 631,
+      "seeAlso": [
+        "https://github.com/CommunitySpecification/1.0/blob/master/1._Comm=
unity_Specification_License-v1.md"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Condor-1.1.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "Condor-1.1",
+      "name": "Condor Public License v1.1",
+      "reference": "https://spdx.org/licenses/Condor-1.1.html",
+      "referenceNumber": 251,
+      "seeAlso": [
+        "http://research.cs.wisc.edu/condor/license.html#condor",
+        "http://web.archive.org/web/20111123062036/http://research.cs.wisc=
.edu/condor/license.html#condor"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/copyleft-next-0.3.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "copyleft-next-0.3.0",
+      "name": "copyleft-next 0.3.0",
+      "reference": "https://spdx.org/licenses/copyleft-next-0.3.0.html",
+      "referenceNumber": 421,
+      "seeAlso": [
+        "https://github.com/copyleft-next/copyleft-next/blob/master/Releas=
es/copyleft-next-0.3.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/copyleft-next-0.3.1.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "copyleft-next-0.3.1",
+      "name": "copyleft-next 0.3.1",
+      "reference": "https://spdx.org/licenses/copyleft-next-0.3.1.html",
+      "referenceNumber": 119,
+      "seeAlso": [
+        "https://github.com/copyleft-next/copyleft-next/blob/master/Releas=
es/copyleft-next-0.3.1"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Cornell-Lossless-JPEG.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Cornell-Lossless-JPEG",
+      "name": "Cornell Lossless JPEG License",
+      "reference": "https://spdx.org/licenses/Cornell-Lossless-JPEG.html",
+      "referenceNumber": 632,
+      "seeAlso": [
+        "https://android.googlesource.com/platform/external/dng_sdk/+/refs=
/heads/master/source/dng_lossless_jpeg.cpp#16",
+        "https://www.mssl.ucl.ac.uk/~mcrw/src/20050920/proto.h",
+        "https://gitlab.freedesktop.org/libopenraw/libopenraw/blob/master/=
lib/ljpegdecompressor.cpp#L32"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/CPAL-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "CPAL-1.0",
+      "name": "Common Public Attribution License 1.0",
+      "reference": "https://spdx.org/licenses/CPAL-1.0.html",
+      "referenceNumber": 315,
+      "seeAlso": [
+        "https://opensource.org/licenses/CPAL-1.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/CPL-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "CPL-1.0",
+      "name": "Common Public License 1.0",
+      "reference": "https://spdx.org/licenses/CPL-1.0.html",
+      "referenceNumber": 135,
+      "seeAlso": [
+        "https://opensource.org/licenses/CPL-1.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/CPOL-1.02.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": false,
+      "isOsiApproved": false,
+      "licenseId": "CPOL-1.02",
+      "name": "Code Project Open License 1.02",
+      "reference": "https://spdx.org/licenses/CPOL-1.02.html",
+      "referenceNumber": 479,
+      "seeAlso": [
+        "http://www.codeproject.com/info/cpol10.aspx"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Cronyx.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Cronyx",
+      "name": "Cronyx License",
+      "reference": "https://spdx.org/licenses/Cronyx.html",
+      "referenceNumber": 377,
+      "seeAlso": [
+        "https://gitlab.freedesktop.org/xorg/font/alias/-/blob/master/COPY=
ING",
+        "https://gitlab.freedesktop.org/xorg/font/cronyx-cyrillic/-/blob/m=
aster/COPYING",
+        "https://gitlab.freedesktop.org/xorg/font/misc-cyrillic/-/blob/mas=
ter/COPYING",
+        "https://gitlab.freedesktop.org/xorg/font/screen-cyrillic/-/blob/m=
aster/COPYING"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Crossword.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Crossword",
+      "name": "Crossword License",
+      "reference": "https://spdx.org/licenses/Crossword.html",
+      "referenceNumber": 340,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Crossword"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/CrystalStacker.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "CrystalStacker",
+      "name": "CrystalStacker License",
+      "reference": "https://spdx.org/licenses/CrystalStacker.html",
+      "referenceNumber": 593,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing:CrystalStacker?rd=3DLice=
nsing/CrystalStacker"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/CUA-OPL-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": true,
+      "licenseId": "CUA-OPL-1.0",
+      "name": "CUA Office Public License v1.0",
+      "reference": "https://spdx.org/licenses/CUA-OPL-1.0.html",
+      "referenceNumber": 553,
+      "seeAlso": [
+        "https://opensource.org/licenses/CUA-OPL-1.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Cube.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Cube",
+      "name": "Cube License",
+      "reference": "https://spdx.org/licenses/Cube.html",
+      "referenceNumber": 404,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Cube"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/curl.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "curl",
+      "name": "curl License",
+      "reference": "https://spdx.org/licenses/curl.html",
+      "referenceNumber": 604,
+      "seeAlso": [
+        "https://github.com/bagder/curl/blob/master/COPYING"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/cve-tou.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "cve-tou",
+      "name": "Common Vulnerability Enumeration ToU License",
+      "reference": "https://spdx.org/licenses/cve-tou.html",
+      "referenceNumber": 306,
+      "seeAlso": [
+        "https://www.cve.org/Legal/TermsOfUse"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/D-FSL-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "D-FSL-1.0",
+      "name": "Deutsche Freie Software Lizenz",
+      "reference": "https://spdx.org/licenses/D-FSL-1.0.html",
+      "referenceNumber": 154,
+      "seeAlso": [
+        "http://www.dipp.nrw.de/d-fsl/lizenzen/",
+        "http://www.dipp.nrw.de/d-fsl/index_html/lizenzen/de/D-FSL-1_0_de.=
txt",
+        "http://www.dipp.nrw.de/d-fsl/index_html/lizenzen/en/D-FSL-1_0_en.=
txt",
+        "https://www.hbz-nrw.de/produkte/open-access/lizenzen/dfsl",
+        "https://www.hbz-nrw.de/produkte/open-access/lizenzen/dfsl/deutsch=
e-freie-software-lizenz",
+        "https://www.hbz-nrw.de/produkte/open-access/lizenzen/dfsl/german-=
free-software-license",
+        "https://www.hbz-nrw.de/produkte/open-access/lizenzen/dfsl/D-FSL-1=
_0_de.txt/at_download/file",
+        "https://www.hbz-nrw.de/produkte/open-access/lizenzen/dfsl/D-FSL-1=
_0_en.txt/at_download/file"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/DEC-3-Clause.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "DEC-3-Clause",
+      "name": "DEC 3-Clause License",
+      "reference": "https://spdx.org/licenses/DEC-3-Clause.html",
+      "referenceNumber": 15,
+      "seeAlso": [
+        "https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/COPYING=
?ref_type=3Dheads#L239"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/diffmark.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "diffmark",
+      "name": "diffmark license",
+      "reference": "https://spdx.org/licenses/diffmark.html",
+      "referenceNumber": 292,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/diffmark"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/DL-DE-BY-2.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "DL-DE-BY-2.0",
+      "name": "Data licence Germany \u2013 attribution \u2013 version 2.0",
+      "reference": "https://spdx.org/licenses/DL-DE-BY-2.0.html",
+      "referenceNumber": 225,
+      "seeAlso": [
+        "https://www.govdata.de/dl-de/by-2-0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/DL-DE-ZERO-2.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "DL-DE-ZERO-2.0",
+      "name": "Data licence Germany \u2013 zero \u2013 version 2.0",
+      "reference": "https://spdx.org/licenses/DL-DE-ZERO-2.0.html",
+      "referenceNumber": 341,
+      "seeAlso": [
+        "https://www.govdata.de/dl-de/zero-2-0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/DOC.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "DOC",
+      "name": "DOC License",
+      "reference": "https://spdx.org/licenses/DOC.html",
+      "referenceNumber": 397,
+      "seeAlso": [
+        "http://www.cs.wustl.edu/~schmidt/ACE-copying.html",
+        "https://www.dre.vanderbilt.edu/~schmidt/ACE-copying.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Dotseqn.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Dotseqn",
+      "name": "Dotseqn License",
+      "reference": "https://spdx.org/licenses/Dotseqn.html",
+      "referenceNumber": 132,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Dotseqn"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/DRL-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "DRL-1.0",
+      "name": "Detection Rule License 1.0",
+      "reference": "https://spdx.org/licenses/DRL-1.0.html",
+      "referenceNumber": 16,
+      "seeAlso": [
+        "https://github.com/Neo23x0/sigma/blob/master/LICENSE.Detection.Ru=
les.md"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/DRL-1.1.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "DRL-1.1",
+      "name": "Detection Rule License 1.1",
+      "reference": "https://spdx.org/licenses/DRL-1.1.html",
+      "referenceNumber": 278,
+      "seeAlso": [
+        "https://github.com/SigmaHQ/Detection-Rule-License/blob/6ec7fbde61=
01d101b5b5d1fcb8f9b69fbc76c04a/LICENSE.Detection.Rules.md"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/DSDP.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "DSDP",
+      "name": "DSDP License",
+      "reference": "https://spdx.org/licenses/DSDP.html",
+      "referenceNumber": 485,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/DSDP"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/dtoa.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "dtoa",
+      "name": "David M. Gay dtoa License",
+      "reference": "https://spdx.org/licenses/dtoa.html",
+      "referenceNumber": 358,
+      "seeAlso": [
+        "https://github.com/SWI-Prolog/swipl-devel/blob/master/src/os/dtoa=
.c",
+        "https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3Dne=
wlib/libc/stdlib/mprec.h;hb=3DHEAD"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/dvipdfm.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "dvipdfm",
+      "name": "dvipdfm License",
+      "reference": "https://spdx.org/licenses/dvipdfm.html",
+      "referenceNumber": 100,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/dvipdfm"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/ECL-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": true,
+      "licenseId": "ECL-1.0",
+      "name": "Educational Community License v1.0",
+      "reference": "https://spdx.org/licenses/ECL-1.0.html",
+      "referenceNumber": 124,
+      "seeAlso": [
+        "https://opensource.org/licenses/ECL-1.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/ECL-2.0.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "ECL-2.0",
+      "name": "Educational Community License v2.0",
+      "reference": "https://spdx.org/licenses/ECL-2.0.html",
+      "referenceNumber": 361,
+      "seeAlso": [
+        "https://opensource.org/licenses/ECL-2.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/eCos-2.0.json",
+      "isDeprecatedLicenseId": true,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "eCos-2.0",
+      "name": "eCos license version 2.0",
+      "reference": "https://spdx.org/licenses/eCos-2.0.html",
+      "referenceNumber": 372,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/ecos-license.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/EFL-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": true,
+      "licenseId": "EFL-1.0",
+      "name": "Eiffel Forum License v1.0",
+      "reference": "https://spdx.org/licenses/EFL-1.0.html",
+      "referenceNumber": 335,
+      "seeAlso": [
+        "http://www.eiffel-nice.org/license/forum.txt",
+        "https://opensource.org/licenses/EFL-1.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/EFL-2.0.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "EFL-2.0",
+      "name": "Eiffel Forum License v2.0",
+      "reference": "https://spdx.org/licenses/EFL-2.0.html",
+      "referenceNumber": 88,
+      "seeAlso": [
+        "http://www.eiffel-nice.org/license/eiffel-forum-license-2.html",
+        "https://opensource.org/licenses/EFL-2.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/eGenix.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "eGenix",
+      "name": "eGenix.com Public License 1.1.0",
+      "reference": "https://spdx.org/licenses/eGenix.html",
+      "referenceNumber": 261,
+      "seeAlso": [
+        "http://www.egenix.com/products/eGenix.com-Public-License-1.1.0.pd=
f",
+        "https://fedoraproject.org/wiki/Licensing/eGenix.com_Public_Licens=
e_1.1.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Elastic-2.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Elastic-2.0",
+      "name": "Elastic License 2.0",
+      "reference": "https://spdx.org/licenses/Elastic-2.0.html",
+      "referenceNumber": 147,
+      "seeAlso": [
+        "https://www.elastic.co/licensing/elastic-license",
+        "https://github.com/elastic/elasticsearch/blob/master/licenses/ELA=
STIC-LICENSE-2.0.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Entessa.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": true,
+      "licenseId": "Entessa",
+      "name": "Entessa Public License v1.0",
+      "reference": "https://spdx.org/licenses/Entessa.html",
+      "referenceNumber": 546,
+      "seeAlso": [
+        "https://opensource.org/licenses/Entessa"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/EPICS.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "EPICS",
+      "name": "EPICS Open License",
+      "reference": "https://spdx.org/licenses/EPICS.html",
+      "referenceNumber": 120,
+      "seeAlso": [
+        "https://epics.anl.gov/license/open.php"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/EPL-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "EPL-1.0",
+      "name": "Eclipse Public License 1.0",
+      "reference": "https://spdx.org/licenses/EPL-1.0.html",
+      "referenceNumber": 500,
+      "seeAlso": [
+        "http://www.eclipse.org/legal/epl-v10.html",
+        "https://opensource.org/licenses/EPL-1.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/EPL-2.0.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "EPL-2.0",
+      "name": "Eclipse Public License 2.0",
+      "reference": "https://spdx.org/licenses/EPL-2.0.html",
+      "referenceNumber": 407,
+      "seeAlso": [
+        "https://www.eclipse.org/legal/epl-2.0",
+        "https://www.opensource.org/licenses/EPL-2.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/ErlPL-1.1.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "ErlPL-1.1",
+      "name": "Erlang Public License v1.1",
+      "reference": "https://spdx.org/licenses/ErlPL-1.1.html",
+      "referenceNumber": 466,
+      "seeAlso": [
+        "http://www.erlang.org/EPLICENSE"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/etalab-2.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "etalab-2.0",
+      "name": "Etalab Open License 2.0",
+      "reference": "https://spdx.org/licenses/etalab-2.0.html",
+      "referenceNumber": 636,
+      "seeAlso": [
+        "https://github.com/DISIC/politique-de-contribution-open-source/bl=
ob/master/LICENSE.pdf",
+        "https://raw.githubusercontent.com/DISIC/politique-de-contribution=
-open-source/master/LICENSE"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/EUDatagrid.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "EUDatagrid",
+      "name": "EU DataGrid Software License",
+      "reference": "https://spdx.org/licenses/EUDatagrid.html",
+      "referenceNumber": 228,
+      "seeAlso": [
+        "http://eu-datagrid.web.cern.ch/eu-datagrid/license.html",
+        "https://opensource.org/licenses/EUDatagrid"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/EUPL-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "EUPL-1.0",
+      "name": "European Union Public License 1.0",
+      "reference": "https://spdx.org/licenses/EUPL-1.0.html",
+      "referenceNumber": 227,
+      "seeAlso": [
+        "http://ec.europa.eu/idabc/en/document/7330.html",
+        "http://ec.europa.eu/idabc/servlets/Doc027f.pdf?id=3D31096"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/EUPL-1.1.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "EUPL-1.1",
+      "name": "European Union Public License 1.1",
+      "reference": "https://spdx.org/licenses/EUPL-1.1.html",
+      "referenceNumber": 266,
+      "seeAlso": [
+        "https://joinup.ec.europa.eu/software/page/eupl/licence-eupl",
+        "https://joinup.ec.europa.eu/sites/default/files/custom-page/attac=
hment/eupl1.1.-licence-en_0.pdf",
+        "https://opensource.org/licenses/EUPL-1.1"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/EUPL-1.2.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "EUPL-1.2",
+      "name": "European Union Public License 1.2",
+      "reference": "https://spdx.org/licenses/EUPL-1.2.html",
+      "referenceNumber": 559,
+      "seeAlso": [
+        "https://joinup.ec.europa.eu/page/eupl-text-11-12",
+        "https://joinup.ec.europa.eu/sites/default/files/custom-page/attac=
hment/eupl_v1.2_en.pdf",
+        "https://joinup.ec.europa.eu/sites/default/files/custom-page/attac=
hment/2020-03/EUPL-1.2%20EN.txt",
+        "https://joinup.ec.europa.eu/sites/default/files/inline-files/EUPL=
%20v1_2%20EN(1).txt",
+        "http://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=3DCELEX:3=
2017D0863",
+        "https://opensource.org/licenses/EUPL-1.2"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Eurosym.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Eurosym",
+      "name": "Eurosym License",
+      "reference": "https://spdx.org/licenses/Eurosym.html",
+      "referenceNumber": 63,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Eurosym"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Fair.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": true,
+      "licenseId": "Fair",
+      "name": "Fair License",
+      "reference": "https://spdx.org/licenses/Fair.html",
+      "referenceNumber": 570,
+      "seeAlso": [
+        "https://web.archive.org/web/20150926120323/http://fairlicense.org=
/",
+        "https://opensource.org/licenses/Fair"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/FBM.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "FBM",
+      "name": "Fuzzy Bitmap License",
+      "reference": "https://spdx.org/licenses/FBM.html",
+      "referenceNumber": 175,
+      "seeAlso": [
+        "https://github.com/SWI-Prolog/packages-xpce/blob/161a40cd82004f73=
1ba48024f9d30af388a7edf5/src/img/gifwrite.c#L21-L26"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/FDK-AAC.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "FDK-AAC",
+      "name": "Fraunhofer FDK AAC Codec Library",
+      "reference": "https://spdx.org/licenses/FDK-AAC.html",
+      "referenceNumber": 49,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/FDK-AAC",
+        "https://directory.fsf.org/wiki/License:Fdk"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Ferguson-Twofish.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Ferguson-Twofish",
+      "name": "Ferguson Twofish License",
+      "reference": "https://spdx.org/licenses/Ferguson-Twofish.html",
+      "referenceNumber": 617,
+      "seeAlso": [
+        "https://github.com/wernerd/ZRTPCPP/blob/6b3cd8e6783642292bad0c21e=
3e5e5ce45ff3e03/cryptcommon/twofish.c#L113C3-L127"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Frameworx-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": true,
+      "licenseId": "Frameworx-1.0",
+      "name": "Frameworx Open License 1.0",
+      "reference": "https://spdx.org/licenses/Frameworx-1.0.html",
+      "referenceNumber": 259,
+      "seeAlso": [
+        "https://opensource.org/licenses/Frameworx-1.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/FreeBSD-DOC.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "FreeBSD-DOC",
+      "name": "FreeBSD Documentation License",
+      "reference": "https://spdx.org/licenses/FreeBSD-DOC.html",
+      "referenceNumber": 333,
+      "seeAlso": [
+        "https://www.freebsd.org/copyright/freebsd-doc-license/"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/FreeImage.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "FreeImage",
+      "name": "FreeImage Public License v1.0",
+      "reference": "https://spdx.org/licenses/FreeImage.html",
+      "referenceNumber": 181,
+      "seeAlso": [
+        "http://freeimage.sourceforge.net/freeimage-license.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/FSFAP.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "FSFAP",
+      "name": "FSF All Permissive License",
+      "reference": "https://spdx.org/licenses/FSFAP.html",
+      "referenceNumber": 36,
+      "seeAlso": [
+        "https://www.gnu.org/prep/maintain/html_node/License-Notices-for-O=
ther-Files.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/FSFAP-no-warranty-disclaime=
r.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "FSFAP-no-warranty-disclaimer",
+      "name": "FSF All Permissive License (without Warranty)",
+      "reference": "https://spdx.org/licenses/FSFAP-no-warranty-disclaimer=
.html",
+      "referenceNumber": 536,
+      "seeAlso": [
+        "https://git.savannah.gnu.org/cgit/wget.git/tree/util/trunc.c?h=3D=
v1.21.3&id=3D40747a11e44ced5a8ac628a41f879ced3e2ebce9#n6"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/FSFUL.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "FSFUL",
+      "name": "FSF Unlimited License",
+      "reference": "https://spdx.org/licenses/FSFUL.html",
+      "referenceNumber": 454,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/FSF_Unlimited_License"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/FSFULLR.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "FSFULLR",
+      "name": "FSF Unlimited License (with License Retention)",
+      "reference": "https://spdx.org/licenses/FSFULLR.html",
+      "referenceNumber": 422,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/FSF_Unlimited_License#Li=
cense_Retention_Variant"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/FSFULLRWD.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "FSFULLRWD",
+      "name": "FSF Unlimited License (With License Retention and Warranty =
Disclaimer)",
+      "reference": "https://spdx.org/licenses/FSFULLRWD.html",
+      "referenceNumber": 197,
+      "seeAlso": [
+        "https://lists.gnu.org/archive/html/autoconf/2012-04/msg00061.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/FTL.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "FTL",
+      "name": "Freetype Project License",
+      "reference": "https://spdx.org/licenses/FTL.html",
+      "referenceNumber": 438,
+      "seeAlso": [
+        "http://freetype.fis.uniroma2.it/FTL.TXT",
+        "http://git.savannah.gnu.org/cgit/freetype/freetype2.git/tree/docs=
/FTL.TXT",
+        "http://gitlab.freedesktop.org/freetype/freetype/-/raw/master/docs=
/FTL.TXT"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Furuseth.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Furuseth",
+      "name": "Furuseth License",
+      "reference": "https://spdx.org/licenses/Furuseth.html",
+      "referenceNumber": 380,
+      "seeAlso": [
+        "https://git.openldap.org/openldap/openldap/-/blob/master/COPYRIGH=
T?ref_type=3Dheads#L39-51"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/fwlw.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "fwlw",
+      "name": "fwlw License",
+      "reference": "https://spdx.org/licenses/fwlw.html",
+      "referenceNumber": 529,
+      "seeAlso": [
+        "https://mirrors.nic.cz/tex-archive/macros/latex/contrib/fwlw/READ=
ME"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GCR-docs.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "GCR-docs",
+      "name": "Gnome GCR Documentation License",
+      "reference": "https://spdx.org/licenses/GCR-docs.html",
+      "referenceNumber": 115,
+      "seeAlso": [
+        "https://github.com/GNOME/gcr/blob/master/docs/COPYING"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GD.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "GD",
+      "name": "GD License",
+      "reference": "https://spdx.org/licenses/GD.html",
+      "referenceNumber": 291,
+      "seeAlso": [
+        "https://libgd.github.io/manuals/2.3.0/files/license-txt.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1.json",
+      "isDeprecatedLicenseId": true,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.1",
+      "name": "GNU Free Documentation License v1.1",
+      "reference": "https://spdx.org/licenses/GFDL-1.1.html",
+      "referenceNumber": 589,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-invariants-only.js=
on",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.1-invariants-only",
+      "name": "GNU Free Documentation License v1.1 only - invariants",
+      "reference": "https://spdx.org/licenses/GFDL-1.1-invariants-only.htm=
l",
+      "referenceNumber": 307,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-invariants-or-late=
r.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.1-invariants-or-later",
+      "name": "GNU Free Documentation License v1.1 or later - invariants",
+      "reference": "https://spdx.org/licenses/GFDL-1.1-invariants-or-later=
.html",
+      "referenceNumber": 98,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-no-invariants-only=
.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.1-no-invariants-only",
+      "name": "GNU Free Documentation License v1.1 only - no invariants",
+      "reference": "https://spdx.org/licenses/GFDL-1.1-no-invariants-only.=
html",
+      "referenceNumber": 47,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-no-invariants-or-l=
ater.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.1-no-invariants-or-later",
+      "name": "GNU Free Documentation License v1.1 or later - no invariant=
s",
+      "reference": "https://spdx.org/licenses/GFDL-1.1-no-invariants-or-la=
ter.html",
+      "referenceNumber": 273,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-only.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.1-only",
+      "name": "GNU Free Documentation License v1.1 only",
+      "reference": "https://spdx.org/licenses/GFDL-1.1-only.html",
+      "referenceNumber": 626,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-or-later.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.1-or-later",
+      "name": "GNU Free Documentation License v1.1 or later",
+      "reference": "https://spdx.org/licenses/GFDL-1.1-or-later.html",
+      "referenceNumber": 644,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2.json",
+      "isDeprecatedLicenseId": true,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.2",
+      "name": "GNU Free Documentation License v1.2",
+      "reference": "https://spdx.org/licenses/GFDL-1.2.html",
+      "referenceNumber": 520,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-invariants-only.js=
on",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.2-invariants-only",
+      "name": "GNU Free Documentation License v1.2 only - invariants",
+      "reference": "https://spdx.org/licenses/GFDL-1.2-invariants-only.htm=
l",
+      "referenceNumber": 495,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-invariants-or-late=
r.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.2-invariants-or-later",
+      "name": "GNU Free Documentation License v1.2 or later - invariants",
+      "reference": "https://spdx.org/licenses/GFDL-1.2-invariants-or-later=
.html",
+      "referenceNumber": 6,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-no-invariants-only=
.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.2-no-invariants-only",
+      "name": "GNU Free Documentation License v1.2 only - no invariants",
+      "reference": "https://spdx.org/licenses/GFDL-1.2-no-invariants-only.=
html",
+      "referenceNumber": 77,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-no-invariants-or-l=
ater.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.2-no-invariants-or-later",
+      "name": "GNU Free Documentation License v1.2 or later - no invariant=
s",
+      "reference": "https://spdx.org/licenses/GFDL-1.2-no-invariants-or-la=
ter.html",
+      "referenceNumber": 279,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-only.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.2-only",
+      "name": "GNU Free Documentation License v1.2 only",
+      "reference": "https://spdx.org/licenses/GFDL-1.2-only.html",
+      "referenceNumber": 648,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-or-later.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.2-or-later",
+      "name": "GNU Free Documentation License v1.2 or later",
+      "reference": "https://spdx.org/licenses/GFDL-1.2-or-later.html",
+      "referenceNumber": 318,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3.json",
+      "isDeprecatedLicenseId": true,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.3",
+      "name": "GNU Free Documentation License v1.3",
+      "reference": "https://spdx.org/licenses/GFDL-1.3.html",
+      "referenceNumber": 287,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-invariants-only.js=
on",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.3-invariants-only",
+      "name": "GNU Free Documentation License v1.3 only - invariants",
+      "reference": "https://spdx.org/licenses/GFDL-1.3-invariants-only.htm=
l",
+      "referenceNumber": 289,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-invariants-or-late=
r.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.3-invariants-or-later",
+      "name": "GNU Free Documentation License v1.3 or later - invariants",
+      "reference": "https://spdx.org/licenses/GFDL-1.3-invariants-or-later=
.html",
+      "referenceNumber": 497,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-no-invariants-only=
.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.3-no-invariants-only",
+      "name": "GNU Free Documentation License v1.3 only - no invariants",
+      "reference": "https://spdx.org/licenses/GFDL-1.3-no-invariants-only.=
html",
+      "referenceNumber": 254,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-no-invariants-or-l=
ater.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.3-no-invariants-or-later",
+      "name": "GNU Free Documentation License v1.3 or later - no invariant=
s",
+      "reference": "https://spdx.org/licenses/GFDL-1.3-no-invariants-or-la=
ter.html",
+      "referenceNumber": 207,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-only.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.3-only",
+      "name": "GNU Free Documentation License v1.3 only",
+      "reference": "https://spdx.org/licenses/GFDL-1.3-only.html",
+      "referenceNumber": 635,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-or-later.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "GFDL-1.3-or-later",
+      "name": "GNU Free Documentation License v1.3 or later",
+      "reference": "https://spdx.org/licenses/GFDL-1.3-or-later.html",
+      "referenceNumber": 448,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/fdl-1.3.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Giftware.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Giftware",
+      "name": "Giftware License",
+      "reference": "https://spdx.org/licenses/Giftware.html",
+      "referenceNumber": 172,
+      "seeAlso": [
+        "http://liballeg.org/license.html#allegro-4-the-giftware-license"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GL2PS.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "GL2PS",
+      "name": "GL2PS License",
+      "reference": "https://spdx.org/licenses/GL2PS.html",
+      "referenceNumber": 434,
+      "seeAlso": [
+        "http://www.geuz.org/gl2ps/COPYING.GL2PS"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Glide.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Glide",
+      "name": "3dfx Glide License",
+      "reference": "https://spdx.org/licenses/Glide.html",
+      "referenceNumber": 189,
+      "seeAlso": [
+        "http://www.users.on.net/~triforce/glidexp/COPYING.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Glulxe.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Glulxe",
+      "name": "Glulxe License",
+      "reference": "https://spdx.org/licenses/Glulxe.html",
+      "referenceNumber": 85,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Glulxe"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GLWTPL.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "GLWTPL",
+      "name": "Good Luck With That Public License",
+      "reference": "https://spdx.org/licenses/GLWTPL.html",
+      "referenceNumber": 190,
+      "seeAlso": [
+        "https://github.com/me-shaon/GLWTPL/commit/da5f6bc734095efbacb442c=
0b31e33a65b9d6e85"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/gnuplot.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "gnuplot",
+      "name": "gnuplot License",
+      "reference": "https://spdx.org/licenses/gnuplot.html",
+      "referenceNumber": 110,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Gnuplot"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-1.0.json",
+      "isDeprecatedLicenseId": true,
+      "isOsiApproved": false,
+      "licenseId": "GPL-1.0",
+      "name": "GNU General Public License v1.0 only",
+      "reference": "https://spdx.org/licenses/GPL-1.0.html",
+      "referenceNumber": 630,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-1.0+.json",
+      "isDeprecatedLicenseId": true,
+      "isOsiApproved": false,
+      "licenseId": "GPL-1.0+",
+      "name": "GNU General Public License v1.0 or later",
+      "reference": "https://spdx.org/licenses/GPL-1.0+.html",
+      "referenceNumber": 26,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-1.0-only.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "GPL-1.0-only",
+      "name": "GNU General Public License v1.0 only",
+      "reference": "https://spdx.org/licenses/GPL-1.0-only.html",
+      "referenceNumber": 12,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-1.0-or-later.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "GPL-1.0-or-later",
+      "name": "GNU General Public License v1.0 or later",
+      "reference": "https://spdx.org/licenses/GPL-1.0-or-later.html",
+      "referenceNumber": 642,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0.json",
+      "isDeprecatedLicenseId": true,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "GPL-2.0",
+      "name": "GNU General Public License v2.0 only",
+      "reference": "https://spdx.org/licenses/GPL-2.0.html",
+      "referenceNumber": 524,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html=
",
+        "https://opensource.org/licenses/GPL-2.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0+.json",
+      "isDeprecatedLicenseId": true,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "GPL-2.0+",
+      "name": "GNU General Public License v2.0 or later",
+      "reference": "https://spdx.org/licenses/GPL-2.0+.html",
+      "referenceNumber": 25,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html=
",
+        "https://opensource.org/licenses/GPL-2.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-only.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "GPL-2.0-only",
+      "name": "GNU General Public License v2.0 only",
+      "reference": "https://spdx.org/licenses/GPL-2.0-only.html",
+      "referenceNumber": 618,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html=
",
+        "https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt",
+        "https://opensource.org/licenses/GPL-2.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-or-later.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "GPL-2.0-or-later",
+      "name": "GNU General Public License v2.0 or later",
+      "reference": "https://spdx.org/licenses/GPL-2.0-or-later.html",
+      "referenceNumber": 164,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html=
",
+        "https://opensource.org/licenses/GPL-2.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-autoconf-excep=
tion.json",
+      "isDeprecatedLicenseId": true,
+      "isOsiApproved": false,
+      "licenseId": "GPL-2.0-with-autoconf-exception",
+      "name": "GNU General Public License v2.0 w/Autoconf exception",
+      "reference": "https://spdx.org/licenses/GPL-2.0-with-autoconf-except=
ion.html",
+      "referenceNumber": 146,
+      "seeAlso": [
+        "http://ac-archive.sourceforge.net/doc/copyright.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-bison-exceptio=
n.json",
+      "isDeprecatedLicenseId": true,
+      "isOsiApproved": false,
+      "licenseId": "GPL-2.0-with-bison-exception",
+      "name": "GNU General Public License v2.0 w/Bison exception",
+      "reference": "https://spdx.org/licenses/GPL-2.0-with-bison-exception=
.html",
+      "referenceNumber": 374,
+      "seeAlso": [
+        "http://git.savannah.gnu.org/cgit/bison.git/tree/data/yacc.c?id=3D=
193d7c7054ba7197b0789e14965b739162319b5e#n141"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-classpath-exce=
ption.json",
+      "isDeprecatedLicenseId": true,
+      "isOsiApproved": false,
+      "licenseId": "GPL-2.0-with-classpath-exception",
+      "name": "GNU General Public License v2.0 w/Classpath exception",
+      "reference": "https://spdx.org/licenses/GPL-2.0-with-classpath-excep=
tion.html",
+      "referenceNumber": 331,
+      "seeAlso": [
+        "https://www.gnu.org/software/classpath/license.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-font-exception=
.json",
+      "isDeprecatedLicenseId": true,
+      "isOsiApproved": false,
+      "licenseId": "GPL-2.0-with-font-exception",
+      "name": "GNU General Public License v2.0 w/Font exception",
+      "reference": "https://spdx.org/licenses/GPL-2.0-with-font-exception.=
html",
+      "referenceNumber": 542,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/gpl-faq.html#FontException"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-GCC-exception.=
json",
+      "isDeprecatedLicenseId": true,
+      "isOsiApproved": false,
+      "licenseId": "GPL-2.0-with-GCC-exception",
+      "name": "GNU General Public License v2.0 w/GCC Runtime Library excep=
tion",
+      "reference": "https://spdx.org/licenses/GPL-2.0-with-GCC-exception.h=
tml",
+      "referenceNumber": 68,
+      "seeAlso": [
+        "https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob;f=3Dgcc/libgcc1.c;h=
=3D762f5143fc6eed57b6797c82710f3538aa52b40b;hb=3Dcb143a3ce4fb417c68f5fa2691=
a1b1b1053dfba9#l10"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0.json",
+      "isDeprecatedLicenseId": true,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "GPL-3.0",
+      "name": "GNU General Public License v3.0 only",
+      "reference": "https://spdx.org/licenses/GPL-3.0.html",
+      "referenceNumber": 442,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
+        "https://opensource.org/licenses/GPL-3.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0+.json",
+      "isDeprecatedLicenseId": true,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "GPL-3.0+",
+      "name": "GNU General Public License v3.0 or later",
+      "reference": "https://spdx.org/licenses/GPL-3.0+.html",
+      "referenceNumber": 270,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
+        "https://opensource.org/licenses/GPL-3.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-only.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "GPL-3.0-only",
+      "name": "GNU General Public License v3.0 only",
+      "reference": "https://spdx.org/licenses/GPL-3.0-only.html",
+      "referenceNumber": 133,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
+        "https://opensource.org/licenses/GPL-3.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-or-later.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "GPL-3.0-or-later",
+      "name": "GNU General Public License v3.0 or later",
+      "reference": "https://spdx.org/licenses/GPL-3.0-or-later.html",
+      "referenceNumber": 390,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
+        "https://opensource.org/licenses/GPL-3.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-with-autoconf-excep=
tion.json",
+      "isDeprecatedLicenseId": true,
+      "isOsiApproved": false,
+      "licenseId": "GPL-3.0-with-autoconf-exception",
+      "name": "GNU General Public License v3.0 w/Autoconf exception",
+      "reference": "https://spdx.org/licenses/GPL-3.0-with-autoconf-except=
ion.html",
+      "referenceNumber": 458,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/autoconf-exception-3.0.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-with-GCC-exception.=
json",
+      "isDeprecatedLicenseId": true,
+      "isOsiApproved": true,
+      "licenseId": "GPL-3.0-with-GCC-exception",
+      "name": "GNU General Public License v3.0 w/GCC Runtime Library excep=
tion",
+      "reference": "https://spdx.org/licenses/GPL-3.0-with-GCC-exception.h=
tml",
+      "referenceNumber": 356,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/gcc-exception-3.1.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Graphics-Gems.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Graphics-Gems",
+      "name": "Graphics Gems License",
+      "reference": "https://spdx.org/licenses/Graphics-Gems.html",
+      "referenceNumber": 574,
+      "seeAlso": [
+        "https://github.com/erich666/GraphicsGems/blob/master/LICENSE.md"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/gSOAP-1.3b.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "gSOAP-1.3b",
+      "name": "gSOAP Public License v1.3b",
+      "reference": "https://spdx.org/licenses/gSOAP-1.3b.html",
+      "referenceNumber": 655,
+      "seeAlso": [
+        "http://www.cs.fsu.edu/~engelen/license.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/gtkbook.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "gtkbook",
+      "name": "gtkbook License",
+      "reference": "https://spdx.org/licenses/gtkbook.html",
+      "referenceNumber": 237,
+      "seeAlso": [
+        "https://github.com/slogan621/gtkbook",
+        "https://github.com/oetiker/rrdtool-1.x/blob/master/src/plbasename=
.c#L8-L11"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Gutmann.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Gutmann",
+      "name": "Gutmann License",
+      "reference": "https://spdx.org/licenses/Gutmann.html",
+      "referenceNumber": 441,
+      "seeAlso": [
+        "https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.c"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HaskellReport.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HaskellReport",
+      "name": "Haskell Language Report License",
+      "reference": "https://spdx.org/licenses/HaskellReport.html",
+      "referenceNumber": 625,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Haskell_Language_Report_=
License"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/hdparm.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "hdparm",
+      "name": "hdparm License",
+      "reference": "https://spdx.org/licenses/hdparm.html",
+      "referenceNumber": 81,
+      "seeAlso": [
+        "https://github.com/Distrotech/hdparm/blob/4517550db29a91420fb2b02=
0349523b1b4512df2/LICENSE.TXT"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Hippocratic-2.1.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Hippocratic-2.1",
+      "name": "Hippocratic License 2.1",
+      "reference": "https://spdx.org/licenses/Hippocratic-2.1.html",
+      "referenceNumber": 299,
+      "seeAlso": [
+        "https://firstdonoharm.dev/version/2/1/license.html",
+        "https://github.com/EthicalSource/hippocratic-license/blob/58c0e64=
6d64ff6fbee275bfe2b9492f914e3ab2a/LICENSE.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HP-1986.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HP-1986",
+      "name": "Hewlett-Packard 1986 License",
+      "reference": "https://spdx.org/licenses/HP-1986.html",
+      "referenceNumber": 277,
+      "seeAlso": [
+        "https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3Dne=
wlib/libc/machine/hppa/memchr.S;h=3D1cca3e5e8867aa4bffef1f75a5c1bba25c0c441=
e;hb=3DHEAD#l2"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HP-1989.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HP-1989",
+      "name": "Hewlett-Packard 1989 License",
+      "reference": "https://spdx.org/licenses/HP-1989.html",
+      "referenceNumber": 639,
+      "seeAlso": [
+        "https://github.com/bleargh45/Data-UUID/blob/master/LICENSE"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "HPND",
+      "name": "Historical Permission Notice and Disclaimer",
+      "reference": "https://spdx.org/licenses/HPND.html",
+      "referenceNumber": 281,
+      "seeAlso": [
+        "https://opensource.org/licenses/HPND",
+        "http://lists.opensource.org/pipermail/license-discuss_lists.opens=
ource.org/2002-November/006304.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-DEC.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-DEC",
+      "name": "Historical Permission Notice and Disclaimer - DEC variant",
+      "reference": "https://spdx.org/licenses/HPND-DEC.html",
+      "referenceNumber": 577,
+      "seeAlso": [
+        "https://gitlab.freedesktop.org/xorg/app/xkbcomp/-/blob/master/COP=
YING?ref_type=3Dheads#L69"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-doc.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-doc",
+      "name": "Historical Permission Notice and Disclaimer - documentation=
 variant",
+      "reference": "https://spdx.org/licenses/HPND-doc.html",
+      "referenceNumber": 391,
+      "seeAlso": [
+        "https://gitlab.freedesktop.org/xorg/lib/libxext/-/blob/master/COP=
YING?ref_type=3Dheads#L185-197",
+        "https://gitlab.freedesktop.org/xorg/lib/libxtst/-/blob/master/COP=
YING?ref_type=3Dheads#L70-77"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-doc-sell.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-doc-sell",
+      "name": "Historical Permission Notice and Disclaimer - documentation=
 sell variant",
+      "reference": "https://spdx.org/licenses/HPND-doc-sell.html",
+      "referenceNumber": 163,
+      "seeAlso": [
+        "https://gitlab.freedesktop.org/xorg/lib/libxtst/-/blob/master/COP=
YING?ref_type=3Dheads#L108-117",
+        "https://gitlab.freedesktop.org/xorg/lib/libxext/-/blob/master/COP=
YING?ref_type=3Dheads#L153-162"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-export-US.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-export-US",
+      "name": "HPND with US Government export control warning",
+      "reference": "https://spdx.org/licenses/HPND-export-US.html",
+      "referenceNumber": 214,
+      "seeAlso": [
+        "https://www.kermitproject.org/ck90.html#source"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-export-US-acknowledgem=
ent.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-export-US-acknowledgement",
+      "name": "HPND with US Government export control warning and acknowle=
dgment",
+      "reference": "https://spdx.org/licenses/HPND-export-US-acknowledgeme=
nt.html",
+      "referenceNumber": 610,
+      "seeAlso": [
+        "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L831-L=
852",
+        "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-export-US-modify.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-export-US-modify",
+      "name": "HPND with US Government export control warning and modifica=
tion rqmt",
+      "reference": "https://spdx.org/licenses/HPND-export-US-modify.html",
+      "referenceNumber": 498,
+      "seeAlso": [
+        "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L1157-=
L1182",
+        "https://github.com/pythongssapi/k5test/blob/v0.10.3/K5TEST-LICENS=
E.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-export2-US.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-export2-US",
+      "name": "HPND with US Government export control and 2 disclaimers",
+      "reference": "https://spdx.org/licenses/HPND-export2-US.html",
+      "referenceNumber": 33,
+      "seeAlso": [
+        "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L111-L=
133",
+        "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-Fenneberg-Livingston.j=
son",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-Fenneberg-Livingston",
+      "name": "Historical Permission Notice and Disclaimer - Fenneberg-Liv=
ingston variant",
+      "reference": "https://spdx.org/licenses/HPND-Fenneberg-Livingston.ht=
ml",
+      "referenceNumber": 145,
+      "seeAlso": [
+        "https://github.com/FreeRADIUS/freeradius-client/blob/master/COPYR=
IGHT#L32",
+        "https://github.com/radcli/radcli/blob/master/COPYRIGHT#L34"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-INRIA-IMAG.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-INRIA-IMAG",
+      "name": "Historical Permission Notice and Disclaimer    - INRIA-IMAG=
 variant",
+      "reference": "https://spdx.org/licenses/HPND-INRIA-IMAG.html",
+      "referenceNumber": 614,
+      "seeAlso": [
+        "https://github.com/ppp-project/ppp/blob/master/pppd/ipv6cp.c#L75-=
L83"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-Intel.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-Intel",
+      "name": "Historical Permission Notice and Disclaimer - Intel variant=
",
+      "reference": "https://spdx.org/licenses/HPND-Intel.html",
+      "referenceNumber": 195,
+      "seeAlso": [
+        "https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3Dne=
wlib/libc/machine/i960/memcpy.S;hb=3DHEAD"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-Kevlin-Henney.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-Kevlin-Henney",
+      "name": "Historical Permission Notice and Disclaimer - Kevlin Henney=
 variant",
+      "reference": "https://spdx.org/licenses/HPND-Kevlin-Henney.html",
+      "referenceNumber": 428,
+      "seeAlso": [
+        "https://github.com/mruby/mruby/blob/83d12f8d52522cdb7c8cc46fad348=
21359f453e6/mrbgems/mruby-dir/src/Win/dirent.c#L127-L140"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-Markus-Kuhn.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-Markus-Kuhn",
+      "name": "Historical Permission Notice and Disclaimer - Markus Kuhn v=
ariant",
+      "reference": "https://spdx.org/licenses/HPND-Markus-Kuhn.html",
+      "referenceNumber": 8,
+      "seeAlso": [
+        "https://www.cl.cam.ac.uk/~mgk25/ucs/wcwidth.c",
+        "https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblob;f=3Drea=
dline/readline/support/wcwidth.c;h=3D0f5ec995796f4813abbcf4972aec0378ab7472=
2a;hb=3DHEAD#l55"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-merchantability-varian=
t.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-merchantability-variant",
+      "name": "Historical Permission Notice and Disclaimer - merchantabili=
ty variant",
+      "reference": "https://spdx.org/licenses/HPND-merchantability-variant=
.html",
+      "referenceNumber": 540,
+      "seeAlso": [
+        "https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3Dne=
wlib/libc/misc/fini.c;hb=3DHEAD"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-MIT-disclaimer.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-MIT-disclaimer",
+      "name": "Historical Permission Notice and Disclaimer with MIT discla=
imer",
+      "reference": "https://spdx.org/licenses/HPND-MIT-disclaimer.html",
+      "referenceNumber": 185,
+      "seeAlso": [
+        "https://metacpan.org/release/NLNETLABS/Net-DNS-SEC-1.22/source/LI=
CENSE"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-Pbmplus.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-Pbmplus",
+      "name": "Historical Permission Notice and Disclaimer - Pbmplus varia=
nt",
+      "reference": "https://spdx.org/licenses/HPND-Pbmplus.html",
+      "referenceNumber": 603,
+      "seeAlso": [
+        "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/netp=
bm.c#l8"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-sell-MIT-disclaimer-xs=
erver.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-sell-MIT-disclaimer-xserver",
+      "name": "Historical Permission Notice and Disclaimer - sell xserver =
variant with MIT disclaimer",
+      "reference": "https://spdx.org/licenses/HPND-sell-MIT-disclaimer-xse=
rver.html",
+      "referenceNumber": 125,
+      "seeAlso": [
+        "https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/COPYING=
?ref_type=3Dheads#L1781"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-sell-regexpr.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-sell-regexpr",
+      "name": "Historical Permission Notice and Disclaimer - sell regexpr =
variant",
+      "reference": "https://spdx.org/licenses/HPND-sell-regexpr.html",
+      "referenceNumber": 633,
+      "seeAlso": [
+        "https://gitlab.com/bacula-org/bacula/-/blob/Branch-11.0/bacula/LI=
CENSE-FOSS?ref_type=3Dheads#L245"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-sell-variant.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-sell-variant",
+      "name": "Historical Permission Notice and Disclaimer - sell variant",
+      "reference": "https://spdx.org/licenses/HPND-sell-variant.html",
+      "referenceNumber": 344,
+      "seeAlso": [
+        "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/net/sunrpc/auth_gss/gss_generic_token.c?h=3Dv4.19"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-sell-variant-MIT-discl=
aimer.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-sell-variant-MIT-disclaimer",
+      "name": "HPND sell variant with MIT disclaimer",
+      "reference": "https://spdx.org/licenses/HPND-sell-variant-MIT-discla=
imer.html",
+      "referenceNumber": 160,
+      "seeAlso": [
+        "https://github.com/sigmavirus24/x11-ssh-askpass/blob/master/READM=
E"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-sell-variant-MIT-discl=
aimer-rev.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-sell-variant-MIT-disclaimer-rev",
+      "name": "HPND sell variant with MIT disclaimer - reverse",
+      "reference": "https://spdx.org/licenses/HPND-sell-variant-MIT-discla=
imer-rev.html",
+      "referenceNumber": 609,
+      "seeAlso": [
+        "https://github.com/sigmavirus24/x11-ssh-askpass/blob/master/dynli=
st.c"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-UC.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-UC",
+      "name": "Historical Permission Notice and Disclaimer - University of=
 California variant",
+      "reference": "https://spdx.org/licenses/HPND-UC.html",
+      "referenceNumber": 386,
+      "seeAlso": [
+        "https://core.tcl-lang.org/tk/file?name=3Dcompat/unistd.h"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HPND-UC-export-US.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HPND-UC-export-US",
+      "name": "Historical Permission Notice and Disclaimer - University of=
 California, US export warning",
+      "reference": "https://spdx.org/licenses/HPND-UC-export-US.html",
+      "referenceNumber": 118,
+      "seeAlso": [
+        "https://github.com/RTimothyEdwards/magic/blob/master/LICENSE"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/HTMLTIDY.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "HTMLTIDY",
+      "name": "HTML Tidy License",
+      "reference": "https://spdx.org/licenses/HTMLTIDY.html",
+      "referenceNumber": 134,
+      "seeAlso": [
+        "https://github.com/htacg/tidy-html5/blob/next/README/LICENSE.md"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/IBM-pibs.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "IBM-pibs",
+      "name": "IBM PowerPC Initialization and Boot Software",
+      "reference": "https://spdx.org/licenses/IBM-pibs.html",
+      "referenceNumber": 102,
+      "seeAlso": [
+        "http://git.denx.de/?p=3Du-boot.git;a=3Dblob;f=3Darch/powerpc/cpu/=
ppc4xx/miiphy.c;h=3D297155fdafa064b955e53e9832de93bfb0cfb85b;hb=3D9fab4bf4c=
c077c21e43941866f3f2c196f28670d"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/ICU.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": true,
+      "licenseId": "ICU",
+      "name": "ICU License",
+      "reference": "https://spdx.org/licenses/ICU.html",
+      "referenceNumber": 67,
+      "seeAlso": [
+        "http://source.icu-project.org/repos/icu/icu/trunk/license.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/IEC-Code-Components-EULA.js=
on",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "IEC-Code-Components-EULA",
+      "name": "IEC    Code Components End-user licence agreement",
+      "reference": "https://spdx.org/licenses/IEC-Code-Components-EULA.htm=
l",
+      "referenceNumber": 359,
+      "seeAlso": [
+        "https://www.iec.ch/webstore/custserv/pdf/CC-EULA.pdf",
+        "https://www.iec.ch/CCv1",
+        "https://www.iec.ch/copyright"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/IJG.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "IJG",
+      "name": "Independent JPEG Group License",
+      "reference": "https://spdx.org/licenses/IJG.html",
+      "referenceNumber": 641,
+      "seeAlso": [
+        "http://dev.w3.org/cvsweb/Amaya/libjpeg/Attic/README?rev=3D1.2"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/IJG-short.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "IJG-short",
+      "name": "Independent JPEG Group License - short",
+      "reference": "https://spdx.org/licenses/IJG-short.html",
+      "referenceNumber": 615,
+      "seeAlso": [
+        "https://sourceforge.net/p/xmedcon/code/ci/master/tree/libs/ljpg/"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/ImageMagick.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "ImageMagick",
+      "name": "ImageMagick License",
+      "reference": "https://spdx.org/licenses/ImageMagick.html",
+      "referenceNumber": 478,
+      "seeAlso": [
+        "http://www.imagemagick.org/script/license.php"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/iMatix.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "iMatix",
+      "name": "iMatix Standard Function Library Agreement",
+      "reference": "https://spdx.org/licenses/iMatix.html",
+      "referenceNumber": 327,
+      "seeAlso": [
+        "http://legacy.imatix.com/html/sfl/sfl4.htm#license"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Imlib2.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "Imlib2",
+      "name": "Imlib2 License",
+      "reference": "https://spdx.org/licenses/Imlib2.html",
+      "referenceNumber": 169,
+      "seeAlso": [
+        "http://trac.enlightenment.org/e/browser/trunk/imlib2/COPYING",
+        "https://git.enlightenment.org/legacy/imlib2.git/tree/COPYING"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Info-ZIP.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Info-ZIP",
+      "name": "Info-ZIP License",
+      "reference": "https://spdx.org/licenses/Info-ZIP.html",
+      "referenceNumber": 269,
+      "seeAlso": [
+        "http://www.info-zip.org/license.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Inner-Net-2.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Inner-Net-2.0",
+      "name": "Inner Net License v2.0",
+      "reference": "https://spdx.org/licenses/Inner-Net-2.0.html",
+      "referenceNumber": 572,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Inner_Net_License",
+        "https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3DLICENSES;h=
=3D530893b1dc9ea00755603c68fb36bd4fc38a7be8;hb=3DHEAD#l207"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Intel.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "Intel",
+      "name": "Intel Open Source License",
+      "reference": "https://spdx.org/licenses/Intel.html",
+      "referenceNumber": 623,
+      "seeAlso": [
+        "https://opensource.org/licenses/Intel"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Intel-ACPI.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Intel-ACPI",
+      "name": "Intel ACPI Software License Agreement",
+      "reference": "https://spdx.org/licenses/Intel-ACPI.html",
+      "referenceNumber": 571,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Intel_ACPI_Software_Lice=
nse_Agreement"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Interbase-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Interbase-1.0",
+      "name": "Interbase Public License v1.0",
+      "reference": "https://spdx.org/licenses/Interbase-1.0.html",
+      "referenceNumber": 654,
+      "seeAlso": [
+        "https://web.archive.org/web/20060319014854/http://info.borland.co=
m/devsupport/interbase/opensource/IPL.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/IPA.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "IPA",
+      "name": "IPA Font License",
+      "reference": "https://spdx.org/licenses/IPA.html",
+      "referenceNumber": 94,
+      "seeAlso": [
+        "https://opensource.org/licenses/IPA"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/IPL-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "IPL-1.0",
+      "name": "IBM Public License v1.0",
+      "reference": "https://spdx.org/licenses/IPL-1.0.html",
+      "referenceNumber": 332,
+      "seeAlso": [
+        "https://opensource.org/licenses/IPL-1.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/ISC.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "ISC",
+      "name": "ISC License",
+      "reference": "https://spdx.org/licenses/ISC.html",
+      "referenceNumber": 488,
+      "seeAlso": [
+        "https://www.isc.org/licenses/",
+        "https://www.isc.org/downloads/software-support-policy/isc-license=
/",
+        "https://opensource.org/licenses/ISC"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/ISC-Veillard.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "ISC-Veillard",
+      "name": "ISC Veillard variant",
+      "reference": "https://spdx.org/licenses/ISC-Veillard.html",
+      "referenceNumber": 513,
+      "seeAlso": [
+        "https://raw.githubusercontent.com/GNOME/libxml2/4c2e7c651f6c2f0d1=
a74f350cbda95f7df3e7017/hash.c",
+        "https://github.com/GNOME/libxml2/blob/master/dict.c",
+        "https://sourceforge.net/p/ctrio/git/ci/master/tree/README"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Jam.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": true,
+      "licenseId": "Jam",
+      "name": "Jam License",
+      "reference": "https://spdx.org/licenses/Jam.html",
+      "referenceNumber": 108,
+      "seeAlso": [
+        "https://www.boost.org/doc/libs/1_35_0/doc/html/jam.html",
+        "https://web.archive.org/web/20160330173339/https://swarm.workshop=
.perforce.com/files/guest/perforce_software/jam/src/README"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/JasPer-2.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "JasPer-2.0",
+      "name": "JasPer License",
+      "reference": "https://spdx.org/licenses/JasPer-2.0.html",
+      "referenceNumber": 487,
+      "seeAlso": [
+        "http://www.ece.uvic.ca/~mdadams/jasper/LICENSE"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/JPL-image.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "JPL-image",
+      "name": "JPL Image Use Policy",
+      "reference": "https://spdx.org/licenses/JPL-image.html",
+      "referenceNumber": 363,
+      "seeAlso": [
+        "https://www.jpl.nasa.gov/jpl-image-use-policy"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/JPNIC.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "JPNIC",
+      "name": "Japan Network Information Center License",
+      "reference": "https://spdx.org/licenses/JPNIC.html",
+      "referenceNumber": 83,
+      "seeAlso": [
+        "https://gitlab.isc.org/isc-projects/bind9/blob/master/COPYRIGHT#L=
366"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/JSON.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": false,
+      "isOsiApproved": false,
+      "licenseId": "JSON",
+      "name": "JSON License",
+      "reference": "https://spdx.org/licenses/JSON.html",
+      "referenceNumber": 65,
+      "seeAlso": [
+        "http://www.json.org/license.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Kastrup.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Kastrup",
+      "name": "Kastrup License",
+      "reference": "https://spdx.org/licenses/Kastrup.html",
+      "referenceNumber": 226,
+      "seeAlso": [
+        "https://ctan.math.utah.edu/ctan/tex-archive/macros/generic/kastru=
p/binhex.dtx"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Kazlib.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Kazlib",
+      "name": "Kazlib License",
+      "reference": "https://spdx.org/licenses/Kazlib.html",
+      "referenceNumber": 232,
+      "seeAlso": [
+        "http://git.savannah.gnu.org/cgit/kazlib.git/tree/except.c?id=3D00=
62df360c2d17d57f6af19b0e444c51feb99036"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Knuth-CTAN.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Knuth-CTAN",
+      "name": "Knuth CTAN License",
+      "reference": "https://spdx.org/licenses/Knuth-CTAN.html",
+      "referenceNumber": 290,
+      "seeAlso": [
+        "https://ctan.org/license/knuth"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LAL-1.2.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "LAL-1.2",
+      "name": "Licence Art Libre 1.2",
+      "reference": "https://spdx.org/licenses/LAL-1.2.html",
+      "referenceNumber": 165,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nd/4.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "http://artlibre.org/licence/lal/licence-art-libre-12/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/FreeBSD-DOC.html",
+      "detailsUrl": "https://spdx.org/licenses/LAL-1.3.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/FreeBSD-DOC.json",
-      "referenceNumber": 192,
-      "name": "FreeBSD Documentation License",
-      "licenseId": "FreeBSD-DOC",
+      "isOsiApproved": false,
+      "licenseId": "LAL-1.3",
+      "name": "Licence Art Libre 1.3",
+      "reference": "https://spdx.org/licenses/LAL-1.3.html",
+      "referenceNumber": 600,
       "seeAlso": [
-        "https://www.freebsd.org/copyright/freebsd-doc-license/"
-      ],
-      "isOsiApproved": false
+        "https://artlibre.org/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SCEA.html",
+      "detailsUrl": "https://spdx.org/licenses/Latex2e.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SCEA.json",
-      "referenceNumber": 193,
-      "name": "SCEA Shared Source License",
-      "licenseId": "SCEA",
+      "isOsiApproved": false,
+      "licenseId": "Latex2e",
+      "name": "Latex2e License",
+      "reference": "https://spdx.org/licenses/Latex2e.html",
+      "referenceNumber": 439,
       "seeAlso": [
-        "http://research.scea.com/scea_shared_source_license.html"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/Latex2e"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Latex2e-translated-notice.j=
son",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Latex2e-translated-notice",
+      "name": "Latex2e with translated notice permission",
+      "reference": "https://spdx.org/licenses/Latex2e-translated-notice.ht=
ml",
+      "referenceNumber": 620,
+      "seeAlso": [
+        "https://git.savannah.gnu.org/cgit/indent.git/tree/doc/indent.texi=
?id=3Da74c6b4ee49397cf330b333da1042bffa60ed14f#n74"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Leptonica.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Leptonica",
+      "name": "Leptonica License",
+      "reference": "https://spdx.org/licenses/Leptonica.html",
+      "referenceNumber": 103,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Leptonica"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0.json",
+      "isDeprecatedLicenseId": true,
+      "isOsiApproved": true,
+      "licenseId": "LGPL-2.0",
+      "name": "GNU Library General Public License v2 only",
+      "reference": "https://spdx.org/licenses/LGPL-2.0.html",
+      "referenceNumber": 353,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.htm=
l"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0+.json",
+      "isDeprecatedLicenseId": true,
+      "isOsiApproved": true,
+      "licenseId": "LGPL-2.0+",
+      "name": "GNU Library General Public License v2 or later",
+      "reference": "https://spdx.org/licenses/LGPL-2.0+.html",
+      "referenceNumber": 62,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.htm=
l"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0-only.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": true,
+      "licenseId": "LGPL-2.0-only",
+      "name": "GNU Library General Public License v2 only",
+      "reference": "https://spdx.org/licenses/LGPL-2.0-only.html",
+      "referenceNumber": 519,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.htm=
l"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0-or-later.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": true,
+      "licenseId": "LGPL-2.0-or-later",
+      "name": "GNU Library General Public License v2 or later",
+      "reference": "https://spdx.org/licenses/LGPL-2.0-or-later.html",
+      "referenceNumber": 366,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.htm=
l"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1.json",
+      "isDeprecatedLicenseId": true,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "LGPL-2.1",
+      "name": "GNU Lesser General Public License v2.1 only",
+      "reference": "https://spdx.org/licenses/LGPL-2.1.html",
+      "referenceNumber": 656,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.htm=
l",
+        "https://opensource.org/licenses/LGPL-2.1"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1+.json",
+      "isDeprecatedLicenseId": true,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "LGPL-2.1+",
+      "name": "GNU Lesser General Public License v2.1 or later",
+      "reference": "https://spdx.org/licenses/LGPL-2.1+.html",
+      "referenceNumber": 64,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.htm=
l",
+        "https://opensource.org/licenses/LGPL-2.1"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1-only.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "LGPL-2.1-only",
+      "name": "GNU Lesser General Public License v2.1 only",
+      "reference": "https://spdx.org/licenses/LGPL-2.1-only.html",
+      "referenceNumber": 177,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.htm=
l",
+        "https://opensource.org/licenses/LGPL-2.1"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1-or-later.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "LGPL-2.1-or-later",
+      "name": "GNU Lesser General Public License v2.1 or later",
+      "reference": "https://spdx.org/licenses/LGPL-2.1-or-later.html",
+      "referenceNumber": 24,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.htm=
l",
+        "https://opensource.org/licenses/LGPL-2.1"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0.json",
+      "isDeprecatedLicenseId": true,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "LGPL-3.0",
+      "name": "GNU Lesser General Public License v3.0 only",
+      "reference": "https://spdx.org/licenses/LGPL-3.0.html",
+      "referenceNumber": 578,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
+        "https://www.gnu.org/licenses/lgpl+gpl-3.0.txt",
+        "https://opensource.org/licenses/LGPL-3.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0+.json",
+      "isDeprecatedLicenseId": true,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "LGPL-3.0+",
+      "name": "GNU Lesser General Public License v3.0 or later",
+      "reference": "https://spdx.org/licenses/LGPL-3.0+.html",
+      "referenceNumber": 233,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
+        "https://www.gnu.org/licenses/lgpl+gpl-3.0.txt",
+        "https://opensource.org/licenses/LGPL-3.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0-only.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "LGPL-3.0-only",
+      "name": "GNU Lesser General Public License v3.0 only",
+      "reference": "https://spdx.org/licenses/LGPL-3.0-only.html",
+      "referenceNumber": 3,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
+        "https://www.gnu.org/licenses/lgpl+gpl-3.0.txt",
+        "https://opensource.org/licenses/LGPL-3.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0-or-later.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "LGPL-3.0-or-later",
+      "name": "GNU Lesser General Public License v3.0 or later",
+      "reference": "https://spdx.org/licenses/LGPL-3.0-or-later.html",
+      "referenceNumber": 262,
+      "seeAlso": [
+        "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
+        "https://www.gnu.org/licenses/lgpl+gpl-3.0.txt",
+        "https://opensource.org/licenses/LGPL-3.0"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LGPLLR.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "LGPLLR",
+      "name": "Lesser General Public License For Linguistic Resources",
+      "reference": "https://spdx.org/licenses/LGPLLR.html",
+      "referenceNumber": 477,
+      "seeAlso": [
+        "http://www-igm.univ-mlv.fr/~unitex/lgpllr.html"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/Libpng.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Libpng",
+      "name": "libpng License",
+      "reference": "https://spdx.org/licenses/Libpng.html",
+      "referenceNumber": 186,
+      "seeAlso": [
+        "http://www.libpng.org/pub/png/src/libpng-LICENSE.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/libpng-2.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "libpng-2.0",
+      "name": "PNG Reference Library version 2",
+      "reference": "https://spdx.org/licenses/libpng-2.0.html",
+      "referenceNumber": 257,
+      "seeAlso": [
+        "http://www.libpng.org/pub/png/src/libpng-LICENSE.txt"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/libselinux-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "libselinux-1.0",
+      "name": "libselinux public domain notice",
+      "reference": "https://spdx.org/licenses/libselinux-1.0.html",
+      "referenceNumber": 556,
+      "seeAlso": [
+        "https://github.com/SELinuxProject/selinux/blob/master/libselinux/=
LICENSE"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/libtiff.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "libtiff",
+      "name": "libtiff License",
+      "reference": "https://spdx.org/licenses/libtiff.html",
+      "referenceNumber": 392,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/libtiff"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/libutil-David-Nugent.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "libutil-David-Nugent",
+      "name": "libutil David Nugent License",
+      "reference": "https://spdx.org/licenses/libutil-David-Nugent.html",
+      "referenceNumber": 400,
+      "seeAlso": [
+        "http://web.mit.edu/freebsd/head/lib/libutil/login_ok.3",
+        "https://cgit.freedesktop.org/libbsd/tree/man/setproctitle.3bsd"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/LiLiQ-P-1.1.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": true,
+      "licenseId": "LiLiQ-P-1.1",
+      "name": "Licence Libre du Qu\u00e9bec \u2013 Permissive version 1.1",
+      "reference": "https://spdx.org/licenses/LiLiQ-P-1.1.html",
+      "referenceNumber": 43,
+      "seeAlso": [
+        "https://forge.gouv.qc.ca/licence/fr/liliq-v1-1/",
+        "http://opensource.org/licenses/LiLiQ-P-1.1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Latex2e.html",
+      "detailsUrl": "https://spdx.org/licenses/LiLiQ-R-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Latex2e.json",
-      "referenceNumber": 194,
-      "name": "Latex2e License",
-      "licenseId": "Latex2e",
+      "isOsiApproved": true,
+      "licenseId": "LiLiQ-R-1.1",
+      "name": "Licence Libre du Qu\u00e9bec \u2013 R\u00e9ciprocit\u00e9 v=
ersion 1.1",
+      "reference": "https://spdx.org/licenses/LiLiQ-R-1.1.html",
+      "referenceNumber": 74,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Latex2e"
-      ],
-      "isOsiApproved": false
+        "https://www.forge.gouv.qc.ca/participez/licence-logicielle/licenc=
e-libre-du-quebec-liliq-en-francais/licence-libre-du-quebec-reciprocite-lil=
iq-r-v1-1/",
+        "http://opensource.org/licenses/LiLiQ-R-1.1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Artistic-1.0-cl8.html",
+      "detailsUrl": "https://spdx.org/licenses/LiLiQ-Rplus-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Artistic-1.0-cl8.json",
-      "referenceNumber": 195,
-      "name": "Artistic License 1.0 w/clause 8",
-      "licenseId": "Artistic-1.0-cl8",
+      "isOsiApproved": true,
+      "licenseId": "LiLiQ-Rplus-1.1",
+      "name": "Licence Libre du Qu\u00e9bec \u2013 R\u00e9ciprocit\u00e9 f=
orte version 1.1",
+      "reference": "https://spdx.org/licenses/LiLiQ-Rplus-1.1.html",
+      "referenceNumber": 40,
       "seeAlso": [
-        "https://opensource.org/licenses/Artistic-1.0"
-      ],
-      "isOsiApproved": true
+        "https://www.forge.gouv.qc.ca/participez/licence-logicielle/licenc=
e-libre-du-quebec-liliq-en-francais/licence-libre-du-quebec-reciprocite-for=
te-liliq-r-v1-1/",
+        "http://opensource.org/licenses/LiLiQ-Rplus-1.1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SGI-B-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/Linux-man-pages-1-para.json=
",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SGI-B-1.1.json",
-      "referenceNumber": 196,
-      "name": "SGI Free Software License B v1.1",
-      "licenseId": "SGI-B-1.1",
+      "isOsiApproved": false,
+      "licenseId": "Linux-man-pages-1-para",
+      "name": "Linux man-pages - 1 paragraph",
+      "reference": "https://spdx.org/licenses/Linux-man-pages-1-para.html",
+      "referenceNumber": 339,
       "seeAlso": [
-        "http://oss.sgi.com/projects/FreeB/"
-      ],
-      "isOsiApproved": false
+        "https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/=
man2/getcpu.2#n4"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/NRL.html",
+      "detailsUrl": "https://spdx.org/licenses/Linux-man-pages-copyleft.js=
on",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NRL.json",
-      "referenceNumber": 197,
-      "name": "NRL License",
-      "licenseId": "NRL",
+      "isOsiApproved": false,
+      "licenseId": "Linux-man-pages-copyleft",
+      "name": "Linux man-pages Copyleft",
+      "reference": "https://spdx.org/licenses/Linux-man-pages-copyleft.htm=
l",
+      "referenceNumber": 590,
       "seeAlso": [
-        "http://web.mit.edu/network/isakmp/nrllicense.html"
-      ],
-      "isOsiApproved": false
+        "https://www.kernel.org/doc/man-pages/licenses.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SWL.html",
+      "detailsUrl": "https://spdx.org/licenses/Linux-man-pages-copyleft-2-=
para.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SWL.json",
-      "referenceNumber": 198,
-      "name": "Scheme Widget Library (SWL) Software License Agreement",
-      "licenseId": "SWL",
+      "isOsiApproved": false,
+      "licenseId": "Linux-man-pages-copyleft-2-para",
+      "name": "Linux man-pages Copyleft - 2 paragraphs",
+      "reference": "https://spdx.org/licenses/Linux-man-pages-copyleft-2-p=
ara.html",
+      "referenceNumber": 86,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/SWL"
-      ],
-      "isOsiApproved": false
+        "https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/=
man2/move_pages.2#n5",
+        "https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/=
man2/migrate_pages.2#n8"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Zed.html",
+      "detailsUrl": "https://spdx.org/licenses/Linux-man-pages-copyleft-va=
r.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Zed.json",
-      "referenceNumber": 199,
-      "name": "Zed License",
-      "licenseId": "Zed",
+      "isOsiApproved": false,
+      "licenseId": "Linux-man-pages-copyleft-var",
+      "name": "Linux man-pages Copyleft Variant",
+      "reference": "https://spdx.org/licenses/Linux-man-pages-copyleft-var=
.html",
+      "referenceNumber": 337,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Zed"
-      ],
-      "isOsiApproved": false
+        "https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/=
man2/set_mempolicy.2#n5"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CERN-OHL-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/Linux-OpenIB.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-1.1.json",
-      "referenceNumber": 200,
-      "name": "CERN Open Hardware Licence v1.1",
-      "licenseId": "CERN-OHL-1.1",
+      "isOsiApproved": false,
+      "licenseId": "Linux-OpenIB",
+      "name": "Linux Kernel Variant of OpenIB.org license",
+      "reference": "https://spdx.org/licenses/Linux-OpenIB.html",
+      "referenceNumber": 613,
       "seeAlso": [
-        "https://www.ohwr.org/project/licenses/wikis/cern-ohl-v1.1"
-      ],
-      "isOsiApproved": false
+        "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/drivers/infiniband/core/sa.h"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/RHeCos-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/LOOP.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/RHeCos-1.1.json",
-      "referenceNumber": 201,
-      "name": "Red Hat eCos Public License v1.1",
-      "licenseId": "RHeCos-1.1",
+      "isOsiApproved": false,
+      "licenseId": "LOOP",
+      "name": "Common Lisp LOOP License",
+      "reference": "https://spdx.org/licenses/LOOP.html",
+      "referenceNumber": 607,
       "seeAlso": [
-        "http://ecos.sourceware.org/old-license.html"
-      ],
-      "isOsiApproved": false
+        "https://gitlab.com/embeddable-common-lisp/ecl/-/blob/develop/src/=
lsp/loop.lsp",
+        "http://git.savannah.gnu.org/cgit/gcl.git/tree/gcl/lsp/gcl_loop.ls=
p?h=3DVersion_2_6_13pre",
+        "https://sourceforge.net/p/sbcl/sbcl/ci/master/tree/src/code/loop.=
lisp",
+        "https://github.com/cl-adams/adams/blob/master/LICENSE.md",
+        "https://github.com/blakemcbride/eclipse-lisp/blob/master/lisp/loo=
p.lisp",
+        "https://gitlab.common-lisp.net/cmucl/cmucl/-/blob/master/src/code=
/loop.lisp"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/JasPer-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/LPD-document.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/JasPer-2.0.json",
-      "referenceNumber": 202,
-      "name": "JasPer License",
-      "licenseId": "JasPer-2.0",
+      "isOsiApproved": false,
+      "licenseId": "LPD-document",
+      "name": "LPD Documentation License",
+      "reference": "https://spdx.org/licenses/LPD-document.html",
+      "referenceNumber": 522,
       "seeAlso": [
-        "http://www.ece.uvic.ca/~mdadams/jasper/LICENSE"
-      ],
-      "isOsiApproved": false
+        "https://github.com/Cyan4973/xxHash/blob/dev/doc/xxhash_spec.md",
+        "https://www.ietf.org/rfc/rfc1952.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SSPL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/LPL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SSPL-1.0.json",
-      "referenceNumber": 203,
-      "name": "Server Side Public License, v 1",
-      "licenseId": "SSPL-1.0",
+      "isOsiApproved": true,
+      "licenseId": "LPL-1.0",
+      "name": "Lucent Public License Version 1.0",
+      "reference": "https://spdx.org/licenses/LPL-1.0.html",
+      "referenceNumber": 196,
       "seeAlso": [
-        "https://www.mongodb.com/licensing/server-side-public-license"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/LPL-1.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GPL-2.0+.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0+.json",
-      "referenceNumber": 204,
-      "name": "GNU General Public License v2.0 or later",
-      "licenseId": "GPL-2.0+",
+      "detailsUrl": "https://spdx.org/licenses/LPL-1.02.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "LPL-1.02",
+      "name": "Lucent Public License v1.02",
+      "reference": "https://spdx.org/licenses/LPL-1.02.html",
+      "referenceNumber": 69,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html=
",
-        "https://opensource.org/licenses/GPL-2.0"
-      ],
-      "isOsiApproved": true
+        "http://plan9.bell-labs.com/plan9/license.html",
+        "https://opensource.org/licenses/LPL-1.02"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-1.4.html",
+      "detailsUrl": "https://spdx.org/licenses/LPPL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.4.json",
-      "referenceNumber": 205,
-      "name": "Open LDAP Public License v1.4",
-      "licenseId": "OLDAP-1.4",
+      "isOsiApproved": false,
+      "licenseId": "LPPL-1.0",
+      "name": "LaTeX Project Public License v1.0",
+      "reference": "https://spdx.org/licenses/LPPL-1.0.html",
+      "referenceNumber": 215,
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u0=
03dblob;f\u003dLICENSE;hb\u003dc9f95c2f3f2ffb5e0ae55fe7388af75547660941"
-      ],
-      "isOsiApproved": false
+        "http://www.latex-project.org/lppl/lppl-1-0.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/libpng-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/LPPL-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/libpng-2.0.json",
-      "referenceNumber": 206,
-      "name": "PNG Reference Library version 2",
-      "licenseId": "libpng-2.0",
+      "isOsiApproved": false,
+      "licenseId": "LPPL-1.1",
+      "name": "LaTeX Project Public License v1.1",
+      "reference": "https://spdx.org/licenses/LPPL-1.1.html",
+      "referenceNumber": 114,
       "seeAlso": [
-        "http://www.libpng.org/pub/png/src/libpng-LICENSE.txt"
-      ],
-      "isOsiApproved": false
+        "http://www.latex-project.org/lppl/lppl-1-1.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CNRI-Python-GPL-Compatible.h=
tml",
+      "detailsUrl": "https://spdx.org/licenses/LPPL-1.2.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CNRI-Python-GPL-Compatible.=
json",
-      "referenceNumber": 207,
-      "name": "CNRI Python Open Source GPL Compatible License Agreement",
-      "licenseId": "CNRI-Python-GPL-Compatible",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "LPPL-1.2",
+      "name": "LaTeX Project Public License v1.2",
+      "reference": "https://spdx.org/licenses/LPPL-1.2.html",
+      "referenceNumber": 435,
       "seeAlso": [
-        "http://www.python.org/download/releases/1.6.1/download_win/"
-      ],
-      "isOsiApproved": false
+        "http://www.latex-project.org/lppl/lppl-1-2.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Aladdin.html",
+      "detailsUrl": "https://spdx.org/licenses/LPPL-1.3a.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Aladdin.json",
-      "referenceNumber": 208,
-      "name": "Aladdin Free Public License",
-      "licenseId": "Aladdin",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "LPPL-1.3a",
+      "name": "LaTeX Project Public License v1.3a",
+      "reference": "https://spdx.org/licenses/LPPL-1.3a.html",
+      "referenceNumber": 18,
       "seeAlso": [
-        "http://pages.cs.wisc.edu/~ghost/doc/AFPL/6.01/Public.htm"
-      ],
-      "isOsiApproved": false
+        "http://www.latex-project.org/lppl/lppl-1-3a.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CECILL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/LPPL-1.3c.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CECILL-1.0.json",
-      "referenceNumber": 209,
-      "name": "CeCILL Free Software License Agreement v1.0",
-      "licenseId": "CECILL-1.0",
+      "isOsiApproved": true,
+      "licenseId": "LPPL-1.3c",
+      "name": "LaTeX Project Public License v1.3c",
+      "reference": "https://spdx.org/licenses/LPPL-1.3c.html",
+      "referenceNumber": 240,
       "seeAlso": [
-        "http://www.cecill.info/licences/Licence_CeCILL_V1-fr.html"
-      ],
-      "isOsiApproved": false
+        "http://www.latex-project.org/lppl/lppl-1-3c.txt",
+        "https://opensource.org/licenses/LPPL-1.3c"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Ruby.html",
+      "detailsUrl": "https://spdx.org/licenses/lsof.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Ruby.json",
-      "referenceNumber": 210,
-      "name": "Ruby License",
-      "licenseId": "Ruby",
-      "seeAlso": [
-        "http://www.ruby-lang.org/en/LICENSE.txt"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "lsof",
+      "name": "lsof License",
+      "reference": "https://spdx.org/licenses/lsof.html",
+      "referenceNumber": 605,
+      "seeAlso": [
+        "https://github.com/lsof-org/lsof/blob/master/COPYING"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/NPL-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/Lucida-Bitmap-Fonts.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NPL-1.1.json",
-      "referenceNumber": 211,
-      "name": "Netscape Public License v1.1",
-      "licenseId": "NPL-1.1",
-      "seeAlso": [
-        "http://www.mozilla.org/MPL/NPL/1.1/"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "Lucida-Bitmap-Fonts",
+      "name": "Lucida Bitmap Fonts License",
+      "reference": "https://spdx.org/licenses/Lucida-Bitmap-Fonts.html",
+      "referenceNumber": 399,
+      "seeAlso": [
+        "https://gitlab.freedesktop.org/xorg/font/bh-100dpi/-/blob/master/=
COPYING?ref_type=3Dheads"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/ImageMagick.html",
+      "detailsUrl": "https://spdx.org/licenses/LZMA-SDK-9.11-to-9.20.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/ImageMagick.json",
-      "referenceNumber": 212,
-      "name": "ImageMagick License",
-      "licenseId": "ImageMagick",
+      "isOsiApproved": false,
+      "licenseId": "LZMA-SDK-9.11-to-9.20",
+      "name": "LZMA SDK License (versions 9.11 to 9.20)",
+      "reference": "https://spdx.org/licenses/LZMA-SDK-9.11-to-9.20.html",
+      "referenceNumber": 430,
       "seeAlso": [
-        "http://www.imagemagick.org/script/license.php"
-      ],
-      "isOsiApproved": false
+        "https://www.7-zip.org/sdk.html",
+        "https://sourceforge.net/projects/sevenzip/files/LZMA%20SDK/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Cube.html",
+      "detailsUrl": "https://spdx.org/licenses/LZMA-SDK-9.22.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Cube.json",
-      "referenceNumber": 213,
-      "name": "Cube License",
-      "licenseId": "Cube",
+      "isOsiApproved": false,
+      "licenseId": "LZMA-SDK-9.22",
+      "name": "LZMA SDK License (versions 9.22 and beyond)",
+      "reference": "https://spdx.org/licenses/LZMA-SDK-9.22.html",
+      "referenceNumber": 244,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Cube"
-      ],
-      "isOsiApproved": false
+        "https://www.7-zip.org/sdk.html",
+        "https://sourceforge.net/projects/sevenzip/files/LZMA%20SDK/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.1-only.html",
+      "detailsUrl": "https://spdx.org/licenses/Mackerras-3-Clause.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-only.json",
-      "referenceNumber": 214,
-      "name": "GNU Free Documentation License v1.1 only",
-      "licenseId": "GFDL-1.1-only",
-      "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "Mackerras-3-Clause",
+      "name": "Mackerras 3-Clause License",
+      "reference": "https://spdx.org/licenses/Mackerras-3-Clause.html",
+      "referenceNumber": 59,
+      "seeAlso": [
+        "https://github.com/ppp-project/ppp/blob/master/pppd/chap_ms.c#L6-=
L28"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/Mackerras-3-Clause-acknowle=
dgment.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-2.0.json",
-      "referenceNumber": 215,
-      "name": "Creative Commons Attribution 2.0 Generic",
-      "licenseId": "CC-BY-2.0",
+      "isOsiApproved": false,
+      "licenseId": "Mackerras-3-Clause-acknowledgment",
+      "name": "Mackerras 3-Clause - acknowledgment variant",
+      "reference": "https://spdx.org/licenses/Mackerras-3-Clause-acknowled=
gment.html",
+      "referenceNumber": 598,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by/2.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://github.com/ppp-project/ppp/blob/master/pppd/auth.c#L6-L28"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/AFL-1.2.html",
+      "detailsUrl": "https://spdx.org/licenses/magaz.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/AFL-1.2.json",
-      "referenceNumber": 216,
-      "name": "Academic Free License v1.2",
-      "licenseId": "AFL-1.2",
+      "isOsiApproved": false,
+      "licenseId": "magaz",
+      "name": "magaz License",
+      "reference": "https://spdx.org/licenses/magaz.html",
+      "referenceNumber": 516,
       "seeAlso": [
-        "http://opensource.linux-mirror.org/licenses/afl-1.2.txt",
-        "http://wayback.archive.org/web/20021204204652/http://www.opensour=
ce.org/licenses/academic.php"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://mirrors.nic.cz/tex-archive/macros/latex/contrib/magaz/mag=
az.tex"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-SA-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/mailprio.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.0.json",
-      "referenceNumber": 217,
-      "name": "Creative Commons Attribution Share Alike 2.0 Generic",
-      "licenseId": "CC-BY-SA-2.0",
+      "isOsiApproved": false,
+      "licenseId": "mailprio",
+      "name": "mailprio License",
+      "reference": "https://spdx.org/licenses/mailprio.html",
+      "referenceNumber": 179,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-sa/2.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://fossies.org/linux/sendmail/contrib/mailprio"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CECILL-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/MakeIndex.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CECILL-2.0.json",
-      "referenceNumber": 218,
-      "name": "CeCILL Free Software License Agreement v2.0",
-      "licenseId": "CECILL-2.0",
+      "isOsiApproved": false,
+      "licenseId": "MakeIndex",
+      "name": "MakeIndex License",
+      "reference": "https://spdx.org/licenses/MakeIndex.html",
+      "referenceNumber": 206,
       "seeAlso": [
-        "http://www.cecill.info/licences/Licence_CeCILL_V2-en.html"
-      ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+        "https://fedoraproject.org/wiki/Licensing/MakeIndex"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MIT-advertising.html",
+      "detailsUrl": "https://spdx.org/licenses/Martin-Birgmeier.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MIT-advertising.json",
-      "referenceNumber": 219,
-      "name": "Enlightenment License (e16)",
-      "licenseId": "MIT-advertising",
+      "isOsiApproved": false,
+      "licenseId": "Martin-Birgmeier",
+      "name": "Martin Birgmeier License",
+      "reference": "https://spdx.org/licenses/Martin-Birgmeier.html",
+      "referenceNumber": 535,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/MIT_With_Advertising"
-      ],
-      "isOsiApproved": false
+        "https://github.com/Perl/perl5/blob/blead/util.c#L6136"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.5.html",
+      "detailsUrl": "https://spdx.org/licenses/McPhee-slideshow.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.5.json",
-      "referenceNumber": 220,
-      "name": "Creative Commons Attribution Non Commercial Share Alike 2.5=
 Generic",
-      "licenseId": "CC-BY-NC-SA-2.5",
+      "isOsiApproved": false,
+      "licenseId": "McPhee-slideshow",
+      "name": "McPhee Slideshow License",
+      "reference": "https://spdx.org/licenses/McPhee-slideshow.html",
+      "referenceNumber": 492,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc-sa/2.5/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://mirror.las.iastate.edu/tex-archive/graphics/metapost/cont=
rib/macros/slideshow/slideshow.mp"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Artistic-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/metamail.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Artistic-1.0.json",
-      "referenceNumber": 221,
-      "name": "Artistic License 1.0",
-      "licenseId": "Artistic-1.0",
+      "isOsiApproved": false,
+      "licenseId": "metamail",
+      "name": "metamail License",
+      "reference": "https://spdx.org/licenses/metamail.html",
+      "referenceNumber": 437,
       "seeAlso": [
-        "https://opensource.org/licenses/Artistic-1.0"
-      ],
-      "isOsiApproved": true
+        "https://github.com/Dual-Life/mime-base64/blob/master/Base64.xs#L1=
2"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OSL-3.0.html",
+      "detailsUrl": "https://spdx.org/licenses/Minpack.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OSL-3.0.json",
-      "referenceNumber": 222,
-      "name": "Open Software License 3.0",
-      "licenseId": "OSL-3.0",
+      "isOsiApproved": false,
+      "licenseId": "Minpack",
+      "name": "Minpack License",
+      "reference": "https://spdx.org/licenses/Minpack.html",
+      "referenceNumber": 512,
       "seeAlso": [
-        "https://web.archive.org/web/20120101081418/http://rosenlaw.com:80=
/OSL3.0.htm",
-        "https://opensource.org/licenses/OSL-3.0"
-      ],
+        "http://www.netlib.org/minpack/disclaimer",
+        "https://gitlab.com/libeigen/eigen/-/blob/master/COPYING.MINPACK"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/MirOS.json",
+      "isDeprecatedLicenseId": false,
       "isOsiApproved": true,
-      "isFsfLibre": true
+      "licenseId": "MirOS",
+      "name": "The MirOS Licence",
+      "reference": "https://spdx.org/licenses/MirOS.html",
+      "referenceNumber": 183,
+      "seeAlso": [
+        "https://opensource.org/licenses/MirOS"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/X11.html",
+      "detailsUrl": "https://spdx.org/licenses/MIT.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/X11.json",
-      "referenceNumber": 223,
-      "name": "X11 License",
-      "licenseId": "X11",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "MIT",
+      "name": "MIT License",
+      "reference": "https://spdx.org/licenses/MIT.html",
+      "referenceNumber": 608,
       "seeAlso": [
-        "http://www.xfree86.org/3.3.6/COPYRIGHT2.html#3"
-      ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+        "https://opensource.org/license/mit/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Bahyph.html",
+      "detailsUrl": "https://spdx.org/licenses/MIT-0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Bahyph.json",
-      "referenceNumber": 224,
-      "name": "Bahyph License",
-      "licenseId": "Bahyph",
+      "isOsiApproved": true,
+      "licenseId": "MIT-0",
+      "name": "MIT No Attribution",
+      "reference": "https://spdx.org/licenses/MIT-0.html",
+      "referenceNumber": 395,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Bahyph"
-      ],
-      "isOsiApproved": false
+        "https://github.com/aws/mit-0",
+        "https://romanrm.net/mit-zero",
+        "https://github.com/awsdocs/aws-cloud9-user-guide/blob/master/LICE=
NSE-SAMPLECODE"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-2.0.1.html",
+      "detailsUrl": "https://spdx.org/licenses/MIT-advertising.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.0.1.json",
-      "referenceNumber": 225,
-      "name": "Open LDAP Public License v2.0.1",
-      "licenseId": "OLDAP-2.0.1",
+      "isOsiApproved": false,
+      "licenseId": "MIT-advertising",
+      "name": "Enlightenment License (e16)",
+      "reference": "https://spdx.org/licenses/MIT-advertising.html",
+      "referenceNumber": 293,
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u0=
03dblob;f\u003dLICENSE;hb\u003db6d68acd14e51ca3aab4428bf26522aa74873f0e"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/MIT_With_Advertising"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/EUDatagrid.html",
+      "detailsUrl": "https://spdx.org/licenses/MIT-CMU.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/EUDatagrid.json",
-      "referenceNumber": 226,
-      "name": "EU DataGrid Software License",
-      "licenseId": "EUDatagrid",
+      "isOsiApproved": false,
+      "licenseId": "MIT-CMU",
+      "name": "CMU License",
+      "reference": "https://spdx.org/licenses/MIT-CMU.html",
+      "referenceNumber": 575,
       "seeAlso": [
-        "http://eu-datagrid.web.cern.ch/eu-datagrid/license.html",
-        "https://opensource.org/licenses/EUDatagrid"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://fedoraproject.org/wiki/Licensing:MIT?rd=3DLicensing/MIT#C=
MU_Style",
+        "https://github.com/python-pillow/Pillow/blob/fffb426092c8db24a5f4=
b6df243a8a3c01fb63cd/LICENSE"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MTLL.html",
+      "detailsUrl": "https://spdx.org/licenses/MIT-enna.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MTLL.json",
-      "referenceNumber": 227,
-      "name": "Matrix Template Library License",
-      "licenseId": "MTLL",
+      "isOsiApproved": false,
+      "licenseId": "MIT-enna",
+      "name": "enna License",
+      "reference": "https://spdx.org/licenses/MIT-enna.html",
+      "referenceNumber": 638,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Matrix_Template_Library_=
License"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/MIT#enna"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.2-invariants-only.htm=
l",
+      "detailsUrl": "https://spdx.org/licenses/MIT-feh.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-invariants-only.js=
on",
-      "referenceNumber": 228,
-      "name": "GNU Free Documentation License v1.2 only - invariants",
-      "licenseId": "GFDL-1.2-invariants-only",
+      "isOsiApproved": false,
+      "licenseId": "MIT-feh",
+      "name": "feh License",
+      "reference": "https://spdx.org/licenses/MIT-feh.html",
+      "referenceNumber": 53,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/MIT#feh"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.3-no-invariants-or-la=
ter.html",
+      "detailsUrl": "https://spdx.org/licenses/MIT-Festival.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-no-invariants-or-l=
ater.json",
-      "referenceNumber": 229,
-      "name": "GNU Free Documentation License v1.3 or later - no invariant=
s",
-      "licenseId": "GFDL-1.3-no-invariants-or-later",
+      "isOsiApproved": false,
+      "licenseId": "MIT-Festival",
+      "name": "MIT Festival Variant",
+      "reference": "https://spdx.org/licenses/MIT-Festival.html",
+      "referenceNumber": 317,
       "seeAlso": [
-        "https://www.gnu.org/licenses/fdl-1.3.txt"
-      ],
-      "isOsiApproved": false
+        "https://github.com/festvox/flite/blob/master/COPYING",
+        "https://github.com/festvox/speech_tools/blob/master/COPYING"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/curl.html",
+      "detailsUrl": "https://spdx.org/licenses/MIT-Khronos-old.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/curl.json",
-      "referenceNumber": 230,
-      "name": "curl License",
-      "licenseId": "curl",
+      "isOsiApproved": false,
+      "licenseId": "MIT-Khronos-old",
+      "name": "MIT Khronos - old variant",
+      "reference": "https://spdx.org/licenses/MIT-Khronos-old.html",
+      "referenceNumber": 249,
       "seeAlso": [
-        "https://github.com/bagder/curl/blob/master/COPYING"
-      ],
-      "isOsiApproved": false
+        "https://github.com/KhronosGroup/SPIRV-Cross/blob/main/LICENSES/Li=
censeRef-KhronosFreeUse.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LAL-1.3.html",
+      "detailsUrl": "https://spdx.org/licenses/MIT-Modern-Variant.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LAL-1.3.json",
-      "referenceNumber": 231,
-      "name": "Licence Art Libre 1.3",
-      "licenseId": "LAL-1.3",
+      "isOsiApproved": true,
+      "licenseId": "MIT-Modern-Variant",
+      "name": "MIT License Modern Variant",
+      "reference": "https://spdx.org/licenses/MIT-Modern-Variant.html",
+      "referenceNumber": 424,
       "seeAlso": [
-        "https://artlibre.org/"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing:MIT#Modern_Variants",
+        "https://ptolemy.berkeley.edu/copyright.htm",
+        "https://pirlwww.lpl.arizona.edu/resources/guide/software/PerlTk/T=
ixlic.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/DSDP.html",
+      "detailsUrl": "https://spdx.org/licenses/MIT-open-group.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/DSDP.json",
-      "referenceNumber": 232,
-      "name": "DSDP License",
-      "licenseId": "DSDP",
+      "isOsiApproved": false,
+      "licenseId": "MIT-open-group",
+      "name": "MIT Open Group variant",
+      "reference": "https://spdx.org/licenses/MIT-open-group.html",
+      "referenceNumber": 283,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/DSDP"
-      ],
-      "isOsiApproved": false
+        "https://gitlab.freedesktop.org/xorg/app/iceauth/-/blob/master/COP=
YING",
+        "https://gitlab.freedesktop.org/xorg/app/xvinfo/-/blob/master/COPY=
ING",
+        "https://gitlab.freedesktop.org/xorg/app/xsetroot/-/blob/master/CO=
PYING",
+        "https://gitlab.freedesktop.org/xorg/app/xauth/-/blob/master/COPYI=
NG"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CERN-OHL-1.2.html",
+      "detailsUrl": "https://spdx.org/licenses/MIT-testregex.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-1.2.json",
-      "referenceNumber": 233,
-      "name": "CERN Open Hardware Licence v1.2",
-      "licenseId": "CERN-OHL-1.2",
+      "isOsiApproved": false,
+      "licenseId": "MIT-testregex",
+      "name": "MIT testregex Variant",
+      "reference": "https://spdx.org/licenses/MIT-testregex.html",
+      "referenceNumber": 427,
       "seeAlso": [
-        "https://www.ohwr.org/project/licenses/wikis/cern-ohl-v1.2"
-      ],
-      "isOsiApproved": false
+        "https://github.com/dotnet/runtime/blob/55e1ac7c07df62c4108d4acedf=
78f77574470ce5/src/libraries/System.Text.RegularExpressions/tests/Functiona=
lTests/AttRegexTests.cs#L12-L28"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/TOSL.html",
+      "detailsUrl": "https://spdx.org/licenses/MIT-Wu.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/TOSL.json",
-      "referenceNumber": 234,
-      "name": "Trusster Open Source License",
-      "licenseId": "TOSL",
+      "isOsiApproved": false,
+      "licenseId": "MIT-Wu",
+      "name": "MIT Tom Wu Variant",
+      "reference": "https://spdx.org/licenses/MIT-Wu.html",
+      "referenceNumber": 459,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/TOSL"
-      ],
-      "isOsiApproved": false
+        "https://github.com/chromium/octane/blob/master/crypto.js"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GPL-3.0-with-autoconf-except=
ion.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-with-autoconf-excep=
tion.json",
-      "referenceNumber": 235,
-      "name": "GNU General Public License v3.0 w/Autoconf exception",
-      "licenseId": "GPL-3.0-with-autoconf-exception",
+      "detailsUrl": "https://spdx.org/licenses/MITNFA.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "MITNFA",
+      "name": "MIT +no-false-attribs license",
+      "reference": "https://spdx.org/licenses/MITNFA.html",
+      "referenceNumber": 157,
       "seeAlso": [
-        "https://www.gnu.org/licenses/autoconf-exception-3.0.html"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/MITNFA"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-3.0.html",
+      "detailsUrl": "https://spdx.org/licenses/MMIXware.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-3.0.json",
-      "referenceNumber": 236,
-      "name": "Creative Commons Attribution 3.0 Unported",
-      "licenseId": "CC-BY-3.0",
+      "isOsiApproved": false,
+      "licenseId": "MMIXware",
+      "name": "MMIXware License",
+      "reference": "https://spdx.org/licenses/MMIXware.html",
+      "referenceNumber": 474,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by/3.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://gitlab.lrz.de/mmix/mmixware/-/blob/master/boilerplate.w"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Qhull.html",
+      "detailsUrl": "https://spdx.org/licenses/Motosoto.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Qhull.json",
-      "referenceNumber": 237,
-      "name": "Qhull License",
-      "licenseId": "Qhull",
+      "isOsiApproved": true,
+      "licenseId": "Motosoto",
+      "name": "Motosoto License",
+      "reference": "https://spdx.org/licenses/Motosoto.html",
+      "referenceNumber": 627,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Qhull"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/Motosoto"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.3-no-invariants-only.=
html",
+      "detailsUrl": "https://spdx.org/licenses/MPEG-SSG.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-no-invariants-only=
.json",
-      "referenceNumber": 238,
-      "name": "GNU Free Documentation License v1.3 only - no invariants",
-      "licenseId": "GFDL-1.3-no-invariants-only",
+      "isOsiApproved": false,
+      "licenseId": "MPEG-SSG",
+      "name": "MPEG Software Simulation",
+      "reference": "https://spdx.org/licenses/MPEG-SSG.html",
+      "referenceNumber": 417,
       "seeAlso": [
-        "https://www.gnu.org/licenses/fdl-1.3.txt"
-      ],
-      "isOsiApproved": false
+        "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/conv=
erter/ppm/ppmtompeg/jrevdct.c#l1189"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/TORQUE-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/mpi-permissive.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/TORQUE-1.1.json",
-      "referenceNumber": 239,
-      "name": "TORQUE v2.5+ Software License v1.1",
-      "licenseId": "TORQUE-1.1",
+      "isOsiApproved": false,
+      "licenseId": "mpi-permissive",
+      "name": "mpi Permissive License",
+      "reference": "https://spdx.org/licenses/mpi-permissive.html",
+      "referenceNumber": 80,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/TORQUEv1.1"
-      ],
-      "isOsiApproved": false
+        "https://sources.debian.org/src/openmpi/4.1.0-10/ompi/debuggers/ms=
gq_interface.h/?hl=3D19#L19"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MS-PL.html",
+      "detailsUrl": "https://spdx.org/licenses/mpich2.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MS-PL.json",
-      "referenceNumber": 240,
-      "name": "Microsoft Public License",
-      "licenseId": "MS-PL",
+      "isOsiApproved": false,
+      "licenseId": "mpich2",
+      "name": "mpich2 License",
+      "reference": "https://spdx.org/licenses/mpich2.html",
+      "referenceNumber": 482,
       "seeAlso": [
-        "http://www.microsoft.com/opensource/licenses.mspx",
-        "https://opensource.org/licenses/MS-PL"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://fedoraproject.org/wiki/Licensing/MIT"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Apache-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/MPL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Apache-1.0.json",
-      "referenceNumber": 241,
-      "name": "Apache License 1.0",
-      "licenseId": "Apache-1.0",
+      "isOsiApproved": true,
+      "licenseId": "MPL-1.0",
+      "name": "Mozilla Public License 1.0",
+      "reference": "https://spdx.org/licenses/MPL-1.0.html",
+      "referenceNumber": 28,
       "seeAlso": [
-        "http://www.apache.org/licenses/LICENSE-1.0"
-      ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+        "http://www.mozilla.org/MPL/MPL-1.0.html",
+        "https://opensource.org/licenses/MPL-1.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/copyleft-next-0.3.1.html",
+      "detailsUrl": "https://spdx.org/licenses/MPL-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/copyleft-next-0.3.1.json",
-      "referenceNumber": 242,
-      "name": "copyleft-next 0.3.1",
-      "licenseId": "copyleft-next-0.3.1",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "MPL-1.1",
+      "name": "Mozilla Public License 1.1",
+      "reference": "https://spdx.org/licenses/MPL-1.1.html",
+      "referenceNumber": 619,
       "seeAlso": [
-        "https://github.com/copyleft-next/copyleft-next/blob/master/Releas=
es/copyleft-next-0.3.1"
-      ],
-      "isOsiApproved": false
+        "http://www.mozilla.org/MPL/MPL-1.1.html",
+        "https://opensource.org/licenses/MPL-1.1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.2-or-later.html",
+      "detailsUrl": "https://spdx.org/licenses/MPL-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-or-later.json",
-      "referenceNumber": 243,
-      "name": "GNU Free Documentation License v1.2 or later",
-      "licenseId": "GFDL-1.2-or-later",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "MPL-2.0",
+      "name": "Mozilla Public License 2.0",
+      "reference": "https://spdx.org/licenses/MPL-2.0.html",
+      "referenceNumber": 263,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
-      ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+        "https://www.mozilla.org/MPL/2.0/",
+        "https://opensource.org/licenses/MPL-2.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GPL-3.0+.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GPL-3.0+.json",
-      "referenceNumber": 244,
-      "name": "GNU General Public License v3.0 or later",
-      "licenseId": "GPL-3.0+",
+      "detailsUrl": "https://spdx.org/licenses/MPL-2.0-no-copyleft-excepti=
on.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": true,
+      "licenseId": "MPL-2.0-no-copyleft-exception",
+      "name": "Mozilla Public License 2.0 (no copyleft exception)",
+      "reference": "https://spdx.org/licenses/MPL-2.0-no-copyleft-exceptio=
n.html",
+      "referenceNumber": 455,
       "seeAlso": [
-        "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
-        "https://opensource.org/licenses/GPL-3.0"
-      ],
-      "isOsiApproved": true
+        "https://www.mozilla.org/MPL/2.0/",
+        "https://opensource.org/licenses/MPL-2.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MulanPSL-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/mplus.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MulanPSL-2.0.json",
-      "referenceNumber": 245,
-      "name": "Mulan Permissive Software License, Version 2",
-      "licenseId": "MulanPSL-2.0",
+      "isOsiApproved": false,
+      "licenseId": "mplus",
+      "name": "mplus Font License",
+      "reference": "https://spdx.org/licenses/mplus.html",
+      "referenceNumber": 541,
       "seeAlso": [
-        "https://license.coscl.org.cn/MulanPSL2/"
-      ],
-      "isOsiApproved": true
+        "https://fedoraproject.org/wiki/Licensing:Mplus?rd=3DLicensing/mpl=
us"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/FSFAP.html",
+      "detailsUrl": "https://spdx.org/licenses/MS-LPL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/FSFAP.json",
-      "referenceNumber": 246,
-      "name": "FSF All Permissive License",
-      "licenseId": "FSFAP",
-      "seeAlso": [
-        "https://www.gnu.org/prep/maintain/html_node/License-Notices-for-O=
ther-Files.html"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "MS-LPL",
+      "name": "Microsoft Limited Public License",
+      "reference": "https://spdx.org/licenses/MS-LPL.html",
+      "referenceNumber": 528,
+      "seeAlso": [
+        "https://www.openhub.net/licenses/mslpl",
+        "https://github.com/gabegundy/atlserver/blob/master/License.txt",
+        "https://en.wikipedia.org/wiki/Shared_Source_Initiative#Microsoft_=
Limited_Public_License_(Ms-LPL)"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Xerox.html",
+      "detailsUrl": "https://spdx.org/licenses/MS-PL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Xerox.json",
-      "referenceNumber": 247,
-      "name": "Xerox License",
-      "licenseId": "Xerox",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "MS-PL",
+      "name": "Microsoft Public License",
+      "reference": "https://spdx.org/licenses/MS-PL.html",
+      "referenceNumber": 499,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Xerox"
-      ],
-      "isOsiApproved": false
+        "http://www.microsoft.com/opensource/licenses.mspx",
+        "https://opensource.org/licenses/MS-PL"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CDDL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/MS-RL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CDDL-1.0.json",
-      "referenceNumber": 248,
-      "name": "Common Development and Distribution License 1.0",
-      "licenseId": "CDDL-1.0",
-      "seeAlso": [
-        "https://opensource.org/licenses/cddl1"
-      ],
+      "isFsfLibre": true,
       "isOsiApproved": true,
-      "isFsfLibre": true
+      "licenseId": "MS-RL",
+      "name": "Microsoft Reciprocal License",
+      "reference": "https://spdx.org/licenses/MS-RL.html",
+      "referenceNumber": 343,
+      "seeAlso": [
+        "http://www.microsoft.com/opensource/licenses.mspx",
+        "https://opensource.org/licenses/MS-RL"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.3-invariants-only.htm=
l",
+      "detailsUrl": "https://spdx.org/licenses/MTLL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-invariants-only.js=
on",
-      "referenceNumber": 249,
-      "name": "GNU Free Documentation License v1.3 only - invariants",
-      "licenseId": "GFDL-1.3-invariants-only",
+      "isOsiApproved": false,
+      "licenseId": "MTLL",
+      "name": "Matrix Template Library License",
+      "reference": "https://spdx.org/licenses/MTLL.html",
+      "referenceNumber": 137,
       "seeAlso": [
-        "https://www.gnu.org/licenses/fdl-1.3.txt"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/Matrix_Template_Library_=
License"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/etalab-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/MulanPSL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/etalab-2.0.json",
-      "referenceNumber": 250,
-      "name": "Etalab Open License 2.0",
-      "licenseId": "etalab-2.0",
+      "isOsiApproved": false,
+      "licenseId": "MulanPSL-1.0",
+      "name": "Mulan Permissive Software License, Version 1",
+      "reference": "https://spdx.org/licenses/MulanPSL-1.0.html",
+      "referenceNumber": 107,
       "seeAlso": [
-        "https://github.com/DISIC/politique-de-contribution-open-source/bl=
ob/master/LICENSE.pdf",
-        "https://raw.githubusercontent.com/DISIC/politique-de-contribution=
-open-source/master/LICENSE"
-      ],
-      "isOsiApproved": false
+        "https://license.coscl.org.cn/MulanPSL/",
+        "https://github.com/yuwenlong/longphp/blob/25dfb70cc2a466dc4bb55ba=
30901cbce08d164b5/LICENSE"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/XFree86-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/MulanPSL-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/XFree86-1.1.json",
-      "referenceNumber": 251,
-      "name": "XFree86 License 1.1",
-      "licenseId": "XFree86-1.1",
+      "isOsiApproved": true,
+      "licenseId": "MulanPSL-2.0",
+      "name": "Mulan Permissive Software License, Version 2",
+      "reference": "https://spdx.org/licenses/MulanPSL-2.0.html",
+      "referenceNumber": 490,
       "seeAlso": [
-        "http://www.xfree86.org/current/LICENSE4.html"
-      ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+        "https://license.coscl.org.cn/MulanPSL2"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SNIA.html",
+      "detailsUrl": "https://spdx.org/licenses/Multics.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SNIA.json",
-      "referenceNumber": 252,
-      "name": "SNIA Public License 1.1",
-      "licenseId": "SNIA",
+      "isOsiApproved": true,
+      "licenseId": "Multics",
+      "name": "Multics License",
+      "reference": "https://spdx.org/licenses/Multics.html",
+      "referenceNumber": 573,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/SNIA_Public_License"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/Multics"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LPPL-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/Mup.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LPPL-1.1.json",
-      "referenceNumber": 253,
-      "name": "LaTeX Project Public License v1.1",
-      "licenseId": "LPPL-1.1",
+      "isOsiApproved": false,
+      "licenseId": "Mup",
+      "name": "Mup License",
+      "reference": "https://spdx.org/licenses/Mup.html",
+      "referenceNumber": 440,
       "seeAlso": [
-        "http://www.latex-project.org/lppl/lppl-1-1.txt"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/Mup"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CATOSL-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/NAIST-2003.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CATOSL-1.1.json",
-      "referenceNumber": 254,
-      "name": "Computer Associates Trusted Open Source License 1.1",
-      "licenseId": "CATOSL-1.1",
+      "isOsiApproved": false,
+      "licenseId": "NAIST-2003",
+      "name": "Nara Institute of Science and Technology License (2003)",
+      "reference": "https://spdx.org/licenses/NAIST-2003.html",
+      "referenceNumber": 104,
       "seeAlso": [
-        "https://opensource.org/licenses/CATOSL-1.1"
-      ],
-      "isOsiApproved": true
+        "https://enterprise.dejacode.com/licenses/public/naist-2003/#licen=
se-text",
+        "https://github.com/nodejs/node/blob/4a19cc8947b1bba2b2d27816ec3d0=
edf9b28e503/LICENSE#L343"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/TU-Berlin-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/NASA-1.3.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/TU-Berlin-2.0.json",
-      "referenceNumber": 255,
-      "name": "Technische Universitaet Berlin License 2.0",
-      "licenseId": "TU-Berlin-2.0",
+      "isFsfLibre": false,
+      "isOsiApproved": true,
+      "licenseId": "NASA-1.3",
+      "name": "NASA Open Source Agreement 1.3",
+      "reference": "https://spdx.org/licenses/NASA-1.3.html",
+      "referenceNumber": 127,
       "seeAlso": [
-        "https://github.com/CorsixTH/deps/blob/fd339a9f526d1d9c9f01ccf39e4=
38a015da50035/licences/libgsm.txt"
-      ],
-      "isOsiApproved": false
+        "http://ti.arc.nasa.gov/opensource/nosa/",
+        "https://opensource.org/licenses/NASA-1.3"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.3.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3.json",
-      "referenceNumber": 256,
-      "name": "GNU Free Documentation License v1.3",
-      "licenseId": "GFDL-1.3",
+      "detailsUrl": "https://spdx.org/licenses/Naumen.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": true,
+      "licenseId": "Naumen",
+      "name": "Naumen Public License",
+      "reference": "https://spdx.org/licenses/Naumen.html",
+      "referenceNumber": 128,
       "seeAlso": [
-        "https://www.gnu.org/licenses/fdl-1.3.txt"
-      ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+        "https://opensource.org/licenses/Naumen"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.3-or-later.html",
+      "detailsUrl": "https://spdx.org/licenses/NBPL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-or-later.json",
-      "referenceNumber": 257,
-      "name": "GNU Free Documentation License v1.3 or later",
-      "licenseId": "GFDL-1.3-or-later",
-      "seeAlso": [
-        "https://www.gnu.org/licenses/fdl-1.3.txt"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "NBPL-1.0",
+      "name": "Net Boolean Public License v1",
+      "reference": "https://spdx.org/licenses/NBPL-1.0.html",
+      "referenceNumber": 41,
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Dblo=
b;f=3DLICENSE;hb=3D37b4b3f6cc4bf34e1d3dec61e69914b9819d8894"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LAL-1.2.html",
+      "detailsUrl": "https://spdx.org/licenses/NCBI-PD.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LAL-1.2.json",
-      "referenceNumber": 258,
-      "name": "Licence Art Libre 1.2",
-      "licenseId": "LAL-1.2",
+      "isOsiApproved": false,
+      "licenseId": "NCBI-PD",
+      "name": "NCBI Public Domain Notice",
+      "reference": "https://spdx.org/licenses/NCBI-PD.html",
+      "referenceNumber": 362,
       "seeAlso": [
-        "http://artlibre.org/licence/lal/licence-art-libre-12/"
-      ],
-      "isOsiApproved": false
+        "https://github.com/ncbi/sra-tools/blob/e8e5b6af4edc460156ad9ce590=
2d0779cffbf685/LICENSE",
+        "https://github.com/ncbi/datasets/blob/0ea4cd16b61e5b799d9cc55aecf=
a016d6c9bd2bf/LICENSE.md",
+        "https://github.com/ncbi/gprobe/blob/de64d30fee8b4c4013094d7d3139e=
a89b5dd1ace/LICENSE",
+        "https://github.com/ncbi/egapx/blob/08930b9dec0c69b2d1a05e5153c7b9=
5ef0a3eb0f/LICENSE",
+        "https://github.com/ncbi/datasets/blob/master/LICENSE.md"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/ICU.html",
+      "detailsUrl": "https://spdx.org/licenses/NCGL-UK-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/ICU.json",
-      "referenceNumber": 259,
-      "name": "ICU License",
-      "licenseId": "ICU",
+      "isOsiApproved": false,
+      "licenseId": "NCGL-UK-2.0",
+      "name": "Non-Commercial Government Licence",
+      "reference": "https://spdx.org/licenses/NCGL-UK-2.0.html",
+      "referenceNumber": 320,
       "seeAlso": [
-        "http://source.icu-project.org/repos/icu/icu/trunk/license.html"
-      ],
-      "isOsiApproved": false
+        "http://www.nationalarchives.gov.uk/doc/non-commercial-government-=
licence/version/2/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/FTL.html",
+      "detailsUrl": "https://spdx.org/licenses/NCL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/FTL.json",
-      "referenceNumber": 260,
-      "name": "Freetype Project License",
-      "licenseId": "FTL",
-      "seeAlso": [
-        "http://freetype.fis.uniroma2.it/FTL.TXT",
-        "http://git.savannah.gnu.org/cgit/freetype/freetype2.git/tree/docs=
/FTL.TXT",
-        "http://gitlab.freedesktop.org/freetype/freetype/-/raw/master/docs=
/FTL.TXT"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "NCL",
+      "name": "NCL Source Code License",
+      "reference": "https://spdx.org/licenses/NCL.html",
+      "referenceNumber": 153,
+      "seeAlso": [
+        "https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/master/sr=
c/modules/module-filter-chain/pffft.c?ref_type=3Dheads#L1-52"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MirOS.html",
+      "detailsUrl": "https://spdx.org/licenses/NCSA.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MirOS.json",
-      "referenceNumber": 261,
-      "name": "The MirOS Licence",
-      "licenseId": "MirOS",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "NCSA",
+      "name": "University of Illinois/NCSA Open Source License",
+      "reference": "https://spdx.org/licenses/NCSA.html",
+      "referenceNumber": 557,
       "seeAlso": [
-        "https://opensource.org/licenses/MirOS"
-      ],
-      "isOsiApproved": true
+        "http://otm.illinois.edu/uiuc_openSource",
+        "https://opensource.org/licenses/NCSA"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-2-Clause-NetBSD.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-NetBSD.json",
-      "referenceNumber": 262,
-      "name": "BSD 2-Clause NetBSD License",
-      "licenseId": "BSD-2-Clause-NetBSD",
+      "detailsUrl": "https://spdx.org/licenses/Net-SNMP.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Net-SNMP",
+      "name": "Net-SNMP License",
+      "reference": "https://spdx.org/licenses/Net-SNMP.html",
+      "referenceNumber": 234,
       "seeAlso": [
-        "http://www.netbsd.org/about/redistribution.html#default"
-      ],
-      "isOsiApproved": false
+        "http://net-snmp.sourceforge.net/about/license.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0.html",
+      "detailsUrl": "https://spdx.org/licenses/NetCDF.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-3.0.json",
-      "referenceNumber": 263,
-      "name": "Creative Commons Attribution Non Commercial No Derivatives =
3.0 Unported",
-      "licenseId": "CC-BY-NC-ND-3.0",
+      "isOsiApproved": false,
+      "licenseId": "NetCDF",
+      "name": "NetCDF license",
+      "reference": "https://spdx.org/licenses/NetCDF.html",
+      "referenceNumber": 503,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc-nd/3.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "http://www.unidata.ucar.edu/software/netcdf/copyright.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OSET-PL-2.1.html",
+      "detailsUrl": "https://spdx.org/licenses/Newsletr.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OSET-PL-2.1.json",
-      "referenceNumber": 264,
-      "name": "OSET Public License version 2.1",
-      "licenseId": "OSET-PL-2.1",
+      "isOsiApproved": false,
+      "licenseId": "Newsletr",
+      "name": "Newsletr License",
+      "reference": "https://spdx.org/licenses/Newsletr.html",
+      "referenceNumber": 412,
       "seeAlso": [
-        "http://www.osetfoundation.org/public-license",
-        "https://opensource.org/licenses/OPL-2.1"
-      ],
-      "isOsiApproved": true
+        "https://fedoraproject.org/wiki/Licensing/Newsletr"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/NGPL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-2.0.json",
-      "referenceNumber": 265,
-      "name": "Creative Commons Attribution Non Commercial No Derivatives =
2.0 Generic",
-      "licenseId": "CC-BY-NC-ND-2.0",
+      "isOsiApproved": true,
+      "licenseId": "NGPL",
+      "name": "Nethack General Public License",
+      "reference": "https://spdx.org/licenses/NGPL.html",
+      "referenceNumber": 275,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc-nd/2.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/NGPL"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SISSL-1.2.html",
+      "detailsUrl": "https://spdx.org/licenses/NICTA-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SISSL-1.2.json",
-      "referenceNumber": 266,
-      "name": "Sun Industry Standards Source License v1.2",
-      "licenseId": "SISSL-1.2",
+      "isOsiApproved": false,
+      "licenseId": "NICTA-1.0",
+      "name": "NICTA Public Software License, Version 1.0",
+      "reference": "https://spdx.org/licenses/NICTA-1.0.html",
+      "referenceNumber": 311,
       "seeAlso": [
-        "http://gridscheduler.sourceforge.net/Gridengine_SISSL_license.htm=
l"
-      ],
-      "isOsiApproved": false
+        "https://opensource.apple.com/source/mDNSResponder/mDNSResponder-3=
20.10/mDNSPosix/nss_ReadMe.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Wsuipa.html",
+      "detailsUrl": "https://spdx.org/licenses/NIST-PD.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Wsuipa.json",
-      "referenceNumber": 267,
-      "name": "Wsuipa License",
-      "licenseId": "Wsuipa",
+      "isOsiApproved": false,
+      "licenseId": "NIST-PD",
+      "name": "NIST Public Domain Notice",
+      "reference": "https://spdx.org/licenses/NIST-PD.html",
+      "referenceNumber": 309,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Wsuipa"
-      ],
-      "isOsiApproved": false
+        "https://github.com/tcheneau/simpleRPL/blob/e645e69e38dd4e3ccfeceb=
2db8cba05b7c2e0cd3/LICENSE.txt",
+        "https://github.com/tcheneau/Routing/blob/f09f46fcfe636107f22f2c98=
348188a65a135d98/README.md"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Zimbra-1.4.html",
+      "detailsUrl": "https://spdx.org/licenses/NIST-PD-fallback.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Zimbra-1.4.json",
-      "referenceNumber": 268,
-      "name": "Zimbra Public License v1.4",
-      "licenseId": "Zimbra-1.4",
+      "isOsiApproved": false,
+      "licenseId": "NIST-PD-fallback",
+      "name": "NIST Public Domain Notice with license fallback",
+      "reference": "https://spdx.org/licenses/NIST-PD-fallback.html",
+      "referenceNumber": 34,
       "seeAlso": [
-        "http://www.zimbra.com/legal/zimbra-public-license-1-4"
-      ],
-      "isOsiApproved": false
+        "https://github.com/usnistgov/jsip/blob/59700e6926cbe96c5cdae897d9=
a7d2656b42abe3/LICENSE",
+        "https://github.com/usnistgov/fipy/blob/86aaa5c2ba2c6f1be19593c598=
6071cf6568cc34/LICENSE.rst"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Linux-OpenIB.html",
+      "detailsUrl": "https://spdx.org/licenses/NIST-Software.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Linux-OpenIB.json",
-      "referenceNumber": 269,
-      "name": "Linux Kernel Variant of OpenIB.org license",
-      "licenseId": "Linux-OpenIB",
+      "isOsiApproved": false,
+      "licenseId": "NIST-Software",
+      "name": "NIST Software License",
+      "reference": "https://spdx.org/licenses/NIST-Software.html",
+      "referenceNumber": 76,
       "seeAlso": [
-        "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/drivers/infiniband/core/sa.h"
-      ],
-      "isOsiApproved": false
+        "https://github.com/open-quantum-safe/liboqs/blob/40b01fdbb270f861=
4fde30e65d30e9da18c02393/src/common/rand/rand_nist.c#L1-L15"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LGPL-3.0.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0.json",
-      "referenceNumber": 270,
-      "name": "GNU Lesser General Public License v3.0 only",
-      "licenseId": "LGPL-3.0",
+      "detailsUrl": "https://spdx.org/licenses/NLOD-1.0.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "NLOD-1.0",
+      "name": "Norwegian Licence for Open Government Data (NLOD) 1.0",
+      "reference": "https://spdx.org/licenses/NLOD-1.0.html",
+      "referenceNumber": 565,
       "seeAlso": [
-        "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
-        "https://opensource.org/licenses/LGPL-3.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "http://data.norge.no/nlod/en/1.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-2.5.html",
+      "detailsUrl": "https://spdx.org/licenses/NLOD-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.5.json",
-      "referenceNumber": 271,
-      "name": "Open LDAP Public License v2.5",
-      "licenseId": "OLDAP-2.5",
+      "isOsiApproved": false,
+      "licenseId": "NLOD-2.0",
+      "name": "Norwegian Licence for Open Government Data (NLOD) 2.0",
+      "reference": "https://spdx.org/licenses/NLOD-2.0.html",
+      "referenceNumber": 483,
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u0=
03dblob;f\u003dLICENSE;hb\u003d6852b9d90022e8593c98205413380536b1b5a7cf"
-      ],
-      "isOsiApproved": false
+        "http://data.norge.no/nlod/en/2.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/AMPAS.html",
+      "detailsUrl": "https://spdx.org/licenses/NLPL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/AMPAS.json",
-      "referenceNumber": 272,
-      "name": "Academy of Motion Picture Arts and Sciences BSD",
-      "licenseId": "AMPAS",
+      "isOsiApproved": false,
+      "licenseId": "NLPL",
+      "name": "No Limit Public License",
+      "reference": "https://spdx.org/licenses/NLPL.html",
+      "referenceNumber": 71,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/BSD#AMPASBSD"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/NLPL"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GPL-1.0-or-later.html",
+      "detailsUrl": "https://spdx.org/licenses/Nokia.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GPL-1.0-or-later.json",
-      "referenceNumber": 273,
-      "name": "GNU General Public License v1.0 or later",
-      "licenseId": "GPL-1.0-or-later",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "Nokia",
+      "name": "Nokia Open Source License",
+      "reference": "https://spdx.org/licenses/Nokia.html",
+      "referenceNumber": 44,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.html"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/nokia"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BUSL-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/NOSL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BUSL-1.1.json",
-      "referenceNumber": 274,
-      "name": "Business Source License 1.1",
-      "licenseId": "BUSL-1.1",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "NOSL",
+      "name": "Netizen Open Source License",
+      "reference": "https://spdx.org/licenses/NOSL.html",
+      "referenceNumber": 126,
       "seeAlso": [
-        "https://mariadb.com/bsl11/"
-      ],
-      "isOsiApproved": false
+        "http://bits.netizen.com.au/licenses/NOSL/nosl.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Adobe-Glyph.html",
+      "detailsUrl": "https://spdx.org/licenses/Noweb.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Adobe-Glyph.json",
-      "referenceNumber": 275,
-      "name": "Adobe Glyph List License",
-      "licenseId": "Adobe-Glyph",
+      "isOsiApproved": false,
+      "licenseId": "Noweb",
+      "name": "Noweb License",
+      "reference": "https://spdx.org/licenses/Noweb.html",
+      "referenceNumber": 534,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/MIT#AdobeGlyph"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/Noweb"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/0BSD.html",
+      "detailsUrl": "https://spdx.org/licenses/NPL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/0BSD.json",
-      "referenceNumber": 276,
-      "name": "BSD Zero Clause License",
-      "licenseId": "0BSD",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "NPL-1.0",
+      "name": "Netscape Public License v1.0",
+      "reference": "https://spdx.org/licenses/NPL-1.0.html",
+      "referenceNumber": 346,
       "seeAlso": [
-        "http://landley.net/toybox/license.html"
-      ],
-      "isOsiApproved": true
+        "http://www.mozilla.org/MPL/NPL/1.0/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/W3C-19980720.html",
+      "detailsUrl": "https://spdx.org/licenses/NPL-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/W3C-19980720.json",
-      "referenceNumber": 277,
-      "name": "W3C Software Notice and License (1998-07-20)",
-      "licenseId": "W3C-19980720",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "NPL-1.1",
+      "name": "Netscape Public License v1.1",
+      "reference": "https://spdx.org/licenses/NPL-1.1.html",
+      "referenceNumber": 418,
       "seeAlso": [
-        "http://www.w3.org/Consortium/Legal/copyright-software-19980720.ht=
ml"
-      ],
-      "isOsiApproved": false
+        "http://www.mozilla.org/MPL/NPL/1.1/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/FSFUL.html",
+      "detailsUrl": "https://spdx.org/licenses/NPOSL-3.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/FSFUL.json",
-      "referenceNumber": 278,
-      "name": "FSF Unlimited License",
-      "licenseId": "FSFUL",
+      "isOsiApproved": true,
+      "licenseId": "NPOSL-3.0",
+      "name": "Non-Profit Open Software License 3.0",
+      "reference": "https://spdx.org/licenses/NPOSL-3.0.html",
+      "referenceNumber": 579,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/FSF_Unlimited_License"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/NOSL3.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0.html",
+      "detailsUrl": "https://spdx.org/licenses/NRL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-3.0.json",
-      "referenceNumber": 279,
-      "name": "Creative Commons Attribution Non Commercial Share Alike 3.0=
 Unported",
-      "licenseId": "CC-BY-NC-SA-3.0",
+      "isOsiApproved": false,
+      "licenseId": "NRL",
+      "name": "NRL License",
+      "reference": "https://spdx.org/licenses/NRL.html",
+      "referenceNumber": 230,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc-sa/3.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "http://web.mit.edu/network/isakmp/nrllicense.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/DOC.html",
+      "detailsUrl": "https://spdx.org/licenses/NTP.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/DOC.json",
-      "referenceNumber": 280,
-      "name": "DOC License",
-      "licenseId": "DOC",
+      "isOsiApproved": true,
+      "licenseId": "NTP",
+      "name": "NTP License",
+      "reference": "https://spdx.org/licenses/NTP.html",
+      "referenceNumber": 547,
       "seeAlso": [
-        "http://www.cs.wustl.edu/~schmidt/ACE-copying.html",
-        "https://www.dre.vanderbilt.edu/~schmidt/ACE-copying.html"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/NTP"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/TMate.html",
+      "detailsUrl": "https://spdx.org/licenses/NTP-0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/TMate.json",
-      "referenceNumber": 281,
-      "name": "TMate Open Source License",
-      "licenseId": "TMate",
+      "isOsiApproved": false,
+      "licenseId": "NTP-0",
+      "name": "NTP No Attribution",
+      "reference": "https://spdx.org/licenses/NTP-0.html",
+      "referenceNumber": 460,
       "seeAlso": [
-        "http://svnkit.com/license.html"
-      ],
-      "isOsiApproved": false
+        "https://github.com/tytso/e2fsprogs/blob/master/lib/et/et_name.c"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MIT-open-group.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MIT-open-group.json",
-      "referenceNumber": 282,
-      "name": "MIT Open Group variant",
-      "licenseId": "MIT-open-group",
+      "detailsUrl": "https://spdx.org/licenses/Nunit.json",
+      "isDeprecatedLicenseId": true,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "Nunit",
+      "name": "Nunit License",
+      "reference": "https://spdx.org/licenses/Nunit.html",
+      "referenceNumber": 634,
       "seeAlso": [
-        "https://gitlab.freedesktop.org/xorg/app/iceauth/-/blob/master/COP=
YING",
-        "https://gitlab.freedesktop.org/xorg/app/xvinfo/-/blob/master/COPY=
ING",
-        "https://gitlab.freedesktop.org/xorg/app/xsetroot/-/blob/master/CO=
PYING",
-        "https://gitlab.freedesktop.org/xorg/app/xauth/-/blob/master/COPYI=
NG"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/Nunit"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/AMDPLPA.html",
+      "detailsUrl": "https://spdx.org/licenses/O-UDA-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/AMDPLPA.json",
-      "referenceNumber": 283,
-      "name": "AMD\u0027s plpa_map.c License",
-      "licenseId": "AMDPLPA",
+      "isOsiApproved": false,
+      "licenseId": "O-UDA-1.0",
+      "name": "Open Use of Data Agreement v1.0",
+      "reference": "https://spdx.org/licenses/O-UDA-1.0.html",
+      "referenceNumber": 191,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/AMD_plpa_map_License"
-      ],
-      "isOsiApproved": false
+        "https://github.com/microsoft/Open-Use-of-Data-Agreement/blob/v1.0=
/O-UDA-1.0.md",
+        "https://cdla.dev/open-use-of-data-agreement-v1-0/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Condor-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/OAR.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Condor-1.1.json",
-      "referenceNumber": 284,
-      "name": "Condor Public License v1.1",
-      "licenseId": "Condor-1.1",
-      "seeAlso": [
-        "http://research.cs.wisc.edu/condor/license.html#condor",
-        "http://web.archive.org/web/20111123062036/http://research.cs.wisc=
.edu/condor/license.html#condor"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "OAR",
+      "name": "OAR License",
+      "reference": "https://spdx.org/licenses/OAR.html",
+      "referenceNumber": 4,
+      "seeAlso": [
+        "https://sourceware.org/git/?p=3Dnewlib-cygwin.git;a=3Dblob;f=3Dne=
wlib/libc/string/strsignal.c;hb=3DHEAD#l35"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/PolyForm-Noncommercial-1.0.0=
.html",
+      "detailsUrl": "https://spdx.org/licenses/OCCT-PL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/PolyForm-Noncommercial-1.0.=
0.json",
-      "referenceNumber": 285,
-      "name": "PolyForm Noncommercial License 1.0.0",
-      "licenseId": "PolyForm-Noncommercial-1.0.0",
+      "isOsiApproved": false,
+      "licenseId": "OCCT-PL",
+      "name": "Open CASCADE Technology Public License",
+      "reference": "https://spdx.org/licenses/OCCT-PL.html",
+      "referenceNumber": 596,
       "seeAlso": [
-        "https://polyformproject.org/licenses/noncommercial/1.0.0"
-      ],
-      "isOsiApproved": false
+        "http://www.opencascade.com/content/occt-public-license"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Military-Lic=
ense.html",
+      "detailsUrl": "https://spdx.org/licenses/OCLC-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Military-Li=
cense.json",
-      "referenceNumber": 286,
-      "name": "BSD 3-Clause No Military License",
-      "licenseId": "BSD-3-Clause-No-Military-License",
+      "isOsiApproved": true,
+      "licenseId": "OCLC-2.0",
+      "name": "OCLC Research Public License 2.0",
+      "reference": "https://spdx.org/licenses/OCLC-2.0.html",
+      "referenceNumber": 308,
       "seeAlso": [
-        "https://gitlab.syncad.com/hive/dhive/-/blob/master/LICENSE",
-        "https://github.com/greymass/swift-eosio/blob/master/LICENSE"
-      ],
-      "isOsiApproved": false
+        "http://www.oclc.org/research/activities/software/license/v2final.=
htm",
+        "https://opensource.org/licenses/OCLC-2.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-4.0.html",
+      "detailsUrl": "https://spdx.org/licenses/ODbL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-4.0.json",
-      "referenceNumber": 287,
-      "name": "Creative Commons Attribution 4.0 International",
-      "licenseId": "CC-BY-4.0",
-      "seeAlso": [
-        "https://creativecommons.org/licenses/by/4.0/legalcode"
-      ],
+      "isFsfLibre": true,
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "ODbL-1.0",
+      "name": "Open Data Commons Open Database License v1.0",
+      "reference": "https://spdx.org/licenses/ODbL-1.0.html",
+      "referenceNumber": 243,
+      "seeAlso": [
+        "http://www.opendatacommons.org/licenses/odbl/1.0/",
+        "https://opendatacommons.org/licenses/odbl/1-0/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OGL-Canada-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/ODC-By-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OGL-Canada-2.0.json",
-      "referenceNumber": 288,
-      "name": "Open Government Licence - Canada",
-      "licenseId": "OGL-Canada-2.0",
+      "isOsiApproved": false,
+      "licenseId": "ODC-By-1.0",
+      "name": "Open Data Commons Attribution License v1.0",
+      "reference": "https://spdx.org/licenses/ODC-By-1.0.html",
+      "referenceNumber": 7,
       "seeAlso": [
-        "https://open.canada.ca/en/open-government-licence-canada"
-      ],
-      "isOsiApproved": false
+        "https://opendatacommons.org/licenses/by/1.0/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-IGO.html",
+      "detailsUrl": "https://spdx.org/licenses/OFFIS.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-3.0-IGO.json",
-      "referenceNumber": 289,
-      "name": "Creative Commons Attribution Non Commercial Share Alike 3.0=
 IGO",
-      "licenseId": "CC-BY-NC-SA-3.0-IGO",
+      "isOsiApproved": false,
+      "licenseId": "OFFIS",
+      "name": "OFFIS License",
+      "reference": "https://spdx.org/licenses/OFFIS.html",
+      "referenceNumber": 238,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc-sa/3.0/igo/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://sourceforge.net/p/xmedcon/code/ci/master/tree/libs/dicom/=
README"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/EFL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/EFL-1.0.json",
-      "referenceNumber": 290,
-      "name": "Eiffel Forum License v1.0",
-      "licenseId": "EFL-1.0",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "OFL-1.0",
+      "name": "SIL Open Font License 1.0",
+      "reference": "https://spdx.org/licenses/OFL-1.0.html",
+      "referenceNumber": 475,
       "seeAlso": [
-        "http://www.eiffel-nice.org/license/forum.txt",
-        "https://opensource.org/licenses/EFL-1.0"
-      ],
-      "isOsiApproved": true
+        "http://scripts.sil.org/cms/scripts/page.php?item_id=3DOFL10_web"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Newsletr.html",
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.0-no-RFN.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Newsletr.json",
-      "referenceNumber": 291,
-      "name": "Newsletr License",
-      "licenseId": "Newsletr",
+      "isOsiApproved": false,
+      "licenseId": "OFL-1.0-no-RFN",
+      "name": "SIL Open Font License 1.0 with no Reserved Font Name",
+      "reference": "https://spdx.org/licenses/OFL-1.0-no-RFN.html",
+      "referenceNumber": 23,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Newsletr"
-      ],
-      "isOsiApproved": false
+        "http://scripts.sil.org/cms/scripts/page.php?item_id=3DOFL10_web"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/copyleft-next-0.3.0.html",
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.0-RFN.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/copyleft-next-0.3.0.json",
-      "referenceNumber": 292,
-      "name": "copyleft-next 0.3.0",
-      "licenseId": "copyleft-next-0.3.0",
+      "isOsiApproved": false,
+      "licenseId": "OFL-1.0-RFN",
+      "name": "SIL Open Font License 1.0 with Reserved Font Name",
+      "reference": "https://spdx.org/licenses/OFL-1.0-RFN.html",
+      "referenceNumber": 11,
       "seeAlso": [
-        "https://github.com/copyleft-next/copyleft-next/blob/master/Releas=
es/copyleft-next-0.3.0"
-      ],
-      "isOsiApproved": false
+        "http://scripts.sil.org/cms/scripts/page.php?item_id=3DOFL10_web"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GPL-3.0-or-later.html",
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-or-later.json",
-      "referenceNumber": 293,
-      "name": "GNU General Public License v3.0 or later",
-      "licenseId": "GPL-3.0-or-later",
-      "seeAlso": [
-        "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
-        "https://opensource.org/licenses/GPL-3.0"
-      ],
+      "isFsfLibre": true,
       "isOsiApproved": true,
-      "isFsfLibre": true
+      "licenseId": "OFL-1.1",
+      "name": "SIL Open Font License 1.1",
+      "reference": "https://spdx.org/licenses/OFL-1.1.html",
+      "referenceNumber": 248,
+      "seeAlso": [
+        "http://scripts.sil.org/cms/scripts/page.php?item_id=3DOFL_web",
+        "https://opensource.org/licenses/OFL-1.1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CDLA-Permissive-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.1-no-RFN.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CDLA-Permissive-2.0.json",
-      "referenceNumber": 294,
-      "name": "Community Data License Agreement Permissive 2.0",
-      "licenseId": "CDLA-Permissive-2.0",
+      "isOsiApproved": true,
+      "licenseId": "OFL-1.1-no-RFN",
+      "name": "SIL Open Font License 1.1 with no Reserved Font Name",
+      "reference": "https://spdx.org/licenses/OFL-1.1-no-RFN.html",
+      "referenceNumber": 550,
       "seeAlso": [
-        "https://cdla.dev/permissive-2-0"
-      ],
-      "isOsiApproved": false
+        "http://scripts.sil.org/cms/scripts/page.php?item_id=3DOFL_web",
+        "https://opensource.org/licenses/OFL-1.1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-ND-3.0.html",
+      "detailsUrl": "https://spdx.org/licenses/OFL-1.1-RFN.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-ND-3.0.json",
-      "referenceNumber": 295,
-      "name": "Creative Commons Attribution No Derivatives 3.0 Unported",
-      "licenseId": "CC-BY-ND-3.0",
+      "isOsiApproved": true,
+      "licenseId": "OFL-1.1-RFN",
+      "name": "SIL Open Font License 1.1 with Reserved Font Name",
+      "reference": "https://spdx.org/licenses/OFL-1.1-RFN.html",
+      "referenceNumber": 507,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nd/3.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "http://scripts.sil.org/cms/scripts/page.php?item_id=3DOFL_web",
+        "https://opensource.org/licenses/OFL-1.1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/C-UDA-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/OGC-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/C-UDA-1.0.json",
-      "referenceNumber": 296,
-      "name": "Computational Use of Data Agreement v1.0",
-      "licenseId": "C-UDA-1.0",
+      "isOsiApproved": false,
+      "licenseId": "OGC-1.0",
+      "name": "OGC Software License, Version 1.0",
+      "reference": "https://spdx.org/licenses/OGC-1.0.html",
+      "referenceNumber": 166,
       "seeAlso": [
-        "https://github.com/microsoft/Computational-Use-of-Data-Agreement/=
blob/master/C-UDA-1.0.md",
-        "https://cdla.dev/computational-use-of-data-agreement-v1-0/"
-      ],
-      "isOsiApproved": false
+        "https://www.ogc.org/ogc/software/1.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Barr.html",
+      "detailsUrl": "https://spdx.org/licenses/OGDL-Taiwan-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Barr.json",
-      "referenceNumber": 297,
-      "name": "Barr License",
-      "licenseId": "Barr",
+      "isOsiApproved": false,
+      "licenseId": "OGDL-Taiwan-1.0",
+      "name": "Taiwan Open Government Data License, version 1.0",
+      "reference": "https://spdx.org/licenses/OGDL-Taiwan-1.0.html",
+      "referenceNumber": 468,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Barr"
-      ],
-      "isOsiApproved": false
+        "https://data.gov.tw/license"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Vim.html",
+      "detailsUrl": "https://spdx.org/licenses/OGL-Canada-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Vim.json",
-      "referenceNumber": 298,
-      "name": "Vim License",
-      "licenseId": "Vim",
-      "seeAlso": [
-        "http://vimdoc.sourceforge.net/htmldoc/uganda.html"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
-    },
-    {
-      "reference": "https://spdx.org/licenses/GPL-2.0-with-classpath-excep=
tion.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-classpath-exce=
ption.json",
-      "referenceNumber": 299,
-      "name": "GNU General Public License v2.0 w/Classpath exception",
-      "licenseId": "GPL-2.0-with-classpath-exception",
+      "licenseId": "OGL-Canada-2.0",
+      "name": "Open Government Licence - Canada",
+      "reference": "https://spdx.org/licenses/OGL-Canada-2.0.html",
+      "referenceNumber": 464,
       "seeAlso": [
-        "https://www.gnu.org/software/classpath/license.html"
-      ],
-      "isOsiApproved": false
+        "https://open.canada.ca/en/open-government-licence-canada"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BitTorrent-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/OGL-UK-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BitTorrent-1.1.json",
-      "referenceNumber": 300,
-      "name": "BitTorrent Open Source License v1.1",
-      "licenseId": "BitTorrent-1.1",
-      "seeAlso": [
-        "http://directory.fsf.org/wiki/License:BitTorrentOSL1.1"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "OGL-UK-1.0",
+      "name": "Open Government Licence v1.0",
+      "reference": "https://spdx.org/licenses/OGL-UK-1.0.html",
+      "referenceNumber": 489,
+      "seeAlso": [
+        "http://www.nationalarchives.gov.uk/doc/open-government-licence/ve=
rsion/1/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CDL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/OGL-UK-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CDL-1.0.json",
-      "referenceNumber": 301,
-      "name": "Common Documentation License 1.0",
-      "licenseId": "CDL-1.0",
-      "seeAlso": [
-        "http://www.opensource.apple.com/cdl/",
-        "https://fedoraproject.org/wiki/Licensing/Common_Documentation_Lic=
ense",
-        "https://www.gnu.org/licenses/license-list.html#ACDL"
-      ],
-      "isOsiApproved": false
+      "isOsiApproved": false,
+      "licenseId": "OGL-UK-2.0",
+      "name": "Open Government Licence v2.0",
+      "reference": "https://spdx.org/licenses/OGL-UK-2.0.html",
+      "referenceNumber": 467,
+      "seeAlso": [
+        "http://www.nationalarchives.gov.uk/doc/open-government-licence/ve=
rsion/2/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-SA-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/OGL-UK-3.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-1.0.json",
-      "referenceNumber": 302,
-      "name": "Creative Commons Attribution Share Alike 1.0 Generic",
-      "licenseId": "CC-BY-SA-1.0",
+      "isOsiApproved": false,
+      "licenseId": "OGL-UK-3.0",
+      "name": "Open Government Licence v3.0",
+      "reference": "https://spdx.org/licenses/OGL-UK-3.0.html",
+      "referenceNumber": 151,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-sa/1.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "http://www.nationalarchives.gov.uk/doc/open-government-licence/ve=
rsion/3/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/ADSL.html",
+      "detailsUrl": "https://spdx.org/licenses/OGTSL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/ADSL.json",
-      "referenceNumber": 303,
-      "name": "Amazon Digital Services License",
-      "licenseId": "ADSL",
+      "isOsiApproved": true,
+      "licenseId": "OGTSL",
+      "name": "Open Group Test Suite License",
+      "reference": "https://spdx.org/licenses/OGTSL.html",
+      "referenceNumber": 367,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/AmazonDigitalServicesLic=
ense"
-      ],
-      "isOsiApproved": false
+        "http://www.opengroup.org/testing/downloads/The_Open_Group_TSL.txt=
",
+        "https://opensource.org/licenses/OGTSL"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/PostgreSQL.html",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/PostgreSQL.json",
-      "referenceNumber": 304,
-      "name": "PostgreSQL License",
-      "licenseId": "PostgreSQL",
+      "isOsiApproved": false,
+      "licenseId": "OLDAP-1.1",
+      "name": "Open LDAP Public License v1.1",
+      "reference": "https://spdx.org/licenses/OLDAP-1.1.html",
+      "referenceNumber": 180,
       "seeAlso": [
-        "http://www.postgresql.org/about/licence",
-        "https://opensource.org/licenses/PostgreSQL"
-      ],
-      "isOsiApproved": true
+        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Dblo=
b;f=3DLICENSE;hb=3D806557a5ad59804ef3a44d5abfbe91d706b0791f"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OFL-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.2.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OFL-1.1.json",
-      "referenceNumber": 305,
-      "name": "SIL Open Font License 1.1",
-      "licenseId": "OFL-1.1",
+      "isOsiApproved": false,
+      "licenseId": "OLDAP-1.2",
+      "name": "Open LDAP Public License v1.2",
+      "reference": "https://spdx.org/licenses/OLDAP-1.2.html",
+      "referenceNumber": 229,
       "seeAlso": [
-        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL_web",
-        "https://opensource.org/licenses/OFL-1.1"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Dblo=
b;f=3DLICENSE;hb=3D42b0383c50c299977b5893ee695cf4e486fb0dc7"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/NPL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.3.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NPL-1.0.json",
-      "referenceNumber": 306,
-      "name": "Netscape Public License v1.0",
-      "licenseId": "NPL-1.0",
-      "seeAlso": [
-        "http://www.mozilla.org/MPL/NPL/1.0/"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "OLDAP-1.3",
+      "name": "Open LDAP Public License v1.3",
+      "reference": "https://spdx.org/licenses/OLDAP-1.3.html",
+      "referenceNumber": 224,
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Dblo=
b;f=3DLICENSE;hb=3De5f8117f0ce088d0bd7a8e18ddf37eaa40eb09b1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/xinetd.html",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.4.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/xinetd.json",
-      "referenceNumber": 307,
-      "name": "xinetd License",
-      "licenseId": "xinetd",
-      "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Xinetd_License"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "OLDAP-1.4",
+      "name": "Open LDAP Public License v1.4",
+      "reference": "https://spdx.org/licenses/OLDAP-1.4.html",
+      "referenceNumber": 255,
+      "seeAlso": [
+        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Dblo=
b;f=3DLICENSE;hb=3Dc9f95c2f3f2ffb5e0ae55fe7388af75547660941"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LGPL-2.0-only.html",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0-only.json",
-      "referenceNumber": 308,
-      "name": "GNU Library General Public License v2 only",
-      "licenseId": "LGPL-2.0-only",
+      "isOsiApproved": false,
+      "licenseId": "OLDAP-2.0",
+      "name": "Open LDAP Public License v2.0 (or possibly 2.0A and 2.0B)",
+      "reference": "https://spdx.org/licenses/OLDAP-2.0.html",
+      "referenceNumber": 208,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.htm=
l"
-      ],
-      "isOsiApproved": true
+        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Dblo=
b;f=3DLICENSE;hb=3Dcbf50f4e1185a21abd4c0a54d3f4341fe28f36ea"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/zlib-acknowledgement.html",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.0.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/zlib-acknowledgement.json",
-      "referenceNumber": 309,
-      "name": "zlib/libpng License with Acknowledgement",
-      "licenseId": "zlib-acknowledgement",
+      "isOsiApproved": false,
+      "licenseId": "OLDAP-2.0.1",
+      "name": "Open LDAP Public License v2.0.1",
+      "reference": "https://spdx.org/licenses/OLDAP-2.0.1.html",
+      "referenceNumber": 79,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/ZlibWithAcknowledgement"
-      ],
-      "isOsiApproved": false
+        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Dblo=
b;f=3DLICENSE;hb=3Db6d68acd14e51ca3aab4428bf26522aa74873f0e"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-2.2.1.html",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.2.1.json",
-      "referenceNumber": 310,
-      "name": "Open LDAP Public License v2.2.1",
-      "licenseId": "OLDAP-2.2.1",
+      "isOsiApproved": false,
+      "licenseId": "OLDAP-2.1",
+      "name": "Open LDAP Public License v2.1",
+      "reference": "https://spdx.org/licenses/OLDAP-2.1.html",
+      "referenceNumber": 360,
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u0=
03dblob;f\u003dLICENSE;hb\u003d4bc786f34b50aa301be6f5600f58a980070f481e"
-      ],
-      "isOsiApproved": false
+        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Dblo=
b;f=3DLICENSE;hb=3Db0d176738e96a0d3b9f85cb51e140a86f21be715"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/APSL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.2.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/APSL-1.0.json",
-      "referenceNumber": 311,
-      "name": "Apple Public Source License 1.0",
-      "licenseId": "APSL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "OLDAP-2.2",
+      "name": "Open LDAP Public License v2.2",
+      "reference": "https://spdx.org/licenses/OLDAP-2.2.html",
+      "referenceNumber": 316,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Apple_Public_Source_Lice=
nse_1.0"
-      ],
-      "isOsiApproved": true
+        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Dblo=
b;f=3DLICENSE;hb=3D470b0c18ec67621c85881b2733057fecf4a1acc3"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-LBNL.html",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.2.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-LBNL.json",
-      "referenceNumber": 312,
-      "name": "Lawrence Berkeley National Labs BSD variant license",
-      "licenseId": "BSD-3-Clause-LBNL",
+      "isOsiApproved": false,
+      "licenseId": "OLDAP-2.2.1",
+      "name": "Open LDAP Public License v2.2.1",
+      "reference": "https://spdx.org/licenses/OLDAP-2.2.1.html",
+      "referenceNumber": 426,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/LBNLBSD"
-      ],
-      "isOsiApproved": true
+        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Dblo=
b;f=3DLICENSE;hb=3D4bc786f34b50aa301be6f5600f58a980070f481e"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GLWTPL.html",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.2.2.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GLWTPL.json",
-      "referenceNumber": 313,
-      "name": "Good Luck With That Public License",
-      "licenseId": "GLWTPL",
+      "isOsiApproved": false,
+      "licenseId": "OLDAP-2.2.2",
+      "name": "Open LDAP Public License 2.2.2",
+      "reference": "https://spdx.org/licenses/OLDAP-2.2.2.html",
+      "referenceNumber": 384,
       "seeAlso": [
-        "https://github.com/me-shaon/GLWTPL/commit/da5f6bc734095efbacb442c=
0b31e33a65b9d6e85"
-      ],
-      "isOsiApproved": false
+        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Dblo=
b;f=3DLICENSE;hb=3Ddf2cc1e21eb7c160695f5b7cffd6296c151ba188"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LGPL-3.0-only.html",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.3.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0-only.json",
-      "referenceNumber": 314,
-      "name": "GNU Lesser General Public License v3.0 only",
-      "licenseId": "LGPL-3.0-only",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "OLDAP-2.3",
+      "name": "Open LDAP Public License v2.3",
+      "reference": "https://spdx.org/licenses/OLDAP-2.3.html",
+      "referenceNumber": 381,
       "seeAlso": [
-        "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
-        "https://opensource.org/licenses/LGPL-3.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Dblo=
b;f=3DLICENSE;hb=3Dd32cf54a32d581ab475d23c810b0a7fbaf8d63c3"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OGC-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.4.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OGC-1.0.json",
-      "referenceNumber": 315,
-      "name": "OGC Software License, Version 1.0",
-      "licenseId": "OGC-1.0",
+      "isOsiApproved": false,
+      "licenseId": "OLDAP-2.4",
+      "name": "Open LDAP Public License v2.4",
+      "reference": "https://spdx.org/licenses/OLDAP-2.4.html",
+      "referenceNumber": 93,
       "seeAlso": [
-        "https://www.ogc.org/ogc/software/1.0"
-      ],
-      "isOsiApproved": false
+        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Dblo=
b;f=3DLICENSE;hb=3Dcd1284c4a91a8a380d904eee68d1583f989ed386"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Dotseqn.html",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.5.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Dotseqn.json",
-      "referenceNumber": 316,
-      "name": "Dotseqn License",
-      "licenseId": "Dotseqn",
+      "isOsiApproved": false,
+      "licenseId": "OLDAP-2.5",
+      "name": "Open LDAP Public License v2.5",
+      "reference": "https://spdx.org/licenses/OLDAP-2.5.html",
+      "referenceNumber": 651,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Dotseqn"
-      ],
-      "isOsiApproved": false
+        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Dblo=
b;f=3DLICENSE;hb=3D6852b9d90022e8593c98205413380536b1b5a7cf"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MakeIndex.html",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.6.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MakeIndex.json",
-      "referenceNumber": 317,
-      "name": "MakeIndex License",
-      "licenseId": "MakeIndex",
+      "isOsiApproved": false,
+      "licenseId": "OLDAP-2.6",
+      "name": "Open LDAP Public License v2.6",
+      "reference": "https://spdx.org/licenses/OLDAP-2.6.html",
+      "referenceNumber": 568,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/MakeIndex"
-      ],
-      "isOsiApproved": false
+        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Dblo=
b;f=3DLICENSE;hb=3D1cae062821881f41b73012ba816434897abf4205"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GPL-3.0-only.html",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.7.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-only.json",
-      "referenceNumber": 318,
-      "name": "GNU General Public License v3.0 only",
-      "licenseId": "GPL-3.0-only",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "OLDAP-2.7",
+      "name": "Open LDAP Public License v2.7",
+      "reference": "https://spdx.org/licenses/OLDAP-2.7.html",
+      "referenceNumber": 220,
       "seeAlso": [
-        "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
-        "https://opensource.org/licenses/GPL-3.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "http://www.openldap.org/devel/gitweb.cgi?p=3Dopenldap.git;a=3Dblo=
b;f=3DLICENSE;hb=3D47c2415c1df81556eeb39be6cad458ef87c534a2"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Lice=
nse-2014.html",
+      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.8.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-No-Nuclear-Lic=
ense-2014.json",
-      "referenceNumber": 319,
-      "name": "BSD 3-Clause No Nuclear License 2014",
-      "licenseId": "BSD-3-Clause-No-Nuclear-License-2014",
+      "isOsiApproved": true,
+      "licenseId": "OLDAP-2.8",
+      "name": "Open LDAP Public License v2.8",
+      "reference": "https://spdx.org/licenses/OLDAP-2.8.html",
+      "referenceNumber": 5,
       "seeAlso": [
-        "https://java.net/projects/javaeetutorial/pages/BerkeleyLicense"
-      ],
-      "isOsiApproved": false
+        "http://www.openldap.org/software/release/license.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GPL-1.0-only.html",
+      "detailsUrl": "https://spdx.org/licenses/OLFL-1.3.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GPL-1.0-only.json",
-      "referenceNumber": 320,
-      "name": "GNU General Public License v1.0 only",
-      "licenseId": "GPL-1.0-only",
+      "isOsiApproved": true,
+      "licenseId": "OLFL-1.3",
+      "name": "Open Logistics Foundation License Version 1.3",
+      "reference": "https://spdx.org/licenses/OLFL-1.3.html",
+      "referenceNumber": 142,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.html"
-      ],
-      "isOsiApproved": false
+        "https://openlogisticsfoundation.org/licenses/",
+        "https://opensource.org/license/olfl-1-3/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/IJG.html",
+      "detailsUrl": "https://spdx.org/licenses/OML.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/IJG.json",
-      "referenceNumber": 321,
-      "name": "Independent JPEG Group License",
-      "licenseId": "IJG",
-      "seeAlso": [
-        "http://dev.w3.org/cvsweb/Amaya/libjpeg/Attic/README?rev\u003d1.2"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "OML",
+      "name": "Open Market License",
+      "reference": "https://spdx.org/licenses/OML.html",
+      "referenceNumber": 375,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/Open_Market_License"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/AGPL-1.0-or-later.html",
+      "detailsUrl": "https://spdx.org/licenses/OpenPBS-2.3.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0-or-later.json",
-      "referenceNumber": 322,
-      "name": "Affero General Public License v1.0 or later",
-      "licenseId": "AGPL-1.0-or-later",
+      "isOsiApproved": false,
+      "licenseId": "OpenPBS-2.3",
+      "name": "OpenPBS v2.3 Software License",
+      "reference": "https://spdx.org/licenses/OpenPBS-2.3.html",
+      "referenceNumber": 314,
       "seeAlso": [
-        "http://www.affero.org/oagpl.html"
-      ],
-      "isOsiApproved": false
+        "https://github.com/adaptivecomputing/torque/blob/master/PBS_Licen=
se.txt",
+        "https://www.mcs.anl.gov/research/projects/openpbs/PBS_License.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OFL-1.1-no-RFN.html",
+      "detailsUrl": "https://spdx.org/licenses/OpenSSL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OFL-1.1-no-RFN.json",
-      "referenceNumber": 323,
-      "name": "SIL Open Font License 1.1 with no Reserved Font Name",
-      "licenseId": "OFL-1.1-no-RFN",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "OpenSSL",
+      "name": "OpenSSL License",
+      "reference": "https://spdx.org/licenses/OpenSSL.html",
+      "referenceNumber": 303,
       "seeAlso": [
-        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL_web",
-        "https://opensource.org/licenses/OFL-1.1"
-      ],
-      "isOsiApproved": true
+        "http://www.openssl.org/source/license.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/OpenSSL-standalone.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSL-1.0.json",
-      "referenceNumber": 324,
-      "name": "Boost Software License 1.0",
-      "licenseId": "BSL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "OpenSSL-standalone",
+      "name": "OpenSSL License - standalone",
+      "reference": "https://spdx.org/licenses/OpenSSL-standalone.html",
+      "referenceNumber": 602,
       "seeAlso": [
-        "http://www.boost.org/LICENSE_1_0.txt",
-        "https://opensource.org/licenses/BSL-1.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://library.netapp.com/ecm/ecm_download_file/ECMP1196395",
+        "https://hstechdocs.helpsystems.com/manuals/globalscape/archive/cu=
teftp6/open_ssl_license_agreement.htm"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Libpng.html",
+      "detailsUrl": "https://spdx.org/licenses/OpenVision.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Libpng.json",
-      "referenceNumber": 325,
-      "name": "libpng License",
-      "licenseId": "Libpng",
+      "isOsiApproved": false,
+      "licenseId": "OpenVision",
+      "name": "OpenVision License",
+      "reference": "https://spdx.org/licenses/OpenVision.html",
+      "referenceNumber": 588,
       "seeAlso": [
-        "http://www.libpng.org/pub/png/src/libpng-LICENSE.txt"
-      ],
-      "isOsiApproved": false
+        "https://github.com/krb5/krb5/blob/krb5-1.21.2-final/NOTICE#L66-L9=
8",
+        "https://web.mit.edu/kerberos/krb5-1.21/doc/mitK5license.html",
+        "https://fedoraproject.org/wiki/Licensing:MIT#OpenVision_Variant"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-3.0.html",
+      "detailsUrl": "https://spdx.org/licenses/OPL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-3.0.json",
-      "referenceNumber": 326,
-      "name": "Creative Commons Attribution Non Commercial 3.0 Unported",
-      "licenseId": "CC-BY-NC-3.0",
+      "isFsfLibre": false,
+      "isOsiApproved": false,
+      "licenseId": "OPL-1.0",
+      "name": "Open Public License v1.0",
+      "reference": "https://spdx.org/licenses/OPL-1.0.html",
+      "referenceNumber": 91,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc/3.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "http://old.koalateam.com/jackaroo/OPL_1_0.TXT",
+        "https://fedoraproject.org/wiki/Licensing/Open_Public_License"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/OPL-UK-3.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-2.0.json",
-      "referenceNumber": 327,
-      "name": "Creative Commons Attribution Non Commercial 2.0 Generic",
-      "licenseId": "CC-BY-NC-2.0",
+      "isOsiApproved": false,
+      "licenseId": "OPL-UK-3.0",
+      "name": "United    Kingdom Open Parliament Licence v3.0",
+      "reference": "https://spdx.org/licenses/OPL-UK-3.0.html",
+      "referenceNumber": 480,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc/2.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://www.parliament.uk/site-information/copyright-parliament/o=
pen-parliament-licence/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Unlicense.html",
+      "detailsUrl": "https://spdx.org/licenses/OPUBL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Unlicense.json",
-      "referenceNumber": 328,
-      "name": "The Unlicense",
-      "licenseId": "Unlicense",
+      "isOsiApproved": false,
+      "licenseId": "OPUBL-1.0",
+      "name": "Open Publication License v1.0",
+      "reference": "https://spdx.org/licenses/OPUBL-1.0.html",
+      "referenceNumber": 329,
       "seeAlso": [
-        "https://unlicense.org/"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "http://opencontent.org/openpub/",
+        "https://www.debian.org/opl",
+        "https://www.ctan.org/license/opl"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LPL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/OSET-PL-2.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LPL-1.0.json",
-      "referenceNumber": 329,
-      "name": "Lucent Public License Version 1.0",
-      "licenseId": "LPL-1.0",
+      "isOsiApproved": true,
+      "licenseId": "OSET-PL-2.1",
+      "name": "OSET Public License version 2.1",
+      "reference": "https://spdx.org/licenses/OSET-PL-2.1.html",
+      "referenceNumber": 517,
       "seeAlso": [
-        "https://opensource.org/licenses/LPL-1.0"
-      ],
-      "isOsiApproved": true
+        "http://www.osetfoundation.org/public-license",
+        "https://opensource.org/licenses/OPL-2.1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/bzip2-1.0.5.html",
+      "detailsUrl": "https://spdx.org/licenses/OSL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/bzip2-1.0.5.json",
-      "referenceNumber": 330,
-      "name": "bzip2 and libbzip2 License v1.0.5",
-      "licenseId": "bzip2-1.0.5",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "OSL-1.0",
+      "name": "Open Software License 1.0",
+      "reference": "https://spdx.org/licenses/OSL-1.0.html",
+      "referenceNumber": 162,
       "seeAlso": [
-        "https://sourceware.org/bzip2/1.0.5/bzip2-manual-1.0.5.html",
-        "http://bzip.org/1.0.5/bzip2-manual-1.0.5.html"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/OSL-1.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Entessa.html",
+      "detailsUrl": "https://spdx.org/licenses/OSL-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Entessa.json",
-      "referenceNumber": 331,
-      "name": "Entessa Public License v1.0",
-      "licenseId": "Entessa",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "OSL-1.1",
+      "name": "Open Software License 1.1",
+      "reference": "https://spdx.org/licenses/OSL-1.1.html",
+      "referenceNumber": 586,
       "seeAlso": [
-        "https://opensource.org/licenses/Entessa"
-      ],
-      "isOsiApproved": true
+        "https://fedoraproject.org/wiki/Licensing/OSL1.1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-2-Clause-Patent.html",
+      "detailsUrl": "https://spdx.org/licenses/OSL-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-Patent.json",
-      "referenceNumber": 332,
-      "name": "BSD-2-Clause Plus Patent License",
-      "licenseId": "BSD-2-Clause-Patent",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "OSL-2.0",
+      "name": "Open Software License 2.0",
+      "reference": "https://spdx.org/licenses/OSL-2.0.html",
+      "referenceNumber": 531,
       "seeAlso": [
-        "https://opensource.org/licenses/BSDplusPatent"
-      ],
-      "isOsiApproved": true
+        "http://web.archive.org/web/20041020171434/http://www.rosenlaw.com=
/osl2.0.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/ECL-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/OSL-2.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/ECL-2.0.json",
-      "referenceNumber": 333,
-      "name": "Educational Community License v2.0",
-      "licenseId": "ECL-2.0",
-      "seeAlso": [
-        "https://opensource.org/licenses/ECL-2.0"
-      ],
+      "isFsfLibre": true,
       "isOsiApproved": true,
-      "isFsfLibre": true
+      "licenseId": "OSL-2.1",
+      "name": "Open Software License 2.1",
+      "reference": "https://spdx.org/licenses/OSL-2.1.html",
+      "referenceNumber": 138,
+      "seeAlso": [
+        "http://web.archive.org/web/20050212003940/http://www.rosenlaw.com=
/osl21.htm",
+        "https://opensource.org/licenses/OSL-2.1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Crossword.html",
+      "detailsUrl": "https://spdx.org/licenses/OSL-3.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Crossword.json",
-      "referenceNumber": 334,
-      "name": "Crossword License",
-      "licenseId": "Crossword",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "OSL-3.0",
+      "name": "Open Software License 3.0",
+      "reference": "https://spdx.org/licenses/OSL-3.0.html",
+      "referenceNumber": 300,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Crossword"
-      ],
-      "isOsiApproved": false
+        "https://web.archive.org/web/20120101081418/http://rosenlaw.com:80=
/OSL3.0.htm",
+        "https://opensource.org/licenses/OSL-3.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/PADL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-1.0.json",
-      "referenceNumber": 335,
-      "name": "Creative Commons Attribution Non Commercial No Derivatives =
1.0 Generic",
-      "licenseId": "CC-BY-NC-ND-1.0",
+      "isOsiApproved": false,
+      "licenseId": "PADL",
+      "name": "PADL License",
+      "reference": "https://spdx.org/licenses/PADL.html",
+      "referenceNumber": 113,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nd-nc/1.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://git.openldap.org/openldap/openldap/-/blob/master/librarie=
s/libldap/os-local.c?ref_type=3Dheads#L19-23"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OCLC-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/Parity-6.0.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OCLC-2.0.json",
-      "referenceNumber": 336,
-      "name": "OCLC Research Public License 2.0",
-      "licenseId": "OCLC-2.0",
+      "isOsiApproved": false,
+      "licenseId": "Parity-6.0.0",
+      "name": "The Parity Public License 6.0.0",
+      "reference": "https://spdx.org/licenses/Parity-6.0.0.html",
+      "referenceNumber": 246,
       "seeAlso": [
-        "http://www.oclc.org/research/activities/software/license/v2final.=
htm",
-        "https://opensource.org/licenses/OCLC-2.0"
-      ],
-      "isOsiApproved": true
+        "https://paritylicense.com/versions/6.0.0.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CECILL-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/Parity-7.0.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CECILL-1.1.json",
-      "referenceNumber": 337,
-      "name": "CeCILL Free Software License Agreement v1.1",
-      "licenseId": "CECILL-1.1",
+      "isOsiApproved": false,
+      "licenseId": "Parity-7.0.0",
+      "name": "The Parity Public License 7.0.0",
+      "reference": "https://spdx.org/licenses/Parity-7.0.0.html",
+      "referenceNumber": 212,
       "seeAlso": [
-        "http://www.cecill.info/licences/Licence_CeCILL_V1.1-US.html"
-      ],
-      "isOsiApproved": false
+        "https://paritylicense.com/versions/7.0.0.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CECILL-2.1.html",
+      "detailsUrl": "https://spdx.org/licenses/PDDL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CECILL-2.1.json",
-      "referenceNumber": 338,
-      "name": "CeCILL Free Software License Agreement v2.1",
-      "licenseId": "CECILL-2.1",
+      "isOsiApproved": false,
+      "licenseId": "PDDL-1.0",
+      "name": "Open Data Commons Public Domain Dedication & License 1.0",
+      "reference": "https://spdx.org/licenses/PDDL-1.0.html",
+      "referenceNumber": 493,
       "seeAlso": [
-        "http://www.cecill.info/licences/Licence_CeCILL_V2.1-en.html"
-      ],
-      "isOsiApproved": true
+        "http://opendatacommons.org/licenses/pddl/1.0/",
+        "https://opendatacommons.org/licenses/pddl/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OGDL-Taiwan-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/PHP-3.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OGDL-Taiwan-1.0.json",
-      "referenceNumber": 339,
-      "name": "Taiwan Open Government Data License, version 1.0",
-      "licenseId": "OGDL-Taiwan-1.0",
+      "isOsiApproved": true,
+      "licenseId": "PHP-3.0",
+      "name": "PHP License v3.0",
+      "reference": "https://spdx.org/licenses/PHP-3.0.html",
+      "referenceNumber": 584,
       "seeAlso": [
-        "https://data.gov.tw/license"
-      ],
-      "isOsiApproved": false
+        "http://www.php.net/license/3_0.txt",
+        "https://opensource.org/licenses/PHP-3.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Abstyles.html",
+      "detailsUrl": "https://spdx.org/licenses/PHP-3.01.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Abstyles.json",
-      "referenceNumber": 340,
-      "name": "Abstyles License",
-      "licenseId": "Abstyles",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "PHP-3.01",
+      "name": "PHP License v3.01",
+      "reference": "https://spdx.org/licenses/PHP-3.01.html",
+      "referenceNumber": 538,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Abstyles"
-      ],
-      "isOsiApproved": false
+        "http://www.php.net/license/3_01.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/libselinux-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/Pixar.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/libselinux-1.0.json",
-      "referenceNumber": 341,
-      "name": "libselinux public domain notice",
-      "licenseId": "libselinux-1.0",
+      "isOsiApproved": false,
+      "licenseId": "Pixar",
+      "name": "Pixar License",
+      "reference": "https://spdx.org/licenses/Pixar.html",
+      "referenceNumber": 204,
       "seeAlso": [
-        "https://github.com/SELinuxProject/selinux/blob/master/libselinux/=
LICENSE"
-      ],
-      "isOsiApproved": false
+        "https://github.com/PixarAnimationStudios/OpenSubdiv/raw/v3_5_0/LI=
CENSE.txt",
+        "https://graphics.pixar.com/opensubdiv/docs/license.html",
+        "https://github.com/PixarAnimationStudios/OpenSubdiv/blob/v3_5_0/o=
pensubdiv/version.cpp#L2-L22"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/ANTLR-PD.html",
+      "detailsUrl": "https://spdx.org/licenses/pkgconf.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/ANTLR-PD.json",
-      "referenceNumber": 342,
-      "name": "ANTLR Software Rights Notice",
-      "licenseId": "ANTLR-PD",
+      "isOsiApproved": false,
+      "licenseId": "pkgconf",
+      "name": "pkgconf License",
+      "reference": "https://spdx.org/licenses/pkgconf.html",
+      "referenceNumber": 389,
       "seeAlso": [
-        "http://www.antlr2.org/license.html"
-      ],
-      "isOsiApproved": false
+        "https://github.com/pkgconf/pkgconf/blob/master/cli/main.c#L8"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GPL-2.0-or-later.html",
+      "detailsUrl": "https://spdx.org/licenses/Plexus.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-or-later.json",
-      "referenceNumber": 343,
-      "name": "GNU General Public License v2.0 or later",
-      "licenseId": "GPL-2.0-or-later",
+      "isOsiApproved": false,
+      "licenseId": "Plexus",
+      "name": "Plexus Classworlds License",
+      "reference": "https://spdx.org/licenses/Plexus.html",
+      "referenceNumber": 141,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/gpl-2.0-standalone.html=
",
-        "https://opensource.org/licenses/GPL-2.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://fedoraproject.org/wiki/Licensing/Plexus_Classworlds_Licen=
se"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/IPL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/pnmstitch.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/IPL-1.0.json",
-      "referenceNumber": 344,
-      "name": "IBM Public License v1.0",
-      "licenseId": "IPL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "pnmstitch",
+      "name": "pnmstitch License",
+      "reference": "https://spdx.org/licenses/pnmstitch.html",
+      "referenceNumber": 158,
       "seeAlso": [
-        "https://opensource.org/licenses/IPL-1.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/edit=
or/pnmstitch.c#l2"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MIT-enna.html",
+      "detailsUrl": "https://spdx.org/licenses/PolyForm-Noncommercial-1.0.=
0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MIT-enna.json",
-      "referenceNumber": 345,
-      "name": "enna License",
-      "licenseId": "MIT-enna",
+      "isOsiApproved": false,
+      "licenseId": "PolyForm-Noncommercial-1.0.0",
+      "name": "PolyForm Noncommercial License 1.0.0",
+      "reference": "https://spdx.org/licenses/PolyForm-Noncommercial-1.0.0=
.html",
+      "referenceNumber": 54,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/MIT#enna"
-      ],
-      "isOsiApproved": false
+        "https://polyformproject.org/licenses/noncommercial/1.0.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CPOL-1.02.html",
+      "detailsUrl": "https://spdx.org/licenses/PolyForm-Small-Business-1.0=
.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CPOL-1.02.json",
-      "referenceNumber": 346,
-      "name": "Code Project Open License 1.02",
-      "licenseId": "CPOL-1.02",
+      "isOsiApproved": false,
+      "licenseId": "PolyForm-Small-Business-1.0.0",
+      "name": "PolyForm Small Business License 1.0.0",
+      "reference": "https://spdx.org/licenses/PolyForm-Small-Business-1.0.=
0.html",
+      "referenceNumber": 594,
       "seeAlso": [
-        "http://www.codeproject.com/info/cpol10.aspx"
-      ],
-      "isOsiApproved": false
+        "https://polyformproject.org/licenses/small-business/1.0.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-SA-3.0-AT.html",
+      "detailsUrl": "https://spdx.org/licenses/PostgreSQL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-3.0-AT.json",
-      "referenceNumber": 347,
-      "name": "Creative Commons Attribution Share Alike 3.0 Austria",
-      "licenseId": "CC-BY-SA-3.0-AT",
+      "isOsiApproved": true,
+      "licenseId": "PostgreSQL",
+      "name": "PostgreSQL License",
+      "reference": "https://spdx.org/licenses/PostgreSQL.html",
+      "referenceNumber": 643,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-sa/3.0/at/legalcode"
-      ],
-      "isOsiApproved": false
+        "http://www.postgresql.org/about/licence",
+        "https://opensource.org/licenses/PostgreSQL"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GPL-3.0-with-GCC-exception.h=
tml",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-with-GCC-exception.=
json",
-      "referenceNumber": 348,
-      "name": "GNU General Public License v3.0 w/GCC Runtime Library excep=
tion",
-      "licenseId": "GPL-3.0-with-GCC-exception",
+      "detailsUrl": "https://spdx.org/licenses/PPL.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": false,
+      "isOsiApproved": false,
+      "licenseId": "PPL",
+      "name": "Peer Production License",
+      "reference": "https://spdx.org/licenses/PPL.html",
+      "referenceNumber": 580,
       "seeAlso": [
-        "https://www.gnu.org/licenses/gcc-exception-3.1.html"
-      ],
-      "isOsiApproved": true
+        "https://wiki.p2pfoundation.net/Peer_Production_License",
+        "http://www.networkcultures.org/_uploads/%233notebook_telekommunis=
t.pdf"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-1-Clause.html",
+      "detailsUrl": "https://spdx.org/licenses/PSF-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-1-Clause.json",
-      "referenceNumber": 349,
-      "name": "BSD 1-Clause License",
-      "licenseId": "BSD-1-Clause",
+      "isOsiApproved": false,
+      "licenseId": "PSF-2.0",
+      "name": "Python Software Foundation License 2.0",
+      "reference": "https://spdx.org/licenses/PSF-2.0.html",
+      "referenceNumber": 55,
       "seeAlso": [
-        "https://svnweb.freebsd.org/base/head/include/ifaddrs.h?revision\u=
003d326823"
-      ],
-      "isOsiApproved": true
+        "https://opensource.org/licenses/Python-2.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/NTP-0.html",
+      "detailsUrl": "https://spdx.org/licenses/psfrag.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NTP-0.json",
-      "referenceNumber": 350,
-      "name": "NTP No Attribution",
-      "licenseId": "NTP-0",
+      "isOsiApproved": false,
+      "licenseId": "psfrag",
+      "name": "psfrag License",
+      "reference": "https://spdx.org/licenses/psfrag.html",
+      "referenceNumber": 555,
       "seeAlso": [
-        "https://github.com/tytso/e2fsprogs/blob/master/lib/et/et_name.c"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/psfrag"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SugarCRM-1.1.3.html",
+      "detailsUrl": "https://spdx.org/licenses/psutils.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SugarCRM-1.1.3.json",
-      "referenceNumber": 351,
-      "name": "SugarCRM Public License v1.1.3",
-      "licenseId": "SugarCRM-1.1.3",
+      "isOsiApproved": false,
+      "licenseId": "psutils",
+      "name": "psutils License",
+      "reference": "https://spdx.org/licenses/psutils.html",
+      "referenceNumber": 260,
       "seeAlso": [
-        "http://www.sugarcrm.com/crm/SPL"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/psutils"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MIT.html",
+      "detailsUrl": "https://spdx.org/licenses/Python-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MIT.json",
-      "referenceNumber": 352,
-      "name": "MIT License",
-      "licenseId": "MIT",
-      "seeAlso": [
-        "https://opensource.org/licenses/MIT"
-      ],
+      "isFsfLibre": true,
       "isOsiApproved": true,
-      "isFsfLibre": true
+      "licenseId": "Python-2.0",
+      "name": "Python License 2.0",
+      "reference": "https://spdx.org/licenses/Python-2.0.html",
+      "referenceNumber": 285,
+      "seeAlso": [
+        "https://opensource.org/licenses/Python-2.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OFL-1.1-RFN.html",
+      "detailsUrl": "https://spdx.org/licenses/Python-2.0.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OFL-1.1-RFN.json",
-      "referenceNumber": 353,
-      "name": "SIL Open Font License 1.1 with Reserved Font Name",
-      "licenseId": "OFL-1.1-RFN",
+      "isOsiApproved": false,
+      "licenseId": "Python-2.0.1",
+      "name": "Python License 2.0.1",
+      "reference": "https://spdx.org/licenses/Python-2.0.1.html",
+      "referenceNumber": 201,
       "seeAlso": [
-        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL_web",
-        "https://opensource.org/licenses/OFL-1.1"
-      ],
-      "isOsiApproved": true
+        "https://www.python.org/download/releases/2.0.1/license/",
+        "https://docs.python.org/3/license.html",
+        "https://github.com/python/cpython/blob/main/LICENSE"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Watcom-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/python-ldap.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Watcom-1.0.json",
-      "referenceNumber": 354,
-      "name": "Sybase Open Watcom Public License 1.0",
-      "licenseId": "Watcom-1.0",
+      "isOsiApproved": false,
+      "licenseId": "python-ldap",
+      "name": "Python ldap License",
+      "reference": "https://spdx.org/licenses/python-ldap.html",
+      "referenceNumber": 446,
       "seeAlso": [
-        "https://opensource.org/licenses/Watcom-1.0"
-      ],
-      "isOsiApproved": true
+        "https://github.com/python-ldap/python-ldap/blob/main/LICENCE"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-FR.html",
+      "detailsUrl": "https://spdx.org/licenses/Qhull.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-SA-2.0-FR.json",
-      "referenceNumber": 355,
-      "name": "Creative Commons Attribution-NonCommercial-ShareAlike 2.0 F=
rance",
-      "licenseId": "CC-BY-NC-SA-2.0-FR",
+      "isOsiApproved": false,
+      "licenseId": "Qhull",
+      "name": "Qhull License",
+      "reference": "https://spdx.org/licenses/Qhull.html",
+      "referenceNumber": 326,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc-sa/2.0/fr/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/Qhull"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/ODbL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/QPL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/ODbL-1.0.json",
-      "referenceNumber": 356,
-      "name": "Open Data Commons Open Database License v1.0",
-      "licenseId": "ODbL-1.0",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "QPL-1.0",
+      "name": "Q Public License 1.0",
+      "reference": "https://spdx.org/licenses/QPL-1.0.html",
+      "referenceNumber": 413,
       "seeAlso": [
-        "http://www.opendatacommons.org/licenses/odbl/1.0/",
-        "https://opendatacommons.org/licenses/odbl/1-0/"
-      ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+        "http://doc.qt.nokia.com/3.3/license.html",
+        "https://opensource.org/licenses/QPL-1.0",
+        "https://doc.qt.io/archives/3.3/license.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/FSFULLR.html",
+      "detailsUrl": "https://spdx.org/licenses/QPL-1.0-INRIA-2004.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/FSFULLR.json",
-      "referenceNumber": 357,
-      "name": "FSF Unlimited License (with License Retention)",
-      "licenseId": "FSFULLR",
+      "isOsiApproved": false,
+      "licenseId": "QPL-1.0-INRIA-2004",
+      "name": "Q Public License 1.0 - INRIA 2004 variant",
+      "reference": "https://spdx.org/licenses/QPL-1.0-INRIA-2004.html",
+      "referenceNumber": 486,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/FSF_Unlimited_License#Li=
cense_Retention_Variant"
-      ],
-      "isOsiApproved": false
+        "https://github.com/maranget/hevea/blob/master/LICENSE"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-1.3.html",
+      "detailsUrl": "https://spdx.org/licenses/radvd.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.3.json",
-      "referenceNumber": 358,
-      "name": "Open LDAP Public License v1.3",
-      "licenseId": "OLDAP-1.3",
+      "isOsiApproved": false,
+      "licenseId": "radvd",
+      "name": "radvd License",
+      "reference": "https://spdx.org/licenses/radvd.html",
+      "referenceNumber": 433,
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u0=
03dblob;f\u003dLICENSE;hb\u003de5f8117f0ce088d0bd7a8e18ddf37eaa40eb09b1"
-      ],
-      "isOsiApproved": false
+        "https://github.com/radvd-project/radvd/blob/master/COPYRIGHT"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SSH-OpenSSH.html",
+      "detailsUrl": "https://spdx.org/licenses/Rdisc.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SSH-OpenSSH.json",
-      "referenceNumber": 359,
-      "name": "SSH OpenSSH license",
-      "licenseId": "SSH-OpenSSH",
+      "isOsiApproved": false,
+      "licenseId": "Rdisc",
+      "name": "Rdisc License",
+      "reference": "https://spdx.org/licenses/Rdisc.html",
+      "referenceNumber": 50,
       "seeAlso": [
-        "https://github.com/openssh/openssh-portable/blob/1b11ea7c58cd5c59=
838b5fa574cd456d6047b2d4/LICENCE#L10"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/Rdisc_License"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-2-Clause.html",
+      "detailsUrl": "https://spdx.org/licenses/RHeCos-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause.json",
-      "referenceNumber": 360,
-      "name": "BSD 2-Clause \"Simplified\" License",
-      "licenseId": "BSD-2-Clause",
+      "isFsfLibre": false,
+      "isOsiApproved": false,
+      "licenseId": "RHeCos-1.1",
+      "name": "Red Hat eCos Public License v1.1",
+      "reference": "https://spdx.org/licenses/RHeCos-1.1.html",
+      "referenceNumber": 99,
       "seeAlso": [
-        "https://opensource.org/licenses/BSD-2-Clause"
-      ],
-      "isOsiApproved": true
+        "http://ecos.sourceware.org/old-license.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/HPND.html",
+      "detailsUrl": "https://spdx.org/licenses/RPL-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/HPND.json",
-      "referenceNumber": 361,
-      "name": "Historical Permission Notice and Disclaimer",
-      "licenseId": "HPND",
-      "seeAlso": [
-        "https://opensource.org/licenses/HPND"
-      ],
       "isOsiApproved": true,
-      "isFsfLibre": true
+      "licenseId": "RPL-1.1",
+      "name": "Reciprocal Public License 1.1",
+      "reference": "https://spdx.org/licenses/RPL-1.1.html",
+      "referenceNumber": 205,
+      "seeAlso": [
+        "https://opensource.org/licenses/RPL-1.1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Zimbra-1.3.html",
+      "detailsUrl": "https://spdx.org/licenses/RPL-1.5.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Zimbra-1.3.json",
-      "referenceNumber": 362,
-      "name": "Zimbra Public License v1.3",
-      "licenseId": "Zimbra-1.3",
+      "isOsiApproved": true,
+      "licenseId": "RPL-1.5",
+      "name": "Reciprocal Public License 1.5",
+      "reference": "https://spdx.org/licenses/RPL-1.5.html",
+      "referenceNumber": 52,
       "seeAlso": [
-        "http://web.archive.org/web/20100302225219/http://www.zimbra.com/l=
icense/zimbra-public-license-1-3.html"
-      ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+        "https://opensource.org/licenses/RPL-1.5"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Borceux.html",
+      "detailsUrl": "https://spdx.org/licenses/RPSL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Borceux.json",
-      "referenceNumber": 363,
-      "name": "Borceux license",
-      "licenseId": "Borceux",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "RPSL-1.0",
+      "name": "RealNetworks Public Source License v1.0",
+      "reference": "https://spdx.org/licenses/RPSL-1.0.html",
+      "referenceNumber": 637,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Borceux"
-      ],
-      "isOsiApproved": false
+        "https://helixcommunity.org/content/rpsl",
+        "https://opensource.org/licenses/RPSL-1.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/RSA-MD.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-1.1.json",
-      "referenceNumber": 364,
-      "name": "Open LDAP Public License v1.1",
-      "licenseId": "OLDAP-1.1",
+      "isOsiApproved": false,
+      "licenseId": "RSA-MD",
+      "name": "RSA Message-Digest License",
+      "reference": "https://spdx.org/licenses/RSA-MD.html",
+      "referenceNumber": 496,
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u0=
03dblob;f\u003dLICENSE;hb\u003d806557a5ad59804ef3a44d5abfbe91d706b0791f"
-      ],
-      "isOsiApproved": false
+        "http://www.faqs.org/rfcs/rfc1321.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OFL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/RSCPL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OFL-1.0.json",
-      "referenceNumber": 365,
-      "name": "SIL Open Font License 1.0",
-      "licenseId": "OFL-1.0",
+      "isOsiApproved": true,
+      "licenseId": "RSCPL",
+      "name": "Ricoh Source Code Public License",
+      "reference": "https://spdx.org/licenses/RSCPL.html",
+      "referenceNumber": 235,
       "seeAlso": [
-        "http://scripts.sil.org/cms/scripts/page.php?item_id\u003dOFL10_we=
b"
-      ],
-      "isOsiApproved": false
+        "http://wayback.archive.org/web/20060715140826/http://www.risource=
.org/RPL/RPL-1.0A.shtml",
+        "https://opensource.org/licenses/RSCPL"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/NASA-1.3.html",
+      "detailsUrl": "https://spdx.org/licenses/Ruby.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NASA-1.3.json",
-      "referenceNumber": 366,
-      "name": "NASA Open Source Agreement 1.3",
-      "licenseId": "NASA-1.3",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "Ruby",
+      "name": "Ruby License",
+      "reference": "https://spdx.org/licenses/Ruby.html",
+      "referenceNumber": 223,
       "seeAlso": [
-        "http://ti.arc.nasa.gov/opensource/nosa/",
-        "https://opensource.org/licenses/NASA-1.3"
-      ],
-      "isOsiApproved": true
+        "https://www.ruby-lang.org/en/about/license.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/VOSTROM.html",
+      "detailsUrl": "https://spdx.org/licenses/SAX-PD.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/VOSTROM.json",
-      "referenceNumber": 367,
-      "name": "VOSTROM Public License for Open Source",
-      "licenseId": "VOSTROM",
+      "isOsiApproved": false,
+      "licenseId": "SAX-PD",
+      "name": "Sax Public Domain Notice",
+      "reference": "https://spdx.org/licenses/SAX-PD.html",
+      "referenceNumber": 301,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/VOSTROM"
-      ],
-      "isOsiApproved": false
+        "http://www.saxproject.org/copying.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MIT-0.html",
+      "detailsUrl": "https://spdx.org/licenses/SAX-PD-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MIT-0.json",
-      "referenceNumber": 368,
-      "name": "MIT No Attribution",
-      "licenseId": "MIT-0",
+      "isOsiApproved": false,
+      "licenseId": "SAX-PD-2.0",
+      "name": "Sax Public Domain Notice 2.0",
+      "reference": "https://spdx.org/licenses/SAX-PD-2.0.html",
+      "referenceNumber": 561,
       "seeAlso": [
-        "https://github.com/aws/mit-0",
-        "https://romanrm.net/mit-zero",
-        "https://github.com/awsdocs/aws-cloud9-user-guide/blob/master/LICE=
NSE-SAMPLECODE"
-      ],
-      "isOsiApproved": true
+        "http://www.saxproject.org/copying.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/ISC.html",
+      "detailsUrl": "https://spdx.org/licenses/Saxpath.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/ISC.json",
-      "referenceNumber": 369,
-      "name": "ISC License",
-      "licenseId": "ISC",
+      "isOsiApproved": false,
+      "licenseId": "Saxpath",
+      "name": "Saxpath License",
+      "reference": "https://spdx.org/licenses/Saxpath.html",
+      "referenceNumber": 109,
       "seeAlso": [
-        "https://www.isc.org/licenses/",
-        "https://www.isc.org/downloads/software-support-policy/isc-license=
/",
-        "https://opensource.org/licenses/ISC"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://fedoraproject.org/wiki/Licensing/Saxpath_License"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Unicode-DFS-2016.html",
+      "detailsUrl": "https://spdx.org/licenses/SCEA.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Unicode-DFS-2016.json",
-      "referenceNumber": 370,
-      "name": "Unicode License Agreement - Data Files and Software (2016)",
-      "licenseId": "Unicode-DFS-2016",
+      "isOsiApproved": false,
+      "licenseId": "SCEA",
+      "name": "SCEA Shared Source License",
+      "reference": "https://spdx.org/licenses/SCEA.html",
+      "referenceNumber": 35,
       "seeAlso": [
-        "http://www.unicode.org/copyright.html"
-      ],
-      "isOsiApproved": true
+        "http://research.scea.com/scea_shared_source_license.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BlueOak-1.0.0.html",
+      "detailsUrl": "https://spdx.org/licenses/SchemeReport.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BlueOak-1.0.0.json",
-      "referenceNumber": 371,
-      "name": "Blue Oak Model License 1.0.0",
-      "licenseId": "BlueOak-1.0.0",
-      "seeAlso": [
-        "https://blueoakcouncil.org/license/1.0.0"
-      ],
-      "isOsiApproved": false
+      "isOsiApproved": false,
+      "licenseId": "SchemeReport",
+      "name": "Scheme Language Report License",
+      "reference": "https://spdx.org/licenses/SchemeReport.html",
+      "referenceNumber": 425,
+      "seeAlso": []
     },
     {
-      "reference": "https://spdx.org/licenses/LiLiQ-Rplus-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/Sendmail.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LiLiQ-Rplus-1.1.json",
-      "referenceNumber": 372,
-      "name": "Licence Libre du Qu=C3=A9bec =E2=80=93 R=C3=A9ciprocit=C3=
=A9 forte version 1.1",
-      "licenseId": "LiLiQ-Rplus-1.1",
+      "isOsiApproved": false,
+      "licenseId": "Sendmail",
+      "name": "Sendmail License",
+      "reference": "https://spdx.org/licenses/Sendmail.html",
+      "referenceNumber": 274,
       "seeAlso": [
-        "https://www.forge.gouv.qc.ca/participez/licence-logicielle/licenc=
e-libre-du-quebec-liliq-en-francais/licence-libre-du-quebec-reciprocite-for=
te-liliq-r-v1-1/",
-        "http://opensource.org/licenses/LiLiQ-Rplus-1.1"
-      ],
-      "isOsiApproved": true
+        "http://www.sendmail.com/pdfs/open_source/sendmail_license.pdf",
+        "https://web.archive.org/web/20160322142305/https://www.sendmail.c=
om/pdfs/open_source/sendmail_license.pdf"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/NOSL.html",
+      "detailsUrl": "https://spdx.org/licenses/Sendmail-8.23.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NOSL.json",
-      "referenceNumber": 373,
-      "name": "Netizen Open Source License",
-      "licenseId": "NOSL",
-      "seeAlso": [
-        "http://bits.netizen.com.au/licenses/NOSL/nosl.txt"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "Sendmail-8.23",
+      "name": "Sendmail License 8.23",
+      "reference": "https://spdx.org/licenses/Sendmail-8.23.html",
+      "referenceNumber": 247,
+      "seeAlso": [
+        "https://www.proofpoint.com/sites/default/files/sendmail-license.p=
df",
+        "https://web.archive.org/web/20181003101040/https://www.proofpoint=
.com/sites/default/files/sendmail-license.pdf"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SMLNJ.html",
+      "detailsUrl": "https://spdx.org/licenses/SGI-B-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SMLNJ.json",
-      "referenceNumber": 374,
-      "name": "Standard ML of New Jersey License",
-      "licenseId": "SMLNJ",
-      "seeAlso": [
-        "https://www.smlnj.org/license.html"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "SGI-B-1.0",
+      "name": "SGI Free Software License B v1.0",
+      "reference": "https://spdx.org/licenses/SGI-B-1.0.html",
+      "referenceNumber": 476,
+      "seeAlso": [
+        "http://oss.sgi.com/projects/FreeB/SGIFreeSWLicB.1.0.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LGPL-3.0+.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0+.json",
-      "referenceNumber": 375,
-      "name": "GNU Lesser General Public License v3.0 or later",
-      "licenseId": "LGPL-3.0+",
+      "detailsUrl": "https://spdx.org/licenses/SGI-B-1.1.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "SGI-B-1.1",
+      "name": "SGI Free Software License B v1.1",
+      "reference": "https://spdx.org/licenses/SGI-B-1.1.html",
+      "referenceNumber": 456,
       "seeAlso": [
-        "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
-        "https://opensource.org/licenses/LGPL-3.0"
-      ],
-      "isOsiApproved": true
+        "http://oss.sgi.com/projects/FreeB/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CPAL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/SGI-B-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CPAL-1.0.json",
-      "referenceNumber": 376,
-      "name": "Common Public Attribution License 1.0",
-      "licenseId": "CPAL-1.0",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "SGI-B-2.0",
+      "name": "SGI Free Software License B v2.0",
+      "reference": "https://spdx.org/licenses/SGI-B-2.0.html",
+      "referenceNumber": 405,
       "seeAlso": [
-        "https://opensource.org/licenses/CPAL-1.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "http://oss.sgi.com/projects/FreeB/SGIFreeSWLicB.2.0.pdf"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/PSF-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/SGI-OpenGL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/PSF-2.0.json",
-      "referenceNumber": 377,
-      "name": "Python Software Foundation License 2.0",
-      "licenseId": "PSF-2.0",
+      "isOsiApproved": false,
+      "licenseId": "SGI-OpenGL",
+      "name": "SGI OpenGL License",
+      "reference": "https://spdx.org/licenses/SGI-OpenGL.html",
+      "referenceNumber": 629,
       "seeAlso": [
-        "https://opensource.org/licenses/Python-2.0"
-      ],
-      "isOsiApproved": false
+        "https://gitlab.freedesktop.org/mesa/glw/-/blob/master/README?ref_=
type=3Dheads"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/RPL-1.5.html",
+      "detailsUrl": "https://spdx.org/licenses/SGP4.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/RPL-1.5.json",
-      "referenceNumber": 378,
-      "name": "Reciprocal Public License 1.5",
-      "licenseId": "RPL-1.5",
+      "isOsiApproved": false,
+      "licenseId": "SGP4",
+      "name": "SGP4 Permission Notice",
+      "reference": "https://spdx.org/licenses/SGP4.html",
+      "referenceNumber": 336,
       "seeAlso": [
-        "https://opensource.org/licenses/RPL-1.5"
-      ],
-      "isOsiApproved": true
+        "https://celestrak.org/publications/AIAA/2006-6753/faq.php"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-2-Clause-FreeBSD.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-FreeBSD.json",
-      "referenceNumber": 379,
-      "name": "BSD 2-Clause FreeBSD License",
-      "licenseId": "BSD-2-Clause-FreeBSD",
-      "seeAlso": [
-        "http://www.freebsd.org/copyright/freebsd-license.html"
-      ],
+      "detailsUrl": "https://spdx.org/licenses/SHL-0.5.json",
+      "isDeprecatedLicenseId": false,
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "SHL-0.5",
+      "name": "Solderpad Hardware License v0.5",
+      "reference": "https://spdx.org/licenses/SHL-0.5.html",
+      "referenceNumber": 338,
+      "seeAlso": [
+        "https://solderpad.org/licenses/SHL-0.5/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MIT-Modern-Variant.html",
+      "detailsUrl": "https://spdx.org/licenses/SHL-0.51.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MIT-Modern-Variant.json",
-      "referenceNumber": 380,
-      "name": "MIT License Modern Variant",
-      "licenseId": "MIT-Modern-Variant",
+      "isOsiApproved": false,
+      "licenseId": "SHL-0.51",
+      "name": "Solderpad Hardware License, Version 0.51",
+      "reference": "https://spdx.org/licenses/SHL-0.51.html",
+      "referenceNumber": 29,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing:MIT#Modern_Variants",
-        "https://ptolemy.berkeley.edu/copyright.htm",
-        "https://pirlwww.lpl.arizona.edu/resources/guide/software/PerlTk/T=
ixlic.html"
-      ],
-      "isOsiApproved": true
+        "https://solderpad.org/licenses/SHL-0.51/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Nokia.html",
+      "detailsUrl": "https://spdx.org/licenses/SimPL-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Nokia.json",
-      "referenceNumber": 381,
-      "name": "Nokia Open Source License",
-      "licenseId": "Nokia",
-      "seeAlso": [
-        "https://opensource.org/licenses/nokia"
-      ],
       "isOsiApproved": true,
-      "isFsfLibre": true
+      "licenseId": "SimPL-2.0",
+      "name": "Simple Public License 2.0",
+      "reference": "https://spdx.org/licenses/SimPL-2.0.html",
+      "referenceNumber": 444,
+      "seeAlso": [
+        "https://opensource.org/licenses/SimPL-2.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.1-no-invariants-only.=
html",
+      "detailsUrl": "https://spdx.org/licenses/SISSL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-no-invariants-only=
.json",
-      "referenceNumber": 382,
-      "name": "GNU Free Documentation License v1.1 only - no invariants",
-      "licenseId": "GFDL-1.1-no-invariants-only",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "SISSL",
+      "name": "Sun Industry Standards Source License v1.1",
+      "reference": "https://spdx.org/licenses/SISSL.html",
+      "referenceNumber": 268,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
-      ],
-      "isOsiApproved": false
+        "http://www.openoffice.org/licenses/sissl_license.html",
+        "https://opensource.org/licenses/SISSL"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/PDDL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/SISSL-1.2.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/PDDL-1.0.json",
-      "referenceNumber": 383,
-      "name": "Open Data Commons Public Domain Dedication \u0026 License 1=
.0",
-      "licenseId": "PDDL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "SISSL-1.2",
+      "name": "Sun Industry Standards Source License v1.2",
+      "reference": "https://spdx.org/licenses/SISSL-1.2.html",
+      "referenceNumber": 502,
       "seeAlso": [
-        "http://opendatacommons.org/licenses/pddl/1.0/",
-        "https://opendatacommons.org/licenses/pddl/"
-      ],
-      "isOsiApproved": false
+        "http://gridscheduler.sourceforge.net/Gridengine_SISSL_license.htm=
l"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/EUPL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/SL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/EUPL-1.0.json",
-      "referenceNumber": 384,
-      "name": "European Union Public License 1.0",
-      "licenseId": "EUPL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "SL",
+      "name": "SL License",
+      "reference": "https://spdx.org/licenses/SL.html",
+      "referenceNumber": 645,
       "seeAlso": [
-        "http://ec.europa.eu/idabc/en/document/7330.html",
-        "http://ec.europa.eu/idabc/servlets/Doc027f.pdf?id\u003d31096"
-      ],
-      "isOsiApproved": false
+        "https://github.com/mtoyoda/sl/blob/master/LICENSE"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CDDL-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/Sleepycat.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CDDL-1.1.json",
-      "referenceNumber": 385,
-      "name": "Common Development and Distribution License 1.1",
-      "licenseId": "CDDL-1.1",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "Sleepycat",
+      "name": "Sleepycat License",
+      "reference": "https://spdx.org/licenses/Sleepycat.html",
+      "referenceNumber": 182,
       "seeAlso": [
-        "http://glassfish.java.net/public/CDDL+GPL_1_1.html",
-        "https://javaee.github.io/glassfish/LICENSE"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/Sleepycat"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.3-only.html",
+      "detailsUrl": "https://spdx.org/licenses/SMLNJ.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.3-only.json",
-      "referenceNumber": 386,
-      "name": "GNU Free Documentation License v1.3 only",
-      "licenseId": "GFDL-1.3-only",
-      "seeAlso": [
-        "https://www.gnu.org/licenses/fdl-1.3.txt"
-      ],
+      "isFsfLibre": true,
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "SMLNJ",
+      "name": "Standard ML of New Jersey License",
+      "reference": "https://spdx.org/licenses/SMLNJ.html",
+      "referenceNumber": 148,
+      "seeAlso": [
+        "https://www.smlnj.org/license.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-2.6.html",
+      "detailsUrl": "https://spdx.org/licenses/SMPPL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.6.json",
-      "referenceNumber": 387,
-      "name": "Open LDAP Public License v2.6",
-      "licenseId": "OLDAP-2.6",
+      "isOsiApproved": false,
+      "licenseId": "SMPPL",
+      "name": "Secure Messaging Protocol Public License",
+      "reference": "https://spdx.org/licenses/SMPPL.html",
+      "referenceNumber": 250,
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u0=
03dblob;f\u003dLICENSE;hb\u003d1cae062821881f41b73012ba816434897abf4205"
-      ],
-      "isOsiApproved": false
+        "https://github.com/dcblake/SMP/blob/master/Documentation/License.=
txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/JSON.html",
+      "detailsUrl": "https://spdx.org/licenses/SNIA.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/JSON.json",
-      "referenceNumber": 388,
-      "name": "JSON License",
-      "licenseId": "JSON",
+      "isOsiApproved": false,
+      "licenseId": "SNIA",
+      "name": "SNIA Public License 1.1",
+      "reference": "https://spdx.org/licenses/SNIA.html",
+      "referenceNumber": 518,
       "seeAlso": [
-        "http://www.json.org/license.html"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/SNIA_Public_License"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LGPL-3.0-or-later.html",
+      "detailsUrl": "https://spdx.org/licenses/snprintf.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LGPL-3.0-or-later.json",
-      "referenceNumber": 389,
-      "name": "GNU Lesser General Public License v3.0 or later",
-      "licenseId": "LGPL-3.0-or-later",
+      "isOsiApproved": false,
+      "licenseId": "snprintf",
+      "name": "snprintf License",
+      "reference": "https://spdx.org/licenses/snprintf.html",
+      "referenceNumber": 161,
       "seeAlso": [
-        "https://www.gnu.org/licenses/lgpl-3.0-standalone.html",
-        "https://opensource.org/licenses/LGPL-3.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://github.com/openssh/openssh-portable/blob/master/openbsd-c=
ompat/bsd-snprintf.c#L2"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GPL-3.0.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GPL-3.0.json",
-      "referenceNumber": 390,
-      "name": "GNU General Public License v3.0 only",
-      "licenseId": "GPL-3.0",
+      "detailsUrl": "https://spdx.org/licenses/softSurfer.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "softSurfer",
+      "name": "softSurfer License",
+      "reference": "https://spdx.org/licenses/softSurfer.html",
+      "referenceNumber": 523,
       "seeAlso": [
-        "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
-        "https://opensource.org/licenses/GPL-3.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://github.com/mm2/Little-CMS/blob/master/src/cmssm.c#L207",
+        "https://fedoraproject.org/wiki/Licensing/softSurfer"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Fair.html",
+      "detailsUrl": "https://spdx.org/licenses/Soundex.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Fair.json",
-      "referenceNumber": 391,
-      "name": "Fair License",
-      "licenseId": "Fair",
+      "isOsiApproved": false,
+      "licenseId": "Soundex",
+      "name": "Soundex License",
+      "reference": "https://spdx.org/licenses/Soundex.html",
+      "referenceNumber": 368,
       "seeAlso": [
-        "http://fairlicense.org/",
-        "https://opensource.org/licenses/Fair"
-      ],
-      "isOsiApproved": true
+        "https://metacpan.org/release/RJBS/Text-Soundex-3.05/source/Sounde=
x.pm#L3-11"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GPL-2.0-with-font-exception.=
html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-font-exception=
.json",
-      "referenceNumber": 392,
-      "name": "GNU General Public License v2.0 w/Font exception",
-      "licenseId": "GPL-2.0-with-font-exception",
+      "detailsUrl": "https://spdx.org/licenses/Spencer-86.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Spencer-86",
+      "name": "Spencer License 86",
+      "reference": "https://spdx.org/licenses/Spencer-86.html",
+      "referenceNumber": 472,
       "seeAlso": [
-        "https://www.gnu.org/licenses/gpl-faq.html#FontException"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/Henry_Spencer_Reg-Ex_Lib=
rary_License"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OSL-2.1.html",
+      "detailsUrl": "https://spdx.org/licenses/Spencer-94.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OSL-2.1.json",
-      "referenceNumber": 393,
-      "name": "Open Software License 2.1",
-      "licenseId": "OSL-2.1",
+      "isOsiApproved": false,
+      "licenseId": "Spencer-94",
+      "name": "Spencer License 94",
+      "reference": "https://spdx.org/licenses/Spencer-94.html",
+      "referenceNumber": 378,
       "seeAlso": [
-        "http://web.archive.org/web/20050212003940/http://www.rosenlaw.com=
/osl21.htm",
-        "https://opensource.org/licenses/OSL-2.1"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://fedoraproject.org/wiki/Licensing/Henry_Spencer_Reg-Ex_Lib=
rary_License",
+        "https://metacpan.org/release/KNOK/File-MMagic-1.30/source/COPYING=
#L28"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LPPL-1.3a.html",
+      "detailsUrl": "https://spdx.org/licenses/Spencer-99.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LPPL-1.3a.json",
-      "referenceNumber": 394,
-      "name": "LaTeX Project Public License v1.3a",
-      "licenseId": "LPPL-1.3a",
-      "seeAlso": [
-        "http://www.latex-project.org/lppl/lppl-1-3a.txt"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "Spencer-99",
+      "name": "Spencer License 99",
+      "reference": "https://spdx.org/licenses/Spencer-99.html",
+      "referenceNumber": 139,
+      "seeAlso": [
+        "http://www.opensource.apple.com/source/tcl/tcl-5/tcl/generic/regf=
ronts.c"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/NAIST-2003.html",
+      "detailsUrl": "https://spdx.org/licenses/SPL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NAIST-2003.json",
-      "referenceNumber": 395,
-      "name": "Nara Institute of Science and Technology License (2003)",
-      "licenseId": "NAIST-2003",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "SPL-1.0",
+      "name": "Sun Public License v1.0",
+      "reference": "https://spdx.org/licenses/SPL-1.0.html",
+      "referenceNumber": 280,
       "seeAlso": [
-        "https://enterprise.dejacode.com/licenses/public/naist-2003/#licen=
se-text",
-        "https://github.com/nodejs/node/blob/4a19cc8947b1bba2b2d27816ec3d0=
edf9b28e503/LICENSE#L343"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/SPL-1.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-4.0.html",
+      "detailsUrl": "https://spdx.org/licenses/ssh-keyscan.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-4.0.json",
-      "referenceNumber": 396,
-      "name": "Creative Commons Attribution Non Commercial No Derivatives =
4.0 International",
-      "licenseId": "CC-BY-NC-ND-4.0",
+      "isOsiApproved": false,
+      "licenseId": "ssh-keyscan",
+      "name": "ssh-keyscan License",
+      "reference": "https://spdx.org/licenses/ssh-keyscan.html",
+      "referenceNumber": 294,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://github.com/openssh/openssh-portable/blob/master/LICENCE#L=
82"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-3.0-DE.html",
+      "detailsUrl": "https://spdx.org/licenses/SSH-OpenSSH.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-3.0-DE.json",
-      "referenceNumber": 397,
-      "name": "Creative Commons Attribution Non Commercial 3.0 Germany",
-      "licenseId": "CC-BY-NC-3.0-DE",
+      "isOsiApproved": false,
+      "licenseId": "SSH-OpenSSH",
+      "name": "SSH OpenSSH license",
+      "reference": "https://spdx.org/licenses/SSH-OpenSSH.html",
+      "referenceNumber": 506,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc/3.0/de/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://github.com/openssh/openssh-portable/blob/1b11ea7c58cd5c59=
838b5fa574cd456d6047b2d4/LICENCE#L10"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LGPL-2.1+.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1+.json",
-      "referenceNumber": 398,
-      "name": "GNU Library General Public License v2.1 or later",
-      "licenseId": "LGPL-2.1+",
+      "detailsUrl": "https://spdx.org/licenses/SSH-short.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "SSH-short",
+      "name": "SSH short notice",
+      "reference": "https://spdx.org/licenses/SSH-short.html",
+      "referenceNumber": 563,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.htm=
l",
-        "https://opensource.org/licenses/LGPL-2.1"
-      ],
-      "isOsiApproved": true
+        "https://github.com/openssh/openssh-portable/blob/1b11ea7c58cd5c59=
838b5fa574cd456d6047b2d4/pathnames.h",
+        "http://web.mit.edu/kolya/.f/root/athena.mit.edu/sipb.mit.edu/proj=
ect/openssh/OldFiles/src/openssh-2.9.9p2/ssh-add.1",
+        "https://joinup.ec.europa.eu/svn/lesoll/trunk/italc/lib/src/dsa_ke=
y.cpp"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OPL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/SSLeay-standalone.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OPL-1.0.json",
-      "referenceNumber": 399,
-      "name": "Open Public License v1.0",
-      "licenseId": "OPL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "SSLeay-standalone",
+      "name": "SSLeay License - standalone",
+      "reference": "https://spdx.org/licenses/SSLeay-standalone.html",
+      "referenceNumber": 591,
       "seeAlso": [
-        "http://old.koalateam.com/jackaroo/OPL_1_0.TXT",
-        "https://fedoraproject.org/wiki/Licensing/Open_Public_License"
-      ],
-      "isOsiApproved": false
+        "https://www.tq-group.com/filedownloads/files/software-license-con=
ditions/OriginalSSLeay/OriginalSSLeay.pdf"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/HPND-sell-variant.html",
+      "detailsUrl": "https://spdx.org/licenses/SSPL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/HPND-sell-variant.json",
-      "referenceNumber": 400,
-      "name": "Historical Permission Notice and Disclaimer - sell variant",
-      "licenseId": "HPND-sell-variant",
+      "isOsiApproved": false,
+      "licenseId": "SSPL-1.0",
+      "name": "Server Side Public License, v 1",
+      "reference": "https://spdx.org/licenses/SSPL-1.0.html",
+      "referenceNumber": 17,
       "seeAlso": [
-        "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/tree/net/sunrpc/auth_gss/gss_generic_token.c?h\u003dv4.19"
-      ],
-      "isOsiApproved": false
+        "https://www.mongodb.com/licensing/server-side-public-license"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/QPL-1.0.html",
-      "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/QPL-1.0.json",
-      "referenceNumber": 401,
-      "name": "Q Public License 1.0",
-      "licenseId": "QPL-1.0",
+      "detailsUrl": "https://spdx.org/licenses/StandardML-NJ.json",
+      "isDeprecatedLicenseId": true,
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "StandardML-NJ",
+      "name": "Standard ML of New Jersey License",
+      "reference": "https://spdx.org/licenses/StandardML-NJ.html",
+      "referenceNumber": 658,
       "seeAlso": [
-        "http://doc.qt.nokia.com/3.3/license.html",
-        "https://opensource.org/licenses/QPL-1.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://www.smlnj.org/license.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/EUPL-1.2.html",
+      "detailsUrl": "https://spdx.org/licenses/SugarCRM-1.1.3.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/EUPL-1.2.json",
-      "referenceNumber": 402,
-      "name": "European Union Public License 1.2",
-      "licenseId": "EUPL-1.2",
+      "isOsiApproved": false,
+      "licenseId": "SugarCRM-1.1.3",
+      "name": "SugarCRM Public License v1.1.3",
+      "reference": "https://spdx.org/licenses/SugarCRM-1.1.3.html",
+      "referenceNumber": 42,
       "seeAlso": [
-        "https://joinup.ec.europa.eu/page/eupl-text-11-12",
-        "https://joinup.ec.europa.eu/sites/default/files/custom-page/attac=
hment/eupl_v1.2_en.pdf",
-        "https://joinup.ec.europa.eu/sites/default/files/custom-page/attac=
hment/2020-03/EUPL-1.2%20EN.txt",
-        "https://joinup.ec.europa.eu/sites/default/files/inline-files/EUPL=
%20v1_2%20EN(1).txt",
-        "http://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri\u003dCELE=
X:32017D0863",
-        "https://opensource.org/licenses/EUPL-1.2"
-      ],
-      "isOsiApproved": true
+        "http://www.sugarcrm.com/crm/SPL"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.2-no-invariants-or-la=
ter.html",
+      "detailsUrl": "https://spdx.org/licenses/Sun-PPP.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.2-no-invariants-or-l=
ater.json",
-      "referenceNumber": 403,
-      "name": "GNU Free Documentation License v1.2 or later - no invariant=
s",
-      "licenseId": "GFDL-1.2-no-invariants-or-later",
+      "isOsiApproved": false,
+      "licenseId": "Sun-PPP",
+      "name": "Sun PPP License",
+      "reference": "https://spdx.org/licenses/Sun-PPP.html",
+      "referenceNumber": 385,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/fdl-1.2.txt"
-      ],
-      "isOsiApproved": false
+        "https://github.com/ppp-project/ppp/blob/master/pppd/eap.c#L7-L16"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/eCos-2.0.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/eCos-2.0.json",
-      "referenceNumber": 404,
-      "name": "eCos license version 2.0",
-      "licenseId": "eCos-2.0",
+      "detailsUrl": "https://spdx.org/licenses/Sun-PPP-2000.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Sun-PPP-2000",
+      "name": "Sun PPP License (2000)",
+      "reference": "https://spdx.org/licenses/Sun-PPP-2000.html",
+      "referenceNumber": 310,
       "seeAlso": [
-        "https://www.gnu.org/licenses/ecos-license.html"
-      ],
-      "isOsiApproved": false
+        "https://github.com/ppp-project/ppp/blob/master/modules/ppp_ahdlc.=
c#L7-L19"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/NCGL-UK-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/SunPro.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NCGL-UK-2.0.json",
-      "referenceNumber": 405,
-      "name": "Non-Commercial Government Licence",
-      "licenseId": "NCGL-UK-2.0",
+      "isOsiApproved": false,
+      "licenseId": "SunPro",
+      "name": "SunPro License",
+      "reference": "https://spdx.org/licenses/SunPro.html",
+      "referenceNumber": 57,
       "seeAlso": [
-        "http://www.nationalarchives.gov.uk/doc/non-commercial-government-=
licence/version/2/"
-      ],
-      "isOsiApproved": false
+        "https://github.com/freebsd/freebsd-src/blob/main/lib/msun/src/e_a=
cosh.c",
+        "https://github.com/freebsd/freebsd-src/blob/main/lib/msun/src/e_l=
gammal.c"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Beerware.html",
+      "detailsUrl": "https://spdx.org/licenses/SWL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Beerware.json",
-      "referenceNumber": 406,
-      "name": "Beerware License",
-      "licenseId": "Beerware",
+      "isOsiApproved": false,
+      "licenseId": "SWL",
+      "name": "Scheme Widget Library (SWL) Software License Agreement",
+      "reference": "https://spdx.org/licenses/SWL.html",
+      "referenceNumber": 649,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Beerware",
-        "https://people.freebsd.org/~phk/"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/SWL"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-Open-MPI.html",
+      "detailsUrl": "https://spdx.org/licenses/swrule.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Open-MPI.json",
-      "referenceNumber": 407,
-      "name": "BSD 3-Clause Open MPI variant",
-      "licenseId": "BSD-3-Clause-Open-MPI",
+      "isOsiApproved": false,
+      "licenseId": "swrule",
+      "name": "swrule License",
+      "reference": "https://spdx.org/licenses/swrule.html",
+      "referenceNumber": 90,
       "seeAlso": [
-        "https://www.open-mpi.org/community/license.php",
-        "http://www.netlib.org/lapack/LICENSE.txt"
-      ],
-      "isOsiApproved": false
+        "https://ctan.math.utah.edu/ctan/tex-archive/macros/generic/misc/s=
wrule.sty"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GPL-2.0-with-bison-exception=
.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-bison-exceptio=
n.json",
-      "referenceNumber": 408,
-      "name": "GNU General Public License v2.0 w/Bison exception",
-      "licenseId": "GPL-2.0-with-bison-exception",
+      "detailsUrl": "https://spdx.org/licenses/Symlinks.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "Symlinks",
+      "name": "Symlinks License",
+      "reference": "https://spdx.org/licenses/Symlinks.html",
+      "referenceNumber": 414,
       "seeAlso": [
-        "http://git.savannah.gnu.org/cgit/bison.git/tree/data/yacc.c?id\u0=
03d193d7c7054ba7197b0789e14965b739162319b5e#n141"
-      ],
-      "isOsiApproved": false
+        "https://www.mail-archive.com/debian-bugs-rc@lists.debian.org/msg1=
1494.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CECILL-B.html",
+      "detailsUrl": "https://spdx.org/licenses/TAPR-OHL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CECILL-B.json",
-      "referenceNumber": 409,
-      "name": "CeCILL-B Free Software License Agreement",
-      "licenseId": "CECILL-B",
-      "seeAlso": [
-        "http://www.cecill.info/licences/Licence_CeCILL-B_V1-en.html"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
-    },
-    {
-      "reference": "https://spdx.org/licenses/GPL-2.0-with-autoconf-except=
ion.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GPL-2.0-with-autoconf-excep=
tion.json",
-      "referenceNumber": 410,
-      "name": "GNU General Public License v2.0 w/Autoconf exception",
-      "licenseId": "GPL-2.0-with-autoconf-exception",
+      "licenseId": "TAPR-OHL-1.0",
+      "name": "TAPR Open Hardware License v1.0",
+      "reference": "https://spdx.org/licenses/TAPR-OHL-1.0.html",
+      "referenceNumber": 242,
       "seeAlso": [
-        "http://ac-archive.sourceforge.net/doc/copyright.html"
-      ],
-      "isOsiApproved": false
+        "https://www.tapr.org/OHL"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/EPL-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/TCL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/EPL-2.0.json",
-      "referenceNumber": 411,
-      "name": "Eclipse Public License 2.0",
-      "licenseId": "EPL-2.0",
+      "isOsiApproved": false,
+      "licenseId": "TCL",
+      "name": "TCL/TK License",
+      "reference": "https://spdx.org/licenses/TCL.html",
+      "referenceNumber": 2,
       "seeAlso": [
-        "https://www.eclipse.org/legal/epl-2.0",
-        "https://www.opensource.org/licenses/EPL-2.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "http://www.tcl.tk/software/tcltk/license.html",
+        "https://fedoraproject.org/wiki/Licensing/TCL"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MIT-feh.html",
+      "detailsUrl": "https://spdx.org/licenses/TCP-wrappers.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MIT-feh.json",
-      "referenceNumber": 412,
-      "name": "feh License",
-      "licenseId": "MIT-feh",
+      "isOsiApproved": false,
+      "licenseId": "TCP-wrappers",
+      "name": "TCP Wrappers License",
+      "reference": "https://spdx.org/licenses/TCP-wrappers.html",
+      "referenceNumber": 9,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/MIT#feh"
-      ],
-      "isOsiApproved": false
+        "http://rc.quest.com/topics/openssh/license.php#tcpwrappers"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/RPL-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/TermReadKey.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/RPL-1.1.json",
-      "referenceNumber": 413,
-      "name": "Reciprocal Public License 1.1",
-      "licenseId": "RPL-1.1",
+      "isOsiApproved": false,
+      "licenseId": "TermReadKey",
+      "name": "TermReadKey License",
+      "reference": "https://spdx.org/licenses/TermReadKey.html",
+      "referenceNumber": 256,
       "seeAlso": [
-        "https://opensource.org/licenses/RPL-1.1"
-      ],
-      "isOsiApproved": true
+        "https://github.com/jonathanstowe/TermReadKey/blob/master/README#L=
9-L10"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CDLA-Permissive-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/TGPPL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CDLA-Permissive-1.0.json",
-      "referenceNumber": 414,
-      "name": "Community Data License Agreement Permissive 1.0",
-      "licenseId": "CDLA-Permissive-1.0",
+      "isOsiApproved": false,
+      "licenseId": "TGPPL-1.0",
+      "name": "Transitive Grace Period Public Licence 1.0",
+      "reference": "https://spdx.org/licenses/TGPPL-1.0.html",
+      "referenceNumber": 101,
       "seeAlso": [
-        "https://cdla.io/permissive-1-0"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/TGPPL",
+        "https://tahoe-lafs.org/trac/tahoe-lafs/browser/trunk/COPYING.TGPP=
L.rst"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Python-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/threeparttable.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Python-2.0.json",
-      "referenceNumber": 415,
-      "name": "Python License 2.0",
-      "licenseId": "Python-2.0",
+      "isOsiApproved": false,
+      "licenseId": "threeparttable",
+      "name": "threeparttable License",
+      "reference": "https://spdx.org/licenses/threeparttable.html",
+      "referenceNumber": 398,
       "seeAlso": [
-        "https://opensource.org/licenses/Python-2.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://fedoraproject.org/wiki/Licensing/Threeparttable"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MPL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/TMate.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MPL-1.0.json",
-      "referenceNumber": 416,
-      "name": "Mozilla Public License 1.0",
-      "licenseId": "MPL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "TMate",
+      "name": "TMate Open Source License",
+      "reference": "https://spdx.org/licenses/TMate.html",
+      "referenceNumber": 539,
       "seeAlso": [
-        "http://www.mozilla.org/MPL/MPL-1.0.html",
-        "https://opensource.org/licenses/MPL-1.0"
-      ],
-      "isOsiApproved": true
+        "http://svnkit.com/license.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GFDL-1.1-or-later.html",
+      "detailsUrl": "https://spdx.org/licenses/TORQUE-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/GFDL-1.1-or-later.json",
-      "referenceNumber": 417,
-      "name": "GNU Free Documentation License v1.1 or later",
-      "licenseId": "GFDL-1.1-or-later",
-      "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/fdl-1.1.txt"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "TORQUE-1.1",
+      "name": "TORQUE v2.5+ Software License v1.1",
+      "reference": "https://spdx.org/licenses/TORQUE-1.1.html",
+      "referenceNumber": 61,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing/TORQUEv1.1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/diffmark.html",
+      "detailsUrl": "https://spdx.org/licenses/TOSL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/diffmark.json",
-      "referenceNumber": 418,
-      "name": "diffmark license",
-      "licenseId": "diffmark",
+      "isOsiApproved": false,
+      "licenseId": "TOSL",
+      "name": "Trusster Open Source License",
+      "reference": "https://spdx.org/licenses/TOSL.html",
+      "referenceNumber": 267,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/diffmark"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/TOSL"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/GPL-1.0+.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/GPL-1.0+.json",
-      "referenceNumber": 419,
-      "name": "GNU General Public License v1.0 or later",
-      "licenseId": "GPL-1.0+",
+      "detailsUrl": "https://spdx.org/licenses/TPDL.json",
+      "isDeprecatedLicenseId": false,
+      "isOsiApproved": false,
+      "licenseId": "TPDL",
+      "name": "Time::ParseDate License",
+      "reference": "https://spdx.org/licenses/TPDL.html",
+      "referenceNumber": 75,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/gpl-1.0-standalone.html"
-      ],
-      "isOsiApproved": false
+        "https://metacpan.org/pod/Time::ParseDate#LICENSE"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OpenSSL.html",
+      "detailsUrl": "https://spdx.org/licenses/TPL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OpenSSL.json",
-      "referenceNumber": 420,
-      "name": "OpenSSL License",
-      "licenseId": "OpenSSL",
-      "seeAlso": [
-        "http://www.openssl.org/source/license.html"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "TPL-1.0",
+      "name": "THOR Public License 1.0",
+      "reference": "https://spdx.org/licenses/TPL-1.0.html",
+      "referenceNumber": 508,
+      "seeAlso": [
+        "https://fedoraproject.org/wiki/Licensing:ThorPublicLicense"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OSL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/TTWL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OSL-1.0.json",
-      "referenceNumber": 421,
-      "name": "Open Software License 1.0",
-      "licenseId": "OSL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "TTWL",
+      "name": "Text-Tabs+Wrap License",
+      "reference": "https://spdx.org/licenses/TTWL.html",
+      "referenceNumber": 87,
       "seeAlso": [
-        "https://opensource.org/licenses/OSL-1.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://fedoraproject.org/wiki/Licensing/TTWL",
+        "https://github.com/ap/Text-Tabs/blob/master/lib.modern/Text/Tabs.=
pm#L148"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Parity-6.0.0.html",
+      "detailsUrl": "https://spdx.org/licenses/TTYP0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Parity-6.0.0.json",
-      "referenceNumber": 422,
-      "name": "The Parity Public License 6.0.0",
-      "licenseId": "Parity-6.0.0",
+      "isOsiApproved": false,
+      "licenseId": "TTYP0",
+      "name": "TTYP0 License",
+      "reference": "https://spdx.org/licenses/TTYP0.html",
+      "referenceNumber": 451,
       "seeAlso": [
-        "https://paritylicense.com/versions/6.0.0.html"
-      ],
-      "isOsiApproved": false
+        "https://people.mpi-inf.mpg.de/~uwe/misc/uw-ttyp0/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/AGPL-1.0.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/AGPL-1.0.json",
-      "referenceNumber": 423,
-      "name": "Affero General Public License v1.0",
-      "licenseId": "AGPL-1.0",
-      "seeAlso": [
-        "http://www.affero.org/oagpl.html"
-      ],
+      "detailsUrl": "https://spdx.org/licenses/TU-Berlin-1.0.json",
+      "isDeprecatedLicenseId": false,
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "TU-Berlin-1.0",
+      "name": "Technische Universitaet Berlin License 1.0",
+      "reference": "https://spdx.org/licenses/TU-Berlin-1.0.html",
+      "referenceNumber": 159,
+      "seeAlso": [
+        "https://github.com/swh/ladspa/blob/7bf6f3799fdba70fda297c2d8fd9f5=
26803d9680/gsm/COPYRIGHT"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/YPL-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/TU-Berlin-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/YPL-1.1.json",
-      "referenceNumber": 424,
-      "name": "Yahoo! Public License v1.1",
-      "licenseId": "YPL-1.1",
-      "seeAlso": [
-        "http://www.zimbra.com/license/yahoo_public_license_1.1.html"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "TU-Berlin-2.0",
+      "name": "Technische Universitaet Berlin License 2.0",
+      "reference": "https://spdx.org/licenses/TU-Berlin-2.0.html",
+      "referenceNumber": 624,
+      "seeAlso": [
+        "https://github.com/CorsixTH/deps/blob/fd339a9f526d1d9c9f01ccf39e4=
38a015da50035/licences/libgsm.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SSH-short.html",
+      "detailsUrl": "https://spdx.org/licenses/UCAR.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SSH-short.json",
-      "referenceNumber": 425,
-      "name": "SSH short notice",
-      "licenseId": "SSH-short",
+      "isOsiApproved": false,
+      "licenseId": "UCAR",
+      "name": "UCAR License",
+      "reference": "https://spdx.org/licenses/UCAR.html",
+      "referenceNumber": 78,
       "seeAlso": [
-        "https://github.com/openssh/openssh-portable/blob/1b11ea7c58cd5c59=
838b5fa574cd456d6047b2d4/pathnames.h",
-        "http://web.mit.edu/kolya/.f/root/athena.mit.edu/sipb.mit.edu/proj=
ect/openssh/OldFiles/src/openssh-2.9.9p2/ssh-add.1",
-        "https://joinup.ec.europa.eu/svn/lesoll/trunk/italc/lib/src/dsa_ke=
y.cpp"
-      ],
-      "isOsiApproved": false
+        "https://github.com/Unidata/UDUNITS-2/blob/master/COPYRIGHT"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/IBM-pibs.html",
+      "detailsUrl": "https://spdx.org/licenses/UCL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/IBM-pibs.json",
-      "referenceNumber": 426,
-      "name": "IBM PowerPC Initialization and Boot Software",
-      "licenseId": "IBM-pibs",
+      "isOsiApproved": true,
+      "licenseId": "UCL-1.0",
+      "name": "Upstream Compatibility License v1.0",
+      "reference": "https://spdx.org/licenses/UCL-1.0.html",
+      "referenceNumber": 646,
       "seeAlso": [
-        "http://git.denx.de/?p\u003du-boot.git;a\u003dblob;f\u003darch/pow=
erpc/cpu/ppc4xx/miiphy.c;h\u003d297155fdafa064b955e53e9832de93bfb0cfb85b;hb=
\u003d9fab4bf4cc077c21e43941866f3f2c196f28670d"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/UCL-1.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Xnet.html",
+      "detailsUrl": "https://spdx.org/licenses/ulem.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Xnet.json",
-      "referenceNumber": 427,
-      "name": "X.Net License",
-      "licenseId": "Xnet",
+      "isOsiApproved": false,
+      "licenseId": "ulem",
+      "name": "ulem License",
+      "reference": "https://spdx.org/licenses/ulem.html",
+      "referenceNumber": 566,
       "seeAlso": [
-        "https://opensource.org/licenses/Xnet"
-      ],
-      "isOsiApproved": true
+        "https://mirrors.ctan.org/macros/latex/contrib/ulem/README"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/TU-Berlin-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/UMich-Merit.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/TU-Berlin-1.0.json",
-      "referenceNumber": 428,
-      "name": "Technische Universitaet Berlin License 1.0",
-      "licenseId": "TU-Berlin-1.0",
+      "isOsiApproved": false,
+      "licenseId": "UMich-Merit",
+      "name": "Michigan/Merit Networks License",
+      "reference": "https://spdx.org/licenses/UMich-Merit.html",
+      "referenceNumber": 505,
       "seeAlso": [
-        "https://github.com/swh/ladspa/blob/7bf6f3799fdba70fda297c2d8fd9f5=
26803d9680/gsm/COPYRIGHT"
-      ],
-      "isOsiApproved": false
+        "https://github.com/radcli/radcli/blob/master/COPYRIGHT#L64"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/AGPL-3.0.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/AGPL-3.0.json",
-      "referenceNumber": 429,
-      "name": "GNU Affero General Public License v3.0",
-      "licenseId": "AGPL-3.0",
-      "seeAlso": [
-        "https://www.gnu.org/licenses/agpl.txt",
-        "https://opensource.org/licenses/AGPL-3.0"
-      ],
+      "detailsUrl": "https://spdx.org/licenses/Unicode-3.0.json",
+      "isDeprecatedLicenseId": false,
       "isOsiApproved": true,
-      "isFsfLibre": true
+      "licenseId": "Unicode-3.0",
+      "name": "Unicode License v3",
+      "reference": "https://spdx.org/licenses/Unicode-3.0.html",
+      "referenceNumber": 46,
+      "seeAlso": [
+        "https://www.unicode.org/license.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CAL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/Unicode-DFS-2015.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CAL-1.0.json",
-      "referenceNumber": 430,
-      "name": "Cryptographic Autonomy License 1.0",
-      "licenseId": "CAL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "Unicode-DFS-2015",
+      "name": "Unicode License Agreement - Data Files and Software (2015)",
+      "reference": "https://spdx.org/licenses/Unicode-DFS-2015.html",
+      "referenceNumber": 647,
       "seeAlso": [
-        "http://cryptographicautonomylicense.com/license-text.html",
-        "https://opensource.org/licenses/CAL-1.0"
-      ],
-      "isOsiApproved": true
+        "https://web.archive.org/web/20151224134844/http://unicode.org/cop=
yright.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/AFL-3.0.html",
+      "detailsUrl": "https://spdx.org/licenses/Unicode-DFS-2016.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/AFL-3.0.json",
-      "referenceNumber": 431,
-      "name": "Academic Free License v3.0",
-      "licenseId": "AFL-3.0",
-      "seeAlso": [
-        "http://www.rosenlaw.com/AFL3.0.htm",
-        "https://opensource.org/licenses/afl-3.0"
-      ],
       "isOsiApproved": true,
-      "isFsfLibre": true
+      "licenseId": "Unicode-DFS-2016",
+      "name": "Unicode License Agreement - Data Files and Software (2016)",
+      "reference": "https://spdx.org/licenses/Unicode-DFS-2016.html",
+      "referenceNumber": 152,
+      "seeAlso": [
+        "https://www.unicode.org/license.txt",
+        "http://web.archive.org/web/20160823201924/http://www.unicode.org/=
copyright.html#License",
+        "http://www.unicode.org/copyright.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CECILL-C.html",
+      "detailsUrl": "https://spdx.org/licenses/Unicode-TOU.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CECILL-C.json",
-      "referenceNumber": 432,
-      "name": "CeCILL-C Free Software License Agreement",
-      "licenseId": "CECILL-C",
-      "seeAlso": [
-        "http://www.cecill.info/licences/Licence_CeCILL-C_V1-en.html"
-      ],
       "isOsiApproved": false,
-      "isFsfLibre": true
+      "licenseId": "Unicode-TOU",
+      "name": "Unicode Terms of Use",
+      "reference": "https://spdx.org/licenses/Unicode-TOU.html",
+      "referenceNumber": 606,
+      "seeAlso": [
+        "http://web.archive.org/web/20140704074106/http://www.unicode.org/=
copyright.html",
+        "http://www.unicode.org/copyright.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OGL-UK-3.0.html",
+      "detailsUrl": "https://spdx.org/licenses/UnixCrypt.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OGL-UK-3.0.json",
-      "referenceNumber": 433,
-      "name": "Open Government Licence v3.0",
-      "licenseId": "OGL-UK-3.0",
+      "isOsiApproved": false,
+      "licenseId": "UnixCrypt",
+      "name": "UnixCrypt License",
+      "reference": "https://spdx.org/licenses/UnixCrypt.html",
+      "referenceNumber": 462,
       "seeAlso": [
-        "http://www.nationalarchives.gov.uk/doc/open-government-licence/ve=
rsion/3/"
-      ],
-      "isOsiApproved": false
+        "https://foss.heptapod.net/python-libs/passlib/-/blob/branch/stabl=
e/LICENSE#L70",
+        "https://opensource.apple.com/source/JBoss/JBoss-737/jboss-all/jet=
ty/src/main/org/mortbay/util/UnixCrypt.java.auto.html",
+        "https://archive.eclipse.org/jetty/8.0.1.v20110908/xref/org/eclips=
e/jetty/http/security/UnixCrypt.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-Clear.html",
+      "detailsUrl": "https://spdx.org/licenses/Unlicense.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Clear.json",
-      "referenceNumber": 434,
-      "name": "BSD 3-Clause Clear License",
-      "licenseId": "BSD-3-Clause-Clear",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "Unlicense",
+      "name": "The Unlicense",
+      "reference": "https://spdx.org/licenses/Unlicense.html",
+      "referenceNumber": 411,
       "seeAlso": [
-        "http://labs.metacarta.com/license-explanation.html#license"
-      ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+        "https://unlicense.org/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-Modification.ht=
ml",
+      "detailsUrl": "https://spdx.org/licenses/UPL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Modification.j=
son",
-      "referenceNumber": 435,
-      "name": "BSD 3-Clause Modification",
-      "licenseId": "BSD-3-Clause-Modification",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "UPL-1.0",
+      "name": "Universal Permissive License v1.0",
+      "reference": "https://spdx.org/licenses/UPL-1.0.html",
+      "referenceNumber": 511,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing:BSD#Modification_Variant"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/UPL"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-SA-2.0-UK.html",
+      "detailsUrl": "https://spdx.org/licenses/URT-RLE.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-SA-2.0-UK.json",
-      "referenceNumber": 436,
-      "name": "Creative Commons Attribution Share Alike 2.0 England and Wa=
les",
-      "licenseId": "CC-BY-SA-2.0-UK",
+      "isOsiApproved": false,
+      "licenseId": "URT-RLE",
+      "name": "Utah Raster Toolkit Run Length Encoded License",
+      "reference": "https://spdx.org/licenses/URT-RLE.html",
+      "referenceNumber": 443,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-sa/2.0/uk/legalcode"
-      ],
-      "isOsiApproved": false
+        "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/conv=
erter/other/pnmtorle.c",
+        "https://sourceforge.net/p/netpbm/code/HEAD/tree/super_stable/conv=
erter/other/rletopnm.c"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Saxpath.html",
+      "detailsUrl": "https://spdx.org/licenses/Vim.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Saxpath.json",
-      "referenceNumber": 437,
-      "name": "Saxpath License",
-      "licenseId": "Saxpath",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "Vim",
+      "name": "Vim License",
+      "reference": "https://spdx.org/licenses/Vim.html",
+      "referenceNumber": 371,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Saxpath_License"
-      ],
-      "isOsiApproved": false
+        "http://vimdoc.sourceforge.net/htmldoc/uganda.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/NLPL.html",
+      "detailsUrl": "https://spdx.org/licenses/VOSTROM.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NLPL.json",
-      "referenceNumber": 438,
-      "name": "No Limit Public License",
-      "licenseId": "NLPL",
+      "isOsiApproved": false,
+      "licenseId": "VOSTROM",
+      "name": "VOSTROM Public License for Open Source",
+      "reference": "https://spdx.org/licenses/VOSTROM.html",
+      "referenceNumber": 122,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/NLPL"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/VOSTROM"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/SimPL-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/VSL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/SimPL-2.0.json",
-      "referenceNumber": 439,
-      "name": "Simple Public License 2.0",
-      "licenseId": "SimPL-2.0",
+      "isOsiApproved": true,
+      "licenseId": "VSL-1.0",
+      "name": "Vovida Software License v1.0",
+      "reference": "https://spdx.org/licenses/VSL-1.0.html",
+      "referenceNumber": 510,
       "seeAlso": [
-        "https://opensource.org/licenses/SimPL-2.0"
-      ],
-      "isOsiApproved": true
+        "https://opensource.org/licenses/VSL-1.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/psfrag.html",
+      "detailsUrl": "https://spdx.org/licenses/W3C.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/psfrag.json",
-      "referenceNumber": 440,
-      "name": "psfrag License",
-      "licenseId": "psfrag",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "W3C",
+      "name": "W3C Software Notice and License (2002-12-31)",
+      "reference": "https://spdx.org/licenses/W3C.html",
+      "referenceNumber": 284,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/psfrag"
-      ],
-      "isOsiApproved": false
+        "http://www.w3.org/Consortium/Legal/2002/copyright-software-200212=
31.html",
+        "https://opensource.org/licenses/W3C"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Spencer-86.html",
+      "detailsUrl": "https://spdx.org/licenses/W3C-19980720.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Spencer-86.json",
-      "referenceNumber": 441,
-      "name": "Spencer License 86",
-      "licenseId": "Spencer-86",
+      "isOsiApproved": false,
+      "licenseId": "W3C-19980720",
+      "name": "W3C Software Notice and License (1998-07-20)",
+      "reference": "https://spdx.org/licenses/W3C-19980720.html",
+      "referenceNumber": 156,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Henry_Spencer_Reg-Ex_Lib=
rary_License"
-      ],
-      "isOsiApproved": false
+        "http://www.w3.org/Consortium/Legal/copyright-software-19980720.ht=
ml"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OCCT-PL.html",
+      "detailsUrl": "https://spdx.org/licenses/W3C-20150513.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OCCT-PL.json",
-      "referenceNumber": 442,
-      "name": "Open CASCADE Technology Public License",
-      "licenseId": "OCCT-PL",
+      "isOsiApproved": false,
+      "licenseId": "W3C-20150513",
+      "name": "W3C Software Notice and Document License (2015-05-13)",
+      "reference": "https://spdx.org/licenses/W3C-20150513.html",
+      "referenceNumber": 452,
       "seeAlso": [
-        "http://www.opencascade.com/content/occt-public-license"
-      ],
-      "isOsiApproved": false
+        "https://www.w3.org/Consortium/Legal/2015/copyright-software-and-d=
ocument",
+        "https://www.w3.org/copyright/software-license-2015/",
+        "https://www.w3.org/copyright/software-license-2023/"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CERN-OHL-S-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/w3m.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CERN-OHL-S-2.0.json",
-      "referenceNumber": 443,
-      "name": "CERN Open Hardware Licence Version 2 - Strongly Reciprocal",
-      "licenseId": "CERN-OHL-S-2.0",
+      "isOsiApproved": false,
+      "licenseId": "w3m",
+      "name": "w3m License",
+      "reference": "https://spdx.org/licenses/w3m.html",
+      "referenceNumber": 202,
       "seeAlso": [
-        "https://www.ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-ver=
sion-2"
-      ],
-      "isOsiApproved": true
+        "https://github.com/tats/w3m/blob/master/COPYING"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/ErlPL-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/Watcom-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/ErlPL-1.1.json",
-      "referenceNumber": 444,
-      "name": "Erlang Public License v1.1",
-      "licenseId": "ErlPL-1.1",
+      "isFsfLibre": false,
+      "isOsiApproved": true,
+      "licenseId": "Watcom-1.0",
+      "name": "Sybase Open Watcom Public License 1.0",
+      "reference": "https://spdx.org/licenses/Watcom-1.0.html",
+      "referenceNumber": 533,
       "seeAlso": [
-        "http://www.erlang.org/EPLICENSE"
-      ],
-      "isOsiApproved": false
+        "https://opensource.org/licenses/Watcom-1.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/MIT-CMU.html",
+      "detailsUrl": "https://spdx.org/licenses/Widget-Workshop.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/MIT-CMU.json",
-      "referenceNumber": 445,
-      "name": "CMU License",
-      "licenseId": "MIT-CMU",
+      "isOsiApproved": false,
+      "licenseId": "Widget-Workshop",
+      "name": "Widget Workshop License",
+      "reference": "https://spdx.org/licenses/Widget-Workshop.html",
+      "referenceNumber": 548,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing:MIT?rd\u003dLicensing/MI=
T#CMU_Style",
-        "https://github.com/python-pillow/Pillow/blob/fffb426092c8db24a5f4=
b6df243a8a3c01fb63cd/LICENSE"
-      ],
-      "isOsiApproved": false
+        "https://github.com/novnc/noVNC/blob/master/core/crypto/des.js#L24"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/NIST-PD.html",
+      "detailsUrl": "https://spdx.org/licenses/Wsuipa.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NIST-PD.json",
-      "referenceNumber": 446,
-      "name": "NIST Public Domain Notice",
-      "licenseId": "NIST-PD",
+      "isOsiApproved": false,
+      "licenseId": "Wsuipa",
+      "name": "Wsuipa License",
+      "reference": "https://spdx.org/licenses/Wsuipa.html",
+      "referenceNumber": 305,
       "seeAlso": [
-        "https://github.com/tcheneau/simpleRPL/blob/e645e69e38dd4e3ccfeceb=
2db8cba05b7c2e0cd3/LICENSE.txt",
-        "https://github.com/tcheneau/Routing/blob/f09f46fcfe636107f22f2c98=
348188a65a135d98/README.md"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/Wsuipa"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OSL-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/WTFPL.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OSL-2.0.json",
-      "referenceNumber": 447,
-      "name": "Open Software License 2.0",
-      "licenseId": "OSL-2.0",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "WTFPL",
+      "name": "Do What The F*ck You Want To Public License",
+      "reference": "https://spdx.org/licenses/WTFPL.html",
+      "referenceNumber": 176,
       "seeAlso": [
-        "http://web.archive.org/web/20041020171434/http://www.rosenlaw.com=
/osl2.0.html"
-      ],
+        "http://www.wtfpl.net/about/",
+        "http://sam.zoy.org/wtfpl/COPYING"
+      ]
+    },
+    {
+      "detailsUrl": "https://spdx.org/licenses/wxWindows.json",
+      "isDeprecatedLicenseId": true,
       "isOsiApproved": true,
-      "isFsfLibre": true
+      "licenseId": "wxWindows",
+      "name": "wxWindows Library License",
+      "reference": "https://spdx.org/licenses/wxWindows.html",
+      "referenceNumber": 258,
+      "seeAlso": [
+        "https://opensource.org/licenses/WXwindows"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/APSL-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/X11.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/APSL-2.0.json",
-      "referenceNumber": 448,
-      "name": "Apple Public Source License 2.0",
-      "licenseId": "APSL-2.0",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "X11",
+      "name": "X11 License",
+      "reference": "https://spdx.org/licenses/X11.html",
+      "referenceNumber": 203,
       "seeAlso": [
-        "http://www.opensource.apple.com/license/apsl/"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "http://www.xfree86.org/3.3.6/COPYRIGHT2.html#3"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Leptonica.html",
+      "detailsUrl": "https://spdx.org/licenses/X11-distribute-modification=
s-variant.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Leptonica.json",
-      "referenceNumber": 449,
-      "name": "Leptonica License",
-      "licenseId": "Leptonica",
+      "isOsiApproved": false,
+      "licenseId": "X11-distribute-modifications-variant",
+      "name": "X11 License Distribution Modification Variant",
+      "reference": "https://spdx.org/licenses/X11-distribute-modifications=
-variant.html",
+      "referenceNumber": 112,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Leptonica"
-      ],
-      "isOsiApproved": false
+        "https://github.com/mirror/ncurses/blob/master/COPYING"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/PolyForm-Small-Business-1.0.=
0.html",
+      "detailsUrl": "https://spdx.org/licenses/Xdebug-1.03.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/PolyForm-Small-Business-1.0=
.0.json",
-      "referenceNumber": 450,
-      "name": "PolyForm Small Business License 1.0.0",
-      "licenseId": "PolyForm-Small-Business-1.0.0",
+      "isOsiApproved": false,
+      "licenseId": "Xdebug-1.03",
+      "name": "Xdebug License v 1.03",
+      "reference": "https://spdx.org/licenses/Xdebug-1.03.html",
+      "referenceNumber": 10,
       "seeAlso": [
-        "https://polyformproject.org/licenses/small-business/1.0.0"
-      ],
-      "isOsiApproved": false
+        "https://github.com/xdebug/xdebug/blob/master/LICENSE"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/LiLiQ-P-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/Xerox.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/LiLiQ-P-1.1.json",
-      "referenceNumber": 451,
-      "name": "Licence Libre du Qu=C3=A9bec =E2=80=93 Permissive version 1=
.1",
-      "licenseId": "LiLiQ-P-1.1",
+      "isOsiApproved": false,
+      "licenseId": "Xerox",
+      "name": "Xerox License",
+      "reference": "https://spdx.org/licenses/Xerox.html",
+      "referenceNumber": 595,
       "seeAlso": [
-        "https://forge.gouv.qc.ca/licence/fr/liliq-v1-1/",
-        "http://opensource.org/licenses/LiLiQ-P-1.1"
-      ],
-      "isOsiApproved": true
+        "https://fedoraproject.org/wiki/Licensing/Xerox"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/NetCDF.html",
+      "detailsUrl": "https://spdx.org/licenses/Xfig.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NetCDF.json",
-      "referenceNumber": 452,
-      "name": "NetCDF license",
-      "licenseId": "NetCDF",
+      "isOsiApproved": false,
+      "licenseId": "Xfig",
+      "name": "Xfig License",
+      "reference": "https://spdx.org/licenses/Xfig.html",
+      "referenceNumber": 89,
       "seeAlso": [
-        "http://www.unidata.ucar.edu/software/netcdf/copyright.html"
-      ],
-      "isOsiApproved": false
+        "https://github.com/Distrotech/transfig/blob/master/transfig/trans=
fig.c",
+        "https://fedoraproject.org/wiki/Licensing:MIT#Xfig_Variant",
+        "https://sourceforge.net/p/mcj/xfig/ci/master/tree/src/Makefile.am"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OML.html",
+      "detailsUrl": "https://spdx.org/licenses/XFree86-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OML.json",
-      "referenceNumber": 453,
-      "name": "Open Market License",
-      "licenseId": "OML",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "XFree86-1.1",
+      "name": "XFree86 License 1.1",
+      "reference": "https://spdx.org/licenses/XFree86-1.1.html",
+      "referenceNumber": 562,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/Open_Market_License"
-      ],
-      "isOsiApproved": false
+        "http://www.xfree86.org/current/LICENSE4.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/AGPL-3.0-or-later.html",
+      "detailsUrl": "https://spdx.org/licenses/xinetd.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/AGPL-3.0-or-later.json",
-      "referenceNumber": 454,
-      "name": "GNU Affero General Public License v3.0 or later",
-      "licenseId": "AGPL-3.0-or-later",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "xinetd",
+      "name": "xinetd License",
+      "reference": "https://spdx.org/licenses/xinetd.html",
+      "referenceNumber": 465,
       "seeAlso": [
-        "https://www.gnu.org/licenses/agpl.txt",
-        "https://opensource.org/licenses/AGPL-3.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://fedoraproject.org/wiki/Licensing/Xinetd_License"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OLDAP-2.2.html",
+      "detailsUrl": "https://spdx.org/licenses/xkeyboard-config-Zinoviev.j=
son",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OLDAP-2.2.json",
-      "referenceNumber": 455,
-      "name": "Open LDAP Public License v2.2",
-      "licenseId": "OLDAP-2.2",
+      "isOsiApproved": false,
+      "licenseId": "xkeyboard-config-Zinoviev",
+      "name": "xkeyboard-config Zinoviev License",
+      "reference": "https://spdx.org/licenses/xkeyboard-config-Zinoviev.ht=
ml",
+      "referenceNumber": 140,
       "seeAlso": [
-        "http://www.openldap.org/devel/gitweb.cgi?p\u003dopenldap.git;a\u0=
03dblob;f\u003dLICENSE;hb\u003d470b0c18ec67621c85881b2733057fecf4a1acc3"
-      ],
-      "isOsiApproved": false
+        "https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/=
-/blob/master/COPYING?ref_type=3Dheads#L178"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-3-Clause.html",
+      "detailsUrl": "https://spdx.org/licenses/xlock.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause.json",
-      "referenceNumber": 456,
-      "name": "BSD 3-Clause \"New\" or \"Revised\" License",
-      "licenseId": "BSD-3-Clause",
+      "isOsiApproved": false,
+      "licenseId": "xlock",
+      "name": "xlock License",
+      "reference": "https://spdx.org/licenses/xlock.html",
+      "referenceNumber": 357,
       "seeAlso": [
-        "https://opensource.org/licenses/BSD-3-Clause"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://fossies.org/linux/tiff/contrib/ras/ras2tif.c"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/WTFPL.html",
+      "detailsUrl": "https://spdx.org/licenses/Xnet.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/WTFPL.json",
-      "referenceNumber": 457,
-      "name": "Do What The F*ck You Want To Public License",
-      "licenseId": "WTFPL",
+      "isOsiApproved": true,
+      "licenseId": "Xnet",
+      "name": "X.Net License",
+      "reference": "https://spdx.org/licenses/Xnet.html",
+      "referenceNumber": 236,
       "seeAlso": [
-        "http://www.wtfpl.net/about/",
-        "http://sam.zoy.org/wtfpl/COPYING"
-      ],
-      "isOsiApproved": false,
-      "isFsfLibre": true
+        "https://opensource.org/licenses/Xnet"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/OGL-UK-2.0.html",
+      "detailsUrl": "https://spdx.org/licenses/xpp.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/OGL-UK-2.0.json",
-      "referenceNumber": 458,
-      "name": "Open Government Licence v2.0",
-      "licenseId": "OGL-UK-2.0",
+      "isOsiApproved": false,
+      "licenseId": "xpp",
+      "name": "XPP License",
+      "reference": "https://spdx.org/licenses/xpp.html",
+      "referenceNumber": 312,
       "seeAlso": [
-        "http://www.nationalarchives.gov.uk/doc/open-government-licence/ve=
rsion/2/"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/xpp"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-3-Clause-Attribution.htm=
l",
+      "detailsUrl": "https://spdx.org/licenses/XSkat.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-3-Clause-Attribution.js=
on",
-      "referenceNumber": 459,
-      "name": "BSD with attribution",
-      "licenseId": "BSD-3-Clause-Attribution",
+      "isOsiApproved": false,
+      "licenseId": "XSkat",
+      "name": "XSkat License",
+      "reference": "https://spdx.org/licenses/XSkat.html",
+      "referenceNumber": 544,
       "seeAlso": [
-        "https://fedoraproject.org/wiki/Licensing/BSD_with_Attribution"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/XSkat_License"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/RPSL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/xzoom.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/RPSL-1.0.json",
-      "referenceNumber": 460,
-      "name": "RealNetworks Public Source License v1.0",
-      "licenseId": "RPSL-1.0",
+      "isOsiApproved": false,
+      "licenseId": "xzoom",
+      "name": "xzoom License",
+      "reference": "https://spdx.org/licenses/xzoom.html",
+      "referenceNumber": 530,
       "seeAlso": [
-        "https://helixcommunity.org/content/rpsl",
-        "https://opensource.org/licenses/RPSL-1.0"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "https://metadata.ftp-master.debian.org/changelogs//main/x/xzoom/x=
zoom_0.3-27_copyright"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-DE.html",
+      "detailsUrl": "https://spdx.org/licenses/YPL-1.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/CC-BY-NC-ND-3.0-DE.json",
-      "referenceNumber": 461,
-      "name": "Creative Commons Attribution Non Commercial No Derivatives =
3.0 Germany",
-      "licenseId": "CC-BY-NC-ND-3.0-DE",
+      "isOsiApproved": false,
+      "licenseId": "YPL-1.0",
+      "name": "Yahoo! Public License v1.0",
+      "reference": "https://spdx.org/licenses/YPL-1.0.html",
+      "referenceNumber": 491,
       "seeAlso": [
-        "https://creativecommons.org/licenses/by-nc-nd/3.0/de/legalcode"
-      ],
-      "isOsiApproved": false
+        "http://www.zimbra.com/license/yahoo_public_license_1.0.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/EUPL-1.1.html",
+      "detailsUrl": "https://spdx.org/licenses/YPL-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/EUPL-1.1.json",
-      "referenceNumber": 462,
-      "name": "European Union Public License 1.1",
-      "licenseId": "EUPL-1.1",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "YPL-1.1",
+      "name": "Yahoo! Public License v1.1",
+      "reference": "https://spdx.org/licenses/YPL-1.1.html",
+      "referenceNumber": 473,
       "seeAlso": [
-        "https://joinup.ec.europa.eu/software/page/eupl/licence-eupl",
-        "https://joinup.ec.europa.eu/sites/default/files/custom-page/attac=
hment/eupl1.1.-licence-en_0.pdf",
-        "https://opensource.org/licenses/EUPL-1.1"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "http://www.zimbra.com/license/yahoo_public_license_1.1.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Sendmail-8.23.html",
+      "detailsUrl": "https://spdx.org/licenses/Zed.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Sendmail-8.23.json",
-      "referenceNumber": 463,
-      "name": "Sendmail License 8.23",
-      "licenseId": "Sendmail-8.23",
+      "isOsiApproved": false,
+      "licenseId": "Zed",
+      "name": "Zed License",
+      "reference": "https://spdx.org/licenses/Zed.html",
+      "referenceNumber": 599,
       "seeAlso": [
-        "https://www.proofpoint.com/sites/default/files/sendmail-license.p=
df",
-        "https://web.archive.org/web/20181003101040/https://www.proofpoint=
.com/sites/default/files/sendmail-license.pdf"
-      ],
-      "isOsiApproved": false
+        "https://fedoraproject.org/wiki/Licensing/Zed"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/ODC-By-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/Zeeff.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/ODC-By-1.0.json",
-      "referenceNumber": 464,
-      "name": "Open Data Commons Attribution License v1.0",
-      "licenseId": "ODC-By-1.0",
+      "isOsiApproved": false,
+      "licenseId": "Zeeff",
+      "name": "Zeeff License",
+      "reference": "https://spdx.org/licenses/Zeeff.html",
+      "referenceNumber": 218,
       "seeAlso": [
-        "https://opendatacommons.org/licenses/by/1.0/"
-      ],
-      "isOsiApproved": false
+        "ftp://ftp.tin.org/pub/news/utils/newsx/newsx-1.6.tar.gz"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/D-FSL-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/Zend-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/D-FSL-1.0.json",
-      "referenceNumber": 465,
-      "name": "Deutsche Freie Software Lizenz",
-      "licenseId": "D-FSL-1.0",
+      "isFsfLibre": true,
+      "isOsiApproved": false,
+      "licenseId": "Zend-2.0",
+      "name": "Zend License v2.0",
+      "reference": "https://spdx.org/licenses/Zend-2.0.html",
+      "referenceNumber": 481,
       "seeAlso": [
-        "http://www.dipp.nrw.de/d-fsl/lizenzen/",
-        "http://www.dipp.nrw.de/d-fsl/index_html/lizenzen/de/D-FSL-1_0_de.=
txt",
-        "http://www.dipp.nrw.de/d-fsl/index_html/lizenzen/en/D-FSL-1_0_en.=
txt",
-        "https://www.hbz-nrw.de/produkte/open-access/lizenzen/dfsl",
-        "https://www.hbz-nrw.de/produkte/open-access/lizenzen/dfsl/deutsch=
e-freie-software-lizenz",
-        "https://www.hbz-nrw.de/produkte/open-access/lizenzen/dfsl/german-=
free-software-license",
-        "https://www.hbz-nrw.de/produkte/open-access/lizenzen/dfsl/D-FSL-1=
_0_de.txt/at_download/file",
-        "https://www.hbz-nrw.de/produkte/open-access/lizenzen/dfsl/D-FSL-1=
_0_en.txt/at_download/file"
-      ],
-      "isOsiApproved": false
+        "https://web.archive.org/web/20130517195954/http://www.zend.com/li=
cense/2_00.txt"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-4-Clause.html",
+      "detailsUrl": "https://spdx.org/licenses/Zimbra-1.3.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-4-Clause.json",
-      "referenceNumber": 466,
-      "name": "BSD 4-Clause \"Original\" or \"Old\" License",
-      "licenseId": "BSD-4-Clause",
-      "seeAlso": [
-        "http://directory.fsf.org/wiki/License:BSD_4Clause"
-      ],
+      "isFsfLibre": true,
       "isOsiApproved": false,
-      "isFsfLibre": true
-    },
-    {
-      "reference": "https://spdx.org/licenses/LGPL-2.1.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/LGPL-2.1.json",
-      "referenceNumber": 467,
-      "name": "GNU Lesser General Public License v2.1 only",
-      "licenseId": "LGPL-2.1",
+      "licenseId": "Zimbra-1.3",
+      "name": "Zimbra Public License v1.3",
+      "reference": "https://spdx.org/licenses/Zimbra-1.3.html",
+      "referenceNumber": 379,
       "seeAlso": [
-        "https://www.gnu.org/licenses/old-licenses/lgpl-2.1-standalone.htm=
l",
-        "https://opensource.org/licenses/LGPL-2.1"
-      ],
-      "isOsiApproved": true,
-      "isFsfLibre": true
+        "http://web.archive.org/web/20100302225219/http://www.zimbra.com/l=
icense/zimbra-public-license-1-3.html"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/BSD-2-Clause-Views.html",
+      "detailsUrl": "https://spdx.org/licenses/Zimbra-1.4.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/BSD-2-Clause-Views.json",
-      "referenceNumber": 468,
-      "name": "BSD 2-Clause with views sentence",
-      "licenseId": "BSD-2-Clause-Views",
+      "isOsiApproved": false,
+      "licenseId": "Zimbra-1.4",
+      "name": "Zimbra Public License v1.4",
+      "reference": "https://spdx.org/licenses/Zimbra-1.4.html",
+      "referenceNumber": 304,
       "seeAlso": [
-        "http://www.freebsd.org/copyright/freebsd-license.html",
-        "https://people.freebsd.org/~ivoras/wine/patch-wine-nvidia.sh",
-        "https://github.com/protegeproject/protege/blob/master/license.txt"
-      ],
-      "isOsiApproved": false
+        "http://www.zimbra.com/legal/zimbra-public-license-1-4"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Artistic-1.0-Perl.html",
+      "detailsUrl": "https://spdx.org/licenses/Zlib.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Artistic-1.0-Perl.json",
-      "referenceNumber": 469,
-      "name": "Artistic License 1.0 (Perl)",
-      "licenseId": "Artistic-1.0-Perl",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "Zlib",
+      "name": "zlib License",
+      "reference": "https://spdx.org/licenses/Zlib.html",
+      "referenceNumber": 209,
       "seeAlso": [
-        "http://dev.perl.org/licenses/artistic.html"
-      ],
-      "isOsiApproved": true
+        "http://www.zlib.net/zlib_license.html",
+        "https://opensource.org/licenses/Zlib"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/NPOSL-3.0.html",
+      "detailsUrl": "https://spdx.org/licenses/zlib-acknowledgement.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/NPOSL-3.0.json",
-      "referenceNumber": 470,
-      "name": "Non-Profit Open Software License 3.0",
-      "licenseId": "NPOSL-3.0",
+      "isOsiApproved": false,
+      "licenseId": "zlib-acknowledgement",
+      "name": "zlib/libpng License with Acknowledgement",
+      "reference": "https://spdx.org/licenses/zlib-acknowledgement.html",
+      "referenceNumber": 348,
       "seeAlso": [
-        "https://opensource.org/licenses/NOSL3.0"
-      ],
-      "isOsiApproved": true
+        "https://fedoraproject.org/wiki/Licensing/ZlibWithAcknowledgement"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/gSOAP-1.3b.html",
+      "detailsUrl": "https://spdx.org/licenses/ZPL-1.1.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/gSOAP-1.3b.json",
-      "referenceNumber": 471,
-      "name": "gSOAP Public License v1.3b",
-      "licenseId": "gSOAP-1.3b",
+      "isOsiApproved": false,
+      "licenseId": "ZPL-1.1",
+      "name": "Zope Public License 1.1",
+      "reference": "https://spdx.org/licenses/ZPL-1.1.html",
+      "referenceNumber": 545,
       "seeAlso": [
-        "http://www.cs.fsu.edu/~engelen/license.html"
-      ],
-      "isOsiApproved": false
+        "http://old.zope.org/Resources/License/ZPL-1.1"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/Interbase-1.0.html",
+      "detailsUrl": "https://spdx.org/licenses/ZPL-2.0.json",
       "isDeprecatedLicenseId": false,
-      "detailsUrl": "https://spdx.org/licenses/Interbase-1.0.json",
-      "referenceNumber": 472,
-      "name": "Interbase Public License v1.0",
-      "licenseId": "Interbase-1.0",
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "ZPL-2.0",
+      "name": "Zope Public License 2.0",
+      "reference": "https://spdx.org/licenses/ZPL-2.0.html",
+      "referenceNumber": 51,
       "seeAlso": [
-        "https://web.archive.org/web/20060319014854/http://info.borland.co=
m/devsupport/interbase/opensource/IPL.html"
-      ],
-      "isOsiApproved": false
+        "http://old.zope.org/Resources/License/ZPL-2.0",
+        "https://opensource.org/licenses/ZPL-2.0"
+      ]
     },
     {
-      "reference": "https://spdx.org/licenses/StandardML-NJ.html",
-      "isDeprecatedLicenseId": true,
-      "detailsUrl": "https://spdx.org/licenses/StandardML-NJ.json",
-      "referenceNumber": 473,
-      "name": "Standard ML of New Jersey License",
-      "licenseId": "StandardML-NJ",
+      "detailsUrl": "https://spdx.org/licenses/ZPL-2.1.json",
+      "isDeprecatedLicenseId": false,
+      "isFsfLibre": true,
+      "isOsiApproved": true,
+      "licenseId": "ZPL-2.1",
+      "name": "Zope Public License 2.1",
+      "reference": "https://spdx.org/licenses/ZPL-2.1.html",
+      "referenceNumber": 352,
       "seeAlso": [
-        "http://www.smlnj.org//license.html"
-      ],
-      "isOsiApproved": false
+        "http://old.zope.org/Resources/ZPL/"
+      ]
     }
   ],
-  "releaseDate": "2021-08-08"
+  "releaseDate": "2024-05-22"
 }
\ No newline at end of file
--=20
2.45.2


