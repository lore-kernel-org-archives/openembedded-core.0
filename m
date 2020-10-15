Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.13089.1602771208396760851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 07:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IYenscJY;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id e2so3845183wme.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 07:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NyHtl49BW+v/2TAqNBoOutTCbpMt4UpE1ERc315pkUQ=;
        b=IYenscJY+f2LjcNWbig08Nmpferccqz9OCjAtl1LKFocw6CiWKT6LMxvhua8CsaUlw
         QMz6PYbyomfZC2sGPB0cYCu5Plq0IaLL9m9TB4ejqRrVvE6c1FqaGaDzLk1AmMfPsE42
         vMNp0XZ+lcXe6+MgmfIgNfqhK13YJtsXYGrIMNbHcq4JE2qMfc2zoAZgSAvs8bqB+CUD
         EiGEVnOodBXBhqNVhxLqZnT7aa+50POr3BxjXYVq+xweGtrVxNDuGJgvA+HsLRtuyuhL
         lu64QTnt2gtYUEMp1bgUw0D4y2tgtBvPPuyzr0izViRiRXwLBxD8OjnLJoJgx/LXVAMH
         /npw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NyHtl49BW+v/2TAqNBoOutTCbpMt4UpE1ERc315pkUQ=;
        b=EIcdFP6fcxKKzLRM3fXH+4o5xVZGNAFSZUTq5pXxWoINDCBrtEb34r+VEYMrv9iWXL
         /v7h3gJVUaaAlTQqepHXoOEIpYoL6QzKX1Ob0cCMJ53K9dwq1428cTiIjp7HmZOyBUNK
         kzuWFkVd+rZyLDePy/C3Y1MhZvXzUA/HpUmuA3dbM55pF4MWtRZfDSiOW6gYfMWZoWPi
         TtZO8TU5pTjJQeF68pSWanrr8CyBX54+QqW7gtxenYwfm2g5fU1/xW5jzAvk+D3XBFbM
         1FnN1TfniwwS0x6u8LFIQjVby/b5VN2CY+BA+DZ4xQgofAOF8Yf4ibGJlyp4DQGAyJiE
         PSlQ==
X-Gm-Message-State: AOAM532O3YSjwx7Wgrz5EsZqdcwfiHF3O+bmbBMdNF2MhApNin+hRPKq
	3wpTAfRuwZj9ujHrU4x3iV7wGgoZ1GKC3e2lgOY=
X-Google-Smtp-Source: ABdhPJxVmhx4woIxEAx8iYfhfqt4GSodzfY8dC3qPbzrO3OCKulxWGrAZvP8Ch3Uwf+pco8qcBxz91d/BOooulF78fc=
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr4524798wmi.56.1602771206783;
 Thu, 15 Oct 2020 07:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <163DBD610FCA88DD.13380@lists.openembedded.org> <CAOSpxdYU75NyNxwQ4yomwR1X1VLJuBXnUfvQo0ycUjZGs1XFog@mail.gmail.com>
In-Reply-To: <CAOSpxdYU75NyNxwQ4yomwR1X1VLJuBXnUfvQo0ycUjZGs1XFog@mail.gmail.com>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Thu, 15 Oct 2020 09:13:15 -0500
Message-ID: <CAJdd5GZunnLXbpKQL_4X+6E3E05g0gznh5YjpC+Hgmxo+WEyKQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/12] Pull request (cover letter only)
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 15, 2020 at 9:07 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> Gentle reminder :-)
>
> On Tue, Oct 13, 2020 at 5:14 PM Steve Sakoman via
> lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
> wrote:
> >
> > The following changes since commit 552739383321bd9b4780bd0026d6107ece530522:
> >
> >   perl: fix ptest test count (2020-10-05 04:29:40 -1000)
> >
> > are available in the Git repository at:
> >
> >   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
> >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
> >
> > Bruce Ashfield (4):
> >   linux-yocto/5.4: fix kprobes build warning
> >   linux-yocto/5.4: update to v5.4.67
> >   linux-yocto/5.4: update to v5.4.68
> >   linux-yocto/5.4: update to v5.4.69
> >
> > Joshua Watt (1):
> >   classes/sanity: Bump minimum python version to 3.5

I assume since this passed on the AB, that 3.5 is actually the minimum
tested version of dunfell, and changing on a stable branch won't be a
problem?

Do we know if anyone is using OE core with 3.4? It seems unlikely
since bitbake has a minimum version of 3.5.

> >
> > Marek Vasut (4):
> >   lttng-modules: update to 2.11.6
> >   lttng-tools: update to 2.11.5
> >   lttng-ust: update to 2.11.1
> >   stress-ng: Upgrade 0.11.01 -> 0.11.17
> >
> > Richard Purdie (2):
> >   glibc: do_stash_locale must not delete files from ${D}
> >   libtools-cross/shadow-sysroot: Use nopackages inherit
> >
> > Steve Sakoman (1):
> >   Revert "lttng-modules: backport writeback.h changes from 2.12.x to fix
> >     kernel 5.4.62+"
> >
> >  meta/classes/sanity.bbclass                   |   4 +-
> >  meta/recipes-core/glibc/glibc-package.inc     |   1 -
> >  .../libtool/libtool-cross_2.4.6.bb            |   2 +
> >  .../shadow/shadow-sysroot_4.6.bb              |   2 +
> >  ...ownership-when-installing-example-jo.patch |   2 +-
> >  ...ess-ng_0.11.01.bb => stress-ng_0.11.17.bb} |   4 +-
> >  .../linux/linux-yocto-rt_5.4.bb               |   6 +-
> >  .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
> >  meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +--
> >  ...ckport-writeback.h-changes-from-2.12.patch | 128 ------------------
> >  ...ules_2.11.2.bb => lttng-modules_2.11.6.bb} |  11 +-
> >  ...-tools_2.11.2.bb => lttng-tools_2.11.5.bb} |   4 +-
> >  ...ttng-ust_2.11.1.bb => lttng-ust_2.11.2.bb} |   4 +-
> >  13 files changed, 36 insertions(+), 162 deletions(-)
> >  rename meta/recipes-extended/stress-ng/{stress-ng_0.11.01.bb => stress-ng_0.11.17.bb} (83%)
> >  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-backport-writeback.h-changes-from-2.12.patch
> >  rename meta/recipes-kernel/lttng/{lttng-modules_2.11.2.bb => lttng-modules_2.11.6.bb} (81%)
> >  rename meta/recipes-kernel/lttng/{lttng-tools_2.11.2.bb => lttng-tools_2.11.5.bb} (98%)
> >  rename meta/recipes-kernel/lttng/{lttng-ust_2.11.1.bb => lttng-ust_2.11.2.bb} (93%)
> >
> > --
> > 2.17.1
> >
> >
> >
> >
>
> 
>
