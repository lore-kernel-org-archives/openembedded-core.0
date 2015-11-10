Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id C103976F58
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:14:36 +0000 (UTC)
Received: by qgea14 with SMTP id a14so88642016qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 05:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=88CeUeyw7h1cUERSkj5dFN2p9+qmdXLji1+6gWxK5XM=;
	b=a39RfEA+swafwtIZh3NbrquzBK5EqLHS30UUoAlGM6TSo8wjBibHwr/p+GvnaFyi37
	axVW5wvBIRz2Bj9Mnqoc1w1ce2+pGk21nCLq91/04u6Ypu0K9TPyMb7UARk9n3tV7OqQ
	x/vBa+hggKkof7LIhX5TkDWOOG6N4GNGTNiA2K4LPu8NJXtzv0M1lTid6EwCpQm5OmjA
	/1SHCuKACgLvgu7O3p0bjVEo/VwLIE7E1YyXt0TOvDbA3cO3jhCBpib8OqcbSpIObPJZ
	JPs2HVAPYAZydnrKP3tJSFdZAKAEsnKQX0OFrnV2GpRCoisle2fRpqlvXU1Aw9EDaNZV
	5knA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=88CeUeyw7h1cUERSkj5dFN2p9+qmdXLji1+6gWxK5XM=;
	b=ZpWqOdmLG/nrrjy+KjPB5dEPGHiwgvYyuvGsX+zfgS2BKikOUr+wyzHT4DlV07lyOP
	kA2eYfrNgT+p653zix2u8KS9aZw2CJdr2mtm7QpaGdhaT2SduX17WT/dlMDJPEgdw3jF
	GvMqv9Qxh+YKj6jbSNpUogkrF78TEnxgzCyvKRJhaeQ8OxcrtF93rUTaczx3s85mTQm3
	3PhkLyU+FVGydoI1kI74/QA6dah2sMj1M8BX0NqcZK3Rw8Tm4y8jRWxKWSiuQvN1pC3V
	0s1RjPcMkM2TjuaRh+MDqRvnypsFn6rPdPHp2+dghgguuQnCycKcJEbaylxTA3zvo0H+
	HBtw==
X-Gm-Message-State: ALoCoQkrz6ySyusgcZsvZixvsLzG4C5cTbbg4QazkN7/45gYRujt97fQ8px/0BQ+W7rlZpA4/DE6
X-Received: by 10.140.218.84 with SMTP id o81mr4030439qhb.22.1447161276363;
	Tue, 10 Nov 2015 05:14:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Tue, 10 Nov 2015 05:14:11 -0800 (PST)
In-Reply-To: <E909DBB3-5F90-4E81-949D-93E7D3960988@gmail.com>
References: <6A0E85DF-31B7-4955-B4A2-0F3E099FCF99@gmail.com>
	<CAJTo0Lb7w0XAJ-H-T2Uz-mdmjUZGFX9wQyzCUJ_4bU8re9rswQ@mail.gmail.com>
	<A2AEDEA2-FB1D-4D6F-8B2F-F420AC123C9B@gmail.com>
	<CAJTo0LYOMeiaie9=3i908aAj3H4U0_qSdf7RmXSofosBMzcW9w@mail.gmail.com>
	<E909DBB3-5F90-4E81-949D-93E7D3960988@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Nov 2015 13:14:11 +0000
Message-ID: <CAJTo0LYqWk_2oqjFxZ44b+yAfAq8c_a1QiCH5erFKTmFvxg-Kw@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Update libusb1 from 1.0.19 to 1.0.20
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
X-List-Received-Date: Tue, 10 Nov 2015 13:14:36 -0000
Content-Type: multipart/alternative; boundary=001a113734b4cfb1e705242f7dff

--001a113734b4cfb1e705242f7dff
Content-Type: text/plain; charset=UTF-8

On 10 November 2015 at 09:14, Jens Rehsack <rehsack@gmail.com> wrote:

> Since I couldn't reproduce it (on a 12-core machine using different -j
> settings),
> I proved the Makefile.am and resulting Makefile - looks fine for me,
> libusb-1.0.la
> has among other things ...linux-netlink.lo as dependency.
>

I can't see anything obviously wrong with the makefile.  I'll merge it and
give it another run on the AB.

Ross

--001a113734b4cfb1e705242f7dff
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 November 2015 at 09:14, Jens Rehsack <span dir=3D"ltr">&lt;<a href=3D=
"mailto:rehsack@gmail.com" target=3D"_blank">rehsack@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":5j2" class=3D"a3s" =
style=3D"overflow:hidden">Since I couldn&#39;t reproduce it (on a 12-core m=
achine using different -j settings),<br>
I proved the Makefile.am and resulting Makefile - looks fine for me, <a hre=
f=3D"http://libusb-1.0.la" rel=3D"noreferrer" target=3D"_blank">libusb-1.0.=
la</a><br>
has among other things ...linux-netlink.lo as dependency.</div></blockquote=
><div><br></div><div>I can&#39;t see anything obviously wrong with the make=
file.=C2=A0 I&#39;ll merge it and give it another run on the AB.</div><div>=
<br></div><div>Ross=C2=A0</div></div><br></div></div>

--001a113734b4cfb1e705242f7dff--
