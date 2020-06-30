Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web11.18077.1593531410171979636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 08:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IyE9TGVN;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id x72so149489pfc.6
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 08:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MQNmSDqbtb32NWULkXk2Ody977F+nSTbmT5DDQW1Jpk=;
        b=IyE9TGVNw8o9NvCh9xNMysDI/bLgHpkic6HNPB9lA5qipJ74uk98D8G/734/DJcG7e
         3sfB3xu9sqx1BB+bd+wSQjw8a/GnU9XV4W2AbXc3ERoTMFic2KcZm/vPtUlnpRdQ/sxT
         LSEwhmyAl5rdjYsOvff9NoEedEqGNxs8x2ANiY6emRB2/qTvEhGv6OQoZItT9g8CqnNz
         hPSQ37JxvcJK+f4tE+9NfYlebkH3+spaKHuiGdaSHWbzZUccj2yG5r+o1I3pxVTQZ7q1
         Kk6fXiIZZq0tYk7DPIFPmwJ7KlH+l8LTVGAGc8qZLal0C3BbsAJSUTG929AEpc6xgtOk
         LDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MQNmSDqbtb32NWULkXk2Ody977F+nSTbmT5DDQW1Jpk=;
        b=dQ+EARIr499yleYC0QuFXO7A49ra1k4wM0DcXvG5Y2n2ZJH/PM6DuE7zV0MrPAQ/PL
         41QYwu9svnTNr+CZ37e5rOmqHAoU+D1K6w29fB6Be1Px47pi9Av0cK6HDEm0xclkw06c
         FT2/oFQnoR9y02iJJfEon1D0RBIhcTtfu3P2eDItbTSgi2VS8/99ZZ3BJtEj5xyt8Zrw
         1UaVjGwec0svahQaw0tWsQpWrNk3tglq3uelEOl7SbsOb18VYFOMTTgwAOOkvtH0lvKz
         Q1gEaarxZmMZ7+RGfaygkFtXFb73EpAZMe//RrwuyOVsHr49zuBDC7ks7GQGb1x0WXRN
         p3IQ==
X-Gm-Message-State: AOAM531SVT2e5zSTywyzYO8Pshp6prStt6pUqQQ3cz/LDPEPvMcPtgwG
	ByGV8tgNMKYqPP8AxZCmVeM=
X-Google-Smtp-Source: ABdhPJxC06NwZRkLCx7uD21eP3i2k+j9AoUazbqTuwVqEp/W41I2IsYmiIocae6w21R+df38okJ+5w==
X-Received: by 2002:a63:541a:: with SMTP id i26mr14592462pgb.98.1593531409240;
        Tue, 30 Jun 2020 08:36:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:2c51:53a1:364:7e03? ([2601:646:9200:4e0:2c51:53a1:364:7e03])
        by smtp.gmail.com with ESMTPSA id z26sm2983306pfr.187.2020.06.30.08.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 08:36:48 -0700 (PDT)
Subject: Re: [OE-core] Add package managers as a plugin
To: Ross Burton <ross@burtonini.com>,
 Fredrik Gustafsson <fredrik.gustafsson@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 tools-cfpbuild-internal@axis.com, hugo.cedervall@axis.com
References: <20200625101413.2783-1-fredrigu@axis.com>
 <CAAnfSTuK-ucvmFTK9+oexvPyaXgTg4Tn3nhKSMwjhRxe=NUXrw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <54811e28-bdc0-35be-8d76-d859751a78fa@gmail.com>
Date: Tue, 30 Jun 2020 08:36:47 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAAnfSTuK-ucvmFTK9+oexvPyaXgTg4Tn3nhKSMwjhRxe=NUXrw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 6/26/20 3:52 AM, Ross Burton wrote:
> On Thu, 25 Jun 2020 at 11:14, Fredrik Gustafsson
> <fredrik.gustafsson@axis.com> wrote:
>> Poky today has three different package managers, the well-known formats deb
>> and rpm is supported as well as ipkg that is good for embedded devices.
>>
>> When building and having a good cache hit, a significant amount of time is
>> spent in the phase of generating a rootfs, which is really about the
>> performance of the package manager. ipkg is way slower than deb or rpm. To
>> save build time and also get a package manager that is suitanle for use on
>> targets where flash memory is a concern, support for apk is suggested.
>>
>> However, it might or might not be what's wanted for Poky since it increases
>> the test matrix. Therefore this patch series refactors the package
>> management code so that it's possible to add more package managers in other
>> own layer. I will send another patch serie that will add apk.
> 
> As to the code review I mostly second what Paul said.
> 
> However, obviously you actually have strong feelings on this as the
> series represents a fair amount of work.  What are the compelling
> reasons to use apk?  Five seconds on core-image-minimal doesn't really
> sell it to me, I don't think anyone ever claimed that opkg has been
> performance optimised, dpkg isn't really used that much: maybe we
> should re-evaluate what package managers are supported if apk has
> feature parity but is significantly faster or has other advantages.

25% is a lot, real world images are way more complex than reference 
images in reference distribution, we have images which use 7 to 10 mins 
in rootfs, I have seen a desire by many developers in optimizing build 
time so this could be a real help, especially where we dont care about 
package management at runtime, we have done many micro optimizations and 
rejected patches since they added to build time because we want to be 
sensitive for increasing build time. rootfs is one task where sstate 
caching does not help as well, while other package builds we can benefit 
from sstate, rootfs not so much hence such an optimizations, if we test 
it regularly perhaps can be debated, but it certainly seems interesting 
option to have.

> 
> Ross
> 
> 
> 
> 
