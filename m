Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1505F74F4B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 21:33:26 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id b77-v6so102781vkb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2018 14:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B1QYLze5Q7FzbiIC/7x6sBf/3qttG+J0atNaFT1utmE=;
	b=iTIxb1UksStV5Ko5GPQwtJYOI5WSHLnW+Z5BLMQfYkBkZJv/+9JjYw/7TqUR5VDM6u
	J2BLnNYJBJj5h1oxoOqxnkWORijhEor7VQy8DxcOIM8B+ml7e3ObpRauODfvl5VPRRNc
	pXUrgh7jYu47sX+BJIAhTdmtLPhEivTgyBBIkxRGQWuW4yO5dOkrhbf/jB93HitNJFab
	nrPNbAlqR8n2Qv5IneJnJOTr/a5285GzrUxltBzz2zjc7X86MMr4yYV/CaOJiaZJOZVb
	lbITpa79bcuUAcwXeZaDRusl59J5XMe19rIKBlcdvw5Qh7DPoTNPZzGMpACJEPaI2Svy
	MQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B1QYLze5Q7FzbiIC/7x6sBf/3qttG+J0atNaFT1utmE=;
	b=Qrz0ye2uIG8rSaxHjqsBBvm6U20LmkntXefqUaHgAqfPVabJCbYxkcW60q8lwk0kw8
	erxL7zXTh9O5jo6ki/YndGBQeAGiLKBYU2n9yOpo5aT9Z1PDEZ/1tGZ1ICyF6yb1WeG2
	s/C0MthM127GX0sgm8odsB/7jKvIkKtD1U/g0CRA1gs1/9qviRlHyGEDwLwNRRxLH6mk
	Aed0LmyhPArQNLequFcwA3z/1XRUAe0cUs/6hgKKDV6ndbcBczgSi9bctK8ILZ1jTEJj
	yglZ06yvu/zDbeUmUP9/dd+RrFE5ioxw51z3CcM5biVpV9KS8nSw/9NFsO5xg6LG1AX4
	e+Tg==
X-Gm-Message-State: ALKqPwdxsrQvL0C4KhVrXjIFSKk44xGqmfsMoEDYRW7bLFCwnsBxzfb9
	ou1NRSYN2WKy6dValw5Ji/j76kpeNWHdpHMZE6A=
X-Google-Smtp-Source: ADUXVKIDwO756CvyFL9b68M5U4guf/nEi6p5V6j8G3+HxHXsCjW/70taaGzrFDLwW4M7eW/wSmN0ozFOXn9ZgdNNIfs=
X-Received: by 2002:a1f:9e17:: with SMTP id
	h23-v6mr14294623vke.24.1528148007985; 
	Mon, 04 Jun 2018 14:33:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 14:33:27 -0700 (PDT)
In-Reply-To: <CAMKF1spXXQiP8vpgCt-MJEyXpssH7NQF4Vw+CZVyy6-F6K4a5A@mail.gmail.com>
References: <FAB9E48578194042BE5C63B8BE47610339CF54BD@MBX.NIKO.LAN>
	<CAMKF1spXXQiP8vpgCt-MJEyXpssH7NQF4Vw+CZVyy6-F6K4a5A@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 4 Jun 2018 14:33:27 -0700
Message-ID: <CAJ86T=XEw_E3kRzzYB0xdS0-Dxxj+qTkKdQGCxmMtYrj6sairw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arch-armv7a.inc: default to Thumb2 instruction set for armv7a and above
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
X-List-Received-Date: Mon, 04 Jun 2018 21:33:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 22, 2018 at 3:33 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, May 22, 2018 at 5:58 AM,  <Jef.Driesen@niko.eu> wrote:
>> Andre McCurdy wrote:
>>> Although there may still be specific cases which can benefit from the
>>> ARM instruction set, the Thumb2 instruction set is generally a better
>>> default for armv7a class CPUs. Distros such as Debian and Fedora have
>>> been targeting Thumb2 by default for some time.
>>>
>>> Note that setting ARM_INSTRUCTION_SET has no effect unless
>>> TUNE_FEATURES contains "thumb" (which is controlled by the "t" suffix
>>> in DEFAULTTUNE, e.g. armv7vehf-neon -vs- armv7vethf-neon, etc) so out
>>> of tree machine configs may need to update their DEFAULTTUNE to take
>>> advantage of this change.
>>
>> I recently ran into some major problems due to thumb vs arm. It turns out glibc doesn't support systems with thumb disabled anymore. See this bug report for details:
>>
>> https://sourceware.org/bugzilla/show_bug.cgi?id=23031
>>
>> This might be useful input for this discussion also.
>>

Thanks to everyone for the feedback!

I've reviewed Martin's examples of distros which control
ARM_INSTRUCTION_SET and don't see anything which would conflict with
this patch.

I've also reviewed the glibc bug (Thumb2 instructions used in glibc
even when glibc is compiled for ARM) and it's a positive in this
discussion. It means that anyone running without Thumb support enabled
in their kernel will already have run into issues simply by using
glibc in rocko. The glibc bug has therefore "cleaned the pipes" for a
more formal switch to using Thumb2 instructions in user space.

So, unless there's any further feedback, I think this patch is ready to merge.

