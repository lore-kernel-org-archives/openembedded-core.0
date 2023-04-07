Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0EEC6FD1D
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 05:26:13 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.1193.1680845168496284316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 22:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=iNeUnfsV;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: jpuhlman@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id 20so72427plk.10
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 22:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1680845168;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NV8oVdiq9NRJY/Kh91hZSciNOudBUfvkh1yEro87oRs=;
        b=iNeUnfsVHrIH6ldCEdIPaWZqnCvQNs1mjdWOVbrOXz+KNpHbhjfGf6JvtpswKJW9Jn
         +PsnDceCl1TozR8Ph5JizBw7g6T9dGYcTXNII4OMW0XKFbZZOhi7ugSikLvEzu7D0mvn
         qahnJ6bumYfoCRbMjJKiCvph5PtFKpBRxF5y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680845168;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NV8oVdiq9NRJY/Kh91hZSciNOudBUfvkh1yEro87oRs=;
        b=j7GBROScV5wbjHUeuK3SoY1GkC/+78WswKFNuet23vz2icSuA/dUHuJB2A1V0I6hC2
         I0v1wNDtcbAGF8weSmz1ONIuaoAoK27Mk2h7A3XJ+0OyErKECwHyo3C8SV0SqBLhBGKs
         UR1hi2LnkQdjU6Dxpn3bOwnGhNmqAz3BylE+N2GY86E2Fc0xnDOEJxB4KOjzy6zey4nv
         KMIy6rQoOc1SWAGI4ZOE6ppVgh9mYtDpvzARmPv9dCyspGiYiMJHD+6pJLDV49Ta2xxC
         +5kAEcTRezAxinzctoaQtBjGksAVy2iuExFQFXLOwfV1eOEkwqdhSr+MgLqtUjxSHfYp
         76GA==
X-Gm-Message-State: AAQBX9fZ0wLLiDkqtbcIufyEro6v9ZdUXj3ZgCt+jUaILZrZcoxNP3HE
	oJtG6QrHTadjqfTeDfXEV7C2Xw==
X-Google-Smtp-Source: AKy350ZKdzAYxucuPXRzuPHnufYzhOr75VpAserzJ8rzv+KEQScnkwJ2OTanqtUKuE8ZnTeSclhMaA==
X-Received: by 2002:a05:6a20:bca7:b0:cc:868f:37b3 with SMTP id fx39-20020a056a20bca700b000cc868f37b3mr1621393pzb.58.1680845167908;
        Thu, 06 Apr 2023 22:26:07 -0700 (PDT)
Received: from [192.168.1.9] (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id n9-20020a62e509000000b00580e3917af7sm2168084pff.117.2023.04.06.22.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 22:26:07 -0700 (PDT)
Message-ID: <710f9e33-42fa-ccd7-7ec1-c8a67c19579e@mvista.com>
Date: Thu, 6 Apr 2023 22:26:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [OE-core][dunfell] qemu-system-native build failure
Content-Language: en-US
To: Frederic Martinsons <frederic.martinsons@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: "steve@sakoman.com" <steve@sakoman.com>
References: <CA+cAkep4o0Ep2VfZrq0jTn_gXvdBuZ9rYC7OgXMCfCHXBf68rg@mail.gmail.com>
From: Jeremy Puhlman <jpuhlman@mvista.com>
In-Reply-To: <CA+cAkep4o0Ep2VfZrq0jTn_gXvdBuZ9rYC7OgXMCfCHXBf68rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 05:26:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179812

There is already a patch in dunfell-next to resolve the issue..

https://git.openembedded.org/openembedded-core-contrib/commit/?h=stable/dunfell-nut&id=d17f4c741c66268ce54ff89be2be9b0402c98df2

On 4/6/2023 10:16 PM, Frederic Martinsons wrote:
> Hello,
>
> I came across a build issue for qemu-system-native on dunfell branch 
> when using spice PACKAGECONFIG.
> I found that the culprit is the CVE-2022-4144.patch introduced 
> mid-march and that was merged in upstream
> end of november 2022:
> https://gitlab.com/qemu-project/qemu/-/commit/6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622
>
> because it misses a variable declaration:
>
> |   CC      hw/dma/xlnx-zynq-devcfg.o
> |   CC      hw/dma/xlnx-zdma.o
> |   CC      hw/dma/bcm2835_dma.o
> |   CC      hw/gpio/max7310.o
> |   CC      hw/gpio/pl061.o
> | /home/test/qemu-4.2.0/hw/display/qxl.c: In function ‘qxl_phys2virt’:
> | /home/test/qemu-4.2.0/hw/display/qxl.c:1508:67: error: ‘size’ 
> undeclared (first use in this function); did you mean ‘gsize’?
> |  1508 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, 
> &offset, size)) {
> |           |                                             ^~~~
> |           |                                             gsize
> | /home/test/qemu-4.2.0/hw/display/qxl.c:1508:67: note: each 
> undeclared identifier is reported only once for each function it 
> appears in
> | make: *** [/home/test/qemu-4.2.0/rules.mak:69: hw/display/qxl.o] Error 1
> | make: *** Waiting for unfinished jobs....
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
>
> Looking more to the qemu git, I think the backported CVE is not an 
> atomic commit one
> and is a part of larger patches series, it needs at least this one:
> https://gitlab.com/qemu-project/qemu/-/commit/8efec0ef8bbc1e75a7ebf6e325a35806ece9b39f
> to be able to build.
>
> Moreover, I saw 5 commits that were merged by the same issuer and that 
> seems to
> be related to the same code path.
>
> Can someone who knows qemu give advice on what to do ?
> Modify the single CVE patch ? take the other commit which corrects the 
> mistake ? take the whole 5 commits ?
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179811): https://lists.openembedded.org/g/openembedded-core/message/179811
> Mute This Topic: https://lists.openembedded.org/mt/98120051/2167262
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jpuhlman@mvista.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


