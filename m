Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1D0C48260
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 13:04:31 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.15301.1706274265540789803
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 05:04:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZczUpRl2;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5101f2dfdadso694172e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 05:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706274264; x=1706879064; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gmnFwupPx5pv6s75qiB5k5x6QjoKgllUeLUpt6X7YR0=;
        b=ZczUpRl2sJmkf0oPiLU+n++Di7Atx3N3DhZImaKM2ekXTnkYJGVtOVG9mw1utS0+kI
         7QnPCPJQ7PGz7VB+Jkhxl8Twi5ZiL0/YAzFUGvK7cFrLMCtMtCMEamsKjTVjX1rBoaYx
         W0tAI0vs04NSzBjXrBLIu2BgKep7Gpv/+CfbbxnUiU92EkPftir4amLEGBUHXVo6XwEP
         gdh269XP0+bcRtWKXJyCj/qnMevvmxY0XejEzBcjkhPNRN5tAMwn1GfRdNJotq82AP96
         f6T65Z30A9gAbcPWI5vOhEZ5AfdfwYYZ2kaYU4Xo22rXX7vGc2sIV2boC3VhD5MaNtJp
         iP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706274264; x=1706879064;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmnFwupPx5pv6s75qiB5k5x6QjoKgllUeLUpt6X7YR0=;
        b=S4jp3fGaiZ/6OjBxvS75T31KtkbkMPcGI9Qy1VdfX6+1scMVeUreOuSbEdJcAYLnLC
         JzsW74NPtfm/im1H9AiUZjdBjHLfKouYkgQDHjjpVssHpPjnByC2ieZhzrE+o60srTR0
         D4QnCmsCVx+0XXSGZiDRFkY2K0vtJSlKHaAonO0cUJNDSC1OUSVrGwdy+Bz/sqKE9m3K
         xPBRsREdJBZpsfGVeXZZzVShf1GK85lNas+2ih5XmEBW23cJ7qauFa7/4QfQ/0+2rYWG
         I4IIgIh7j5eMvpnYHF8BGxYm9Jh/0Rzz2pDdgp7NY6Augzh+nCd5saDn1Ow6dzJplJnG
         +gsg==
X-Gm-Message-State: AOJu0YwRaizWV2IWiB/U7ODrCaaJfibuYb2RH6Yvm8IM3YpBmSU0pMDX
	ks5nkk1+FVWbH9FFaJrjivADnHLKgsPSa9Bu7yO6NAMrsN9qHQ9oYtq/JOnTFpU64VsLRkhGzFk
	CfthA80+RwsNLlzefEsSQ6O/vKbo=
X-Google-Smtp-Source: AGHT+IHskx79aCazkT5hPxaJoyiv4A7Q+RPGww2HeCyLz80YRp1nnbjZMLK9iyFBzgds99RPWGWKK3ICgTQoOYYK/GY=
X-Received: by 2002:a05:6512:717:b0:510:293e:839 with SMTP id
 b23-20020a056512071700b00510293e0839mr204020lfs.33.1706274263249; Fri, 26 Jan
 2024 05:04:23 -0800 (PST)
MIME-Version: 1.0
References: <436ae552-2fad-8de3-9435-b03df2d2a823@crashcourse.ca>
In-Reply-To: <436ae552-2fad-8de3-9435-b03df2d2a823@crashcourse.ca>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Jan 2024 14:04:11 +0100
Message-ID: <CANNYZj-ieZYmz5H6=2X0OzMu+dBd8WtKsxZRa-iH2w1yLLVZnQ@mail.gmail.com>
Subject: Re: [OE-core] trying to create simple example of "externalsrc" recipe
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 13:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194357

Note that there is a selftest for this in
meta/lib/oeqa/selftest/cases/externalsrc.py, so you could check why
that seems to work.

Alex

