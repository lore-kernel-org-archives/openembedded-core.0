Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id D4E1C6093D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 22:52:40 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id w43so7146305wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 15:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EISmwQu20mejbWcCseB32X/1eKZ7eVKsN4Dtfyhi3nw=;
	b=mr/+WXmK/YQbf7YgE3oKVlrXHY89ebbZhCXbFsmR5m2fVaxoBNkGwBYBtj11gJuoO7
	d7zACiX2Jf5abafGJRNpVPq863mWnUQ0IYuyqsZoD2hdEusb0H0YWNc6Zmhn3zYx0mt+
	vNBR4l1LaA5gjnauN7Sz9I5fJg+mqYL/JKENRXPceEwc6ESqev8pKSL5IRalRGhLP6dB
	puzGYyjRdTwXeJBJ+PR3SdBMe4T5j/JEv8PAxXM/4C4s0z8JihHyZftUJKPI/4Ezzk7v
	VQQJLA6ALGp/PUUpxAeufDuh8gV5a7bb8HWbeSYmI0bi6g/b/UYD5F4VEDm/E3xKOVfs
	sp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EISmwQu20mejbWcCseB32X/1eKZ7eVKsN4Dtfyhi3nw=;
	b=dmw024jDbMx7UaXPMZpxdUGhtCL19MPD3wkJTs/peYlQs3QJQFH9AXje9kNm+r6zsX
	UQ/U+tbmx+ALxLfeZ5iRtr7YlCm7gFTbbmc8NQWMy3YsIlZwqg8JSAo6qj8EeIbenxfK
	eqKmUw8ixMGRqaF3+TulHtNwAg8X5/skvqr5d6ksgZM0YI9Xnsg1hNlT1zgy+xD/5a5f
	5wWHlaqhrH7NRjbfx39CnXtoYgOSC2GfHTx9bqdPnOZF76jdKL6g/w2HHoH2MD98i9PH
	+8n5KatpEifebH7J6bNcaYHi2GJ5O8K6MXr47UxK8mEGOSqhXUoDP5x0eHsHpWzEyOIb
	AFMg==
X-Gm-Message-State: AFeK/H1e30Uldsw3CfBrcigPEeJkkS/BLLpHItMDdUhD9jbZW0bMfdBcHHnZcyuEZ1ekfsYhXMX6TUWl3EJfZg==
X-Received: by 10.223.145.199 with SMTP id 65mr2364320wri.182.1490827961349;
	Wed, 29 Mar 2017 15:52:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.150.195 with HTTP; Wed, 29 Mar 2017 15:52:40 -0700 (PDT)
In-Reply-To: <1490826296.13980.335.camel@linuxfoundation.org>
References: <1490820317-3686-1-git-send-email-andrea.adami@gmail.com>
	<20170329230933.3b71d516@t510.zcs.saftware.de>
	<1490826296.13980.335.camel@linuxfoundation.org>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 30 Mar 2017 00:52:40 +0200
Message-ID: <CAAQYJAtwSctCha6mJqUUFVddnV31oGwaabNPLtV9PqAULDLs-g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: add whoami to HOSTTOOLS
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
X-List-Received-Date: Wed, 29 Mar 2017 22:52:41 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 30, 2017 at 12:24 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2017-03-29 at 23:09 +0200, Andreas Oberritter wrote:
>> On Wed, 29 Mar 2017 22:45:17 +0200
>> Andrea Adami <andrea.adami@gmail.com> wrote:
>>
>> >
>> > Spotted in log do_compile of linux:
>> >
>> >  /tmp/build/tmp-glibc/work-shared/c7x0/kernel-
>> > source/scripts/mkcompile_h:
>> >  line 46: whoami: command not found
>> As an alternative, we could set KBUILD_BUILD_USER (and possibly
>> KBUILD_BUILD_HOST) to a fixed or machine-based value in
>> kernel.bbclass'
>> EXTRA_OEMAKE variable, which could also improve the reproducibility
>> of
>> builds.
>
> Agreed, I already suggested we should figure out how to pass in a
> deterministic value and said I would not accept a patch to add whoami
> to HOSTTOOLS.
>
> Cheers,
>
> Richard

Hello,

well, I'm all for reproducible builds.
But there is the fact that this is the standard kernel behavior and we
never limited the user choices about how to build/configure a kernel.

Cheers
Andrea

