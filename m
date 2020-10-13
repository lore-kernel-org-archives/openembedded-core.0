Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
 by mx.groups.io with SMTP id smtpd.web11.2901.1602615520378883120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 11:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gjl55P0d;
 spf=pass (domain: gmail.com, ip: 209.85.222.66, mailfrom: andrey.z@gmail.com)
Received: by mail-ua1-f66.google.com with SMTP id j21so306360uak.5
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 11:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OCVVKdaf+23R5O0ak+ldV26M/LaencG+1mk357SoyqU=;
        b=gjl55P0dYOhZlw3fg/mOL0xjXWLoumAxI4DDPLOA/8ETlATIjps4+Hiug3+0R1ec0L
         CS6tfMbyoAHRfE71cwZ0DoPgDAM/1ijUizwh4j00AyIdcXFhzF0KhBYXwcl2hIQqbn/t
         eRp6vTImwoo4Xhh8W2Nm/61sSl+v8Ed/tzUoQ8Erl6zHyxJcQUNgMLHS4IdEC2bvLA3n
         AcTlJKPKy5uCsdMP/UQ7Dc/oBMIsefg9LyL/mfb2891tuDrklygZnWXdvTp0P6d5RovB
         yZPoxD8G7Cs+R7syVTWb9GFHKvetnV/4lfEmenI2fCvzuMmNx6HHQkkFazjAkuGLz3RE
         wGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OCVVKdaf+23R5O0ak+ldV26M/LaencG+1mk357SoyqU=;
        b=XDlvsf1rA+BjvsIr7IRdLEZnKjyAx6ZJgqBJvt2OBFL2EjUYRrNRT4nM9TEMapvELT
         qV3XHVcirl0P5pzgkJvoy4xugC9PgiDW0skBcVYdcSlvtHeiPrJ4mubISUzMFB9bDUy8
         IhBoc+PJYkuEgifSbnYe5Qg8fsOJU7YbEZGtbHm8xVErW4XZ7YuDjOT0R8mSX8HneGON
         nj7LzT1pLZCLX77zmaW4PK2HopZMLCJfz1hsuRi3O1blAlgAtpnsPzKo8NAE6+7NiELf
         mAutnL3tm8JB2z0xy/6YVtJtJPQ8IA5PdMplOp4fuMK34VwVnPpWjLO7FozcLdAfG3Jx
         5SOw==
X-Gm-Message-State: AOAM530PsjbP/aTDYyH3lTKJIXQ/x8iAzOsvOuY1JN2vFNkrrGtWDi/o
	AlxeztYGGge/23mqOo4ECUoHDnI+vtl+MhjQauQEPET0bxG2b/Zs
X-Google-Smtp-Source: ABdhPJw1yyYbtZrYO5oQPQjIoHqa8By8XS9mvcFwbmPRNC//HEdujThiNv7Visu5IFBXptVpRbbSer6GQyrKFSBQoEI=
X-Received: by 2002:ab0:6659:: with SMTP id b25mr1160303uaq.81.1602615519533;
 Tue, 13 Oct 2020 11:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201013173502.2245733-1-quaresma.jose@gmail.com> <20201013173502.2245733-6-quaresma.jose@gmail.com>
In-Reply-To: <20201013173502.2245733-6-quaresma.jose@gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Tue, 13 Oct 2020 20:58:25 +0200
Message-ID: <CAHtQpK5wRtUgWGfc2dmeu5ousr38TTpn8=zc09KGSF6N8Ok0nA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] shaderc: enable only native build as the target is failing
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 13, 2020 at 7:35 PM Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> For now, only the native build its working.
> The target build is failing, when we can build for target
> this commit can be reverted.
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  .../shaderc/{shaderc_2019.0.bb => shaderc-native_2019.0.bb} | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>  rename meta/recipes-graphics/shaderc/{shaderc_2019.0.bb => shaderc-native_2019.0.bb} (86%)
>
> diff --git a/meta/recipes-graphics/shaderc/shaderc_2019.0.bb b/meta/recipes-graphics/shaderc/shaderc-native_2019.0.bb
> similarity index 86%
> rename from meta/recipes-graphics/shaderc/shaderc_2019.0.bb
> rename to meta/recipes-graphics/shaderc/shaderc-native_2019.0.bb
> index ac3db09937..4e095e1243 100644
> --- a/meta/recipes-graphics/shaderc/shaderc_2019.0.bb
> +++ b/meta/recipes-graphics/shaderc/shaderc-native_2019.0.bb
> @@ -33,4 +33,8 @@ do_configure_prepend() {
>  EOF
>  }
>
> -BBCLASSEXTEND = "native nativesdk"
> +# TODO: for now only the native build its working
> +# the target build is failing, when the target builds
> +# we can drop this inherit and rename the receipe.
> +inherit native
> +#BBCLASSEXTEND = "native nativesdk"

Maybe BBCLASSEXTEND = "native" then? Why leave a stale commented code here?

More generic: should the failed target build be investigated further
here? Is there any severe technical problem that should be solved
here?

> --
> 2.28.0
>
>
> 
>


-- 
Regards,
Andrey.
