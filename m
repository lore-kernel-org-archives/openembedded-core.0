Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.6518.1585747082333439611
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 06:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=Ga/6TyAX;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.195, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f195.google.com with SMTP id a5so21486802qtw.10
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2020 06:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=na6kjWdmR6JlCJmjlogbwCT2phMS2UbVAM6uTHHiNnk=;
        b=Ga/6TyAXaQ6RxfGdSWFBbPoSn3Afj2/kkqg5yzgE9yjA6pWWYpIqIkLMUsVWJMVqnU
         fHViSpuGB8P8MmJTBfeDPwwGv5vpAmtIc82l+0Jyh7h3+bM4F+FBqK60j8awdwHR9DTi
         Q81MldrMLzVHtYQbZspooTSDbhO4frQ8o58Ya9+KlwjlsE+7LFMP85Fj/UAb9CMAjXhL
         cj2QOmPx/mgSd0AFhohI5M+c1uzQB5Unt0mWq3j3jg4g/b343daDKGgXzNpH373U6cMm
         AxsA4vlIW9uC8z95uL2F6MuCRwMSWJrK+TNQQbxNKaQQNZLb/NtvPnojm3vMnw+2On/r
         sjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=na6kjWdmR6JlCJmjlogbwCT2phMS2UbVAM6uTHHiNnk=;
        b=VXDbP9IfhwDsPb3yTmQfUIw6c8hfX9Im7RvNu5wmgKBEN8IdrGP+trCJQnXfZa2WWq
         m7RcaLVG3GtdFr9xq7PEqTytO3aUjOMmja1U8sctJu03jvoLHa9xKTiFKEKsnxVS9OBg
         vpyNhrqU7wdX5ySgzl/Y+mWnS7tALXtQ87iyWl29AE6EeKqltxjwqeAZXgigBCUnxbpT
         EdKpTEOkcR9K+cZXTRJwaI05gwwg+P4aoK+9B2cAOAMSXu7u3qmRS+Q/bokovJkqkWGJ
         dJREO41qoOz2iRbqnDspghDmvUVFMdEGk+45oA1WwfJ0GThfh2T/XapOu/8tbR9NZvXB
         D4Gw==
X-Gm-Message-State: ANhLgQ04ppToJITMNOgLJUYp3HL1ku/strXISRnRU71I6TkCazisHLyo
	Wld/4woV+sSsDJzdx+PS7zrUpYaBCjWMQA==
X-Google-Smtp-Source: ADFU+vsTlbQJH4v6FTYLXWvD4aa/1WVDuuo9t3NlNpD9DqA6XBDZZ5Hnp85n6Wjke9I8XU4atmz2IA==
X-Received: by 2002:ac8:6c25:: with SMTP id k5mr10500403qtu.230.1585747080981;
        Wed, 01 Apr 2020 06:18:00 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id 85sm1362122qke.128.2020.04.01.06.17.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2020 06:18:00 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f176.google.com with SMTP id z24so20282998qtu.4
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2020 06:17:59 -0700 (PDT)
X-Received: by 2002:ac8:4986:: with SMTP id f6mr10348399qtq.6.1585747079565;
 Wed, 01 Apr 2020 06:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200331151645.1030603-1-otavio@ossystems.com.br> <6e0af711c659eeb8fdb223a1fd58d907fe73b90d.camel@linuxfoundation.org>
In-Reply-To: <6e0af711c659eeb8fdb223a1fd58d907fe73b90d.camel@linuxfoundation.org>
Date: Wed, 1 Apr 2020 10:17:47 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpuLkYW07JV-+8bE_V4nKEGjnKUvuE3yrw9nJBY3RJc3g@mail.gmail.com>
Message-ID: <CAP9ODKpuLkYW07JV-+8bE_V4nKEGjnKUvuE3yrw9nJBY3RJc3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] u-boot: Restore valid default environment for running system
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	Stefano Babic <sbabic@denx.de>, Tom Rini <trini@konsulko.com>, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 1, 2020 at 6:24 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
...
> Sadly it breaks oe-selftest's sstatetests:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/825
>
> (reproduce with oe-selftest -r sstatetests.SStateTests)
>
> As well as world build file conflicts in deploy:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/405
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/1731
>
> which is a large number of issues to introduce just before final
> release :(

Sure; these errors are not acceptable. I am checking it right away.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
