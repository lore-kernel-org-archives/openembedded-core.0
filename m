Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5879CFA455
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 17:24:46 +0000 (UTC)
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
 by mx.groups.io with SMTP id smtpd.web10.3401.1729704279779721772
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 10:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=SXLEw68U;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=SXLEw68U;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 81.2.195.163, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.10.89] ([62.197.243.174])
	by cmgsmtp with ESMTPSA
	id 3f66tlkuWeqGt3f66tjPIh; Wed, 23 Oct 2024 19:24:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1729704278; bh=a1rafeC4f+3B3nKlVZfpDdBJe18666KRAycWvc/64kI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=SXLEw68UwJWflabOpbAKYelmmUiBR7btGjyBW4JSVHMf7H05Sjwjh41YskFgLXli8
	 ZaEtEVuoe/Hx/UjaF6DkhbQ4Dpg3MLppTWju8IljWw2XE8m59pGVlKXum9oC0pTs0T
	 9hEhMj8iXNHgeIhcfFUPhVtAy03Q3te84GI77GMT7lETYNax6KIOUUv1YMiIe1UYXT
	 i5/PftiGz9L1/9gArXHgQIy126hgYwlAy8EoecF9Hw3N23U5jQqdrFIuSZgf8d6co7
	 zfJpg0QXRXDbyr/6kLNM+/GsiRVckkO/iZb+7AZ5UjxW5HLu3aXtMQG5tzRbVYv4rF
	 6Vm+KhvJH2+nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1729704278; bh=a1rafeC4f+3B3nKlVZfpDdBJe18666KRAycWvc/64kI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=SXLEw68UwJWflabOpbAKYelmmUiBR7btGjyBW4JSVHMf7H05Sjwjh41YskFgLXli8
	 ZaEtEVuoe/Hx/UjaF6DkhbQ4Dpg3MLppTWju8IljWw2XE8m59pGVlKXum9oC0pTs0T
	 9hEhMj8iXNHgeIhcfFUPhVtAy03Q3te84GI77GMT7lETYNax6KIOUUv1YMiIe1UYXT
	 i5/PftiGz9L1/9gArXHgQIy126hgYwlAy8EoecF9Hw3N23U5jQqdrFIuSZgf8d6co7
	 zfJpg0QXRXDbyr/6kLNM+/GsiRVckkO/iZb+7AZ5UjxW5HLu3aXtMQG5tzRbVYv4rF
	 6Vm+KhvJH2+nw==
Message-ID: <e4d52359-d557-464d-97ba-e804cb6a8e21@skyrain.eu>
Date: Wed, 23 Oct 2024 19:24:38 +0200
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
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJwi/MIkKuEy/S59DqFMxbQrvYVwpuibr6MBWFKnm85yUQXrSx0UYa8l2+ki2HiYBhgPT5XfuacQ7PQoEpA3PgQUktspXuVPl/7rGbSN79sFLLQxP0In
 0pfM0t/xZK2bzA7QeGvND8niiXqw52IMA993yQGPENr7CmYTN40CEgYD5tQW/lyH4Mr96nUlcNDvG8fSSSCokAF9C2nK9sjc2g3Ny3JVIWRtJS+PWVnFuC3w
 lZy8Jv8iz7IWrBmrsfhnuFzIxkfteaTFEF3rqr9PaCMfzuPJKnP7Yi+dYGNSZHWuvHq7RkwY+mT5G85vCaTreA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 17:24:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206258

Ok, god it..., it was a conflicting getfattr utility :)

V4 should fix it: 
https://lists.openembedded.org/g/openembedded-core/message/206257, 
hopefully...

BR,
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


