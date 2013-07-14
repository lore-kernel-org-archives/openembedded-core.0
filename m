Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id CE1146A962
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jul 2013 04:58:28 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id fe20so8678181lab.20
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jul 2013 21:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=H4mzCg+X9UDATyOj1rktppq2d1AOCUdaC37lyigyhik=;
	b=IsUX2LUe1WFu9W4eBY9QLdgbzu5dyQC24J07ItfkkgW0S+9CxnfdEx5sepYIbWNrfe
	rPr0aEFh5UdjkRLaNH5ZhjOo9121fP0TA/9+QWh4piy4I18e7dSRbRirAMb6s1W3V4BO
	nkvGFC+k7RJyugpJkxhqsdXmHZ5jQZemjl2+qBBodA77lsPTmTCS0RdgHfSRieChPR2n
	obTNnyknpqZO53agjo9we1EMj2p81QPbZdUWqIYUFDJKj8YBgtIkjIN3s7Cv5cD/cNCn
	A2CAIepR32dJGPucpshIM9E6a6z9Zf3OzQAdTUENhCAjw3QTDW1D/yH9K6epZYzsPQka
	PiLg==
MIME-Version: 1.0
X-Received: by 10.152.9.102 with SMTP id y6mr22602596laa.17.1373777908366;
	Sat, 13 Jul 2013 21:58:28 -0700 (PDT)
Received: by 10.112.133.234 with HTTP; Sat, 13 Jul 2013 21:58:28 -0700 (PDT)
In-Reply-To: <CADkTA4OgktutnmLz87ps4paqanUZM1P4hYz-eu580-rWZBsZzg@mail.gmail.com>
References: <ly8v1etzn5.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<ly4nc2twyk.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CADkTA4OgktutnmLz87ps4paqanUZM1P4hYz-eu580-rWZBsZzg@mail.gmail.com>
Date: Sun, 14 Jul 2013 00:58:28 -0400
Message-ID: <CADkTA4Pou6eE9+Du7+i0mRAMT2_zGXS832axShL3Yrbr_zutuA@mail.gmail.com>
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
X-List-Received-Date: Sun, 14 Jul 2013 04:58:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 10, 2013 at 9:57 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Wed, Jul 10, 2013 at 9:34 AM, Enrico Scholz
> <enrico.scholz@sigma-chemnitz.de> wrote:
>> Enrico Scholz
>> <enrico.scholz-wttK6gPy29v+Hn7q9Vec/7NAH6kLmebB@public.gmane.org>
>> writes:
>>
>>> is it expected that recent gcc 4.8[1] compiles the kernel correctly?
>>> Kernels for ARMv5 platforms (PXA168 -> 3.4.52, MX28 -> 3.8.13) fail here
>>> 100% at early boot with
>>
>> Applying two upstream kernel commits
>> 455bd4c430b0c0a361f38e8658a0d6cb469942b5 (ARM: 7668/1: fix
>> memset-related crashes caused by recent GCC (4.7.2) optimizations) and
>> 418df63adac56841ef6b0f1fcf435bc64d4ed177 (ARM: 7670/1: fix the memset
>> fix) seem to fix the problem for me.
>
> Correct. Those are the same commits you'll see on linux-yocto-3.8, we've been
> soaking them for a while. I was waiting for LTSI and -stable to pick
> up the changes
> before updating linux-yocto-3.4, but that hasn't happened yet.
>
> If you are using linux-yocto-3.4 and can confirm that it boots for you
> with those patches,
> I can stage them in my tree while I wait for them to loop around.
>

Heh. Clearly I had vacation brain when I wrote this .. I merged and
pushed the two ARM gcc 4.8
fixes on June 20th, at the same time I was fixing 3.8. :)

Cheers,

Bruce

> Cheers,
>
> Bruce
>
>>
>>
>>
>> Enrico
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

