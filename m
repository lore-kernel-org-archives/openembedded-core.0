Return-Path: <jupiter.hce@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406C6C433FE
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:05:33 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web09.9295.1633943131702192903
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S7BFv3ua;
 spf=pass (domain: gmail.com, ip: 209.85.217.46,
 mailfrom: jupiter.hce@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id v4so18160825vsg.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VqkZMOlXaJPwPzdnSpG3dBl/Ua5TJcd5wvjG/HyXoZ4=;
        b=S7BFv3ua6EDTEmkjnJbIb9+zjdFFKnoVhkXFSYTIkk44xPTptVTbeDS+2kcnadcFmx
         ncwuAe6XRKo1WZBWCLhd5BY6A0lshvB9U7mP0wndsYFkCwIM56bttbg4vLbiMe0Qak/q
         vIkbkFY+0TnKUD7dshu2s5YNB1jrDBXa3DSEbGVhxWhZTAMN6KOpzYCz5immqmCDt0qR
         jFPKyQZdTx0vUmqtgNlBnqaSJcC6+07DVFA7WVRM8EfN6BUuXaFl5V8kdaVuMjssjhWW
         ecQVSDvlh8xgoV1KwLpJ/aVB9Mb+r/7fkIevU21o/PdgfToXdj6sb/F6pt9gIu9Z9eMy
         xZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VqkZMOlXaJPwPzdnSpG3dBl/Ua5TJcd5wvjG/HyXoZ4=;
        b=YK0P/0ynpcVs6m8nyVbaH9LdK5wHXwDqUy9K8X9NA7UzZaCnw6Oe9+6VTX3getNEzM
         wKosY/XhU2Xhh+YxJ4NEOauPlCRDGK8qGqUrDeQYCzG5cTvVG4esgqO1V60S73uAveVZ
         t18FnqBdx7p3H2mYJjJh1UP/2LnhHN458v3yN6axJhnTDstK5/9NRlVOy+MBzJYFvCX5
         f9pQ4zkTsRkjQkpDhIremLo/zjVV9qp4nI1pdx8dOgKF5Qk8rG1On9HPusITLt5c/YFS
         OJ1emx9oySTqEeVOkM1ldX1+cGFIKMRtLm2JYU9zp7DAL+XhPGjXh38r8vvxdg0ojuCW
         IBGg==
X-Gm-Message-State: AOAM530MiRHXrBEcd+jPUDRYReRLiAiCO+RtCiI2qy07C6RHdiKtvjWf
	0ZWv6kHXMRi28ji8BdFAT8oypLzm6zPmrtWMhr/X9lKC
X-Google-Smtp-Source: 
 ABdhPJxpCYHt7hkPgoE9NJSS5aACl/QdnK2xdf4KcCPKki9L4dSt+oduE4V3yZYI8eXqFm2Kr+WmWQWyjymPHGm8hf8=
X-Received: by 2002:a67:f752:: with SMTP id w18mr13091553vso.51.1633943130744;
 Mon, 11 Oct 2021 02:05:30 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAA=hcWSfqgxOX8UjwW35tD4VMC8c0SHWVo=_=z38NH7+rq6dAg@mail.gmail.com>
 <CAM6O0Zg3qNqZbtkKjTXQdSwD9LAjrKOaumshWk9Swvb7OMT8VA@mail.gmail.com>
In-Reply-To: 
 <CAM6O0Zg3qNqZbtkKjTXQdSwD9LAjrKOaumshWk9Swvb7OMT8VA@mail.gmail.com>
From: Jupiter <jupiter.hce@gmail.com>
Date: Mon, 11 Oct 2021 20:04:54 +1100
Message-ID: 
 <CAA=hcWQvwDbg0106agTerDfq78yh2kvin1k4Xydi3Z6buEBK_g@mail.gmail.com>
Subject: Re: [OE-core] How to trigger Yocto Linux /etc/profile or shell
 scripts in /etc/profile.d without shell logging in?
To: Federico Pellegrin <fede@evolware.org>
Cc: yocto <yocto@lists.yoctoproject.org>,
	OE <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:05:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156813

Hi Federico,

Thanks for your response.

> /etc/profile and similar are interactive shell (/bash) concepts, not really
> system startup ones. So indeed: just on a login (be it local, ssh and so
> on) they are executed.

Understood, here is what I try to figure out. I use several systemd
services to start my tasks, each task is not just a system process, I
found it also has a system environment similar in user login from
/etcprofile, /home/user/.profile, my question is where is a system
environment file that each systemd service runs from?

I also thought that /etc/profile.d files should be automatically
invoked for each user login, but a systemd service does not run
/etc/profile.d files.

> If you want to execute something else without the need for logging it, you
> should look elsewhere, depending on your system manager: if systemd you
> should create a service and enable it, if sysvinit a init.d script.

Understood, that was what I did originally, I have to run the setup
system environment in each service ExecStart script, that is why I am
looking for a global environment setup file to avoid duplication of
putting my environment scripts in each ExecStart execution file.

Thank you.

Kind regards,

- jupiter

> HTH,
> Federico
>
>
> Il giorno lun 11 ott 2021 alle ore 06:30 JH <jupiter.hce@gmail.com> ha
> scritto:
>
>> Hi,
>>
>> The Yocto uses /etc/profile for root login, but there is no root
>> physical login in an embedded device so the /etc/profile is never
>> called, I added a shell script to /etc/profile.d, it was not called
>> either. Both /etc/profile and scripts in /etc/profile.d can only be
>> invoked when I physically log into the debug console, that is
>> impractical. Appreciate your advice, how do you resolve that kind of
>> problem?
>>
>> Thank you.
>>
>> Kind regards,
>>
>> - jupiter
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#156808):
>> https://lists.openembedded.org/g/openembedded-core/message/156808
>> Mute This Topic: https://lists.openembedded.org/mt/86229953/5117409
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> fede@evolware.org]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>
>


--
"A man can fail many times, but he isn't a failure until he begins to
blame somebody else."
-- John Burroughs

