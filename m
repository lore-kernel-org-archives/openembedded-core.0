Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F9DC433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 23:57:32 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.787.1651622248824090006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 16:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4E00GjOc;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.52,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f52.google.com with SMTP id a1so398edt.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 16:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UzlbrL6u5eFbcoKjFRb+puQyjEgV2wRZtBNcEPXQzko=;
        b=4E00GjOcj/zydBScc5XnjRIZmaTzE8wOFuyp74QslST8cN0Fu75jo2MARkep9sR/wg
         cVs3ARVKkGyC3yROaYTKhxnw/J+XOOL5M97SaLrMd4KAtpaGkWNNUgTUGxdkCLO4Qo1G
         mLRTpCXWGbhi/mNKgZFfUQD13B517c1bQKQ0eYFJr6XJlYDk5kchjMrK5JN95OfNoFh2
         fpvFveECr8/XiiyXLTgif1kXnnNzzRW9htqZ+ldjuqoDdXOs5aan0+sl2rS5VRWstIw/
         LkcDfR1yXMe9uFaCw9l2DQayACwPQmjmLKrdNou15o08cNvsgGRr00JSmtFE113kzCuf
         fvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UzlbrL6u5eFbcoKjFRb+puQyjEgV2wRZtBNcEPXQzko=;
        b=Z/GEI08YLW40qlPIQ05tOTR1hYh6j69f5P4kMn1w7fgk9bSbF1bL5Ldi6nfjJ4Vmz4
         vyG5IFRry4iBcKasmuPgpZTCh1LhyBrIHsQUVY4uVzyLmrl6v3SfzvYKWeULGLNPzfD2
         ZaFiGb/ZqnBPCs4MHhA/TLXWq0nKxR2gmcG2PjZQORwp/E0iRMRzEF3jiLsdq7VicV36
         uhNRdZJtB0Qb8UJ7AZDxnuIgY0xlavp9P7Mo+wK0eBYi3FDF0OkEUrIlou1j8wXQbXs4
         zaDRnAW5uFItI5vV7tfKkQCJZzIXnXNwDeHpjwXTUeqIKtbfaKUWM/29r8UhgU3BMOvy
         EzmQ==
X-Gm-Message-State: AOAM531+i00DuV0T5sfk10iVZeOSmb4bnaNy6bYdhTj+bRDp8VOoMTK3
	J1sylg5nVc4uEroyZxT0haAizJfDphpjL89nqi0V4Q==
X-Google-Smtp-Source: 
 ABdhPJzAwZy0Aj1txpVNDL3ELk/Aln3tpzGMXIg1kaG1S9lHKXF8JmMGiyNOuUVgBL/zXIACA85AvIqarLDV4TtnkRg=
X-Received: by 2002:a05:6402:2945:b0:41d:aad:c824 with SMTP id
 ed5-20020a056402294500b0041d0aadc824mr20583904edb.364.1651622247021; Tue, 03
 May 2022 16:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651617090.git.steve@sakoman.com>
 <e3891bfd-95ec-15d5-0b11-36966cd3eaa7@gmail.com>
In-Reply-To: <e3891bfd-95ec-15d5-0b11-36966cd3eaa7@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 3 May 2022 13:57:15 -1000
Message-ID: 
 <CAOSpxdYmHbwwUKJ0ED2uqqpomoVOT0wn39DzHZtYO7rSwBQoCg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 00/34] Pull request (cover letter only)
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 May 2022 23:57:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165209

On Tue, May 3, 2022 at 1:44 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> can you pick
>
>
> https://git.openembedded.org/openembedded-core/commit/?id=20e9917b8d40f576b3661bc29e13602a24e86b7b

Yes, I've already got that in my patch set currently under test:

https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Steve

