Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id C313077193
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 08:10:58 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id e72so214580454oib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jun 2016 01:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/eXqqGUQRixo2WQz5JzRamFUoeN4do9qcyOh1w5irUA=;
	b=v5uEvglSgUUIazNl4HDwDtJyIdccLl0yHSSAlTcsAntxNUgXApySc8okLF68kKkwpC
	mV37MqdCznh1C0lunyxAAFBvhcmw4f6Rxr+mCMa91SahEb/b23rwVmxbs06Y1fjlRsCe
	8Zbhg74sQuXWzKtD3RMKlSlYukL3B7Akr1HMeoCHYTKWvDyjGuDNMRU/Q01xDJv2QScd
	5JDiD+HDMxRh75UUK8pRRIlcPiVITWig/j7uvIfG7OAOfFKnKVEeEdCq/0c6iw64DbG8
	/NFduDY7qLZrFVs/MX1dHktTHZ824XhF3jcmnnqVbYwzMkYqrTmA2ziGm7A5Rf65p5r3
	bbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/eXqqGUQRixo2WQz5JzRamFUoeN4do9qcyOh1w5irUA=;
	b=EBqDDPPGMb6FdpHFlX8O2PU3/4Tb5qL8sfAHIPTVEnI3p6d/sbQj6yH3enwwtVDO7j
	a4lZMeuviSEdvDZplFVP1XRFR8kK5i1gVpq+cDzeaRIrwhU5SXaKb5wPmY+0EoBIpd0D
	nDRwQLhGCxCIJUGi1XjE6ZPDzLHM1YdguoBr3EkUtkg8QV2WSJiGkQ8TqIxLQ39pbOLg
	BtQKvKt3v8WeK0+9jnHKwoEsHNeskGOBUVjBCxJ/ecTZim9n5vPTq7Z6UCzJW4QNHs3f
	Atotzub7I35HLn+SpxYKj84r7JkXRdma3ae3/o1zY/JtPTviGD3TVfiYFWCJIkOrAQ1l
	kr7g==
X-Gm-Message-State: ALyK8tK3Zzoe7mUBDySaTCihFoo7U4XP/0x7y76M1Tl+abYcj5a0qtsHSCJBkJxoIbab7hve4wMKd3YFLtrO+iu5
X-Received: by 10.157.36.98 with SMTP id p89mr8377715ota.119.1465200659277;
	Mon, 06 Jun 2016 01:10:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Mon, 6 Jun 2016 01:10:28 -0700 (PDT)
In-Reply-To: <CAFUnDm_LEnNqq3ebvHqN8hw1o1XeBvwhH2693tg97d-hmQKytA@mail.gmail.com>
References: <CAFUnDm_LEnNqq3ebvHqN8hw1o1XeBvwhH2693tg97d-hmQKytA@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 6 Jun 2016 11:10:28 +0300
Message-ID: <CAHiDW_FuKKMiMBQOJGcbNqMmYrg6ZqGF1sS__x0MJdBCyXdFHw@mail.gmail.com>
To: mubin syed <mubin10@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: LICENCE file for LLVM based recipes
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
X-List-Received-Date: Mon, 06 Jun 2016 08:11:02 -0000
Content-Type: multipart/alternative; boundary=001a113d1684d241e40534979c0b

--001a113d1684d241e40534979c0b
Content-Type: text/plain; charset=UTF-8

On 6 June 2016 at 10:32, mubin syed <mubin10@gmail.com> wrote:
>
> Hi,
>
> I am trying to write recipe for dhrystone benchmarks, it is LLVM licensed
benchmarks.
> I went through some of the LLVM recipes, they are using NCSA license
files(not using explicit
> LLVM license files).

LLVM license is named "the university of Illinois/NCSA" license. If you've
found a difference between the license body found in oe-core
common-licenses and what upstream llvm uses, I think you'll have to point
it out specifically.

> Please let me know, which license file  i need to use for dhrystone(i.e.
LLVM licensed benchmark) recipe.

You may want to include a link to the actual license file upstream uses if
you want someone to comment on it.

 - Jussi

--001a113d1684d241e40534979c0b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 6 June 2016 at 10:32, mubin syed &lt;<a href=3D"mailto:=
mubin10@gmail.com">mubin10@gmail.com</a>&gt; wrote:<br>&gt;<br>&gt; Hi,<br>=
&gt;<br>&gt; I am trying to write recipe for dhrystone benchmarks, it is LL=
VM licensed benchmarks.<br>&gt; I went through some of the LLVM recipes, th=
ey are using NCSA license files(not using explicit<br>&gt; LLVM license fil=
es).<br><br>LLVM license is named &quot;the university of Illinois/NCSA&quo=
t; license. If you&#39;ve found a difference between the license body found=
 in oe-core common-licenses and what upstream llvm uses, I think you&#39;ll=
 have to point it out specifically.<br><br>&gt; Please let me know, which l=
icense file =C2=A0i need to use for dhrystone(i.e. LLVM licensed benchmark)=
 recipe.<br><br>You may want to include a link to the actual license file u=
pstream uses if you want someone to comment on it.<br><br>=C2=A0- Jussi</di=
v>

--001a113d1684d241e40534979c0b--
