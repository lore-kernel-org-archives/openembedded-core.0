Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web12.13315.1602771638155854039
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 07:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YwbgeWNW;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.173, mailfrom: steve@sakoman.com)
Received: by mail-il1-f173.google.com with SMTP id w17so4301694ilg.8
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 07:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NxrhmlFONK2nYKkXXCMw7l5eCJH5xN5A7BmmuSEqT1Y=;
        b=YwbgeWNWkaBeJWFpMxBIkgnF1fDJNU82IujWJ/ftq9JjYNJmr084BXdjQ97/MWfXYo
         xKfrRCMAeOV7cggTbz4uxQe4s7ZFJE6+01e0utluLlHHIAb+00vIDf5B5+KPR6BFJtqt
         +ShGG3tb3GXehdEqalJN+ZAvUWwVTFTtfTpQDn0Wukx58aYrzgX7WmJMX3VxYxOyCrZu
         koo/UdoGJBRfiY2qTtZMha/mcrA7AYwdFe9U5xv5vNIaCKehEPVBljR4GgsOr/G1Gggp
         1wkxmniTJL4V0DfNaOmzp4O1NXZwQeGZG/D1YiMhCxXsEqtt95mZj9CzVcJ1cTGt0bm8
         Kjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NxrhmlFONK2nYKkXXCMw7l5eCJH5xN5A7BmmuSEqT1Y=;
        b=hZoXaxfGb4enhx56niMaSEo+Lxpic2PfW3UNT/UUMk23mfSOHCsitLgcNB7HqaXMrL
         kqx6sol55Pgt9QKvuec4cxDxOPGiEndPPK37J9+eDI4JnXsEpwLfgtcFdHzFUfa8eqOU
         219xViidu3rxZPO8rHi9ABJh+TEjTGwgF5j8GpbWMNAGRzOYWvSHpiI9rRcJO5bL+oas
         Tvy4lJ0l60v/Z7RnqAfw1G5XiDqzWeOwyOXuLCN7KEblNbt6o5qzZ4jroLBJyhs9HXDs
         LCkUblq1wme04jZ1ivg18r4Hk2flwy82he/E0Jlpfqd6I0CGyOoGlRW6/MZ87y10fGnC
         ciNA==
X-Gm-Message-State: AOAM530bq101lHcp6QwwKiDb04SeXWmYU7m0Lf50AMnFBu4iXQm60Mk6
	Q4mTFDWu9TQBRExoUjr+sqNs4wYZKfaml8tAMlB05Q==
X-Google-Smtp-Source: ABdhPJzK2Kl+Vlh0sZgYVZuCNBNW4CV8Bf9/HbyUKFFIGONdSGAaMoefJi6zBYT113G1YjcDzMWg28dBlQaxLuyBM24=
X-Received: by 2002:a92:d248:: with SMTP id v8mr3175564ilg.297.1602771637212;
 Thu, 15 Oct 2020 07:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <163DBD610FCA88DD.13380@lists.openembedded.org>
 <CAOSpxdYU75NyNxwQ4yomwR1X1VLJuBXnUfvQo0ycUjZGs1XFog@mail.gmail.com> <CAJdd5GZunnLXbpKQL_4X+6E3E05g0gznh5YjpC+Hgmxo+WEyKQ@mail.gmail.com>
In-Reply-To: <CAJdd5GZunnLXbpKQL_4X+6E3E05g0gznh5YjpC+Hgmxo+WEyKQ@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 15 Oct 2020 04:20:25 -1000
Message-ID: <CAOSpxdaQYF59hYetU8dA8y=wxFtMM0EKBC7XzqLRGvmPy8qrmQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/12] Pull request (cover letter only)
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 15, 2020 at 4:13 AM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> On Thu, Oct 15, 2020 at 9:07 AM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > Gentle reminder :-)
> >
> > On Tue, Oct 13, 2020 at 5:14 PM Steve Sakoman via
> > lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
> > wrote:
> > >
> > > The following changes since commit 552739383321bd9b4780bd0026d6107ece530522:
> > >
> > >   perl: fix ptest test count (2020-10-05 04:29:40 -1000)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
> > >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
> > >
> > > Bruce Ashfield (4):
> > >   linux-yocto/5.4: fix kprobes build warning
> > >   linux-yocto/5.4: update to v5.4.67
> > >   linux-yocto/5.4: update to v5.4.68
> > >   linux-yocto/5.4: update to v5.4.69
> > >
> > > Joshua Watt (1):
> > >   classes/sanity: Bump minimum python version to 3.5
>
> I assume since this passed on the AB, that 3.5 is actually the minimum
> tested version of dunfell, and changing on a stable branch won't be a
> problem?
>
> Do we know if anyone is using OE core with 3.4? It seems unlikely
> since bitbake has a minimum version of 3.5.

The fact that bitbake has a minimum version of 3.5 is what convinced
me to include this patch, it seemed silly to have a mismatch between
oe-core and bitbake.

Steve


> > > Marek Vasut (4):
> > >   lttng-modules: update to 2.11.6
> > >   lttng-tools: update to 2.11.5
> > >   lttng-ust: update to 2.11.1
> > >   stress-ng: Upgrade 0.11.01 -> 0.11.17
> > >
> > > Richard Purdie (2):
> > >   glibc: do_stash_locale must not delete files from ${D}
> > >   libtools-cross/shadow-sysroot: Use nopackages inherit
> > >
> > > Steve Sakoman (1):
> > >   Revert "lttng-modules: backport writeback.h changes from 2.12.x to fix
> > >     kernel 5.4.62+"
> > >
> > >  meta/classes/sanity.bbclass                   |   4 +-
> > >  meta/recipes-core/glibc/glibc-package.inc     |   1 -
> > >  .../libtool/libtool-cross_2.4.6.bb            |   2 +
> > >  .../shadow/shadow-sysroot_4.6.bb              |   2 +
> > >  ...ownership-when-installing-example-jo.patch |   2 +-
> > >  ...ess-ng_0.11.01.bb => stress-ng_0.11.17.bb} |   4 +-
> > >  .../linux/linux-yocto-rt_5.4.bb               |   6 +-
> > >  .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
> > >  meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +--
> > >  ...ckport-writeback.h-changes-from-2.12.patch | 128 ------------------
> > >  ...ules_2.11.2.bb => lttng-modules_2.11.6.bb} |  11 +-
> > >  ...-tools_2.11.2.bb => lttng-tools_2.11.5.bb} |   4 +-
> > >  ...ttng-ust_2.11.1.bb => lttng-ust_2.11.2.bb} |   4 +-
> > >  13 files changed, 36 insertions(+), 162 deletions(-)
> > >  rename meta/recipes-extended/stress-ng/{stress-ng_0.11.01.bb => stress-ng_0.11.17.bb} (83%)
> > >  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-backport-writeback.h-changes-from-2.12.patch
> > >  rename meta/recipes-kernel/lttng/{lttng-modules_2.11.2.bb => lttng-modules_2.11.6.bb} (81%)
> > >  rename meta/recipes-kernel/lttng/{lttng-tools_2.11.2.bb => lttng-tools_2.11.5.bb} (98%)
> > >  rename meta/recipes-kernel/lttng/{lttng-ust_2.11.1.bb => lttng-ust_2.11.2.bb} (93%)
> > >
> > > --
> > > 2.17.1
> > >
> > >
> > >
> > >
> >
> > 
> >
