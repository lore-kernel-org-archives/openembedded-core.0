Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 158C66017E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 10:20:06 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id n15so366049lbi.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Nov 2014 02:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=xaLFTzILLl8cavxdbw42ZFBqOTbZGZui0Z52mIp9FAY=;
	b=aKSPrmV+cZc3nQ9fOGgfjS92KgYJXq4oPk/lBdzqpB6HyApOiuzursqqzaHaHBTDzU
	A1cAWa2rXcALgD6CJfcZnrGpTta/NvUoJu11+ZYavJw5g+zHFvl98PQjbF1d50KaE5Ch
	31f+9Pgg7hzX7RYU9EToLUrAOYMI0uJqT5DX2ESytQZqLQQryyYNeMRbU5024qNGvANr
	GaXSAY3m4h0+aranjYewxrF5IaurK6Kbhb1MOI84rpN1nwBbQ9SZZe0zmPbcBHj4jnNt
	L+ZEgMkhXc7ZMa1++Q5NUq8tsNoClNnrYMgYJdYCDXkCZyWcxtrmqfTFsiMfqV02q8sL
	bpwA==
X-Gm-Message-State: ALoCoQnWSHg6s0nzFqva9IGr82grht3nvt0aNvQNpAD8JrfsA2rRcHCUeXHwmW/Kx8aHB5cPK0g7
MIME-Version: 1.0
X-Received: by 10.112.137.39 with SMTP id qf7mr65876442lbb.47.1415182806246;
	Wed, 05 Nov 2014 02:20:06 -0800 (PST)
Received: by 10.112.149.42 with HTTP; Wed, 5 Nov 2014 02:20:06 -0800 (PST)
In-Reply-To: <1415116498.23396.33.camel@ted>
References: <1414571901-17418-1-git-send-email-fathi.boudra@linaro.org>
	<CAJTo0LY+r2qFgFmOmEXda1brymM8wpAfYFywsDAfWNtuedC+Ng@mail.gmail.com>
	<1414753109.7649.91.camel@ted>
	<CAGNsrLDxfpu=X1k7CLREuQCe64z7UDhzQbt1S9rLvm4W5WogTg@mail.gmail.com>
	<CAJTo0LaWb6ck-KYn8N-AG47xAHNEB2QP-AjXiB+nuWYqjFewgg@mail.gmail.com>
	<CAGNsrLAPfA4=UH0GXkPeAmOx-GbJ7pnNF3gDaRixwNhNKw41og@mail.gmail.com>
	<1415116498.23396.33.camel@ted>
Date: Wed, 5 Nov 2014 12:20:06 +0200
Message-ID: <CAGNsrLCJF8KqQhRLEVA9VhMMbs6BexPM43+cDFdYd+Qj6ky4Dg@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: update to 20140828 release
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
X-List-Received-Date: Wed, 05 Nov 2014 10:20:10 -0000
Content-Type: multipart/alternative; boundary=089e011609cc7581a8050719ec58

--089e011609cc7581a8050719ec58
Content-Type: text/plain; charset=UTF-8

On 4 November 2014 17:54, Richard Purdie <richard.purdie@linuxfoundation.org
> wrote:

> On Tue, 2014-11-04 at 17:10 +0200, Fathi Boudra wrote:
> > after a lot of finger-pointing and implying we don't test our changes
> > or do our homework or do clean builds:
> > * I've built ltp for armv7a and armv8 on our builders and it works
> > fine
> > * I've built poky for x86 and it built fine
> >
> > here's my steps:
> > $ git clone git://git.yoctoproject.org/poky
> > $ cd poky
> > $ source oe-init-build-env
> > $ patch -p1 < 0001-ltp-update-to-20140828-release.patch
> > $ bitbake ltp
> >
> > $ ls -l tmp/deploy/rpm/i586/ltp-*
> > -rw-r--r-- 2 user user 55929600 Nov  4 16:28
> > tmp/deploy/rpm/i586/ltp-20140828-r0.i586.rpm
> > -rw-r--r-- 2 user user     3080 Nov  4 16:28
> > tmp/deploy/rpm/i586/ltp-dbg-20140828-r0.i586.rpm
> > -rw-r--r-- 2 user user     3264 Nov  4 16:28
> > tmp/deploy/rpm/i586/ltp-dev-20140828-r0.i586.rpm
> > -rw-r--r-- 2 user user    31884 Nov  4 16:28
> > tmp/deploy/rpm/i586/ltp-doc-20140828-r0.i586.rpm
> >
> > afaict, the failure isn't related to the changes submitted. Could you
> > be kind enough to try to reproduce the build failure outside of the
> > yocto autobuilders? or give me the exact steps to reproduce the
> > failure?
>
> bitbake libtirpc; bitbake ltp
>

