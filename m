Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0F875472
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 07:14:44 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id w8-v6so5417247vkh.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2018 00:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PicpuRU7fdLrwO+abiJeJaP1FWXDiKM53VCE9Mg/iBQ=;
	b=O/fJlireIMHwlFhIKDsrhSg6QIkaQ+Jdv5KB6rZtKnPJNxc2929n82IFgbWvgFGbmj
	Z2QP15yZPpi99/r+auOgnhjhoRkCDiP0GZ1tLObcsk16DIaQBWy7VsVTz34SMf9e4psN
	8LHt5/eccV/QO3OlNti3YwhU7drg+Ws/YtYWciNur3cAnAuowVDhI30zxBEbIQ/CX2Ri
	khPithqq7SyGnKj0mOo42CN+TtmeYjNtpeX5IdILJVoC+MMtOy0ogPL0pXZ5+DozsonL
	vU963iNUo8w6i4eRJE9TbitB9tn/1XiKm/2E9x4PHKlc1qvggLevQndu6u6HgyTJDJFa
	n/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PicpuRU7fdLrwO+abiJeJaP1FWXDiKM53VCE9Mg/iBQ=;
	b=sFI/78TPHrutPI4hf/xPpAOZKrQFIhDP5V6eszt3H3POo23Mo1qXa/Rk2Vq189PiSS
	x65IIy+M7QM+n18EiVagUg7XK5F/ssPKrwiJZjHlI13fIBWcRhjrYRtzEF2WEESPLkFr
	tbLI2V/UW+xiw51lWuefVREyZ4gYR7O9EUt/eW/CEE7dfrQp0GXNnl4K3RErm2+SoNic
	0Mm6FwT/3Yqoi+9/OQHbgzG5CcFdzrx46Q4Qjso+HJRRwVDlODGFEBZ94dowcOwyuEft
	iRg0kPkb+jAKQEOYUceH1mfZD279TapagbzSvOPD5Xn9VaYs2GrOTG8Qn7kkgLvfh5F4
	E0rw==
X-Gm-Message-State: APt69E2Al24t5X5Ul6atN+rySzsOVYuP4e7POGFxq0vY0l05bDy8w4Aq
	mESKRQYKKj7CHrb0k3ET4RjM6Y27D94Oo5Y1LBY=
X-Google-Smtp-Source: ADUXVKIcgDPs8TWkoCt+kLoMu0c0p9p25xsISYTe+MU6KbzsROjqPMGcbjxDvD1K7Ejj6vol03TXl7u/DexnHLblARM=
X-Received: by 2002:a1f:9757:: with SMTP id
	z84-v6mr357593vkd.174.1528355685509; 
	Thu, 07 Jun 2018 00:14:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Thu, 7 Jun 2018 00:14:44 -0700 (PDT)
In-Reply-To: <5c57a121-c4cd-e548-cd26-182076deb917@gmail.com>
References: <cover.1528320772.git.raj.khem@gmail.com>
	<635c8757bf852c8a4248009f241c19146431cacd.1528320772.git.raj.khem@gmail.com>
	<CAJ86T=U5WPudMu_VBL_Y00DQrOjRb91=x+6+21V0ZQKhCQ7ThA@mail.gmail.com>
	<CAMKF1so4AMMhXS4VRNV2CPjvPRbzkPWEW3f=iTNio2jNC1Fgxw@mail.gmail.com>
	<CAJ86T=VCqqt_7OXT__NLtH_uayoSX_rFS=vXEyOZY3BQz3+FKQ@mail.gmail.com>
	<5c57a121-c4cd-e548-cd26-182076deb917@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 7 Jun 2018 00:14:44 -0700
Message-ID: <CAJ86T=U12bdRd=GtseZc8DSKOyEm=OdM=JJZB_6Uu4c0e5__1w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] tune/arm: Set -mtune instead of -mcpu
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
X-List-Received-Date: Thu, 07 Jun 2018 07:14:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 6, 2018 at 10:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On 6/6/18 4:42 PM, Andre McCurdy wrote:
>> On Wed, Jun 6, 2018 at 3:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> The -mcpu, -march and -mtune options are not new and gcc 6 and 7 catch
>> the same conflicts. It doesn't make sense that gcc8 is just catching
>> more issues.
>
> It does make sense. the option parsing for these specific options on arm
> have been revamped after gcc7, see
>
> https://github.com/kraj/gcc/compare/a99ae290af49793cd3db7a74f3dbc59e64d356a1...68b54adbd7b10c66d968d74b96fba552bd46ebb7

Thanks. These commits seem to be related to handling of options like
"-mcpu=cortexa9+nosimd". Was that the error you saw in testing?

If you can provide the command line that caused the error then it
should be quick to establish whether it's gcc8 being more picky.

Or perhaps there's always been a warning and -Werror has been added to
a gcc8 Makefile where it wasn't before?

>> If we are trying to build something which is reusable across multiple
>> machines with the same architecture then it's a bug to be passing
>> machine specific CFLAGS. Making the machine specific CFLAGS more
>> generic is not the right solution.
>
> being reusable is a side-effect and a good one. Real problem is we are not
> matching to what we say in package arches, Probably you are confusing tunes
> to be meant for static code generation for a given CPU.

Sorry, I don't really follow what you mean?

> I am interested to
> hear more ideas to what would be right solution if this is not it.

I'd like to understand what the problem is first before trying to
propose any solutions.

ie what specifically has changed with gcc8 to cause the error which
wasn't seen before?

>> Anyway, I suspect the real issue here is that when we build gcc to run
>> on the target we currently configure using "--with-arch=armv7-a" for
>> both armv7a and armv7ve. It was done that way deliberately to try to
>> avoid rebuilds when switching between armv7a and armv7ve machines,
>> although thinking about that now I'm not sure it makes so much sense.
>> Does your original problem go away if you simply change:
>>
>>    EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"
>>
>> to
>>
>>    EXTRA_OECONF_append_armv7ve = " --with-arch=armv7ve"
>>
>> in gcc-target.inc ?
>
> No, this is not the problem I am talking about gcc-runtime which is
> configured during cross build but built for target later on.

OK, good to rule that out. It's nothing to do with gcc8 and I've sent
a separate patch to fix it.

