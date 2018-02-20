Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2F0617871D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 14:53:26 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id s4so11619371oth.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 06:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=1av0Svd95SqrKaYn1eVnMIK/wHe6p4ss13VL3LmCglI=;
	b=HBjQxQZzOkXtvvlpAl4vRPM2JQgE6BzCG/lafDYSG2/tzuogSby9fxsYGgBrUNdgGp
	0Eya9ioOe/+GNIzSgclQYxcrXL062T+sxgOQO+VZkdE8WndcRrltl7QbBof3xpcYNokE
	M0SbdY9TgB2T1PcS4B69DLOn5Ks0OeXgmXYs+3oGTN+Gn47S2puhJcVozUOjh3822s+Q
	ofb0tNPv8XB5pZzYcNXo12r5dlIDUDxV93ccHXMHjwhIBwd9Bw+4dhoZ3l2g2RKElyTm
	iNU+nRnm+Ev6rFYXpNIgQX1eef/L9Tor+QtmcELI00q7x++mXApGmBi9MSX6W2hesn2Y
	t7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=1av0Svd95SqrKaYn1eVnMIK/wHe6p4ss13VL3LmCglI=;
	b=dXattKMGP3zUV75coKSZCr03wDTJF5/gnCWfqO3vMZhVoR6NR9iqn3OcvftJYqYSfp
	YnnTdZA78d6GmXba9xqp3EPVHirsnbNcWHDfk5ciCfocj2rhEvUjEaIKnvB9GUJLvzeh
	upJw89gryt7SDa39LYepehrroGiWP5PQmwnF50dAu6nX4LYOpF+ULCEpKLuRs52ikW88
	pPRa1mlP0UyUh509QtxUKlhI2KQMsgDhZ34CsmN0QE8LREomo+85NDpO3tOj8kpoc3i+
	7VfasJ44251EZVSot5gkej6hpUknczKndq8EHuS2WdITjWUSrvSs/bSmP1imVFI4D5YM
	Q/xg==
X-Gm-Message-State: APf1xPDi2xZV8zd0yEQ/86y/DZJ1Qyf304yip+eqbVO5ftaEqa5Pln+z
	FcH3USJJlEC8u7H2LNyjyYhyeFRE
X-Google-Smtp-Source: AH8x226vKS5oGlYGQMnS94wubM0z65e4Eh6pVCugO4+KnfwSh2UPQGePxyP/1ZsidiY+cEWWRLoyNQ==
X-Received: by 10.157.84.6 with SMTP id j6mr8174542oth.99.1519138407877;
	Tue, 20 Feb 2018 06:53:27 -0800 (PST)
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com.
	[74.125.82.170])
	by smtp.gmail.com with ESMTPSA id j3sm6936146oib.16.2018.02.20.06.53.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 06:53:26 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f170.google.com with SMTP id 95so10103695ote.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 06:53:26 -0800 (PST)
X-Received: by 10.157.63.184 with SMTP id r53mr2766261otc.168.1519138406232;
	Tue, 20 Feb 2018 06:53:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.80.129 with HTTP; Tue, 20 Feb 2018 06:53:25 -0800 (PST)
In-Reply-To: <8d340a29-2016-55fa-0fd2-9847e6f9e62b@gmail.com>
References: <1519084455-3915-1-git-send-email-denis@denix.org>
	<CAP9ODKq7YyqaapLxxOrPo6WoNf6dTFpxkvQh1pF+yqJQxGA7jQ@mail.gmail.com>
	<20180220012001.GZ2786@denix.org>
	<8d340a29-2016-55fa-0fd2-9847e6f9e62b@gmail.com>
Date: Tue, 20 Feb 2018 11:53:25 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqv6LRHhnQcGaZuApppxn_j3P1Vat-pFvCvsApwrZLg=A@mail.gmail.com>
Message-ID: <CAP9ODKqv6LRHhnQcGaZuApppxn_j3P1Vat-pFvCvsApwrZLg=A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: explicitly depend on bison-native for deterministic builds
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
X-List-Received-Date: Tue, 20 Feb 2018 14:53:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 20, 2018 at 7:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On 2/19/18 5:20 PM, Denys Dmytriyenko wrote:
>>
>> On Mon, Feb 19, 2018 at 09:36:22PM -0300, Otavio Salvador wrote:
>>>
>>> On Mon, Feb 19, 2018 at 8:54 PM, Denys Dmytriyenko <denis@denix.org>
>>> wrote:
>>>>
>>>> From: Denys Dmytriyenko <denys@ti.com>
>>>>
>>>> Explicitly depend on bison-native for deterministic builds, as it is
>>>> required
>>>> for the build:
>>>>
>>>> |   HOSTCC  scripts/basic/fixdep
>>>> |   GEN     ./Makefile
>>>> |   HOSTCC  scripts/kconfig/conf.o
>>>> |   YACC    scripts/kconfig/zconf.tab.c
>>>> | /bin/sh: bison: command not found
>>>> | scripts/Makefile.lib:217: recipe for target
>>>> 'scripts/kconfig/zconf.tab.c' failed
>>>>
>>>> In most cases, this dependency comes indirectly via toolchain
>>>> dependencies,
>>>> specifically binutils-cross, which pulls bison-native. Different setups,
>>>> such as with external toolchain, would expose this problem, since
>>>> correct
>>>> dependency is not marked explicitly.
>>>>
>>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>>> ---
>>>> I'm seeing this now on 4.16-rc2 with external toolchain.
>>>
>>>
>>> I am not against the addition but in fact, it is because 4.16 stopped
>>> of using pre-generated files and now requires bison to be available.
>>
>>
>> Ok, good, I was wondering why I didn't see it before 4.16...
>>
>>
>>> I am unsure it ought to be on kernel.bbclass at this moment.
>>
>>
>> Why not? Because it's 4.16+ specific?
>>
>> By default bison-native dependency gets added implicitly when built with
>> the
>> toolchain from oe-core, so this doesn't add any extra dependencies, only
>> makes
>> it explicit.
>>
> it will be overcompensating for < 4.16 kernel recipes where this dependency
> is not needed. it might be a legit dependency for another component, that
> doesn't stage this package in kernel recipe-specific sysroot but this change
> will do that. So its not completely innocent change.

I'd be in favor of matching the version and adding it if it is a 4.16
or newer kernel. Adding for prior versions seems wrong for me.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

