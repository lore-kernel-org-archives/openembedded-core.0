Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.8538.1615740716924737221
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 09:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HsxHYyrI;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id gb6so7543722pjb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Mar 2021 09:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ARqoXJGmR91QDUwTwjSs3hc/mLYO9t2OnxvpGaNcEIA=;
        b=HsxHYyrIrOox8Ym0tJb5yAPreAPnKhCIaAyl+tBxLmOi342GUSYf4SDd6tdJ/mGCfd
         D652+TN6bt/xxdzPet3Z/i9VTxA1D3vHqhPz8QM2sPyUCATDPKNM0g4Q9nNT6q5bttrF
         LGMIDuAzDGQSzXjUHb5QAzUsmGEkFBHyi/vE6fJ54QSla3A1XlpjjJiyBRhXRi4qIObs
         BGOlMFN3qGOs2A+jicV9V1a6F0y9BTb9NJXY2cNC/D2F+Y4qz8SCvsKvabYgyTzMq1Xn
         XEvIsbY1G/nXxYLo6ZvCKpjlAfjWWGnZuGivi8wRdvE/I6Fx8Eiv9J+eEVnzeyoT4Rbb
         bU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ARqoXJGmR91QDUwTwjSs3hc/mLYO9t2OnxvpGaNcEIA=;
        b=EBKjaPWDQadqd1w5QoMYFLKhJtnLjDfxVeRix7F5MqoDrBesByRw6/KAKqbxZAWBAE
         cHXQ9swvk+AaYflk6iVpKJIXkui8jLVeEqJ9igHxyMwq3cglb6XAeZleHZoMecseuNa0
         qw8RSmXHMjeOtEVQJwvo81yR7Clk4VaXRwOyAo+qkelgP3WyVEAcLWXSzZYPVxkmz4wO
         XKMTIruE0K4ZTCMTtDXOhRyONd2bO1h0bV31T20Pton1gy79i/hJJ5ypPvH0/QRKjbXC
         TgLH6YnX30viUn6KhTr3xlD82l1Kyzm0DuUh1ipG6JxUNFZWM6J3f/CdkJdyYC+C9VdN
         +oOA==
X-Gm-Message-State: AOAM532u91fTzj/StgsizUSytV4k0U6lnarxHKwRFDaLDQ0nfkqxlux0
	YhZ1mbYFJVfe6txpzbhaLJ964hYeMxY5lw==
X-Google-Smtp-Source: ABdhPJyNyf0op3ObzxeYaKaVttIvEnNYc/ciYZVYj3ErUBT6nDdVIAOU6iZNNPn5OmuzlV1sqmqc+w==
X-Received: by 2002:a17:90b:108f:: with SMTP id gj15mr8808249pjb.177.1615740716085;
        Sun, 14 Mar 2021 09:51:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::d2c6? ([2601:646:9200:a0f0::d2c6])
        by smtp.gmail.com with ESMTPSA id b3sm8166046pjg.41.2021.03.14.09.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Mar 2021 09:51:55 -0700 (PDT)
Subject: Re: [OE-core] GCC crashes on aarch64 since gatesgarth
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Randy MacLeod <randy.macleod@windriver.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.443c6779-935d-4b0c-bd2a-e7ccda1d0c4a@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1d651819-d3eb-4e73-bb7d-d97ad0bed5fe@emailsignatures365.codetwo.com>
 <165E1F647C435468.32571@lists.openembedded.org>
 <cf285d04-d8e1-e3a2-25de-9c3f02ad0678@topic.nl>
 <086cde14-14c7-0c28-1cc4-33156b45bf0a@windriver.com>
 <9af0d495-c07f-2ea4-4084-bb24fad59747@topic.nl>
 <CAMKF1sqj+tfjzHDeJbaNjeg139CQgNKvhrb0gejDbuxk4TN-LA@mail.gmail.com>
 <166B8838D6F42875.480@lists.openembedded.org>
 <60c5b306-14b8-4f3d-4c38-b7b35f4ba0c9@topic.nl>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <5d29f648-ee99-7ad3-c663-4d23701c6b2f@gmail.com>
Date: Sun, 14 Mar 2021 09:51:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <60c5b306-14b8-4f3d-4c38-b7b35f4ba0c9@topic.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

if you are using poky then its on by default you might have to disable 
it for this test

conf/distro/poky.conf:require conf/distro/include/yocto-uninative.inc
conf/distro/poky.conf:INHERIT += "uninative"


On 3/14/21 8:00 AM, Mike Looijmans wrote:
> 
> Met vriendelijke groet / kind regards,
> 
> Mike Looijmans
> System Expert
> 
> 
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
> 
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topicproducts.com
> W: www.topicproducts.com
> 
> Please consider the environment before printing this e-mail
> On 12-03-2021 08:37, Mike Looijmans via lists.openembedded.org wrote:
>> On 12-03-2021 08:33, Khem Raj wrote:
>>> On Thu, Mar 11, 2021 at 11:22 PM Mike Looijmans 
>>> <mike.looijmans@topic.nl> wrote:
>>>>
>>>> On 05-03-2021 00:32, Randy MacLeod wrote:
>>>>> On 2021-02-05 2:49 a.m., Mike Looijmans wrote:
>>>>>> I've been doing quite some tests and things last week, my conclusion
>>>>>> so far is that the latest gcc seems to trigger a bug particular to
>>>>>> this CPU. Maybe even this particular batch.
>>>>>>
>>>>>> Hours of testing found no issues with RAM.
>>>>>>
>>>>>> I've also done huge amounts of builds with zeus, no problems.
>>>>>>
>>>>>> Then googling for "illegal instruction gcc ryzen 1700" reveals quite
>>>>>> a few threads on something that sounds suspiciously similar. Though
>>>>>> it makes me wonder why I never encountered it before, since these are
>>>>>> all many years old. I did try a bunch of the suggestions done there,
>>>>>> but so far no luck.
>>>>>>
>>>>>>
>>>>> Any update on this bug Mike?
>>>>> Have you opened a YP bug? If not please do.
>>>>> I'd like to see if the problem still happens on master.
>>>> Interesting.
>>>>
>>>> I just built the 64-kernel using OE master and no crashes, everything
>>>> went fine. With the gatesgarth branch, it'd crash at least two times
>>>> during kernel compilation.
>>>>
>>>> So something has been fixed since then?
>>> can you try by disabling uninative ?
>>
>> Probably, if only I knew what you mean by that?
>>
>> What do I have to configure where?
>>
> As far as I can determine I think i'm not using unitative since I didn't 
> explicitly enable it anywhere...
> 
