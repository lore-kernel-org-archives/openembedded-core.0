Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 10FE8617B8;
	Sat, 30 Aug 2014 02:56:41 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id rl12so3758618iec.29
	for <multiple recipients>; Fri, 29 Aug 2014 19:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QN2eFnzucfBu33Ic1AIgrZ95IvAtkCCRQ0lFHeGSkIc=;
	b=bHKlhcCnpNtTmwEr2BsSynLNmR2aXQOzEiiI2Ov1AJs8gkaPkiOA8DLmDohXC8Oww7
	U3PN2vbikFAhNVXIjiHZ3nTreBTyMZwpKKJ2s29JIhLMu5MAyJVmeaAQ/0Q0wnS8CjBw
	0zxCZ/j3R2P0E0+EK4+mgXdJnL+0woe/CjVO/1/dh8dWzhD/ZeNFiu+LeGRH+TO2Hn77
	TBYH1/Rmq/yHF5+yP63c9+pqC8VkwOlkBaXCZe0DNpqVvkmDkdJpNzeOH6Mb0npCPqFZ
	SUdwtkG24Jve3c/dmsWBUAvspDMcDcwiaiAsi3fl8D+b/1ic4jI8YPP4vIKQMuoXrEoA
	zWLQ==
X-Received: by 10.43.167.196 with SMTP id nf4mr1895715icc.22.1409367402728;
	Fri, 29 Aug 2014 19:56:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Fri, 29 Aug 2014 19:56:12 -0700 (PDT)
In-Reply-To: <CAMKF1sq4NwaFhZCXysdJ53G=3UY2CnHgKZmgpG7H-X=vhG0W9w@mail.gmail.com>
References: <20140828064051.GA13139@haswell> <1409266291.29296.147.camel@ted>
	<CAMKF1spz2KoO6NDSkZwh=V=pkyYi6e7-G0fpka5P2ifbjnNn6w@mail.gmail.com>
	<CAMKF1spj67i2i_50m=oTUpS3x2J=de0UxGf70zLhn-a7c4M3QA@mail.gmail.com>
	<1409308755.29296.148.camel@ted>
	<CAMKF1sq4NwaFhZCXysdJ53G=3UY2CnHgKZmgpG7H-X=vhG0W9w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Aug 2014 19:56:12 -0700
Message-ID: <CAMKF1sqRHG28mmX+0B2jGNzBbKux2FriRgbTX0WhjGxXWAp92w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] Moving on from eglibc to glibc 2.20
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
X-List-Received-Date: Sat, 30 Aug 2014 02:56:45 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 29, 2014 at 5:01 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Aug 29, 2014 at 3:39 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Thu, 2014-08-28 at 18:46 -0700, Khem Raj wrote:
>>> On Thu, Aug 28, 2014 at 5:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> > reproduced. will apprise as I have some fix.
>>>
>>> OK pushed another patch to the contrib tree that should take care of both
>>> xf86-input-synaptics xf86-input-vmmouse
>>
>> Thanks. I'm having one heck of a problem unentangling all the different
>> build failures (from these and other patches) but this one looks like
>> glibc:
>>
>> https://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/18/steps/BuildImages/logs/stdio
>>
>
> Trying to reproduce it locally. Once I have, I will update.
>

Richard

I have fixed this too and pushed the updates to same pull tree.
Please give it another whirl

-Khem

