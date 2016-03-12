Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id EEE31731A4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 14:06:06 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id fl4so121262621pad.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 06:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=JPDGUtiyvb5zUzvDeJ/6sIojDuryis9iJPyYVxow0N0=;
	b=YrK7a4FL/uT20xTVTxKAe5qZzp5yJKGAMHc9lbRf3wPOg1wdP0CWdQGJpVHvx3cZzg
	PXIJ3xAlxh8/Y7FQEaN2ZsQNc/r//doBXQ2b8nC1KhvpgEf9yPFDISdfRZq4BKWMxA2R
	FTbUzCz92WAt3zGKT648+Ozm7IJViFAiD0K9SLuq0h+PKGo6nhjkumO0kpn/8xLhC/9E
	U+eYCD+T2HBuw9FnhBHv2s5HR2EWe71UcWtVHosEZflUb+YYr8iNi2ldmNYXnisZW4rj
	AcBCQbVJk7lWTi8IJrjEvbqYx/ZuANPE2gSzwXIQaGEusOnJpxfA6pXwFVyumyiAo0As
	DiwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=JPDGUtiyvb5zUzvDeJ/6sIojDuryis9iJPyYVxow0N0=;
	b=l4byhkAsrQ1sntaaQVxtN4QfIeZQNGQvq/FepxoHcByhXkloGEXj79tflE1MwF2XwV
	xwgc1XSHbP0ivRRDhHHeXjxNCq462nc1pp+JD3Y7Qr8tCAMQ/fr4v+YN9FpJSa4+1UTb
	VfqkW9eqdrb8iIhiAk6hxXjkxJB2+XmNf5q4l1wGhZTCjXZRqZtMRmXOayCjmL9Bl1mw
	h036xs49mV4XBBX2juLMI2XSkbzkA/GvQiA3tgUlYjwaVw2hYymeBZfylPkNTUCwBaEu
	r6mJRz16C5RbUlNwVy2Ptwjcp/rxAuKBVSAm+PgbmNj4VIQ7+svYtbcKGiE1M/3O9fJW
	9udQ==
X-Gm-Message-State: AD7BkJJG3jGI9KrefMDjbvMa1L9DjbjiGR0ka11thOWvlh1mi2idjDrC1W3PbwyENFVb1w==
X-Received: by 10.67.14.138 with SMTP id fg10mr23939431pad.145.1457791567376; 
	Sat, 12 Mar 2016 06:06:07 -0800 (PST)
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com.
	[209.85.220.51]) by smtp.gmail.com with ESMTPSA id
	y68sm20199202pfi.6.2016.03.12.06.06.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Mar 2016 06:06:05 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f51.google.com with SMTP id fe3so105533671pab.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Mar 2016 06:06:05 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.235.9 with SMTP id ui9mr23854326pac.135.1457791564833;
	Sat, 12 Mar 2016 06:06:04 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Sat, 12 Mar 2016 06:06:04 -0800 (PST)
In-Reply-To: <CAMKF1sqi9yut+7LXkVWvVCEoVSu=U3yYKOo7wPHOsL=+rb-RJA@mail.gmail.com>
References: <1457719132-2239-1-git-send-email-daniel.dragomir@windriver.com>
	<1457719132-2239-2-git-send-email-daniel.dragomir@windriver.com>
	<249F02FB-87A8-431F-9C52-8312F1736B66@gmail.com>
	<CAP9ODKqNziC20dgUPwQJdM9CuKRE3awibz8D-QSkF4tw8BaCGg@mail.gmail.com>
	<CAMKF1spe-QQBJWLef9Ftotc2CHVS-AzOSBm=o0-YdEUPKL8wkA@mail.gmail.com>
	<CAP9ODKrkHgjE3dr3qcW3L=gkeHf=xbcjSpsa_g8dqOZ6H3okeA@mail.gmail.com>
	<CAMKF1sqi9yut+7LXkVWvVCEoVSu=U3yYKOo7wPHOsL=+rb-RJA@mail.gmail.com>
Date: Sat, 12 Mar 2016 11:06:04 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqwDc-cqMfgKObZaJWvZp77of198eUVR3aoY325uyS+jQ@mail.gmail.com>
Message-ID: <CAP9ODKqwDc-cqMfgKObZaJWvZp77of198eUVR3aoY325uyS+jQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Sat, 12 Mar 2016 14:06:07 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Mar 12, 2016 at 10:23 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Mar 12, 2016 at 8:02 PM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Sat, Mar 12, 2016 at 8:57 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Sat, Mar 12, 2016 at 7:41 PM, Otavio Salvador
>>> <otavio.salvador@ossystems.com.br> wrote:
>>>> On Fri, Mar 11, 2016 at 9:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>
>>>>>> On Mar 12, 2016, at 12:58 AM, Daniel Dragomir <daniel.dragomir@windriver.com> wrote:
>>>>>>
>>>>>> This patch adds tunes for 32-bit armv8a platforms. The user can select
>>>>>> little or big endian, hard or soft float, the vector floating-point
>>>>>> instruction set: vfpv4 or fp-armv8 and the thumb, neon, crc and crypto
>>>>>> extensions.
>>>>>
>>>>> This does not feel right to me. Look at how thunderX looks like
>>>>> ARMv8 is the time to fix this tune explodes on arm, this patch is not helping
>>>>> it.
>>>>>
>>>>> Do we need the hf/neon/vfp/thumb2 variants?
>>>>
>>>> Do you mean we ought to use hf+neon+thumb2+fp-armv8 for everyone and
>>>> just have optional features in and out?
>>>
>>> something like that yes. Just aarch64 and aarch32 make it simple as that
>>
>> ARMv8.1a has different semantics, how does we handle this?
>
> question is do we need to handle this with tunes at all ?
> what advantages are we looking for.

I don't know but this was my main design doubt.

To be honest, I think hf, neon, thumb2 and fp-armv8 can be default.
Crypto and crc seem to be optional and need to be enabled if the core
offers it. But those are required for ARMv8.1 SoCs ... AFAIK.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

