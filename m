Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web12.53303.1606230982620629780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2020 07:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Nw/UauU6;
 spf=pass (domain: konsulko.com, ip: 209.85.167.194, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f194.google.com with SMTP id c80so24147233oib.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2020 07:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=Vd94qy9BkIvGgyUSOby0XuwaCPDRB4xlkbUvDboZsWc=;
        b=Nw/UauU6JyFekXHGRPi3N2jKCPXM5lEZbH5sEt3fR51UDeeGPOc4SzZqzA+UsK5SHf
         52EEfWDpW2/FsLoxHWRZtU/96SGMwfeUKImUaT15A1xLosGtOOarvVWAYSeo0AXyRE6d
         bZ1cO+ZGsS/had4om0+v9CRwC4RjnBe7VHYzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=Vd94qy9BkIvGgyUSOby0XuwaCPDRB4xlkbUvDboZsWc=;
        b=sJCs5PMFJTG9UdbAml3jl7pWJRLkN7454F8OUrN8w2VYfzcEkmNDY2i3hX/1WZuSK+
         bOSL66D43jE9HmeMnfQHzFNiOFmcFKXFYnVws/pTsiuAcWSblrZQjS+7vaUaJyrDTFxU
         hZvbu7W6N1781OXY7xD2Fzp2U3FXw9IyuefEgXIylFb+MKByL52qxGkDpQT0RqgN1ba2
         HR7W7JRy7terzsFZZza4HpthrSQlL+SVmXx/TiE0NUc046OtfGT3MbPyN5140RWVM45Q
         JJduai1lZqPH3aGJtvoYQCEE50CikTfNh7oHBRfrOJ5awv0FmcCCu2NO4+pI/vj1/lp1
         nzLQ==
X-Gm-Message-State: AOAM532cmSazQ1PKpMiP2jWSpoRLpKQrsh/WjuM4mN8jVCCqyALwCjGZ
	BYpSm3ODoBnZyWrf/N/kyKQePumIPHgDlLeOHTEm6b+j5BE=
X-Google-Smtp-Source: ABdhPJwjOx9bX6ztfWIHiWsWdXrtnWYEjYtLcfRLeFRPDd6t8U2dxihoL+7xR6y8d37weUyH1RarbQcq5GYwQLNMcb8=
X-Received: by 2002:aca:b288:: with SMTP id b130mr2877344oif.152.1606230981786;
 Tue, 24 Nov 2020 07:16:21 -0800 (PST)
MIME-Version: 1.0
References: <20201124151358.30845-1-pbarker@konsulko.com>
In-Reply-To: <20201124151358.30845-1-pbarker@konsulko.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 24 Nov 2020 15:16:11 +0000
Message-ID: <CAM9ZRVvOStJfDLQq4qjMGHUf7DS_ZQXHrsM2OTEF50R2HaRrsg@mail.gmail.com>
Subject: Re: [PATCH 1/2] poky.conf: Add opensuseleap-15.2 and fedora-33 to tested distros
To: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2020 at 15:14, Paul Barker <pbarker@konsulko.com> wrote:
>
> The autobuilder contains workers for both of these distros.
>
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  meta-poky/conf/distro/poky.conf | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
> index 31dc110bf6..bdf46f4038 100644
> --- a/meta-poky/conf/distro/poky.conf
> +++ b/meta-poky/conf/distro/poky.conf
> @@ -52,12 +52,14 @@ SANITY_TESTED_DISTROS ?= " \
>              fedora-30 \n \
>              fedora-31 \n \
>              fedora-32 \n \
> +            fedora-33 \n \
>              centos-7 \n \
>              centos-8 \n \
>              debian-8 \n \
>              debian-9 \n \
>              debian-10 \n \
>              opensuseleap-15.1 \n \
> +            opensuseleap-15.2 \n \
>              "
>  # add poky sanity bbclass
>  INHERIT += "poky-sanity"
> --
> 2.26.2
>

Sorry, wrong mailing list.

-- 
Paul Barker
Konsulko Group
