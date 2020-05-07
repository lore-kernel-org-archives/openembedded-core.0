Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web12.3341.1588882842623737357
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 13:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mCf82XUa;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id b8so2982932pgi.11
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2020 13:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ib5BC0mXIX6kk/jEOdqrRUzkTzFs2Vp4K6GBscCU6NQ=;
        b=mCf82XUakKozJL2T1npFKkoxuLBrlRaFGL24fHUfdJA8nRt0v3/F6xSdSj6lx4RA3R
         vsc1J8Mn/PGS2z6UigwJvAi1G8ynPGoSfm8GYFFjEEJQZC8dNDUikMQaYfCwD3C+0iet
         HQ6KRdV8r+ByDncTQAYWUJhr2yKazjDaAZ+vL/Btovl+9/9OIJ0MXzXnD9QzEeLv6Anu
         R/0DbPIcCpe6hUoKPvRRvGALBaKU/j2JM9mS/4zs9amlh9u3r5XdaYOtxyijUuTV2+To
         6CNyIg9iszTGBnI0p6kqv35v51EguVn/7xBHC8mcaKM4DJ+xAhnS6fHW21dvVl5E8I+6
         gMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ib5BC0mXIX6kk/jEOdqrRUzkTzFs2Vp4K6GBscCU6NQ=;
        b=UrifaRWoDynlJsY+9boLW2Z7kCZnqxHzKFOYm9ZgnJ5SIQ6gffrXi9Yh65K5p6ujkO
         QJEwm1AN9zupE5Kj/Nae8KJna7JJ11I/rrS3BZxm0XoF5ZcHKfkj21e3FObjHlLgJ1/q
         GToJ/2Ob0JcRxUZTjxOq87YtyV7mJashaIVXjeQJXljpJn9JR8QXOZ80SHufFBKHXau+
         iE5dhTU3ML+WFG6w28cTpsikFlsRrvO27OO04OkFk/bb/qA5btB06yRnHoVHe5paj4DS
         OGdu8pgdhP5JoRNYMQjz7AvK4n65AkMEyyOhP/OzqLFJvsbtA4fxT8syxziHmtknw59v
         I7ZA==
X-Gm-Message-State: AGi0PuZdH5sM0rKEQBjg5fdFvN7jTDK6rmkdC06i65qeItBAuS37HRXD
	diOiVFqN4WpBPAx77vYn+WQ=
X-Google-Smtp-Source: APiQypJEDv9GmO48P94x04zIXpgl7dUFEev2jjkvHTmVsgtLfsQZ6GpQ/aSSXCNecNIw1fb4TVB1LQ==
X-Received: by 2002:aa7:943c:: with SMTP id y28mr5041210pfo.171.1588882841832;
        Thu, 07 May 2020 13:20:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::2691? ([2601:646:9200:4e0::2691])
        by smtp.gmail.com with ESMTPSA id w126sm5528105pfb.117.2020.05.07.13.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 13:20:41 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/2] populate_sdk_base: Add ld.so.conf for nativesdk-binutils
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org,
 Ovidiu Panait <ovidiu.panait@windriver.com>
References: <20200428125747.27422-1-ovidiu.panait@windriver.com>
 <CAGDS+n=sk=UvThgL+VTa=L3mbbymTdPPYciRkT3Uw+ybrucLgA@mail.gmail.com>
 <01ab6569-2e2e-1569-d3be-930f4a6037d7@gmail.com>
 <20200507195709.GD11927@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Message-ID: <32b9edf2-a77a-65d5-8c1e-e7cb03a7d29a@gmail.com>
Date: Thu, 7 May 2020 13:20:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507195709.GD11927@denix.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/7/20 12:57 PM, Denys Dmytriyenko wrote:
> On Thu, May 07, 2020 at 12:44:15PM -0700, Khem Raj wrote:
>>
>>
>> On 5/3/20 3:51 PM, Steve Sakoman wrote:
>>> Should I consider these two patches for dunfell LTS?
>>>
>>
>> Yes I think they are fixing a problem and are safe.
> 
> I don't think it is safe though!
> 
> The code has been moved to create_sdk_files() which is a POSTPROCESS command 
> for SDK creation. What if SDK already provides own /etc/ld.so.conf? The code 
> just simply overwrites it.
> 

but are there such usecases ? looking closely if SDK is extending the
ld.so.conf then they should be appending to it instead of overwriting
and same is true for this patch for master.
