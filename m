Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web10.1032.1603399032868352750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 13:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JWJaqyvv;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id n16so1680198pgv.13
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 13:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:organization:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FjLjEDLJjoLFRe5goAs0Q7c0cs3/zC2GRkfi1MxwQjo=;
        b=JWJaqyvvCFw0JTvFkJAEGnfe+ioX5Oy4ZQPg8Ps9WbmUWJj5fGbCF7T1VdOaWPA0u8
         /+j/v2P3zkIPobxUHrhRgQEjPwMpD35GVr8/R/EFLHbh4NCH4UDzTxIpKNIDxrV85x+b
         y7FrEQLsOyqpTHI7eYa07iLe4f3wHGuH+ciJppELZpzS7e8P8IpQLNWmZ4rLaBpAv+NM
         kFjxbZBa6SzYTFj2pHeOvBigROHhmUQJMb0/Smnwya9u3hJ6cWPJnqe5JbsfYkXIeWgx
         x9/URSLiM5xlOyAQF81u8l2YZ8bvD4KUkeKmM8jg4kpowuHHaIj6DTNfrbVptYETXv+x
         xOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:organization:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=FjLjEDLJjoLFRe5goAs0Q7c0cs3/zC2GRkfi1MxwQjo=;
        b=aiDMDnqZRrWXuTjG4EfzgKZs7axGnc1CYFhwY/nIoVM9KarSycBk2hA//n2C6sOrFR
         r4hYpdr8I1eyYn0XP8b65FhlxoMlarR01wa60U4otxfIbk3hM+juNerc4MCUtsKK2xo9
         csTqryISbvF0t3tJrkQ+m/RwEbRXvvrv5XGApVQ1i6Y7cLPHOFX8ZNgsbWr2wrqYc0vp
         +nAY6uDZfXakYKFsvcUsmXHxvHnE8b6/mMHG4nWrNuze53zU66LS5KXGpmnFxaq5BgLU
         8kss56YyQAUZu4JAbGRb806EQiquBO79DGrlMceOtVBjQLKDyYpiSS4026nuy5aP90g7
         w6+Q==
X-Gm-Message-State: AOAM533b6vH2bY50j9bSUw1DCELeGh5M9pAnx/P4yB48ixNa1NkxI5SV
	apbi4nLiO/rnakiRdP5lwEg+Ry8ALvTKuQ==
X-Google-Smtp-Source: ABdhPJyt1b9fmRFUgZ1UpORD/hIW1/OjfJ1TFGBB5y/hNn9rSAyD0pLXHb0IB3LXLp49MxLdkki9Fw==
X-Received: by 2002:a17:90a:b896:: with SMTP id o22mr3879614pjr.130.1603399031170;
        Thu, 22 Oct 2020 13:37:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:913f:dc36:bf23:12ab? ([2601:646:9200:4e0:913f:dc36:bf23:12ab])
        by smtp.gmail.com with ESMTPSA id h4sm3133147pgc.13.2020.10.22.13.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2020 13:37:10 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20201021210932.984184-1-raj.khem@gmail.com>
 <d4a88c9df72243f4e334d3b408200062b6113b59.camel@linuxfoundation.org>
 <CAMKF1sp+iH=H3yTPWSr_6iSJK2F0yDGBHk59K_zq4_6JYLwwUQ@mail.gmail.com>
 <16daa853-ba5a-af7b-40f7-8b4e757848be@gmail.com>
 <0b8c63800f9b0c70e7949ec1244c5061efe2c746.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Subject: Re: [OE-core] [PATCH] multilib_header.bbclass: Do not install the stubs for non-multilib case
Message-ID: <7ef77885-d26d-37a3-5ee3-4b2299b8909e@gmail.com>
Date: Thu, 22 Oct 2020 13:37:09 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <0b8c63800f9b0c70e7949ec1244c5061efe2c746.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 10/22/20 1:11 PM, Richard Purdie wrote:
> On Thu, 2020-10-22 at 12:21 -0700, Khem Raj wrote:
>> I ran a few combination builds without this patch applied.
>>
>> build core-image-minimal/qemux86-64
>>
>> then add just following to local.conf
>>
>> require conf/multilib.conf
>> MULTILIBS = "multilib:lib32"
>> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>>
>> and rebuild core-image-minimal
>>
>> here is buildhistory-diff output ( before and after adding multilib to
>> local.conf)
>>
>> http://sprunge.us/oM7Fg3
>>
>> It ends up rebuilding all target packages inclduing some cross packages
>> e.g. libtool-cross, native sstate it still re-used and that remains so
>> with above patch applied as well.
>>
>> Therefore this patch does not make things any different than they are
>> currently.
>>
>> Let me know if I should be checking more things.
> 
> Imagine you configure 64 bit x86 to use /lib64 in all situations (which
> many do now, it probably should be the default).

interesting but its not default, and multilib is not default as well. 
Thirdly we are optimizing for a case where we want to switch distros 
between multilib and non-multilib case. are there practical usecases of 
these three conditions? I think we are optimizing for a relatively small 
usecase here if there are any.

> 
> Then rerun that test. I doubt core2-64 will rebuild in that case but it
> will after your patch.
> 
> Cheers,
> 
> Richard
> 
