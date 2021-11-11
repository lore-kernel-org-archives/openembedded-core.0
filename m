Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76429C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 14:16:53 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.11119.1636640212245612236
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 06:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=AkLuQQzV;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.43,
 mailfrom: steve@sakoman.com)
Received: by mail-wm1-f43.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so4537083wmd.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 06:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P5PjPTBAIpFMn1zK6vfM66acrrmKoFgkt7yZia/cUfk=;
        b=AkLuQQzVXYTd7XcGZrf7Y0POZTYaob9EHxtNcXEgjHjwWvT41+FV/AEbADqFYthRlV
         6hRgJxvLLehSyuftcWNk6xUQbMBKdl8F5hY6vQly2OJvaqqvRs8h4GsKoi8ytwR+3Wxf
         7qtW/VjbjsNVe83/3jK3YodxCsA0sy6kYijEZgTqb7no5JfxDe+Jt95tLkGMA/cIi9YL
         pE3/kUGtH2LUrO+kw0Lo5TJZvC5XfCbox2lklQrrKctHJQtBC7uBGr0vAqn6aTYpPIFJ
         Rs4rTQxaluqFxLj9HVcMMdO9angZ9hzxMwZXG7QJoRa8qcYHIPQAKIpM2PNMyeJr429r
         olJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P5PjPTBAIpFMn1zK6vfM66acrrmKoFgkt7yZia/cUfk=;
        b=Ub26pWADe9RLzMhR3iIKf1iegd0gXcfThbOAYWIVBw0GwQiNTzdY+IrvY4tq1lBUkO
         WI0u7o28+73QyRwNGv7AcbjeaaYW5kYHERpXeWU9299rmpsi6hewY8X7jNS9k6M7ABtM
         Mu8GKbWgCgL1i3D6ig6pGyEpjH4GMy8a4Th1CxB8IZgmOTnpnymYLYsPUe3Qev3EbprK
         IhAauNU2s8tmFO3CGMjcayurQToW7P5dK2fkudhvvc5OdMuAPCXaBlDm6z+p7WbjqpfT
         3TzM0Uazlp+R8rG6RHaPYzuxbBOIXgh/BUi7jfRk6nNWqJR7hqqmsEXwl7HgJaLsLj6+
         IHOw==
X-Gm-Message-State: AOAM533n2hq1lvH0ct9nSjFcdch3RB0xYAOwA422ngKg2CwkNy91+h1n
	Q+Bn2DAOUa4s1KmMVyDuG6oZvsA9obfFX+0TCZ8Izw==
X-Google-Smtp-Source: 
 ABdhPJxilVyuu5/pAR/KNzu5koBBmZtHMnoYlLFmwQhTOD3ZGXpMijudh/oOBNxzk2vN48bUdHTigU852a1nAC1nKQI=
X-Received: by 2002:a1c:9851:: with SMTP id
 a78mr25777339wme.116.1636640210653;
 Thu, 11 Nov 2021 06:16:50 -0800 (PST)
MIME-Version: 1.0
References: <16B6626DB9B02798.14836@lists.openembedded.org>
In-Reply-To: <16B6626DB9B02798.14836@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 11 Nov 2021 04:16:39 -1000
Message-ID: 
 <CAOSpxdYrXKpF8mwr0bFC5F-z=O+TkW7QT3vRy_Vuzr6xSfo-Gg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/14] Patch review
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 14:16:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158183

On Wed, Nov 10, 2021 at 6:08 PM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> Please review this set of patches for dunfell and have comments back by end
> of day Friday.

I forgot to add:

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2910

>
> The following changes since commit 38fc0807eea14dc12610da4ba73c082d5a4b0744:
>
>   meta/scripts: Manual git url branch additions (2021-11-03 08:43:53 -1000)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut
>
> Jose Quaresma (1):
>   sstate: another fix for touching files inside pseudo
>
> Joshua Watt (1):
>   oeqa: reproducible: Fix test not producing diffs
>
> Khem Raj (1):
>   webkitgtk: Fix reproducibility in minibrowser
>
> Marek Vasut (1):
>   piglit: upgrade to latest revision
>
> Mark Hatle (1):
>   reproducible_build: Remove BUILD_REPRODUCIBLE_BINARIES checking
>
> Mingli Yu (1):
>   python3-magic: add the missing rdepends
>
> Richard Purdie (6):
>   linunistring: Add missing gperf-native dependency
>   pseudo: Add in ability to flush database with shutdown request
>   pseudo: Add fcntl64 wrapper
>   mirrors: Add uninative mirror on kernel.org
>   sstate: Ensure SDE is accounted for in package task timestamps
>   sstate: Avoid deploy_source_date_epoch sstate when unneeded
>
> Steve Sakoman (2):
>   python3-magic: add missing DEPENDS
>   selftest/reproducible: add webkitgtk back to exclusion list for
>     dunfell
>
>  meta/classes/mirrors.bbclass                  |  1 +
>  meta/classes/reproducible_build.bbclass       | 53 ++++++++++++-------
>  meta/classes/sstate.bbclass                   | 34 +++++++++---
>  .../oeqa/selftest/cases/diffoscope/A/file.txt |  1 +
>  .../oeqa/selftest/cases/diffoscope/B/file.txt |  1 +
>  meta/lib/oeqa/selftest/cases/reproducible.py  | 29 +++++++++-
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +-
>  .../python/python3-magic_0.4.15.bb            |  7 ++-
>  ...ssing-include-for-htobe32-definition.patch | 27 ++++++++++
>  ...file.py-make-test-lists-reproducible.patch | 31 +++++++++++
>  ...gen_tcs-tes_input_tests.py-do-not-ha.patch | 44 +++++++++++++++
>  ...lizer.py-make-.gz-files-reproducible.patch | 30 +++++++++++
>  ...sort-the-file-list-before-working-on.patch | 28 ++++++++++
>  ...t-shader.c-do-not-hardcode-build-pat.patch | 30 +++++++++++
>  meta/recipes-graphics/piglit/piglit_git.bb    | 12 ++++-
>  .../0001-MiniBrowser-Fix-reproduciblity.patch | 31 +++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.28.4.bb  |  1 +
>  .../libunistring/libunistring_0.9.10.bb       |  1 +
>  18 files changed, 333 insertions(+), 30 deletions(-)
>  create mode 100644 meta/lib/oeqa/selftest/cases/diffoscope/A/file.txt
>  create mode 100644 meta/lib/oeqa/selftest/cases/diffoscope/B/file.txt
>  create mode 100644 meta/recipes-graphics/piglit/piglit/0001-Add-a-missing-include-for-htobe32-definition.patch
>  create mode 100644 meta/recipes-graphics/piglit/piglit/0001-framework-profile.py-make-test-lists-reproducible.patch
>  create mode 100644 meta/recipes-graphics/piglit/piglit/0001-generated_tests-gen_tcs-tes_input_tests.py-do-not-ha.patch
>  create mode 100644 meta/recipes-graphics/piglit/piglit/0001-serializer.py-make-.gz-files-reproducible.patch
>  create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-shader.py-sort-the-file-list-before-working-on.patch
>  create mode 100644 meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158132): https://lists.openembedded.org/g/openembedded-core/message/158132
> Mute This Topic: https://lists.openembedded.org/mt/86975084/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

