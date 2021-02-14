Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.20224.1613325562237214555
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 09:59:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rDKbh+1D;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id t11so2947284pgu.8
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 09:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=3XHC4Xig1tLMvVI0fe5mm6c3sECTTr+7cOiZbxLGg2c=;
        b=rDKbh+1DayOrmNU4xhE25vITmrPhgZ6WmGJguLALRGhMggwbhfKuU/83sNjmr2rkJy
         LUJ/2D6XGWVMB4wXU/P3KKVd119Vihsn22Mlgroy2kO+QOF7oKbpSGfXxY4zu9tCAtVU
         22lXaA41QwtaPXSUwwqfyRXrXMPcDVJmzrjKPHs+JzKVN6mTB607jGH7UbTYyNE3Xyyl
         f5ukhAdACwLdSpO70u3vVuZR121yEmWcFWTmK0obk6I0O2ZLxC564Nz0L1Wz4WXYQ7V6
         ydW+YNhl9+QdAuVZsYtaFciu5rJLcvzjtIdV6ZWaEc+XnnOwLfs1zwSjJpgSeAUUwRy6
         JeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=3XHC4Xig1tLMvVI0fe5mm6c3sECTTr+7cOiZbxLGg2c=;
        b=Vcj1l7ADm0ISHB/tLpxiwTATHqQAIlyI89tiyZzUHab1TJxFbzcu46MqVLzyFhUA2q
         1LdDvLFgEqn2g6dut0OHX3+H45ePA2tNXrPKTTFF6decpt6przWYkW6SS1SDliEvSZcg
         QLof9LCN3dx5SMGcs2D0S7WxyW2XKzli6RnH55ttQx1vw/oW0GD5Vrn0AlUOxBVhM1oR
         w9Z7ZbykDgcmgNxBITRCgrlr/EIHEBjJ7m/JNrwOzIht9Hoc4SShLwOhK3hhN2Ig6Sy0
         6gC5bapO3OQ0ZCOZgAlMq994CjoiRZE7suto2FWzt+hjcar3N2mdvg+jrH2DRA8/U+f+
         U2dg==
X-Gm-Message-State: AOAM532rYSC0m2YwsXnrOJ+4zNMwiS1CNV+oProgF5HVgXmFnOU3Gfh/
	g0SdgTaZOm5UYIoxHQCXHPs9KwfgOVolug==
X-Google-Smtp-Source: ABdhPJx4DFp1PRMx94Blgmz4tGOSa0zWKnqogYTeEPAU1aG85B7ml5gKqlcNJA5axggSYkJNi8gskQ==
X-Received: by 2002:a65:68c2:: with SMTP id k2mr1127292pgt.275.1613325561456;
        Sun, 14 Feb 2021 09:59:21 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d? ([2601:202:4180:a5c0:c8b8:7fc5:a225:bb8d])
        by smtp.gmail.com with ESMTPSA id m10sm14317577pjn.33.2021.02.14.09.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Feb 2021 09:59:21 -0800 (PST)
Subject: Re: [OE-core] [PATCH] buildhistory.bbclass: add cloning
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210214155305.1797370-1-akuster808@gmail.com>
 <497b1ddfe6674b14fd241a32c832edad62ec79be.camel@linuxfoundation.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <af26bd7e-13e1-de72-e31c-a02b5b8c8844@gmail.com>
Date: Sun, 14 Feb 2021 09:59:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <497b1ddfe6674b14fd241a32c832edad62ec79be.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2/14/21 9:12 AM, Richard Purdie wrote:
> On Sun, 2021-02-14 at 15:53 +0000, akuster wrote:
>> Provide a method to clone and push to a git repo
>> Provide a method to pre-populate buildhistory
>> Maybe remove the need for external scripts to do the same
>>
>> Three new variables:
>> BUILDHISTORY_CLONE - Enable the cloning function
>> BUILDHISTORY_BRANCH - branch used for checkout and pushing
>> BUILDHISTORY_REPO_URI - git repo uri
>>
>> example:
>> BUILDHISTORY_CLONE = "1"
>> BUILDHISTORY_BRANCH="${DISTRO}/gatesgarth/${MACHINE}"
>> BUILDHISTORY_REPO_URI = "git@gitlab.com:akuster/oe-buildhistory"
>> BUILDHISTORY_PUSH_REPO = "origin ${BUILDHISTORY_BRANCH}"
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta/classes/buildhistory.bbclass | 59 +++++++++++++++++++++++++++++++
>>  1 file changed, 59 insertions(+)
> Whether or not this is a good idea I'm not sure 
Not sure either but I did notice the AB does handle this separately and
so did the OE world build Martin setup so why not create a framework
that folks can opt-in if they want to.

> but I don't like the
> variable names. How about configuring as:
>
> BUILDHISTORY_CLONE = "git@gitlab.com:akuster/oe-buildhistory"
> BUILDHISTORY_CLONE_BRANCH="${DISTRO}/gatesgarth/${MACHINE}"
> BUILDHISTORY_PUSH_REPO = "origin ${BUILDHISTORY_BRANCH}"
works for me. I am not married to the names.

> ?
>
> You're unlikely to not set a repo uri if you set clone...
Right.

thanks for the input.

-armin
>
> Cheers,
>
> Richard
>
>
>

