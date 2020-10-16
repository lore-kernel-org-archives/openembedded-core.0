Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web10.11324.1602839337994375210
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 02:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=l86roEh4;
 spf=pass (domain: burtonini.com, ip: 209.85.208.193, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f193.google.com with SMTP id f21so1648519ljh.7
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 02:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pp5ceQ97CrPSjb3SEKSmlsh3/sf+xJJCqlBA6LFbFec=;
        b=l86roEh4D2o+ViXCPI2w9ptMy2EgeDYN1/RYY691YTqUhVhTWC2txrP/c5aDtdc1Do
         keMVc0IGBwvm4f5USwPLV4iXeYwXUme/tpfotSsNffpnUppP6Nu8RX/rWuLt/smpGwjz
         3FYouNSDCKHRegODJwj54sNI2A4h8DcRhnEmBU7qAB05cOI2E8VWBX58U5uDtxt+wr1e
         rvkI81wuaJHM0AzSreI4ziLKd50nR3/KMPvrofqzusDcInJzgzXGHh4/eoAp2Hwqrh26
         bFpNEy+EDAs/kY3dYz3NsWgfbywE3ht84Xz06UyN5cmwMTuiBsZ9/hFcm83E+hG3RRdz
         TBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pp5ceQ97CrPSjb3SEKSmlsh3/sf+xJJCqlBA6LFbFec=;
        b=eHZHxDpVJKa3PUwG4m/j3gGmJUsMoP8/5nyF4gk4inBjGrEA8XGXTGexySlBN5wG2v
         vU7+NtR93ebmnfEVQwIaXxfkpPXSQA6FbsamIGUh5ZQ8/z00wYrEHL2GViDWNW4DBIRC
         d+ACXU3II4Q32WkKrXsJ0aRMpvkhR2DGFyDDhHJza8Ya+7vOXJ60nPqfYFQ+IfVHp+4G
         T06tGpr9QUYnrb0UeOCAgcY/a+m++5Y3z6kM5r7sJHFgLoQhskiXnho29eRuzMUrg/Oe
         25FmUlB2PzCxgPGtB6mjvX6dyH2iKe0krOAYXIt18dI2JTGt+5NhJ/p09IvMf9hqoC3h
         Ruxw==
X-Gm-Message-State: AOAM531aHDOo1FWY65dGaKGSxUreB6lVQRBpf28OAsS+mHrb4tI1NwR2
	qs8tdDZgm2mfy/+OVVBw+Fv2+YM6MR8Q8Cha6K60ow==
X-Google-Smtp-Source: ABdhPJwz8J3X4OaU7ConM93zcob9o5EzeNVg0iGX5GLf21HVL2ChQ1AXAgM8UPP9tZg/RnoBtpvC6bXKlvRCf18W1EA=
X-Received: by 2002:a05:651c:544:: with SMTP id q4mr1162881ljp.22.1602839336126;
 Fri, 16 Oct 2020 02:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201015064713.4863-1-arabishi900@gmail.com> <20201015064713.4863-2-arabishi900@gmail.com>
In-Reply-To: <20201015064713.4863-2-arabishi900@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 16 Oct 2020 10:08:41 +0100
Message-ID: <CAAnfSTsPKDqoiT+LvHXHMP_RcigmuV5aKWeaLNOeZdEK5_KJSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] License-Update: kmod: Add a lucking file to LIC_FILES_CHKSUM.
To: Akira Shibakawa <arabishi900@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I think you mean 'lacking' not 'lucking', but a better word would be 'missing'.

Ross

On Thu, 15 Oct 2020 at 07:47, Akira Shibakawa <arabishi900@gmail.com> wrote:
>
> Although components under tools/ are licensed under GPLv2+ and
> a binary from them are packaged by default, LIC_FILES_CHKSUM
> does not include GPLv2 license file, tools/COPYING.
>
> Signed-off-by: Akira Shibakawa <arabishi900@gmail.com>
> ---
>  meta/recipes-kernel/kmod/kmod.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
> index edff191700..646dff9a97 100644
> --- a/meta/recipes-kernel/kmod/kmod.inc
> +++ b/meta/recipes-kernel/kmod/kmod.inc
> @@ -11,6 +11,7 @@ SECTION = "base"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>                      file://libkmod/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
> +                    file://tools/COPYING;md5=751419260aa954499f7abaabaa882bbe \
>                     "
>  inherit autotools gtk-doc pkgconfig manpages
>
> --
> 2.17.1
>
>
> 
>
