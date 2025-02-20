Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5A2C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 15:53:03 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.53057.1740066774460623084
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 07:52:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D/hu27U9;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso7211465e9.0
        for <Openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 07:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740066773; x=1740671573; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZpqgDFac/2fWLY7pVYkhykZ2/f6caxu509wb850yzw4=;
        b=D/hu27U9/8ozQaO1kolQ0GONK522kKyqsnww6XJLrQ/7YF1uV9S+yo9rJ2z6djsKPN
         OPekL7rxC8l2J144iPOdbXYxdH+MvPK37eoVczrjBx+FuKyGDBwTjhYwewjOVEMnbkqW
         oMO2bdyPZbkeyze7L1fJbtBRpsglZNG4N45nc0Df0i1iJPhtwcxO2Uo6/CyoCkimSmCj
         1QQ2FjZRL9HWOmif+w9QOjD2BftZ7D2fcfWvbGVt6L7SyAF2UCo0CGOqKi/LD9zIt8DD
         Ooxzhv6HH3p28WrR6l5YGA8GqbRKfUxSutnFTh3O3QvU6QLuodCc5YtxQ2W4mkypJwSo
         TCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066773; x=1740671573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpqgDFac/2fWLY7pVYkhykZ2/f6caxu509wb850yzw4=;
        b=VConEMcVmnQs5eQ5lYiNMbbYYa2DNaizX8wd0r1ggIzvD2HNyn+2Qge2Q8HmN1N5ao
         ab/Luthvvc7AW31/wnr4JgNcJUzqUjgMnn2yMpvOAEpWFBWiZQQs9oaM3FMGbsSlWB7L
         XrfRM1dBKj65qfD2Ou2ynijMf9FAWf8dkT4z3FoCpE6d0JUnFIOCNSKMt5glbDHBCiWn
         XBDGUHblgJ3/LsHnLkjJMQczBFfuP8l6RMkRYSAYpTINq0ISPYy6uVgMsQWKc/f53TNL
         +mtBMRy33AQgq0IrWopxwBNpxHp82WEBNmnH87KWPmYNAKpv+XDvxVVTYteuFMJPeV88
         FNZQ==
X-Gm-Message-State: AOJu0YyU3ipwv2DkahBL5xtvTXQnCfIGDfu3dY6vF8Chen2TPZx3S3Yp
	0/2Xxbkt8jb5hgHfhXL2Qla98y8l5MPBr+xRSN8aLxwDe8Ss7QdZ
X-Gm-Gg: ASbGncvDYLMgxmtBsUHJIe5x3rr0YE9a7tkTTb7jDkw6fONb/zs+PirvlAw1jxjHQjC
	CMl6S03wdYrvezfOPbFbc5DRRp5f/Rhqd1gS6aLBj1lL9zVhvfpAdMrSmBiL/mBmd5GX/4O5r24
	VKKEYSsDzXvmHKMAjJeo6BP2jOY2I2AhhrvPEz88y9Xc9LsEP04KN5Fy/cEhpBZ1nkZnvvjeyRm
	sS0vyNil5kzVZjwQJdma6Mlah6GIaJYvGbLCXsiF2frDHPsbtPoZGDNy1Y12kq4U+c15xunlTtJ
	5mzBWkObYfY+6iLJod1n8p/5DA==
X-Google-Smtp-Source: AGHT+IFpO2xVkikexrwc5+npEYOQQ7dqKUe+OPNTYTXbIx75AGrmDwL9u+LSvysIYVpX9VC7MNhuGg==
X-Received: by 2002:a05:600c:54ea:b0:439:871d:d4c0 with SMTP id 5b1f17b1804b1-439a2eb09f6mr35081525e9.3.1740066772509;
        Thu, 20 Feb 2025 07:52:52 -0800 (PST)
Received: from [10.54.9.251] ([154.47.27.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439ac276ef7sm10881955e9.40.2025.02.20.07.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 07:52:52 -0800 (PST)
Message-ID: <ae46ffa2-b88d-4ec5-822a-08c00e2baa46@gmail.com>
Date: Thu, 20 Feb 2025 16:52:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v6] systemd: Build the systemctl executable
To: Ross Burton <Ross.Burton@arm.com>
Cc: "Openembedded-core@lists.openembedded.org"
 <Openembedded-core@lists.openembedded.org>
References: <20250219103908.42513-1-uvv.mail@gmail.com>
 <71BF1160-E808-4212-B790-5462F95BFBA4@arm.com>
 <1825F47182B39BA0.23135@lists.openembedded.org>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <1825F47182B39BA0.23135@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 15:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211766

From meta/classes-recipe/rootfs-postcommands.bbclass:

     # 20:12 < mezcalero> koen: you have three options: a) run 
systemd-machine-id-setup at install time, b) have / read-only and an 
empty file there (for stateless) and c) boot with / writable
         touch ${IMAGE_ROOTFS}${sysconfdir}/machine-id
     fi

We could think of further improvements. One thing that comes to mind is 
changing systemd-systemctl-native to systemd-tools-native and enable the 
build of systemd-machine-id-setup.

Slava

On 20.02.2025 16:33, Vyacheslav Yurkov via lists.openembedded.org wrote:
> Isn't is supposed to be created on first boot?
>
> Slava
>
> On 20.02.2025 15:07, Ross Burton wrote:
>> On 19 Feb 2025, at 10:39, Vyacheslav Yurkov via 
>> lists.openembedded.org <uvv.mail=gmail.com@lists.openembedded.org> 
>> wrote:
>>> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>>>
>>> Instead of the python re-implementation build the actual systemctl from
>>> the systemd source tree. The python script was used when systemd didn't
>>> provide an option to build individual executables. It is possible in 
>>> the
>>> meantime, so instead of always adapting the script when there's a new
>>> functionality, we simply use upstream implementation.
>> If I compare an image built with master and this, there’s one notable 
>> change in the file list:
>>
>> Changes to images/qemuarm64/glibc/core-image-full-cmdline 
>> (files-in-image.txt):
>>    /etc/machine-id was removed
>>
>> The good news is that apart from that the final images are identical, 
>> but that change wasn’t expected.
>>
>> Ross
>


