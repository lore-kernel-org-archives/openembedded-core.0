Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.3512.1632255575021481282
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 13:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J6AJEfjI;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id nn5-20020a17090b38c500b0019af1c4b31fso493282pjb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 13:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:organization:in-reply-to
         :content-transfer-encoding;
        bh=iZlT5iRcZEB2aKWwiXscL0/6gnbMrPkbj6/PhsgNDG8=;
        b=J6AJEfjIpAhE0v6KZg7I2ztfXyccEbxIg7sNwpEGPlhtihJf6dOigCqKhi/+xMy5pL
         v5xcH/7W+FVEbHaQqhm7EPn9zKGF1tUZXgWIglkgavl/BdjGnkf49SFX3+LhOS2f68Dj
         iCxbPllYDCCrnpGQRfnauF83J/CzBv6vcSfrN48eEQIERR7svCff2z4/O3AZFIoOXnSz
         mFYvoIMKKg7L5aHfpsyM7szKfy+cobNGfhFQmL8DGFpdbMDpF1j3W0izHFv4FYJlUrZ1
         wYTXtTh0DuLUjkz8oNvs2EQsVt2P0tOYGStNybXkK7xAEGoRTQjBS85XvqjeXnsUTpIn
         AaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:organization:in-reply-to
         :content-transfer-encoding;
        bh=iZlT5iRcZEB2aKWwiXscL0/6gnbMrPkbj6/PhsgNDG8=;
        b=ZlIeHocN8KgoLg6r41QZfRF2guCHtE0wskYHz+MG6EplWURRkfm4O8Ha6qwE2ld3eD
         KKman3KMCMv/JDYq6DWrR0paZdRaOrNp7hatMCetI+YjNPl+V79FX4C12R7J2h+VqEbs
         m1yEhqGPgmCTPvVzTuMXBsHQtKcXeC/1++i22PlwZWU2Kvda2IXLYPUxT9CZNz1qtm5S
         RSzlM0ypo49cFqST0PvZVdnKSg4UNZa6li/mlVB2bUcz7BzwqFqUrrI2AcVtE/+hXnj7
         fUi1K0PyHMmNDeVW8vIWbfP6gBXCf+4utezVCqz8atcKioHZq6vz42Ho3uaiuUI9KTQK
         AfuQ==
X-Gm-Message-State: AOAM532cBv2vbaFEs7QsQmLBuLlFQ+9jwNnfJaSvIbSpFm7J98nbgMm5
	wqHWEqRHQIqjiuUhLXWXKKQAsU9dYtvsvg==
X-Google-Smtp-Source: ABdhPJwZJBA0vnCyetMhJmdSiba26qXYdaHq5k2C/8x4OPKPf6nRtwLpfEFaQh5fnRsr4wpm9P3/Qg==
X-Received: by 2002:a17:902:680f:b0:13d:c5d4:1af7 with SMTP id h15-20020a170902680f00b0013dc5d41af7mr2797856plk.43.1632255574484;
        Tue, 21 Sep 2021 13:19:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:786d:b045:bb6c:50ab? ([2601:646:9200:a0f0:786d:b045:bb6c:50ab])
        by smtp.gmail.com with ESMTPSA id d7sm38156pfq.43.2021.09.21.13.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 13:19:34 -0700 (PDT)
Message-ID: <3403acbe-e902-e983-4a6a-08fe700be4fa@gmail.com>
Date: Tue, 21 Sep 2021 13:19:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.1
Subject: Re: [OE-core] [PATCH] riscv: Add configure cache entries for libidl
From: "Khem Raj" <raj.khem@gmail.com>
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20210921170217.2977601-1-raj.khem@gmail.com>
 <CAAnfSTt-jHFt5+927ohyv4mSz5NtBhcAR-VqtAe8cP4zh+dGVw@mail.gmail.com>
 <CAMKF1so96B-gVjQ=BEJCio2mJJSZoo5kyyxCDyswgUVbJxhcMA@mail.gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <CAMKF1so96B-gVjQ=BEJCio2mJJSZoo5kyyxCDyswgUVbJxhcMA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/21/21 12:05 PM, Khem Raj wrote:
> 
> 
> On Tue, Sep 21, 2021 at 11:16 AM Ross Burton <ross@burtonini.com 
> <mailto:ross@burtonini.com>> wrote:
> 
>     libidl was removed long ago, along with ORBit.  Can we just drop
>     these entirely?
> 
> 
> Check layer index if it does not appear there then I am fine with 
> dropping it entirely

I dont see this recipe on layer index so I think it should be safe to 
delete these cached vars. I will send a v2 to remove it from other site 
files too.

> 
> 
> 
>     Ross
> 
>     On Tue, 21 Sept 2021 at 18:02, Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>> wrote:
>      >
>      > These were hidden in meta-networking
>      >
>      > Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>      > ---
>      >  meta/site/riscv32-linux | 3 +++
>      >  meta/site/riscv64-linux | 3 +++
>      >  2 files changed, 6 insertions(+)
>      >
>      > diff --git a/meta/site/riscv32-linux b/meta/site/riscv32-linux
>      > index 97de628e22..acc32fd03c 100644
>      > --- a/meta/site/riscv32-linux
>      > +++ b/meta/site/riscv32-linux
>      > @@ -9,3 +9,6 @@ glib_cv_uscore=${glib_cv_uscore=no}
>      >
>      >  # startup-notification
>      >  lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
>      > +
>      > +# libidl
>      > +libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
>      > diff --git a/meta/site/riscv64-linux b/meta/site/riscv64-linux
>      > index 38bc5f044d..cf78133ee0 100644
>      > --- a/meta/site/riscv64-linux
>      > +++ b/meta/site/riscv64-linux
>      > @@ -9,3 +9,6 @@ glib_cv_uscore=${glib_cv_uscore=no}
>      >
>      >  # startup-notification
>      >  lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
>      > +
>      > +# libidl
>      > +libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
>      > --
>      > 2.33.0
>      >
>      >
>      > 
>      >
> 
