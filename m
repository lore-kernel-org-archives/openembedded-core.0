Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.804.1631806005127160941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 08:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ih+5W3/c;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id on12-20020a17090b1d0c00b001997c60aa29so6328228pjb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 08:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=O0BJs28zHnnkg+AOduEL+GP5uGgQCiJqSbUPB1SH4ds=;
        b=Ih+5W3/cKSMhLoNHq5lm52PA1a6o4FEEaQ3F0bsx0T7pjDwwyUtrKAOOIPBY7ngsGD
         XMH4U6HtobzNIdWsXz4QPJ7tnFJtt+7IERPAyqMuIeUigGeV/fOEwjn74ff45dyv1DZg
         +fFmFa5xisPE+oDo/RnLxUvTPz4pyhAIiGlBrfTwmlbcydnSXs1eClAqYFwsQCPOZ3y2
         s4sjxod69lIFp9GUxtNHheu5Zoj5P/FuAuIlq54tPQ3pvyNjmLMZRcvVawW61OMAQ1dr
         SfFkuihtZIJ0wvLNuSCkzZ55YYOPnVV9YJBGHHwVfeI8sLq3Pf5HZCpIH7dQZJJ05QkG
         +lDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=O0BJs28zHnnkg+AOduEL+GP5uGgQCiJqSbUPB1SH4ds=;
        b=Qj2TC3wsdwemk8+8Tz8uHSIxCeF5NdzGJcXl0LTgpJ+SFnTwt1I7fa062A4nrKeBL7
         /sWfq77YD6/duPLLJLWu2wTy+oOKeykyrR4OHwzAh0dVzrnzEpCI113vLSi9aUKX3xcJ
         jNd4mnyyW/fqAxdDrMsGsh+NdtQhsNjdsIqs2PdX9C6PodX7DyKmuGmaEuRpJ5ADvnwe
         +Jwu4UEwxd92Yy/ZZgVRGJ2zxNvip08lmvKZYsdy7WPylYfWB/ltDgSqiGVxtZUsFGbw
         NI0Nbad6TpfosdGmEyNh4g2pp8yAXCVqcO2Ofte7KXpGX8kkdDLg9sNivE9yUDB1tyFi
         vt7g==
X-Gm-Message-State: AOAM533dCXosKbSCStJNSZBa4AlFrMGvvTIwpwXdx3RKbXKn4yVs5Frb
	X4+vLhZ4qbSrxwyy/19v51FF73QcRCM=
X-Google-Smtp-Source: ABdhPJzfV2yGhAqWjG32BKFfBSq/8V+wtwbH6yvfoBtJinvticOlnc2q2rpZO9jrJqbRQ8IQpvMHHg==
X-Received: by 2002:a17:90b:4ad0:: with SMTP id mh16mr15437229pjb.29.1631806004327;
        Thu, 16 Sep 2021 08:26:44 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:8e48:889d:1351:d2d2? ([2601:202:4180:a5c0:8e48:889d:1351:d2d2])
        by smtp.gmail.com with ESMTPSA id w30sm2732809pjj.30.2021.09.16.08.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 08:26:44 -0700 (PDT)
Subject: Re: [OE-core] [kirkstone][PATCH] wayland-protocols: upgrade 1.22 -> 1.23
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Denys Dmytriyenko <denis@denix.org>, openembedded-core@lists.openembedded.org
References: <1631754397-46490-1-git-send-email-denis@denix.org>
 <137620f2-df0b-58fc-6d47-89075626c844@gmail.com>
 <556d590b620342703897becbeda6ebfa4d20aef3.camel@linuxfoundation.org>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <763e63d1-0f1e-3c5a-2d8e-a2b91bca3545@gmail.com>
Date: Thu, 16 Sep 2021 08:26:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <556d590b620342703897becbeda6ebfa4d20aef3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 9/16/21 1:03 AM, Richard Purdie wrote:
> On Wed, 2021-09-15 at 19:31 -0700, Armin Kuster wrote:
>> So we wait until that branch is created in 5 months before we can apply
>> it ?  Is this like post dating a check?
> Alexandre and I are using "kirkstone-next" as a place to queue things for the
> next release so this does make sense.

I know why you and Alexandre are doing it.  Should there be a note added
to the
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email
Section "Backporting fixes to stable releases"  regarding an exception
during code stabilization to use the next next stable branch name
instead of "Master" ?

-armin

>
> Cheers,
>
> Richard
>

