Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.998.1794709171433653214
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 18:19:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZBrHnzCk;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ede7cb02daso23634005ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 18:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794709171; x=1795313971; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qSdIItRiE4QMJJE6bzAMUUZ9V8LLucPQuLWAU44EG4s=;
        b=ZBrHnzCkN4ZrxELWT9Lb/Px/pK1sHiunt4RFewiST5X/CLffjTgYJeZ3nqoh+a1P4+
         6RS5ptQlB/tPKITD9L9taZPm7xHwGqSSvCVNp7kqSxbk619YYyIx+yCvxzOAwQC4npN8
         of3UUe+vADM7wLMaYp3ig9kogpfCim78t0ma/fLECN5U6GQtIir92XSc0Ld2q3swsVqn
         HuYFPDp+2gwDTkWSZAopcbnRe78Dz0K1EM6060oGI5X/ZVtjZv/dBLH4Cz3ujF5BDxo0
         StCe36cxXPXS/Qp3zB7OK06tflwg08EgKgbeU0ARasiSSHVJuFiKeJ19VlMSrPmLSPlR
         ZQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709171; x=1795313971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qSdIItRiE4QMJJE6bzAMUUZ9V8LLucPQuLWAU44EG4s=;
        b=JJ382yPLVMggbfEPUKLaCp5lv5SoO3QzDG+R+Ri9GbPu0QsA1Val8F/EBVcHwAGEtK
         a4kmKgl1M+lvTB8Td56nLNG2jzRn9/u0/xkQwphydoj7fDEYo7hS/8R7aAbBmugvTihU
         PQsWu2Znb46CnFpT7BRmb8nQoIJ9IMvSFch0txSYLvKsiUlti0Bwi7E8gpCIQVuO6vay
         in29+/MlJ8BDSKmVgOYD8XhB4kutpAc6hur71tN0Afd/bd3wvI2/23I954ZS37uJESrf
         3CSKDL23Q8LwjMSti9thnx0vxJOOhipX3mcD8Y6v6EwWkkDh8J7xO3CXgeEqSVt8cuqP
         kV4A==
X-Gm-Message-State: APuU4Z8mpG9YvL6b4EL32fhb52PfatuBFRuAKtGbFyy9hdVdpKMEuwx2
	yLy1yW2QLDerbcZxGUm0InHVrs8fxt1k6GGz0wdBnRI7NrHjOfG/7r2dNz52Ag==
X-Gm-Gg: AYBFou2LCwZqWAWCED3sNeiS8UEJ5iQNBewziJrVygb76ePjtWAhQpz3sOovMv8gkE3
	DixTsmUEqpB4HJxfbB1oyKcsRprJTjbwV5BYPUS91YOyUDOX5ZW2qJITZ8X2TkaSR00cffZIFHA
	wTSHXfZFLi0b1f9IK+AjrKELXfetn3esrMwidnccEsq0bj7XNQsXtSVT8aSRzRnUgV+GqEOCG7L
	QYZJUcYG9np+6d4f4GNBr1r7i8GgeFdvE6NucIJWe1rwwIi090rDU2XTmRAUBq7AHPPlbqt/AQY
	vofkv7pkQOX5E2Aigic1L6MKlcCVPGAoZh8KJRG8cBs3ugWTLcVflBMlIFpdiB29N//quQ2sJ5I
	QS/b9W181BJWeo9URcVE0pPUhivdpTYrhbW4pPnlKntXhz+/HoTPNFlEORQEdd7a9ofoZwHcrEI
	HtpyYwUBwrM9etxUW/cVN8hqD4KELAUwriD1h5V+Ev2/Xz2JjOpy022No01ZV3+SzWE/aHcvn6c
	a8rl+Rf/Cs2nQx45RWwZcI4Ay7kd9lSWvSJKQAOt8Yoqnl3RZUFlccMT86ssr0bJsQUUNHGWdsk
	9/o0zNb1W+Q6ziUCdeFba/AVxTvd1K6MH6hEaBx2io8T33lAu5lIuMM8knga2A==
X-Received: by 2002:a17:90a:e7c1:b0:3b0:9409:6969 with SMTP id 98e67ed59e1d1-3b1b0b94eaemr4820257a91.19.1794709170615;
        Sat, 14 Nov 2026 18:19:30 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm15651545a91.1.2026.11.14.18.19.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 18:19:28 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 0/3] distro_check: fix the Ubuntu and openSUSE package lists, drop Clear
Date: Sat, 14 Nov 2026 18:19:11 -0800
Message-ID: <20261115021914.67744-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 02:19:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250217
Content-Type: text/plain; charset="utf-8"

With the fixes for bug 16503, create_distro_packages_list() still got the
wrong Ubuntu release and no openSUSE or Clear lists:

  NOTE: Distro: Ubuntu, Latest Release: xenial, # src packages: 3456
  WARNING: Cannot fetch packages for openSUSE: HTTP Error 404: Not Found
  WARNING: Cannot fetch packages for Clear: <urlopen error [Errno -3] Temporary failure in name resolution>

1: Bug 16509: the Ubuntu archive ignores the "newest first" sort that
   find_latest_ubuntu_release() relied on, so it always took xenial.
   Use the release list that do-release-upgrade reads instead.
2: Bug 16510: download.opensuse.org's listings now link to "./15.6/",
   still include Leap 42.x, and keep the source RPMs under repo/oss/src/;
   Leap 16 has no update repository.
3: Bug 16511: Clear Linux has been discontinued.

With these, all four lists are fetched:

  NOTE: Distro: Debian, Latest Release: 13.7, # src packages: 37593
  NOTE: Distro: Ubuntu, Latest Release: resolute, # src packages: 3053
  NOTE: Distro: Fedora, Latest Release: 45, # src packages: 23237
  NOTE: Distro: openSUSE, Latest Release: 16.1, # src packages: 10638

The new cases are covered by oe-selftest's oelib.distro_check, run with
plain unittest (not oe-selftest).

This applies on top of "Fix distro_check when a distro list cannot be
fetched" (bug 16503):
https://lore.kernel.org/all/20261114200810.31078-1-tim.orling@konsulko.com/

Tim Orling (3):
  lib/oe/distro_check: find the latest Ubuntu release from meta-release
  lib/oe/distro_check: fix the openSUSE Leap package lists
  lib/oe/distro_check: drop Clear Linux

 meta/lib/oe/distro_check.py                   | 62 ++++++++++++-------
 .../oeqa/selftest/cases/oelib/distro_check.py | 49 ++++++++++++++-
 2 files changed, 87 insertions(+), 24 deletions(-)

-- 
2.56.1