> On 5/3/22 15:33, Steve Sakoman wrote:
> > The following changes since commit ca1c990df62f1b3d53b2114a387f192efe7e38e8:
> >
> >    ruby: upgrade 3.1.1 -> 3.1.2 (2022-04-28 17:07:01 +0100)
> >
> > are available in the Git repository at:
> >
> >    git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
> >    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next
> >
> > Alexander Kanavin (2):
> >    glib: upgrade 2.72.0 -> 2.72.1
> >    libxml2: update patch status
> >
> > Carlos Rafael Giani (2):
> >    gstreamer1.0-plugins-good: Fix libsoup dependency
> >    gstreamer1.0: Minor documentation addition
> >
> > Chen Qi (2):
> >    cases/buildepoxy.py: fix typo
> >    go.bbclass: disable the use of the default configuration file
> >
> > Davide Gardenal (1):
> >    create-spdx: delete virtual/kernel dependency to fix FreeRTOS build
> >
> > Dmitry Baryshkov (2):
> >    linux-firmware: correct license for ar3k firmware
> >    arch-armv8-2a.inc: fix a typo in TUNEVALID variable
> >
> > Henning Schild (1):
> >    wic: do not use PARTLABEL for msdos partition tables
> >
> > Khem Raj (7):
> >    seatd: Disable overflow warning as error on ppc64/musl
> >    musl: Fix build when usrmerge distro feature is enabled
> >    gcompat: Fix build when usrmerge distro feature is enabled
> >    libc-glibc: Use libxcrypt to provide virtual/crypt
> >    qemu.bbclass: Extend ppc/ppc64 extra options
> >    busybox: Use base_bindir instead of hardcoding /bin path
> >    util-linux: Create u-a symlink for findfs utility
> >
> > Naveen Saini (1):
> >    gstreamer1.0-plugins-bad: drop patch
> >
> > Nicolas Dechesne (1):
> >    sanity: skip make 4.2.1 warning for debian
> >
> > Paul Gortmaker (1):
> >    install/devshell: Introduce git intercept script due to fakeroot
> >      issues
> >
> > Peter Kjellerstedt (2):
> >    terminal.py: Restore error output from Terminal
> >    devshell.bbclass: Allow devshell & pydevshell to use the network
> >
> > Pgowda (1):
> >    glibc: ptest: Fix glibc-tests package issue
> >
> > Rahul Kumar (1):
> >    neard: Switch SRC_URI to git repo
> >
> > Richard Purdie (2):
> >    base: Drop git intercept
> >    staging: Ensure we filter out ourselves
> >
> > Ross Burton (5):
> >    e2fsprogs: fix CVE-2022-1304
> >    python3: ignore CVE-2015-20107
> >    cve_check: skip remote patches that haven't been fetched when
> >      searching for CVE tags
> >    subversion: upgrade to 1.14.2
> >    bitbake.conf: mark all directories as safe for git to read
> >
> > Russ Dill (2):
> >    package.bbclass: Prevent perform_packagecopy from removing
> >      /sysroot-only
> >    kernel-yocto.bbclass: Fixup do_kernel_configcheck usage of KMETA
> >
> > wangmy (1):
> >    apt: upgrade 2.4.4 -> 2.4.5
> >
> >   meta/classes/create-spdx.bbclass              |  2 -
> >   meta/classes/devshell.bbclass                 |  4 ++
> >   meta/classes/go.bbclass                       |  1 +
> >   meta/classes/kernel-yocto.bbclass             | 14 ++--
> >   meta/classes/package.bbclass                  |  8 +--
> >   meta/classes/qemu.bbclass                     |  6 +-
> >   meta/classes/sanity.bbclass                   |  2 +-
> >   meta/classes/staging.bbclass                  |  2 +-
> >   meta/conf/bitbake.conf                        |  8 +++
> >   meta/conf/distro/include/tclibc-glibc.inc     |  1 +
> >   .../machine/include/arm/arch-armv8-2a.inc     |  2 +-
> >   meta/lib/oe/cve_check.py                      |  5 +-
> >   meta/lib/oe/terminal.py                       |  3 +-
> >   meta/lib/oeqa/sdk/cases/buildepoxy.py         |  2 +-
> >   meta/recipes-connectivity/neard/neard_0.16.bb | 13 ++--
> >   meta/recipes-core/busybox/busybox.inc         |  2 +-
> >   ...s-for-typechecking-with-atomic-compa.patch | 64 -----------------
> >   ...variant-of-g_atomic_int_compare_and_.patch | 70 ------------------
> >   ...ble-more-tests-while-cross-compiling.patch | 32 ++++-----
> >   .../glib-2.0/glib-2.0/relocate-modules.patch  |  8 +--
> >   ...{glib-2.0_2.72.0.bb => glib-2.0_2.72.1.bb} |  4 +-
> >   meta/recipes-core/glibc/glibc-tests_2.35.bb   |  3 +-
> >   .../recipes-core/libxml/libxml2/runtest.patch |  4 +-
> >   meta/recipes-core/musl/gcompat_git.bb         |  8 +--
> >   meta/recipes-core/musl/musl_git.bb            |  6 +-
> >   meta/recipes-core/seatd/seatd_0.6.4.bb        |  3 +
> >   .../util-linux/util-linux_2.37.4.bb           |  1 +
> >   .../apt/{apt_2.4.4.bb => apt_2.4.5.bb}        |  2 +-
> >   .../e2fsprogs/e2fsprogs/extents.patch         | 56 +++++++++++++++
> >   .../e2fsprogs/e2fsprogs_1.46.5.bb             |  1 +
> >   .../recipes-devtools/python/python3_3.10.4.bb |  3 +
> >   .../subversion/subversion/disable_macos.patch | 71 -------------------
> >   ...version_1.14.1.bb => subversion_1.14.2.bb} |  3 +-
> >   .../linux-firmware/linux-firmware_20220411.bb |  4 +-
> >   .../0005-msdk-fix-includedir-path.patch       | 40 -----------
> >   .../gstreamer1.0-plugins-bad_1.20.1.bb        |  3 +-
> >   .../gstreamer1.0-plugins-base_1.20.1.bb       |  2 +
> >   .../gstreamer1.0-plugins-good_1.20.1.bb       |  7 +-
> >   scripts/git-intercept/git                     | 19 +++++
> >   scripts/lib/wic/plugins/imager/direct.py      |  2 +-
> >   40 files changed, 174 insertions(+), 317 deletions(-)
> >   delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-tests-Add-C-tests-for-typechecking-with-atomic-compa.patch
> >   delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0002-gatomic-Add-a-C-variant-of-g_atomic_int_compare_and_.patch
> >   rename meta/recipes-core/glib-2.0/{glib-2.0_2.72.0.bb => glib-2.0_2.72.1.bb} (90%)
> >   rename meta/recipes-devtools/apt/{apt_2.4.4.bb => apt_2.4.5.bb} (97%)
> >   create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch
> >   delete mode 100644 meta/recipes-devtools/subversion/subversion/disable_macos.patch
> >   rename meta/recipes-devtools/subversion/{subversion_1.14.1.bb => subversion_1.14.2.bb} (96%)
> >   delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch
> >   create mode 100755 scripts/git-intercept/git
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#165207): https://lists.openembedded.org/g/openembedded-core/message/165207
> > Mute This Topic: https://lists.openembedded.org/mt/90876532/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

