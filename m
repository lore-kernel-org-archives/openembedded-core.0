Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web11.14133.1594396808852230285
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 09:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GsHTnB71;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id f23so6549948iof.6
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 09:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Egqb4N0Ly6y/QVN9hZ6ME++xYo7XakF+uc4jNWskNuU=;
        b=GsHTnB71ZNqsf2nzRPL7fLgOZdAFrOJ+1yMJrUTCMHo7N68VYWzKNRZkij0jdBzJCK
         LYmC8hHp+OUFJBzCEhn36A/Sm0ba/V4JYtHLxPqWiHYzg5xymurgq/hSZHjBleA07ESy
         D3+2XRD2w7sg8KheVJeIYicgJpr9Txamr++AmtYLUk369v+6KnybB2+rKZLXI3ZA6uPs
         Fz/xxSL/jAPqxtbsTaXk4n2ItuCSEA4uW80RlbHtC5VTxxYHGR+TAoQtBkgvEZ5goPeb
         V6LLVgVjoSqibpxWaLSw7DAkHH0VQKslzHOe2dxPakAsQtwfQaBlRLXEA9y2rZXm5X2e
         KO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Egqb4N0Ly6y/QVN9hZ6ME++xYo7XakF+uc4jNWskNuU=;
        b=Shir1rIoMe75tLSkzo6uMpOvM9Mq18UpP6ZlBix+C6PlYzN+aozhjNgwoyttbRULxK
         UueT7nJUBzvp83yQxlVRVkR8XG02wC3JqMsFg6Gkv25G24/h+NIIwx+3A0aX9uaQyTn9
         SfqdJjdR9tRhcAiSCncjZUCwJdLj+Xh0H5D0eqINfw5M0pOhmZTNtYrcPax6m/wwg6Ud
         2iWnp+UUPsVuGn3d+Vhk/Nkf3DOT0UfGVbSWc8lLW48LUm/C5U03bgOC7cxGAGUC+DXT
         w4Dp102DBLm3uhuekv/Jaqk2uEPTlhDghxTHKukoyuPs8uvuiBo61Skr49FhL8fuUHSV
         W6Ug==
X-Gm-Message-State: AOAM531WtQuoyVjG0o9ivUuC3gXlJIuoIak+KopGy9RkWK+CVS0NWpoc
	TG9PtJUih1eKgxjKaBrTvP26ToyM4I8g+DAD+g9+dFdc
X-Google-Smtp-Source: ABdhPJxoT0bCm82OLFHOBH8sBTi9c/X7odiM/7+xzAaw0tEO8aNRAdgKkuEFT4S0W1N6OBp/iA7i5zsmYYNviQBjCsU=
X-Received: by 2002:a02:ccb3:: with SMTP id t19mr78630371jap.122.1594396806751;
 Fri, 10 Jul 2020 09:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200710152844.12588-1-alex.kiernan@gmail.com> <20200710154626.wuge662btikeyfpd@qschulz>
In-Reply-To: <20200710154626.wuge662btikeyfpd@qschulz>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Fri, 10 Jul 2020 16:59:55 +0100
Message-ID: <CAO5Uq5SEv58-_L-7Bks7uGCDvoEEO2M9fGZ+H9zh5icoXBzg_A@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] u-boot: Upgrade 2020.04 -> 2020.07
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 10, 2020 at 4:46 PM Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
>
> Hi Alex,
>
> On Fri, Jul 10, 2020 at 03:28:44PM +0000, Alex Kiernan wrote:
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
> >  .../u-boot/{u-boot-tools_2020.04.bb => u-boot-tools_2020.07.bb} | 0
> >  .../recipes-bsp/u-boot/{u-boot_2020.04.bb => u-boot_2020.07.bb} | 0
> >  3 files changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-bsp/u-boot/{u-boot-tools_2020.04.bb => u-boot-tools_2020.07.bb} (100%)
> >  rename meta/recipes-bsp/u-boot/{u-boot_2020.04.bb => u-boot_2020.07.bb} (100%)
> >
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
> > index f4790532b4..abd9786c0a 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> > @@ -12,7 +12,7 @@ PE = "1"
> >
> >  # We use the revision in order to avoid having to fetch it from the
> >  # repo during parse
> > -SRCREV = "1079ec0a77c3fda510f07860b2549c47f3a46c21"
> > +SRCREV = "aaab5b273781646d417a6775bddd46f90031ee92"
> >
> >  SRC_URI = "git://git.denx.de/u-boot.git \
> >            "
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2020.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2020.07.bb
> > similarity index 100%
> > rename from meta/recipes-bsp/u-boot/u-boot-tools_2020.04.bb
> > rename to meta/recipes-bsp/u-boot/u-boot-tools_2020.07.bb
> > diff --git a/meta/recipes-bsp/u-boot/u-boot_2020.04.bb b/meta/recipes-bsp/u-boot/u-boot_2020.07.bb
> > similarity index 100%
> > rename from meta/recipes-bsp/u-boot/u-boot_2020.04.bb
> > rename to meta/recipes-bsp/u-boot/u-boot_2020.07.bb
>
> This patch was already sent:
> https://lists.openembedded.org/g/openembedded-core/message/140369?p=,,,20,0,0,0::Created,,u-boot,20,2,0,75342392
>

Sorry, missed it :|

> Though the SRC_REV are different, yours point to the one in the mail I
> linked above.
>

There's the signed tag and the underlying commit - ultimately they're
the same commit.

-- 
Alex Kiernan
