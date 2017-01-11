Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 26B2371A62
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 17:40:18 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id l7so153242914qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 09:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9dICnjTyedsqyGjVMxn8Lr/CjWIpaXpYzvkPT9xSkQ8=;
	b=n5QyuUBIhFT+niFBOLYB6K1blVgGaVkItZfPv7mvAAl7xC3Bg3v891IMG7pX+gXrfQ
	nd8UJbGAVb+IqwI8lXnj65q0HOB9h3R5A6rTMEPmx/cEUpa+9jlUPQBG25IzocL8cuAl
	Dnn1UwIfxnTREHNQY5h3X7H5/ivCeNpxglB5MdIpqM/ph+dY6f01f7t92FMwOp33Szo0
	qDD2z+uE2Mvo+S0K54svCYSWIGqGzFpb9v/evHumY+QHT+Vj540JsJ7ld3ptwhIpQhRL
	lZ3Dkr/Wnuxg6rYfPnOzXHJgPe9jm6+dxk6qw0KMCHoPq7Dd3nGXYWO8Y0OO2j4oys/r
	Av9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9dICnjTyedsqyGjVMxn8Lr/CjWIpaXpYzvkPT9xSkQ8=;
	b=jB8PeuwBgDb4P3z6ihNCZ7AraSIokTLxSnZH69wq9MLPu9654aKZLJsCwqCvs5aWDn
	4H9NXZkw6iRVjSZa08VIFHlxfK4Frwtzanylu9oCJ+S7gnr2aQIqs5h3XVEr0EQNduLJ
	gR7cPcweudLHythjwj/CKGkQO1Mgb9cH4Qetv4R59ZKGF45L0+qFluIWdxm/JFLe0Cj8
	AEcK7htL05SJfDPu2jrKjr0Yv31BlUZFL8hZwkBCWxiVF5t1N4M0iSjlVGcnxiGTg/tk
	RAu1xwCL97VNAqhuYfnxBiDgYheMEAIVnL4i2ZrD8uMsJ+UlylI6yHck9ORjmPTmxC4T
	ZH9Q==
X-Gm-Message-State: AIkVDXKjzGHMcZlCNadI/MIAYaWl90pfkzIGu1QyBQds6xv8KmOTMS5wfxo7uYTFjdQn4vYqPJZWrGeFCGgnSC0j
X-Received: by 10.237.36.208 with SMTP id u16mr9487035qtc.105.1484156419133;
	Wed, 11 Jan 2017 09:40:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 11 Jan 2017 09:39:58 -0800 (PST)
In-Reply-To: <CAMKF1spXx4SSGzoDFtDZRV70FYSjZeSJ7hWOqvg_vJTC7mWVOw@mail.gmail.com>
References: <20170103015528.29635-1-raj.khem@gmail.com>
	<CAJTo0LYyvqUP+gE=mcbkgF9u7ZEqDPEQL15=M6gtr=AtKL33tw@mail.gmail.com>
	<CAMKF1sotQbOB9TMCDqa8cNhiD3QsKdgrQmVzHcw=yCbywzeROQ@mail.gmail.com>
	<CAJTo0LYXVGGnC5XtTA-LDE9oRLK0693xvBnE=11ab+KczbE1hw@mail.gmail.com>
	<CAMKF1sp3bgSVF0+1YLMGtOeQNOVs7XxcM=etkckgbN6-kBvNJA@mail.gmail.com>
	<CAJTo0LbXmAGizX72qZ9LqLUeugoUmb_bM-B8zg-SvLvdwqUaLQ@mail.gmail.com>
	<CAHiDW_FbM2goeKn8ZKY+LZO86tdpgESg8mfR1SiHAsBQRJRbCg@mail.gmail.com>
	<CAJTo0LZW4xH4yahk7tDXdPLueKf0B_PZHgUyYmW37_X6rKwpRw@mail.gmail.com>
	<CAMKF1spXx4SSGzoDFtDZRV70FYSjZeSJ7hWOqvg_vJTC7mWVOw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Jan 2017 17:39:58 +0000
Message-ID: <CAJTo0LZmzqCV9EmFiari-evc9bgcofcYPDMT8pn8bxCFz=oQ5Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Upgrade to 1.1.16+ on master
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
X-List-Received-Date: Wed, 11 Jan 2017 17:40:19 -0000
Content-Type: multipart/alternative; boundary=001a114104ce2763350545d51877

--001a114104ce2763350545d51877
Content-Type: text/plain; charset=UTF-8

On 11 January 2017 at 17:34, Khem Raj <raj.khem@gmail.com> wrote:

> > I'm pretty convinced that musl's if.h should be defining it.
>
> kernel does have a file to abstact the libc nuances
> uapi/linux/libc-compat.h
>
> sadly, it assumes that only libc linux kernel supports is glibc
> and that is what the problem is here.


musl's include/netinet/in.h already defines a bunch of __UAPI_DEF_* defines
(introduced in 04983f22), wouldn't this just be another one to add?

Ross

--001a114104ce2763350545d51877
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 January 2017 at 17:34, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><span class=3D"gmail-">&gt; I&#39;m pretty convi=
nced that musl&#39;s if.h should be defining it.<br>
<br>
</span>kernel does have a file to abstact the libc nuances<br>
uapi/linux/libc-compat.h<br>
<br>
sadly, it assumes that only libc linux kernel supports is glibc<br>
and that is what the problem is here.</blockquote></div><br>musl&#39;s incl=
ude/netinet/in.h already defines a bunch of __UAPI_DEF_* defines (introduce=
d in 04983f22), wouldn&#39;t this just be another one to add?</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114104ce2763350545d51877--
