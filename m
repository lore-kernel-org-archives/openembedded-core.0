Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.3812.1585682450025730769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 12:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=FMCuxGUx;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.194, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f194.google.com with SMTP id z12so19439517qtq.5
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 12:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=msDZhvdSOaWkcgbmWAJL7C2o9AU/7r9kihKTwtHoqus=;
        b=FMCuxGUxgAXvi/F8yH6v7EOnhN3VjopyNOKJrD3jMLx3qHTRQy2qijRzo/R9rGsljw
         Tg8jIZRvHwbr+dKCBsxeJG3AstP+GczioxBMdJhrZLXC/ftYN2ZX1EedxrtxwzwKDP1K
         Aj6hW76rrSt+lsEF96c24bidcwNI5Hl6a8aBzQrZVkfy51IsdCfwDkjQbxOx5pbAVIjG
         8mYrh5ty6kvBMRMyd2ftZXsBmNc8sy+olwKZ0ckX48y2KYtYOQAKWZdMQN0POqxfH99J
         faiG8E0G2gHsFvkLHRrKd1Gv5fDj0XiTc978Fgg1z7wU95MhrZqZUArbScxHU7+jErwk
         UdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=msDZhvdSOaWkcgbmWAJL7C2o9AU/7r9kihKTwtHoqus=;
        b=WPMbjVnHIY1ib2ESiV1SSP5maZx5PqX4DUAAfy1dPvTSEEq2N7pPELoMvfpwm8MQxY
         A0nsZ5u7w9x4xSWQZlKakuu4DOM4rz8Q8bgoAEzCAL4G3fqwxW9ZPqpZZgpA84TtIcD2
         fO9yhy36Y9mHEgYaDcMe9t7s0Gjgece54eL+53qKQwOu02SLVR9BDJ8nb/Q5GtdYuSND
         8A9rU36DbUPmhnBbSoOafW0ZLLIbCAAAlCJ7E4NL8qWD5KtnHxfKdva8xQm30nLIeaLE
         0ZdjY2GrwwWsU8lfWIIet3N8FJaV4VURL9uWH7hanPG3xEPSbKuUqsjsxzSJ6SfmNR34
         12cA==
X-Gm-Message-State: ANhLgQ1yDSkdUhtfV9Jnyzbt7zubxSsdAIOp3Y/3m5WvrBpsOrcZpQuY
	GlY9hFrv1DgS8UhjrZsYob46ZQh1KLGOhA==
X-Google-Smtp-Source: ADFU+vuWFQV27ODVsREkfBsTRtwT4C0NlQYfv6FOdWuvC55NKAQmx4TamgctUc+mYpth/Dn3z4yq5A==
X-Received: by 2002:ac8:6649:: with SMTP id j9mr6790739qtp.110.1585682448678;
        Tue, 31 Mar 2020 12:20:48 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id m92sm13924896qtd.94.2020.03.31.12.20.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 12:20:48 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f45.google.com with SMTP id t4so7315384qvz.8
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 12:20:47 -0700 (PDT)
X-Received: by 2002:ad4:5448:: with SMTP id h8mr18302872qvt.23.1585682447340;
 Tue, 31 Mar 2020 12:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200331174641.1094071-1-otavio@ossystems.com.br>
 <20200331180709.GM1578@denix.org> <CAP9ODKpgo=WJuR5CupXuGmMLSiYxvDrHBbur1Q93+OVc1OMvcQ@mail.gmail.com>
 <20200331184710.GO1578@denix.org>
In-Reply-To: <20200331184710.GO1578@denix.org>
Date: Tue, 31 Mar 2020 16:20:33 -0300
X-Gmail-Original-Message-ID: <CAP9ODKowyL+hZkGawp_CcuwPGn0GDQjkJdP5aQFoDVWi-yF4Fg@mail.gmail.com>
Message-ID: <CAP9ODKowyL+hZkGawp_CcuwPGn0GDQjkJdP5aQFoDVWi-yF4Fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: Add UBOOT_LOCALVERSION_AUTO support
To: Denys Dmytriyenko <denis@denix.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, Tom Rini <trini@konsulko.com>, 
	Stefano Babic <sbabic@denx.de>, Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 31, 2020 at 3:47 PM Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Mar 31, 2020 at 03:18:41PM -0300, Otavio Salvador wrote:
> > On Tue, Mar 31, 2020 at 3:07 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > > On Tue, Mar 31, 2020 at 02:46:41PM -0300, Otavio Salvador wrote:
> > > > Add the Git revision used for the build. It is very useful especially when
> > > > using custom or vendor U-Boot forks so we can map a binary to a specific
> > > > source revision. Valid values are "0" or "1".
> > >
> > > Well, UBOOT_LOCALVERSION was originally added specifically for this purpose -
> > > to be able to append git hash.
> >
> > Not really; it kinda of maps to what Linux kernel provides and it is a
> > "suffix" for the version. For example "-ti" to imply it came from a
> > Texas Instruments fork.
>
> There are multiple uses and you can append anything you want. Here's the
> original patch that specifically mentions adding git hash, as an example:
> https://lists.openembedded.org/g/openembedded-core/topic/72204283
>
> > > > This is based on a class which has been in use in `meta-freescale` BSP
> > > > for years and has been very useful especially for custom U-Boot releases
> > > > as it allow we to know the exact Git revision used for the binary.
> > >
> > > And in meta-ti BSP we've used for many years:
> > > UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}')}"
> > >
> > > And get_git_revision() just calls "git rev-parse HEAD"
> > >
> > > So, it seems a bit redundant to add another variable for this...
> >
> > How I use this is:
> >
> > UBOOT_LOCALVERSION = "-updatehub"
> > UBOOT_LOCALVERSION_AUTO = "1"
> >
> > I think it is way easier for users to do that. Using inline Python
> > code is possible but it is not something I qualify as user friendly.
>
> UBOOT_LOCALVERSION = "-updatehub-g${SRCPV}"

U-Boot 2020.01-updatehub-AUTOINC+d228123da8 (Mar 20 2020 - 17:05:55 +0000)

This is kinda ugly. Also the old behaviour is still supported.

Let's see what others from community think about it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
