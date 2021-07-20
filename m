Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.1142.1626739563258909705
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jul 2021 17:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=BjrU/vVP;
 spf=pass (domain: burtonini.com, ip: 209.85.128.46, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f46.google.com with SMTP id w13so11303667wmc.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jul 2021 17:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ho1kJLQKstBp9gICs7cxnckK0DFmMuCGaYUeCgITS/M=;
        b=BjrU/vVPQADKINsHPBS3cjDiAn6RB9oXEBqoyJFkMuLkFTiiqxJ4xoQlyQQw1GvltO
         6oNBnLwimvPqg4Wu/eIuUxxRD8g9x/15X0t+JVwPMWvuy+/501Td3DnOKDtnJdzJYQTl
         Kq4QJTqp0weKAE8jriZ+DuU+66OhwgaXf99BD6QUxhSxfJVsLQO0BwIQckARhuk8sv4j
         Cqz1b96Th1/KDGpYmSgB/bRKkWFZzBST7wWEABcGcPGiB11FqbUCHgFjQDnAF0cJaK/o
         CkLJm2pSElOGeT39h4iZ2f69aUslJPKzXw9+o0GYH0jMQTREbmEEXhkZ39H7xtyoc/vp
         UFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ho1kJLQKstBp9gICs7cxnckK0DFmMuCGaYUeCgITS/M=;
        b=Q/6zzguz8TzkPLu4r3GL0wgBtdpM/s+IKAsBoAtPJWwc4cl/FHbDb5neca5WmVDqBY
         /9slAQLrBMqvmgZi30+85kll58/oFN9mTi99iiYy7N7y9F2vcrh2ZB99mw8W08PS5X1R
         Hw1JsQZekLzhR8w2wNPdGke9z/NjqzRz4lu5+3zRojldc63LUjyCdfUJTnkR0WHYowb9
         m/jHn5T42IeZG65vO7T8vMEJy1K2vBeNIkg9vmsRLgKoINhVJrGfMKcgH4J3jouqTSHz
         A15v1kvtkBmKobs8YxWLMgW/cG2G+9bpzwaeM1jPxf1JADrrM43LgM60pfc5ZTi46JOV
         2Jmg==
X-Gm-Message-State: AOAM533s/i8+6OJ2s+s9EcI25gIx4COy3/tCsswBjETPVTCLnLwlAbbl
	1ylmhwG1zbE2qyzNav64UnSSWvEw2+RHcBORlDM1dQ==
X-Google-Smtp-Source: ABdhPJyO76WNvNnj/d1J2w3SRP8EP4U+6gKn2TKnay17CBwNuS1oofqIDo0AxnudVyNUP/UyqT6n4/dDTzv2hqbCHmc=
X-Received: by 2002:a05:600c:1d04:: with SMTP id l4mr21295683wms.130.1626739561625;
 Mon, 19 Jul 2021 17:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <6d41368-58fa-56e-63c5-7d445550a928@crashcourse.ca>
In-Reply-To: <6d41368-58fa-56e-63c5-7d445550a928@crashcourse.ca>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 20 Jul 2021 01:05:51 +0100
Message-ID: <CAAnfSTv+ig=Fzi6hWXGHV7vOFsAB7wX8bnAjTJvPr15z+6zkPw@mail.gmail.com>
Subject: Re: [OE-core] how to configure an image with *full* debugging info in the libs and binaries?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Jul 2021 at 20:10, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>   colleague just asked me what it would take to generate an image
> where the executables and libraries contain all the gdb-related
> debugging info in the same files (that is, not broken out in the
> .debug directories).
>
>   i pointed out that this would increase the size of the installable
> target image substantially but, apparently, that is of no concern.

This is where I have to ask "why?".  All known debugging tools can
handle split-out debuginfo, and getting them all installed into an
image is as simple as IMAGE_FEATURES += dbg-pkgs, as Khem says.

Ross
