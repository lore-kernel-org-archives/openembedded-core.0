Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4618BC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 02:34:10 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.9904.1671590041740739787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 18:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jQ3jSALk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id m4so14178529pls.4
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IkzpvngEfvk4p97D6N8B8t9oPi9Jw7dNZoIoMcMDC34=;
        b=jQ3jSALkfHRVKUKhMXrw7L+sDhEVCLIr7lEkIlLpc2v88cz7XhzN6kIrNg2DN7jxLx
         eF5DCZxTVEuhcAYpLmNLe/AkBtnR/1LKwIelcrKzAksj257kgWYqY+MDteq03wYjCoJv
         sBCiGcEeaMRTL8y0R5vSaKP+vAtDvYl0PFt2ZTmA/QZh+6+S2bO3R9eBF22WH0Xeu8wI
         DPV7aL+pmoYXcCB9zcU33Ry771GhBGJa/X96l8MLHXZ1qODnBhv4ZZH8cPaQ1JBq3MOp
         68zOmaWZrjmerGYF3Bz8AEpefgbBdQtcLLfpIif4jK2Dg66rcmzjDmuqQD26Wu2Ys66y
         NJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkzpvngEfvk4p97D6N8B8t9oPi9Jw7dNZoIoMcMDC34=;
        b=P5B015SG5DInWo1hi7LofVw/vQqeyVsd5H3kp/s9rBOJRyvB7do4I+1tVLzES7nxQQ
         t1urMK5x9Y625bDdPaLfx7zLj5jdPYQ2X2Mml5cASmshV/OLeCdS1uQ644U40kr+vKm9
         GfJYoNPgo3r9OB4fa06i4HeDvieARNrNP/J4gDcqnfc2vIdcJvtVgyTx3GPIc76r51zk
         epxXGxPFC1LDXqSMqKCHup+QwUTG/wfcxEmsA7ZzqsFUZamKc0ZxEDBFZCtm0zyPyHSz
         5EJDfa5sbwDMDpWLU2zSWZ1YD/5r9dmTL6b/4yGVzJTUmo/gtSjuAHr6VESJeN5mlz+6
         X89w==
X-Gm-Message-State: AFqh2kqMXwwMS+i6derQQOjkZiECTLpb+xUhgEpfyMU95qi9QxY4zhus
	mi+zrxowmKq1J9XqM/4S7BH+TTk5V/PaeS+Qblk=
X-Google-Smtp-Source: AMrXdXuV8GCduB47h5BQg4vmYywWu35UkB2Y3QaFV9Py+qtDnROamS1mzx+bKAsGwprxl3lkKpLY7w==
X-Received: by 2002:a17:902:6907:b0:188:4bba:9d29 with SMTP id j7-20020a170902690700b001884bba9d29mr362137plk.15.1671590040603;
        Tue, 20 Dec 2022 18:34:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001894dc5fdf2sm10020287pls.296.2022.12.20.18.33.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 18:34:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/19] Pull request (cover letter only)
Date: Tue, 20 Dec 2022 16:33:55 -1000
Message-Id: <cover.1671589987.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 02:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174888

