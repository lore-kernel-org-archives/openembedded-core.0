Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.163.1615923468683531297
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 12:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=NzuBOety;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.41, mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f41.google.com with SMTP id ox4so58498475ejb.11
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 12:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KmZfiGyvK2kzl5U46hVCDJkAr0s2z2ZyiLFxyJjxtW4=;
        b=NzuBOety7EJRLHpoMOIBF4c0GC/GG09QjLfRefT+5DFUoziVJZ8XDR6KyBFY2SGweF
         AnqCqPcFfLgvZUBoxzY7A0kTCXlBTBeVelcMTZ2sc8Dq/gsIj9CiQDB53DRzhTqzqgLm
         J4IdQjCL17acpNMAdIYwmRQJ9RiC5Wd8KQAx5Erf4IubXq6p79MIvP1QTjTY1kBD2Ol6
         XdCYc0MN7y5UIMXed/qiyTpNX0ABwLE8iBtg8VfXgHWY7psSiKz9yV90QEiv+pzAf8P4
         fbk8S5iIReRA4JpFfBWRURRuDYD4/DnvKekzGBbllmCBWy4QUvpEI0UxuK2bMlGuN4Tz
         1AUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KmZfiGyvK2kzl5U46hVCDJkAr0s2z2ZyiLFxyJjxtW4=;
        b=pTHmGvDqIN9H/VO9erA/VwzijS+hEN1hyFimWyveW92ysxWrpa5vt2KskXT1544fpc
         BqdFDVB7terwJGIh2NMP7QdPEtWCQfeMxduyO7KIQTnY620PM+vIGLV0ZVbiItwxUafH
         4uLvC3l4T1W1oMkMRDdoRy/H8kQPIF0HC6UabnpE9Z9jKj6MzjHeOwERhDM0Ys19egWv
         OKtm0md0Gnhr4OrNl7RS3gaYOeLU9iiD5aYIWUDE6qf9DyOuZtSUISYy0+xftmuUQBTI
         OVr4eOpe59x6pptxLbCs+51ukmj0+XQJnS1YK9hRncPw+i++lDNRy0iDwpz9pfMaFU6E
         zGaw==
X-Gm-Message-State: AOAM530bQIbDb4azPgcZsojKkI6hWUwV9IL6iniZ2g5MOpNgIlhm482V
	gAs6ge/b2krK7yKJiocjVyAecqDjQiIg9s92k7CYrw==
X-Google-Smtp-Source: ABdhPJwltNJcM2oLDprw4QzbAmzPfi7oTVuGJIvRthf27YwO3aa7ha1mEI5W61dWt3+0WIhnhfSMWhkbgWVeStn2IH4=
X-Received: by 2002:a17:906:3b48:: with SMTP id h8mr31349808ejf.261.1615923467229;
 Tue, 16 Mar 2021 12:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210307151906.30887-1-brgl@bgdev.pl>
In-Reply-To: <20210307151906.30887-1-brgl@bgdev.pl>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Tue, 16 Mar 2021 20:37:36 +0100
Message-ID: <CAMRc=MdpjNdsw=mZssZARtRhhYYBRy9aNt4rh532pGxc3Ja5Nw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3: make pydoc rdepend on python3-io
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 7, 2021 at 4:19 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> pydoc needs tempfile (provided by python3-io) to work. Add python3-io
> to its RDEPENDS.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  meta/recipes-devtools/python/python3_3.9.2.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/python/python3_3.9.2.bb b/meta/recipes-devtools/python/python3_3.9.2.bb
> index af1843a180..c5e47eec4f 100644
> --- a/meta/recipes-devtools/python/python3_3.9.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.9.2.bb
> @@ -371,6 +371,7 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
>  RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
>  RDEPENDS_${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter tcl', '', d)}"
>  RDEPENDS_${PN}-dev = ""
> +RDEPENDS_${PN}-pydoc += "${PN}-io"
>
>  RDEPENDS_${PN}-tests_append_class-target = " ${MLPREFIX}bash"
>  RDEPENDS_${PN}-tests_append_class-nativesdk = " ${MLPREFIX}bash"
> --
> 2.30.1
>

Gentle ping.

Bartosz
