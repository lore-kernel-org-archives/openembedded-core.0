Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web11.1697.1588878140279138255
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 12:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jWLUDM7d;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id l25so3221845pgc.5
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2020 12:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/4wAdxLqx9mW/NlKkZIf1U9kdHt43Clb5vfzHCdXWUE=;
        b=jWLUDM7d1UY3ksutAfW2s94qplh630hxW49hbXs04CL81TU+Ju1xrLSEWjXl1iq1aN
         h48IPCahq/+YwePuuwgrxKvoIxPhbUpjnNIF5FbNwLOdgqaCS4gkNa0Bt6yTwkIUtZ7m
         7dqtaAv+66S/vzIiOOjzfo+UqoyonrmCI+y8RXwDJG1QgrvcghKdz3xd/15Px+Gf4s1x
         FXDbdC6zDBfChDfskUvw7GHdUuI9qMfsV+1jRPTuHYC40qB7CuxNV4Sxszk5fxEL9yiR
         zXbtGxj6Ej0X96im8MGSsMHtqXFCPU8og6dSDSVatPTCyS3TNolmo9EJD9a5NDDtZ3Bu
         f0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/4wAdxLqx9mW/NlKkZIf1U9kdHt43Clb5vfzHCdXWUE=;
        b=kg8LYPgMEUphmQMWESVsMXvkpPGggkiJlLFZ18/I73Q6E9D0ILzm4L17C4gTf3lLTp
         q2gRcdtrSoS+0CxiPk0wV2Jyh0TApT48VfYErXedMyFu2pwrgYph6vcs4RiR9ObSNkaP
         G9PQLheUbMmchJN7D5ZTMJ5cD5E6ZMM1rL+GSBuseUqZ6iRueNBNWIshykrw2wVHtLfL
         kplkucw141re3IHplDcL0G1Ydo1YMNJRv09WcPSAYL3GtCT56gLq3eehCKgKG/wfceda
         D4WMojsdZmaloUV2LVPY3v8YgblbFPM6zY1PfhBOXVb6vwxi2lI2GnBdLyCwOpv/LshY
         SWsg==
X-Gm-Message-State: AGi0PubycCXUUhRs5P5Xfsa4NEkE778kq3Y7JV5QPq5kTbgD6RcQ0NJh
	rgynn8s0nfBofXQffMBVvRgeSJhZxjU=
X-Google-Smtp-Source: APiQypL5MplSosGUhPhVhMPkfMIqaQvwydFXhNzPC9fPM4fBZTnKKUTaIivWubrw0USn0XUdYYiG8g==
X-Received: by 2002:aa7:9ae5:: with SMTP id y5mr15126917pfp.294.1588878138405;
        Thu, 07 May 2020 12:02:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::2691? ([2601:646:9200:4e0::2691])
        by smtp.gmail.com with ESMTPSA id x7sm5685784pfj.122.2020.05.07.12.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 12:02:17 -0700 (PDT)
Subject: Re: [OE-core] [PATCH v3 2/4] libva-initial: New bootstrap recipe
To: zboszor@pr.hu, openembedded-core@lists.openembedded.org
References: <20200227052448.65435-1-zboszor@pr.hu>
 <20200507133301.4336-1-zboszor@pr.hu> <20200507133301.4336-3-zboszor@pr.hu>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <d9da91d1-a7a5-9242-b94b-61b7eb527477@gmail.com>
Date: Thu, 7 May 2020 12:02:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507133301.4336-3-zboszor@pr.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 5/7/20 6:32 AM, Zoltan Boszormenyi via lists.openembedded.org wrote:
> Mesa needs libva.pc and libva headers to enable the VAAPI
> state tracker and drivers.
> 
> This recipe is a variant of the full libva package build as in:
> * it only depends on libdrm to build so it doesn't introduce
>   the circular dependency between mesa and libva, and
> * it doesn't include the libraries in the final package.
> 
> However, there is another issue with build dependency handling
> in Yocto. libva depends on mesa and mesa depends on this package.
> Any package that depends on libva therefore would pull in libva
> and this package resulting in an error in the prepare-sysroot
> phase because they would install identical files into the
> per-recipe sysroot.
> 
> Using the package name "*-initial" avoids this because of the
> interaction between sstate.bbclass and staging.bbclass: any
> package with the pattern "*-initial" in the name is excluded
> from the dependency list unless explicitly added to DEPENDS.
> 
> Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
> ---
> v2: The include file is not versioned, more verbose commit message
> v3: Rebased to current master
> 
>  meta/recipes-graphics/libva/libva-initial_2.6.1.bb | 9 +++++++++
>  meta/recipes-graphics/libva/libva.inc              | 4 +++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/libva/libva-initial_2.6.1.bb
> 
> diff --git a/meta/recipes-graphics/libva/libva-initial_2.6.1.bb b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
> new file mode 100644
> index 0000000000..a3b04eb02a
> --- /dev/null
> +++ b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
> @@ -0,0 +1,9 @@
> +require libva-${PV}.inc

this require seems should be just libva.inc

> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
> +SRC_URI[md5sum] = "aef13eb48e01a47d1416d97462a22a11"
> +SRC_URI[sha256sum] = "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
> +
> +do_install_append () {
> +	rm -f ${D}${libdir}/*.so*
> +}
> diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
> index e03451240c..ac39e92de7 100644
> --- a/meta/recipes-graphics/libva/libva.inc
> +++ b/meta/recipes-graphics/libva/libva.inc
> @@ -16,7 +16,9 @@ BUGTRACKER = "https://github.com/intel/libva/issues"
>  SECTION = "x11"
>  LICENSE = "MIT"
>  
> -SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
> +SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
> +
> +S = "${WORKDIR}/libva-${PV}"
>  
>  UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
>  
> 
> 
> 
> 
