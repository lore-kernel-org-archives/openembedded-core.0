Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id AAEF378757
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 16:51:46 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id d21so593331qkj.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Jan 2018 08:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x3bJ72zW5ZAfGp/UWL0ZHa6hmc10CgAAQoJ5ik0SsJs=;
	b=JFYUxDhPSgjRT1YYfdi/Ay3M2OJJ0ebk6g3jW9+DCIRDhLKQ77ORIBR36/C1aUAS+7
	P9bAdR05jQHpFQ7/mDXU4m5uSV83R+z53xnRBvB8TokTGJocMm1iPmlfOn3FvqjUqpJn
	yaq82teFGTODBiAAI7IrA2MedCsQjcCq9tlFXUUTrQN4J4Jc3auI7DbYS13ktzODgwwU
	H0oyh1TcQWKNksRV8JzZOGtH1McrHN9FA8C/HMkTF4b455A9w9A/SosxwQZqIrUtswTn
	B/Of/iKrK1b27KZdEfE4F0dcxIXaO/vEdijTz2F6qNIgcRz0YeIwTYXTmLpAWbs2hxeT
	/jDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x3bJ72zW5ZAfGp/UWL0ZHa6hmc10CgAAQoJ5ik0SsJs=;
	b=jT+CDTZPVcEi9hX8o3MGPu/rTo1PHPZtFlaprVRJqwdhL+aBPD47PTfGdV46D5NUZy
	EfXekfZJcLPH5KbJpM6cMuzlEWUaiQJPH7WsjUbcFjAFYxBBhtaf4afMjdC+7DmcZ4sS
	cevi6PfNeV8MZ/xMhUD0RpE+FKnq/Dw3zLcF1Erypdxac4pqvG/87gPZ+jmYuxmsxlwD
	/FTBReV1y50UWBSgSlSGW7go3jk0s7ZDeG8SPrA5ay6jJVH1q3BGuRroJyxCSC6bE+8F
	Eb6V6Dzh7Yw28zLssGF26lcCI9N3+gKmuO4VDLd8xmX66Pb8FMh++xq7TAvY3M8Qi4t7
	QSGg==
X-Gm-Message-State: AKGB3mKp+7cn2mffwPQq0zpaRwezkYMPrMFg/UBia658H3YNGWnHqtMw
	kd655kaMA8K0d3KmNALKhVztDxvO4LnbgHWNPY4=
X-Google-Smtp-Source: ACJfBovM6Xft/0MqQpAkVH+BGrzaBdRW5LLDtLNVCCoIWhC+uIvejNEaUUkI7YsyNcyW/p7ny8eVvcpdbqm7C4OW9Dg=
X-Received: by 10.55.68.79 with SMTP id r76mr12901566qka.103.1515343907687;
	Sun, 07 Jan 2018 08:51:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Sun, 7 Jan 2018 08:51:47 -0800 (PST)
In-Reply-To: <CADkTA4NL=2rzVUfwimQhON00xFMy2UwrQ63vjmR_4QBGHNn1EA@mail.gmail.com>
References: <20180107161920.30937-1-marex@denx.de>
	<20180107161920.30937-2-marex@denx.de>
	<CADkTA4MH4EL42iL=BXRKy8y0Gp_bwOarpXiBEPrvCSygOuT4oQ@mail.gmail.com>
	<db5ad1b0-0994-0ce9-79df-39a1704b1072@denx.de>
	<CADkTA4NL=2rzVUfwimQhON00xFMy2UwrQ63vjmR_4QBGHNn1EA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 7 Jan 2018 11:51:47 -0500
Message-ID: <CADkTA4Poz2=_HsS5h+QYz8bDDGndcReRWSQAnQ-q8R6RHGpSqg@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel: Add optional patch_xenomai task
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
X-List-Received-Date: Sun, 07 Jan 2018 16:51:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 7, 2018 at 11:42 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Sun, Jan 7, 2018 at 11:38 AM, Marek Vasut <marex@denx.de> wrote:
>> On 01/07/2018 05:37 PM, Bruce Ashfield wrote:
>>> On Sun, Jan 7, 2018 at 11:19 AM, Marek Vasut <marex@denx.de> wrote:
>>>> Add additional task, do_patch_xenomai, inserted between do_patch and
>>>> do_configure tasks. This task applies the cobalt patch to the kernel
>>>> sources for a specific machine. This is disabled by default, so use
>>>> PACKAGECONFIG[xenomai] of the kernel package to enable the patching.
>>>>
>>>> You will also need a kernel recipe for a kernel version with ipipe
>>>> patch applied.
>>>
>>> This doesn't make any sense to me.
>>>
>>> Why on earth would this be in kernel.bbclass ? and part of a xenomai
>>> recipe ?
>> Do you have a better suggestion how to make this easily available for
>> every kernel recipe ?
>
> There's no need to make it available for every kernel recipe. If someone
> wants to build xenomai, they need to have a specific kernel recipe and
> configuration to make it work. By providing that patch and allowing it to
> be applied to any kernel doesn't mean it will actually work .. so you aren't
> doing anyone any favours.
>
> The same thing could be said for the -rt patch, aufs, etc, any patch could
> be made available for any kernel, but they aren't, since they will either fail
> to patch, or won't work at runtime.
>
> Why would a specific xenomai "host" kernel recipe be made and have that
> patch applied ? You need to control the kernel version and configuration
> for it to work at runtime anyway.

but of course, if RP thinks this is ok .. then it is ok.

I've done Xenomai in the past, and have maintained a separate recipe
for the parts. So I'm speaking for that experience and for what I've done
to maintain various kernel variants in oe based distros.

Bruce

>
> Bruce
>
>>
>> --
>> Best regards,
>> Marek Vasut
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

