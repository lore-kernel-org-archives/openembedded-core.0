Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3CB3760666
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 13:57:03 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id er20so5882186lab.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 06:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ckd1ivvzjPsI4xprKXUwUTV//yviHb8vFFOut/iewYI=;
	b=UosYb+7zS5IMEqAYjuQUKzJLOc8gIlAeQh5F/5/ZoDRjKWxcXyu2JCO0kDmkpPLTMd
	Z/Wm+YNniia2N6qFNcwx8jMAXJJ2huvisUDFYtu+pMAtr88ExH9NlmrgLB1COsC9W/Rc
	ZKeix8z3K5Q5f8rer3bHFK7aPrvtXNSqXvSXjZoks3ADmAUa6XwCQzyWUyq/qZu3iIIr
	747b1fAX4T5wdrK2Cntbi3XCuDhWjn6jwWcg1x6Ba12VFQS5A1ir5l9ywb6MFLQCQsNG
	eGXlPBh1z2QNQyXGQxpN9nDLQcDlegCNlDi3hE9i1m6d2poVPVx0DalUbEEQp6rrhy5G
	Y1zg==
MIME-Version: 1.0
X-Received: by 10.112.168.132 with SMTP id zw4mr15255837lbb.79.1373464623023; 
	Wed, 10 Jul 2013 06:57:03 -0700 (PDT)
Received: by 10.112.133.234 with HTTP; Wed, 10 Jul 2013 06:57:02 -0700 (PDT)
In-Reply-To: <ly4nc2twyk.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <ly8v1etzn5.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<ly4nc2twyk.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Wed, 10 Jul 2013 10:57:02 -0300
Message-ID: <CADkTA4OgktutnmLz87ps4paqanUZM1P4hYz-eu580-rWZBsZzg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel miscompilation with gcc 4.8 for ARMv5
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
X-List-Received-Date: Wed, 10 Jul 2013 13:57:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 10, 2013 at 9:34 AM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Enrico Scholz
> <enrico.scholz-wttK6gPy29v+Hn7q9Vec/7NAH6kLmebB@public.gmane.org>
> writes:
>
>> is it expected that recent gcc 4.8[1] compiles the kernel correctly?
>> Kernels for ARMv5 platforms (PXA168 -> 3.4.52, MX28 -> 3.8.13) fail here
>> 100% at early boot with
>
> Applying two upstream kernel commits
> 455bd4c430b0c0a361f38e8658a0d6cb469942b5 (ARM: 7668/1: fix
> memset-related crashes caused by recent GCC (4.7.2) optimizations) and
> 418df63adac56841ef6b0f1fcf435bc64d4ed177 (ARM: 7670/1: fix the memset
> fix) seem to fix the problem for me.

Correct. Those are the same commits you'll see on linux-yocto-3.8, we've been
soaking them for a while. I was waiting for LTSI and -stable to pick
up the changes
before updating linux-yocto-3.4, but that hasn't happened yet.

If you are using linux-yocto-3.4 and can confirm that it boots for you
with those patches,
I can stage them in my tree while I wait for them to loop around.

Cheers,

Bruce

>
>
>
> Enrico
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