On Fri, 26 Jan 2024 at 13:47, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>
>   i've been trying to put together a really basic example of a recipe
> using "externalsrc" that refers to some local source, and cannot get
> it to work. so here's what i'm trying.
>
>   as a demo, i selected a random simple OE recipe -- in this case,
> "dmidecode", whose recipe you can see here (and which seems
> conveniently simple for demonstration purposes):
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/dmidecode/dmidecode_3.5.bb?h=master
>
> so to start, since the SRC_URI is a tarball, i downloaded the tarball
> so that i have the equivalent local source here:
>
>   $ ls /home/rpjday/oe/srcs/dmidecode-3.5
>   AUTHORS       dmioem.h     Makefile     util.c
>   biosdecode.c  dmiopt.c     man          util.h
>   config.h      dmiopt.h     NEWS         version.h
>   dmidecode.c   dmioutput.c  ownership.c  vpddecode.c
>   dmidecode.h   dmioutput.h  README       vpdopt.c
>   dmioem.c      LICENSE      types.h      vpdopt.h
>   $
>
>   as my first test, i set the build to the source directory in my
> dmid_1.0.bb recipe file:
>
>   inherit externalsrc
>   EXTERNALSRC = "/home/rpjday/oe/srcs/dmidecode-3.5"
>   EXTERNALSRC_BUILD = "${EXTERNALSRC}"
>
>   do_install() {
>     oe_runmake \
>         DESTDIR="${D}" \
>         prefix="${prefix}" \
>         sbindir="${sbindir}" \
>         docdir="${docdir}/${BPN}" \
>         mandir="${mandir}" \
>         install
>
> then ran:
>
>   $ bitbake dmid
>
> sure enough, that build in the source directory, generating:
>
>   AUTHORS       dmidecode.o  dmioutput.h  ownership*   version.h
>   biosdecode*   dmioem.c     dmioutput.o  ownership.c  vpddecode*
>   biosdecode.c  dmioem.h     LICENSE      ownership.o  vpddecode.c
>   biosdecode.o  dmioem.o     Makefile     README       vpddecode.o
>   config.h      dmiopt.c     man/         types.h      vpdopt.c
>   dmidecode*    dmiopt.h     NEWS         util.c       vpdopt.h
>   dmidecode.c   dmiopt.o     oe-logs@     util.h       vpdopt.o
>   dmidecode.h   dmioutput.c  oe-workdir@  util.o
>
>   great, but i really want to build out-of-tree to preserve the
> pristine state of the source, so i followed the instructions and
> allowed EXTERNALSRC_BUILD to default to ${WORKDIR}/${BPN}-${PV}:
>
>   inherit externalsrc
>   EXTERNALSRC = "/home/rpjday/oe/srcs/dmidecode-3.5"
>   # EXTERNALSRC_BUILD = "${EXTERNALSRC}"
>
> so I did a "make clean" in the source directory to start with the
> pristine source (also deleted the "oe-" symlinks), then:
>
> $ bitbake dmid
> ... snip ...
> | NOTE: make -j 8
> DESTDIR=/home/rpjday/oe/builds/qemux86/tmp/work/core2-64-poky-linux/dmid/1.0/image
> prefix=/usr sbindir=/usr/sbin docdir=/usr/share/doc/dmid
> mandir=/usr/share/man install
> | make: *** No rule to make target 'install'.  Stop.
> | ERROR: oe_runmake failed
>
>   from "bitbake -e dmid", i can see:
>
> S="/home/rpjday/oe/srcs/dmidecode-3.5"
> WORKDIR="/home/rpjday/oe/builds/qemux86/tmp/work/core2-64-poky-linux/dmid/1.0"
> B="/home/rpjday/oe/builds/qemux86/tmp/work/core2-64-poky-linux/dmid/1.0/dmid-1.0"
>
> but there is nothing unloaded into the B directory; hence, the
> failure. in fact, the log file for the compile step is:
>
> DEBUG: Executing python function externalsrc_compile_prefunc
> NOTE: dmid: compiling from external source tree
> /home/rpjday/oe/srcs/dmidecode-3.5
> DEBUG: Python function externalsrc_compile_prefunc finished
> DEBUG: Executing python function fetcher_hashes_dummyfunc
> DEBUG: Python function fetcher_hashes_dummyfunc finished
> DEBUG: Executing shell function do_compile
> NOTE: nothing to compile
> DEBUG: Shell function do_compile finished
>
>   so ... what have i overlooked? did i grab an inappropriate sample
> recipe that does not support building out-of-tree? the build directory
> is empty, so i'm perusing the externalsrc.bbclass to see what i have
> misunderstood.
>
> rday
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194356): https://lists.openembedded.org/g/openembedded-core/message/194356
> Mute This Topic: https://lists.openembedded.org/mt/103974993/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

