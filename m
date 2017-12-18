Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id BC86B78258
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 21:07:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1513631265; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=Gj+Bkeh0XEZm3v6guioCYjrmm36755dGlvnpMjNIvyQ=;
	b=bA/Tp8UUgV6K3vkjPAYs4F+cHael8L+anEq293+vaN/cS3Ovo4PtqJdNZ0jXFSlkq5xxTzHB
	mBsrqiKsY3YHKaBSaODq+tqu1dDmiSkbY77g+rKJgUCAzTm+WiT65D18Gk8EvwbotSn8eWD0
	qQ5PRRk6WDA6Wlo4ZT+a3JhwY7s=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
Sender: derek@asterius.io
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mxa.mailgun.org with ESMTP id 5a382e21.7fc858738630-smtp-out-n01;
	Mon, 18 Dec 2017 21:07:45 -0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id g10so21726908qtj.12;
	Mon, 18 Dec 2017 13:07:45 -0800 (PST)
X-Gm-Message-State: AKGB3mI7ML/2oG2oy5xjvolYKYU5n8p9sZIzQQHnjOwdqy0JigHJFKqz
	YS+ePpRNj7RXVZctCI1I/afMvnP03dWgw30sUiA=
X-Google-Smtp-Source: ACJfBosxDmM7mT4Ay7ypf2k0Q0lbYi1Z+zF5/K2rvbXIC8kPcV/G2BHHYpb0VnxURAwpGAibuOSmjBQWHr2O6LzxY+c=
X-Received: by 10.200.15.155 with SMTP id b27mr1646699qtk.151.1513631264643;
	Mon, 18 Dec 2017 13:07:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.177 with HTTP; Mon, 18 Dec 2017 13:07:44 -0800 (PST)
In-Reply-To: <20171218210256.GQ27580@vctlabs.com>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
	<CAPuovEKdqQP35XwP3bgBrE4EFbM2LwpHrHzxF3my9qaWfAaCbA@mail.gmail.com>
	<CABcZANku-aE5a69GpJxXmd2F0+uYVhiRZB3Uut7F2RG1e3R9EA@mail.gmail.com>
	<CAPuovEJNf=qefXX6wKJGaH+HkM6aan49AgVQ3TEWVWPSCn3cNw@mail.gmail.com>
	<711527ad-77fa-947f-2186-1d7835e1783e@linux.intel.com>
	<CAPuovE+yd0kA_MmT4GuqXgvNDASsKLszL4uiypKDSa31icwgXg@mail.gmail.com>
	<CADNbA1psOtOeCcsLaSM4VWJV5PXqe=HmE9BuxcR4UYkJp5Erdw@mail.gmail.com>
	<20171218210256.GQ27580@vctlabs.com>
From: Derek Straka <derek@asterius.io>
Date: Mon, 18 Dec 2017 16:07:44 -0500
X-Gmail-Original-Message-ID: <CADNbA1qZ=m2MwE78Er4MjBr3jEcQtgE+a4Z-FCDWxLSw1Tc=Eg@mail.gmail.com>
Message-ID: <CADNbA1qZ=m2MwE78Er4MjBr3jEcQtgE+a4Z-FCDWxLSw1Tc=Eg@mail.gmail.com>
To: "S. Lockwood-Childs" <sjl@vctlabs.com>, Derek Straka <derek@asterius.io>, 
	Mark Asselstine <mark.asselstine@windriver.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH] python-pyroute2: uprev to v0.4.21 (from 0.3.22)
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
X-List-Received-Date: Mon, 18 Dec 2017 21:07:45 -0000
Content-Type: multipart/alternative; boundary="94eb2c046dded9a00a0560a3bda1"

--94eb2c046dded9a00a0560a3bda1
Content-Type: text/plain; charset="UTF-8"

I also need to look at the UPSTREAM_CHECK_URI for this recipe since it
isn't finding the latest version and telling me to update the package.

On Mon, Dec 18, 2017 at 4:02 PM, S. Lockwood-Childs <sjl@vctlabs.com> wrote:

> On Mon, Dec 18, 2017 at 03:17:25PM -0500, Derek Straka wrote:
> > I have several customers who have optimized for space and would like to
> see
> > the capability maintained unless core removes the ability to split python
> > packages out.  They also remove the *.py files in favor of *.pyo files
> (via
> > a custom packaging mechanism).  I have automated tests that go through
> the
> > module importing on each of the meta-python packages to ensure it works
> on
> > minimal python installations.  When other contributors don't do provide
> > that functionality, I either catch it when I do package update or when it
> > breaks for one of my customers.  I'm fine if you don't want to perform
> the
> > checks yourself and it breaks my use case with missing dependencies, but
> I
> > would prefer that you don't remove the dependencies that are currently in
> > place.  Thanks.
>
> Me too -- some of my projects still use NAND for rootfs, where space is
> tight and
> ability to split out python modules is very useful. Thus it is not an
> unused
> feature, though many projects have SD/eMMC for rootfs and those ones
> generally
> will not care about it.
>

--94eb2c046dded9a00a0560a3bda1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I also need to look at the=C2=A0<span style=3D"font-size:1=
2.8px">UPSTREAM_CHECK_URI for this recipe since it isn&#39;t finding the la=
test version and telling me to update the package.</span></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Dec 18, 2017 at 4:0=
2 PM, S. Lockwood-Childs <span dir=3D"ltr">&lt;<a href=3D"mailto:sjl@vctlab=
s.com" target=3D"_blank">sjl@vctlabs.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><span class=3D"">On Mon, Dec 18, 2017 at 03:17:25PM -=
0500, Derek Straka wrote:<br>
&gt; I have several customers who have optimized for space and would like t=
o see<br>
&gt; the capability maintained unless core removes the ability to split pyt=
hon<br>
&gt; packages out.=C2=A0 They also remove the *.py files in favor of *.pyo =
files (via<br>
&gt; a custom packaging mechanism).=C2=A0 I have automated tests that go th=
rough the<br>
&gt; module importing on each of the meta-python packages to ensure it work=
s on<br>
&gt; minimal python installations.=C2=A0 When other contributors don&#39;t =
do provide<br>
&gt; that functionality, I either catch it when I do package update or when=
 it<br>
&gt; breaks for one of my customers.=C2=A0 I&#39;m fine if you don&#39;t wa=
nt to perform the<br>
&gt; checks yourself and it breaks my use case with missing dependencies, b=
ut I<br>
&gt; would prefer that you don&#39;t remove the dependencies that are curre=
ntly in<br>
&gt; place.=C2=A0 Thanks.<br>
<br>
</span>Me too -- some of my projects still use NAND for rootfs, where space=
 is tight and<br>
ability to split out python modules is very useful. Thus it is not an unuse=
d<br>
feature, though many projects have SD/eMMC for rootfs and those ones genera=
lly<br>
will not care about it.<br>
</blockquote></div><br></div>

--94eb2c046dded9a00a0560a3bda1--
