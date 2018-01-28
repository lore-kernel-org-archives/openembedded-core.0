Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9F3886069C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jan 2018 00:48:13 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id g18so1204593plo.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 16:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=RUxHr6eLVovOZA5RYoSYa9ggcOBCvuN2+W6SmFvAQlo=;
	b=G7wgJAt0hF6Ir+B+kvYncd2HFrzXRpygoRrMZyd5LnqwHCiSq/qX69gN/K1AtpVFxr
	InBGaJRmYOSIk33HPYVWMkkf7r1l64qItw0eCzrFf+6xMdlrNUqpLAGAl/oT+9iLtTag
	IYjAeqVKRGD8RHKxjaoVQeK0HL10SyxSoa+0O5kDrjk837yVi2HQZK7QRgnmszgvKTnJ
	mYjTv03W0qfPydSZItElNnDJHWhCK+24p5k+j4hLuOYDM70RNGyDzowY2AmcUJi3XMM/
	gPES7BaNA7fuasi3Kh64GGjWJSb1IzepsJE8faQ0Dq+IKLht805qy9+W6FlmAyzWBblH
	a9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=RUxHr6eLVovOZA5RYoSYa9ggcOBCvuN2+W6SmFvAQlo=;
	b=jJg77Fdg8+il51ZtXqnp1VVVVpW6t3UZ2SvhIfdMEOnAqcUPMIYKj2H2cdMyzCt/m6
	Y53u4FR/usMUKUNfva8/StCEg2DnLCRSOw9vvi3iuJ+INBSQRD8WXF+DS7N7IFNkzMhY
	NhOApYpwldvsOyd1HX+H7fyT5gCHS78Ko0nzHNefUm13g+AmLuC3wDY7hl9aGjgZfOW2
	NisImAfaHdeRId11PuKDA8ZJDY9LxbniZwv0oyw8eVtxUk0IJSnmlC9v7x+uFt7XY/4s
	k3WIf6JEgWbbMgRtX1jqsmYaQHZ6LfdSQey0pwtPp6//hP+kDVxBaxT823TAH42ROsg9
	VWww==
X-Gm-Message-State: AKwxytfa4UXI/2gHzZbnAse/OlkvKmq8DIj+WciOdcyl+TyXv6zTmsok
	VILxKehot22bmWdBDAfnR5Q5WA==
X-Google-Smtp-Source: AH8x227GleWmPXtIxjnAT5ToLtjsk448KSTBqQLUwJwkLEcoCj3QoUS+AASLte5gnP9h7Xb6EXC9Rw==
X-Received: by 2002:a17:902:579d:: with SMTP id
	l29-v6mr8885963pli.27.1517100494578; 
	Sat, 27 Jan 2018 16:48:14 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:9caf:51c0:84fe:36ce?
	([2601:202:4000:1184:9caf:51c0:84fe:36ce])
	by smtp.gmail.com with ESMTPSA id
	c1sm18706039pfa.119.2018.01.27.16.48.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Jan 2018 16:48:13 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1516102686.29722.267.camel@linuxfoundation.org>
	<1517070952.756.40.camel@linuxfoundation.org>
	<BY2PR02MB347BCA749C4415BE91A11E3B9E70@BY2PR02MB347.namprd02.prod.outlook.com>
	<1517094397.756.44.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <0ff82cae-aeee-ae80-76e6-3672a1180b04@gmail.com>
Date: Sat, 27 Jan 2018 16:48:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1517094397.756.44.camel@linuxfoundation.org>
Subject: Re: Yocto Project, Spectre and Meltdown
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
X-List-Received-Date: Sun, 28 Jan 2018 00:48:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 01/27/2018 03:06 PM, Richard Purdie wrote:
> On Sat, 2018-01-27 at 16:59 +0000, Manjukumar Harthikote Matha wrote:
>> -----Original Message-----
>>> From: openembedded-core-bounces@lists.openembedded.org
>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>>> Of
>>> Richard Purdie
>>> Sent: Saturday, January 27, 2018 8:36 AM
>>> To: openembedded-core <openembedded-core@lists.openembedded.org>
>>> Subject: Re: [OE-core] Yocto Project, Spectre and Meltdown
>>>
>>> On Tue, 2018-01-16 at 11:38 +0000, Richard Purdie wrote:
>>>> I just wanted to give people an update on where the project
>>>> stands
>>>> with these issues.
>>> Master now contains gcc and kernel fixes (in linux-yocto). meta-
>>> yocto- bsp updates
>>> are still pending.
>>>
>>> rocko-next also has those fixes and is undergoing testing which if
>>> it passes, will get
>>> pushed to rocko.
>>>
>> I see that rocko-next branch is upgrading the GCC version to 7.3 from
>> 7.2 , is there a reason to do so?
>> I was under the impression that we would backport the security fixes
>> to 7.2 version.
> As Khem replied, this is the stable gcc series and gcc remapped their
> versioning scheme a while back to mean that 7.3 is a point release of
> the 7 series.
>
> I'm of the view that the gcc team know a lot more about which patches
> should be backported to a stable series and have a better skillset and
> knowledge base to know how to apply patches onto the older versions
> than we do. As such I believe that 7.3 is the right approach for rocko.

Agreed.

>
> Do you have a reason to believe we should do something else?
>
> Note that for pyro and earlier we will need gcc 6 patches, we are not
> upgrading 6 -> 7 on pyro since that would cause a ton of breakage.
Agreed. Currently  evaluating best  and safest approach.

- armin
>
> Cheers,
>
> Richard
>


