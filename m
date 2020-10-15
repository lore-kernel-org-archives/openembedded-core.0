Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.13023.1602770838785009023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 07:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RpfN3zEy;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.45, mailfrom: steve@sakoman.com)
Received: by mail-io1-f45.google.com with SMTP id o4so856164iov.13
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jv3nob1XYbuYbkjGJlNA8EpBm2+0U9vujvXRpNxTbFQ=;
        b=RpfN3zEylijRfoXQ8FFkUBqGkZ5VqiXbP6WZryy8jiAcb2cpwHaudwdCuCR7h4ImIq
         FEcDDhtdFOVsvaDm3Kk4OAGNz/8qgAsTKu1b+rBEz7L3KjOohEzUnKh7oQso9p3KXiZh
         liaY92l6FTSbWfha2VGAPKoGy6Ny5ADWZoGUfWc5u+nqFuj5fUIMPYxdXe3L/MIwpJXP
         bjJz2rEhwUvrYqiWIFfGV4V1gurZDKQzlwkJn1y0te7hLPimSB5l+Mw7okQ9ZIJeTNSZ
         APIXb24r/+T7eF8/AeEuCCAFKeaKjgHxD46RuT7H+9Rit7EHwfroru91BID0Nnoz6+iY
         IL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jv3nob1XYbuYbkjGJlNA8EpBm2+0U9vujvXRpNxTbFQ=;
        b=sPL8YASjUF3QGeYP7+QXFGYZQWZmsdpJE0xet1lP8GKi5H3QQ07A6MyoTC7RKeiygR
         rgAPJegHShdBWzVOHh73Bccx6YBj4nsTnUw5i8mbIFM5y7g/QAuxL2I7nA41rJ5meBc1
         DLo8dbvEfJ6FrltFdtSFzqmcxAPOG4VRdZ/35iqGLKYeSgg3hL3zaRyp1is0CLBIHSjr
         td4dA1BK0AKqei6/A3EUMLSEXVRf9uGe2RXKQ24zCHtQGNxr/LzRO9x0R6p86PcE5+i9
         bWnCe7XB7n8hwLjGx2OYN++cFH9sayJu1BlYnX9sbqf6RsFxNV3aMs9k4IEWGOK7tTuJ
         rKmw==
X-Gm-Message-State: AOAM530sF192lUogVMk8+u4raVnp9oSEpdMpdLGrwmAOnP8vz1xo47rO
	Feq/ck5W9S2V8BrCCSVXoqSRJVNguqv6myTCaGrVPQ==
X-Google-Smtp-Source: ABdhPJwJrb9E/G1txhpghuWarDLnuDsttxA6RORomgIPCqcZxqYLho9oLaOtodjzOP9IOb9Nj2TmRb5nTkQTg39lk/M=
X-Received: by 2002:a02:ccac:: with SMTP id t12mr3511491jap.109.1602770837828;
 Thu, 15 Oct 2020 07:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <163DBD610FCA88DD.13380@lists.openembedded.org>
In-Reply-To: <163DBD610FCA88DD.13380@lists.openembedded.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 15 Oct 2020 04:07:01 -1000
Message-ID: <CAOSpxdYU75NyNxwQ4yomwR1X1VLJuBXnUfvQo0ycUjZGs1XFog@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/12] Pull request (cover letter only)
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Gentle reminder :-)

On Tue, Oct 13, 2020 at 5:14 PM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> The following changes since commit 552739383321bd9b4780bd0026d6107ece530522:
>
>   perl: fix ptest test count (2020-10-05 04:29:40 -1000)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
>
> Bruce Ashfield (4):
>   linux-yocto/5.4: fix kprobes build warning
>   linux-yocto/5.4: update to v5.4.67
>   linux-yocto/5.4: update to v5.4.68
>   linux-yocto/5.4: update to v5.4.69
>
> Joshua Watt (1):
>   classes/sanity: Bump minimum python version to 3.5
>
> Marek Vasut (4):
>   lttng-modules: update to 2.11.6
>   lttng-tools: update to 2.11.5
>   lttng-ust: update to 2.11.1
>   stress-ng: Upgrade 0.11.01 -> 0.11.17
>
> Richard Purdie (2):
>   glibc: do_stash_locale must not delete files from ${D}
>   libtools-cross/shadow-sysroot: Use nopackages inherit
>
> Steve Sakoman (1):
>   Revert "lttng-modules: backport writeback.h changes from 2.12.x to fix
>     kernel 5.4.62+"
>
>  meta/classes/sanity.bbclass                   |   4 +-
>  meta/recipes-core/glibc/glibc-package.inc     |   1 -
>  .../libtool/libtool-cross_2.4.6.bb            |   2 +
>  .../shadow/shadow-sysroot_4.6.bb              |   2 +
>  ...ownership-when-installing-example-jo.patch |   2 +-
>  ...ess-ng_0.11.01.bb => stress-ng_0.11.17.bb} |   4 +-
>  .../linux/linux-yocto-rt_5.4.bb               |   6 +-
>  .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +--
>  ...ckport-writeback.h-changes-from-2.12.patch | 128 ------------------
>  ...ules_2.11.2.bb => lttng-modules_2.11.6.bb} |  11 +-
>  ...-tools_2.11.2.bb => lttng-tools_2.11.5.bb} |   4 +-
>  ...ttng-ust_2.11.1.bb => lttng-ust_2.11.2.bb} |   4 +-
>  13 files changed, 36 insertions(+), 162 deletions(-)
>  rename meta/recipes-extended/stress-ng/{stress-ng_0.11.01.bb => stress-ng_0.11.17.bb} (83%)
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-lttng-modules-backport-writeback.h-changes-from-2.12.patch
>  rename meta/recipes-kernel/lttng/{lttng-modules_2.11.2.bb => lttng-modules_2.11.6.bb} (81%)
>  rename meta/recipes-kernel/lttng/{lttng-tools_2.11.2.bb => lttng-tools_2.11.5.bb} (98%)
>  rename meta/recipes-kernel/lttng/{lttng-ust_2.11.1.bb => lttng-ust_2.11.2.bb} (93%)
>
> --
> 2.17.1
>
>
> 
>
