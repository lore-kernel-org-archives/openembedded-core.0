Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id E458978643
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 13:26:16 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id h6so18358384oia.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 05:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=HZkmjiqf/3NZ9rufI/TN7tV8RLEHHCZM6GQVDFKwcWA=;
	b=SVAq4p3CrRrqEErG4qO2kJa28YwWfVduTu0hxmC4CLX2kBt+jl0RJrdM1NOCMNo/ub
	RJb76i6gdnhsntVECpL5Ie1w5CWr0t8iNIl1tbkPBnM6SVoVPsU+ZqDMktvkQ8f+emye
	yoTA+h0Sb1GVAzE2zYSXqegkx3aaGsSpZDZasEztSKV0OH3xc0CruIZvwdVeVprpHQWg
	q3XC4ymfQNkjLsJNzyTQ1CKq2bsv6dF/rnP3/VsoO9srAXv3yn36C9whkYafVNlbJDKi
	fmQgBDfg+PDNkiSxSAD51jrgwyRDW2QnXQA+ubo/Mq80AAps43Bd2Riv7UWE7AZM8iPM
	LcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=HZkmjiqf/3NZ9rufI/TN7tV8RLEHHCZM6GQVDFKwcWA=;
	b=SGlHAZat9C16YYzCOVQM3MvscaJPye392CagcYRFaKvJkmyVPKw4ZwrA60AE4Lft4n
	3SqSezXnFJOUeJZ3jp7xUwNLgVKbtY0xeWSTGcxsXUMjRz12wK64OO8hwDEXjkRiJ2Fk
	IggrJDKq6sqPgFb4Fk/Cu9Nt3qIUpfAyQFEnLrTRmrLCY+WkxHgQVsxKzNPJd3Ka0QEx
	p87QSXMpFqOI9B5Ib5HoS7knWrvaMHfifW3SzLXipJvSfZMcr5GRvmZnPwwMwqRVnU8d
	5WGMXHT02wgw2wHJryXdYKk7nffzVWPYvrCG+US2op1J09Iyjw39Oj5dbm5tkRuVQRue
	tMnw==
X-Gm-Message-State: AJaThX7/2hOsufXG2uoCKA/yu50Y8VA9jkL1d4EXou67qqKOCa1SYKlS
	tCCBQeMt7PyoGTSqF67PkaRqYGRX
X-Google-Smtp-Source: AGs4zMZkPdd3wTD3bZrOp8GUmoGcfpZzs4dDEO/LT2ydmILx3EiuFtQqt7v726Fuxc25EzrVOSq5Qw==
X-Received: by 10.202.245.12 with SMTP id t12mr700968oih.125.1510838777576;
	Thu, 16 Nov 2017 05:26:17 -0800 (PST)
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com.
	[74.125.82.182])
	by smtp.gmail.com with ESMTPSA id p82sm396734oih.9.2017.11.16.05.26.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Nov 2017 05:26:16 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f182.google.com with SMTP id 18so22473776oty.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 05:26:15 -0800 (PST)
X-Received: by 10.157.34.200 with SMTP id y66mr1069313ota.276.1510838775568;
	Thu, 16 Nov 2017 05:26:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Thu, 16 Nov 2017 05:26:14 -0800 (PST)
In-Reply-To: <1510838076.3952.166.camel@linuxfoundation.org>
References: <1510594546-27018-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAP9ODKquk8Cf-chkGCRTpPurE+ABQZgzgAs=3M4hp0qV5NMWug@mail.gmail.com>
	<CAJTo0LaNR-YLyCX=wHTS42XimeJrfhCWwCmm-hKCwNRkJ1KFmQ@mail.gmail.com>
	<CAP9ODKow3s0rXMmkVYM5b5jsgG-70GnXZkHMK1WxaFSUTA-c2A@mail.gmail.com>
	<CAJTo0LYfAYZruf=9WYFqD2ae2==LdTGwayFeXPxtQ7ROPm-T2w@mail.gmail.com>
	<CAP9ODKqxjDsS34yZ1G0h1wRvZ2QGfOD2rr=+2DG1KGuwcePmTQ@mail.gmail.com>
	<CAJTo0LZX253PH2xBQOANZ5rJ35wvDGKO7We2s-XBJjZy594GPA@mail.gmail.com>
	<1510838076.3952.166.camel@linuxfoundation.org>
Date: Thu, 16 Nov 2017 11:26:14 -0200
X-Gmail-Original-Message-ID: <CAP9ODKr1vkw06=21Y=_+kU5jVk5HUa9h7PYp9ysxKht8WkKeCA@mail.gmail.com>
Message-ID: <CAP9ODKr1vkw06=21Y=_+kU5jVk5HUa9h7PYp9ysxKht8WkKeCA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu.inc: Drop rng-tools
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
X-List-Received-Date: Thu, 16 Nov 2017 13:26:17 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Richard,
Hello Ross,

On Thu, Nov 16, 2017 at 11:14 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2017-11-16 at 13:11 +0000, Burton, Ross wrote:
>> On 15 November 2017 at 19:59, Otavio Salvador <otavio.salvador@ossyst
>> ems.com.br> wrote:
>> > > Are you enabling the virtio-rng driver so qemu can bridge the
>> > host entropy
>> > > into the guest?
>> >
>> > I am not. Do you have an example of command line for it?
>>  https://wiki.qemu.org/Features/VirtIORNG talks about qemu's support
>> and what to turn on there (the default qemu machines enable that).
>>
>> http://elixir.free-electrons.com/linux/latest/source/drivers/char/hw_
>> random/Kconfig documents HW_RANDOM_VIRTIO and says at the top that
>> the devices feed into the kernel pool.
>
> Just to add, for qemuarm:
>
> machine/qemuarm.conf:QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet -device virtio-rng-pci"
>
> the key piece being virtio-rng-pci on the commandline.

I did try it here. Thanks for the pointers.

We use a Docker container to run QEMU and in this environment, it does
not work well. At least I did not get it working.

I don't know if it is a problem or not for OE-Core. Possibly people
will run things inside a container and keep rng-tools makes it working
in those environments.

I will keep investigating here if I can make it work in a container ...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

