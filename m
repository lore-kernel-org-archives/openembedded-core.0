Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8E79C601B8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 14:15:48 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id u110so120876528qge.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 06:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z6Dbx6Mxn0fmUEAzI7EXSCoQ2SUX5asHlozJ5xqHCrk=;
	b=LFqd1oQaha7cjHYnG//GrLnjEucCE4dTpbsCqSdkSQwnBA8S38G0buO50onsOXTL6k
	G61ZZVtAKBupeYaRND0+VGvJc1ifReC217kT+DWdM6r/z1F+6w2QLqQZ7rKAClH1U6Qr
	ae3umNKabIyMJYjuHgvdlLcLuoFq2WuyIsHp6KM9xv23Pl1dswUMy1GRcuVcOzGqPbky
	V4mzV7tOk8AODWKjz5LZqABMTI160zwDnAlSc49eQ5XmVqGsbFvwIDn1gNZzkHemjDS6
	0m43wOHu+nWO7Sp4SO+eJd+vQaZEuVik9gzlnW0Xnc5CZM8IXksltP93dtmY+RPbysGe
	n55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z6Dbx6Mxn0fmUEAzI7EXSCoQ2SUX5asHlozJ5xqHCrk=;
	b=YccIBBe8UEP1ZL4BJmxKbayxVFoJDP3py6+SY3QYdoXFZfW+7A6q0zPrqIBhdO6ZTj
	br86cR1BCZ9B9ZEMgbI6xKT8Kebn8DYR/3Wtqh74Bia5UO3v4uX1uVVhSUuvluDEEu11
	LItkFK/BO8x1ApE3KTqRGZbtVlqmFJwx5K+w4Z4Bs/KjGXif3WOoIWiV3rCl06XcHrtW
	2Z4GO4I2nBMEo9Sr6/m08ZiUhPUxWdNGo+Re5LWFLwlTNlbkw+b4Y1QWXKKBMjVvD6NK
	Hg6xXjtPBiNCYA0kx5zTK/UC2VrGYWAAmi8IjBOROeqZn8P3cgoZ2FV1xHOOx4QbIzp2
	DoBw==
X-Gm-Message-State: AD7BkJJscguADo7nSx9o1JTgsqUTk0y9gil020slwW4NBVucsL6SpM3h0u7Std8m8+raOt42bl5FxvUAb2fQ5w==
X-Received: by 10.140.81.231 with SMTP id f94mr18264923qgd.25.1457792148768;
	Sat, 12 Mar 2016 06:15:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sat, 12 Mar 2016 06:15:19 -0800 (PST)
In-Reply-To: <CAP9ODKqwDc-cqMfgKObZaJWvZp77of198eUVR3aoY325uyS+jQ@mail.gmail.com>
References: <1457719132-2239-1-git-send-email-daniel.dragomir@windriver.com>
	<1457719132-2239-2-git-send-email-daniel.dragomir@windriver.com>
	<249F02FB-87A8-431F-9C52-8312F1736B66@gmail.com>
	<CAP9ODKqNziC20dgUPwQJdM9CuKRE3awibz8D-QSkF4tw8BaCGg@mail.gmail.com>
	<CAMKF1spe-QQBJWLef9Ftotc2CHVS-AzOSBm=o0-YdEUPKL8wkA@mail.gmail.com>
	<CAP9ODKrkHgjE3dr3qcW3L=gkeHf=xbcjSpsa_g8dqOZ6H3okeA@mail.gmail.com>
	<CAMKF1sqi9yut+7LXkVWvVCEoVSu=U3yYKOo7wPHOsL=+rb-RJA@mail.gmail.com>
	<CAP9ODKqwDc-cqMfgKObZaJWvZp77of198eUVR3aoY325uyS+jQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Mar 2016 22:15:19 +0800
Message-ID: <CAMKF1sq+3X7+yDhD23LOTuu=5mGkYMLHWguUj8Fb7kgEtc91NQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2][master] arch-armv8a.inc: Add tune for 32-bit ARMv8a
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
X-List-Received-Date: Sat, 12 Mar 2016 14:15:48 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Mar 12, 2016 at 10:06 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Sat, Mar 12, 2016 at 10:23 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Sat, Mar 12, 2016 at 8:02 PM, Otavio Salvador
>> <otavio.salvador@ossystems.com.br> wrote:
>>> On Sat, Mar 12, 2016 at 8:57 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Sat, Mar 12, 2016 at 7:41 PM, Otavio Salvador
>>>> <otavio.salvador@ossystems.com.br> wrote:
>>>>> On Fri, Mar 11, 2016 at 9:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>>
>>>>>>> On Mar 12, 2016, at 12:58 AM, Daniel Dragomir <daniel.dragomir@windriver.com> wrote:
>>>>>>>
>>>>>>> This patch adds tunes for 32-bit armv8a platforms. The user can select
>>>>>>> little or big endian, hard or soft float, the vector floating-point
>>>>>>> instruction set: vfpv4 or fp-armv8 and the thumb, neon, crc and crypto
>>>>>>> extensions.
>>>>>>
>>>>>> This does not feel right to me. Look at how thunderX looks like
>>>>>> ARMv8 is the time to fix this tune explodes on arm, this patch is not helping
>>>>>> it.
>>>>>>
>>>>>> Do we need the hf/neon/vfp/thumb2 variants?
>>>>>
>>>>> Do you mean we ought to use hf+neon+thumb2+fp-armv8 for everyone and
>>>>> just have optional features in and out?
>>>>
>>>> something like that yes. Just aarch64 and aarch32 make it simple as that
>>>
>>> ARMv8.1a has different semantics, how does we handle this?
>>
>> question is do we need to handle this with tunes at all ?
>> what advantages are we looking for.
>
> I don't know but this was my main design doubt.
>
> To be honest, I think hf, neon, thumb2 and fp-armv8 can be default.
> Crypto and crc seem to be optional and need to be enabled if the core
> offers it. But those are required for ARMv8.1 SoCs ... AFAIK.

exactly, so lets see if crypto and crc can actually we offerred
differently via CCARGS instead

