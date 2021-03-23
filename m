Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.11065.1616514504959211616
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 08:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mx/VrAUQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id l3so14727411pfc.7
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vYXGU62OjPv9iqJV0TtrUJHxet9JJXao6rinajI+Bns=;
        b=Mx/VrAUQAj8PgAf6xGd2N/v/tIMGvsqTYvyaUSy0JsA3Zt8WY7MElqAuWpHFPKn5OM
         BQSC50DoXwvkzCO6S/m3XBV7FzhUYLRhFELPfQ7IvI0nT4t0qGSL1POxsxhsm5kVCYV6
         Hw3XUuNgV84SVXBr8ltDlHqmZeqkhorWyzpHVpKsBIemTuwBNq8YPQjv5Fk22QExdKMp
         hz0Z1777u5etH1lU9cA/iXUS0AdYHsAg3vjMHTtNSrRkJWsCvu2K/YPwjnMvKcSFSbQR
         mk4wdtLRkZPFQz2W/vYA/ScuyStj0mY0E0mkkpG7ao4E8sbb7otpmxDnuMscwtOFHGN9
         ZOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=vYXGU62OjPv9iqJV0TtrUJHxet9JJXao6rinajI+Bns=;
        b=U5G9RaijyI121Po5kEceBWCFTPrTrBKX2E4rVrjoGIdXPNRsbdnt3DtPZJrJ0rvfZR
         a4q0wOpd56rJpETwp3tYfsseCWJCdHT0b2XzCS0F0W2fhBRyJUZ4fW6VOul84w1qmPUM
         7SAPt4IPedfXFmfZ+F2hjQqJFxEmE+7mGXnPsceMr4jDkwq806YNDkp8Co+WYSAE/51C
         aDYNJXyRNjKOG822Sn3CeTBLjRcvE8B8ex3E62z4+caLDkda7AYP1sVoUVtaHgASHyj7
         Yg72WW2cqtkLFUuzOff4cdMMzUaejcm884kewX9HFOHStIF/WHQCUmM3uu8JQSbyDvzr
         dJgg==
X-Gm-Message-State: AOAM5310+Me0QkhwHYT9wlbFBw/uR5ZYIhonI4zH6cr1g29u2PTLIde1
	FZsbhFu3YlM6mez51OgCdv4Wc9+Ppvz5hA==
X-Google-Smtp-Source: ABdhPJyOH/zXhttChCaODH9SjsrVBcLlEd5V0dSJ6mj+rMC1piMO8Kv+wK+D+zvQoA+vAghHD3AlnA==
X-Received: by 2002:a63:5c48:: with SMTP id n8mr4506077pgm.411.1616514503998;
        Tue, 23 Mar 2021 08:48:23 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:2da1:1afd:1712:ea8b? ([2601:646:9200:a0f0:2da1:1afd:1712:ea8b])
        by smtp.gmail.com with ESMTPSA id r2sm15859475pgv.50.2021.03.23.08.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 08:48:23 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] linux-yocto/5.10: update qemuriscv32 v5.10.23
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210322184455.35623-1-bruce.ashfield@gmail.com>
 <c9c62fdd-4dcd-5451-b4fd-3576c275d9ca@gmail.com>
 <CADkTA4M4mUO6ceWOqma+eSNazPUxZKnT5wqxGMRKayebrcVK+Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <1b1ccb2e-3cd9-cb04-a7c6-94ed6cbf917f@gmail.com>
Date: Tue, 23 Mar 2021 08:48:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4M4mUO6ceWOqma+eSNazPUxZKnT5wqxGMRKayebrcVK+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/23/21 5:16 AM, Bruce Ashfield wrote:
> On Tue, Mar 23, 2021 at 12:29 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 3/22/21 11:44 AM, Bruce Ashfield wrote:
>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>
>>> The kernel SRCREV updates were missing riscv32, so stayed back on
>>> 5.10.21, which causes build issues as PV is out of sync with the
>>> actual kernel version.
>>>
>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> ---
>>>    meta/recipes-kernel/linux/linux-yocto_5.10.bb | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
>>> index 9c122832f4..83e70d01d1 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
>>> @@ -18,7 +18,7 @@ SRCREV_machine_qemuarm64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
>>>    SRCREV_machine_qemumips ?= "68527a50a2f5b0992ba85255325d76a9f187c237"
>>>    SRCREV_machine_qemuppc ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
>>>    SRCREV_machine_qemuriscv64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
>>> -SRCREV_machine_qemuriscv32 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
>>> +SRCREV_machine_qemuriscv32 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
>>>    SRCREV_machine_qemux86 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
>>>    SRCREV_machine_qemux86-64 ?= "04a11eb4aec4efe3064f27b207e8a41c28bb08cd"
>>>    SRCREV_machine_qemumips64 ?= "c19b50af1e3680ff6050a0cce8dcd888accafd9b"
>>>
>>
>> I wonder if we really need to lock the machines using tip of
>> v5.10/standard/base e.g. x86/x86_64/ppc64/rv64/rv32
> 
> I'm not sure I understand the question / comment.

SRCREV for the machines are said is same and perhaps branch too. So I 
was saying if this perhaps is not required to set the SRCREV per machine 
for such machines.

> 
> They are on the tip of that branch now, but still must be separately
> specified so we have the individual control as needed.
> 
> But they all do need to walk forward at the same pace. Every -stable
> goes to all BSP branches. Supporting them on different versions just
> isn't sane.
> 
> Cheers,
> 
> Bruce
> 
>>>
>>>
>>> 
>>>
> 
> 
> 
