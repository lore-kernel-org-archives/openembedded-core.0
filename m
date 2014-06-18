Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 257A36FFBA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 01:08:37 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id pv20so75586lab.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 18:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5wAxDSxcrkO83MFqXE9tusX1qjHVLmOSLy2bv3x5YPs=;
	b=dnpT0SFi5h/ac4LvQxDweG3pbZ8GFBWZLp8b67MMy7Y4H3km/Py3lEEDLiLWfHBlBN
	qYOp6Cc3olem6Bg9pvqG+L4YO+R1WcC4U/VqnPeQSSXcgQSzayMFuxHkiZdGzNszdKk+
	fA5MZeRIaiL2RLpLGqqyUs5bRxHaFi3MZNpCP8Mnv0we383bzZSHVDT4CqZCdV3cgOrj
	E8N6eWmVCGdjhog6HJkRigUYxaH8/wIVoCQWtrgFbyPfeenzxVdLsbRSsghabOzZDFBO
	zfwJkndplWUQ0AJwCB93STMr4+YkK6mcjfN1sQ5563qYjJuDp0/L3uRRhrYrAanpNklY
	KemA==
MIME-Version: 1.0
X-Received: by 10.152.28.136 with SMTP id b8mr3560964lah.22.1403053717174;
	Tue, 17 Jun 2014 18:08:37 -0700 (PDT)
Received: by 10.112.124.146 with HTTP; Tue, 17 Jun 2014 18:08:37 -0700 (PDT)
In-Reply-To: <53A0DB50.7020402@windriver.com>
References: <cover.1403016995.git.bruce.ashfield@windriver.com>
	<1403043506.2104.4.camel@ted> <53A0DB50.7020402@windriver.com>
Date: Tue, 17 Jun 2014 21:08:37 -0400
Message-ID: <CADkTA4NzmohFfDh1h9dobBEVC+CRum1-AeFQABVSV6O4NBi34w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] linux-yocto: 3.4, 3.10 and 3.14 updates
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
X-List-Received-Date: Wed, 18 Jun 2014 01:08:43 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 17, 2014 at 8:20 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 2014-06-17, 6:18 PM, Richard Purdie wrote:
>>
>> On Tue, 2014-06-17 at 11:26 -0400, Bruce Ashfield wrote:
>>>
>>> Richard/Saul,
>>>
>>> Here are my collect stable updates to 3.4 -> 3.14. Build and boot sanity
>>> passed here, but with three versions being updated, its a lot of build
>>> testing :)
>>>
>>> I also have an update for NAND support on the mpc8315e reference board,
>>> which allows us to shake out flash filesystem issues. I'll follow up
>>> with a meta-yocto-bsp change to enable the changes there as well.
>>
>>
>> I merged these two series and we've started seeing:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-deb/builds/119
>>
>> which is a 3.14 kernel lttng-modules failure on the autobuilder :(
>>
>> Are we missing an update to lttng?
>
>
> I reproduced the breakage with a fresh tree. I'll fire off a patch tonight
> with any amount of luck :)
>

No luck needed. lttng 2.4.1-stable already has a fix, once my build completes
against 3.10, I'll send the SRCREV update.

Bruce

> Cheers,
>
> Bruce
>
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

