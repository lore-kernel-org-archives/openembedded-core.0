Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.31340.1599599367964520794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 14:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V5CjDCrd;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id d20so521503qka.5
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2020 14:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FsPK6Umil1COORSAC0iw2jjgcCGNvIyxFn7HJQDbBII=;
        b=V5CjDCrdQmbQD159R8iHZSA91buPiGOtNBYhZOJyNDgTgAkb2IGkCxOFCu9ZwuiZxR
         OlfpiCZMDg1tgr2dDzilj5aid2mL2S7ovYLwKD3VnZB+X1blZMPLgykHuXUnr6GcZjBG
         QIPIknagT645XJXX6/r9HBnzKhh5xp3PCr41fs2OPGX1w0LI1i/hDvWX7bVT9qjv+I5W
         2e+6g/fRZnJS6uJxVVeaCGyVHpV2TbuNA4wxv26t4qV1wT/ohEcmVSpoXTPPNKWBQo67
         NsjfXfKCND/KceNlZ+C/l0vCXN2eHaDmCL/zk9UxtN6ul5y2MmadcfwiH0YlWDoP0UsJ
         eSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FsPK6Umil1COORSAC0iw2jjgcCGNvIyxFn7HJQDbBII=;
        b=QB5bXUuM2eP919OaHQ5U/VnvJoaZa1t0HterD2y/SVXtrB5zYvluE/cwntXCa6lXvD
         ST/D+PjjpZIqvVuI0vOHk8+6dz8x3BUmhEGkKAIwRXJfYq8LC9c9e81XyoDC9fXqLBEx
         PkHNLVCAlQHN+3+xmTq+gbFDx15XUnB/OaZSUA3taXBvqbqQw80YYRokOYEWJTSuA/HB
         DP+IIPzzeQnihxEeMhfwAwBpiJr9SwAHMFNKZ1uZoZ9trrI10VKiXatsZyYCpkNKOZhf
         rYmclxLrxEP7CO+EEprBDzFidfIZqJCCa2ud8FI6lQ30BGuyQ/hHm27+ZMFoKHpNDBDG
         kMWQ==
X-Gm-Message-State: AOAM531ehwH6MHQiAC3QbQjZg0F0kykY15ZAu+yGby/kfQ5ZP4/j4oLK
	zl2XoLkY9DHWvzzpIH8SHbJcVrXbVJzUzfPK/Fs=
X-Google-Smtp-Source: ABdhPJzcdCDHsQRWmmujsqTcXbdFsfDpeSu/m0K8Zp6EGsIP094zbzXRoJMRF/vvFaIxzliTmNp1QkftFIBWOTIHo9U=
X-Received: by 2002:a05:620a:7f6:: with SMTP id k22mr462129qkk.337.1599599366891;
 Tue, 08 Sep 2020 14:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200908065723.39858-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20200908065723.39858-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 8 Sep 2020 14:09:01 -0700
Message-ID: <CAMKF1sr5DPAvA-=DHswiwsa_sps9H_XfrKnRwLOHXbHJM=_GTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ell: updte to 0.33
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 7, 2020 at 11:57 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Changelog
> - Fix issue with uintset and number of bytes copied.
> - Fix issue with overflow in DHCP lease T2 computation.
> - Fix issue with side channel leak in l_ecc_scalar_new.
> - Fix issue with missing MSG_MORE in l_cipher_set_iv.
> - Add support for DHCP v6 client implementation.
>

I think it has obsoleted certain symbols which are used by iwd e.g.
https://errors.yoctoproject.org/Errors/Details/498748/
https://errors.yoctoproject.org/Errors/Details/498747/

here is the patch which is doing it in ell
https://lists.01.org/hyperkitty/list/ell@lists.01.org/message/KQLABKGASRCRWEXKJBDWJV5IXLL4CJ5X/

For now I have sent a patch to upgrade iwd to 1.9 and hope that fixes it

> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta/recipes-core/ell/{ell_0.32.bb => ell_0.33.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/ell/{ell_0.32.bb => ell_0.33.bb} (89%)
>
> diff --git a/meta/recipes-core/ell/ell_0.32.bb b/meta/recipes-core/ell/ell_0.33.bb
> similarity index 89%
> rename from meta/recipes-core/ell/ell_0.32.bb
> rename to meta/recipes-core/ell/ell_0.33.bb
> index 07dc4d4cbb..2fa05104fb 100644
> --- a/meta/recipes-core/ell/ell_0.32.bb
> +++ b/meta/recipes-core/ell/ell_0.33.bb
> @@ -14,7 +14,7 @@ DEPENDS = "dbus"
>  inherit autotools pkgconfig
>
>  SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "42fdb9e24ff561a101389d51445cab1ff7d55f5385dc22a05b0493088cf99e30"
> +SRC_URI[sha256sum] = "d9e40e641164150394b74b719b9726fc734f24b2cde679cf5f3be6915c34eded"
>
>  do_configure_prepend () {
>      mkdir -p ${S}/build-aux
> --
> 2.25.1
>
> 
