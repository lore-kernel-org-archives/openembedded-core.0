Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web12.54434.1600063331135926672
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 23:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N+IGbDkv;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id s14so725465pju.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2020 23:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=grtnVn3VRztRTqyQnhuGmxBUCnJCHadxnmRdJcgxbS0=;
        b=N+IGbDkvmbRKAzWolrOx9iKf66nSSP0ZleovFEVVtQVtjLB3AXegW0ckR49yjY7hUe
         NHWqcX4010gQvIz5hdhx8jesbK1BrJ7sMksobbZfG72R5bTGyi1eLV3vnU3LQHQZ2KP6
         4h2jKciHr7x8TVApMmAeGG4mjY7EB4DnbOwb5Cv0TWJCI28HvNn9QWayqJNrDnYiL0/N
         btICSP60Zv4c8S2WU4xdHravgxa7ay7vBplkQbt5uKrhoVDG0+9YAYFueMVa8l5wfrMY
         5U1owcBs6H+BQJTaZ+sfXsm/DFRPWbQMNoi20fMhVMNhpOzeGmYzUodRiFKYOgDqt9Ot
         DTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=grtnVn3VRztRTqyQnhuGmxBUCnJCHadxnmRdJcgxbS0=;
        b=SV2c/5Iz7Ojm3uuWryKyf8H5Bkdft1K6WssZyaAnNtaeOBTHdV2po9dXQT8rrSKa7L
         tLNynXhXVM65RuC1uimaHfAStZrpiXMpRY4C19LPeC2OaXPZiGGW9PJq6QCKfTu+9ikn
         RU2psEjs6z97UJUrmeNuXy6TQYF3lKUpGesaagI0oqs7iY0LgFWM1yXSTVSyh3uV2hOH
         sdF19Leo9wFxy3COnMShQE7anvqX5jmTIAda7bGTYnilDYAAqSK49O57VfKpys+LnjaA
         +T6Lj+FnwWnd0/A6YYMYhuYordbNZIn4M+7AHIKMksOzHM43EjfOm56pHAw9CjaZ52u5
         Dr2g==
X-Gm-Message-State: AOAM530oxp+KDZFwudcn7/nMT/vdy36CnVlLeUPwZfD5ljqNgoX8q3U7
	DPqXeUrWLF3dsCq46SsF1TOOaiu2V2yg/A==
X-Google-Smtp-Source: ABdhPJwsKgNV3cPiD9TrtXbK9HKktzCfDTOLo+V/YFPTCPGvEhMuQpFyfdWIyp/ckbjkAyUzhC9eOg==
X-Received: by 2002:a17:90a:bc8d:: with SMTP id x13mr12797414pjr.229.1600063330162;
        Sun, 13 Sep 2020 23:02:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::cafc? ([2601:646:9200:4e0::cafc])
        by smtp.gmail.com with ESMTPSA id u15sm8180281pjx.50.2020.09.13.23.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2020 23:02:09 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] qemu: always define unknown_lock_type
To: "Yu, Mingli" <mingli.yu@windriver.com>, Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20200910025728.3868717-1-mingli.yu@windriver.com>
 <CAAnfSTsTmAE5fbvTck6m9rsQGa_FebUMWmAXEvKkCfq2TWjiZw@mail.gmail.com>
 <26851540-6c95-c58e-7ae9-87d2ba546478@windriver.com>
 <236780a1-589b-589e-3e76-00d829868a0a@gmail.com>
 <3d6f9248-f819-debb-0d71-de29ee312ead@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
X-Pep-Version: 2.0
Organization: HIMVIS LLC
Message-ID: <eabcd7ed-88a8-8453-18dc-af4fcc92c9d8@gmail.com>
Date: Sun, 13 Sep 2020 23:02:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3d6f9248-f819-debb-0d71-de29ee312ead@windriver.com>
X-Groupsio-MsgNum: 142493
Content-Type: multipart/mixed;
 boundary="------------C6995FB30D5234FCD1631422"
Content-Language: en-US

--------------C6995FB30D5234FCD1631422
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 9/13/20 10:44 PM, Yu, Mingli wrote:
>=20
>=20
> On 9/14/20 1:26 PM, Khem Raj wrote:
>>
>>
>> On 9/13/20 6:50 PM, Yu, Mingli wrote:
>>>
>>>
>>> On 9/10/20 6:41 PM, Ross Burton wrote:
>>>> On Thu, 10 Sep 2020 at 04:03, Yu, Mingli <mingli.yu@windriver.com>
>>>> wrote:
>>>>> +Upstream-Status: Submitted [qemu-devel mailing list]
>>>>
>>>> https://lists.nongnu.org/archive/cgi-bin/namazu.cgi?query=3Dunknown_l=
ock_type&submit=3DSearch%21&idxname=3Dqemu-devel&max=3D20&result=3Dnormal&s=
ort=3Dscore
>>>>
>>>>
>>>> doesn't find this patch, can you link to it please?
>>>>
>>>
>>> Hi Ross,
>>>
>>> The link is
>>> https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html=
,
>>> will include the link in V2.
>>
>> are you compiling without __OPTIMIZE__ defined ? qemu may not work
>=20
> Hi Khem,
>=20
> I didn't especially customize something for __OPTIMIZE__,=C2=A0 could yo=
u
> help guide where to define it?

perhaps you are not using one of -O<n> option ?

>=20
> Thanks,
>=20
>> without it.
>>
>>>
>>> Thanks,
>>>
>>>> Ross
>>>>
>>>
>>>=20
>>>

--------------C6995FB30D5234FCD1631422
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------C6995FB30D5234FCD1631422--
