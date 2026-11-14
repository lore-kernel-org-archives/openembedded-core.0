Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3560.1794686909638429738
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 12:08:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Rj4N8ole;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb2893531bso1846920a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 12:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794686909; x=1795291709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j4p7HLFLGTvhrklwYyA8frIvtH/WgdFZBI0XP9rj75w=;
        b=Rj4N8olegEvtahiEmQ+JHe4LJ8GL2LiM0PJsVlnHLvg9xXAJ7BWJsyQaO0c9ewd9Xj
         vDeImjnAh6k51mwKfMTkjzPNJu7LUo8oJTN/wlwihuTLwqPenDHD8H8oGlffHAdTcGfK
         SXlzd/3gNXutz/GYwtGWr9E3mylYPtEKKg+PWskqp0kNDM6TF90+Qm5voj0Yt3FmMXw6
         1P5CKe7CmpQSLpNS3SzZr+h8mJbeXNPy1hLrh5cio1iywpyf+FbVcyIbFDPft/FTjB2L
         cBygmsSp3441d89hf+VSWA8i00v31++IWLbsFtKVp77f3Lu7EGDtO+ih2t5wbDi9hQFh
         u9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686909; x=1795291709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4p7HLFLGTvhrklwYyA8frIvtH/WgdFZBI0XP9rj75w=;
        b=2SA7puR5Z8FlJuT0l5e3fnpJdaF0kzU8s0pp92W+Wk1m5HEaHjUhJE0nDnhsLlfgE+
         o/nz99BaL0rea1uK5SPjUum53V5Y03Pb7g3SjCqvbIiFLQLjQuxISeA7PwVP4W3uWreT
         1AvfKDv8eeyfPhHStF7ey8JGA91juikNzctmPk4ZGewlB/7kVh5qtU0g60WDdFGqarQr
         U1f0Kdie06eTRUwypmB65Ogq5bcY9697LBJ6fj8PFMf4i0m0y0ertZdzrmsPUIq5d4e3
         AA41e81NFs9t5O2ENchUMhGxpQ6Sy741UW1LZJ5W/PAEWIOAP1ow9dLkpkR5eOWWxZSU
         CCXg==
X-Gm-Message-State: APuU4Z+Ao+YjruCmNu3pYcd2TnEEmKDuCv2jWGWqqYDJ/nql6abVQUkd
	fTsE56zOOFiq5d+OtIgGkKvqL1W92xeX8DYPd4rut9+Y16T7dsIFF+++n7AQPg==
X-Gm-Gg: AYBFou3H5JYJvaaEEvx0Rv85yhuS7krCM31o0JY1czZ8Jt1RMsWNuiepjT9BavYA7Qx
	9sM6SBYWJSrl7CwZR9YuzS716iSqmPvY0rs8qdixRKWBBRwsf/oR7GoOo9hV8vzMB3gLxbB1Ggu
	1Av+zXJFFwZWENCpuVNTDt0nKFg03dpnHa+PIy4sUcPsUxs/gxczyCD6wD7uWOE8xCswuvwd+Up
	JQVuIuzfwBRnbFymfHxCQXWchoe+3kkz1MPKk0ANwFG5/uFvetqsp4P3DT4OogEkxKExqbNhVnO
	oRoOaB58+wo1/v8Wek3py6+v8BTiNKgLrxjhe9vBI1rlbA7vzYIdQw7VjYdK3N5mHaD30O0yomi
	iWbr8nJMLRAEwUkvEDadFYBfM4s6T8h1QZ119cnbsk8zstWuRkA/oZ0GutZ3k0Gl+aavRXyAu/z
	uJE3dErb0jMD2InEjko2eIffCOUirOIGIkxEPbyu3JV26YemcMrTaOdSa8+5H7/qHQMnyVhFwRA
	0EReHBY/+w0kGExxU3GOLH+6j7rAnpBmeUg1iMn2LM1ErsiPBkZq4AVo4qELIcpkzzGpTbQE0l8
	pV9qBaFNdR8i49JeLalRRr+E9ZpNzURuHslfUQyOY/O/sAXqm3t9HzskGLI35A==
X-Received: by 2002:a17:90b:17ca:b0:39e:6c68:c77a with SMTP id 98e67ed59e1d1-3b1b0cda0cemr6398684a91.48.1794686908841;
        Sat, 14 Nov 2026 12:08:28 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from localhost.localdomain ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197b76ccesm14965358a91.0.2026.11.14.12.08.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 12:08:28 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 0/3] Fix distro_check when a distro list cannot be fetched
Date: Sat, 14 Nov 2026 12:08:07 -0800
Message-ID: <20261114200810.31078-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 20:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250208
Content-Type: text/plain; charset="utf-8"

create_distro_packages_list() in meta/lib/oe/distro_check.py writes no
package lists at all at the moment: the Debian list always fails, and
any failed distro then crashes the loop with UnboundLocalError.

1: Skip a distro whose package list can't be fetched.
2: ftp.debian.org no longer has dists/stable-proposed-updates. Read
   Debian updates from stable-updates instead, which is only published
   as Sources.xz.
3: Offline oe-selftest tests (oelib.distro_check) for both.

Nothing in OE-Core has used oe.distro_check since distrodata.bbclass
was removed in 2018, but the Recipe Reporting System on the layer
index still does (rrs_distros.py), to show which distros package each
recipe, and it has been broken by this.

[YOCTO #16503]

Tim Orling (3):
  lib/oe/distro_check: skip a distro whose package list can't be fetched
  lib/oe/distro_check: fetch Debian updates from stable-updates
  oeqa/selftest/oelib: add tests for oe.distro_check

 meta/lib/oe/distro_check.py                   |  9 ++-
 .../oeqa/selftest/cases/oelib/distro_check.py | 59 +++++++++++++++++++
 2 files changed, 65 insertions(+), 3 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/distro_check.py

-- 
2.56.1

