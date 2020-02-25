Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id BB938616B7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 16:33:33 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id 12so1508655pjb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 08:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=auI0RrcTaFEGRkQKz3Qx4EFgaiD5fv5Yg45F3Ykqn3k=;
	b=aKneKrveCuKOY5/purIZ22UjJyZzIdkZEH+SiYHF8Fv97oiJzu8X2UDe/v/7PlqGKU
	4tDaoQptb+SrI5SMvoouxHWT+QSWXO9wjGvD5e7O04qlU5WBGicNsjsNlm/BYKLVnrBW
	vvluwOI4+uqB1GiBizijkmUWnRhsHEEpA5mUUPoQdlwSA+A9mNlbLbSuIEWnDNi5Gy+F
	vFKvG1LmB3wkYI25MROTvkHFxsoRaPm6xjfD1For9Bm42rIRX7xazewVVCNWNjEU6Xmo
	vwhQP+ZjpdsRs2eYUdWyu39iPBtB4LbZ21zC0P0Fy+uft+AcCbyqR97N//8Xl42cDq5B
	wbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=auI0RrcTaFEGRkQKz3Qx4EFgaiD5fv5Yg45F3Ykqn3k=;
	b=okM7TSF5jC1s604aQvmz7tnRdSCW79vlnuOPz0CJUR1U7MD4BwSQvAbfZkQV29r2ni
	LOJ6F/+IAVDfPqcplFqwzKfguEz+OwK+15RwZO5nmqPtgqdRH4OIBwiOoDOyBiMYEwoH
	VtzkPTsWMiDBALKCLUPJtZo1AOroOnhvPnxZ/iFTejIC4riloIWwkAxncjpwBobEeQE2
	HnaEonYUrRWlTdOo+rFrT5lSS7Ff6EZJBxOL4vCCr2+3as69DYVRZB6HmrXI319HYPYQ
	7TyIi4vq6oyVbT7/pYh7nRPKLan1koklQvtHL8qGkfIIEWtTcrDdmD6Jr4qCG3DQoX7t
	hA9g==
X-Gm-Message-State: APjAAAU1vkd2GmmM0QjQ8YS0o63qDvEfW7Pp+J70VKLUHSo9eVBctsKh
	kE2tsvEmGCuPUFUUFXHPeQ8lqeHIdp0=
X-Google-Smtp-Source: APXvYqwdRd8Go/dudgeAgPKgHdgEcped925+gnqwqhBuFhaYtKpLFbRrWQWNtY4ALkE6JJkfxHd+Zg==
X-Received: by 2002:a17:90a:ac02:: with SMTP id
	o2mr6263707pjq.93.1582648413894; 
	Tue, 25 Feb 2020 08:33:33 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:a81f:d24b:3e8b:cce0?
	([2601:646:9200:4e0:a81f:d24b:3e8b:cce0])
	by smtp.gmail.com with ESMTPSA id
	g10sm18215186pfo.166.2020.02.25.08.33.32
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 25 Feb 2020 08:33:33 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <20200225054406.867243-1-raj.khem@gmail.com>
	<29622e48fc7ebf80aa002b2d1903f6d970af9d86.camel@linuxfoundation.org>
	<CALbNGRRvG9BT3noMne1c4Xc7ALJjT5KT+3eZtaMun=bT5g772A@mail.gmail.com>
	<0a3ecc0796a2737d8396d39c38bb08b2331ef08b.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <52fc46e9-83f6-5f9e-a8ee-454a30cf03e8@gmail.com>
Date: Tue, 25 Feb 2020 08:33:32 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0a3ecc0796a2737d8396d39c38bb08b2331ef08b.camel@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mime,mime-xdg: Conflict with allarch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Feb 2020 16:33:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 2/25/20 6:07 AM, Richard Purdie wrote:
> On Tue, 2020-02-25 at 13:24 +0100, Andreas Müller wrote:
>> On Tue, Feb 25, 2020 at 11:21 AM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Mon, 2020-02-24 at 21:44 -0800, Khem Raj wrote:
>>>> mime and mime-xdb classes add dependencies ( both runtime and
>>>> buildtime
>>>> ) on target packages, therefore recipes using allarch should not
>>>> inherit
>>>> mime/mime-xdg or vice-versa, this fixes subtle sstate mismatches
>>>>
>>>> [YOCTO #13805]
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> Cc: Andreas Müller <schnitzeltony@gmail.com>
>>>> ---
>>>>   meta/classes/mime-xdg.bbclass | 5 +++++
>>>>   meta/classes/mime.bbclass     | 5 +++++
>>>>   2 files changed, 10 insertions(+)
>>>
>>> Is this the right way to fix this? mime info probably is arch
>>> independent, so should we be whitelisting some of the dependencies?
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>> Khem and I had a short discussion about this [1]. His first approach
>> was to remove DEPENDS. As far as I remember the deps were added to
>> avoid QA warning.
>>
>> Honestly I never understood why these are spawned. If there is a fix /
>> workaround this could be reduced to rdeps which an be handled for
>> allarch.
>>
>> [1] https://github.com/YoeDistro/openembedded-core/commit/5605a9cf78c3731e2cc055cd4f8cc88a0b3d7e26
> 
> I'd guess something like:
> 
> SIGGEN_EXCLUDERECIPES_ABISAFE += "\
>    shared-mime-info \
>    desktop-file-utils \
> "
> 
> in layer.conf might be the correct fix. The other approach is just a
> workaround.

yeah, I am testing something like this.

> 
> Cheers,
> 
> Richard
> 
> 
> 

