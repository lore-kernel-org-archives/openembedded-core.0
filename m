Return-Path: <cjp256@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 521B878650
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 21:38:11 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id c9-v6so8597814iob.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 14:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Dc/G6gehncmieX+rfApuGsBFOOmdUvXwzJ9qvD7lrIU=;
	b=CbCTXr+9nnob58wWzrqJ/oCTLIBFrkX603a4/xH3DFJHm679tsKkfOUL0TrdBQPMu6
	/EcpRWeuzwqhMG9wirzQFzBkJemvnyy+x8ORx3QfcetmsssIhsXCrFERKaHDfYH9H39z
	ViGkrgvsnkswFYxFU4n5vD12ogynin621otXbeZ/8g9IPDy768Ddw+g8o06K1HcDqIJA
	N91YGj06DdvWdmao2/fJ4Li4h8EWo/p+kI8/cF21UOt09GNXaVoK9ZWZmC0baOW+5kXz
	laNac3kC3dNZbK2qvAb/pJu0wRN5XSirI0yvPX4jxpiyDKIRxNUZNjkDDSp3iYYFrkyF
	vx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Dc/G6gehncmieX+rfApuGsBFOOmdUvXwzJ9qvD7lrIU=;
	b=ddPd1njx76qw/4tuJlpVBgR4UiYZRKfKo8efehoElxqaWJgOQPQfDxUGkK1kM6XHPP
	M3eIgQloNUWX3lr3Emka9PnCZEUO1UitKIAbbuJIGQ1j4PhsotkYPYSQTgIDLiIX1CNw
	3FaOa/nMdVaVG45pxdXFHAYq1CTIQU7qFwP8B9ScyW1MR5Ln9XGmuNn7cEbYzYXsKk3C
	2YHSAucnP/GqSQRUhhurk45uk0CVhtZUjEn1egyPSu48Ud+VM6Izmi6B/6yyXOGuyIjI
	ICDtZzgZL0oVyaUKDTzux//DEV3tjmyuiJUdD+XiGqya28N5dyciiawmARHPbazekBYB
	r4eA==
X-Gm-Message-State: ALKqPwcgGAbY0BSkwZTs+HjRYy3Q8lQ0PfF8wbPXeqXrkI+R4jWKxmJj
	Ui7oMYwehqtwlzLZamT/lzr5/DfwfV9bAE5CMu4=
X-Google-Smtp-Source: AB8JxZq0SaBBn6r8eJKEopfXgRxFBXwIUSmfs1hh1fLYXVr/Cig2CtbXbTiJWP6iCnBR6N0WOKhS1grgUPUztI1K2Jk=
X-Received: by 2002:a6b:9342:: with SMTP id v63-v6mr135511iod.76.1526074692957;
	Fri, 11 May 2018 14:38:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:712b:0:0:0:0:0 with HTTP; Fri, 11 May 2018 14:37:52
	-0700 (PDT)
In-Reply-To: <20180511213210.GC2141@jama>
References: <1526056553-31049-1-git-send-email-cjp256@gmail.com>
	<CABcZANm1CMZkm+fkR+o_9DejzS=3bzj4XvM1zVd_zsVTY1YZAw@mail.gmail.com>
	<CABZSBQeN+mx7Y8oQ8fhPf=xeuqLa2RpjwHLkVAPD2qoSzvzQMg@mail.gmail.com>
	<20180511213210.GC2141@jama>
From: Chris Patterson <cjp256@gmail.com>
Date: Fri, 11 May 2018 17:37:52 -0400
Message-ID: <CABZSBQcKLcxADoRwNZneKg+tePvhTQ+JJ6wA0+cKAHeXTAhp3w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Chris Patterson <pattersonc@ainfosec.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: add gettext to DEPENDS
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
X-List-Received-Date: Fri, 11 May 2018 21:38:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 11, 2018 at 5:32 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, May 11, 2018 at 05:21:09PM -0400, Chris Patterson wrote:
>> On Fri, May 11, 2018 at 3:10 PM, Christopher Larson <kergoth@gmail.com> wrote:
>> > This is not a correct fix. We have a gettext bbclass for a reason.
>> >
>>
>> I did look at that prior to doing this.  It was my initial approach,
>> but inheriting gettext causes qemu build to fail when it modifies the
>> EXTRA_OECONF options with the nls flag (that qemu doesn't process).
>> There are quite a few other recipes using gettext-native in their
>> DEPENDS, and the reason for one over the other isn't quite clear.
>>
>> In the other thread (v2), Khem requested it only be added
>> conditionally if the gtk packageconfig flag is enabled.  Do you think
>> it would be appropriate to check packageconfig flag, then
>> conditionally inherit, then resolve (scrub) the unsupported configure
>> flags? Or modify the class such that modifying the OECONF is prevented
>> to begin with?
>
> Are you using gtk PACKAGECONFIG for qemu-native (or nativesdk-qemu)?
> Last time I've tried I've found that there are many things missing to
> make it usable, see last few commits at:
> http://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/qemu
>
> I haven't tried gtk(3) for target build, it probably works better there.
>

I was looking to use it in my image (non-native).  Thank you for the info!

