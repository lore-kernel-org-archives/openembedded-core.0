Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.673.1588015822691313856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 12:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MQ8PR0Ii;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id x18so21910794wrq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 12:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xu1FBwaCKvYSGaa/ygRsmnOx3SDa8T3mQA2sbrmZCOs=;
        b=MQ8PR0IiW7pPeW7JSyJw8Eol9JMQb2hQCcX8cy4XNJ+kL2pWVKum9bHZ+TNuJUhm6u
         qqTsEFukVk5oBO7PD1dqXFmAFIJUW/hzBb0pC7SUPvuK0ju7/bI6elyJmQXVJdNrBoJ1
         RcPYeJe3k2Co4mcm2WjbYwOO6ArEaogwPPLHOHwQP9W/+DkYXNnYOxtaXVxIVw4Qe3fz
         FeDbR1n6Sg3UhyKP0R3BNtDUdy0JvYAPSsF1WQOsg2CaZl+5xJzDROdjxq/61TT53C2G
         3FrNevJQWmR/CMi9X7w09APSu68fLqYc7k4+Rs4MnP3gGdp7QD7GbbmXsRL5lLvMbUQt
         aAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xu1FBwaCKvYSGaa/ygRsmnOx3SDa8T3mQA2sbrmZCOs=;
        b=XXZgtqBv9aneOqLvrqzNO3zhIWz4/NeW2mmMZbqMDTqL+Bgs4+7yd8tqUcvhdU+cZ4
         VpbReJHv3ojDNrSVsl/34SpA3BQzNFdRdpqTHtPvwQO4aZzghUeW3MgRzvhlzom4uJLX
         T2fh/79l4PcGgjpbDPXhy0jEuj1nEp41s6ToDDCGSov1fjIRa5pFEnevxzxy/z5ZQ5q8
         bGkzTgSYJ+V1rbKRdZmNS4jmmMzjrVfg0YG4TiK0ozEaG3Lqbh4j0BK81BECVY+wpwh2
         H3SNdnr+K0Ka4si/SqhpMVbSMAUNB0+tieQ1RTpl31cFNDd/j7uzMQ4aBps0YHMMwBKc
         dTzA==
X-Gm-Message-State: AGi0PubF5oDvoOjplNmBGZOQxtNowTISd66V/YuMKR9FdE2CQuehxC53
	4XOaBi+MUZLeViGBqwlPqPjRoKBFmyrQT6SN74o=
X-Google-Smtp-Source: APiQypKgXlAcWy8XCZTA9uEZYbHOqX3uqC8o9r95UegGeRMUA3YtFputVwUL7ZrrwaqMYSpSTAvtn6KRGFq8By8Yx4A=
X-Received: by 2002:a5d:65cb:: with SMTP id e11mr28349765wrw.402.1588015821231;
 Mon, 27 Apr 2020 12:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200427182223.8449-1-alex.kanavin@gmail.com>
In-Reply-To: <20200427182223.8449-1-alex.kanavin@gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 27 Apr 2020 09:30:10 -1000
Message-ID: <CAGDS+nmzf8crNJn=3x9HZGnXH5CHx6oyZ5GxWG3XH7k1jKAvOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildtools-extended-tarball: add libgomp-dev
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Alexander,

Is the patch we discussed on IRC as suitable for dunfell?

Steve

On Mon, Apr 27, 2020 at 8:22 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This is needed in particular for newer versions of rpm
> which would otherwise fail to build due to absence of omp.h header.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
> index e38967af3f..c32d0107c3 100644
> --- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
> @@ -21,6 +21,7 @@ TOOLCHAIN_HOST_TASK += "\
>      nativesdk-gettext \
>      nativesdk-libatomic \
>      nativesdk-libgcc \
> +    nativesdk-libgomp-dev \
>      nativesdk-libstdc++ \
>      nativesdk-libstdc++-dev \
>      nativesdk-libstdc++-staticdev \
> --
> 2.26.1
>
> 
