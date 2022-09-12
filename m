Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F3CC6FA82
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 19:08:48 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.38.1663009719242466930
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 12:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kFTKTjc0;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id i26so16406434lfp.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 12:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=kUl363b4mcS2Z8nl5nTz03jwK5aZwm0Wk6nrCGFLdxY=;
        b=kFTKTjc0c4Kkfz7b3svkhEUpyo7dzMETq8+RcXELrLwJXS0Hjnj5bXNYMuMyPp0k2D
         X6EI7nF6lSApRAZIViNj8YbHP40yFb9aZdkkzcnE0NISkywMygieBIH2fNSZ6c50W6NL
         YeCinCge+93Yrr/HuLiQFR1Tc9QPJ/lifeFxpZveNoonUno7LkuccE64JYJlVmQo14wv
         /z9v2hqGAWbwo50raZKhCjfHmbbZMeX6Qi4r9xT/TvIECMnJ1gyC2yKCjbrF7uBIxH+Q
         5bapVjx4t8oZJ3b4CyqRee3R0ZlOTEwNWT7da4Lvkxydvis13v4i0UTKIZ8eYCNjjcVF
         WKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=kUl363b4mcS2Z8nl5nTz03jwK5aZwm0Wk6nrCGFLdxY=;
        b=IYagmvWB2sB46ZfXSTueC2XYZjW9GNGO36M1T6ieIvOIK3fiq/aeuaASXlMcYuvpBy
         TnnZxFnVWW91gUHNINKsWnvVGFAVzpYYCUWSNIsrK/Y5kDTRY0jvsTtBOVIs9LLEW192
         Spgc8NwoPzsQ9iFP/7rW3hWRFs7eKvrrkX3r8/8GP32Ov12hJ9TN34BoHRC1cjJtCAe+
         PZJJMJYG4Ds0MZFLHsJU7ULuQD0IwAIRdawVUV3PsQ6BWs+ipQCcEeymj1uZtATqtrCk
         djj4CZVnj9BxRnKa+KaRGKsI+gtNWqFQNyyFXcFn6ll22DMhGTjU+R6KjPIdV+wsxxCS
         F5Wg==
X-Gm-Message-State: ACgBeo2bGta2dT0bJvsgHMHqoU13B4qwg/p+jqY/upQEoLwCL2EKII5U
	DGwEcH3Xraewa3Dwa440PA==
X-Google-Smtp-Source: 
 AA6agR7PZfUiamU5QQQ044Bv3zsFRc0tstbqHfjC3+Qsj5cdehiJ5sPyduAQC1mncuJ3Mzec+YsMSQ==
X-Received: by 2002:a05:6512:12d6:b0:499:4137:f28b with SMTP id
 p22-20020a05651212d600b004994137f28bmr5168262lfg.111.1663009717418;
        Mon, 12 Sep 2022 12:08:37 -0700 (PDT)
Received: from [192.168.1.248]
 (031011128148.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.148])
        by smtp.gmail.com with ESMTPSA id
 s8-20020a2e1508000000b0026aba858fbfsm1236914ljd.137.2022.09.12.12.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 12:08:36 -0700 (PDT)
Message-ID: <36784d61-0e16-32b8-9e44-99833170e595@gmail.com>
Date: Mon, 12 Sep 2022 21:08:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH 1/1] watchdog: Remove unneeded tirpc dependency
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220912092122.2020942-1-ptsneves@gmail.com>
 <CAMKF1srjyVGO1fcUkxzO0qM8zotmqOp_FRYMpD2U14JkmPdvvQ@mail.gmail.com>
From: Paulo Neves <ptsneves@gmail.com>
In-Reply-To: 
 <CAMKF1srjyVGO1fcUkxzO0qM8zotmqOp_FRYMpD2U14JkmPdvvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 19:08:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170542

it should as there is no rpc code in the project as far as i scanned. I 
built it with musl successfully.

Paulo Neves

On 9/12/22 17:06, Khem Raj wrote:
> On Mon, Sep 12, 2022 at 2:21 AM Paulo Neves <ptsneves@gmail.com> wrote:
>> watchdog code does not have any dependency on rpc code,
>> therefore the dependency and flags to try to use it are
>> removed.
>>
>> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
>> ---
>>   meta/recipes-extended/watchdog/watchdog_5.16.bb | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
>> index 26fcc10487..6031dcaa16 100644
>> --- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
>> +++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
>> @@ -28,10 +28,6 @@ UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
>>
>>   inherit autotools update-rc.d systemd pkgconfig
>>
>> -DEPENDS += "libtirpc"
>> -CFLAGS += "-I${STAGING_INCDIR}/tirpc"
>> -LDFLAGS += "-ltirpc"
>> -
> does musl build works too ?
>
>>   EXTRA_OECONF += " --disable-nfs "
>>   CACHED_CONFIGUREVARS += "ac_cv_path_PATH_SENDMAIL=${sbindir}/sendmail"
>>
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#170533): https://lists.openembedded.org/g/openembedded-core/message/170533
>> Mute This Topic: https://lists.openembedded.org/mt/93628579/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


