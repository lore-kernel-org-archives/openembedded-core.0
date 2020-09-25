Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.1421.1601051336558882213
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 09:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HMQKntk9;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.68, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f68.google.com with SMTP id e22so3091937edq.6
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 09:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AwD7VuNWJB7leZef0uyDniP1qI84GXSqNQx/HRgJc64=;
        b=HMQKntk9kBx0cO7F/RPnSY+VvJbUcWCp87oSzmYaE+br9wdboDR56I7Pio1BdHCIsm
         Z59PkwXB0IGvSi+LXK7EVQO+wgpC8qHWSkWa6i4uFw+jHkJX3B7TxWS6f2PSJi95S3YS
         vTOuF3ao0jA8CMLLFutpRhzys6T6fZJTR8dYb8KI69vCaEWy1r9ThixsGU1AkE4/9NJa
         qyoBFh746/ZHnIhgl3xULh1puXJ9kipVD04NAihTXZ+Dq4TeyKSV+OqtFxrsrx+O6Yca
         LaqgwzEiWsJR9w5DuOBimSXqKeu1KXyBgPnZZdmnBhitrKTRxmRukcI38MVFqhHjihgn
         wkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AwD7VuNWJB7leZef0uyDniP1qI84GXSqNQx/HRgJc64=;
        b=srKQ3er37xadhnmkVqBVoEPMnMWBSG+m8t1fDDF8ifL1uTAASVZLn74+W0JcvMvsZW
         8CJsrAbiVciPHWH2PW3zRE4r60GhuJlrOS7IlpNEt1OMGSzf2wr8hSLLOgO6FQ2g8nQp
         8dlWIN/sQuDymLVm2xK6LODfQv19Y7a+rku7yTwY1yjzKXFV4gjM7FLOCXITvsnxXM5e
         yCZ7vYY3HgJJpc9mYLLJGARq4Sdpu24frLIU/YyCYSOyJKBtMxh12uZDvm37VB0j1mEs
         GPTusd+rC6Vr0DOKxo3GWfo92GZSDzk73ALQX5+pu2IyJFlxAvfrGY/4kbhGcEjxNDa8
         83uA==
X-Gm-Message-State: AOAM5314ttwGbGopwdDcam9mWx0qaISvRYGMKMELOC5vpjy42pIXuZu9
	/nvAHFdgqBJeVRQPj7Ocn4dlVRtDY9HyqXg32kE7/A==
X-Google-Smtp-Source: ABdhPJwKxQzZBM5lBdGDlVfWjogMh8CUnZMp6tgr6rQEOA4elEqQZLhdU5u8qPIGyJUN9AegOtoR6jF0HdkpmbDl74M=
X-Received: by 2002:a50:f418:: with SMTP id r24mr2183499edm.295.1601051334855;
 Fri, 25 Sep 2020 09:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqTT==wZ7a_HzzvsETmJeYAzX16E3y+RrnZF_kw92HuMg@mail.gmail.com>
 <20200924093217.8218-1-ceggers@arri.de>
In-Reply-To: <20200924093217.8218-1-ceggers@arri.de>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 25 Sep 2020 06:28:43 -1000
Message-ID: <CAOSpxdYapoFJ3XtZUBNiLwzUnRXNXHwb-kx+PVAec-t_4B=TYw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] packagegroup: rrecommend perf also for musl on ARM
To: Christian Eggers <ceggers@arri.de>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Is this also suitable for dunfell inclusion?

Thanks!

Steve

On Wed, Sep 23, 2020 at 11:32 PM Christian Eggers <ceggers@arri.de> wrote:
>
> The perf recipe builds fine for musl on ARM.
>
> Fixes: d758a4445a ("packagegroup: Disable packages not available on musl")
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> ---
> On Wednesday, 23 September 2020, 18:38:06 CEST, Khem Raj wrote:
> > On Wed, Sep 23, 2020 at 1:46 AM Christian Eggers <ceggers@arri.de> wrote:
> > > The perf recipe builds fine for musl.
> >
> > which all architectures did you build on musl ?
> only on ARM.
>
> > Regardless of that we should still use PERF var so non-core
> > architectures can still override it
>
>  .../packagegroups/packagegroup-core-tools-profile.bb             | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> index 1c94653d72..d437e28311 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> @@ -28,6 +28,7 @@ PROFILETOOLS = "\
>      "
>  PERF = "perf"
>  PERF_libc-musl = ""
> +PERF_libc-musl_arm = "perf"
>
>  # systemtap needs elfutils which is not fully buildable on some arches/libcs
>  SYSTEMTAP = "systemtap"
> --
> Christian Eggers
> Embedded software developer
>
> Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
> Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregisternummer: HRA 57918
> Persoenlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
> Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregisternummer: HRB 54477
> Geschaeftsfuehrer: Dr. Michael Neuhaeuser; Stephan Schenk; Walter Trauninger; Markus Zeiler
>
>
> 
>
