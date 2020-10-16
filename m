Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.9077.1602829696309114410
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 23:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nR3SfDMC;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id ev17so644696qvb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 23:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Psor/7lGzZTH/k//U+mf85snCCLdKj+l4bvuYYd6Rk=;
        b=nR3SfDMCIP1u3s/abyKhr2kGftFtHPiyT4Gnvdy8I5RlP8g7RGHbhfl1Z3IjHAZ+Np
         liH04Xh0dIxWU5D7C/UNRF6yeejEF9+AjZY4brqoLCkrI31uP0nyLBn+x6ogQgMFhhSF
         hYDF0KiC1Wvi38OUV1HAOeJGW4lNO1GDlpBt0Jxo+1M+densXsBV7Jnowpy4og62/TSr
         t5Chf6Mb3TfsBSJKpys7LyF9EgBPqcjjfKCuwBxMLFHiaqVtv22KKJmZ8hcRJXDaYvu5
         OpUbmV1eqW89AoUCopmW79mAigpmGbWFTD66TkxF1MJjHR425C9QPjdfO9zE3pupes8+
         sWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Psor/7lGzZTH/k//U+mf85snCCLdKj+l4bvuYYd6Rk=;
        b=Iuk+5ECsF3atNqkZegTMwd4KtADRmQ7QDG6SpxY/nbYCrJr3B1yCQTFDs1iTxayWdW
         ePAATyKAvmne6q6zWEXAEAgPjzwPRS5Pe0BgGni8Ro7CpotLl73aML0nOVvCkqg2wyqS
         pPHBmfA3tLqHerMyOtsIlVx+IZcSmmCjoWtjS0oVDHfJNxbIvhCBzZIAWjyY4vtn0+0X
         qkebCkUCjLAHK8BQB1DYzMgXZPGjp3BRgbo/EonZeRNHhXU+z7vcjWk8U+jdijogNzj+
         lYAuEMHR9GcCSznuGnXLihyeymyb5zYd+iOmTbJHX0fnP8OLEtSv/PtpmW1OE9BXQJSs
         pMxg==
X-Gm-Message-State: AOAM532NoZx/1ta+p4cb6EcxyRC8jG+IaJC9lXrwdnzM/pZ/FQSr6Tie
	T+IxhtOU1d7dwkD/9WApWbvq5in2n1lW64c41hU=
X-Google-Smtp-Source: ABdhPJydkYpiT3hvJ1Z6A2qXfNPNPQ982Fvl4y49M8sEEPBlrk17NCrYaro2mAbY/5VqJRUdMtaZHn8Uc1H7VjjHaYo=
X-Received: by 2002:a0c:b65b:: with SMTP id q27mr2520042qvf.8.1602829695334;
 Thu, 15 Oct 2020 23:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWTT+EjGhk_XN-ErdXmXJeZvFfje=rL7+O84HtmvC0uJsA@mail.gmail.com>
In-Reply-To: <CAA=hcWTT+EjGhk_XN-ErdXmXJeZvFfje=rL7+O84HtmvC0uJsA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 15 Oct 2020 23:27:49 -0700
Message-ID: <CAMKF1srurSsrbwJMAzTTRNEYX0eqPmCQn8t1u8kHbXkMz878=A@mail.gmail.com>
Subject: Re: [OE-core] Where to download zeus 0011-linux-user-remove-host-stime-syscall.patch?
To: JH <jupiter.hce@gmail.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

ubuntu 20.04 is not a supported host for zeus see
https://www.yoctoproject.org/docs/3.0/ref-manual/ref-manual.html#detailed-supported-distros
so perhaps you might want to use a supported host e.g. 18.04 or 19.04

On Thu, Oct 15, 2020 at 8:32 PM JH <jupiter.hce@gmail.com> wrote:
>
> My apology if I posted duplicated messages, I don't know what's wrong
> with the gmail, send emails could not find in Sent Mail folder.
>
> I failed to run zeus on Ubuntu20.04:
>
> -- x86_64-linux/qemu-native/4.1.0-r0/qemu-4.1.0/linux-user/syscall.c:7657:
> undefined reference to `stime'
>
> Googling to find a 0011-linux-user-remove-host-stime-syscall.patch is
> needed, I am not in the position to update from zeus to new versions,
> a quick fix is to apply the patch.
>
> Thank you and appreciate it.
>
> Kind regards,
>
> jupiter
>
> 
>