The following changes since commit 45a8b4101b14453aa3020d3f2b8a76b4dc0ae3f2:

  build-appliance-image: Update to kirkstone head revision (2022-12-13 15:59:33 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alex Stewart (1):
  lsof: add update-alternatives logic

Carlos Alberto Lopez Perez (1):
  xwayland: libxshmfence is needed when dri3 is enabled

Chen Qi (2):
  bc: extend to nativesdk
  rm_work: adjust dependency to make do_rm_work_all depend on do_rm_work

Florin Diaconescu (1):
  python3: upgrade 3.10.8 -> 3.10.9

Hitendra Prajapati (2):
  golang: CVE-2022-41715 regexp/syntax: limit memory used by parsing
    regexps
  libxml2: Fix CVE-2022-40303 && CVE-2022-40304

Marta Rybczynska (1):
  efibootmgr: update compilation with musl

Mathieu Dubois-Briand (1):
  dbus: Add missing CVE product name

Peter Marko (2):
  externalsrc: fix lookup for .gitmodules
  oeqa/selftest/externalsrc: add test for srctree_hash_files

Richard Purdie (1):
  yocto-check-layer: Allow OE-Core to be tested

Ross Burton (4):
  lib/buildstats: fix parsing of trees with reduced_proc_pressure
    directories
  combo-layer: remove unused import
  combo-layer: dont use bb.utils.rename
  combo-layer: add sync-revs command

Wang Mingyu (3):
  bind: upgrade 9.18.8 -> 9.18.9
  mpfr: upgrade 4.1.0 -> 4.1.1
  libxcrypt-compat: upgrade 4.4.30 -> 4.4.33

 meta/classes/externalsrc.bbclass              |   2 +-
 meta/classes/rm_work.bbclass                  |   2 +-
 meta/lib/oeqa/selftest/cases/externalsrc.py   |  44 ++
 meta/recipes-bsp/efibootmgr/efibootmgr_17.bb  |   2 -
 ...1-avoid-start-failure-with-bind-user.patch |   0
 ...d-V-and-start-log-hide-build-options.patch |   0
 ...ching-for-json-headers-searches-sysr.patch |   0
 .../bind/{bind-9.18.8 => bind-9.18.9}/bind9   |   0
 .../{bind-9.18.8 => bind-9.18.9}/conf.patch   |   0
 .../generate-rndc-key.sh                      |   0
 ...t.d-add-support-for-read-only-rootfs.patch |   0
 .../make-etc-initd-bind-stop-work.patch       |   0
 .../named.service                             |   0
 .../bind/{bind_9.18.8.bb => bind_9.18.9.bb}   |   2 +-
 meta/recipes-core/dbus/dbus_1.14.4.bb         |   2 +
 ...t_4.4.30.bb => libxcrypt-compat_4.4.33.bb} |   0
 meta/recipes-core/libxcrypt/libxcrypt.inc     |   2 +-
 .../libxml/libxml2/CVE-2022-40303.patch       | 624 ++++++++++++++++++
 .../libxml/libxml2/CVE-2022-40304.patch       | 106 +++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   2 +
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2022-41715.patch           | 270 ++++++++
 .../python/python3/CVE-2022-42919.patch       |  70 --
 .../python/python3/cve-2022-37454.patch       | 108 ---
 .../{python3_3.10.8.bb => python3_3.10.9.bb}  |   3 +-
 meta/recipes-extended/bc/bc_1.07.1.bb         |   2 +-
 meta/recipes-extended/lsof/lsof_4.94.0.bb     |   9 +
 .../xwayland/xwayland_22.1.5.bb               |   2 +-
 .../mpfr/{mpfr_4.1.0.bb => mpfr_4.1.1.bb}     |   2 +-
 scripts/combo-layer                           |  30 +-
 scripts/lib/buildstats.py                     |   4 +-
 scripts/lib/checklayer/__init__.py            |  11 +-
 scripts/lib/checklayer/cases/bsp.py           |   2 +-
 scripts/lib/checklayer/cases/common.py        |   3 +
 scripts/lib/checklayer/cases/distro.py        |   2 +-
 scripts/yocto-check-layer                     |   5 +-
 36 files changed, 1107 insertions(+), 205 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/externalsrc.py
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.8 => bind-9.18.9}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.8.bb => bind_9.18.9.bb} (97%)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.30.bb => libxcrypt-compat_4.4.33.bb} (100%)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-40303.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-40304.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41715.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2022-42919.patch
 delete mode 100644 meta/recipes-devtools/python/python3/cve-2022-37454.patch
 rename meta/recipes-devtools/python/{python3_3.10.8.bb => python3_3.10.9.bb} (99%)
 rename meta/recipes-support/mpfr/{mpfr_4.1.0.bb => mpfr_4.1.1.bb} (91%)

-- 
2.25.1


