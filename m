Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9E9C7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 12:55:44 +0000 (UTC)
Received: from h3.cmg2.smtp.forpsi.com (h3.cmg2.smtp.forpsi.com [185.129.138.188])
 by mx.groups.io with SMTP id smtpd.web10.14213.1750337741958033587
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 05:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=Vcw8xNdu;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=Vcw8xNdu;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.188, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.10.89] ([178.143.45.236])
	by cmgsmtp with ESMTPSA
	id SEnruZEFH75drSEnruevMa; Thu, 19 Jun 2025 14:55:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1750337739; bh=zs/HRYng8F6AfFcWw//HPAIhvXuSEDOpW6GP/XnvgYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=Vcw8xNduQMQCG6+AvkHQ2/wojNnLLysVhCBxBsOfWAJ94m2HsPSPWmOKel5fTMih5
	 Ak0exAT1fkQ5CGNvA9jlV8ky5tNzQmjylIS7gMoBlaKAoaReyURvpoCSHQg7t/EW2k
	 3K0FJ8cnKedu170tNlRCU1p6nE3m6c2BtLquVlQHuKlyg8/tIrYU21GRni+kyNftpw
	 XjX/cAx8HmTt6LqCS0nJx5xxQNxrR3i5Mu4Uji+6NgnwgvtEiViNqP99t9NosJECz7
	 2hlbGDN1oQzKjkBfSRhBMwydwQnkER44imvaGopIe/qsIUtg88l3wzxhonvuTPnHMH
	 dGoKhuCimQp6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1750337739; bh=zs/HRYng8F6AfFcWw//HPAIhvXuSEDOpW6GP/XnvgYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=Vcw8xNduQMQCG6+AvkHQ2/wojNnLLysVhCBxBsOfWAJ94m2HsPSPWmOKel5fTMih5
	 Ak0exAT1fkQ5CGNvA9jlV8ky5tNzQmjylIS7gMoBlaKAoaReyURvpoCSHQg7t/EW2k
	 3K0FJ8cnKedu170tNlRCU1p6nE3m6c2BtLquVlQHuKlyg8/tIrYU21GRni+kyNftpw
	 XjX/cAx8HmTt6LqCS0nJx5xxQNxrR3i5Mu4Uji+6NgnwgvtEiViNqP99t9NosJECz7
	 2hlbGDN1oQzKjkBfSRhBMwydwQnkER44imvaGopIe/qsIUtg88l3wzxhonvuTPnHMH
	 dGoKhuCimQp6w==
Message-ID: <07df4db4-892e-46e0-9d97-b60f8d85d1f4@skyrain.eu>
Date: Thu, 19 Jun 2025 14:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] perf: nativesdk
To: richard.purdie@linuxfoundation.org
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <7dee70c7-d0a8-44ea-94a1-2c4be581208e@skyrain.eu>
 <dcf64e281e9fd6a81d3e3ec9fc7088c1cd09d06c.camel@linuxfoundation.org>
 <3647d65b-e79b-46e4-83e9-46b17762934b@skyrain.eu>
 <97a02d26042945f79cdc8a4a7099afbf93079d6b.camel@linuxfoundation.org>
Content-Language: en-US
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <97a02d26042945f79cdc8a4a7099afbf93079d6b.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDoxehhb8aisuFcYJsGiIDud1Ic5gdoTnWQKLpOMWOZdiGtBOUk1/xNjNKzyrrqOaL2ULK0YoJBDRQeE+13Jo4NJeOL5mgGDy6ekrorXDOHSATaE2SjL
 3l8sMhFnIM1SkxtOZvCz+mDBwHRi+q34IM/r+4919V+ulF2IK5zTt87dZnUBO5CZ4XnmHaf7yK+K3U/EYi5Qy/8h4zkPH1kvOOY5bXxahHL5JGPgGe/cAqbT
 O4k6k5+nu+FIYZKUj5RYQMHm0zZbkjB/P1xzY0Cq8B4=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 12:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219075

Ok, then forget about the previous variant, since I have a solution 
here: https://lists.openembedded.org/g/openembedded-core/message/219066 
. I will just ship qemu-native in SDK.

But anyway thanks for your response.
Andrej

On 19.06.2025 14:45, Richard Purdie via lists.openembedded.org wrote:
> On Thu, 2025-06-19 at 13:44 +0200, Andrej Valek wrote:
>> Yes I know, that is bad, but I solved it already with other way.
>>
>> On the other hand, maybe the lines in kernel-yocto.bbclass should be
>> target specific.
>>
>> do_kernel_configme[depends] +=
>> "virtual/${TARGET_PREFIX}binutils:do_populate_sysroot"
>> do_kernel_configme[depends] +=
>> "virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
>>
>> I think, that dependency to gcc-cross was done like:
>>
>> linux[do_kernel_configme] -> gcc-cross-aarch64 -> linux-libc-headers.
> It won't be those. kernel.bbclass does:
>
> DEPENDS += "virtual/cross-binutils virtual/cross-cc kmod-native bc-native bison-native"
> [...]
> # we include gcc above, we dont need virtual/libc
> INHIBIT_DEFAULT_DEPS = "1"
>
> and virtual/cross-cc will expand to gcc-cross-aarch64.
>
> There is an assumption that nobody uses nativesdk with kernel.bbclass
> in multiple places.
>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219073): https://lists.openembedded.org/g/openembedded-core/message/219073
> Mute This Topic: https://lists.openembedded.org/mt/113722107/3619876
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [andrej.v@skyrain.eu]
> -=-=-=-=-=-=-=-=-=-=-=-
>


