Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18578C761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 14:09:02 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.26085.1680185331753983225
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 07:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jtPw4hfe;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id x3so76922020edb.10
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 07:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680185330;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iZB7dQg/RIimTm7sidrZJT6W0wuZzf2zNQevvgM+JGM=;
        b=jtPw4hfemdE5v8uTZlc+OIiN/N9ObJ82NcGvMg2o0Jt+8TSPtJmC5dkcRkOQfy08jk
         JjQfS1Ep1obqCxVmqei02w1xy/ktt2Vg44N9h1sKpvMztZYxCbVzdgr3rgZ+ZGO1kew5
         BJkJDMSZYxo5SxhqCS2ut2h44BZVAFqn/SBttQ/hW5fU1Q7Kkr9HC1KZuMvQmgJ8iMuq
         zoGW9OFT/fcu35FXj+4u66CSnWCnx3k3pm5pdkRWKBlsIZAilK4aAlc6xkj7ncQCFiPN
         5EiGOY+8y7o1b7SPIBiSjyXt3ys7SBkg4oZEXyl22rliyoHqOzRgbyGS3lybE2YPUN9n
         DS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680185330;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZB7dQg/RIimTm7sidrZJT6W0wuZzf2zNQevvgM+JGM=;
        b=BMBNXo8qwBlVHpM1iMjV87BYR5PF2XozeSHn79AzLrIg3FFWJOgfoQfsas+L5AHnT/
         xz7Dyf5F+qWPi5KWXG5hBmaRHj+6IU4F0HXDtIQMLZhP+T+qJoUTnPmFhBQG3omH9/o2
         wylF2XUrl6TMzx24PRHOiomNEeOCbrhNQ0YSBbLQX32ZSrfIwAjml4ENp68O7z9JAM0B
         AjYfmae3jWsv9ru5MDdHj/LARqcV46z0mMeC1szAVdDu0cgVGvPyR77rQ39Z/mNaEELb
         NvVeJ/CKS0K/E4FkG5J54Y1TzaILXe+o1i7hxKoryCj6fZmrcgSh+/jMOx7B64Z5yQSm
         42zA==
X-Gm-Message-State: AAQBX9eJgLr7/4jV6e0qWXoG9p5KNAv9oQMvxWmv/x5NDW4xfDnmsY7J
	IgClR9MD2Rlr1GSIgy4582qU5t+k76I=
X-Google-Smtp-Source: AKy350YwetSf+tTMU5bvgEeCWiMPUkhAF4qqA+/qSto2qTrS3AknPc/ktQzAqYyucMezxebt74sOLA==
X-Received: by 2002:a17:906:1705:b0:8f4:ec13:d599 with SMTP id c5-20020a170906170500b008f4ec13d599mr24459776eje.27.1680185330237;
        Thu, 30 Mar 2023 07:08:50 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id v12-20020a17090610cc00b008f767c69421sm17618005ejv.44.2023.03.30.07.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 07:08:50 -0700 (PDT)
Message-ID: <869f611a-1645-52b6-1f3b-e4b605f2ddd4@gmail.com>
Date: Thu, 30 Mar 2023 16:08:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH 1/2] systemd: Allow native build
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20230330134214.2772913-1-zboszor@gmail.com>
 <a25c3a41d623242edf004723dc94518228cfc1da.camel@linuxfoundation.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <a25c3a41d623242edf004723dc94518228cfc1da.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179328

2023. 03. 30. 15:50 keltezéssel, Richard Purdie írta:
> On Thu, 2023-03-30 at 15:42 +0200, Zoltan Boszormenyi wrote:
>> systemd-native is a dependency for libgudev-native, which
>> in turn is a dependency for libfprint-native, which is needed
>> to build libfprint.
>>
>> The native systemctl binary is removed so it doesn't conflict
>> with the script from systemd-systemctl-native.
>>
>> TODO? The new natively built systemctl binary may replace
>> the script in systemd-systemctl-native, as it supports
>> more options and works better than the script. For example,
>> the current script does not create the symlinks in
>> /etc/systemd/system for WantedBy= and RequiredBy= settings
>> and does not support systemctl set-default some.target.
> Which piece of systemd is libfprint needing?

Please see the MR:
https://gitlab.freedesktop.org/libfprint/libfprint/-/merge_requests/431

udev (provided by systemd) -> libgudev -> libfprint
also:
udev-native -> libgudev-native -> libfprint-native -> libfprint

Also, please read the TODO part of the patch for systemd
and consider it.

Thanks.


>
> We've had a request for systemd-native before and my opinion on it
> hasn't changed, I'd much prefer not to have it.
>
> Cheers,
>
> Richard


