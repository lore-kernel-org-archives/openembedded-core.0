Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EA3C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 18:39:17 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web09.1866.1635446344493292985
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 11:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=tV1di7E2;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.43, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f43.google.com with SMTP id i13so5978460lfe.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 11:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hTqKoqwtnLDtcKcC0bTBjJsBRAGLk95DyNmgjKjQqiM=;
        b=tV1di7E2VA2i5idejw4KDhPZEqnuWAlzWDZfM/L7U+rbQNOtRgpYv8qKnFExcmFUYk
         H7Nzalp0vm0ZowkvpkYRrFaS/oFNmSDl3iU44oK29t5TG0q0QmA6oR2F2NW3/0q9AlCW
         x4Rt4hjv+14NYAXW9DdybqH5YF/50h/8CF+fAUe5PYUIT4atYT0ce8ug//NkpNLQABpo
         3Mye2VyKi2g0nAZrIZ1L+nhoQZcqHUxswe5ykjUks0kEZdZeh/fjUYI1yymzpjlr7hB0
         +SdIcNJT775FUS/IZc7T8KkKu+0FGW4Ac7adZg0In2ikNl4dV7er7Fwrql7SrIuNWpOk
         1/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hTqKoqwtnLDtcKcC0bTBjJsBRAGLk95DyNmgjKjQqiM=;
        b=H2rkETEYzzXF9S1g9TPNvves4Z2g0he73JacJHlGg4nZTYfbEuqJiRo8WL+y7GfFuH
         vyaprtP8OuaF0X6BcqDGAfOrBioHxlW2xuG0RC2qW+Y0cUfJSe+pgUFHw+vFhBV+t3NX
         PAtqLodhxV8ZnMTapvSMmpsA3LHhnXZgabumkwxa6hC08nFDz5W8WojUpj3dqJCPbPcN
         kjiPOdy/D3nRh3wEt+6DFQ6Y/GV9pTuyrMGCyPy8qDkCG2KgjdRXcS1Fgmb2KURskgh8
         6J+2kNt2/U4aVz6sSZD76J8TaGQ+dgZakSWtpZOPlikoFyUr2b8WyhEMky8ggBu4makm
         GhmA==
X-Gm-Message-State: AOAM530E+qbcu4uKbZCdXh5lkSW2NvsMWY5zH+9PCzwafGgbRaro+TrD
	DCa+onRqjV5jWN/TtZaMGxsDhg==
X-Google-Smtp-Source: 
 ABdhPJyqUEj79UQJ12XmSRzto+bL55H+azszPZBPvsAnYjh4I0Nv+/XghNLrbJPlxDXnn4qOKFYNtA==
X-Received: by 2002:ac2:4541:: with SMTP id j1mr5859651lfm.594.1635446342026;
        Thu, 28 Oct 2021 11:39:02 -0700 (PDT)
Received: from [192.168.50.157]
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 p10sm358363ljm.53.2021.10.28.11.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 11:39:01 -0700 (PDT)
Message-ID: <b8b966c1-8ffa-2f9f-3060-275fb953fbd7@oleksandr-kravchuk.com>
Date: Thu, 28 Oct 2021 20:39:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [OE-core] [PATCH] libxcvt: add recipe
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20211027210338.3320083-1-open.source@oleksandr-kravchuk.com>
 <YXrt+LYiPcQsmJke@piout.net>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
In-Reply-To: <YXrt+LYiPcQsmJke@piout.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 18:39:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157601

On 28/10/2021 20:37, Alexandre Belloni wrote:
> Unfortunately, this fails with:
>
> The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
> libxcvt (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb)
Okay, thanks. I'll assign myself with v2.
> On 27/10/2021 23:03:38+0200, Oleksandr Kravchuk wrote:
>> This library is a dependancy of xserver-xorg 21.1.0.
>>
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>   .../xorg-lib/libxcvt_0.1.1.bb                 | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>   create mode 100644 meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
>>
>> diff --git a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
>> new file mode 100644
>> index 0000000000..628ccfb647
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
>> @@ -0,0 +1,19 @@
>> +SUMMARY = "Library providing a standalone version of the X server \
>> +implementation of the VESA CVT standard timing modelines generator"
>> +HOMEPAGE = "https://gitlab.freedesktop.org/xorg/lib/libxcvt"
>> +BUGTRACKER = "https://gitlab.freedesktop.org/xorg/lib/libxcvt/-/issues"
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=129947a06984d6faa6f9a9788fa2a03f"
>> +SECTION = "x11/libs"
>> +
>> +SRC_URI = "git://gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=https"
>> +SRCREV = "6fe840b9295cfdc41bd734586c5b8756f6af6f9b"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit meson
>> +
>> +FILES:${PN} = " \
>> +    ${libdir}/libxcvt.so.0* \
>> +    ${bindir}/cvt \
>> +"
>> -- 
>> 2.25.1
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#157569): https://lists.openembedded.org/g/openembedded-core/message/157569
>> Mute This Topic: https://lists.openembedded.org/mt/86638516/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>

