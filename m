Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.9047.1608730675464682088
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 05:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gPrSW35n;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id b2so16275754edm.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 05:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iyjPRNLlC6UamFBrtiSUPPS2e1ckslrjR/AQUYEgEX4=;
        b=gPrSW35nc/BIyqQGk6mkfUZzupGX5d7R9fFgzijTbNImNfBfuMP7ctYiWtiboPl9yo
         DYPgx+9MSrmb4/veLCQq11R1tviAXAJdrX2OvfzoeQ2eU3TGl1CAMep/w5GJYZkFXCmJ
         X87wtTMvIunKuMH/pgKSpRhPPUPBySqivVe535ysiXtB+r9uO88W2TB38MvH1K2NP31G
         azb7dZqUlNdv7V2VT7utsyfjhy7s2kTQmKDtw/Duoz651Ywp2gtCUpscb7MR/HFGCJtV
         I9nqWr/oKhk/4157CoqQfVdNPBH/FYDjU3ahOtxKUvTDAC9d03Hgauh7MX2PWhf6ChDq
         c2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iyjPRNLlC6UamFBrtiSUPPS2e1ckslrjR/AQUYEgEX4=;
        b=iNf0YpUUNuaUsNUmTBlHH3rdK4Z21PnxDRo/GO2siK6OoBQytqS9Jz4UNSb5DE6uwH
         RJLlo0aTLMaUaxm4blK0Bt9qbR5pMb6cmLKitFOAQ/cBUmdPgOYcu1elCYvPc9+bO5O2
         j9Ia+Erp4QFBllZG+TDAn5znJ+MC++WzuR4rXYEwRiJ19gCUa6PR/F4X9sRaX5LkClTy
         L7i10EL9weVQUQLzk+J1TvpU8aaPXcbOwcYL77HufTcvve0NMzkQK9JcRlxW0E4r2Xvj
         5jyUjCGR7gmnqxnC0D0GXBuO2gWo5bXMZI3AsqH30V/dKnTeY0a3uVyY20byD0LOA5tL
         eQow==
X-Gm-Message-State: AOAM5306tXus+RYPXDexc5s7ClASm97w+7L+wW95E+D+bvM1Mpn3c7Mn
	15P9dr1ei4uevdptv/UkKwQxXLakPOqVL6OuwBs=
X-Google-Smtp-Source: ABdhPJzm+yLMEOen7rhivHGkGKnIScnDriZ8q7bnvQx02kGgIf0mz6Jp3FcF8zctuTrRjL6+SRjEm9GXFbiAcZbFoa4=
X-Received: by 2002:aa7:d407:: with SMTP id z7mr25879725edq.234.1608730673936;
 Wed, 23 Dec 2020 05:37:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1608646697.git.bruce.ashfield@gmail.com> <ef75b7d902ee23f65adf34742a71b1b8ee8c64cb.camel@linuxfoundation.org>
In-Reply-To: <ef75b7d902ee23f65adf34742a71b1b8ee8c64cb.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 23 Dec 2020 08:37:42 -0500
Message-ID: <CADkTA4NJEXWs3DeXKaM_215Ue5g=ZoCrR6O-7CyvSytRv3z5jg@mail.gmail.com>
Subject: Re: [PATCH 0/9] kernel: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>, Jon Mason <Jon.Mason@arm.com>, 
	"Mittal, Anuj" <anuj.mittal@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 23, 2020 at 7:32 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Anuj/Ross/Jon: See below
>
> On Tue, 2020-12-22 at 09:28 -0500, bruce.ashfield@gmail.com wrote:
> > This is largely a resend of the configuration changes and kernel
> > version bump that I had previously sent.
> >
> > The kern-tools SRCREV bump has a tweak in the tools from the previous
> > version, and there are specific fixups for the warnings that the
> > tools were now exposing. I had to balance tiny and standard needing
> > different values for some common options!
> >
> > The AB run that I did is here:  https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1270
> >
> > Everything looks good to me (but I only just realized that there are
> > now multiple pages to check) :).
>
> Thanks Bruce. This does now work on the autobuilder, it does also
> expose warnings in meta-intel and meta-arm:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/560
> https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/1031
>

I'll tweak the v5.4 meta data and send it as a separate patch.

Bruce

> which gives me a bit of a dilemma as I doubt these are going to get
> fixed in the next couple of weeks...
>
> Ross/Jon: We also need to talk about the intermittent ptest results on
> arm...
>
> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
