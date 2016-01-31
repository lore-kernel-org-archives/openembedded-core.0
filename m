Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 82EAF77230
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 08:54:08 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id f81so128224399iof.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 00:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Y3nrLsM6/6GwXv//EYTqCZMAoFuuKlMNGjIOyj7OX3k=;
	b=TVlnpk6URr88oHXOhzqvT2NsqGjVGsSLb8rXHbb8nUyCYpGR2Ep5Z87F975fsvCm0o
	XzpEHGKu3//IoY8FdQeAgQr9FmdGQbILvJt5+OyuYoyV9d/bNqvPOZ8BJwhlV1dwAq8Q
	XMyA76LZuq3tXAT0NN6qXovxRpbbNq4NG0t4h8XE+kHFkfgufjLLR8TD0EgPOSh9QAz3
	vy3I9WOb15UBw4NNRTmZq2xRrLdmeGH9I9ILnQZ9MTAmloyQp+sLQg7zy4N/tNozQ0GB
	vD7tfbKAm5AWhkf9w/7E9nZ5ufAPk26lPP2wr9j3QB6jJWJrwisxByRUT0NJWe5pFWdh
	8+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Y3nrLsM6/6GwXv//EYTqCZMAoFuuKlMNGjIOyj7OX3k=;
	b=Q5AZyoa0d7+Zgb+eu8IP0TIuAtlAcRHp/sHOR8rDQqAnCMx2Z5n07/EljsHrnz2pZ7
	MIoII9ug44ut2zwjWPLIRy+Cv3YlzB5Sv+AA6vbVHgUPgZCtanGTxYlE6YGF0Nkvu55k
	QBp/ZFwmsbrYnvtU8tMhQazMw5H6bYs58IPXxj4iK5ZpMoGPOrVj5lIF3QNubylnsHl+
	aXh1Uoj/PdD5gdHlhHw25Q8XriN8Q03BqfW5x6sLOtLm0Y2A0gdDmO/eqY0JsDedhFTA
	5sYzhZRoKcHRIkVkEw9ESqgUGZaSbgJ9CBFmI8yG954rAsV29212X7k2ioz75IkAaRyV
	GrZw==
X-Gm-Message-State: AG10YOSfpOkYiJoXe8VbnDmmYPa+rXdxRk225ueM+UzPzsRiYSCQzK8y0cJdr5ka9dKv09RZKfjoiJM4eVWx/w==
X-Received: by 10.107.34.79 with SMTP id i76mr20571210ioi.195.1454230449052;
	Sun, 31 Jan 2016 00:54:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.46.219 with HTTP; Sun, 31 Jan 2016 00:53:39 -0800 (PST)
In-Reply-To: <1454229127.27087.11.camel@linuxfoundation.org>
References: <2747032A-1F56-4CA6-860C-484B9292A0B5@gmail.com>
	<56AB73C0.8030505@linux.intel.com>
	<CAMKF1spkRPwBzY+6j6pVM_epfB2sVYS37-i+s9rJw4-rTXOMbQ@mail.gmail.com>
	<1454229127.27087.11.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 31 Jan 2016 00:53:39 -0800
Message-ID: <CAMKF1spuDDiw52Aca1hepV7aWGF_LSmUk2GACLSOPWUsWvy2mw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] Glibc 2.23 and binutils 2.26
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
X-List-Received-Date: Sun, 31 Jan 2016 08:54:11 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jan 31, 2016 at 12:32 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2016-01-29 at 06:44 -0800, Khem Raj wrote:
>> On Fri, Jan 29, 2016 at 6:14 AM, Alexander Kanavin
>> <alexander.kanavin@linux.intel.com> wrote:
>> > On 01/17/2016 01:54 PM, Khem Raj wrote:
>> > >
>> > > upstream glibc and binutils release branches have been cut out
>> > > and are
>> > > being made ready for next release
>> > > I have put together update patchset for both of them
>> > >
>> > > here are the branches
>> > >
>> > > https://github.com/kraj/openembedded-core/tree/kraj/binutils-2.26
>> > > https://github.com/kraj/openembedded-core/tree/kraj/glibc-2.23
>> >
>> >
>> > Hello Khem,
>> >
>> > when are you planning to submit these?
>>
>> binutils exposes a problem for ppc as a result kernel fails to build.
>> The fix is to drop
>> http://git.openembedded.org/openembedded-core/tree/meta/recipes-devto
>> ols/gcc/gcc-5.3/0030-Enable-SPE-AltiVec-generation-on-powepc-linux
>> -target.patch
>>
>> that patch makes generic ppc configs to be specific to fsl ppc.
>> but we need context as to why this was done
>>
>> glibc is still not released.
>
> I ran the binutils upgrade in -next on the autobuilder. It looked
> mostly good but with poky-lsb we did see:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb/b
> uilds/635/steps/BuildImages/logs/stdio
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb/b
> uilds/635/steps/BuildImages_1/logs/stdio

it looks like -fpie is the factor here, I will try to reproduce it here locally
may be we can get away by using system zlib instead of internal one

>
> Cheers,
>
> Richard
>

