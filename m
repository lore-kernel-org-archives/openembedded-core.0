Return-Path: <patrick.vogelaar.dev@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD01FD3776
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 17:12:14 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50519.1772039528283998030
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 09:12:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=F8d0mJCq;
 spf=pass (domain: mailbox.org, ip: 80.241.56.152, mailfrom: patrick.vogelaar.dev@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fLh380d5Cz9vXD;
	Wed, 25 Feb 2026 18:12:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772039524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k9bBxp9LukPQ0Hfg5hLIplfat4Or9gwzMFshlxmqqyY=;
	b=F8d0mJCqPoGGoVvo4ZjI+caYKuWgOlIdlWUlAXKwNN14Ky0tJ8u/X7YiEIeZ5f5fdCnbRb
	RYKeroVVNEzV0Jk7fr868XTjaC+a+/e5h/KfjTqseLTn0nU1su+ibZ8oWgKx/uIxHX5t7D
	8N+fpWzWjrdeOJEfNbSWh5D+9LDfndUAEQOxriLpz1i09zzfKtGG0KqmMG5c79cMJmqACs
	PwReM7fKV2HwIIWg5fcyN428Y7AiyG2uVGoxjvEdvaEajyVD6jlZyLjM7OE+GZk5QA8Acu
	PlChhXPePOv734FD7lhnCH5kF08+UFYODUgNYuk0m82O4Ad0scFT7Qm5GXn7XA==
Date: Wed, 25 Feb 2026 18:12:02 +0100 (CET)
From: patrick.vogelaar.dev@mailbox.org
To: yoann.congal@smile.fr, "Yoann Congal via lists.openembedded.org"
 <yoann.congal=smile.fr@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Message-ID: <362912505.617728.1772039522960@app.mailbox.org>
In-Reply-To: <1977023397.617077.1772038793631@app.mailbox.org>
References: <cover.1771943404.git.yoann.congal@smile.fr>
 <1977023397.617077.1772038793631@app.mailbox.org>
Subject: Re: [OE-core][scarthgap 00/44] Patch review
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-MBO-RS-ID: f2f0401908557047690
X-MBO-RS-META: 9rs1sinunbokbwxd87ub6rhqmxipqn66
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 17:12:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231969

Hi,

I am a bit unsure about the openssl patches. I am not questioning them technically but if it is the right way to patch openssl 3.2 since it is EOL [1].

Wouldn't it be better, as suggested in [1], to upgrade to either version 3.6.x (EOL 1st November 2026) or version 3.5.x (EOL April 2030 -> LTS).

If you agree with that, I would prepare a patch. Just let me know hte preffered version, since I am a bit unsure how this is usually handled on a LTS version.  

[1] https://openssl-library.org/post/2025-11-25-eol-32/

Best Regards
Patrick

> patrick.vogelaar@mailbox.org hat am 25.02.2026 17:59 CET geschrieben:
> 
>  
> Hi,
> 
> I am a bit unsure about the openssl patches. I am not questioning them technically but if it is the right way to patch openssl 3.2 since it is EOL [1].
> 
> Wouldn't it be better, as suggested in [1], to upgrade to either version 3.6.x (EOL 1st November 2026) or version 3.5.x (EOL April 2030 -> LTS).
> 
> If you agree with that, I would prepare a patch. Just let me know hte preffered version, since I am a bit unsure how this is usually handled on a LTS version.  
> 
> [1] https://openssl-library.org/post/2025-11-25-eol-32/
> 
> Best Regards
> Patrick
> 
> 
> > Yoann Congal via lists.openembedded.org <yoann.congal=smile.fr@lists.openembedded.org> hat am 24.02.2026 15:31 CET geschrieben:
> > 
> >  
> > Please review this set of changes for scarthgap and have comments back by
> > end of day Thursday, February 26.
> > 
> > Passed a-full on autobuilder:
> > https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3276
> > 
> > The following changes since commit a1f4ae4e569bc0e36c27c1e4651e502e54d63b28:
> > 
> >   build-appliance-image: Update to scarthgap head revision (2026-02-16 09:52:44 +0000)
> > 
> > are available in the Git repository at:
> > 
> >   https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
> >   https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut
> > 
> > for you to fetch changes up to 94a2960e1ae3923599affb6b227ef3f1870f5633:
> > 
> >   u-boot: move CVE patches out of the common .inc file (2026-02-24 10:34:08 +0100)
> > 
> > ----------------------------------------------------------------
> > 
> > Aleksandar Nikolic (1):
> >   scripts/install-buildtools: Update to 5.0.15
> > 
> > Amaury Couderc (2):
> >   avahi: patch CVE-2025-68468
> >   avahi: patch CVE-2025-68471
> > 
> > Ankur Tyagi (4):
> >   avahi: patch CVE-2025-68276
> >   avahi: patch CVE-2026-24401
> >   mobile-broadband-provider-info: upgrade 20240407 -> 20251101
> >   vim: ignore CVE-2025-66476
> > 
> > Benjamin Robin (Schneider Electric) (1):
> >   spdx30_tasks: Exclude 'doc' when exporting PACKAGECONFIG to SPDX
> > 
> > Bruce Ashfield (7):
> >   linux-yocto/6.6: update to v6.6.112
> >   linux-yocto/6.6: update to v6.6.114
> >   linux-yocto/6.6: update to v6.6.116
> >   linux-yocto/6.6: update to v6.6.118
> >   linux-yocto/6.6: update to v6.6.119
> >   linux-yocto/6.6: update to v6.6.120
> >   linux-yocto/6.6: update to v6.6.123
> > 
> > Daniel Dragomir (1):
> >   wic/engine: error on old host debugfs for standalone directory copy
> > 
> > Deepak Rathore (7):
> >   go 1.22.12: Fix CVE-2025-61730
> >   go 1.22.12: Fix CVE-2025-61726
> >   go 1.22.12: Fix CVE-2025-61728
> >   go 1.22.12: Fix CVE-2025-61731
> >   go 1.22.12: Fix CVE-2025-68119
> >   go 1.22.12: Fix CVE-2025-61732
> >   go 1.22.12: Fix CVE-2025-68121
> > 
> > Dragomir, Daniel (2):
> >   wic/engine: fix copying directories into wic image with ext* partition
> >   oeqa/selftest/wic: test recursive dir copy on ext partitions
> > 
> > Fabio Berton (1):
> >   classes/buildhistory: Do not sign buildhistory commits
> > 
> > Hitendra Prajapati (2):
> >   openssl: fix CVE-2025-15468
> >   openssl: fix CVE-2025-69419
> > 
> > Ming Liu (1):
> >   weston: fix a touch-calibrator issue
> > 
> > Peter Marko (10):
> >   libsndfile1: patch CVE-2025-56226
> >   libpng: patch CVE-2026-25646
> >   glib-2.0: patch CVE-2026-1484
> >   glib-2.0: patch CVE-2026-1485
> >   glib-2.0: patch CVE-2026-1489
> >   ffmpeg: ignore CVE-2025-1594
> >   libtheora: mark CVE-2024-56431 as not vulnerable yet
> >   ffmpeg: set status of CVE-2025-25468
> >   gnupg: patch CVE-2025-68973
> >   alsa-lib: patch CVE-2026-25068
> > 
> > Pratik Farkase (1):
> >   libevent: merge inherit statements
> > 
> > Richard Purdie (1):
> >   go-vendor: Fix absolute paths issue
> > 
> > Vijay Anusuri (1):
> >   bind: Upgrade 9.18.41 -> 9.18.44
> > 
> > Yoann Congal (2):
> >   pseudo: Update to include a fix for systems with kernel <5.6
> >   u-boot: move CVE patches out of the common .inc file
> > 
> >  meta/classes/buildhistory.bbclass             |   2 +-
> >  meta/classes/go-vendor.bbclass                |   6 +-
> >  meta/lib/oe/spdx30_tasks.py                   |   8 +-
> >  meta/lib/oeqa/selftest/cases/wic.py           |  65 ++
> >  meta/recipes-bsp/u-boot/u-boot-common.inc     |  12 +-
> >  meta/recipes-bsp/u-boot/u-boot_2024.01.bb     |  10 +
> >  meta/recipes-connectivity/avahi/avahi_0.8.bb  |   4 +
> >  .../avahi/files/CVE-2025-68276.patch          |  65 ++
> >  .../avahi/files/CVE-2025-68468.patch          |  32 +
> >  .../avahi/files/CVE-2025-68471.patch          |  36 +
> >  .../avahi/files/CVE-2026-24401.patch          |  74 ++
> >  .../bind/{bind_9.18.41.bb => bind_9.18.44.bb} |   2 +-
> >  .../mobile-broadband-provider-info_git.bb     |   4 +-
> >  .../openssl/openssl/CVE-2025-15468.patch      |  39 +
> >  .../openssl/openssl/CVE-2025-69419.patch      |  61 ++
> >  .../openssl/openssl_3.2.6.bb                  |   2 +
> >  .../glib-2.0/glib-2.0/CVE-2026-1484-01.patch  |  48 +
> >  .../glib-2.0/glib-2.0/CVE-2026-1484-02.patch  |  45 +
> >  .../glib-2.0/glib-2.0/CVE-2026-1485.patch     |  44 +
> >  .../glib-2.0/glib-2.0/CVE-2026-1489-01.patch  |  42 +
> >  .../glib-2.0/glib-2.0/CVE-2026-1489-02.patch  |  30 +
> >  .../glib-2.0/glib-2.0/CVE-2026-1489-03.patch  | 290 ++++++
> >  .../glib-2.0/glib-2.0/CVE-2026-1489-04.patch  |  68 ++
> >  meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   7 +
> >  meta/recipes-devtools/go/go-1.22.12.inc       |  10 +
> >  .../go/go/CVE-2025-61726.patch                | 196 +++++
> >  .../go/go/CVE-2025-61728.patch                | 171 ++++
> >  .../go/go/CVE-2025-61730.patch                | 460 ++++++++++
> >  .../go/go/CVE-2025-61731.patch                |  70 ++
> >  .../go/go/CVE-2025-61732.patch                |  53 ++
> >  .../go/go/CVE-2025-68119-dependent.patch      | 175 ++++
> >  .../go/go/CVE-2025-68119.patch                | 828 ++++++++++++++++++
> >  .../go/go/CVE-2025-68121_p1.patch             | 253 ++++++
> >  .../go/go/CVE-2025-68121_p2.patch             | 385 ++++++++
> >  .../go/go/CVE-2025-68121_p3.patch             |  82 ++
> >  meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
> >  ...ator-Regularise-surface-view-mapping.patch |  78 ++
> >  .../recipes-graphics/wayland/weston_13.0.1.bb |   1 +
> >  .../linux/linux-yocto-rt_6.6.bb               |   6 +-
> >  .../linux/linux-yocto-tiny_6.6.bb             |   6 +-
> >  meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  28 +-
> >  .../alsa/alsa-lib/CVE-2026-25068.patch        |  34 +
> >  .../alsa/alsa-lib_1.2.11.bb                   |   1 +
> >  .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |   3 +-
> >  .../libpng/files/CVE-2026-25646.patch         |  61 ++
> >  .../libpng/libpng_1.6.42.bb                   |   1 +
> >  .../libsndfile1/CVE-2025-56226-01.patch       |  36 +
> >  .../libsndfile1/CVE-2025-56226-02.patch       |  43 +
> >  .../libsndfile/libsndfile1_1.2.2.bb           |   2 +
> >  .../libtheora/libtheora_1.1.1.bb              |   2 +
> >  .../gnupg/gnupg/CVE-2025-68973.patch          | 108 +++
> >  meta/recipes-support/gnupg/gnupg_2.4.8.bb     |   1 +
> >  .../libevent/libevent_2.1.12.bb               |   4 +-
> >  meta/recipes-support/vim/vim_9.1.bb           |   2 +
> >  scripts/install-buildtools                    |   4 +-
> >  scripts/lib/wic/engine.py                     |  92 +-
> >  56 files changed, 4132 insertions(+), 62 deletions(-)
> >  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
> >  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
> >  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
> >  create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch
> >  rename meta/recipes-connectivity/bind/{bind_9.18.41.bb => bind_9.18.44.bb} (97%)
> >  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch
> >  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch
> >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-01.patch
> >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-02.patch
> >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1485.patch
> >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-01.patch
> >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-02.patch
> >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-03.patch
> >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-04.patch
> >  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61726.patch
> >  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61728.patch
> >  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61730.patch
> >  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61731.patch
> >  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61732.patch
> >  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-68119-dependent.patch
> >  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-68119.patch
> >  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-68121_p1.patch
> >  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-68121_p2.patch
> >  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-68121_p3.patch
> >  create mode 100644 meta/recipes-graphics/wayland/weston/0001-touch-calibrator-Regularise-surface-view-mapping.patch
> >  create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
> >  create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch
> >  create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-01.patch
> >  create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-02.patch
> >  create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch
> >

