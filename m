Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id E2960786F5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 01:33:03 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y5so987536pff.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Jan 2018 17:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=zkxXY95xg18Yn6KD2A3wuoPNar4qeZLskqHDpC+pAvU=;
	b=obW7x1sU6zctGla0oir/qax4VSvmAVRp0NiYv479s1by7qj3UwJYvt20bRMMnwU4DO
	nAZTgZmgEAw7Zr1T6iRomRGjmg1bNZOGYpkW+F0CCKEiSS3gO2tNyrRfl2Y9XoUFxu++
	iwOv/uQSCox+SoT+OCAGQk79CSyZx8bQgwSKNtBezHauFJ68W67R/aPOPN9DneQcx5HA
	hp5QI42mUNBSUf8dKEi4zi/7hu6hCh7K4GKnmYGJNh5aT9op4dh/2fOTxLgaKcv5O8Kw
	lvgatDzwVznd7crAVpdUe196K8TmzvsZErfdwcORZzmFoklJrp8YOasDsjE4SBIi1Ift
	nAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=zkxXY95xg18Yn6KD2A3wuoPNar4qeZLskqHDpC+pAvU=;
	b=T0OGQ7Sjw7pbjRVokZMkfxRWTf9TgQdKYK+GAV9ndiVe0FBOyG5GUcZsFT36VyCkmy
	IGWRKqdZ6EpaEiSIGhKHGMO4EA6L/7jtsDTF2ChwrWQnVAsU3DSW/wY9qCrJLEmIsb2G
	L6UdaSKB6bgn6Xc+/VI6glzKiPD4Hc3iE3BiPrOm4sktjCa8RB7juhRue8iUJzlu05oO
	N1EY+T4me5Mo48fomR/YovUaCdtfogkYpLj2aOPm7uSFUAI7ojdZNp5/EyRxokpY4EAf
	oeHKGwy7+6avWmG5h6PZBS3AT6iQRa+HSvWuRtCjFKzlpWGUp6BScIymA8sc56jUj12g
	yNUQ==
X-Gm-Message-State: AKGB3mKQd3k9uU3FxQeCMt5fr+sQnR2qHoQCV4Glff6k2bfaYjlcQGlC
	D0J+7/WUzFLbP+hFh0CicVaYag==
X-Google-Smtp-Source: ACJfBoucYYUBToa7cbL/h2UhZxwNZQmk68z8Po8S8kti+IGJrSK5hGSxJG/LbZVpvVIYXNh2BSdSSQ==
X-Received: by 10.98.62.142 with SMTP id y14mr9131937pfj.89.1515375185020;
	Sun, 07 Jan 2018 17:33:05 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:d3a:c846:b190:ee80?
	([2601:202:4000:1184:d3a:c846:b190:ee80])
	by smtp.gmail.com with ESMTPSA id
	t66sm27537386pfa.153.2018.01.07.17.33.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Jan 2018 17:33:04 -0800 (PST)
To: Marek Vasut <marex@denx.de>, Bruce Ashfield <bruce.ashfield@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20180107161920.30937-1-marex@denx.de>
	<20180107161920.30937-2-marex@denx.de>
	<CADkTA4MH4EL42iL=BXRKy8y0Gp_bwOarpXiBEPrvCSygOuT4oQ@mail.gmail.com>
	<db5ad1b0-0994-0ce9-79df-39a1704b1072@denx.de>
	<CADkTA4NL=2rzVUfwimQhON00xFMy2UwrQ63vjmR_4QBGHNn1EA@mail.gmail.com>
	<2c1c48a3-5355-b3eb-fab0-765a007b8475@denx.de>
	<CADkTA4NAvZVW_dNbOi_2OgyNxkQXDj9XJtbDpSztXSfaYRxP=Q@mail.gmail.com>
	<1999cffb-3890-2271-3938-ba2be97b135d@denx.de>
	<CADkTA4OQNJWyMn8tj7m8nEOjeH4M5V729uU+OBerKe5V+ns2VA@mail.gmail.com>
	<5ba2da95-dbe0-b65b-e2e9-8e8fff030d96@denx.de>
