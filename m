Return-Path: <mike@foundries.io>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id B8FC77D2EC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 17:03:39 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id t16so7845042plo.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 10:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=QNo2GTbJ525ckb6qwI45LPIGHor3VOr4UEkquJ2wMrM=;
	b=dxFgEVr9iip5GpMimqafudW+ibF/XpGEcgNCiGWYJTRng2b8ZF+Y8ImjwxMb9bVsFi
	OvtnlhlMNElTVJEY2ECDJat51DEsoy6lUTwZ/F+DrpB049pe31NAlNJ/KkQiZqD2jpkJ
	I05+SYX31NVdpxWd41V/jgnSGfbPYu7vbjsc4n+1sAQ6voYYj3DQlKnPTDYzX14ahrnJ
	uBxJ2WFMuIeuIsA/jdrzgE+nQV9BMal+qf3INbYsgvG2TaNYmy81iioQtQn+1RvlmNqc
	GAaYiL36KFR7Cw/EdewfgzPyLUGBTLMbXVyampSJYfzUUrxUs93YHZK8Ze8PvC0oVb0F
	q74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=QNo2GTbJ525ckb6qwI45LPIGHor3VOr4UEkquJ2wMrM=;
	b=WY4wSWA8diZYZN77mW7l1ge3HGjoIXwiJE273GrUyk4enAY+VE0QitxatM0DwPxmGz
	TU/nekr0eszsQe7rZvIqKs/UVrre5XNuRSFUTG/Y9Ru17lm8BIgTaPqfggc3rCF5YyRr
	D2vV8QNcNa2l/PULW7vlSKTSmTM8D5JxQyMcQJ4W6qHxjrVy74EZt/vkbgzQK8HfRDMZ
	1FLO0aM+ryRWWhZ9EI/rN6rMH2EWOG0lw/0sb5EszAZy+vU/AcFheyr+uZjd+UULYkip
	gXIeATZMEBk0y5T6KPJ6hL9/4jMoVmEFtPd1FPfcPSTKTYaqJ5jBZ0pg48s0tAiyZRxi
	KbOw==
X-Gm-Message-State: APjAAAXhL9xRXauMcPLGkuGVrDklC0qlxGran8ZhgpONAdmZmspZXmNo
	YKMRfU+E53ivQH1ntX7RxxdvaCsPJnA=
X-Google-Smtp-Source: APXvYqwe8jArhXdwj9Qb9V1QxCpH4eOWgXiZPvBVWOPICMgJ3N7Hht7QkKZWJbrAHfzV6LbDXJ4q+A==
X-Received: by 2002:a17:902:112a:: with SMTP id
	d39mr21275079pla.47.1556039019305; 
	Tue, 23 Apr 2019 10:03:39 -0700 (PDT)
Received: from [192.168.69.121] (107-198-5-8.lightspeed.irvnca.sbcglobal.net.
	[107.198.5.8])
	by smtp.gmail.com with ESMTPSA id l15sm938608pgb.71.2019.04.23.10.03.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 10:03:38 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>, Alistair Francis <alistair23@gmail.com>
References: <20190413045641.3659-1-mike@foundries.io>
	<88e820e3-d8b5-e57e-5362-4e36b4799461@foundries.io>
	<d110e52007bc2f3fe015506613211d961a03d979.camel@linuxfoundation.org>
From: Michael Scott <mike@foundries.io>
Message-ID: <51d1cebe-a868-5d63-e3ad-f81d00b1251c@foundries.io>
Date: Tue, 23 Apr 2019 10:03:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d110e52007bc2f3fe015506613211d961a03d979.camel@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel-fitimage: support RISC-V
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
X-List-Received-Date: Tue, 23 Apr 2019 17:03:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 4/23/19 2:37 AM, Richard Purdie wrote:
> On Fri, 2019-04-19 at 10:41 -0700, Michael Scott wrote:
>> On 4/12/19 9:56 PM, Michael Scott wrote:
>>> Support RISC-V kernel image, using the "Image" target.
>>>
>>> This change allows RISC-V support for fitImage via the following
>>> flow: OpenSBI -> u-boot (as payload) -> Linux kernel (as fitImage
>>> with ramdisk and dtb).
>>>
>>> This was tested using QEMU RISC-V 64-bit.
>>>
>>> Signed-off-by: Michael Scott <mike@foundries.io>
>>> ---
>>>    meta/classes/kernel-fitimage.bbclass | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/kernel-fitimage.bbclass
>>> b/meta/classes/kernel-fitimage.bbclass
>>> index 2517d75746..09abedff8e 100644
>>> --- a/meta/classes/kernel-fitimage.bbclass
>>> +++ b/meta/classes/kernel-fitimage.bbclass
>>> @@ -8,7 +8,7 @@ python __anonymous () {
>>>            d.setVar("DEPENDS", depends)
>>>    
>>>            uarch = d.getVar("UBOOT_ARCH")
>>> -        if uarch == "arm64":
>>> +        if uarch == "arm64" or uarch == "riscv":
>> I didn't see any response to this v2 patch.  Is this approach
>> acceptible?  RISC-V should not attempt to use zImage for fitImage as
>> it now stands.
> I think the v1 patch was merged. I'd take a patch to tweak the code to
> the v2 version as it is slightly neater but its not essential.
>
> Cheers,
>
> Richard
Thank you for pointing out that v1 got merged.  I didn't realize there 
isn't a notification for when patches are merged and wasn't watching the 
warrior branches.  I'll submit the tweak patch later this week.

- Mike

>
-- 
Michael Scott
Embedded Software Engineer at Foundries.io
"microPlatforms™ for Connected Products"
E: mike@foundries.io
W: https://www.foundries.io


