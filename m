Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA23CDDE7B
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 15:09:22 +0000 (UTC)
Received: from h4.cmg2.smtp.forpsi.com (h4.cmg2.smtp.forpsi.com [185.129.138.189])
 by mx.groups.io with SMTP id smtpd.web10.11484.1729696155374258145
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 08:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=h/fNF+1M;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=h/fNF+1M;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.189, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.10.89] ([62.197.243.174])
	by cmgsmtp with ESMTPSA
	id 3cz2t48hgTNCy3cz2tSSaa; Wed, 23 Oct 2024 17:09:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1729696153; bh=MwCFLPW3jdSkaNNSJ0s9yU1K3P+Z+HIrtlgnNy/F1xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=h/fNF+1MwxODGHLeIZwF1Tu1t/RMl47Ggx9vmE+PHFdgLGvJ5oduA9fMhI5/iC90D
	 NK4cTm0ls470obeRYjoCZpiysc87LorPP8PyQBbRO05uB20Vg452FtjKKRUoKAmp5V
	 95MDGxWmUSEUJxr+rznMR/eciIm+mjuAMEWwafO6oQ06VZepv9TboTWIk3s0d4fNaB
	 7ekEHi400IrHcYiKqo1TW6bTkm5jPKJU7pYDk6tH6aqg9p8RUPcrDTDk14bT5yn3TZ
	 T2u3l0T57OEGsq6K9pk0k5HXVLzh+rXaNL5NXe7CBs/UYWCvF/4hhSKNdCi5tLX58I
	 zNkem8vmHyrFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1729696153; bh=MwCFLPW3jdSkaNNSJ0s9yU1K3P+Z+HIrtlgnNy/F1xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=h/fNF+1MwxODGHLeIZwF1Tu1t/RMl47Ggx9vmE+PHFdgLGvJ5oduA9fMhI5/iC90D
	 NK4cTm0ls470obeRYjoCZpiysc87LorPP8PyQBbRO05uB20Vg452FtjKKRUoKAmp5V
	 95MDGxWmUSEUJxr+rznMR/eciIm+mjuAMEWwafO6oQ06VZepv9TboTWIk3s0d4fNaB
	 7ekEHi400IrHcYiKqo1TW6bTkm5jPKJU7pYDk6tH6aqg9p8RUPcrDTDk14bT5yn3TZ
	 T2u3l0T57OEGsq6K9pk0k5HXVLzh+rXaNL5NXe7CBs/UYWCvF/4hhSKNdCi5tLX58I
	 zNkem8vmHyrFw==
Message-ID: <58fc2ed7-17d8-486e-9b0e-d4bf8588e542@skyrain.eu>
Date: Wed, 23 Oct 2024 17:09:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v3] busybox: 1.36.1 -> 1.37.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross.Burton@arm.com, openembedded-core@lists.openembedded.org
References: <20241011094830.1009557-1-andrej.v@skyrain.eu>
 <20241019160221.47501-1-andrej.v@skyrain.eu>
 <f7b1d43d-9d5b-44d5-b7ba-02d6efeb6780@skyrain.eu>
 <b75ccaa35901e5b4cc42d486eb56723f682f8f61.camel@linuxfoundation.org>
Content-Language: en-US
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <b75ccaa35901e5b4cc42d486eb56723f682f8f61.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfOndHQfCf8pAvPHn1fV4AoLn6j+c8y4yM1DrDAlumRrNYDwYcs8OZzWruMHd7C0nM9h6607H+dFR2n5EzMG4vJMVqhrW0fDNxVMZ/Au45PJlg+Lr2x5H
 dOqA4obAbHjQ8LgmVQsDsyaUuCs92hPhnl5YaYRszvMBS7xTokOJ5YC+t3rqqn8Ur5pGo+6TzRH19oXIGxJoVAnXdjHnelVaks/KJe9P4bCRHxbbHuElYBjr
 48iKAzFGRHk2J7qhnuKJadfM7/MhOhdbYpNwDXyOFsArqQZBBmVqYNRlbKD9fgGI5PR8mJzWgQKjyo2wL9szlQ==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 15:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206247

Ah, I see some errors there, but it's little bit interesting, while I 
was testing it on "core-image-sato" with:

BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"


So I will test it with "poky-altcfg" and "core-image-sato-sdk" and 
hopefully hit the problem.

Regards,
Andrej

On 23.10.2024 16:52, Richard Purdie wrote:
> On Wed, 2024-10-23 at 11:14 +0200, Andrej Valek wrote:
>> Sorry for pinging you Richard,
>>
>> Could you please check it again? I wanted to be sure that there are
>> no leftovers.
> Sorry about the delay, I've been slammed with a ton of different issues
> and retesting this hasn't been straightward to mix into everything
> else.
>
> I've put this into a build and it is running at the moment.
> Unfortunately I'm already seeing signs that all is still not quite
> right:
>
> https://valkyrie.yoctoproject.org/#/builders/95/builds/280/steps/13/logs/stdio
> https://valkyrie.yoctoproject.org/#/builders/13/builds/268/steps/13/logs/stdio
> https://valkyrie.yoctoproject.org/#/builders/10/builds/301/steps/11/logs/stdio
>
> and probably more to follow :(
>
> Cheers,
>
> Richard
>
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206245): https://lists.openembedded.org/g/openembedded-core/message/206245
> Mute This Topic: https://lists.openembedded.org/mt/109102320/3619876
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [andrej.v@skyrain.eu]
> -=-=-=-=-=-=-=-=-=-=-=-
>


