Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5DCC83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 13:01:24 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.15191.1752066082337764167
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 06:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aNUZSg6i;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so779982b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 06:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752066082; x=1752670882; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UY9zXr0xAYNhCXjkn0A4MuH+jqepXM45TrIUjeehrkw=;
        b=aNUZSg6i+uyjJfSRuG1iyBnUUpOJmqEjT+CGbzLip6ZliQBgtQZ6gQKZP+Q9mOkLWe
         Jt6K9rWOazSAXf6IfePhZCDLefwfgBli4fLKe4qKSLxzkHwvHeIHPKiqBWRGXP/UYG5t
         zikO80AffXnauCzs9BONaI9NsXdfXWybE7D9Mrjk7MGlake6KzTErIKzzzjpsQi1/EFX
         WYL/RxuMtec1gCfJVyPj5Y3T9H9B11SrcndjlH/B8O+KGBursBJNV+I3ZcbRncjf1c6M
         +LhtoIdGFKuz7azXu0Ip5LeZcEpY+t0qQn4VgLz5YyKF6qS8mRtFrbVyVP8UqKloedeS
         Bd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752066082; x=1752670882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UY9zXr0xAYNhCXjkn0A4MuH+jqepXM45TrIUjeehrkw=;
        b=OmB2Ap26ICK5Q0BUOhgZyWq4nI0biju4SXaZh1YbMqUMEViaktzcizap3Me6espbko
         mJnizFuZzxWpU+h6B2ovFeU1AbxKTzwM0a3fpLV6XsvWsH+16miFrSKlZmohqPWqbCUz
         YtIOD3hnkJdxOoh0e+7wJrO/r45H6zQA7MMWitIJnkVWHjGUOlXh9w/RBGiOp5f6FGHy
         vPZju6LgZm61g6MzUzNlxR0KGXI4S24AyXmTwfA9khnKmvJMoBtenqDAzfRpAKRP1fS5
         FR52+Bz6QUY4Kx0c7+rA4lVp+OpR6rQ6HtZBtvQGThXgN6erQQclEAKlFht5J8xLdCbZ
         qF+g==
X-Gm-Message-State: AOJu0Yyf5vbRpM9DPffzLRfETPqrXRI5N2sv3gLPtjjAfzUGrwfIkllN
	N0dw76NdGN8X4FfZGZNO649i5Nm3vzNUEzQ0b/y+BxM3OlFQ0BOI86SH9v5bXhE+5sGi+SZNSlS
	SRdfTKHyW939AGICOHEGcnwYCg2InHVE=
X-Gm-Gg: ASbGncumyuyKEOdiXsMMH/6BkKbf9xrr+QxY3M9RQbvAFAVs5FWpdjAhTkvzATFyBR6
	etDNpYk7b/4w8bee4gVtlMhMl5h1XAL+HCsb2W1IJEh1WVB9MMA26beus1TH5dyN2/RUqugtTrA
	weVSrNLEODKH0SMR5T6RLoy9s1MXoVqeF1n8NbcmJ2TW+4
X-Google-Smtp-Source: AGHT+IE6qeBQUZsbXeWpEiWXy9eAisQk6eA/8p8TyN1oBBCpMQa/gFAKo6qSjaOJuJ7LwmhCfgwsCs0jBgDKDWWx9wU=
X-Received: by 2002:a05:6a20:3947:b0:220:3a2:e0c6 with SMTP id
 adf61e73a8af0-22b5f49b152mr11987129637.6.1752066081061; Wed, 09 Jul 2025
 06:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751985223.git.bruce.ashfield@gmail.com> <196cdceb3c5f14f1d3b0a58ef9c7020e3a39049b.camel@linuxfoundation.org>
In-Reply-To: <196cdceb3c5f14f1d3b0a58ef9c7020e3a39049b.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 9 Jul 2025 09:01:08 -0400
X-Gm-Features: Ac12FXx8EId3j1IiJduHgNDbYCul9BK0A-ZeF8C8zWAfS233CGaIbGvxxTsqXDI
Message-ID: <CADkTA4NA0KpJrOJLwSiYuhQMz+PUd6_A7Xvmm9tRexo=qKGgFQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] kernel-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006283b606397eac29"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 13:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220088

--0000000000006283b606397eac29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 3:58=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2025-07-08 at 10:36 -0400, bruce.ashfield@gmail.com wrote:
> > I'm clearing the kernel queue now that I'm back at the office.
> >
> > Following this will be libc-header updates and a bump to the new
> > release/reference kernel version (v6.15 ... or possibly v6.16)
> > depending
> > on the timing of the upstream release.
>
> Thanks, I tested these and things seem ok so they've merged.
>
> You asked about updating the CVE list, we do need to do that. I looked
> up the commands and those appear to be:
>
> git clone https://github.com/CVEProject/cvelistV5
> meta/recipes-kernel/linux/generate-cve-exclusions.py
> /my/checkout/cvelistV5/ 6.12.36 >
> meta/recipes-kernel/linux/cve-exclusion_6.12.inc
>
>
Excellent.

I'll roll that into my update script.

Bruce



> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000006283b606397eac29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 9, 2025 at 3:58=
=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Tue, 2025-07-08 at 10:36 -04=
00, <a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ash=
field@gmail.com</a> wrote:<br>
&gt; I&#39;m clearing the kernel queue now that I&#39;m back at the office.=
<br>
&gt; <br>
&gt; Following this will be libc-header updates and a bump to the new<br>
&gt; release/reference kernel version (v6.15 ... or possibly v6.16)<br>
&gt; depending<br>
&gt; on the timing of the upstream release.<br>
<br>
Thanks, I tested these and things seem ok so they&#39;ve merged.<br>
<br>
You asked about updating the CVE list, we do need to do that. I looked<br>
up the commands and those appear to be:<br>
<br>
git clone <a href=3D"https://github.com/CVEProject/cvelistV5" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/CVEProject/cvelistV5</a><br>
meta/recipes-kernel/linux/generate-cve-exclusions.py /my/checkout/cvelistV5=
/ 6.12.36 &gt; meta/recipes-kernel/linux/cve-exclusion_6.12.inc<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Excellent.</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">I&#39;ll roll that into my update script.</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
Cheers,<br>
<br>
Richard<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000006283b606397eac29--

