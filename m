Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2B16E753F0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 23:19:19 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id a3-v6so1134629itd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2018 16:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LwFpAMK1tuDEHT4ooBiFwh6Q9emUr1NXnKNDgKoU9Fg=;
	b=rQ1LtKD8fdRmEyHNiEM6SZqwkTbMoI7XJckv1Wpndx1FrKEsd6Dvoov3aCerVXyKSu
	WctMv8oP+84JV5YTKYRVGqCPDOffG7BLERh0rJsKJGjmtaAeE7zuylCo5w7dgEhB4/Ne
	a57aN75V+10CBLhUIxLtUmNEoH4+uC+wjbWV3lBrKWxcBmX3BUCTVOj379GqbQ2L+rJc
	Vu7+6GnvB4opG3pES8V+oR5IlofIAbnY6qfppOGgRkPtk10Rmg1Su5PCIYvNIR2KvbBy
	d5kMAegTVzfsN4iNEJC9zlblM3qA84Xyov6R1A7nA32iQorZWPxPLon3vd1mbwckJe0z
	H9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LwFpAMK1tuDEHT4ooBiFwh6Q9emUr1NXnKNDgKoU9Fg=;
	b=V/JMdytiRguz8BdYlxsLZ9n1G+K6BSI10JaQK1vUPBxpOCXgLQFwLdtyVhTkphuGoG
	+ZAzkXk5l9RFqq63i1w89xxLZMUwS6vI+njgSRytuDdas+0QB37+UaNFsh6oRHUSCZfO
	oIV82ea/UJRB7MxyZeonCP3E3xsGyNIFCMwm3W3XvNx9R0v8yVE8G8Jx7nBPEqxp6y3I
	165aLc8FrU5gwGJKQYf4pggwh4tnhKMcUrpEB/ZZjQ10n8CkhISzog9QaVjGAaN9llkM
	eOZSVuMm5ZZoi+VfGaz3pfNP5Wcy5+0xu2gRnp6u0KYIxns7UKeMdvgbb0UHF4B8Np1D
	lJ3Q==
X-Gm-Message-State: ALKqPwf7h0HNyeCBPHzxjI2vxknjRfPalDmI3hpYWLY+sC9VPE/2PEYh
	iRxuZkfQA4yHElYCdfFPyQzPgb4vn5l5JE6DZz3ueA==
X-Google-Smtp-Source: ADUXVKJf5HA23JHgmOOu6k9Ahx43Hr8teEa+K2dwT6yKLlYPRS/luNoQVnwI2EFk5DkwskorpD3rhFWWpmx90g4vNH0=
X-Received: by 2002:a24:184d:: with SMTP id
	74-v6mr16228122itr.127.1528154360236; 
	Mon, 04 Jun 2018 16:19:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:f614:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 16:18:59 -0700 (PDT)
In-Reply-To: <CAKmqyKO4STCUPJJE7+ZPwSMwGyoUAkcbTckSiByEipGMBDE-RQ@mail.gmail.com>
References: <20180601221436.27162-1-alistair.francis@wdc.com>
	<20180601221436.27162-2-alistair.francis@wdc.com>
	<CAJTo0Laocxug2iUZjAD8bLqDN4ho7GPO=_c2ZOQQmvSErOXyyQ@mail.gmail.com>
	<CAKmqyKN=5JzrFhK0aLvzuxHJFO4PmK_Km2JnynrqKjfovQAokw@mail.gmail.com>
	<19c52d27-6206-5b80-a41b-f3a106d8d7fd@linux.intel.com>
	<CAKmqyKO4STCUPJJE7+ZPwSMwGyoUAkcbTckSiByEipGMBDE-RQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Jun 2018 00:18:59 +0100
Message-ID: <CAJTo0LboMpfRu6rOzXAP+5yzd5yokYp52Cai+cvWDKr_aMkkhg@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] [meta] atk: Specify gettext-native dependency
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
X-List-Received-Date: Mon, 04 Jun 2018 23:19:19 -0000
Content-Type: text/plain; charset="UTF-8"

That implies that INHIBIT_DEFAULT_DEPS is also evaluating to true,
which it shouldn't be in ATK.

I'd definitely be checking if that is the case, and if you can
replicate the failure with e.g. qemuarm.

Ross

On 4 June 2018 at 19:46, Alistair Francis <alistair23@gmail.com> wrote:
> On Mon, Jun 4, 2018 at 10:20 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>> On 06/04/2018 08:17 PM, Alistair Francis wrote:
>>>
>>> On Mon, Jun 4, 2018 at 3:06 AM, Burton, Ross <ross.burton@intel.com>
>>> wrote:
>>>>
>>>> So why isn't the inherit gettext sufficient?
>>>
>>>
>>> I'm not sure. Here is the error I see when compiling for RISC-V before
>>> this patch:
>>
>>
>> So is the error specific to risc-v? You should dig deeper in that direction
>> then.
>
> Ok, it looks like the line: if d.getVar('INHIBIT_DEFAULT_DEPS') and
> not oe.utils.inherits(d, 'cross-canadian'): is evaluating as true in
> gettext.bbclass so we don't depend on gettext-native.
>
> Do I need to ensure cross-canadian is set for RISC-V builds then?
>
> Alistair
>
>>
>> Alex

