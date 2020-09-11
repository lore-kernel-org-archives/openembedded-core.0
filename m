Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.1034.1599797784858602084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 21:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EO5UeS0+;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id kk9so1075185pjb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 21:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1RwNDR85yVkc/HarM60+Y8jxLCQhAueueVqdyvTea+I=;
        b=EO5UeS0+mFrL3WDIkLfdUKWjkp/pRvBQIBLBaXl8/z4d9q+x9dfkm07S51Ch45qq4O
         WbVXkymM9SNU3uAe0NRs98zfcepZnBTJyiKqgq4epL7xrmEoPXpg7aw5LAV1O7P07sC0
         h8Ey/HLZQcjWG3/kpK6kCwj9CCBvGB0bC4E52DDwgqlpg0G4zQGpm81vO0/D4Tb/hiR6
         6LdlsrR7P4nejVM5NlUxFv4vbAdWYBHUNBpwbGXPb36GBebgnMInq8vDRGl/qU24D10y
         zS/hzCB0VZNNyAXdomOa0vcZtre+dUVRkpdB4n7BzNSV89d4zbkNAhNK7f9EAt0NM6JV
         Zgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1RwNDR85yVkc/HarM60+Y8jxLCQhAueueVqdyvTea+I=;
        b=NAdzJbGfCMeUmZvN83dUBAtbfOpK6xByi7YLyvePWOW9igwWX2IIeFOypvpIxeCgrA
         nnGxCH+nQGVj8blRRxjRrl69wO+TCu9H2COsbH85irjsutaQBTGUUVlRvVdNGVc3yAFi
         mSY3HcHfD8nLgR5EvJ6dtQiNy7VS74+L+1L76CPWj5cD7DD8NRv+6m1ZVGTAXZ5nShlB
         t/L91FMvhqyy+0zHE4ngsvScf6Imtbw8+YLGT87SToRgtoxW5Ik3jtyeNn4kjuouqo9a
         n7VATOnmJ7EnUJv8mWcYEjy122KVNHTFGz5NfFAUh1VQQUmY08kOuHYSPyEl9i24MPD3
         KqFQ==
X-Gm-Message-State: AOAM533gj3cVXBY67lugyyRbmIupDPazhVIECKQTyGzYDZGNcsnHfu1H
	jzohOAnLF8BS91ViFY+3ZC4LqhOGkYQvUw==
X-Google-Smtp-Source: ABdhPJwTFXZO1VJ5mMuD9LCokI+gEiqjn/OFQfePP/EVybgIIUYx2L/3NpBJ06jBiaK6685ZcmAxOw==
X-Received: by 2002:a17:90a:e016:: with SMTP id u22mr518418pjy.178.1599797784001;
        Thu, 10 Sep 2020 21:16:24 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:d9a:84f1:6cc7:73ee? ([2601:646:9200:4e0:d9a:84f1:6cc7:73ee])
        by smtp.gmail.com with ESMTPSA id w206sm659725pfc.1.2020.09.10.21.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 21:16:23 -0700 (PDT)
Subject: Re: [OE-core] [PATCH v2] cryptodev: bump 1 commit past 1.11 to fix 5.9-rc1+
To: Denys Dmytriyenko <denis@denix.org>, richard.purdie@linuxfoundation.org
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1599700598-39322-1-git-send-email-denis@denix.org>
 <CAMKF1sp9wrwonL4iW2MWcGqK557vP5Ci-hprdu+zLx0bbm1FwA@mail.gmail.com>
 <20200910195532.GE17660@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <a06b8fce-0c33-c6a8-990e-3da09ee673bc@gmail.com>
Date: Thu, 10 Sep 2020 21:16:22 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910195532.GE17660@denix.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 9/10/20 12:55 PM, Denys Dmytriyenko wrote:
> On Thu, Sep 10, 2020 at 08:46:36AM -0700, Khem Raj wrote:
>> On Wed, Sep 9, 2020 at 6:16 PM Denys Dmytriyenko <denis@denix.org> wrote:
>>>
>>> From: Denys Dmytriyenko <denys@ti.com>
>>>
>>> There's one commit on top of 1.11 release that fixes builds against kernel 5.9-rc1+.
>>>
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>> ---
>>> v2 - append SRCPV to PV
>>>
>>>   meta/recipes-kernel/cryptodev/cryptodev.inc | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
>>> index 906f4fc..027d636 100644
>>> --- a/meta/recipes-kernel/cryptodev/cryptodev.inc
>>> +++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
>>> @@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>>
>>>   SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux \
>>>              "
>>> -SRCREV = "2299d39475e91392abd050ea09f2d20feecb4adf"
>>> +SRCREV = "fabe5989a3dc9fba0cd0a40b612247cdde351c01"
>>> +PV .= "+git${SRCPV}"
>>
>> I just saw that this change does not go well with some of
>> meta-freescale changes which uses the inc file paired with PV, so
>> perhaps keeping the version at same PV
>> or creating a single patch is better.
> 
> Well, it's unfortunate that it affects some downstream layers, but that never
> stopped changes in OE-Core before - as a maintainer of few downstream layers
> myself, I had to adapt to such changes in the past many-many times...
> 
> Anyway, alternative would be to use v1 of the patch.

Richard

yeah lets go with v1

> 
> 
>> now ends up with.
>>
>> ERROR: ParseError at
>> /mnt/b/yoe/master/sources/meta-freescale/recipes-kernel/cryptodev/cryptodev-qoriq-tests_1.11.bb:2:
>> Could not include required file cryptodev-qoriq-1.11+git${SRCPV}.inc
>>
>>
>>>
>>>   S = "${WORKDIR}/git"
>>>
>>> --
>>> 2.7.4
>>>
>>> 
>>