It explains... the issue is triggered only if libtirpc is built before ltp.
It isn't the case when, on a clean build, you do only bitbake ltp or even
when you build core-image-minimal before ltp, without mentioning our
builders don't pull libtirpc either.

Patch v2 on its way. libtirpc wasn't detected until this latest release,
hence network/rpc test cases haven't been built until now and they are
broken upstream. Until, it's fixed upstream, I added a knob to disable
tirpc on configure like it's already done for numa. Fixing properly the
issue upstream might take a bit longer unfortunately.


>
> seems to reliably reproduce for me.
>

yes, in a particular configuration so I don't think we deserved your rant
from last week. Obviously, we've done the testing that would have been
expected from us. It's nice that the autobuilders caught this issue but
from a developer point of view, I don't build world but only the recipe
modified and that's a problem to not have a deterministic chain of build
dependencies when you use different configurations...


>
> Cheers,
>
> Richard
>
>
>
Cheers,
Fathi

--089e011609cc7581a8050719ec58
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 4 November 2014 17:54, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Tue, 2014-11-04 at 17:10 +=
0200, Fathi Boudra wrote:<br>
&gt; after a lot of finger-pointing and implying we don&#39;t test our chan=
ges<br>
&gt; or do our homework or do clean builds:<br>
&gt; * I&#39;ve built ltp for armv7a and armv8 on our builders and it works=
<br>
&gt; fine<br>
&gt; * I&#39;ve built poky for x86 and it built fine<br>
&gt;<br>
&gt; here&#39;s my steps:<br>
&gt; $ git clone git://<a href=3D"http://git.yoctoproject.org/poky" target=
=3D"_blank">git.yoctoproject.org/poky</a><br>
&gt; $ cd poky<br>
&gt; $ source oe-init-build-env<br>
&gt; $ patch -p1 &lt; 0001-ltp-update-to-20140828-release.patch<br>
&gt; $ bitbake ltp<br>
&gt;<br>
&gt; $ ls -l tmp/deploy/rpm/i586/ltp-*<br>
&gt; -rw-r--r-- 2 user user 55929600 Nov=C2=A0 4 16:28<br>
&gt; tmp/deploy/rpm/i586/ltp-20140828-r0.i586.rpm<br>
&gt; -rw-r--r-- 2 user user=C2=A0 =C2=A0 =C2=A03080 Nov=C2=A0 4 16:28<br>
&gt; tmp/deploy/rpm/i586/ltp-dbg-20140828-r0.i586.rpm<br>
&gt; -rw-r--r-- 2 user user=C2=A0 =C2=A0 =C2=A03264 Nov=C2=A0 4 16:28<br>
&gt; tmp/deploy/rpm/i586/ltp-dev-20140828-r0.i586.rpm<br>
&gt; -rw-r--r-- 2 user user=C2=A0 =C2=A0 31884 Nov=C2=A0 4 16:28<br>
&gt; tmp/deploy/rpm/i586/ltp-doc-20140828-r0.i586.rpm<br>
&gt;<br>
&gt; afaict, the failure isn&#39;t related to the changes submitted. Could =
you<br>
&gt; be kind enough to try to reproduce the build failure outside of the<br=
>
&gt; yocto autobuilders? or give me the exact steps to reproduce the<br>
&gt; failure?<br>
<br>
</div></div>bitbake libtirpc; bitbake ltp<br></blockquote><div><br></div><d=
iv>It explains... the issue is triggered only if libtirpc is built before l=
tp.</div><div>It isn&#39;t the case when, on a clean build, you do only bit=
bake ltp or even when you build core-image-minimal before ltp, without ment=
ioning our builders don&#39;t pull libtirpc either.</div><div><br></div><di=
v>Patch v2 on its way. libtirpc wasn&#39;t detected until this latest relea=
se, hence network/rpc test cases haven&#39;t been built until now and they =
are broken upstream. Until, it&#39;s fixed upstream, I added a knob to disa=
ble tirpc on configure like it&#39;s already done for numa. Fixing properly=
 the issue upstream might take a bit longer unfortunately.</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
<br>
seems to reliably reproduce for me.<br></blockquote><div><br></div><div>yes=
, in a particular configuration so I don&#39;t think we deserved your rant =
from last week. Obviously, we&#39;ve done the testing that would have been =
expected from us. It&#39;s nice that the autobuilders caught this issue but=
 from a developer point of view, I don&#39;t build world but only the recip=
e modified and that&#39;s a problem to not have a deterministic chain of bu=
ild dependencies when you use different configurations...</div><div>=C2=A0<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div>Cheers,</div><div>Fathi</div>
</div></div>

--089e011609cc7581a8050719ec58--
