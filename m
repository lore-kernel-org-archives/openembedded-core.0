Return-Path: <dbaryshkov@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1A19365CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 12:11:19 +0000 (UTC)
Received: by ietj16 with SMTP id j16so116096579iet.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 05:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=z5jD1Hs0ZTkmSPP+FYsB7eC5naBv8BK6HK3GYLS2L0Y=;
	b=l3BPnnl7pRRD+xdWQ0COseRzz4eeSoTwtIAOY8cw8suwpXaQjtI91DAbDYkCaj7Jw4
	hStJ/DvA+ZgpGU7TnR4dBTpvxC2WT2yM2zzqCDjxXKxHQhX3xp03Eux5Y7sSkrCx3oIM
	AiHj+YuBUQPcgD4tXvlD3R7aqjoLrR1xtJzvnuLvM+TlGSvPbKfS+JbM3ZBHkdVe+it9
	7ZGGR6lT7QDqzlPZsVDscxL69cM/eV89RpltrzhMRs5VSlQ3UlKaOdu8ro6bGmebWTPx
	AtMjSt1gSlZql4sqKxgXQ2N3m/iAMKdunb/BYTsQcQEljGSWhxNqNDadPj48vqL4QCsh
	QJWA==
MIME-Version: 1.0
X-Received: by 10.107.134.96 with SMTP id i93mr35737979iod.139.1437394279600; 
	Mon, 20 Jul 2015 05:11:19 -0700 (PDT)
Received: by 10.64.122.193 with HTTP; Mon, 20 Jul 2015 05:11:19 -0700 (PDT)
In-Reply-To: <559D1AD2.3050305@windriver.com>
References: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
	<CALT56yP2_bkOfesazULteWL73DuBKo-BMu0MPxHw-FUz79997g@mail.gmail.com>
	<559D1AD2.3050305@windriver.com>
Date: Mon, 20 Jul 2015 15:11:19 +0300
Message-ID: <CALT56yMhBodVKpG9Pe8zzUcHiwanmxn8pUEqdJUU14-ry6DBvg@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Fix builds for MIPS64 N32
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
X-List-Received-Date: Mon, 20 Jul 2015 12:11:21 -0000
Content-Type: text/plain; charset=UTF-8

2015-07-08 15:42 GMT+03:00 Mark Hatle <mark.hatle@windriver.com>:
> On 7/8/15 7:00 AM, Dmitry Eremin-Solenikov wrote:
>> Hello,
>>
>> 2015-07-01 17:02 GMT+03:00 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>:
>>> Quite simple configuration (MIPS64 N32 image) fails to build (see below).
>>> I have verified these patches in both single lib and in multilib cases.
>>> Tri-lib images and SDK for MIPS build fine with these patches.
>>
>> Any comments on this patchset? It would be nice to have N32 ubroken in
>> the current
>> master tree.
>
> Sorry, I'm traveling right now and haven't had time to review this.  I should be
> able to get back to the office and test it by the end of the week.
>
> I visually reviewed the patches and I don't object to them going in -- but I'm
> still not sure they are all correct.

Re-ping. I'd like to receive a confirmation from you (and thus get the
patches merged)
or to discuss, what seems wrong to you.

>
> --Mark
>
>>>
>>> Current situation:
>>>
>>> lumag@nexs:~/OE$ MACHINE=qemumips64n32 bitbake core-image-base
>>> NOTE: Started PRServer with DBfile:
>>> /home/lumag/OE/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 46391, PID:
>>> 15895
>>> Loading cache: 100%
>>> |########################################################################################################################|
>>> ETA:  00:00:00
>>> Loaded 1302 entries from dependency cache.
>>> NOTE: Resolving any missing task queue dependencies
>>> ERROR: Nothing RPROVIDES 'binutils-cross-canadian-mips64' (but
>>> /home/lumag/OE/sources/openembedded-core/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
>>> RDEPENDS on or otherwise requires it)
>>> NOTE: Runtime target 'binutils-cross-canadian-mips64' is unbuildable,
>>> removing...
>>> Missing or unbuildable dependency chain was: ['binutils-cross-canadian-mips64']
>>> NOTE: Runtime target 'packagegroup-cross-canadian-qemumips64n32' is
>>> unbuildable, removing...
>>> Missing or unbuildable dependency chain was:
>>> ['packagegroup-cross-canadian-qemumips64n32',
>>> 'binutils-cross-canadian-mips64']
>>> ERROR: Required build target 'core-image-base' has no buildable providers.
>>> Missing or unbuildable dependency chain was: ['core-image-base',
>>> 'packagegroup-cross-canadian-qemumips64n32',
>>> 'binutils-cross-canadian-mips64']
>>>
>>
>>
>>
>



-- 
With best wishes
Dmitry

