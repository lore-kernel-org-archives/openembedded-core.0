Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id B290772D74
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 15:43:53 +0000 (UTC)
Received: by iget9 with SMTP id t9so41692301ige.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 08:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TrX3QhTZfy9xshOCF/Imxrj2WkRGUdzJZtT39ue8jA8=;
	b=Wfn3k5TnjvCwu183L7qnjhyt1unIxhx7HuEj4MKr2F7jmpKN77KO7FT5gsLXQdhWFU
	eBhZbOh95RuBkEUAdB2NJECgF2KP3iDzcpKvuEqlU74Buo5mf1aDRAoWcAi2pK4zPC0Q
	hkUkb25+4Y65qXL4Df7fg+DfvMas8YDPYDwAnvJvSTWL3V0nG1C4Cs8/IDr0AP6h+iiU
	gguXoalCdDzaaLFEl9eusYQBLqpR/r4KLFd2rHNhfftZwhsKo6IXkJq+2xbZGXmwJRDy
	XLaIF0RPXOi8T6KNkmfua3qpL40/09P4eldOiUu0z3FRM859b6uwikBISrs0PIaYivRy
	WM0g==
MIME-Version: 1.0
X-Received: by 10.42.164.7 with SMTP id e7mr14152937icy.70.1428853434075; Sun,
	12 Apr 2015 08:43:54 -0700 (PDT)
Received: by 10.50.117.7 with HTTP; Sun, 12 Apr 2015 08:43:53 -0700 (PDT)
Received: by 10.50.117.7 with HTTP; Sun, 12 Apr 2015 08:43:53 -0700 (PDT)
In-Reply-To: <7B4AA248-B0B9-459E-A35D-AA604C9B5AF9@gmail.com>
References: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
	<cover.1428714999.git.raj.khem@gmail.com>
	<2f1431e35ccf21d9ea3f956bf14ced26980f8f3c.1428714999.git.raj.khem@gmail.com>
	<A43175A7-E10C-4E5D-9E9B-E91744725F7E@gmail.com>
	<CAMKF1sp=ecR62FWaR7swXXMats+EHUoV1XaZXe9nfi7df0wmig@mail.gmail.com>
	<7B4AA248-B0B9-459E-A35D-AA604C9B5AF9@gmail.com>
Date: Sun, 12 Apr 2015 08:43:53 -0700
Message-ID: <CAMKF1sqRvPsxxJha4tZO0B1bCJduDBxVtvwTVW-nZ3SyJPHf3A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/17] sudo: Disable hardening for musl
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
X-List-Received-Date: Sun, 12 Apr 2015 15:43:57 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e84605fd234051388dd7e

--90e6ba6e84605fd234051388dd7e
Content-Type: text/plain; charset=UTF-8

On Apr 12, 2015 3:56 AM, "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
wrote:
>
> On April 12, 2015 11:26:26 AM GMT+02:00, Khem Raj <raj.khem@gmail.com>
wrote:
> >On Sun, Apr 12, 2015 at 1:30 AM, Bernhard Reutner-Fischer
> ><rep.dot.nop@gmail.com> wrote:
> >> On April 11, 2015 3:20:44 AM GMT+02:00, Khem Raj <raj.khem@gmail.com>
> >wrote:
> >>>musl does not yet enable ssp
> >>
> >> What happened to distro feature ssp, BTW?
> >>
> >
> >It was never used outside uclibc recipes.
>
> Oh indeed, apparently I never submitted it :(
>
> Would you accept such a distro feature?
> I don't want ssp per default in micro, for example.

Sure yes
>
>

--90e6ba6e84605fd234051388dd7e
Content-Type: text/html; charset=UTF-8

<p dir="ltr"><br>
On Apr 12, 2015 3:56 AM, &quot;Bernhard Reutner-Fischer&quot; &lt;<a href="mailto:rep.dot.nop@gmail.com">rep.dot.nop@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On April 12, 2015 11:26:26 AM GMT+02:00, Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt;On Sun, Apr 12, 2015 at 1:30 AM, Bernhard Reutner-Fischer<br>
&gt; &gt;&lt;<a href="mailto:rep.dot.nop@gmail.com">rep.dot.nop@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt; On April 11, 2015 3:20:44 AM GMT+02:00, Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt;wrote:<br>
&gt; &gt;&gt;&gt;musl does not yet enable ssp<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; What happened to distro feature ssp, BTW?<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt;It was never used outside uclibc recipes.<br>
&gt;<br>
&gt; Oh indeed, apparently I never submitted it :(<br>
&gt;<br>
&gt; Would you accept such a distro feature?<br>
&gt; I don&#39;t want ssp per default in micro, for example.</p>
<p dir="ltr">Sure yes<br>
&gt;<br>
&gt;<br>
</p>

--90e6ba6e84605fd234051388dd7e--
