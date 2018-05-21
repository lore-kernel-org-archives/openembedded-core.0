Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 532E471E4C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 17:15:34 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id h15-v6so10387580uan.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 10:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MjgRB0e3Diz7kg6K24otiG6Psj4wiPcZWI8W6MqrlnA=;
	b=OOFMQrfDrb1hbT/QjZ96GtgamTkgGQkzsPiLDluzKsxJLK9PlWNR5WFc+qXcBAh2rD
	7WxwM7A8PHBY26OhdCKHrIO94FA79SdiG4MARMbR9bDBDOta2E5qlFFqC3SI3Js1iKxY
	lljCRiEfIQMH1h/PQwnKwaqw1GF13xZGs94/4UI81GhVl6Mp0cImQFn54lFLBn3Zibx0
	vatmJ193dWj6nP6Fu/tVDzRDKhf5ifaJbHKX+B4pnCrh0cd2t+euaxFxubeggZHuyRFo
	g+Tp3VrfqzAoA5S4SK+0mgE1HVkEryJcc7zFYPd53rTCO5in6qkE3TnkaYAsCKjhO/7s
	piEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MjgRB0e3Diz7kg6K24otiG6Psj4wiPcZWI8W6MqrlnA=;
	b=m/UV5DyMk3tYCtabZA8Hrgcf2SZ2K1J3XG5SP0NW5Dawf5p5dwn4yFS7hPLHAlpcnj
	AXbTA8TUayw+4o1SncVjWnIV1TkOYI5ozCu2JHuGTEZV2Wjn+aOQhOmO0TZzkXOYRPfi
	pzgjTtQ0p7xdHvFvYu2yYrYgeA4k1hDGXZkIHoQ8RumYRqe/LcCM86wfpjSbO3VkZEO6
	Gx6/e28JNOrfKoudMzdnz0WcOJFnIVTxdOBuUOu2KuLNE+EbyWX3kCwRdoGzY47xUlmb
	77NAHqd0KCp8Af0ZnisIepdTJIE19JQZBT57oI6PjgGDYqeSn2GFTdX5quWGO2MMni1s
	UnBQ==
X-Gm-Message-State: ALKqPweLVP5pm8+y09uP950YFcAcL1vVIufTW/GV7c5hPM7F7vnQZXTU
	nlLVJUHPhUOFCO3dTqjkrGrdj9iD0SPBAmHb1Ng=
X-Google-Smtp-Source: AB8JxZoFrCWuYNkt+//k1PUTIuTDzi2d9+UTXUYMt9rn+JPplzgtFHxQLG0LIRGiz7eac8DT8RGPyGY90AvQ53t2lrA=
X-Received: by 2002:a9f:3766:: with SMTP id
	a35-v6mr15474386uae.66.1526922935783; 
	Mon, 21 May 2018 10:15:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Mon, 21 May 2018 10:15:35
	-0700 (PDT)
In-Reply-To: <20180519074149.GB1395@jama>
References: <1526683840-20390-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1so7fh4Vc9-KkeQpjArm+Wzj4g=OOzsD3qChiWnV_q0Wuw@mail.gmail.com>
	<CA+chaQcfHGsQH62shk9uzu5kx1ArCs05Bq8dODsr30LVD67j+Q@mail.gmail.com>
	<CAJ86T=WG426=cyvtG811fWViqp+Sx7u0k9sUxo88SOJzVMQ2hA@mail.gmail.com>
	<20180519071154.GA1395@jama>
	<CAJ86T=Ux8rM19VEdrG+cT1B08PmMQPB4TbeLj57P8zqfBw+cpw@mail.gmail.com>
	<20180519074149.GB1395@jama>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 21 May 2018 10:15:35 -0700
Message-ID: <CAJ86T=WijtRjvKttrfRHdL1H+u_oEqvMS4rz4oyBy4KBB3qpHw@mail.gmail.com>
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
X-List-Received-Date: Mon, 21 May 2018 17:15:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, May 19, 2018 at 12:41 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sat, May 19, 2018 at 12:31:51AM -0700, Andre McCurdy wrote:
>> On Sat, May 19, 2018 at 12:11 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > On Fri, May 18, 2018 at 11:48:45PM -0700, Andre McCurdy wrote:
>> >> On Fri, May 18, 2018 at 10:42 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> >> > This variable was always meant to be used from DISTRO config
>> >>
>> >> I'm not sure if that's true. Do you have a reference?
>> >
>> > http://git.openembedded.org/openembedded-core/commit/?id=951200673af27538beaef647a33308b4f15d1fb0
>> > "in case we have MACHINE without "thumb" in TUNE_FEATURES and distro setting ARM_INSTRUCTION_SET to "thumb""
>> >
>> > https://github.com/Angstrom-distribution/meta-angstrom/blob/master/conf/distro/include/angstrom.inc#L39
>> > https://github.com/shr-distribution/meta-smartphone/blob/fido/meta-shr-distro/conf/distro/shr.conf#L150
>>
>> Certainly there are distros which force ARM_INSTRUCTION_SET. I'm not
>> sure if that's evidence that machines shouldn't set a default though?
>
> It's still more evidence then what you've shown that it should be in
> machine config.

I had two criteria for this change:

  1) Only change the default for cores which support Thumb2.

  2) Don't have any effect on distros or recipes which already define
their own policy for setting ARM_INSTRUCTION_SET (ie don't use
over-rides).

Setting a weak default from armv7a.inc seems to be the simplest and
cleanest way to meet those two criteria.

