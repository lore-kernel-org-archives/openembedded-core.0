Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 688A860621
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 15:55:57 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id uo6so344374195pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 07:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=JzFVQHR0hFHLPDBUdf0PXVhg2+jyYElpc4qqa2DbzQM=;
	b=RMxzqkxy4IfDvSfRKQx1H0G6Dbr4yg7JWLD+IJ//uuFdF70Ao60s80cP5zjLLzS624
	2c3LvvGKUHvoqSm9F8TaVJiGa4NDoVctMnHJVj3JOPWKPoszpz71QQTuOAfVVMNMQGh7
	X569vuKdesI4RKQGnf1gC1VqIjet/8O9jykJ9uXKjDzYua+kwUDpKMAdchnIjK44mnqv
	fbUNwZGIWQpBvqC8vUqeVe19vwmhObU3Gq7+4sAsZRcy+Nt4BJENoih0ptTETc4VKk3C
	TxIVNyeZkdnjDKSsTmJC9JOpyE8/uQcZFTro7ddX7zjE1RxUh7uTGEDbNEFQs0ahVFfJ
	yDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=JzFVQHR0hFHLPDBUdf0PXVhg2+jyYElpc4qqa2DbzQM=;
	b=nI1y5vCgZ3z2NQ/ibacb8TiPqTrHrFhjRHMkbKkm8P7zr2WQ7CIKheQOUG0ht560LX
	f3BqA6739ZKJv9w2E3+WrPvY/oCxvW8bTzEYGdIQSHNViqi17W4pZhlp7sHTwFF5f9zi
	XL3WMmvVtJFSLJBmoS0tNFN/AXLUly/yQA+Nz9uSdMRTJE8V5wEK+3Wlmo4T3/cL6lNL
	G+r47utZL58xhDmJQYgLwnDxTx0InF2vR1jm+KoWr8udguG0TOmVEffVkaqTpI3eIhgy
	PJcYeCj1m6z4eW1j9PDuQWc+3Fx9h+8qQDL8uJbSdVcm236fM9cCnQdQ1RNdAiYlrBCk
	5GiQ==
X-Gm-Message-State: ALoCoQnf5eDjFhuhU1YpKy4t3INxV1oiekyXLnf8ephTeKtzPaPIjOZ8EOV0QjPcP0TqN2kxcphroOSGEneMXOw9hI6AAB8fFw==
X-Received: by 10.66.120.200 with SMTP id le8mr198055327pab.61.1452700558697; 
	Wed, 13 Jan 2016 07:55:58 -0800 (PST)
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com.
	[209.85.220.52])
	by smtp.gmail.com with ESMTPSA id v2sm3474112pfi.93.2016.01.13.07.55.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jan 2016 07:55:57 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f52.google.com with SMTP id uo6so344373738pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 07:55:56 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.255.97 with SMTP id ap1mr62927859pad.135.1452700556715;
	Wed, 13 Jan 2016 07:55:56 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Wed, 13 Jan 2016 07:55:56 -0800 (PST)
In-Reply-To: <201601131653.11865.marex@denx.de>
References: <1452656212-9836-1-git-send-email-marex@denx.de>
	<201601131534.58933.marex@denx.de>
	<CAP9ODKohVDvN=bnowqXaHa_3yNvOf70EevWwV6T9rrNLbEHxOA@mail.gmail.com>
	<201601131653.11865.marex@denx.de>
Date: Wed, 13 Jan 2016 13:55:56 -0200
X-Gmail-Original-Message-ID: <CAP9ODKo4fvFS0wWtQJfO_kVOZMyNqfNohHw=wRC5z2M19Bu9kQ@mail.gmail.com>
Message-ID: <CAP9ODKo4fvFS0wWtQJfO_kVOZMyNqfNohHw=wRC5z2M19Bu9kQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2016.01 release
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
X-List-Received-Date: Wed, 13 Jan 2016 15:56:01 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 13, 2016 at 1:53 PM, Marek Vasut <marex@denx.de> wrote:
> On Wednesday, January 13, 2016 at 04:39:53 PM, Otavio Salvador wrote:
>> On Wed, Jan 13, 2016 at 12:34 PM, Marek Vasut <marex@denx.de> wrote:
>> > On Wednesday, January 13, 2016 at 01:04:31 PM, Otavio Salvador wrote:
>> >> On Wed, Jan 13, 2016 at 1:36 AM, Marek Vasut <marex@denx.de> wrote:
>> >> > Upgrade U-Boot to latest version and drop upstreamed patches.
>> >> >
>> >> > Repair configuration of U-Boot during build. It is no longer
>> >> > possible to run "make foomachine" in U-Boot. Instead, it is
>> >> > necessary to do "make foomachine_defconfig ; make". Fix this
>> >> > in u-boot.inc and u-boot-fw-utils*.bb .
>> >>
>> >> Please drop this config suffix, from u-boot.inc. The config value
>> >> should be used as is and the respective BSP ought to be fixed to
>> >> change _config to _defconfig.
>> >
>> > If I don't have the _defconfig there AND I define UBOOT_MACHINE in my
>> > machine file, it will call "make machine", which no longer works.
>>
>> I know and the right fix is to use the right value to UBOOT_MACHINE as
>> we do for KERNEL_DEVICETREE.
>
> So what is the right value ? UBOOT_MACHINE := "foo_defconfig" ? This does
> not sound right at all.
>
> And what is the right value of UBOOT_CONFIG then ?

foo_defconfig.

This is what we pass for make to configure the board and should be the
given value.

As we does for device tree, where we pass for KERNEL_DEVICETREE:

foo-bar.dtb

and this is also given for the make, for the kernel.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

