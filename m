Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.10284.1623146662389246698
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 03:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kuI5JgRn;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: andrea.adami@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id he7so12241068ejc.13
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 03:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3xT2hvNVuP+MHIbXHF0+4Kl8LgZp0lUYQ6d4X+xsjWw=;
        b=kuI5JgRntRDxymxi3xao4Qtd1nYcn0UEpKC3mJNofph+q5zvZ5V/nIMMuDl3hBjZ3R
         aMOeLCk0Skn/wpZxTgoIxklrHXYaH3GYWyXVzWHYIfuZIelPYwjcMLz0+LUiG/YHurdr
         dKPPIDc5kG75p7O50r5VOCa6mrmGmSYtxpJs4x5yBhmZeTS9UexZ5hY2bktjYmk7do9Z
         GjtcGAoVZScq2VJX0hBfYBxlkfPDMjXCmxwoV/8VQbAo0ybKX7o3NpoSOMZZpcU/o3/V
         hJW2k5h3M64Fl1RfdWnDV+McENzssI6KbKcFLtTeq4/P4Ypquqt5Wn1N8Ls2bCwniBHo
         D7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3xT2hvNVuP+MHIbXHF0+4Kl8LgZp0lUYQ6d4X+xsjWw=;
        b=e+WfZbZTX/OrDLpJCL3Y640w8gtJK7rx1gXh9Wrtrw3E83qnjS+XH6bd926f9vOdYF
         hrll0xxlEfSiz4dH7QDZelwt1rE3O5skCWS8U1nHTdNdt8+tIyf5d4yVyM7bygF45r12
         FC5b/CozDlIg9onWbzWZkX3i6q7gYfFyvh2v3tnX3XQFU9hALXmmBYSqfMuILSZBHRp2
         dU+yC3S5hnNHAo1NdWI1BXRZcxyr0ShTEBwUuxgxdKr30Ofy1gkmVSz/YFy0rde9ECoo
         KaCqMKDIMfth6YjJuwGNYrxc/uxFa7hrBl5qSmPcxazGoIGCyK8ip2yKR4vjkucPNmK/
         l7bA==
X-Gm-Message-State: AOAM530GUougXQagBrZo/e7CNAoUvfPniYtHgYI1NGy+onjxtuk95g2r
	mLByXCvJpMts84wXDE9RV/v1m4ECLB/ZYwa4XIs=
X-Google-Smtp-Source: ABdhPJwMq1KhsDzR/xHVEXbCom2GAZM9GPr5kIgnwV5gBuLLA8xbtyrzb3+UZ0I7/vGQumspeiR4KsZ5i82EexJLgE4=
X-Received: by 2002:a17:906:8318:: with SMTP id j24mr22398707ejx.375.1623146660531;
 Tue, 08 Jun 2021 03:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210607212558.86624-1-bkylerussell@gmail.com>
 <01B7D818-661B-4A57-A3DB-C6AC0F0DD217@pbcl.net> <CAAQYJAsr=Rh-ie=KKrW=QFg=W2OhbTFNaLOKqeq7sxoH_gRB-Q@mail.gmail.com>
 <54d4ce6da8eef4d8e74ad2625d4e6f03b9644a21.camel@linuxfoundation.org>
In-Reply-To: <54d4ce6da8eef4d8e74ad2625d4e6f03b9644a21.camel@linuxfoundation.org>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Tue, 8 Jun 2021 12:04:09 +0200
Message-ID: <CAAQYJAv0W3OYtzY129orGZA2ir+_A1RNG6dn8_+YJbGuJLCzRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib: oe: utils: always append host gcc version to NATIVELSBSTRING
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: pb@pbcl.net, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, wesley.lindauer@gmail.com, 
	Kyle Russell <bkylerussell@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 8, 2021 at 11:48 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2021-06-08 at 11:20 +0200, Andrea Adami wrote:
> > On Tue, Jun 8, 2021 at 12:02 AM Phil Blundell via
> > lists.openembedded.org <pb=pbcl.net@lists.openembedded.org> wrote:
> > >
> > > Wouldn't it be easier to just force -fPIE on for those users for whom this is a problem? Or force -fPIE off for native everywhere. I'm not sure that doing something based on GCC version is obviously the right plan.
> > >
> > > p.
> > >
> >
> > I was exactly wondering about distro/include/uninative-flags.inc which
> > at the time was supposed to fix the changes btw ubuntu 16.x and 18.x.
> > But this doesn't seem included nowhere.
>
> Well remembered, I'd fogotten that. It is included by default:
>
> $ grep uninative-flags * -R
>
> meta/conf/distro/defaultsetup.conf:require conf/distro/include/uninative-flags.inc
>
> Cheers,
>
> Richard
>
Oops, right, I was looking at distro includes but this is included by
bitbake.conf
A.A.
