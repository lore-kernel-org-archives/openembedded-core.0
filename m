Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.214.1588278584320121680
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 13:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RhRE8Wlf;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id t3so7238062qkg.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 13:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=OxsFPqsWsM3WsjHFVVU8M5sMKsxtdoDc3yo4s7doYOQ=;
        b=RhRE8WlfYJQZwfNhaKO8KQRC/l02b1woxdIGTh87XT0JKru1BthZg25zWHds8VsTyi
         uZKuobD7j41v23fiW6NB5D+o/WJ2T6Bk5wNQUbhA41ePfAfIXqwtrski+AqPrHYMVdnY
         gHBRM91wUFxTQf1fKJt0BGGJxF6GLfJax9r9KZ0xxbRtkpXL+Y7z0YHaI5JBfzLvaUgI
         i4hDhYf6vXGi/CMJ/sfDxUNcboAJmO13vy7Mxb9bjnNhHpoo3oorN1fGi1rwfwhTHjpW
         LmKh0KNVaeeUbMd8ZFqO7zQO0YGEk+LLbMPFm1f24/RdesFrdy6mdFJaidl9gU/r3G0V
         P1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OxsFPqsWsM3WsjHFVVU8M5sMKsxtdoDc3yo4s7doYOQ=;
        b=k8hUYvX/SpCCTs6W90LXISwxDIMfHJ3x4gB8hcx1hGVFxnSrzuj5nTjgDgHN1L+w8m
         2MhV59YbksnVQWSgpiM6Zj8sqrwWXgTbwCf5/9I02opdzI8xuXzQuj6rN+z/xWJ576MO
         0GDkb5+x0A+cj+WLYIhuGucLS8rxljcXT3AvfaTeI0GqC/jrGmhOjlfVnFzyEr5IOdQx
         GiQ9FYE9Ww7SY/MZ6XGbuh1hBb3YNhY8Gxe/ijDklJj3D4glmkg3J+nBd7Rfx719TlZH
         GXWeIuQ8TqrUYfQqrlYloPHbrbBAM6tTih0+CkRpR8qIOlrrbIR7W4PIFTgA39FRx1Ub
         kU9g==
X-Gm-Message-State: AGi0Pub0gYwaCcPQx5HaWx5OZqnivmLnhbt5nePbP2FLKX5xGG3pmaQ7
	lBh7/FBhF9R56ShwYxmJO0w=
X-Google-Smtp-Source: APiQypK2m7QI/sZNU93sBJCeKjqsT9Sr2/CrR1vWCKg24Pa78jkwTr0sgZYh+/UYbEFgndUMnIr7Jw==
X-Received: by 2002:a37:e10c:: with SMTP id c12mr257879qkm.483.1588278583252;
        Thu, 30 Apr 2020 13:29:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:e02c:9432:3945:4d16? ([2601:646:9200:4e0:e02c:9432:3945:4d16])
        by smtp.gmail.com with ESMTPSA id t14sm690114qtj.71.2020.04.30.13.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 13:29:42 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 05/17] kmscube: update to latest commit
To: openembedded-core@lists.openembedded.org,
 Andre McCurdy <armccurdy@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
 <20200430095815.2824-5-alex.kanavin@gmail.com>
 <3bf99c3f-7ab1-d4ad-e8e1-c462222c34a8@gmail.com>
 <CANNYZj90=e_zRbAcUT5zNZ-S5StHgPTJg_EJwp_4jdQ15ykWuA@mail.gmail.com>
 <6a314323-ec76-5375-c37e-dfb5f32cfb71@gmail.com>
 <CAJ86T=XR+CWD8T=HLXUrfwUoiOjcwf2sifb1B4OWT=76OzKjQA@mail.gmail.com>
 <CANNYZj-TcGD6QJ1Vnjme4fpZ4uwQB-LAZ-coaSm+jXsjiPHe4g@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <4f347bfd-c96e-feb0-64fa-52a17a73b2e7@gmail.com>
Date: Thu, 30 Apr 2020 13:29:41 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj-TcGD6QJ1Vnjme4fpZ4uwQB-LAZ-coaSm+jXsjiPHe4g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 4/30/20 1:17 PM, Alexander Kanavin wrote:
> On Thu, 30 Apr 2020 at 22:05, Andre McCurdy <armccurdy@gmail.com 
> <mailto:armccurdy@gmail.com>> wrote:
> 
> 
>     "No way to understand it" seems a little over dramatic :-) It's
>     testing for the availability of a function (gbm_bo_map) within a
>     library (libgbm) and then making some code and one of the source files
>     conditional on the result of the test.
> 
>     https://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_node/Libraries.html
> 
> 
> Andre, I would be more sympathetic to this, if more people would 
> actually work on core recipe upgrades, but alas, it seems like it's now 
> me alone, despite all the mail that AUH sends to supposed 'maintainers'. 
> I have about 60 updates queued [1], and 60 more yet to come, so when I 
> see a patch like this (not trivial to rebase, abandoned by original 
> submitter, not possible to test), I simply drop it so that progress can 
> be made. If you can help, please do.

your effort is appreaciated. Core however has to serve wider usecases, 
so that should be considered as well, so ploughing ahead while is good 
being mindful about regressing usecases is equally important. All of us
have same challanges.

> 
> [1] 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates
> 
> Alex
> 
> 
> 
