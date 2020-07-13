Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web10.8578.1594680756698160265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 15:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oHMhD5Zo;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id k7so4780192uan.13
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 15:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mx8/QsN02u3hs9+R/Gy0sUy6KEKy5S3geersU5UJNAw=;
        b=oHMhD5ZovodGPHfJBrBQvakfBLpgYehOg6Bb4xTH3EMnRcGP+QOms1J/wfC/Vqxd9U
         7nCKOTmErzihV143ywJ8zGVRX2nt7ujYL8jCd1PtcEf9lYqOHv2mus54h+8htJYSUwLP
         cm2GdT71p58nPEYJKNbeZGdLwZ5MCz6gaPaMsFm7j/sCK12BmJn+ge15bB10MjvJsoVp
         q12CIGxY4S2U/JPFSz7ddfIw/alKDPmdeh3qPkAtI2FNwiWEIZXpUch8s91XyX7ccYY3
         u5ICjwB63ZLj9cgI7wqqrazP2qbpCGTBO5/Kh5CwRI2lhzBjRjRPkR6bGcQV7w7MdzHu
         8nKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mx8/QsN02u3hs9+R/Gy0sUy6KEKy5S3geersU5UJNAw=;
        b=QcPQ8u/G+cu+DrtLR3HduXDu4ImjzWqW9B2Zr1s77i5fc+WVaMB92Yn+grV9WaOSXf
         TF4HMEKJbW//r/SFpug6OS+8MMlbSZMXyc8pAFveXSdMh3+k19uFtjUSvpCe1G5s312K
         uuMo9h7KNVByS3/Dzqgjd+Cp9GvTDjooJntQ/kVD6bNHY91HF2gJqiek3sqQJ1fSs6IM
         FdY1KqhTQjMPYP8J6y3MWxP1KW5q/sOwV/IysLSdZ3b65QE/BK8YqXpIRH5FupVuybLs
         l3ae61EaQxFnrm0uhOnhVu5fmm8v5SIFgnEkcIADYDZVinRpWaX3TamD1rYfnR0rvRiL
         IJWA==
X-Gm-Message-State: AOAM533CMpDDIPNhyHoQju4f+Xq+fzlnrA1Zj/Gyvuy9bGqe7xlh60bB
	0u5mU7Pv2gUbSBApIN5818eEnzM1aFWGUFbQpDU=
X-Google-Smtp-Source: ABdhPJxKtyEK67qns6tKiVuLaAZqeYGeQ7eovkfz6XpTXSq/HgRXIvoiJ9RHfvQk2DvQZAuoujsPYfJxwSX2FNXEm4I=
X-Received: by 2002:ab0:280b:: with SMTP id w11mr1382865uap.81.1594680755836;
 Mon, 13 Jul 2020 15:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594649587.git.steve@sakoman.com> <ad44aab08c0c204923d44aa37c39559a7bd843c0.1594649587.git.steve@sakoman.com>
 <92cf9c7e6eaec95059019b461becd588b2b93dbf.camel@gmail.com>
In-Reply-To: <92cf9c7e6eaec95059019b461becd588b2b93dbf.camel@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 13 Jul 2020 15:52:24 -0700
Message-ID: <CAJ86T=U0g8m2aeGiTJKzjmVx_zbGLsjXrS=TqDgDfy4MGYbDSA@mail.gmail.com>
Subject: Re: [OE-core][dunfell 08/15] kernel.bbclass: make dependency on lzop-native conditional
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 13, 2020 at 2:30 PM Max Krummenacher <max.oss.09@gmail.com> wrote:
>
> Hi
>
> Can we drop this one from the backports?
>
> The patch possibly reduces a bit of build time if lzop-native is not used
> by any other recipe, but does not fix anything.
>
> One can build a zImage which is compressed with lzo. For a kernel recipe which
> does use a zImage with lzo and relies on the kernel.bbclass to add a depend on
> lzop-native the build breaks.

If the dependency is there to support compression of the kernel rather
than decompression of the initramfs image then this change should be
reverted in master too.
