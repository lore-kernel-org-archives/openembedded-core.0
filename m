Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.9493.1621002612780253908
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 May 2021 07:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ciZvHESu;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 38so366920pgo.5
        for <openembedded-core@lists.openembedded.org>; Fri, 14 May 2021 07:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EuEhpqkyVMYKqV3WA/AXaucpLtxuXBqs1eJI5WSbQmQ=;
        b=ciZvHESuiZFC0izyjwOJJxftaHoftCjxWDd/i5w4xCSFKmOTCVcY0HePDX6jVZ6tAB
         AAhQfFBNgQMdOTys8QyhkDmfRIhSK2kwgd2F2UWdGb9ZCYOhEC64mlffYi5lY5HBzLGV
         WPPu6r4qi+bXKJovH5QMAQ8eUmcY6CLOC3NlWQGmeLVT84kJ2IaDUwwd3+z2aMUm+Fup
         oCIjONbOhnpTxUF8cKpNkA3EOdfT3l8koLp2MDMC3oHEgvBFjGBpVoId6RJDg5fAiuEw
         PNug+R9YWMywDg7PIncxyc0GiJgwlu9eHzE53rhKwTLLXo7ej0OL+K44S6wbnFpC8NnA
         9b+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=EuEhpqkyVMYKqV3WA/AXaucpLtxuXBqs1eJI5WSbQmQ=;
        b=AuzSFWezvDbaJYRdapSupJTmyVo8/Z6hswGTNJqwM2c9XvmFTcr2IYiD3AzU2mDKy9
         qMyBvn2gnOL/3p9aaEkM5TqW2pS99ySorjxqVQqtwowWuh59Mfi47MrLXQs2u5ZGUlGP
         iR8STOMi+KFuAC6LDA0zRztnYpYUGZgHi3jVpsOYMxvuhLa+On6gVPD3Y/0busZmv14P
         rtXZRyKYJn+SZyJ4W83TgOV3xNNB9rXJZBUBcF/b3SZ4+qXO/J8juNVjKNYiJEDYv3D9
         6bG6Ni/wRUlhCKn4xc1vlIaesm8lxlmymZaPGEknT5t/C8okLwspSMS26ldcGvPnmwWV
         eqXQ==
X-Gm-Message-State: AOAM5330R8YhP9LiPHDPm3jyLzT+3YLKOKPkjw0upksY2L/2rJvMI2e0
	inRGb11dBZtDKJ7GrEAnhtE=
X-Google-Smtp-Source: ABdhPJzaJX+BdFAPNgzBX7MWY+55pDwmhZhj4UXir0G05JeFYjTqWtv7UcDX5fjIsZAeZFihdt9MBA==
X-Received: by 2002:a63:4951:: with SMTP id y17mr10539441pgk.244.1621002612321;
        Fri, 14 May 2021 07:30:12 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::9c7a? ([2601:646:9200:a0f0::9c7a])
        by smtp.gmail.com with ESMTPSA id mn22sm9460853pjb.24.2021.05.14.07.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 07:30:11 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 2/2] gstreamer1.0-libav: remove explicit LICENSE_FLAGS
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Yann Dirson <yann@blade-group.com>
References: <20210513223847.1086544-1-raj.khem@gmail.com>
 <20210513223847.1086544-2-raj.khem@gmail.com>
 <CANPvuRnsot0330W_=bmEsGTpU3z-Vmcz2nFeD6+yKPO5+vXMbA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <607c7b17-dadf-7d45-13a0-86c6eb7a28c8@gmail.com>
Date: Fri, 14 May 2021 07:30:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CANPvuRnsot0330W_=bmEsGTpU3z-Vmcz2nFeD6+yKPO5+vXMbA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 5/14/21 1:34 AM, Jose Quaresma wrote:
> Hi Khem,
> 
> There has already been a discussion about this in
> https://lists.openembedded.org/g/openembedded-core/message/143935
> 
> In short: If libav needs ffmpeg, it will need that line (with a comment
> explaining its due to the dependency). Assuming libav without
> ffmpeg doesn't make sense/work
> 

yeah, I think this is perhaps not the best way to solve it. Lets ignore 
this patchset

> Khem Raj <raj.khem@gmail.com> escreveu no dia quinta, 13/05/2021 à(s) 23:38:
>>
>> From: Yann Dirson <yann@blade-group.com>
>>
>> This flag does not describe the gst-libav package, but ffmpeg instead.
>> It gets in the way of using finer-grained LICENSE_FLAGS in ffmpeg.
>>
>> It is above all not needed, the real problem is even more clear without it:
>>
>>   ffmpeg was skipped: because it has a restricted license 'commercial'. Which is not whitelisted in LICENSE_FLAGS_WHITELIST
>>   ERROR: Required build target 'gstreamer1.0-libav' has no buildable providers.
>>   Missing or unbuildable dependency chain was: ['gstreamer1.0-libav', 'ffmpeg']
>>
>> Signed-off-by: Yann Dirson <yann@blade-group.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
>> index 7c39e7da37..d5b38f77c5 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
>> @@ -4,9 +4,6 @@ muxers, and demuxers provided by FFmpeg."
>>   HOMEPAGE = "http://gstreamer.freedesktop.org/"
>>   SECTION = "multimedia"
>>
>> -# ffmpeg has comercial license flags so add it as we need ffmpeg as a dependency
>> -LICENSE_FLAGS = "commercial"
>> -
>>   LICENSE = "LGPLv2+"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
>>                       file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
>> --
>> 2.31.1
>>
>>
>> 
>>
> 
> 
