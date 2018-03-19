Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3A98078960
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 17:24:06 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id l12so21708804ioc.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 10:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z2fi9TtsC2jklPi6X3WOkuxoxbQ2fD2AwQY9uZW1aDk=;
	b=t6aXDjoTCl3RFY0x139tV+RuHBeIpFmJeujhTP8ceL6MIT9R+dN6CZR472FcvrI3pA
	QzcrTkyk2ic2w5vWcM4cE/fZ5C0n3l0ouhRv69RLhzvr2HCcJgdG5dcEKVPxENYr/jlt
	hLbeoYi89/hdUIchfD7TRHa2Qdt8EYRizcBxkMKKSMGAaE56yb3HaGU1pUdOKhasvz5I
	BaX9smcOf9DKLTeNoc8IdebgBHAd1y300C74/xyzS124QBwfeugSkoEvze5XCAhK1wZO
	WgKBQUOriQgwHGXo9AEJ4FyHllES5x1iZXaOYGBN+gSj30hymvXxtYcoecXtSoN4eQKv
	GoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z2fi9TtsC2jklPi6X3WOkuxoxbQ2fD2AwQY9uZW1aDk=;
	b=K5At41PEf7lo53+mwpwQQUEycv21Q0Umy0yPVddr8AAQ+F+MB6XEkzvVapxfiwiDH6
	1E1DZ/LZZP9l/Y3n85Ha1Wod1nNS5bEGVJVZpgwGBtVOUxZz3wI+fSEmNfvZ2ECQmdLu
	42e2rChZR1Lbm6QtNgAHFfoXlh7izetNgAmS4o8Wy9eLdSIP4WyfUDYfmk/N1zleDhFL
	WXiHW4bhHIZEOjw0omSkwCdg9lcMipT+WBDS5x0gLW/EtjMnbkKyh6D1kz8GJXNViItV
	Cn3Y3IeYA1LV29VOiUF1Yw6Wowrjdtr6fNCQhfjQGRI3reuoDiBT8mIcvgw5Qmx4+pkx
	x2DQ==
X-Gm-Message-State: AElRT7GG3U7J0yYwqXA96C06Z3bGBccOHi27TovP8cJuQXEGbpeXktkz
	O9nJ64BtElslhIFvOqxFpNmJLbFTMRTUu2uMvB1IKg==
X-Google-Smtp-Source: AG47ELvdK5q283nzUHHzPKyDt/f4TqvzXfh1+dcYOO4OjdxmnxEkq+bS0118D2WjnhsLC3YxR6I1V5o4t8WLjVUzfss=
X-Received: by 10.107.37.212 with SMTP id l203mr12424195iol.20.1521480248125; 
	Mon, 19 Mar 2018 10:24:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 19 Mar 2018 10:23:46 -0700 (PDT)
In-Reply-To: <CAMKF1sq4eFjSXeKy2HYkXhNE5yWRWPF2vjji9sbYhXDJ0S_dyg@mail.gmail.com>
References: <cover.1521257828.git.raj.khem@gmail.com>
	<19ff9542e08c7df5898cc811f65200050ecf02d5.1521257828.git.raj.khem@gmail.com>
	<CAJTo0LZ0Mqnpu+021rDroBnVWKB-zbdC+Q35XXwQpb12_FYHNQ@mail.gmail.com>
	<CAMKF1sq4eFjSXeKy2HYkXhNE5yWRWPF2vjji9sbYhXDJ0S_dyg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Mar 2018 17:23:46 +0000
Message-ID: <CAJTo0Lb5P916LL80z3vBk-mT-a0-orEqarLi4es__Soy3jt6sw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] x264: Use updated gnu-config artifacts
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
X-List-Received-Date: Mon, 19 Mar 2018 17:24:07 -0000
Content-Type: multipart/alternative; boundary="001a11405f16b933db0567c73913"

--001a11405f16b933db0567c73913
Content-Type: text/plain; charset="UTF-8"

On 19 March 2018 at 16:54, Khem Raj <raj.khem@gmail.com> wrote:

> this only works if the system uses autotools
> in full respect. x264 has a hand woven configure
> but rely on other parts of autotools. So we have to
> stay with proposed solution.
>

gnu-configize should be sufficiently dumb that it should work in
non-autotools trees, did it give you an error message?

Ross

--001a11405f16b933db0567c73913
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 19 March 2018 at 16:54, Khem Raj <span dir=3D"ltr">&lt;=
<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com<=
/a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">this only works if the system uses autot=
ools<br>
in full respect. x264 has a hand woven configure<br>
but rely on other parts of autotools. So we have to<br>
stay with proposed solution.<br></blockquote><div><br></div><div>gnu-config=
ize should be sufficiently dumb that it should work in non-autotools trees,=
 did it give you an error message?</div><div><br></div><div>Ross=C2=A0</div=
></div></div></div>

--001a11405f16b933db0567c73913--
