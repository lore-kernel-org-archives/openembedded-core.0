Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id B522B60CEB;
	Sat, 12 Jul 2014 05:03:28 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id l13so159398iga.1
	for <multiple recipients>; Fri, 11 Jul 2014 22:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Lhf0b2fvAeqKh73JM4oinoiJZF7RmAIgEKTpDrBUg2E=;
	b=yTEf6XKAaAKYFNkTbBLmEIvYiI68NtFGxg58XC/P3iWUEZtAhBMbIjsrdd+WozqBUl
	bc4ihtVdpvbDeKmcaQV0C4invwGk6O17TDCLTA7dJjFAjhz9AMj6WS/V0V3yPQTxa2ou
	ydXvzwTkg0DN0HYU7GfGCMK76NBLnG8CoBp1RteJZC7cQ5L4noNuwb5/5mZWqTr/p5/X
	B0UV2BpXyny3+e7tGo0aVcDpcxPxnh3TcxQnk24HMkHX3Ok5nziXa9I2KT8l36HKPCjz
	p5al4+ZIXDBgqrMWgOo4A1u6Q55ycB2cqOzASfzeuOrq8wTk6vyP7vYtcbK7O9nQMJww
	5pNg==
X-Received: by 10.43.69.202 with SMTP id yd10mr8922135icb.36.1405141409475;
	Fri, 11 Jul 2014 22:03:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Fri, 11 Jul 2014 22:02:59 -0700 (PDT)
In-Reply-To: <CAP9ODKqwOXV+GxNhoPFXJWcjLipD1P176Qcy0bBNMuzF9=Bhng@mail.gmail.com>
References: <alpine.LFD.2.11.1407111821080.6262@localhost>
	<CAP9ODKqwOXV+GxNhoPFXJWcjLipD1P176Qcy0bBNMuzF9=Bhng@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Jul 2014 22:02:59 -0700
Message-ID: <CAMKF1spgCphqN7PVskjP_bHd2CfsBRi52y=KJ2fWyjwQxw0cYw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [PATCH] core-image.bbclass: Reformat definition of CORE_IMAGE_BASE_INSTALL
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
X-List-Received-Date: Sat, 12 Jul 2014 05:03:32 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 11, 2014 at 4:41 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello,
>
> +OE-Core
>
> On Fri, Jul 11, 2014 at 7:23 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>>
>> Reformat the assignment to CORE_IMAGE_BASE_INSTALL to be more
>> intuitively obvious.
>>
>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>
>> ---
>>
>>   compile and run-time tested, building a core-image-minimal for
>> qemuarm.
>>
>> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
>> index 1b36cba..d2b9d69 100644
>> --- a/meta/classes/core-image.bbclass
>> +++ b/meta/classes/core-image.bbclass
>> @@ -59,13 +59,11 @@ MACHINE_HWCODECS ??= ""
>>  CORE_IMAGE_BASE_INSTALL = '\
>>      packagegroup-core-boot \
>>      packagegroup-base-extended \
>> -    \
>> -    ${CORE_IMAGE_EXTRA_INSTALL} \
>>      '
>>
>>  CORE_IMAGE_EXTRA_INSTALL ?= ""
>>
>> -IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
>> +IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL} ${CORE_IMAGE_EXTRA_INSTALL}"
>
> For me, more intuitively would be:
>
> CORE_IMAGE_BASE_INSTALL ?= ...

weak assignment here would mean overridable base install which is not
the intention. we want a working base image when inheriting core-image

>
> IMAGE_INSTALL += "${CORE_IMAGE_BASE_INSTALL} ${CORE_IMAGE_EXTRA_INSTALL}"
>
> So IMAGE_INSTALL += "foo" in local.conf works as expected by new users.

doesnt patch has same change ?

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

