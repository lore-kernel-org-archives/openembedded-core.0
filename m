Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAB6C761A6
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 14:51:32 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.27299.1680187886103300550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 07:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dpY3SWCK;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id cn12so77572466edb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 07:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680187884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8b0S3Z4lBCM1k4pKfHxRXESSoi7Ys+qO354kialzSio=;
        b=dpY3SWCKPimH8LRw/IU+WEqrcT5CSzbe3osv0aRlPmLFOeO8bwwkuCLcl+aWo4ypes
         vdUWrwUEpBohJcDcE28sg7Y/EHzw0py7d4vm6e/cW21MjbPRvbpITHvaC9XJsW5D/X2o
         f7ioXnuMTmc9shlJHn0LDd3Uh1JL02SdOoLl6fH66nRBQ71C7+x9TO93IMpoW7Bgj5Se
         eoeRFwI8V5LhAPuBfMfrplFB2JKTuDT3E2YCuElBRV4XRCsnLcA5XAzm7HqJTk1conmg
         UwTDMLUGjKui+3HOlOzk8UpE0J8QWeFYzBS6LeUSS4jqKrrOoHbznR++b3FzK6FOQaUx
         Z6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680187884;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8b0S3Z4lBCM1k4pKfHxRXESSoi7Ys+qO354kialzSio=;
        b=TGqPz9eRNGh87r5FVicJR1RupdXj03pcM5JwqlqrGFy1hT+OPTdQOZJhjpH9fn5Bve
         kz+kAeUfoxPAk5wM9tYQt+kXj9q2SR/NW1YZWsAOb9foTH0ZjksH2E0eEfFZtdDZ69T/
         mj3zAMkG0iroMd96/Nl4WBZ+WYtnKBlOGqOZy5aCsGlyRX/UrgPQpUoA4KS9P+xA58dt
         y2S3SEWTDaR+obrJDMDbQVGKJovlGT6cSbHmNMCx0g8NcrFrmd24jDPiN5puhEDwPY60
         WlyjkqjhPSALURXjwewQ7ssvkEYmSv4suj78PYUbrtwg+VYp+rYLrudZiXsskQm7gVya
         gXsQ==
X-Gm-Message-State: AAQBX9c0fqPOM4mhxxKQlXK0ISp8PPNl0zM1Vyg5lVGzJTkNBCTeD80/
	ln8LsIxQiNSLuNAdOW5Mtd8=
X-Google-Smtp-Source: AKy350YmmvjMDZTpchC7X6FUImjjO9QPT6+jpuNQBJdJ+tTD+Gx0Pxx1QeHTjPHwb0v1hZQzMNOUdQ==
X-Received: by 2002:aa7:d44d:0:b0:502:3ff4:4d76 with SMTP id q13-20020aa7d44d000000b005023ff44d76mr15137035edr.27.1680187884431;
        Thu, 30 Mar 2023 07:51:24 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id x28-20020a50d61c000000b004c19f1891fasm18435632edi.59.2023.03.30.07.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 07:51:24 -0700 (PDT)
Message-ID: <7eb81976-7603-e6c5-264f-19f20724cbc4@gmail.com>
Date: Thu, 30 Mar 2023 16:51:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH 1/2] systemd: Allow native build
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20230330134214.2772913-1-zboszor@gmail.com>
 <a25c3a41d623242edf004723dc94518228cfc1da.camel@linuxfoundation.org>
 <869f611a-1645-52b6-1f3b-e4b605f2ddd4@gmail.com>
 <CANNYZj9uYcBaDHgBABrnjCuH9AGTEQ8PhkxuJBm+FaTTNkwaPw@mail.gmail.com>
 <1deaad30-4816-af4d-910d-ef2242952033@gmail.com>
 <CANNYZj_RSRs=e5NS4QT=BnyYasf8-PrpFjSkfhPZCPLqtwZ1+w@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj_RSRs=e5NS4QT=BnyYasf8-PrpFjSkfhPZCPLqtwZ1+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179333

2023. 03. 30. 16:41 keltezéssel, Alexander Kanavin írta:
> On Thu, 30 Mar 2023 at 16:31, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> The mariadb change to use CROSSCOMPILING_EMULATOR
>> instead of building mariadb-native was reverted because
>> qemu is not ominpotent. The same applies to meson
>> running executables via qemu. No custom wrapper would help.
> Mariadb's problem was that (for a specific target) it somehow included
> CPU instructions that qemu usermode doesn't support, and no one looked
> into what those instructions were and why they were produced in the
> first place, preferring to revert the whole thing. There are lots of
> counter-examples in core where qemu usermode works fine, and has been
> working that way for many years, for example gobject introspection, or
> all of the scripts in ../scripts/postinst-intercepts/ which run every
> time you bake an image, including update_udev_hwdb by the way that
> runs target udevadm. I am not maintaining oe-devel, and I do not keep
> an eye on things like that, otherwise I would've asked for further
> investigation into what crashes and why.
>
> I do not want to add complex native dependency chains when usermode
> would work. It's me who's going to fix them when they break, not you.
>
>> You seem to have omitted reading a large part in the
>> commit message for the systemd change.
>>
>>> TODO? The new natively built systemctl binary may replace
>>> the script in systemd-systemctl-native, as it supports
>>> more options and works better than the script. For example,
>>> the current script does not create the symlinks in
>>> /etc/systemd/system for WantedBy= and RequiredBy= settings
>>> and does not support systemctl set-default some.target.
> This is a separate concern, and needs to be proposed as such.

I can extend this patchset to remove systemd-systemctl-native.bb
and use the native build fixing these problems.

Then libfprint can just use that as an innocent bystander.


