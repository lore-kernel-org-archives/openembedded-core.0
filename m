Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1E0106B532
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 13:08:16 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21808.1774444095761294888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 06:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gN0ul/fa;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so5799407f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 06:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774444094; x=1775048894; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QqTeB0cb4WsxDlYOvSowNKLcZsNoGGbP0PB2R4EbsOU=;
        b=gN0ul/fayzOB3Vlc+7fzRR+YOJ7P0E762zO/Ljj/5ryA3fjd7YHogv6Ehnw9pYBF71
         nOLEqMPpXGfxSpl9fZO9unExG2p4e4UrLHl5i770pZ20wDHJOOn58o2F8MhFDRH0godw
         9HzuvXXc39LNJWzsHQFhaF7hXnzBVBczhYFFvz89bON4DXBhnwxPXRntzELEF6E51ruR
         gptPTnJa+2rqneVYHnu3EF2XGJwam1LHhRB4vw/fZvVfunE3EEERoHHJyL8l15OiamLe
         UoQi4jZ5HOfhJunXMfoabQ27j/Qw64X/J7iyFL+7fH2Mu/86HJl0lgXK1qvrUfGH96/E
         X1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444094; x=1775048894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqTeB0cb4WsxDlYOvSowNKLcZsNoGGbP0PB2R4EbsOU=;
        b=ldauHrz2x+4aVKDhDGrxHQkAT+nZDs+m7EaPKNNsG7DZMQ4qm88JcQZlNSNhK0wE4Q
         HAxf7XKqCnMgFHVG5AE7obPihW3y8M0PoJlmcAmcIqXd3uHxcEBJW7aBoA4GZxYOUd2x
         Uek4N5QSWQMHIGeLx/KIy/OFRp0sU0DFGKEu4Ij/w8X2RNGn26B8B3whnSyrPUdYv/EF
         IMHojMUB4fB1PYNSNZ+tqmXQ+LrVcuCoOlD2FREX/Hiq0cYdDPsLq9uZffV0yL6ySNp2
         JqGdP6zCO23YPDGYujXyTGeavhb0gVeWDYEhvoCFtysxryXxvJ32q7mM/arGI1naYoQl
         oeyg==
X-Gm-Message-State: AOJu0YwT6FgiEJrapcrT5JuYRTrvvI5+O2F20KMhtf7JEpF3yaNSwkrV
	aQv+sfO58CdV1CeSPBz3Dw7RpD43fr8fV030aoOFORqB6C/qnWZXrOPh
X-Gm-Gg: ATEYQzzbp3eQPMcGcjDw57gQE4q8Tj7l8WVCBDJJZFACzD/ACb5W8ZjBU4luV3oxwim
	FC9gRXW+T5ZETjArulkjzd1JtchPdd8gWkKdWbTiFzTBeU85dDB9Wlrwm22cCtupSzcZsI38F5P
	xOKLCYgz73Q7FsdZKTwNDRZ6+ANVkDyYVyYGHe2ihsaOZCAqRdu23cOABut7iM+GoM5bDgSodTW
	A/M6N/0jk/N8VtmbVPADAwxuv/mIZB3AhLkCyicuGHs+RHduy8eP+8Chff48s22Fsg8CtVDcfex
	cwhw8A8eA4jurMG/C1+IlTI9crsWUhj4l/pXSCzcptDg09dIncKbVVRgm79xHcNsdsWiswKyaSX
	OxZcm4/y5FUlR4oJZzpZFnoZ0FZ66nj0KN33MHr3bF5/Ztu1/r+upb/afuFD60Z/B2J7z+jivrp
	g4dtqxXNDjjVzXmX2GzO29Xtio5LyLTaMzQxRHBSTKBP9NRfAhiptpwT4=
X-Received: by 2002:a05:6000:3101:b0:43b:3b80:6776 with SMTP id ffacd0b85a97d-43b889e34edmr5455212f8f.30.1774444092153;
        Wed, 25 Mar 2026 06:08:12 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b85082842sm11909618f8f.20.2026.03.25.06.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 06:08:10 -0700 (PDT)
Message-ID: <99a06f20-dcdc-4c17-8ac8-df68dddd9d3e@gmail.com>
Date: Wed, 25 Mar 2026 14:08:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 00/14] Support Python freethreading
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Bartosz Golaszewski <brgl@kernel.org>, Trevor Gamblin <tgamblin@baylibre.com>
References: <20260325113112.1163632-1-zboszor@gmail.com>
 <CANNYZj9WxUMMX3WOpM_QfgC+RqvpZOYOFA=1F7sGj0PPOM_nAA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj9WxUMMX3WOpM_QfgC+RqvpZOYOFA=1F7sGj0PPOM_nAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 13:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233908

2026. 03. 25. 13:58 keltezéssel, Alexander Kanavin írta:
> On Wed, 25 Mar 2026 at 12:31, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>> This patchset allows turning on Python freethreading by using
>> a new DISTRO_FEATURES setting:
>>
>> DISTRO_FEATURES += "python_freethreading"
>>
>> and optionally:
>>
>> DISTRO_FEATURES_NATIVE += "python_freethreading"
>>
>> The change to python3-dir.bbclass is crucial, as all python module
>> build helper classes rely on it.
> This is fine as an RFC, but otherwise, given the large amount of
> tweaks required, and having to choose between one or the other (which
> complicates testing), I would wait and see how other distros provide a
> free-threading python. Ideally it should be co-installable with
> regular python.

As I said, this would double the amount of python module
recipe builds.

See the Red Hat bugzilla ticket I created for a different reason
(old bitbake needs old python, still a parallel installation use case):

https://bugzilla.redhat.com/show_bug.cgi?id=2418374

"We don't have the human power to maintain several separate Python stacks packaged as RPM 
packages in Fedora."

Python 3.14.x is present in Fedora 43, only without freethreading.
I expect they won't do a parallel installation with freethreading, either, due to the same 
reason.
When they switch, it will be all or nothing.


