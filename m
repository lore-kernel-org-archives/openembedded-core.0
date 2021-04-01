Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web12.6378.1617307632498059623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 13:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y2K1qIda;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id c6so2027601lji.8
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 13:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4KtJNqIXbmBiLmSMhcBBSiqpFJuP4dZyPxdp6xLslQw=;
        b=Y2K1qIdaxNcbsQE8TdY+cC1jC7o2lLc4jSUHlnRtg3ibEmSvm+7E/wiMzJMEtPhwhM
         quZimbWIjU07K3oUtG7xN7wd8micQBBoic57Q3cxflcW5OZHIeGpHDYgq7EhftGZHZeR
         pz2Ox6YlBBK/X9Ui8j/udZfJiJMA5E/yz6XgtnXya3oBqEQ25jvXh1sMVlXNlIde+cpq
         aaZftGEQ+Qu97gbgD4ekcMT4qEgpEKXgRCayWZ1zWa/BtZKYMRcQmB2PJs3lwBe/36g3
         BxqxLhMd4qNrbcwutSOUMk102ghypqe4B2oAKGnvfRigeP9iborbtAiSylWUtjX1jHOt
         vQfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4KtJNqIXbmBiLmSMhcBBSiqpFJuP4dZyPxdp6xLslQw=;
        b=JY1z1GOXRIphMbnI89XMc3Ri/RcZIN/80nXmg4Kk2NsDXCZa5Pk29ZQOunJRtPkCN5
         sKV+It41zca7GitY2pDipxkMpQh0hXxpupIl3fU/GtlghifDHLXv5ZStmYlqMIDDafI4
         J6AI3Rd45BOyzZ4bo6W/5uifGREWcrDAYIjXJ/SVbWjyO7AWvrVieOqAQRtQ5Hqhqjj3
         KFK5+N0LrrAZDYcMpbgPtdm4RyX3HqigHoScrTFGIddghLsxK9JR5ula0BLMk/ZkxnIg
         toSHo64W89IklL7cIiGZX3UGTrZXJ80rKHfdsvzzskYPPQN6ZaR87wruZ1YW2tiTqUyh
         UZ4g==
X-Gm-Message-State: AOAM532+Dp/x8u3t6wrsdaQB/0JhTrvolcVaYl/yNnjt0sIh23U6NcDF
	QHwG67JXrw1ZUjTkgIRLPMn3zUBd0RBv/ONb4+A=
X-Google-Smtp-Source: ABdhPJxxY25b82PVVMUXxNGVsWQOYKg79BY5g1iBMX3UzvOROv9EKgELgtFNm8s2OHC6Q3Fvn8490b1wRMKEn6jP1FI=
X-Received: by 2002:a05:651c:387:: with SMTP id e7mr6363422ljp.425.1617307630334;
 Thu, 01 Apr 2021 13:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617290309.git.steve@sakoman.com> <cd4f70f47c82377d65c51a7c9a9759188dfbb5b1.1617290310.git.steve@sakoman.com>
In-Reply-To: <cd4f70f47c82377d65c51a7c9a9759188dfbb5b1.1617290310.git.steve@sakoman.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 1 Apr 2021 13:07:01 -0700
Message-ID: <CAJ86T=VowO_dOjSw-hSs2B+dnHwhnKcEiRoywhBwa_E7tWkMcQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 13/15] packagegroups: delete useless "PROVIDES" lines
To: Steve Sakoman <steve@sakoman.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 1, 2021 at 8:29 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> From: "Robert P. J. Day" <rpjday@crashcourse.ca>
>
> There is apparently no functional value to "PROVIDES" lines anymore in
> packagegroup recipe files, so remove the lonely couple of examples
> left.

Seems questionable for backporting to a stable release. The bogus
PROVIDES lines have been there for more than a decade without causing
any issues (ie removing them isn't fixing a bug).

> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 6f2c9602bc5fc6794b852ec20f40ea62a55ada1e)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-core/packagegroups/packagegroup-base.bb     | 1 -
>  meta/recipes-core/packagegroups/packagegroup-core-nfs.bb | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
> index 1f802da09b..c32664917f 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -8,7 +8,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>
>  inherit packagegroup
>
> -PROVIDES = "${PACKAGES}"
>  PACKAGES = ' \
>              packagegroup-base \
>              packagegroup-base-extended \
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
> index b345e314ad..20fe6fc092 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
> @@ -7,7 +7,6 @@ PR = "r2"
>
>  inherit packagegroup
>
> -PROVIDES = "${PACKAGES}"
>  PACKAGES = "${PN}-server ${PN}-client"
>
>  SUMMARY_${PN}-client = "NFS client"
> --
> 2.25.1
>
>
> 
>
