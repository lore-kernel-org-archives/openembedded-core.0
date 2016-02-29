Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id B67C175CC2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 21:30:17 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l68so9614928wml.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 13:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=oUgkZSxyHUPb/qLW9M78jQwHj6aqI/JJL9swSApeV94=;
	b=GS2NGVjV2abhLAeQYiZPAQjEFPb6VJS2vYoOs1pWX1RVGniU4EeMUpnhYUS64nJ9gc
	+5ZU43LJaOQ1ngtGkiy4T2JAL/J2UQ0vHFFwwxqowqfgudGwIADJ+BXBm72Y5oiFMG5Q
	/im3Ylo11KJHdOYPvTixfJyDGMaKHR4xaUU6Bd7H75kG76CqYKlXEFjy1oT5QkP3Eilq
	6mbpFbOUv7Q4omJeqkEfsHP8w7nUFvhss98qMpMTzZTtrv6bKVB8emFz7Y/+d1TOg+4g
	gZbuOsZFu3mWi22D8216JPqHdtuILX9Ygn1+FDuT2B4gfEi7rmwoI87wPYwYJQPkUo9F
	rU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=oUgkZSxyHUPb/qLW9M78jQwHj6aqI/JJL9swSApeV94=;
	b=QSp+2uYS/frdr2vStSCSxSkblZl31WzjK9Xa/oXfe12xz3DQNIwO3k3KuSWNFEB54e
	RPM/CP3abla1V3LCeKdRCiMxlHDVEtuor2vPqnJQdJoCBCEebyXVCa+bBKy96xAXUKdN
	V5x8iJDtzzd8m/SumWydOhU8c1aGi4gEZSFueTWxVNrZDKsbOyq3wNegg5v+VF3S4CMd
	79aY8l6GcH1Lhb1Mnk+16SmNdvrXX4v4/XMx+rILw4Uf5ncw3obu33m+PH8fxClqJwFs
	oHlm3gwXTEKQUO2hRsPOFibbuWgkr/0m+FK4+oarqJTifgzM3Xn3oFA2hB2Sv8ctRwiA
	mozA==
X-Gm-Message-State: AD7BkJJsmc7LYLKfhkYF4IEQizw3h0pls2EVY9Ux9NZe5S6pfdAzLleusbiDCUucrZBTarOql9UFIPj/UUeLMQ==
MIME-Version: 1.0
X-Received: by 10.28.176.200 with SMTP id z191mr87262wme.91.1456781417578;
	Mon, 29 Feb 2016 13:30:17 -0800 (PST)
Received: by 10.194.58.176 with HTTP; Mon, 29 Feb 2016 13:30:17 -0800 (PST)
In-Reply-To: <CAJ86T=VFeZjULfZW3q06juYa90S8g93V7WhTB5Lgdhy+nJaprQ@mail.gmail.com>
References: <1456773039-5178-1-git-send-email-Martin.Jansa@gmail.com>
	<1456778449.11498.183.camel@linuxfoundation.org>
	<CAJTo0LZ6RabE0C2o4wjuKQRbgikjc3f+CH8RF=j4RdVP2nu=7w@mail.gmail.com>
	<CAJ86T=VFeZjULfZW3q06juYa90S8g93V7WhTB5Lgdhy+nJaprQ@mail.gmail.com>
Date: Mon, 29 Feb 2016 22:30:17 +0100
Message-ID: <CA+chaQfHZPKviheG2NY7miXe9YZir0pszp8qCQbb1kgzPABPDQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] no-static-libs.inc: add gdb
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
X-List-Received-Date: Mon, 29 Feb 2016 21:30:17 -0000
Content-Type: multipart/alternative; boundary=001a11412ba0e9090f052cef5a58

--001a11412ba0e9090f052cef5a58
Content-Type: text/plain; charset=UTF-8

No special configuration IIRC (will check tomorrow and send whole
config.log).

But it failed the same in my minimal chroot env with just oe-core and on
Ubuntu jenkins slave doing bitbake world with many layers, here is full log:
http://errors.yoctoproject.org/Errors/Details/38149/

and it shows --without-system-readline parameter.

On Mon, Feb 29, 2016 at 9:50 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Mon, Feb 29, 2016 at 12:43 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> >
> > On 29 February 2016 at 20:40, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >>
> >> I'm a bit puzzled as our autobuilders build this all the time and we
> >> don't see failures. Any idea what the configuration difference might
> >> be?
> >
> > Since oe-core 94e1b917078bedf73830e54278af77f742c93581 gdb has a
> > packageconfig for system readline, which is enabled by default (and has
> been
> > enabled explicitly for a long time).  Do you have some local patches
> adding
> > more PACKAGECONFIG options but not enabling readline?
>
> gdb 7.10.1 depends on readline features which are not present in
> readline 5.2 (ie the GPLv2 version). Using the gdb internal readline
> is a workaround for people who don't want to switch to the GPLv3
> version of readline.
>
> (Although gdb is itself GPLv3, it's self contained and easy to exclude
> from release builds).
>
> > Ross
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

--001a11412ba0e9090f052cef5a58
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No special configuration IIRC (will check tomorrow and sen=
d whole config.log).<div><br></div><div>But it failed the same in my minima=
l chroot env with just oe-core and on Ubuntu jenkins slave doing bitbake wo=
rld with many layers, here is full log:</div><div><a href=3D"http://errors.=
yoctoproject.org/Errors/Details/38149/">http://errors.yoctoproject.org/Erro=
rs/Details/38149/</a><br></div><div><br></div><div>and it shows=C2=A0<span =
style=3D"color:rgb(51,51,51);font-family:Monaco,Menlo,Consolas,&#39;Courier=
 New&#39;,monospace;font-size:13px;line-height:20px;white-space:pre-wrap;ba=
ckground-color:rgb(245,245,245)">--without-system-readline parameter.</span=
></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On M=
on, Feb 29, 2016 at 9:50 PM, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D=
"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon, Fe=
b 29, 2016 at 12:43 PM, Burton, Ross &lt;<a href=3D"mailto:ross.burton@inte=
l.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 29 February 2016 at 20:40, Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purd=
ie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m a bit puzzled as our autobuilders build this all the time =
and we<br>
&gt;&gt; don&#39;t see failures. Any idea what the configuration difference=
 might<br>
&gt;&gt; be?<br>
&gt;<br>
&gt; Since oe-core 94e1b917078bedf73830e54278af77f742c93581 gdb has a<br>
&gt; packageconfig for system readline, which is enabled by default (and ha=
s been<br>
&gt; enabled explicitly for a long time).=C2=A0 Do you have some local patc=
hes adding<br>
&gt; more PACKAGECONFIG options but not enabling readline?<br>
<br>
</span>gdb 7.10.1 depends on readline features which are not present in<br>
readline 5.2 (ie the GPLv2 version). Using the gdb internal readline<br>
is a workaround for people who don&#39;t want to switch to the GPLv3<br>
version of readline.<br>
<br>
(Although gdb is itself GPLv3, it&#39;s self contained and easy to exclude<=
br>
from release builds).<br>
<br>
&gt; Ross<br>
<span class=3D"HOEnZb"><font color=3D"#888888">&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
&gt;<br>
</font></span></blockquote></div><br></div>

--001a11412ba0e9090f052cef5a58--