From: akuster808 <akuster808@gmail.com>
Message-ID: <e7900061-c2b7-6eba-8db2-01e177ae6f95@gmail.com>
Date: Sun, 7 Jan 2018 17:32:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <5ba2da95-dbe0-b65b-e2e9-8e8fff030d96@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel: Add optional patch_xenomai task
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
X-List-Received-Date: Mon, 08 Jan 2018 01:33:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 01/07/2018 10:57 AM, Marek Vasut wrote:
> On 01/07/2018 07:55 PM, Bruce Ashfield wrote:
>> On Sun, Jan 7, 2018 at 1:49 PM, Marek Vasut <marex@denx.de> wrote:
>>> On 01/07/2018 06:55 PM, Bruce Ashfield wrote:
>>>> On Sun, Jan 7, 2018 at 12:53 PM, Marek Vasut <marex@denx.de> wrote:
>>>>> On 01/07/2018 05:42 PM, Bruce Ashfield wrote:
>>>>>> On Sun, Jan 7, 2018 at 11:38 AM, Marek Vasut <marex@denx.de> wrote=
:
>>>>>>> On 01/07/2018 05:37 PM, Bruce Ashfield wrote:
>>>>>>>> On Sun, Jan 7, 2018 at 11:19 AM, Marek Vasut <marex@denx.de> wro=
te:
>>>>>>>>> Add additional task, do_patch_xenomai, inserted between do_patc=
h and
>>>>>>>>> do_configure tasks. This task applies the cobalt patch to the k=
ernel
>>>>>>>>> sources for a specific machine. This is disabled by default, so=
 use
>>>>>>>>> PACKAGECONFIG[xenomai] of the kernel package to enable the patc=
hing.
>>>>>>>>>
>>>>>>>>> You will also need a kernel recipe for a kernel version with ip=
ipe
>>>>>>>>> patch applied.
>>>>>>>> This doesn't make any sense to me.
>>>>>>>>
>>>>>>>> Why on earth would this be in kernel.bbclass ? and part of a xen=
omai
>>>>>>>> recipe ?
>>>>>>> Do you have a better suggestion how to make this easily available=
 for
>>>>>>> every kernel recipe ?
>>>>>> There's no need to make it available for every kernel recipe. If s=
omeone
>>>>>> wants to build xenomai, they need to have a specific kernel recipe=
 and
>>>>>> configuration to make it work. By providing that patch and allowin=
g it to
>>>>>> be applied to any kernel doesn't mean it will actually work .. so =
you aren't
>>>>>> doing anyone any favours.
>>>>>>
>>>>>> The same thing could be said for the -rt patch, aufs, etc, any pat=
ch could
>>>>>> be made available for any kernel, but they aren't, since they will=
 either fail
>>>>>> to patch, or won't work at runtime.
>>>>> We actually have a -rt patch available in the kernel recipes, so wh=
y not
>>>>> xenomai patch ?
>>>> As a separate recipe, not as something in a common bbclass, which im=
plies
>>>> that it applies and works everywhere.
>>>>
>>>> Anyone that is trying to apply -rt against a generic kernel .. is ve=
ry mistaken.
>>> So I should pull this into linux-*-xenomai , just like the rt patch d=
oes?
>> Yep.
>>
>> But how it is maintained is a RP question, oe-core has a set of refere=
nce kernel
>> versions, and those reference kernels have a similar set of functional=
ity across
>> architectures, are actively maintained and all get the same fixes at
>> the same time.
>>
>> (and I just realized that RP isn't copied on this thread anymore, so I=
'm adding
>> him).
>>
>> If we introduce something like this, I'd argue that it needs to follow=
 the same
>> kernel versions to be consistent with the other oe-core references.
>>
>> That is a question for the steering committee and the architecture mai=
ling list.
>>
>> So while that happens, why not just put this in a meta-xenomai for the=
 time
>> being and once all the details have been hammered out, it could merge.=

> That's fine by me, although the main feedback I'm currently interested
> in is whether this has any chance of getting included in oe-core and if=

> there are some other big issues with this .
>

My biggest concern is who will keep this maintained in Master and in
stable branches? Do we need to add this to the test matrix? Adding
things to Core has a different set of requirements than other layers.

- armin


