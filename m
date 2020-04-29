Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.1632.1588198349556918183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 15:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VmhHU4XM;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id x17so4435404wrt.5
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 15:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=3asLvWdef/wop+jM8X/GJhjEspyYA28ZwRU2QkZsRb0=;
        b=VmhHU4XMQR5ACbiTXd5EJIa+av42naMNjesbhqVZlEh4JC5FlqfUX5uB8rGe9Xw5bO
         pRgdxANaXYbn++42gNNZTWOgozzY8ChdmYNvQbTb3SwXz5HyNpFdljsr2BrPB2PHa4WC
         dhMxIA0jZ+URQwaxNLSbTOlXNdCARhvF4sDjIGL6VtfjNFEh0orfAOpPAOMY4SnM8kOe
         Dyu15BDSlij2vSx9oVCLIQm9huq7u/+iR3MLJrkSEvLPBf7BHDW8bSCeEmpBeldpX9ry
         WPyFwezdDAkCUbpA2Ux8mEP9opJBC1ttOUklwlrmRi0JoMJNIBq5dJemtKt0DUxz2pj7
         Vlag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=3asLvWdef/wop+jM8X/GJhjEspyYA28ZwRU2QkZsRb0=;
        b=ce5Easwtz4qoH123B//XqqdevJ0svedKPdCBKxKRc7XD3VKYdSrTzypv4ISuCG6FEg
         j9Fz6oceqYhxOOvQtkMHHHlPXGIEHBMwv1BhNX3kVcA822XQdVNeEpf+sN3QBn+x/emQ
         3bGrbVYSTpLMq8uGzNV24jsUgQKUgRXjzl1+O1P5/HePVnB7SFfhliW4BRq6OHpkhKZv
         6jpGely/Bla9sQlwMiEchvHySqO2swDN7FnX6Lh+9kwRq4KfQiKcDrLiUT05aK2QPXLn
         N4JyOLqUP6nCMXESudS3EYaI9Z+5f0WGEL+MxGSj2ndHAl/5hPgcfcl8unz6/E8E4exV
         t2jQ==
X-Gm-Message-State: AGi0PuZ+q48luUrxhjh/f+C51FT3Nf3Do08VAj/GnGMfbEQzlkkmyB6U
	KUSPLXTk4SUt/Ybq9yj9VtZk/LodwTqpjkkkl3Q1Rg==
X-Google-Smtp-Source: APiQypJVQceBjKHuodidqYOvODwGoYGlGIuG65qsniGA4j+RgYSgn+oNug8yezlAM+JlTxthQThdNnj+7/HyMZFxKdY=
X-Received: by 2002:adf:f651:: with SMTP id x17mr106431wrp.230.1588198347674;
 Wed, 29 Apr 2020 15:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588175775.git.steve@sakoman.com> <f03ee1a2a697394f3c4168350089526ef6b87de6.1588175775.git.steve@sakoman.com>
 <CAJ86T=WRV+Uny9-4J--0sS2cr5CAtA=D4gFXHgm=-pXsX=BjKg@mail.gmail.com>
In-Reply-To: <CAJ86T=WRV+Uny9-4J--0sS2cr5CAtA=D4gFXHgm=-pXsX=BjKg@mail.gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Wed, 29 Apr 2020 12:12:16 -1000
Message-ID: <CAGDS+nmnOc5HcpL-JM_PGUug56W53RvwK_+OgAea8AbzU10w+g@mail.gmail.com>
Subject: Re: [OE-core][dunfell 02/16] bzip2/pbzip2: Correct license information
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 29, 2020 at 9:13 AM Andre McCurdy <armccurdy@gmail.com> wrote:

> The corresponding update to the busybox recipe should be merged too.

Thanks, I'm picking that one up in the next batch.

Steve

> > diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> > index 8e9b779e67..d58f553a49 100644
> > --- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> > +++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
> > @@ -4,7 +4,7 @@ Huffman coding. Compression is generally considerably better than that achieved
> >  LZ77/LZ78-based compressors, and approaches the performance of the PPM family of statistical compressors."
> >  HOMEPAGE = "https://sourceware.org/bzip2/"
> >  SECTION = "console/utils"
> > -LICENSE = "bzip2"
> > +LICENSE = "bzip2-1.0.6"
> >  LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664"
> >
> >  SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
> > diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
> > index 1275cc0097..d7450c73c1 100644
> > --- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
> > +++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
> > @@ -5,7 +5,7 @@ machines. The output of this version is fully compatible with bzip2 v1.0.2 or \
> >  newer (ie: anything compressed with pbzip2 can be decompressed with bzip2)."
> >  HOMEPAGE = "http://compression.ca/pbzip2/"
> >  SECTION = "console/utils"
> > -LICENSE = "BSD-4-Clause"
> > +LICENSE = "bzip-1.0.6"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=398b8832c6f840cfebd20ab2be6a3743"
> >
> >  DEPENDS = "bzip2"
> > --
> > 2.17.1
> >
> >
> 
