Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web12.34084.1629998585615521705
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 10:23:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j8ECvyhF;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id t4so4178343qkb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 10:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BDIo95pSLDSRGmkKNbeDDfKgSFQkCCQCtTFSKQP15LM=;
        b=j8ECvyhFOmOp92L1zDLIeOB6vl8jMTZ1BGfqpS/nuYmuQ6vq1nzt2rtOLUm0j0NLOl
         ZTvPA8QrzWXa88r1s22vV/m2xjm+Ot2nWipCSv+A7VDBbXT4/h/IJ0zvg4KTjjjcs1Z0
         i1es50DNi3b9rkJx57CaPtegsVuqYX/HztZ+dKjIvcx8ii6QLQlx8qGYXIAoV2QuenIS
         XFdd7xnX8hJGNSMu3NOEYGIABM+m1CZZGFaC3TWMSWvq6hrCW1dUbQFfd0EGxtylgnr1
         cDhN4jo48YwSbveFvsFLbgwcm89oJfHIiG29c9ERo8Li3RZ62fGDAAOC2V8D4EONMmyj
         cC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BDIo95pSLDSRGmkKNbeDDfKgSFQkCCQCtTFSKQP15LM=;
        b=tsFM62AJOaS+/WwzMaOcyWMa74Fj+A1n29yfkCe+4QKlI/RUTpyDwUwhcjYllAqVpx
         CV8GGt+8oH5IRPendhFYJrYiT1MsN8txOtsgweqZ6BrXqaxCxN1IZ9VTHz2mPa8VnC/Z
         l8Z86+RPFzpgk3uYH4jiKee/13f6yPV7HMdNPV4WA9muBal22IrPTrOq4+LGq1jhKz+O
         /vh0Dsny4nE+H4zNeTHsn/C/knD76ijeFRUgwhOSHBNfSxOPyoiDZwHwyaJVsIHjZq6M
         9xueTBCx+0nwMPim10+/YUvwnLKva9SuVh1cCuunGTPTWxjopYyFJCN4nVK3G9MmuOYC
         h0+g==
X-Gm-Message-State: AOAM531zwOyup3IhVhoovI2uX2xUkUVIlO9CZc3PhhMWBvx0VR2aLCmn
	voxD14Vm8OGg6e2b8TY9ZMTPCi1j+AZPIbQg6qI=
X-Google-Smtp-Source: ABdhPJyrd89dOZDixPAr/J1N+26VViXFrj3NAHZTmt45KpZtHZuqIG14FWADF3ez5+r1EB+OepGoqYzep2VNgHd4d2E=
X-Received: by 2002:a37:bc8:: with SMTP id 191mr5040632qkl.25.1629998584725;
 Thu, 26 Aug 2021 10:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210825113804.779395-1-alex.kanavin@gmail.com> <20210825113804.779395-13-alex.kanavin@gmail.com>
In-Reply-To: <20210825113804.779395-13-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 26 Aug 2021 10:22:38 -0700
Message-ID: <CAMKF1sqwfQJiDdWrNJGvXJdHLUi6+rTN-8S_Z0Wq-qA0zDo4-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/16] libnsl2: upgrade 1.3.0 -> 2.0.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 25, 2021 at 4:38 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-extended/libnsl/libnsl2_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
> index badb71d977..53be67fe85 100644
> --- a/meta/recipes-extended/libnsl/libnsl2_git.bb
> +++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
> @@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>  SECTION = "libs"
>  DEPENDS = "libtirpc"
>
> -PV = "1.3.0"
> +PV = "2.0.0"
>
> -SRCREV = "fbad7b36acaa89a54023930af70805649f962999"
> +SRCREV = "82245c0c58add79a8e34ab0917358217a70e5100"
>

I am seeing libnssl-nisplus failure
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1484/steps/14/logs/stdio

doesnt look a slam dunk but thats closest I could see a dependency change.

>  SRC_URI = "git://github.com/thkukuk/libnsl \
>            "
> --
> 2.31.1
>
>
> 
>
