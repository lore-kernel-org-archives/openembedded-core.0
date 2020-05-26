Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web11.46844.1590481909687165922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 01:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nBah1kUD;
 spf=pass (domain: konsulko.com, ip: 209.85.210.67, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f67.google.com with SMTP id 63so15627604oto.8
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 01:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=amBBlTMM2sRB2PnH6M04Dqqid1SR334opKI6yxs1kxI=;
        b=nBah1kUDqX2/9LAkEulbT/YfjLlBxj7BreAEpBqeCFdawW8MhS9C1gd04E6DyKfBhA
         GsmOcboRRiJNNnaiuR6LpniXRfMGBjW7tGDy4BBBRmJQzdmgLEUIiRyWaMUdhqI9yMYl
         CRMcLJCWFkiRimRRDq8C00GdqS4nuaNeV9ANE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=amBBlTMM2sRB2PnH6M04Dqqid1SR334opKI6yxs1kxI=;
        b=TTeOor1MtJ0HfESQCqWj/pqbLqsbl202S5wZHVLFXgY2S8YomV8LmP/ZL6//PGCUwb
         6pRmsBUliNhum9L6p+JXxdtdzOLQPiawHAX4/AgoyahjzntpqJ3MgYeK/16mQwtxmPok
         kLO7s361K+1OnR+woC3Tbs9+N80+BKKDc3ajc0HT1J59EVevwnCGWVtMlQLBejANZM2u
         foBNmc3NcIsP1bO0/s9H8MWqItfyCCjfYv5Xby2YdmLYre4e7yw2PjhxJ2YrRqGEWVSr
         v2det4nofE/UQIVbZld5cOXtymff20wlYAXiwziTc7E5rtHprYy4+oowxZK2tzu0kT6i
         Ws3g==
X-Gm-Message-State: AOAM533/hwjm9sCTnHmAnlq9kX8PZvHQ+mC6Ou37pbsPdhYyhRR0L4sv
	RHFdeFRMgVnW2V4J+dW3RidXVtUCn16df7V85cmqGaEE
X-Google-Smtp-Source: ABdhPJzcVvEoReaeEGaceU5hPlOc91mZvZUHpkVTxxbmOJJwfZW+PyYHmyUsPpZNm1KPHIzgD7ao6VELcC3re8SqRGw=
X-Received: by 2002:a9d:4d07:: with SMTP id n7mr85613otf.92.1590481908881;
 Tue, 26 May 2020 01:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590445868.git.steve@sakoman.com> <c93720849b68369f9c01c620581226dbfe200303.1590445868.git.steve@sakoman.com>
In-Reply-To: <c93720849b68369f9c01c620581226dbfe200303.1590445868.git.steve@sakoman.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 26 May 2020 09:31:38 +0100
Message-ID: <CAM9ZRVuF0qqniEnBW1eCiTuwbaPEh5BdvB74Ds_1084DQ8MXZQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 14/17] newlib: Upgrade to latest yearly release 3.3.0
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 May 2020 at 23:37, Steve Sakoman <steve@sakoman.com> wrote:
>
> From: Alejandro Hernandez <alejandro@enedino.org>
>
> Upgrade to the latest snapshot, also drop md5sum while were at it.
>
> (From OE-Core rev: d73aa359e42e707dbc7cfa29c55a2fc8e6bb938a)
>
> Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
> Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../newlib/{libgloss_3.2.0.bb => libgloss_3.3.0.bb}            | 0
>  meta/recipes-core/newlib/newlib.inc                            | 3 +--
>  meta/recipes-core/newlib/{newlib_3.2.0.bb => newlib_3.3.0.bb}  | 0
>  3 files changed, 1 insertion(+), 2 deletions(-)
>  rename meta/recipes-core/newlib/{libgloss_3.2.0.bb => libgloss_3.3.0.bb} (100%)
>  rename meta/recipes-core/newlib/{newlib_3.2.0.bb => newlib_3.3.0.bb} (100%)
>
> diff --git a/meta/recipes-core/newlib/libgloss_3.2.0.bb b/meta/recipes-core/newlib/libgloss_3.3.0.bb
> similarity index 100%
> rename from meta/recipes-core/newlib/libgloss_3.2.0.bb
> rename to meta/recipes-core/newlib/libgloss_3.3.0.bb
> diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
> index 5edea8aba1..96e230f985 100644
> --- a/meta/recipes-core/newlib/newlib.inc
> +++ b/meta/recipes-core/newlib/newlib.inc
> @@ -16,8 +16,7 @@ LIC_FILES_CHKSUM = " \
>                 "
>
>  SRC_URI = "https://sourceware.org/pub/newlib/newlib-${PV}.tar.gz"
> -SRC_URI[md5sum] = "afb3a01c8c82b6717ea55659a4de30ec"
> -SRC_URI[sha256sum] = "f7b2322964a1e3b37bec0768da20f50dfb62247d729110974dd95756a53bb6d4"
> +SRC_URI[sha256sum] = "58dd9e3eaedf519360d92d84205c3deef0b3fc286685d1c562e245914ef72c66"
>
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS = "virtual/${TARGET_PREFIX}gcc"
> diff --git a/meta/recipes-core/newlib/newlib_3.2.0.bb b/meta/recipes-core/newlib/newlib_3.3.0.bb
> similarity index 100%
> rename from meta/recipes-core/newlib/newlib_3.2.0.bb
> rename to meta/recipes-core/newlib/newlib_3.3.0.bb
> --
> 2.17.1

NACK: https://lists.openembedded.org/g/openembedded-core/message/137847


--
Paul Barker
Konsulko Group
