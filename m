Return-Path: <jupiter.hce@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D2CC433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 01:45:56 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web09.846.1642556755810736605
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 17:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KswaQHKy;
 spf=pass (domain: gmail.com, ip: 209.85.221.175,
 mailfrom: jupiter.hce@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id 191so565908vkc.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 17:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uh9iUZ1/ygq6R73wQwriTQfc12b1ldB6Gj/DHQIA78Q=;
        b=KswaQHKySJA3k/fpEvPXlYXw1eI1baljamkUwKN4cUKLhqtW5FiU3yK8/W1R4c22NI
         Lbb16MCNOP3ppEn1QlLx1PgXAxr22a99SmhKz5YWcGQcRxAtIX4444MFDp4Twa/bXlh2
         O0BjdXxkZwlDCrdkVy2Ltfh9VSq6/gKCXArlJt0iVvrfCHJaJOTSmED/cIgh3to4EiC+
         JNLdeTBYs3ZCt851cKaBMhj9HkHZrILJjhVPc6fc1CDmDa9P66lQGTjq9uXoGIOiNrSj
         S+b3ubHSiBGhgr1lrP7MeojJ0xvC+UTk+rwer03xCIIZLDBPC6rKgeY39D3Hhfvz8Sb7
         MDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uh9iUZ1/ygq6R73wQwriTQfc12b1ldB6Gj/DHQIA78Q=;
        b=OSKzKDWfVMWuO0v94Vqoz9lWkXONSANcgpmUD0tMT2pFr4XsC5VyNC/JNpb7d6tj4p
         MnpjM5plAbhgwz+5GPE8LwNOASZYTSUNhE1Xmyt9cw5v1ql7AFaAGxp9+xD1MZKEvLLa
         on2TKsg3jr6KKjKuK1RqYu1VJwVdpxTLZvSAcbqszmOid9Sqx3/C1rLXfAEyraUEF4AB
         wrIFWNYyv64CToNoSW6d//bZm9+m/vqVVf1nMhS8cFGgCvc14njkjpMxs9BVgWgBcu0D
         sb49wXLzW6HQQ5CqAZhDr68gkG9Bekwg8JUYqsC03VqkvqcnY+9/6IoJz6Exp231OlfA
         AM/w==
X-Gm-Message-State: AOAM531XWYImx3UP9bVbMe0YEVinSKg26QfBn7NKyC/RvHAOleJfkr0v
	rHBHawvDkC86YdzF/6eXM5/xWvEeBBf4kn/kIORt9NAI
X-Google-Smtp-Source: 
 ABdhPJxBQuyVITY29JYtN/He2OTwk+zKrisX9M8vpeC+9Qz0yDSROM4hM7W0WEcV2SPYBDVyGHMWmnskfjyEXURLeGs=
X-Received: by 2002:a05:6122:98d:: with SMTP id
 g13mr9671514vkd.11.1642556754885;
 Tue, 18 Jan 2022 17:45:54 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAA=hcWQrFmWJMPizbeug6TPYsecWHttk4gM7netpGDiFv8N+Dg@mail.gmail.com>
 <CAPxNcnfb1z4fZfGGxEkyK3Hwa2fAwEGMRKP3_PrJc9Fmd4LS+Q@mail.gmail.com>
In-Reply-To: 
 <CAPxNcnfb1z4fZfGGxEkyK3Hwa2fAwEGMRKP3_PrJc9Fmd4LS+Q@mail.gmail.com>
From: Jupiter <jupiter.hce@gmail.com>
Date: Wed, 19 Jan 2022 12:45:18 +1100
Message-ID: 
 <CAA=hcWQM-eZicZGUt0gNQWoC0Ui5D2=08KgLyPs34Pw5Z-ZZwQ@mail.gmail.com>
Subject: Re: [yocto] Honister broken WiFi communication
To: Rudolf Streif <rudolf.streif@ibeeto.com>
Cc: yocto <yocto@lists.yoctoproject.org>,
	oe-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 01:45:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160686

Hi Rudolf,

Thanks for your response and comments.

> If you run ifconfig -a does your WiFi interface show up? If not there is an
> issue with the driver. Use dmesg and filter for the driver. Often a driver
> cannot load the firmware. What is your WiFi hardware?

Not that bad, the WiFi interfaces was fine, but it could not get dhcp
response and IP address so an automatic private IP address 169.254 was
assigned

mlan0     Link encap:Ethernet  HWaddr D4:CA:6E:A4:E8:B4
          inet addr:169.254.193.101  Bcast:169.254.255.255  Mask:255.255.0.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:2 errors:0 dropped:0 overruns:0 frame:0
          TX packets:56 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:330 (330.0 B)  TX bytes:16392 (16.0 KiB)

I could see WiFi information well, it is not a major problem, but the
subtle issues are connman and wpa_supplicant did not set up the WiFi
driver correctly.

Connected to 34:08:04:12:b1:a2 (on mlan0)
        SSID: JupiterIoT
        freq: 2437
        RX: 660 bytes (4 packets)
        TX: 46622 bytes (129 packets)
        signal: -57 dBm
        rx bitrate: 1.0 MBit/s
        tx bitrate: 72.2 MBit/s MCS 7 short GI

        bss flags:      short-slot-time
        dtim period:    1
        beacon int:     100

> Did you install the regulatory database?

Did you mean to enable CONFIG_CFG80211_INTERNAL_REGDB? No, I did not
install it in the Zeus version either so I don't see that could be an
issue.

> What error messages are you seeing when attempting to connect to a WiFi
> network? Did you look at the connman logs?

No error in connman, I don't think it is connman or wpa_supplicant
issue, my suspicion is something missing in Honister built image to
prevent connman and wpa_supplicant to set up the WiFi driver
correctly.

It is not the first time I have the WiFi setup trouble to get WiFi
169.254 address, when I upgraded from Thud to Zeus, I got the exactly
the same problem that WiFi was assigned by a 169.254 address, no dhcp
response, at time, I was totally convinced it was connman issue, I
spend several months to debug connman and wpa_supplicant without any
results, then after waiting several months to pull updated Zeus again,
that problem was disappeared miraculous, that is why I suspect the
same problem in oe-core and bitbake in Honister as well.

Are there anyone in oe-core and bitbake tested connman, wpa_supplicant
for the current Honister branch? I can help to test and to debug it if
more advanced people in oe-core, bitbake, kernel, WiFi driver mwifiex
can provide me more information.

Thank you.

Kind regards,

- jupiter

