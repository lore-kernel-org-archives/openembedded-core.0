Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.46730.1590481166126772685
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 01:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cE65xAbk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id u12so2339043wmd.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 01:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=aoem+qEQqS+YsUvlJD1bjfsdxnJg/EVUK+dQU41ycj4=;
        b=cE65xAbkMOy5bp+pGJ2WITpvtTfiRvkJi1QcCq9uVfzVGExSNVZfpyv0x75vSE45lE
         Rh/bshvmLuobgTdiYQsmZO6wLx+4seoRus+d9h6njYojzzWeeJjCoSZhQ5eS0vRiWTQT
         5Nhwm93FS/CCUrwoG74afQiwHe4X136hFx57Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=aoem+qEQqS+YsUvlJD1bjfsdxnJg/EVUK+dQU41ycj4=;
        b=p6GoQe957BrcTiK2C1wKw0Y8P2vdWb+KC17/369jLUF/rkwWuhn/OphDgLtyRvfRoP
         vXBEjPDmnrHVM3sgrftXoM8ZSHXcI8RToEv+33qGuBNqWyHTka8j4W9dbcLqhcijzNhm
         8oHdMrnExm/BSwSErtOgd5NnRx20kTKJYcZ49PkJxBR0T9MFgKojYeiey3B5Y2yis/kH
         L7EJwsL0H3DDgu1kMFPcl4z7ge0wsiVdcCqeokNBySCDcolNYkJPR10/sd7QA5b8Isef
         yKak9qJFzcZ0DkzxORrnoN5caI6NruA00UrG80kLr66U0pb1DIMGsg7HMUJa+hM0Viz9
         HtKA==
X-Gm-Message-State: AOAM53207kkQiYU2qfDakG3a2qdMyWoK5J0Pm5Vh5YwROc60jW6nBySH
	s681vOGujXz62XMiClS/6rXJ+w==
X-Google-Smtp-Source: ABdhPJyuPDNTDyA8ngWnnpT4IMwvQfwWObRvUiHFIRYdj5WAEtB/Y+8I63Od/SNVDlF/rvuCS+0xOA==
X-Received: by 2002:a1c:65c2:: with SMTP id z185mr224605wmb.125.1590481164422;
        Tue, 26 May 2020 01:19:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s15sm20616824wro.80.2020.05.26.01.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 01:19:23 -0700 (PDT)
Message-ID: <de59b9f118c6d51c902e50dce97a7680f77e7402.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH 3/4] libgcrypt: made libgcrypt-lic license "GPLv2+ & LGPLv2.1+"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: matthias.schoepfer@googlemail.com, 
	openembedded-core@lists.openembedded.org
Cc: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
Date: Tue, 26 May 2020 09:19:22 +0100
In-Reply-To: <20200526081233.62413-3-matthias.schoepfer@googlemail.com>
References: <20200526081233.62413-1-matthias.schoepfer@googlemail.com>
	 <20200526081233.62413-3-matthias.schoepfer@googlemail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-26 at 10:12 +0200, Matthias Schoepfer via
lists.openembedded.org wrote:
> From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
> 
> With the exception of dumpsexp.c, which is GPLv3, all other parts
> of libgcrypt are GPLv2+ & LGPLv2.1+, BSD or MIT or other "permissive"
> licenses.
> 
> If libgcrypt-lic is not set to "GPLv2+ & LGPLv2.1+", image creation
> will
> fail with settings like
> 
> INCOMPATIBLE_LICENSE = "GPLv3 LGPLv3 GPLv3+ LGPLv3+ GPL-3.0 LGPL-3.0
> AGPL-3.0"
> COPY_LIC_MANIFEST = "1"
> COPY_LIC_DIRS = "1"
> LICENSE_CREATE_PACKAGE = "1"
> 
> Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
> ---
>  meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
> b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
> index 4e0eb0a169..fd40cdcf83 100644
> --- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
> +++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
> @@ -7,6 +7,7 @@ SECTION = "libs"
>  LICENSE = "GPLv2+ & LGPLv2.1+ & GPLv3+"
>  LICENSE_${PN} = "LGPLv2.1+"
>  LICENSE_${PN}-dev = "GPLv2+ & LGPLv2.1+"
> +LICENSE_${PN}-lic = "GPLv2+ & LGPLv2.1+"
>  LICENSE_dumpsexp-dev = "GPLv3+"

I don't like this approach at all. Its obviously inconvenient if your
image uses only the non-GPLv3 pieces but this doesn't change the fact
that the main package license does include GLPv3 and ${PN}-lic is right
to include it. You're breaking the metadata to fit your use case for
convenience.

If you're excluding GPLv3 things from packaging, you could then (and
only then) justifiably adjust ${PN}-lic to a different license so the
code should be doing that, not changing the underlying metadata to suit
you.

Cheers,

Richard

