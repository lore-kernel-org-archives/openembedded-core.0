Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0466BC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 15:13:19 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web12.12509.1639062797364807984
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 07:13:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=InuIsMD6;
 spf=pass (domain: gmail.com, ip: 209.85.208.176,
 mailfrom: uvv.mail@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 207so9412989ljf.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 07:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jJFHenz86PM3xDAueNt748+SmeQugJiwCxJr9E2V4K0=;
        b=InuIsMD6++8D77A0wEW43vl+Y+y8RIfkQ6WcfC8C7LJl8eJgU55hzUBSB7PZAvIWUu
         7qzMuyLOC3/Bfg1aRcny14CPDdDP9Qfc9Cc+CNxEgI51hHWHAQk6T6L4FvUyOlpALHie
         DmsYQlMrKiLzatuFXYvUx81PNmQDYmKHSdfOFxBL+5iAMawDFsPZ9t3Jqp3m1pWmVlJE
         2s5vg9v3Qhzu8JkN08KPpYbPKou++O4LLplNffCPKN7BmE4yU1Sy2BzwcJvou9zIJTpZ
         mIGs8xUJVApOiEGDvspr6m+M+xtEpWORedNhAXDcvTi25sUVpt8aKzcPoc8LXA3wKmX6
         XmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jJFHenz86PM3xDAueNt748+SmeQugJiwCxJr9E2V4K0=;
        b=jJUWy6uzaWLefsIf3ngonz1fI9Nuxn25+QugGKofq7yhTLKf7eSOUAdCdEW5eY5TKz
         tMU4Nb0dlhtQs1JuE4JQIM3RSppZsEXaGm38o4fdILuvX2eaZE43L+xZz7EuyVs1r/lq
         dM6yOZCvHaQgQPDM+aS5Bd089/hgR9myzEU/O8B5JUSoYK9sEvqyCGE55mcClrwt+8x+
         Z15WRzDA1WOa88vSHTGsehbfLMkY5GTAeWA3Y9RiKw5ilDYuiF+T92AvrrpPAJV76psK
         OXuGYZxbYDZ2ZjFPE6LjZW1cI1g2uphhF2n94Ozp2NkeCKINfqXTpQxUxmt606zL6eMp
         zBuA==
X-Gm-Message-State: AOAM532SPsypU1AZC0mnqU4Hs0JWRvR8+Nema73iOX5tne6ATvvRkgdn
	qQSKiy+hPykwDa+HcifeV9c=
X-Google-Smtp-Source: 
 ABdhPJyUZ4+PymwL2KYCe7172sgaodyMwVhcfPbofpk+wm+0+v8wTGkdF5joYdvc819XDzG8NS/eVg==
X-Received: by 2002:a2e:9246:: with SMTP id v6mr6794816ljg.160.1639062795138;
        Thu, 09 Dec 2021 07:13:15 -0800 (PST)
Received: from [10.133.222.104] ([185.253.97.13])
        by smtp.gmail.com with ESMTPSA id w8sm13704lfa.206.2021.12.09.07.13.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 07:13:14 -0800 (PST)
Message-ID: <b51f6ddc-f3d3-1f38-f37c-1cf785af15e3@gmail.com>
Date: Thu, 9 Dec 2021 16:13:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [OE-core] [PATCH 1/6] overlayfs-etc: mount etc as overlayfs
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1637301667.git.uvv.mail@gmail.com>
 <83e41a0b7b5e1dc41fa89ffb4d3a8105299f7b1c.1637301667.git.uvv.mail@gmail.com>
 <CAAnfSTttdJWnK=15xJbUgwze6spQ4q+VTsnYVX2-jQ1oD0-Xnw@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: 
 <CAAnfSTttdJWnK=15xJbUgwze6spQ4q+VTsnYVX2-jQ1oD0-Xnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 15:13:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159454

On 09.12.2021 11:59, Ross Burton wrote:
> On Fri, 19 Nov 2021 at 06:15, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>> +# Class for setting up /etc in overlayfs
>> +#
>> +# In order to have /etc directory in overlayfs a special handling at early boot stage is required
>> +# The idea is to supply a custom init script that mounts /etc before launching actual init program,
>> +# because the latter already requires /etc to be mounted
> Can you elaborate on the exact scenario that is being supported here?
> Is it read-only / with /etc (and potentially more) in an overlayfs?

Correct, that's a read-only / with only /etc in an overlayfs. For other 
directories (not under /etc) there's a systemd based solution in 
overlayfs.bbclass.

>> +OVERLAYFS_ETC_MOUNT_POINT ?= "/data"
>> +OVERLAYFS_ETC_FSTYPE ?= "ext4"
>> +OVERLAYFS_ETC_DEVICE ?= "/dev/mmcblk0p2"
> I'm guessing these are not universal defaults, but the values that you use.
>
> If you can't provide default values which will actually work out of
> the box, just set them to "" and the class can abort if they're not
> set.
>
> Ross

Thanks for the feedback. Will fix that.

Vyacheslav

