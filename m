Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.8246.1630072137724361818
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 06:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=coP4O/mr;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id x4so6050117pgh.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 06:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=imSieQhiQEWT93QOzhMULSI6U2RI2gDADjMo3hkHax0=;
        b=coP4O/mrzjsGMhEe9QtyPb/U67DUqGvuOedemR9bWFxv37gAOo+PvVjVvxGFQlznS0
         PEDPNB81jaRFh5Ca5u+LJWTCba6gzE+1kVEoTMag+Hzwh5I6BdJBzq61UL9+riG0wEmZ
         uuLLoDCwc8U1X9BrYWymCUvbmntrX04uiTH4lpSd3x1Lamwj0h1XpR1YCxL8lakTBmxp
         8kP2WCwl6Zm3seVBfdgc8YKBulzxtOjTwMi4MEclAdal8mKWxsixA83/MUAgynYb96li
         dH6WyMZexFuGtAgqADIioQrAVRbBs//MHDEH7JxxBDUUu5IXwJ+aAhLUvAGU9O9GjgsW
         4I6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=imSieQhiQEWT93QOzhMULSI6U2RI2gDADjMo3hkHax0=;
        b=Xh4kdhRa49mmbkVGqueXbx63e8M1WuEu0hPlzfyfDeEytKwDE2w7YFsEIWPHDvOOEP
         O8Pcs9wemtKk+EqZqZKRTaPbBZLd45tfrbOZS0pFYbjjzLdjOjRafGgW2Wv6t5CBTHL3
         bSLJR/pDGxOOsXsPHXJvapXvADQJ0K/l7hZeS+uPPRw9+nM4iK+dKEoNP3qk1s6yVRr0
         e1CyLngPvyFJAK6XLmUfzZ/XZZ6bnhbIWHnkw3fT4Sv0OeVeeNFJeKkyWk7nMwf6vsv/
         Z+ToZ+4SIZs2GcSyhDHJeoAS0wYtvNd2BQNQSRQ/x/JqZV0dpJC5x03kq3NCYLZgAawp
         tgXg==
X-Gm-Message-State: AOAM533w6q7p46i8a3I2GlTerxG5RXWkfNHDhnsmQWu5zU4kCe6LuMVD
	ncY6nnqbSKX8hW7G/yJo8cR9U+Ie+4A=
X-Google-Smtp-Source: ABdhPJwhUkBRgBosaIkZPHpv49XVwb4FRBWf0nWSRj43U/SgTg/o2dff2MEyicxN9un25neoiOgDKQ==
X-Received: by 2002:a65:4486:: with SMTP id l6mr7974982pgq.145.1630072136967;
        Fri, 27 Aug 2021 06:48:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:6d42:ed7e:4699:884f? ([2601:202:4180:a5c0:6d42:ed7e:4699:884f])
        by smtp.gmail.com with ESMTPSA id c12sm6045795pfl.56.2021.08.27.06.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Aug 2021 06:48:56 -0700 (PDT)
Subject: Re: [OE-core] [master][PATCH] lz4: remove rest of ptest artifacts
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210827020936.3700558-1-akuster808@gmail.com>
 <6c720428bb74edcb0b05825786075d6a0261e1df.camel@linuxfoundation.org>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <d5876d66-2a77-e75c-b91a-1cd36fb09921@gmail.com>
Date: Fri, 27 Aug 2021 06:48:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6c720428bb74edcb0b05825786075d6a0261e1df.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/27/21 3:58 AM, Richard Purdie wrote:
> On Thu, 2021-08-26 at 19:09 -0700, Armin Kuster wrote:
>> Commit: 953f6d9a71 lz4: remove ptest changes
>>
>> missed removing the run-ptest file
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>
> [...]
>
>> diff --git a/meta/recipes-support/lz4/lz4_1.9.3.bb b/meta/recipes-support/lz4/lz4_1.9.3.bb
>> index 3905ef7dbc..74f6743b91 100644
>> --- a/meta/recipes-support/lz4/lz4_1.9.3.bb
>> +++ b/meta/recipes-support/lz4/lz4_1.9.3.bb
>> @@ -13,7 +13,7 @@ PE = "1"
>>  SRCREV = "d44371841a2f1728a3f36839fd4b7e872d0927d3"
>>  
>>  SRC_URI = "git://github.com/lz4/lz4.git;branch=release \
>> -           file://run-ptest \
>> +           file://CVE-2021-3520.patch \
>>             "
>>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
>>  
> I think the addition should have been in the previous patch. I've tweaked them.
Correct.. Thanks,

-armin
>
> Cheers,
>
> Richard
>

