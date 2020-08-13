Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.4908.1597300235444567449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 23:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gNpma2jX;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id p25so4378171qkp.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 23:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AjUjn7bRHGQ4+FlAaPylYNf5cdCRqbcjNVo7wz96Xoc=;
        b=gNpma2jXA7K1T8onasiN8loBggTgh7LD2k1NCes+1Ppu/gisCkBgXqVD7CY3/YuQix
         gw2jEnzxgzkW8hKg12ecldlszb1yszdV0qhc8XIBSxPprza4NkuT9iFnQtE0UE8zV0+t
         D0MKM2fjgPVRsG9gPjKGRAfl+Ajo2VQwTzSTppyvwt4X+P861m8yxULCXJVL0qcqbG3S
         p537X3KuIypDs2WwVT4smXrhKPu+/fm7gvvqJSYrqYPuAtPyGkq2fTxQw9t/VLFq8wvA
         FPoYvZq7pZpfkL0gsmxJwpKaQzEFWF4CI7O2Ah0RNJQOm9+dSXRqPB+3XROZq5Xf3FjH
         ll+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AjUjn7bRHGQ4+FlAaPylYNf5cdCRqbcjNVo7wz96Xoc=;
        b=t/6pF/uauI5b9cXfQvNLEZLt02vOUzwD2tLVXfh6LdWAPqN4z3lpiZgjkyURUvGBdo
         hVAK8UP2jqIN+JveHbwkWqgSbs7Ds7gxIn34VEQ/Mw9L4CHw2GO5uKHcU8cogWUraCGh
         jFDAKNRa3/IeB/okUUYk/FoU1WgOYXK+5coWlvIOQNFLQ7z7v2j2dqJXSTXrNx1oxer/
         SQR1nftkRf97aSSefH7Q3fKVM8wRJQzhjENg4RB1WXoRXAsQRUfUYI0rMnF9p+t2+8i0
         xImvvSNk+HLdmKMixkIza58pMurh+NdVhT01Gp31eKBsW5//QgJXphH3wuJYv1YBjI1o
         SybA==
X-Gm-Message-State: AOAM531+n9oJbXuOV/wdB+Nfg8hlv9+eHB3gAfRK08vTmvY1A3YVpe8O
	k/euQ0YlB7kjUuuoh4nKImkoCqTtUW71CxUUvw55f879
X-Google-Smtp-Source: ABdhPJxyAg+sYcqHYf2ZAOqnlnGM27Z4Z2D6GXeRftmZBpgJplJbA4aX8A73uADtbOyKRCYl8eM4gnnJYph/3e7zaNI=
X-Received: by 2002:a37:9d0d:: with SMTP id g13mr3317581qke.165.1597300234562;
 Wed, 12 Aug 2020 23:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200811225759.618503-1-raj.khem@gmail.com> <20200813061410.GA21506@localhost>
In-Reply-To: <20200813061410.GA21506@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 12 Aug 2020 23:30:08 -0700
Message-ID: <CAMKF1so2vAaQw+rubyH+HM1-vokS08xwzVCoMs=q-sCV08MAEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Upgrade to 2.28.4
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 12, 2020 at 11:14 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, Aug 11, 2020 at 03:57:59PM -0700, Khem Raj wrote:
> > backport a patch from master to fix clang11 build error
> >...
>
> Is this related to the upgrade to 2.28.4 ?
>
> The 2.28.4 upgrade should be cherry-picked into dunfell,
> changes required for future LLVM versions not necessarily.
>
> > +Upstream-Status: Backport [https://github.com/WebKit/webkit/commit/c3cf651016e4cdcb4350598d4a586821071f91bf.patch]
> >...
> > + Source/WebCore/style/StyleResolver.cpp | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> >...
>
> Comparing the upstream change with this, it looks incomplete.

it contains whats needed
the part left out is not in 2.28,

>
> cu
> Adrian
