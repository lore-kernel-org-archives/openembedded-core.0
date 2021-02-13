Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.533.1613198073074855227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Feb 2021 22:34:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BAlwVM8+;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id j3so1813062qkk.9
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Feb 2021 22:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SwN/pa+iZVcNyluBnglniu5ZPCFpgoItdqowWJdlG/8=;
        b=BAlwVM8+gWxUUQzR1FIl8t3tYqvoTvx04VYDJ3+dly+LxRl8xrvzJXETNFQpiBrA9t
         e5QtjPR/oDocgLijIFKFSjYMb7Cols7H4gS+EYX6IQbhct50SHYboBNzUKufEql03o5Y
         s4OeZhKFUClXu5mDscDtcM48BImR/nlDboWxZw8nMOMTlmk8rHDGjYvKW588AvUt8hib
         uUA6605bFCStjS9LBKgwfULiK8Twd57fkGRzrx+SI+7yclMklP+YluQ4qBXugRMz87xF
         H80r2eDLjzrh8aXRtk6OFNbG/AgHFv9vnCkJwak6M46AXInFlbcQathNs2Oadmc4JKJK
         gERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SwN/pa+iZVcNyluBnglniu5ZPCFpgoItdqowWJdlG/8=;
        b=ivLiq/0zfHtkUnJIljjBZssq3XECnIy2uZXE0k0TTL3dnRKubso0aVivjUW1pHS51e
         bbaGQdILpQciYTcO1OTKfSR8xAXvLj0nPSorgXGXrYFdgG/ltm1m/CowDB/ol8lZyGTo
         kEeilxY+LhnD821Niws2DFgR9g3HtaNWfMn5zcEGpBl8OvA31yzm8XY0mri3HhN0JYma
         1hrja3eiGHRHX+k8FHdDuujZlWek6EuiqFaWsrpi+Xij9/iD+R04gYiFm8lbV7ChocBL
         QrFWmeVGOD5+gXFftbYwAyEOiEfyuh6vXVGeMiL50YsRey7CmtQLsI/8KxcRm2wRbOmj
         zRVA==
X-Gm-Message-State: AOAM53243DWeAO3cdAOFw7XIZUI7pMW1z8NJSYPCTB51e5YW4JS4s+rF
	ebPdhwVVnUvw36TuEKv2WGyre7eHgb2xPAoObyk=
X-Google-Smtp-Source: ABdhPJypvEgHadp4jFrU5wknonIYt1k6QlGrzZwQaDV+zE/RxHpt5WrVHleCwM9nrERPAvruI7ZDlufyqNmmuwsHVNY=
X-Received: by 2002:a37:b346:: with SMTP id c67mr6092196qkf.212.1613198072162;
 Fri, 12 Feb 2021 22:34:32 -0800 (PST)
MIME-Version: 1.0
References: <20210212014112.2356927-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20210212014112.2356927-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 12 Feb 2021 22:34:06 -0800
Message-ID: <CAMKF1srmtVXrAFDenzxiWmAcuGxXjKoAZrQ8n3qL3mJ6bTzT5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-firmware: update to 20210208
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

seeing license checksum errors
https://errors.yoctoproject.org/Errors/Details/570561/

linux-firmware-20210208: linux-firmware: The LIC_FILES_CHKSUM does not
match for file://WHENCE;md5=03f0fad70b8b557b56084e3090198021
linux-firmware: The new md5 checksum is ef0565762eac313c409567b59dff00b2

On Thu, Feb 11, 2021 at 5:41 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../{linux-firmware_20201218.bb => linux-firmware_20210208.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20201218.bb => linux-firmware_20210208.bb} (99%)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
> similarity index 99%
> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
> index 700a79b118..4a2e30119d 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20201218.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20210208.bb
> @@ -201,7 +201,7 @@ PE = "1"
>
>  SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz"
>
> -SRC_URI[sha256sum] = "a1cc1ff72c739f312b095df589e9fd639fc81c3f8f7966377ea35222dc94c04b"
> +SRC_URI[sha256sum] = "1bcb1a3944c361507754a7d26ccff40ffc28d1fb93bce711d67da26b33e785b7"
>
>  inherit allarch
>
> --
> 2.25.1
>
>
> 
>
