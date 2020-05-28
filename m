Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.14498.1590679314225119344
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 08:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DqJqt0RL;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id l6so324097oic.9
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 08:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Vvr4M4vI/hC72rdLzZT832i2q0KNcP6sTzKqgwyVGhE=;
        b=DqJqt0RL63zASe+dIbQLwtdgx+cOG87mlAg/qD4GWT1iVTVlxdNuzZQG4ocbFusar2
         /2FiRDLX6vVjMDWGbgVbQl6RpnpXUF7aO6gDo8QBjO6exXMv0Gh/uRqJepxLuEIfFkZA
         miU0GCp4cDGzqloZ4/Fb1Di4U1sUM9vEjGDxoXgFB4+3Hwz2nHLO2IC9KOBIVVwD3zFa
         HPcRkqlhFg0mULDFMwN/cgHtHQwbA5lLZeE1lLaDyG/UNzK3jYY5NroFX4mNirC7eKu9
         UnmCX+oC/1HnMTEmHexAFI9o1WhYYd3jo2MH4rIQvX3ZScTaK6IHlxhoUutQjFoROH6s
         USkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vvr4M4vI/hC72rdLzZT832i2q0KNcP6sTzKqgwyVGhE=;
        b=neIhhkd+lu0ap9dL1ktEvQHvXtKjIyRf2VsOC/fbduwM4QUSEtYt0KDSKnutVioljP
         HglkdvAolJt8miqYzBnQYNeXO+Jni761sOScEV6E7xdHMy+Pq84Pdnpex+96w3WYZRSS
         wyLpzVT/sskIcPgabhbbCR2eIpV4NTx9JMQsC02f/j19GArMwVook/wOZxUGIrfW3wtx
         bD/WPjDEriYM1NNra6iw+is1XUuZBbAjSfQXnw6BQkT3cXtVvVg2i12Fee04B2QLT6m1
         587XtjrU6zpBtJulPzDKdXK8yQcyzLWFs9IK+3xR/xd0uXI6ptRabFxKS5oOusPmvWTJ
         D8Ug==
X-Gm-Message-State: AOAM531zWgfiTk9Iu/nrziq7ml9PWXwZRcLhUNVB2QqMD0XUX6jiHaGY
	1LsLblITZQl6mLr6vTvud3FKSzOh0dU=
X-Google-Smtp-Source: ABdhPJzp2O1bWjBjsgTswLFhFmmNH4gzSaDGgsa/J3MTmU/5VSa4N0ttbtYlItau3pcgBPkALvYwZw==
X-Received: by 2002:aca:357:: with SMTP id 84mr2529260oid.145.1590679312985;
        Thu, 28 May 2020 08:21:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5cfb:80e2:2942:9b65? ([2601:646:9200:4e0:5cfb:80e2:2942:9b65])
        by smtp.gmail.com with ESMTPSA id k13sm1861386oih.48.2020.05.28.08.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 08:21:51 -0700 (PDT)
Subject: Re: [OE-core] can't create boost_context lib for boost-native
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Konrad Weihmann <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <AM7PR05MB688122DB540C514C7F56E3AAA8B50@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <CANNYZj9-2NH-fTf0xM=018_2-PtNDYcOp6_uSYr5DHpf+1yGYQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <8da28fb9-7ed5-fc39-f608-7cc5e87404e8@gmail.com>
Date: Thu, 28 May 2020 08:21:50 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj9-2NH-fTf0xM=018_2-PtNDYcOp6_uSYr5DHpf+1yGYQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/23/20 3:04 AM, Alexander Kanavin wrote:
> The problematic bit is:
> 
> # only supported by x86 and powerpc
> BOOST_LIBS_append_x86 = " context coroutine"
> BOOST_LIBS_append_x86-64 = " context coroutine"
> BOOST_LIBS_append_powerpc = " context coroutine"
> BOOST_LIBS_append_arm = " context coroutine"
> BOOST_LIBS_append_aarch64 = " context coroutine"
> # need consistent settings for native builds (x86 override not applied 
> for native)
> BOOST_LIBS_remove_class-native = " context coroutine"
> 
> I'd just drop this all, and always enable the two; if they're still not 
> supported by some targets,
> then target-specific _remove can be used.

Not unless you can ensure all other targets are taken care of when it is 
enabled, which could be cumbersome, I would suggest to delete the 
removal for native case, since we only have aarch64/x86 as build hosts, 
it should be ok to enable it for build host.

> 
> Alex
> 
> 
> On Sat, 23 May 2020 at 10:49, Konrad Weihmann <kweihmann@outlook.com 
> <mailto:kweihmann@outlook.com>> wrote:
> 
>     Hi all,
> 
>     For reasons that are beyond my control I need to have boost_context
>     available from boost-native.
>     Unfortunately I didn't found a way of enabling it by a bbappend, only a
>     full fork of the recipe would help.
> 
>     It seems to be caused by that single line
> 
>     BOOST_LIBS_remove_class-native = " context coroutine" (from boost.inc)
> 
>     as remove-operation is always the last in the chain of processing any
>     attempt to add won't work here.
> 
>     Any ideas how to add it without forking the whole recipe?
> 
>     Also this is another example for the ongoing discussion about remove,
>     ??= and ?= operators in architecture list and that there might be an
>     alternative needed
> 
>     Regards
>     Konrad
> 
> 
> 
> 
