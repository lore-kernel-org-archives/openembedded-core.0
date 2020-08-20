Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web11.114396.1597941251358335187
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 09:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ctLZNDFM;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id j188so1409605vsd.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2020 09:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wzD0ccBYgdMeqtC/Ae4xpRSynGyUvlnY+XXsMKWj9ww=;
        b=ctLZNDFMu2N+/DqxeSFd3agrwDiPtS4csAEBVWL1iesQIwBAc5jVXShlhU0UliKc6t
         GMaKk3K0UkVusg9jXklWbkfmQC+sjnGVD6RYwvDzUqWnkGfEotTyBM7H+ntK3TdQK/bT
         VraEMwuLKKK9bik75Ckpccg3tsdfNOOPNkjkibCcsnum2y6+EljfDA5Qsv5ZZE6o6x1H
         JGJM4rGqLGX1JUzpsVgHPXX8sv9s7Zmmq//ufRotMTrvA+3XrmN3VdT44hPXtzln9ofT
         3acYaHejF50tcAhmm2i/TKESkplcRWjaJ4JdclFnkoAtpq3HYfQzCijjjYeGpraG8F2i
         yP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wzD0ccBYgdMeqtC/Ae4xpRSynGyUvlnY+XXsMKWj9ww=;
        b=DwVje3v69dL7izQ4CvBGlYA6DTp+rPDhOhKEmnINUKdE8eXOEYB2r6f9Rk/tnNn1j3
         oSuT6XdA7DwFXMbopDE+OLy3ILPwrcxbUvQsRCQJYHPcofjKT7I0ROTnPYEU2kLKbCwW
         Wjp5guU6fUJabRrAUsGlM079E0ypRFm8V7+Gf1Blk1Rl+59i2spxPUm/S1B6jW5JIin9
         gZ+uYx9+KZrgdWZXLnvpJEbLzllY2gRxvbJdepGvcnbfvIu8apQHJxPn3MZyq2n9+T3G
         QYgtmMSaINwqPqr2zEYLtuu3EOayrADdzKqrGABWxWeQS+lI+IGQR1aJ3vZP2R4zV2bH
         HOgg==
X-Gm-Message-State: AOAM530W+HYhl8hgOXSnKZn+Qbi9xRBv6QdFLiq36zWHP9M/AEFvRxJZ
	4/U5ymn/qtc+YcQ7hmeiTrrUjZDkYsQDivFZU+U=
X-Google-Smtp-Source: ABdhPJyLObTvJHOdjqFtrsHPoRtWRl1P5qVap/1t7TzNb/CXdA7oZwgOpJlnz9++HhYKTzZlA6/94yzRzQcr6OgT9Mo=
X-Received: by 2002:a67:7c97:: with SMTP id x145mr2778704vsc.222.1597941250420;
 Thu, 20 Aug 2020 09:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200820155130.8397-1-bjarne_michelsen@hotmail.com>
In-Reply-To: <20200820155130.8397-1-bjarne_michelsen@hotmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 20 Aug 2020 09:33:58 -0700
Message-ID: <CAJ86T=V1-iKq6vcwEPqT5s2OK4L-DMhXAn05ECn1aWV7=FxZ1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] asio: extend recipe to add native support
To: bjarne_michelsen@hotmail.com
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 20, 2020 at 8:51 AM Bjarne Michelsen via
lists.openembedded.org
<bjarne_michelsen=hotmail.com@lists.openembedded.org> wrote:
>
> Allows usage of asio for native packages

Comment should explain why.

> Signed-off-by: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
> ---
>  meta-oe/recipes-support/asio/asio_1.16.1.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-support/asio/asio_1.16.1.bb b/meta-oe/recipes-support/asio/asio_1.16.1.bb
> index f381d12fb..dfc3b798d 100644
> --- a/meta-oe/recipes-support/asio/asio_1.16.1.bb
> +++ b/meta-oe/recipes-support/asio/asio_1.16.1.bb
> @@ -25,3 +25,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/asio/${BP}.tar.bz2"
>  PACKAGECONFIG ??= "boost"
>
>  PACKAGECONFIG[boost] = "--with-boost,--without-boost,boost"
> +
> +BBCLASSEXTEND += "native nativesdk"

By convention BBCLASSEXTEND should go at the end of the recipe and
assignment should be = rather than +=.

> +
> +EXTRA_OECONF_class-native += "--with-boost=${STAGING_LIBDIR_NATIVE}"

Don't use += with an override. It doesn't do what you expect.

If you want to append to a variable under the control of an override
then use _append.

> --
> 2.25.1
>
> 
