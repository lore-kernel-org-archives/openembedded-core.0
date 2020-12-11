Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web08.9704.1607705458682251256
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Dec 2020 08:50:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pUD6lwd3;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id w5so6728416pgj.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Dec 2020 08:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xedWOpPrPtIBUi0kryL/9Z22VBuGtsouXNBrXtnqcNc=;
        b=pUD6lwd3e1Gni5aMbAOUGA8vOhHgy0RonpUeDeqR+PfGRKPCmvm8KuF6aK40AQmo5y
         HXTfq7rX057LaUHko5tMYJwi2alvJZ+4yK/MBApTyKjrJET4VSwr6UIcNRVPCG5QT2K/
         7l0z5gVrKk9VgapBAakpzpGlC9w9X98jV8D+L8n1rCrKlv+C4qfAKv7IcZE7xKpZq9oX
         TUEZgIQuVgy+17y4y3EYc5lOD3cFB0smfCbP9+T+1+nGE3CcvKiqRVQ3HB7UOGMi91rP
         0j6APUednhkpJxS3CAuBjgNiCvD9EgID37kOHPvLHSiaNDdVyvh67cInReGuuFtquGQx
         B2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xedWOpPrPtIBUi0kryL/9Z22VBuGtsouXNBrXtnqcNc=;
        b=fPFuaM4xBzzXjdbI+2EOrJMJz1DkGlIrV88oAKuqbyFH9iYmYfRcMJuIF1C7eiR9Fk
         Elrt1yy+tJifDk+AF2nU11fbErnJzBru0POd2npThBqGmDY2bVk0AdwLlXsgY4t04BR3
         XrmxUzFtXlT9VGyiUXgXJdnY4z6ib0es8IsIIxupDY3LhVR/N/LEBD8YfvI0/5vvUNaa
         aWR8Bf2gBkanBLyH3b3ez6BSIlkaHyLjPdt7ALSOhRuD0K/Eu6krIRnAcmyzitKfHzex
         2xLJ+UITcRUSmj6lKUSPACtSZIArv9lZdmXkN5UOhJFCSwdEm05IgRDGA5hZu78WjPkm
         SvTA==
X-Gm-Message-State: AOAM533ktoOc7FaVVSsdBIVgnv65nzcZwgwE+buUKMzAba4sBIXS6lAT
	kKivdPo4gOeuBlPMrwGKp23oeWja3RYbog==
X-Google-Smtp-Source: ABdhPJy25Nlz5g1TQLM9Efgj2CjMBKel7VXRcs8CJXhogBLFNBL5P8n+V33dQuRn+jjqIWrvhJdafQ==
X-Received: by 2002:a63:f64c:: with SMTP id u12mr12601131pgj.325.1607705457942;
        Fri, 11 Dec 2020 08:50:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::5bf5? ([2601:646:9200:4e0::5bf5])
        by smtp.gmail.com with ESMTPSA id p127sm10961009pfp.93.2020.12.11.08.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Dec 2020 08:50:57 -0800 (PST)
Subject: Re: [OE-core] [PATCH 1/5] systemd: update 246 -> 247
To: Luca Boccassi <Luca.Boccassi@microsoft.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
 <4b5b304d-9cff-4a61-16b9-6dd8fba58626@gmail.com>
 <22ce46324e27aacc8cddee2c3f716adae091fbfb.camel@microsoft.com>
 <CAMKF1sq05u5zXapFPL15RH7rk4JiDEw90-2oSg2cKqLTmtyrUQ@mail.gmail.com>
 <122e93194688da60d85431ddf66491dfa914878b.camel@microsoft.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <bb0f18cf-f787-41d3-faaf-f51d856d8b83@gmail.com>
Date: Fri, 11 Dec 2020 08:50:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <122e93194688da60d85431ddf66491dfa914878b.camel@microsoft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/11/20 1:32 AM, Luca Boccassi wrote:
> On Thu, 2020-12-10 at 12:40 -0800, Khem Raj wrote:
>> On Thu, Dec 10, 2020 at 10:05 AM Luca Boccassi
>> <Luca.Boccassi@microsoft.com> wrote:
>>> On Thu, 2020-12-10 at 09:08 -0800, Khem Raj wrote:
>>>> On 12/10/20 4:53 AM, Luca Bocassi wrote:
>>>>> From: Luca Boccassi <luca.boccassi@microsoft.com>
>>>>>
>>>>> Update systemd to v247.1.
>>>>> Add rule for new oomd dbus conf and for new pam.d
>>>>> conf directory in /usr/lib.
>>>>> Drop selinux-hook-handling-to-enumerate-nexthop.patch,
>>>>> merged upstream.
>>>>> Backport 0001-meson-set-cxx-variable-before-using-it.patch
>>>>> from v247-stable to fix builds without C++.
>>>>> Refresh musl patches.
>>>>>
>>>>
>>>> perhaps we need to update systemd-conf and systemd-boot recipes as well here
>>>
>>> systemd-boot is updated to use the new meson patch. systemd-conf didn't
>>> need it, at least for me? Does it fail to build for you?
>>
>> no they dont but I thought they should be reflecting systemd version I
>> would think
> 
> Sorry, I don't follow - the patch does rename systemd-boot and
> systemd-config from _246.x.bb to _247.1.bb together with the main
> recipe. What is missing?

Right somehow I overlooked it, should be fine as such

> 
