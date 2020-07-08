Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.6262.1594196353621083588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 01:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@googlemail.com header.s=20161025 header.b=FfEhVwoY;
 spf=pass (domain: googlemail.com, ip: 209.85.128.67, mailfrom: matthias.schoepfer@googlemail.com)
Received: by mail-wm1-f67.google.com with SMTP id o2so1979288wmh.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 01:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=SZXUlR/4YRH42Lt2Kx48TwLBxjgLe35sgOALMhroXdQ=;
        b=FfEhVwoYKyYz2600xvGqtemogx7fLnvxye7TjoKU+rJ67DcszAWXYKqfV74fUdiOQ3
         F3fle9Ufm2Ruff0IYCjc55JkS1lnRyXvH1mhHNH1JKz4ZklaaNs3iwE0dHwk6tEh53qa
         Ivz5WJchxf/FMrEJDZteqgBqGP6N58CgqJLSyp9wddP6LnBWHUeMULHtD4w2j61o1Puy
         uWrmvnkXSKvcqth5lQqbS+p/FX3T35pzytToI2mI4EGrsLBKiiJD5/r+RUUoKSge3hbU
         NwQMkdd0y/p57O3OK9I1i+piBGNDH/VH+pHt192WqXylyn5qLhfC4wWYrbXi+RhkBPnp
         io8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=SZXUlR/4YRH42Lt2Kx48TwLBxjgLe35sgOALMhroXdQ=;
        b=RKL2o/frPe13Ub+aiqhYKLgdG/j55vBIrLgqIGI9IWwWrKwCbYiKRbLyRzd9ivQv8x
         DGX9sAb0DLrw4saLnbjGsD5xHeVKoYBv2+Iz9CWBjyRhPvUdAEnm0ffb+sPlCw4+hAee
         f8OjpMSBr6Q+4OFtKlCVs3i5uWRjv0FocNyXmUZArM1UQi9p1ROF+BInSWXua96YmbuM
         oACatCfxxGqDXqNNSivxMs5qkYChVqF36IJDTFX+LZxcYYWQ0dKHLMVt2D+wRfHAAHRW
         dxjRC9qklNNvAkKYywo2LZ1HZWh25OabrL2gIYeoaSfYkBtacNmtdgBlGztpXfLjidau
         luYw==
X-Gm-Message-State: AOAM531v4+t6CDTcgp2YjO7UW/DoMQHrwmuK0rkfDg6he1IvDbQJAxs+
	AWT5fKlstBSb7zIGY8zq9DCf4XEnxY8=
X-Google-Smtp-Source: ABdhPJw5PAdQ+vvuMvGgV8oJ8hyaAYZwA5BNwdZ4WcIrOAqN2wKKjgsk6nFzMTJJyW6gDMMf3B9LXQ==
X-Received: by 2002:a7b:c763:: with SMTP id x3mr7650095wmk.47.1594196351538;
        Wed, 08 Jul 2020 01:19:11 -0700 (PDT)
Return-Path: <matthias.schoepfer@googlemail.com>
Received: from ?IPv6:2003:f8:5713:cb00:3c6e:c7ff:fe93:53d1? (p200300f85713cb003c6ec7fffe9353d1.dip0.t-ipconnect.de. [2003:f8:5713:cb00:3c6e:c7ff:fe93:53d1])
        by smtp.gmail.com with ESMTPSA id h5sm5382178wrc.97.2020.07.08.01.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 01:19:10 -0700 (PDT)
Subject: Re: [OE-core] [meta-oe][PATCH 3/4] libgcrypt: made libgcrypt-lic license "GPLv2+ & LGPLv2.1+"
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200526081233.62413-1-matthias.schoepfer@googlemail.com>
 <20200526081233.62413-3-matthias.schoepfer@googlemail.com>
 <de59b9f118c6d51c902e50dce97a7680f77e7402.camel@linuxfoundation.org>
 <b595d584-b544-b755-d175-85fffbfd31e5@googlemail.com>
 <5ce01ee5048a9f5c0e11889cd6a9ecb150420f2f.camel@linuxfoundation.org>
 <38bf8144-019d-f9c5-f816-1ad80ed79d8d@googlemail.com>
 <03d998dfc621b417b2fb8464cd53827f2421dfac.camel@linuxfoundation.org>
From: "Matthias Schoepfer" <matthias.schoepfer@googlemail.com>
Message-ID: <4acef93f-54ac-abbb-e99b-202136dd5227@googlemail.com>
Date: Wed, 8 Jul 2020 10:19:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <03d998dfc621b417b2fb8464cd53827f2421dfac.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

thanks, that does help maybe a little. Personally, I find the license / 
compliance topic one of the most annoying things in embedded development 
*by far*. I also wonder, why nobody else has stumbled across this, since 
I guess it is quite common to rule out GPLv3, because most project 
managers I have seen are very worried about this. Nobody (at least not 
our lawyers can) can say, how you can safely use GPLv3ed software. 
Starts out with standard template library. It really is only headers. 
Are they subject to the linking exception? My favorite solution would be 
to open source everything. But my company does not like this very much...

Anyhow: There are 4 recipes affected. These are somewhat special, 
because GPLv3 is only applicable on certain packages that are not 
commonly installed on the target.

If I got you right, we should set:

LICENSE_${PN}-lic = "FSF-license-text"

If that is correct, I will happily prepare a patch set...

Regards,

     Matthias

On 7/6/20 6:26 PM, Richard Purdie wrote:
> I did eventually get a response from the people on the SPDX-legal
> mailing list. There wasn't a 100% clear consensus but for Yocto
> Project/OE's situation, I think the LICENSE for these packages needs to
> be:
>
> XXX-license-text
>
> which for SPDX identifiers would be exported as:
>
> LicenseRef-XXX-license-text
>
> The idea here is to spell out that it is the license text. People can
> then process that accordingly in output data from the build system but
> its clear its different from the license itself. It avoids us making
> any claims as to what this license actually is, for the FSF licences
> its relatively clear, for others it may not be.
>
> We could factor all of the *GPL licenses into "FSF-license-text" since
> they're all common as far as I know, but that isn't easily automated so
> is probably not worth doing.
>
> Does that help move things forward?
>
> Cheers,
>
> Richard
