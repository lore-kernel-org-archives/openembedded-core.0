Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.9750.1588261215529439650
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 08:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QuqVk2u8;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id a31so855736pje.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 08:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=fezhetDQ+tXHz5d40OU9OPVZArG4mLsqLZFB3B9aK5s=;
        b=QuqVk2u8dnNmXHNZk7mmhFGLrdqXnDM0akFZxxsav6x4ty8625KlbFEVYYlLG24rR9
         15eHk8R7MFCCW8yuYqHEakMgzDWMoI8zKBMLs+5NG3Q2uVbvM3vF1ZaxHSJFuZ4xDtC7
         5i25oY8SZLgUnhXvHAa/Z2TkqpldJdHypuHhSaUJhzohzVr6tCyT9HhatfB6ja/VVUEF
         ooLw/TZdK4cxb4Y90Z9KLQzN89R5byYMrM8S3KazksLFtCdyzRXBFGbTw3s6qmHBTDDF
         ogpcpL//xdLz8mg7ulj5cdxFGbWjPJ0rTIYWXByEw8dsAcGbpeTBJyBFRH56Sn7w1gCM
         AWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fezhetDQ+tXHz5d40OU9OPVZArG4mLsqLZFB3B9aK5s=;
        b=n/yjf7JGt6AGxpQ2ShVrt8o22OjevkLSuL3ZYexw7X3CpDADqUS4prumS/C/PYDTA5
         n1YwG5Z+G342M5U4x4p6YcKkAAZAi7KAJfhRjDoQ1gNDsSVrDS4XEs9FW9xjGCNQiZsW
         dTqM1/JSlRyuJqlKLrrldbCHfosHEidkhJwFkxcgeSZsbkIlcv0u3MQQTSf+fic55vc9
         za6EVzcQDjgeMzlhls/ZnWyZ3RSL8XfnQYKgUmNLDZ9APRbDD3ihzP7azdRbZ9Mbchgr
         QXBDt4GXo/NqmzplY/fNTEXUfl0ic1OF+AAz3n80Jk473STLRIQdg9ws0nptPvnTnJL3
         ceXQ==
X-Gm-Message-State: AGi0Pua9GGkXSQWI45pcU9KTqWSXPCpXR2Gq9Puq/Qiqht1sxQHANELE
	6cmiFgyo5cTZrGnqngGhBKa5TOthaJY=
X-Google-Smtp-Source: APiQypLGJZyfnmtCZNwULUxOO2/1mmCug2rhJdDhmdjlSEMD/Ws035UXANticpvKlTMQjZL+JcCuDQ==
X-Received: by 2002:a17:902:b948:: with SMTP id h8mr4149360pls.309.1588261214315;
        Thu, 30 Apr 2020 08:40:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:e02c:9432:3945:4d16? ([2601:646:9200:4e0:e02c:9432:3945:4d16])
        by smtp.gmail.com with ESMTPSA id a30sm179408pgm.44.2020.04.30.08.40.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 08:40:13 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] sanity: Require gcc 6 or later
To: openembedded-core@lists.openembedded.org
References: <20200429220156.1300336-1-richard.purdie@linuxfoundation.org>
 <20200429234101.GS11927@denix.org>
 <CAGDS+nkG-R+zm=vO4QgffnP5tKS9LzB_17axa3gYhJmnHT7jrQ@mail.gmail.com>
 <CANNYZj_aqcHzuH28iN_ySprQuhuve_9G4caTOtN-pJs4A4Sqow@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <947c7e4f-c78e-7ba4-0fc3-57325d82531a@gmail.com>
Date: Thu, 30 Apr 2020 08:40:12 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_aqcHzuH28iN_ySprQuhuve_9G4caTOtN-pJs4A4Sqow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 4/29/20 11:10 PM, Alexander Kanavin wrote:
> Ubuntu 16.04 will continue to be supported even with this change, you 
> just need to set up builtools-extended-tarball to provide a recent 
> compiler, which is a couple of easy commands suggested by bitbake.
> 

Thats understood, and as we do not use buildtools-extended-tarball on 
every disto this is not default. Secondly, for a release it would differ 
from what we have released with.

> Alex
> 
> On Thu 30. Apr 2020 at 2.04, Steve Sakoman <sakoman@gmail.com 
> <mailto:sakoman@gmail.com>> wrote:
> 
>     On Wed, Apr 29, 2020 at 1:41 PM Denys Dmytriyenko <denis@denix.org
>     <mailto:denis@denix.org>> wrote:
> 
>      > So, this is for master, rigth? No plans to backport it to dunfell
>     (hence, no
>      > rpm backport either), correct? Trying to make sure Yocto LTS will
>     still work
>      > on Ubuntu 16.04 LTS...
> 
>     I have the same goal, so no plans to backport to dunfell!
> 
>     Steve
> 
>      > > Signed-off-by: Richard Purdie
>     <richard.purdie@linuxfoundation.org
>     <mailto:richard.purdie@linuxfoundation.org>>
>      > > ---
>      > >  meta/classes/sanity.bbclass | 6 +++---
>      > >  1 file changed, 3 insertions(+), 3 deletions(-)
>      > >
>      > > diff --git a/meta/classes/sanity.bbclass
>     b/meta/classes/sanity.bbclass
>      > > index 9e871017389..292c5591dd3 100644
>      > > --- a/meta/classes/sanity.bbclass
>      > > +++ b/meta/classes/sanity.bbclass
>      > > @@ -527,7 +527,7 @@ def check_wsl(d):
>      > >              bb.warn("You are running bitbake under WSLv2, this
>     works properly but you should optimize your VHDX file eventually to
>     avoid running out of storage space")
>      > >      return None
>      > >
>      > > -# Require at least gcc version 5.0.
>      > > +# Require at least gcc version 6.0.
>      > >  #
>      > >  # This can be fixed on CentOS-7 with devtoolset-6+
>      > >  # https://www.softwarecollections.org/en/scls/rhscl/devtoolset-6/
>      > > @@ -541,8 +541,8 @@ def check_gcc_version(sanity_data):
>      > >
>      > >      build_cc, version =
>     oe.utils.get_host_compiler_version(sanity_data)
>      > >      if build_cc.strip() == "gcc":
>      > > -        if LooseVersion(version) < LooseVersion("5.0"):
>      > > -            return "Your version of gcc is older than 5.0 and
>     will break builds. Please install a newer version of gcc (you could
>     use the project's buildtools-extended-tarball or use
>     scripts/install-buildtools).\n"
>      > > +        if LooseVersion(version) < LooseVersion("6.0"):
>      > > +            return "Your version of gcc is older than 6.0 and
>     will break builds. Please install a newer version of gcc (you could
>     use the project's buildtools-extended-tarball or use
>     scripts/install-buildtools).\n"
>      > >      return None
>      > >
>      > >  # Tar version 1.24 and onwards handle overwriting symlinks
>     correctly
>      > > --
>      > > 2.25.1
>      > >
>      >
>      > >
>      >
>      >
> 
> 
> 
> 
