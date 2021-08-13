Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.31115.1628817650566567115
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Aug 2021 18:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qPWUKL8s;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id w14so12878739pjh.5
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Aug 2021 18:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uCt03UQAhvbyI5wJZJDwDS452UXvZOnb0NSelQWz5kI=;
        b=qPWUKL8sTNmfycfrSHPtIenO/qklwVf1T+gF424Bznptad04WfvROImJ5sCSZFIpMo
         H/T8VawEiMASpVZ7Te816SyrXFL9dbP7Z2B4QX2RszQ1/U0przBmo2QOPg4FfXhifro5
         qRSEcft45uUad0G7Il+sBFq0cb9wPcbOwyT30Nuv7j5GXcNyMv22wBM6MKmsiD4nD6pG
         3363nxayCjhZXShK7PG0yicNXRws2rI7M6zJUJPQimatIrPpJMvxUHFNKWkazXkmsnox
         Win1uEQ+Lk4OIvXsdGYYMx6yazyoGXz9qiiq4z9pQnY1jLGkGp9rXoxOoyOrAS2UA0fn
         OPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=uCt03UQAhvbyI5wJZJDwDS452UXvZOnb0NSelQWz5kI=;
        b=fa+9PIEfBFRs63BBG/EuWIuYOlWZL278rfYjVl6iHDXRdOjfyo2KRFcTkoYmmfFFsE
         ceneEAO7dIm9Tu6lAeM9SXltlDoVRq7EwWq3N1kX1pSbrj7rVbagaHqEjivw8vLKNLqi
         eRD1nZN2wDWtqhzrqIYHtL1Ig+QF/n4/1vo7pR/yf9Ln0WDSFiXzW7CxvrcTCuKa0SiC
         nAaNuiliuDDNr4p05+BiwuU4i080QrAySqEviZezWlHzZHDxq0prrfmsyLhrwZw7UpWM
         4JEk4ocrMXZIe1UV6aQ6E+DJbQcQ1R5/hR/i9364MQ6QR7w5TQtCCOdi6OCfBTxgtUKc
         Xhjg==
X-Gm-Message-State: AOAM531DVVT1QJI8rY76JUqUfAHnALaGghr9jTgPS2z1GPynE4YX4gO6
	5praamxD1i/zcMiunqUVI/DVM9sDeIO8jA==
X-Google-Smtp-Source: ABdhPJzq/94/Hi4yWMjORIWB+Odl+z4pmFZnRA5CH3GvS91Xp+6IG3kYiPmJ6IwEQCoeqo0WG+sxhw==
X-Received: by 2002:a17:90a:ce0a:: with SMTP id f10mr11856375pju.52.1628817649787;
        Thu, 12 Aug 2021 18:20:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:c078:a19b:8919:aba? ([2601:646:9200:a0f0:c078:a19b:8919:aba])
        by smtp.gmail.com with ESMTPSA id x2sm38083pjq.35.2021.08.12.18.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Aug 2021 18:20:49 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] pypi: Allow override of PyPI archive name
To: Tim Orling <ticotimo@gmail.com>
Cc: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
References: <20210810110350.7078-1-paul@pbarker.dev>
 <fe659534-214a-0c7e-f407-2da6c3dfb59b@gmail.com>
 <CANx9H-AEeTat=C916jiEDc1jpcKr-8YirOfSTVCj2fnP7eUoyA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <bfce8c84-8369-9938-2338-cb7ae652c711@gmail.com>
Date: Thu, 12 Aug 2021 18:20:48 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-AEeTat=C916jiEDc1jpcKr-8YirOfSTVCj2fnP7eUoyA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 8/12/21 6:03 PM, Tim Orling wrote:
> 
> 
> On Thu, Aug 12, 2021 at 5:58 PM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
> 
> 
>     On 8/10/21 4:03 AM, Paul Barker wrote:
>      > Some packages on PyPI don't follow the usual expectations for archive
>      > naming. For example, the archive for asyncio-mqtt 0.10.0 is named
>      > asyncio_mqtt-0.10.0.tar.gz (with an underscore instead of the
>     dash used
>      > in the package name).
>      >
>      > To handle these edge cases a new PYPI_ARCHIVE_NAME variable is
>      > introduced. By default this is set to the expected archive name
>     based on
>      > the PyPI package name, version and extension but it can be set to a
>      > different value if needed in a recipe which inherits the pypi class.
>      >
> 
>     how many such packages are there roughly ? does it deserve to be
>     addressed via introducing another variable I wonder.
> 
> 
> There are 29 packages in meta-oe/meta-python that fail to check latest 
> upstream version and so far (13/29) it has been for very similar dash 
> vs. underscore in the SRC_URI (from local AUH run). Not sure it is the 
> complete solution, but it might help. Might need to apply to the 
> upstream regex too in that case?

OK thats some number and yes extending it for upstream check would be an 
improvement.

> 
> 
>      > Signed-off-by: Paul Barker <paul@pbarker.dev
>     <mailto:paul@pbarker.dev>>
>      > ---
>      >   meta/classes/pypi.bbclass | 6 +++---
>      >   1 file changed, 3 insertions(+), 3 deletions(-)
>      >
>      > diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
>      > index 272c220bca..9405d58601 100644
>      > --- a/meta/classes/pypi.bbclass
>      > +++ b/meta/classes/pypi.bbclass
>      > @@ -8,12 +8,12 @@ def pypi_package(d):
>      >
>      >   PYPI_PACKAGE ?= "${@pypi_package(d)}"
>      >   PYPI_PACKAGE_EXT ?= "tar.gz"
>      > +PYPI_ARCHIVE_NAME ?= "${PYPI_PACKAGE}-${PV}.${PYPI_PACKAGE_EXT}"
>      >
>      >   def pypi_src_uri(d):
>      >       package = d.getVar('PYPI_PACKAGE')
>      > -    package_ext = d.getVar('PYPI_PACKAGE_EXT')
>      > -    pv = d.getVar('PV')
>      > -    return
>     'https://files.pythonhosted.org/packages/source/%s/%s/%s-%s.%s
>     <https://files.pythonhosted.org/packages/source/%s/%s/%s-%s.%s>' %
>     (package[0], package, package, pv, package_ext)
>      > +    archive_name = d.getVar('PYPI_ARCHIVE_NAME')
>      > +    return
>     'https://files.pythonhosted.org/packages/source/%s/%s/%s
>     <https://files.pythonhosted.org/packages/source/%s/%s/%s>' %
>     (package[0], package, archive_name)
>      >
>      >   PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
>      >
>      >
>      >
>      >
>      >
>      >
> 
>     
> 
