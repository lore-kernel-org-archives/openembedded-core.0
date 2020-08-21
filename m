Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.134403.1598018516406173156
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2020 07:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GVwC/+ZC;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.171, mailfrom: steve@sakoman.com)
Received: by mail-il1-f171.google.com with SMTP id 77so1459882ilc.5
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2020 07:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=INwI/773Ym7+bcKkmrVlwOQfHr+f9oL7ThWC+fRbBs4=;
        b=GVwC/+ZCj9p1z/FRXkfW6+IpPxI2RjS8ugDIIS85Exn3Iq6mwKNurR87DecNZoxRru
         mU+rAG7pQ+RbUNLSzJjFvDIM1V+X1CxJW8PgpWHbqbsV/d2d0pexKG5eFn9QMwHVmIRS
         Smn2Pj+8SDgpu7BthWSW0O9zNvq7zHiXeuNpQETBi5RFAf5epVd6+s7HFSQ15s2sn3hy
         Vx2mggoT5ADrvuKYU8sGbi/rDhTUjf5yKtbjpyvFko5nA+DHnsdqEQU7krI8TIwItWkm
         fCgmoj26ZMjGuRtqDGJxGTLD6zGAAePuEQ9u0C5FJceWwi4ldLvYjbiQ5WQaMHAChKB2
         Wu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=INwI/773Ym7+bcKkmrVlwOQfHr+f9oL7ThWC+fRbBs4=;
        b=H/wl+ZtGWP3FXW+3QP90t158Xsh4HBzVI5oKeJRJBoY/2o7JKa1LbTv6sqSVW9/O1y
         Boz4zGX4AIBn1U4FpHOJCMBixwPLb59VcLJ5P/FXPjkoZrTpUwAzTF4BkT+t9E6cZM/k
         kzHwCTEeKtDPAu6qh7Z2thl3OGPb35Y9/DZwwtNAIvXpBLwNVL3f8r55xo3r1v7oBUkN
         GlKlaBZfX0gNQbcHm8TOW0ju3F3xDMcLL+nUm5ZceSj3jycLmZeeV1T1KervzkZNshd5
         TaTdMdGiqOxZbHXeyInKTt/kJ0WKYoT8RbogdkeOL1Ts0r1GmbpFQ2PlQIc+D00eYDJL
         U0GQ==
X-Gm-Message-State: AOAM532MGiGbZbbgwiOSrqcr4IFbXzxGJDPKvkr2Vn+JjD3U8le6ZTcK
	EO540Ggh68kqQxpu9mbjPpJyw6HOOld6Ezpz2p94GQ==
X-Google-Smtp-Source: ABdhPJxu0nBCRIsBT5zRhYcHQ4+H93xSkNv33AdgIJRb3NY+kgYN2eIsTLt+3VhECLV7w5bCvDlV8k/r/Tp825lZ8o4=
X-Received: by 2002:a92:874a:: with SMTP id d10mr2646680ilm.273.1598018515364;
 Fri, 21 Aug 2020 07:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <162CDB0EA5125872.7353@lists.openembedded.org>
In-Reply-To: <162CDB0EA5125872.7353@lists.openembedded.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 21 Aug 2020 04:01:44 -1000
Message-ID: <CAOSpxdaYmwKao-pO7UBKzpOrnEZdt-N3dM9Ptb=42B9T0uibHw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 0/7] Pull request (cover letter only)
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Gentle reminder :-)

On Wed, Aug 19, 2020 at 5:07 PM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> The following changes since commit b95d6aeafb70765e22d2e1254e749a48f508d489:
>
>   uninative: Handle PREMIRRORS generically (2020-08-09 09:26:54 -1000)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
>
> Bruce Ashfield (3):
>   linux-yocto-rt/5.4: update to rt32
>   linux-yocto/5.4: update to v5.4.56
>   linux-yocto/5.4: update to v5.4.57
>
> Khem Raj (4):
>   glibc: Bring in CVE fixes and other bugfixes from 2.31 release branch
>   gcc-9.3.inc: Mark CVE-2019-15847 as fixed
>   go: update 1.14.4 -> 1.14.6
>   go: Upgrade to 1.14.7
>
>  meta/recipes-core/glibc/glibc-version.inc     |   2 +-
>  .../glibc/0016-Add-unused-attribute.patch     |  31 ---
>  .../glibc/glibc/CVE-2020-6096.patch           | 112 ----------
>  .../glibc/glibc/CVE-2020-6096_2.patch         | 194 ------------------
>  meta/recipes-core/glibc/glibc_2.31.bb         |   5 +-
>  meta/recipes-devtools/gcc/gcc-9.3.inc         |   2 +
>  meta/recipes-devtools/go/go-1.14.inc          |   5 +-
>  .../linux/linux-yocto-rt_5.4.bb               |   6 +-
>  .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
>  10 files changed, 24 insertions(+), 363 deletions(-)
>  delete mode 100644 meta/recipes-core/glibc/glibc/0016-Add-unused-attribute.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch
>
> --
> 2.17.1
>
> 
