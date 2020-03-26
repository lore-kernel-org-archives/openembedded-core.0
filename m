Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.39817.1585236742781446710
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 08:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ol1/fVg6;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id 10so5640123qtp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 08:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nsjrzm7qLsoXJyajxF9sNKcT5YwEGVyzgIlXqVfuODE=;
        b=Ol1/fVg6CBPZXj4ghz+q/RY28ksMZ8KkKCO9G2+ZNRuqVW7N5nfZoIxeLCaIcn9y1j
         /Qi9tnMDRT+hH2IuBhlrp0yjUne91jBuyFazR0lVdDM83YPf+CIuDfU5YYMscJzOFs3O
         CiprUvYvHQyngK6gwPsvh9Iv2BSGKOsEwDS1KUYfYFmU+EWDu0m5Oesc9gWnQKoibkDG
         pDEYCIwNdQuMVO0MMrK7k71Hj+4s/9izefi4AzoE12gKQ5bcd6tCY+DLewHWYDD8wWfn
         DoImeBpNupGp2h54QLwP0LYWhe7gZPwEIzwtMTeniCWgEGB5R2i6NnvIaCS0qVkho0Es
         7qzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nsjrzm7qLsoXJyajxF9sNKcT5YwEGVyzgIlXqVfuODE=;
        b=nLqPz1kTdmCfTQocfZZGB8rbJYz1ZYgTy0UKEyT5vyOxqeSSsAzIUcPf7VFuvQ73Wd
         sWjXa6m6mA3+VUQ3JJrC40bAjPWxpFgskakjpXWGKf2GRfelljT8jyVvQ6DtAp9z2VKR
         PFMi1BmCXBD797pYrxD9NrPTWtnNA3fdP2Y7nIT6N9cQbnosLMj+WRqvTCNZuzgzy+op
         ciFXAUXDV47U75gtm6HZOEsZdep0JOhbDu2XANB/Zyxofe8AKlR87D9emCDAeqKQsDGn
         MGl6Rp1g+sU4oK6hW3uDOei8e9V/7yiDHytc3OfKZnOcJ/NfXDo2cMoDUOBCV5cKrH2W
         g+cQ==
X-Gm-Message-State: ANhLgQ1r4zCKv9tSaGocl3ZLQwhcNdeu6Qkofwc9/KTLSzrI+d6QRjlr
	K3l5dTUChKpux4UgxfHJ/I+oCCYDGiEpylH3fWs=
X-Google-Smtp-Source: ADFU+vs38wbeTWH2KoihY9KpK8cxERFeaIO45DvdpyHuRcs5ssof0k0QrAx5tv7P/g9RPr3hEgJDEFrRMe+6BZm+fXc=
X-Received: by 2002:ac8:f4a:: with SMTP id l10mr8949610qtk.146.1585236741561;
 Thu, 26 Mar 2020 08:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200316184859.11635-1-armccurdy@gmail.com> <20200316184859.11635-2-armccurdy@gmail.com>
In-Reply-To: <20200316184859.11635-2-armccurdy@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 26 Mar 2020 08:31:54 -0700
Message-ID: <CAMKF1so2yHpArVTdMFttWHhsKaf4kqiQDLh5O35gpKYiH98xvg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/5] opkg-utils: remove python scripts etc for the class-target only
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Richard

ping on this patch, I am also running into the issue fixed by it.

On Mon, Mar 16, 2020 at 11:49 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> OE's packaging functions assume that the opkg-utils python scipts are
> always provided by opkg-utils-native, so the scripts should be removed
> for class-target only.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
> index eda73db6a4..9315240190 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.2.bb
> @@ -34,13 +34,13 @@ do_install() {
>         if ! ${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'true', 'false', d)}; then
>                 rm -f "${D}${bindir}/update-alternatives"
>         fi
> -
> -    if ! ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
> -        grep -lZ "/usr/bin/env.*python" ${D}${bindir}/* | xargs -0 rm
> -    fi
>  }
>
>  do_install_append_class-target() {
> +       if ! ${@bb.utils.contains('PACKAGECONFIG', 'python', 'true', 'false', d)}; then
> +               grep -lZ "/usr/bin/env.*python" ${D}${bindir}/* | xargs -0 rm
> +       fi
> +
>         if [ -e "${D}${bindir}/update-alternatives" ]; then
>                 sed -i ${D}${bindir}/update-alternatives -e 's,/usr/bin,${bindir},g; s,/usr/lib,${nonarch_libdir},g'
>         fi
> --
> 2.24.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
