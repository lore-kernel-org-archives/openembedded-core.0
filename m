Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id C1BCB755F4;
	Thu, 29 Oct 2015 19:52:34 +0000 (UTC)
Received: by iodd200 with SMTP id d200so57915221iod.0;
	Thu, 29 Oct 2015 12:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HLE7bhl+js4j4Fe203/jA3SjOgcLTN4V1tdcesl6sow=;
	b=CTK3nei0fu6sSYQhM+mHNEzc9ZRamS3MsNWlyJKW5QqIPA1O8BQF10i//1Lli3aHa7
	qmKvlLajLGreV0ZSmX5hU8EhgQahm/zS0zez6lTw2JibBJIEsSrCW1TFeIbwatjH1GKT
	hvcsPCIk3BZqPISzZEddekRlpsYGtXOIToYuW6Px9yJ6veBSjGk9FEmrgPtaU2dLbLkc
	3aoXN4mNKkXfzSoDEwAc72tnmCexFncGg7QWXp69AvhsGjVBHKnu784p4B5rXbnPhzob
	uhNA2Dh8LqTdOzZodXb4P7BZXilXcq84LdGZMkf/QeHS5RYSw8I1wKeqX4OGc+FPOv7F
	YRrg==
X-Received: by 10.107.4.3 with SMTP id 3mr6519278ioe.195.1446148354509; Thu,
	29 Oct 2015 12:52:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.133 with HTTP; Thu, 29 Oct 2015 12:52:04 -0700 (PDT)
In-Reply-To: <CACS+7ZSijsYdZcGRAbtpAbrMzZFmDyT595efJvyD1orJNZ_0DA@mail.gmail.com>
References: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
	<1446137120.5251.111.camel@pbcl.net>
	<CACS+7ZSijsYdZcGRAbtpAbrMzZFmDyT595efJvyD1orJNZ_0DA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Oct 2015 12:52:04 -0700
Message-ID: <CAMKF1squrEs4KGP73sWOvpo-5AXGtwB80AUCje0a7sZFYbLRag@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of libcs in OE-Core glibc/uclibc/musl
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
X-List-Received-Date: Thu, 29 Oct 2015 19:52:39 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 29, 2015 at 10:28 AM, Dan McGregor
<danismostlikely@gmail.com> wrote:
> On 29 October 2015 at 10:45, Phil Blundell <pb@pbcl.net> wrote:
>> On Thu, 2015-10-29 at 08:42 -0700, Khem Raj wrote:
>>
>>> I would like to make a proposal for 2.1 release where
>>>
>>> 1. Drop kconfig support in glibc and we become inline with upstream
>>> 2. Move musl support to OE-Core from meta-musl
>>> 3. Drop uclibc or leave it in current broken state, I would like to
>>> pull it out into a layer in meta-openembedded and we can leave the
>>> core plumbing as it is in OE-Core
>>> 4. Poky-tiny switches to use musl
>>
>> I have no opinion on point 4, but the first three things sound like an
>> excellent plan to me.
>>
>> p.
>>
>
> I agree. How much of a burden is it to keep systemd running with musl?

systemd is not for musl. fundamental goals of the projects are
different, so I dont even want to say it will be supported
although in meta-musl I have some patches which gets it to some
functional state. But systemd project wants to use
every feature that comes into glibc, and musl doesnt want to implement
anything extra on top of posix. So if we want
systemd with musl then its on own times either of community will help
with this. the situation is same with uclibc btw.

