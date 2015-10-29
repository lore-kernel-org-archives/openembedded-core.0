Return-Path: <danismostlikely@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id CC925755F4;
	Thu, 29 Oct 2015 17:28:58 +0000 (UTC)
Received: by iodd200 with SMTP id d200so53538787iod.0;
	Thu, 29 Oct 2015 10:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2V1sy55yOxFExM/gIZVEnfXD1sTrJh6hQ5d/YdzwSVs=;
	b=PR6g2gK0cSN76OMzIjYQoEj+MrIdK9O0zpFo3BzOkB+vieB3qIpkf6Ob5VrdWvkEs8
	gdqooQUu0CTawiJFpIHK92Z0xBw76JUZ88u3TToN1PKyHRBCvPaN8BpIgIrYW9evTnWh
	GmQkCRgUKe0K9AnMMTDOVmwIY6ku+HVkwmCpoctdraYz0lSYa9iNRX1fPc3VWoevk9/h
	H/6vkOp0OM+H3+4oXsQLPnVAeWm98sXcDBeOmXMX0PP4Z/fUPeScVLp0yAS4cGnO+H/L
	KiE6NO7HcoT49I1GDxv/OhMwnGvz2zDKYuaUHnCbDGidOKCyd/0wJsIDcHPcKsMtPj0L
	EQrA==
MIME-Version: 1.0
X-Received: by 10.107.7.218 with SMTP id g87mr5572669ioi.7.1446139737887; Thu,
	29 Oct 2015 10:28:57 -0700 (PDT)
Received: by 10.36.50.13 with HTTP; Thu, 29 Oct 2015 10:28:57 -0700 (PDT)
In-Reply-To: <1446137120.5251.111.camel@pbcl.net>
References: <9D79B6D4-2FE1-4C77-A359-C0F47DCC090D@gmail.com>
	<1446137120.5251.111.camel@pbcl.net>
Date: Thu, 29 Oct 2015 11:28:57 -0600
Message-ID: <CACS+7ZSijsYdZcGRAbtpAbrMzZFmDyT595efJvyD1orJNZ_0DA@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 29 Oct 2015 17:29:00 -0000
Content-Type: text/plain; charset=UTF-8

On 29 October 2015 at 10:45, Phil Blundell <pb@pbcl.net> wrote:
> On Thu, 2015-10-29 at 08:42 -0700, Khem Raj wrote:
>
>> I would like to make a proposal for 2.1 release where
>>
>> 1. Drop kconfig support in glibc and we become inline with upstream
>> 2. Move musl support to OE-Core from meta-musl
>> 3. Drop uclibc or leave it in current broken state, I would like to
>> pull it out into a layer in meta-openembedded and we can leave the
>> core plumbing as it is in OE-Core
>> 4. Poky-tiny switches to use musl
>
> I have no opinion on point 4, but the first three things sound like an
> excellent plan to me.
>
> p.
>

I agree. How much of a burden is it to keep systemd running with musl?

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

