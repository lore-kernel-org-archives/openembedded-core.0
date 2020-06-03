Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.2059.1591208244414454524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 11:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pA72n1gn;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id t7so2318864pgt.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 11:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=eu5KGsUnbB5Amv3zbpGhS9MyXyKexl7wsuiKhZC+b7o=;
        b=pA72n1gnOI6v3PM05iWBXR7lcUErOoEk7ODbn+ymYunNdY6kmALW0F21Qvppulhmbt
         n4vJZRJlWC9Db5PiOon8hGPfrBaE45O9JmlF2eOuT+S/B6XjKdVqwopI9HilX0Lljt3p
         MBMgXn0ONfSNISK5HvOPPeUB4G/FhpcTXZChAvKlSclrNJ6mHxNga/NYjcnCv6MI6lam
         93z4bgZ68JEyllENBzJ6LiL3FxIlcTBu7VCcRqYbXadwJUDDMg0kXyg02F7v8bEOoGRV
         UBG4Aa8Jqa3K7r4eUd39iZE9OiBnCEIkPcodgdtu4gLSzG1n16gJy5HqS/99roBqPLvJ
         zETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=eu5KGsUnbB5Amv3zbpGhS9MyXyKexl7wsuiKhZC+b7o=;
        b=Or8DS6/bS2EuDZyaL0jZYii3BjrOPqNTqHTxVUoIeeScDek0hSH2SF/7Tpp4b7c1ph
         H/9C1qOcjnrUZGpi4IMi8jd7hrHfF5T9L0xESY61ucTylcWOqp6REW6m1J1nZ7acpAcA
         85tnsimsGajJBzboyZODY70x8y6Y3XH8YUUxEkgskYxTcTH2s9iWpUZ0dLNlvA2zXZZG
         8MwJuJMvF0R40rjthYvyiSdMnGt0wToXxE3XY1zabHmEguiTuNH6owPo3C3+bAFIT848
         wUGlnvjENxcCETN/f4zr8Ui3UBreSUqij++jPpzVpwv7AqdSiI7W9D2OTIaaZZD/mrD3
         9LhQ==
X-Gm-Message-State: AOAM530Wveomrnp7Y93XZaI42PLsAcSF1uyaXUCLc8LYDw8kwF3aruKb
	EUJEBCmmOFKYlyotTWW0TrUiWGUN
X-Google-Smtp-Source: ABdhPJwt6nCnxYmchK38vl67yLkGgfkRzPeM8HsZE+5rxtpjOO+B2ieeqaf7eaWGYKZuIXrlkZj5dQ==
X-Received: by 2002:a63:3147:: with SMTP id x68mr620462pgx.418.1591208243600;
        Wed, 03 Jun 2020 11:17:23 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:7c6f:fec8:5548:f4b0? ([2601:202:4180:a5c0:7c6f:fec8:5548:f4b0])
        by smtp.gmail.com with ESMTPSA id s63sm3247195pjj.16.2020.06.03.11.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2020 11:17:22 -0700 (PDT)
Subject: Re: [OE-core][dunfell 0/5] Patch review
To: Denys Dmytriyenko <denis@denix.org>
Cc: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org
References: <cover.1591197295.git.steve@sakoman.com>
 <fa08dc08-22f5-f82f-58dc-02b976acdf2b@gmail.com>
 <20200603173620.GY17660@denix.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <9c5425d3-fc0a-a63e-e090-e83f364edd3e@gmail.com>
Date: Wed, 3 Jun 2020 11:17:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200603173620.GY17660@denix.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/3/20 10:36 AM, Denys Dmytriyenko wrote:
> On Wed, Jun 03, 2020 at 10:33:55AM -0700, akuster wrote:
>> Does someone have the complementary set of patches for meta-openbedded
>> to remove these?
> https://git.openembedded.org/meta-openembedded/commit/?id=a8f3c00d8d113b46a49584682e10435157d516ca
> https://git.openembedded.org/meta-openembedded/commit/?id=7aee545a61c4f91d5e462d5b46b1b8f9a8bad1e3
>
> Do you want me to re-submit them with [dunfell] tag?

changes in stable/dunfell-nut for testing with my other backports.

-armin
>
>
>> - armin
>>
>> On 6/3/20 8:33 AM, Steve Sakoman wrote:
>>> Pending final approval for an exception to LTS policy in this case please
>>> review this patch series and have comments back by end of day Thursday.
>>>
>>> For details on the motivation for this change see:
>>>
>>> https://lists.openembedded.org/g/openembedded-architecture/message/1085
>>>
>>> The following changes since commit ef5af31f406076107402694f5d6afb27b240eba6:
>>>
>>>   linux-yocto/5.4: update to v5.4.43 (2020-06-01 07:19:09 -1000)
>>>
>>> are available in the Git repository at:
>>>
>>>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
>>>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut
>>>
>>> Joshua Watt (5):
>>>   pycryptodome: Import from meta-python
>>>   pyelftools: Import from meta-python
>>>   python3-pycryptodome(x): Upgrade 3.9.4 -> 3.9.7
>>>   python3-pyelftools: Upgrade 0.25 -> 0.26
>>>   layer.conf: Bump OE-Core layer version
>>>
>>>  meta/conf/distro/include/maintainers.inc      |  5 +++-
>>>  meta/conf/layer.conf                          |  2 +-
>>>  .../python/python-pycryptodome.inc            | 26 +++++++++++++++++++
>>>  .../python/python3-pycryptodome_3.9.7.bb      |  5 ++++
>>>  .../python/python3-pycryptodomex_3.9.7.bb     |  9 +++++++
>>>  .../python/python3-pyelftools_0.26.bb         | 14 ++++++++++
>>>  6 files changed, 59 insertions(+), 2 deletions(-)
>>>  create mode 100644 meta/recipes-devtools/python/python-pycryptodome.inc
>>>  create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.9.7.bb
>>>  create mode 100644 meta/recipes-devtools/python/python3-pycryptodomex_3.9.7.bb
>>>  create mode 100644 meta/recipes-devtools/python/python3-pyelftools_0.26.bb
>>>
>>>
>>>
>> 

