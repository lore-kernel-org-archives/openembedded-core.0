Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1RbBv5-00046e-4E
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 15:04:23 +0100
Received: by pbcc11 with SMTP id c11so1096574pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 05:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xXHFI0WkDhnK6FISGTAuFOHMUSVqtmhsfpv+buDvPIA=;
	b=kU0PsPN7alUcOT513JtgM5Kdxb3cPcWHbll73UCR4Xyavp5GEByMSWVC8nb1qEplp1
	04EOxhRqC2wmaRfUasIMCBbhMTKgK2bYVAG61AtQjR9Yib7SaA1M4IIEUTvhWrKLf/E/
	uahskdbHKbWxFfyIHReMAa8QjYFwuRqYY2kAs=
MIME-Version: 1.0
Received: by 10.68.211.225 with SMTP id nf1mr10122193pbc.47.1323957444521;
	Thu, 15 Dec 2011 05:57:24 -0800 (PST)
Received: by 10.142.110.13 with HTTP; Thu, 15 Dec 2011 05:57:24 -0800 (PST)
In-Reply-To: <CA067797-AB29-4EBA-8561-5ED321E9D0A8@dominion.thruhere.net>
References: <1323793193-31090-1-git-send-email-dbaryshkov@gmail.com>
	<4EE7EA96.4080806@linux.intel.com>
	<CALT56yNAeCns9Ft4yr9fH2tnWtW-WERiJ=soKOqJGbHEJjVA4Q@mail.gmail.com>
	<CA067797-AB29-4EBA-8561-5ED321E9D0A8@dominion.thruhere.net>
Date: Thu, 15 Dec 2011 08:57:24 -0500
Message-ID: <CADkTA4MQ62VZj5Nd_d0pL0BQgNo=E0HwcZdRyPdO=QoGNB179w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 1/9] kernel.bbclass: compile kernel and modules in a single task
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Dec 2011 14:04:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 15, 2011 at 4:27 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 14 dec. 2011, om 01:17 heeft Dmitry Eremin-Solenikov het volgende geschreven:
>
>> On Wed, Dec 14, 2011 at 4:15 AM, Darren Hart <dvhart@linux.intel.com> wrote:
>>>
>>>
>>> On 12/13/2011 08:19 AM, Dmitry Eremin-Solenikov wrote:
>>>> There is no point in compiling kernel modules in a separate task, run
>>>> right after do_compile. On the other hand merging those tasks will e.g.
>>>> make icecc used also for modules compilation, etc.
>>>
>>> This split was done intentionally to allow tasks to be inserted between
>>> compile and compile_kernelmodules. See:
>>
>> Could you (or Koen) name any tasks that have to be inserted between kernel
>> and modules compilation please?
>
> Building external modules that are referenced by internal ones for example. But besides that, this also allows me to build just *Image quickly and not having to wait for the modules to build.

I've had the same thing here, just building the main image and not
wanting to wait for
kernel modules to compile. More of an incremental ad-hoc, scp and reboot sort of
workflow, but only building what you need in that situation is just
what a person wants.

Cheers,

Bruce

> -----BEGIN PGP SIGNATURE-----
>
> iEYEARECAAYFAk7pvXkACgkQMkyGM64RGpE2pwCdFjZuuNW4ler8ES4OsKddTaB2
> JnIAn0ME2FOwLyXeCS2DDBsTwKBFUKDt
> =l9hr
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


