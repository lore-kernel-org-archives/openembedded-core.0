Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6238274F9D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 07:31:51 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id x191-v6so6168630vke.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 00:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5/dLXGzXtHxFLV9e7KVpfOmmZmk8VBS+nWCD9PZhI2Y=;
	b=iVjkBBBITQlN73dxV9pwwsJeZaowEyZrfEsbxfPWBGl5mabmczSGedUsYzjX8VzMGe
	L7/L0fNUpggHSzZ9JoJGspp9l/k5Owk/W0sDAfxv4VhUSAHP3PShKIWH2WRhuKTNXeYx
	F8gx1gflzABiIoHiQ/VQb9OAUWh1aYwGOZbiRfJaqL8dsdP9n7eSkEa+l9O7wFALMXic
	yDSn+YrfcDjUqC0TBWj45OqoaYRG2WssVpU3DSBhbw7brVahdiDiYl1ZpY7jwcLscNCb
	sp4MMm++VdGnBmF3y0TKpCABZkcU25AzKLUVItaORLS8eOXOMcqPZo0xD57G/HpplivT
	upsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5/dLXGzXtHxFLV9e7KVpfOmmZmk8VBS+nWCD9PZhI2Y=;
	b=SI7sKEb3f5khlDUQAJ0EOiIbrb2d3gZJ676iSiolV44x30A7xcXqgUFZLQF1IcVcLU
	zd+ePx7Brg/CMhxjXHhpLZkrRkGhBRqG6YpeKKNnmJj5OsvKGs0sraBDrZ6VoyjUHNw3
	5UDovtR9BTAx1aN8aFQUUDGI33XbjAHWVsicEXD59WC+ZzFvx6oOQyiMrOQThWCMOpuZ
	kYVd0QTxedrjE7xQO5qQrraaDxlj/aw9cAJYk1hu8OBOw3wR2e9CUmy5IRmgrmm2EAhw
	0TC6Mg9yQ3RYUEPk4Lv5hLLd85BOHCI6WRF4UCpTTLMMydBYAmf3puHXmybE6L4Zk3BG
	HoMQ==
X-Gm-Message-State: ALKqPweAYkuAuKs1bIrayEZh2M12fp+dR8IZQ7PgzmaDAcMZZOhrh8Ad
	adCaXP15ECgaqfBZFHGTNHpn1q24pVWmcrCLPH0=
X-Google-Smtp-Source: AB8JxZqJ/o13w3oYIK5GwoKeRWoHXkqAtMRI7IUQ8SJdU4vPeTLAnYtQB5SZttdB+0SZ50tM8pycyRhSU4sCmjjsUYY=
X-Received: by 2002:a1f:1551:: with SMTP id
	78-v6mr8164648vkv.174.1526715111985; 
	Sat, 19 May 2018 00:31:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Sat, 19 May 2018 00:31:51
	-0700 (PDT)
In-Reply-To: <20180519071154.GA1395@jama>
References: <1526683840-20390-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1so7fh4Vc9-KkeQpjArm+Wzj4g=OOzsD3qChiWnV_q0Wuw@mail.gmail.com>
	<CA+chaQcfHGsQH62shk9uzu5kx1ArCs05Bq8dODsr30LVD67j+Q@mail.gmail.com>
	<CAJ86T=WG426=cyvtG811fWViqp+Sx7u0k9sUxo88SOJzVMQ2hA@mail.gmail.com>
	<20180519071154.GA1395@jama>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Sat, 19 May 2018 00:31:51 -0700
Message-ID: <CAJ86T=Ux8rM19VEdrG+cT1B08PmMQPB4TbeLj57P8zqfBw+cpw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Sat, 19 May 2018 07:31:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, May 19, 2018 at 12:11 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, May 18, 2018 at 11:48:45PM -0700, Andre McCurdy wrote:
>> On Fri, May 18, 2018 at 10:42 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > This variable was always meant to be used from DISTRO config
>>
>> I'm not sure if that's true. Do you have a reference?
>
> http://git.openembedded.org/openembedded-core/commit/?id=951200673af27538beaef647a33308b4f15d1fb0
> "in case we have MACHINE without "thumb" in TUNE_FEATURES and distro setting ARM_INSTRUCTION_SET to "thumb""
>
> https://github.com/Angstrom-distribution/meta-angstrom/blob/master/conf/distro/include/angstrom.inc#L39
> https://github.com/shr-distribution/meta-smartphone/blob/fido/meta-shr-distro/conf/distro/shr.conf#L150

Certainly there are distros which force ARM_INSTRUCTION_SET. I'm not
sure if that's evidence that machines shouldn't set a default though?

>> >, why not add it
>> > to:
>> > oe-core/meta/conf/distro/include/default-distrovars.inc
>> > or
>> > oe-core/meta/conf/distro/include/tcmode-default.inc
>> >
>> > ?
>>
>> Because then it would either apply to all ARM machines, including
>> those which only support Thumb1, which isn't ideal. Keeping it as part
>> of the machine config makes it easy to apply selectively to armv7a and
>> above where we know it's safe and desirable. Distros can of course
>> still over-ride (ie the machine only sets a weak default).
>
> You can still enable it with weak assignment only for some architectures
> like Angstrom does. But I don't see any reason why not enable it for all
> architectures? Yes Thumb1 isn't as good as Thumb2 but still many people
> are using it

I'm not sure if there are "many people" still trying to persevere with
Thumb1. Maybe there are a few masochists left, but I guess they
probably have their own distros and don't rely on the oe-core
defaults.

My approach is to try to make small, safe, incremental improvements
and doing anything which might change the default instruction set to
Thumb for CPUs which can only support Thumb1 doesn't fit that
approach.

>, why shouldn't oe-core be tested with thumb enabled (with
> armv5te qemuarm?), see:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=9213
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=1709
>
>> Is there a specific problem you see with the current patch?
>
> DISTROs doing multi machine builds already need to select the right
> DEFAULTTUNEs to find good compromise with common denominator of the
> MACHINEs they want to support (or groups of MACHINEs they want to
> support). Supporting or not supporting thumb at all is part of that
> question so DISTRO should decide that, tune files already have the thumb
> knob in TUNE_FEATURES to say which MACHINE is capable of supporting it.

Setting a weak default for armv7a and above from the machine config
doesn't change any of that. Distros still have full control.

