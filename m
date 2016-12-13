Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 106F071E13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 16:30:15 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id p9so69197721vkd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 08:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=v6xBVo/VMZFkjdr1Uk/ivNNAzurhzPmenD0Ekqu8ncU=;
	b=lAgFt26snaySU4aT83DaZTpyRUoGt9X7XcjL/M2ojGf/jVy6njBsVJmqwyLpwgnt8W
	6CH5KjKn3BZoFnZUPQBmydw3FJYBxt0QslFX0pdgi06q5LTzRw99gIevijNV3Lr1C22V
	JAzhVJpg1ie4DSPHecI+dU5AnxrbDrtBa7cRrbr6OxDmFkl+zgWfsUGPvzAmM/9bb+DM
	p3lnvjXUOvUIz3OU7UEJCJERiZF5UMx1zL/jmiLvY61Fnu6MhzC8sYNMdQZp2JQfJqao
	02vwSPGylBcRpejrYzkZnW9EqAcPyCT21VJFT7/xNJmYLYT1NlPoWb/oOQLeWCOk0+VU
	sVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=v6xBVo/VMZFkjdr1Uk/ivNNAzurhzPmenD0Ekqu8ncU=;
	b=GGPNQHp6RDw2O7gj6Jr4hTALHXLj58QllLwdAk6lbmbEQ+xcFOoEHZ0W8hkSzE2vUF
	P8cT9Mh6D49gL/BVm4CnqiBNnNpP2UKyHTHMogELgW7DhmLDAeH+gigJbom56fWB91R+
	or2guLqcSpPfmAmc3MrDOXlmtyy74b0HUkZMil1nr13F+0XjHXf0Q26B4/1rqF/njOe9
	0CUXkx+MJjJF/aH+b3b/Z06AVVRvIRkvO3SrVbIQCiCD3GVpOya0uuQcfVmoIEpWmmA5
	Z28EPpawXOLbRVxU+O8kDHFX6FjwJL2wcCrzi01YSiO40JBLK6ASWZl+d0UBTubmQq46
	awMA==
X-Gm-Message-State: AKaTC03bgjLKknUs2b2grzja4hjMZK26o8T4Pgc4aMFKiy5ENSGwvazx/NjAE42oq7sla/0v5NYPEiIlPW3cbA==
X-Received: by 10.31.234.199 with SMTP id i190mr40541417vkh.31.1481646616573; 
	Tue, 13 Dec 2016 08:30:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Tue, 13 Dec 2016 08:29:46 -0800 (PST)
In-Reply-To: <7aafe397c8214239a49d3cf09480d388@XBOX02.axis.com>
References: <alpine.LFD.2.20.1612100630310.23762@localhost.localdomain>
	<CAMKF1sp_R_qapapbcZ8mu-b1BumWekvKjA-QXUDLOTSWgOoXQA@mail.gmail.com>
	<7aafe397c8214239a49d3cf09480d388@XBOX02.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Dec 2016 08:29:46 -0800
Message-ID: <CAMKF1socSZpw1raKWxt6=SZ4T2Ux_4LeiUhX-PGpxG9Q5y_Deg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: can "IMAGE_INSTALL ?= ..." not be written in a more obvious way?
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
X-List-Received-Date: Tue, 13 Dec 2016 16:30:16 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 13, 2016 at 12:52 AM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>> Sent: den 10 december 2016 22:16
>> To: Robert P. J. Day
>> Cc: OE Core mailing list
>> Subject: Re: [OE-core] can "IMAGE_INSTALL ?= ..." not be written in a
>> more obvious way?
>>
>> On Sat, Dec 10, 2016 at 3:40 AM, Robert P. J. Day
>> <rpjday@crashcourse.ca> wrote:
>> >
>> >   i've nattered about this before but not sure i ever got an answer --
>> > here's the last bit of core-image.bbclass:
>> >
>> >   CORE_IMAGE_BASE_INSTALL = '\
>> >     packagegroup-core-boot \
>> >     packagegroup-base-extended \
>> >     \
>> >     ${CORE_IMAGE_EXTRA_INSTALL} \
>> >     '
>> >
>> >   CORE_IMAGE_EXTRA_INSTALL ?= ""
>> >
>> >   IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
>> >
>> > the first time i saw that (long ago), it took me a few looks to figure
>> > out what was happening. can this not be written in a more obvious way:
>> >
>> >   CORE_IMAGE_BASE_INSTALL = '\
>> >     packagegroup-core-boot \
>> >     packagegroup-base-extended \
>> >     '
>> >
>> >   CORE_IMAGE_EXTRA_INSTALL ?= ""
>> >
>> >   IMAGE_INSTALL ?= " \
>> >     ${CORE_IMAGE_BASE_INSTALL} \
>> >     ${CORE_IMAGE_EXTRA_INSTALL} \
>> >     "
>> >
>> > is that not equivalent, or am i missing something? it's certainly
>> > clearer as to what's happening if people are perusing the code.
>>
>> They are same AFAICT, dont feel strongly  about readability but feel
>> free to send a patch
>
> Careful now. Changing these can affect image recipes outside of OE-core.
> If one has an image recipe that inherits core-image and then defines
>
> IMAGE_INSTALL = "${CORE_IMAGE_BASE_INSTALL} my-own-packages ..."
>
> then changing CORE_IMAGE_BASE_INSTALL as per above would suddenly
> cause that image to miss including packages that it previously did.

yes I think thats the interface it will end up in. It would be more
explicit for someone to set IMAGE_INSTALL explicitly and not expect
this sort of bundling. its also more readable when you construct
IMAGE_INSTALL

>
> I recommend leaving it as is.

agreed.Probably not worth the churn

>
> //Peter
>

