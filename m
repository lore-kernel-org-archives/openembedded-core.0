Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com [209.85.221.193])
 by mx.groups.io with SMTP id smtpd.web09.4552.1603137366415164017
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 12:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ji/SM4oY;
 spf=pass (domain: gmail.com, ip: 209.85.221.193, mailfrom: armccurdy@gmail.com)
Received: by mail-vk1-f193.google.com with SMTP id y10so317997vkl.5
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 12:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wyjnCrTlUEaHzpmPThuwigKNDzGwt3eGN11io9twITo=;
        b=ji/SM4oYziDTBjYn2FEt9okVhEDXmdfUb1kwRRK6WcRwfZ27im4r8tytw2VKV/+btT
         uPJHly8k7kQYGBywUtiJBcKyIf+4C3a5P1jCygMgRs9FQwvvIE/TW/QUiLGSDRS7/duS
         c6CSlL9B6u2/anvzmXWunSg3hlSf5lN/RIr3i2Ep9RizCnRv8LAVl9cDtQiZ+TC9XlD+
         xkIvHdRCP3oIIiZ3GCYJOUSkUEmhbub/kSJgno77Uye/czV79oHQW4SPbZbzyUcJAGgg
         WGBY7bqDQkde2QHo6NJ4dmvsJeedJRmfOxJsielev7GtrOW8mbcsxR8kujKFTTD0DC9q
         0/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wyjnCrTlUEaHzpmPThuwigKNDzGwt3eGN11io9twITo=;
        b=VLE18W7Bb0hOdPLiOLp+YL2knJTZok7ZEBlyC63bWMB9Iik18aUiU1KGzbYmVedfHa
         g/HBtOsMQc7Kz/8Nt5hJ7G/uGgkdVzb0FA+JeJVDWPvi9hOTd/N+wPENScjffwz0Ct0y
         BLzldKEwq5I/hxIus8Zoux0OPGkznPEaBV0jfDZOGeGlq/WX2g3KPXHqATvk3W7ctJn2
         qPTifZwVmKGPCm1zLiSus3/5xfQ03BiwPlEpgxB6X+UkyECOD9eC6xVk8vxAZYixFERM
         U03taZ+70Ar1xsVp3edI/uNo7eE2ceFr8hj8P5bFAXgXYkY60zzYfuFZTu91nrK6X+Tw
         wdhQ==
X-Gm-Message-State: AOAM530uNSzLiK6bri+lhekTtFRKDxQ/t0iYxwJ6sSqofA275BTWbI71
	8BdyDfD3XMh+nbxICzZLyMrJ0KLSQCUT5xuoGJs=
X-Google-Smtp-Source: ABdhPJzkL/7/MujyN0UW012r4wZ5fBj1Uyujikuq45a4udSj3IIYt5SYsBHzQuo4XSP4Xs0KxonpEYBkdoFwwZuFoGk=
X-Received: by 2002:a1f:38cb:: with SMTP id f194mr1595060vka.22.1603137365548;
 Mon, 19 Oct 2020 12:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201015054600.24514-1-akuster808@gmail.com> <27107.1602752871157273119@lists.openembedded.org>
 <DB8PR10MB39778008487808091759D8AB92030@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
 <9ea47af9eca270bea1b3e468f530dad782023a44.camel@linuxfoundation.org>
In-Reply-To: <9ea47af9eca270bea1b3e468f530dad782023a44.camel@linuxfoundation.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 19 Oct 2020 12:55:55 -0700
Message-ID: <CAJ86T=WvteSbKp3W5UvEQDVsUDh=SRvq20kP343PLQZMmQV_uA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] busybox: add rev and pgrep
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Andrej Valek <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Diego Sueiro <diego.sueiro@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2020 at 6:25 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2020-10-16 at 16:48 +0000, Andrej Valek wrote:
> > Why are you not enabling these configs correctly via defconfig?
>
> I'd wondered about that. I didn't really want to block the fixes on
> that discussion and am trying to pick the best places for discussion
> but I'd take patches tweaking this.

It would be good to clarify this. At one stage the advice was "the
more fragmented the better". Does that no longer apply?

  https://lists.openembedded.org/g/openembedded-core/topic/72273944#68672
