Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 1DDF27841C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 21:27:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1513632473; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=so8f7alzO/uQ/yETWrwDaoKpX9EJLB8lL6nbObRneh4=;
	b=OYfyy+CzPggRUNfFiSQQylQFiSKC59n0/B7W6l7+wri8acAWadYVloFiD4NhRm2XBuys3Go5
	XcxxGCBh7B8r/vWMXuWnDczk5MC7qRhPJYhEJQ3qb7GXKJee2WvjOSIMwv8A0byjInXL5m/h
	lR3mF+cCzvUrqR7d89c1rf1weFI=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
Sender: derek@asterius.io
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mxa.mailgun.org with ESMTP id 5a3832d9.7f74280d0ef0-smtp-out-n03;
	Mon, 18 Dec 2017 21:27:53 -0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id i40so21830750qti.8;
	Mon, 18 Dec 2017 13:27:52 -0800 (PST)
X-Gm-Message-State: AKGB3mLP9NGdC7kXvdrCFinY+ES4acC+d+puEEAIdVvYbDBLRKMktzLw
	gr1fywRK5kIkXbZj1+6TNza8oM9/SO/phhxXoQ4=
X-Google-Smtp-Source: ACJfBos9vnJwH2tXjb+eRDMPGpuOAODR08cvvdC1myBLGK0qRXamlInb7lhQiGNNsaYu/PUzhLZZ/UtZQmzj4GzdzKE=
X-Received: by 10.200.15.76 with SMTP id l12mr1689263qtk.225.1513632472049;
	Mon, 18 Dec 2017 13:27:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.177 with HTTP; Mon, 18 Dec 2017 13:27:51 -0800 (PST)
In-Reply-To: <3152872.oFNfv7Rrbj@yow-masselst-lx1>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<20171218210256.GQ27580@vctlabs.com>
	<CADNbA1qZ=m2MwE78Er4MjBr3jEcQtgE+a4Z-FCDWxLSw1Tc=Eg@mail.gmail.com>
	<3152872.oFNfv7Rrbj@yow-masselst-lx1>
From: Derek Straka <derek@asterius.io>
Date: Mon, 18 Dec 2017 16:27:51 -0500
X-Gmail-Original-Message-ID: <CADNbA1rSmj=3u4nR_860wKv0L90ye6kZru0PpbVQWvrMWk0j0w@mail.gmail.com>
Message-ID: <CADNbA1rSmj=3u4nR_860wKv0L90ye6kZru0PpbVQWvrMWk0j0w@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "S. Lockwood-Childs" <sjl@vctlabs.com>,
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
X-List-Received-Date: Mon, 18 Dec 2017 21:27:52 -0000
Content-Type: multipart/alternative; boundary="94eb2c089f7ad12cb00560a40554"

--94eb2c089f7ad12cb00560a40554
Content-Type: text/plain; charset="UTF-8"

Go ahead and do a v2, it was more of a reminder for me.

On Mon, Dec 18, 2017 at 4:26 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> On Monday, December 18, 2017 4:07:44 PM EST Derek Straka wrote:
> > I also need to look at the UPSTREAM_CHECK_URI for this recipe since it
> > isn't finding the latest version and telling me to update the package.
>
> Odd. Let me know how it goes. If it is easier for you to make the changes
> locally and complete the merge go for it.
>
> Mark
>
> >
> > On Mon, Dec 18, 2017 at 4:02 PM, S. Lockwood-Childs <sjl@vctlabs.com>
> wrote:
> > > On Mon, Dec 18, 2017 at 03:17:25PM -0500, Derek Straka wrote:
> > > > I have several customers who have optimized for space and would like
> to
> > >
> > > see
> > >
> > > > the capability maintained unless core removes the ability to split
> > > > python
> > > > packages out.  They also remove the *.py files in favor of *.pyo
> files
> > >
> > > (via
> > >
> > > > a custom packaging mechanism).  I have automated tests that go
> through
> > >
> > > the
> > >
> > > > module importing on each of the meta-python packages to ensure it
> works
> > >
> > > on
> > >
> > > > minimal python installations.  When other contributors don't do
> provide
> > > > that functionality, I either catch it when I do package update or
> when
> > > > it
> > > > breaks for one of my customers.  I'm fine if you don't want to
> perform
> > >
> > > the
> > >
> > > > checks yourself and it breaks my use case with missing dependencies,
> but
> > >
> > > I
> > >
> > > > would prefer that you don't remove the dependencies that are
> currently
> > > > in
> > > > place.  Thanks.
> > >
> > > Me too -- some of my projects still use NAND for rootfs, where space is
> > > tight and
> > > ability to split out python modules is very useful. Thus it is not an
> > > unused
> > > feature, though many projects have SD/eMMC for rootfs and those ones
> > > generally
> > > will not care about it.
>
>

--94eb2c089f7ad12cb00560a40554
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Go ahead and do a v2, it was more of a reminder for me.</d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Dec 18=
, 2017 at 4:26 PM, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:=
mark.asselstine@windriver.com" target=3D"_blank">mark.asselstine@windriver.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"=
">On Monday, December 18, 2017 4:07:44 PM EST Derek Straka wrote:<br>
&gt; I also need to look at the UPSTREAM_CHECK_URI for this recipe since it=
<br>
&gt; isn&#39;t finding the latest version and telling me to update the pack=
age.<br>
<br>
</span>Odd. Let me know how it goes. If it is easier for you to make the ch=
anges<br>
locally and complete the merge go for it.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Mark<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; On Mon, Dec 18, 2017 at 4:02 PM, S. Lockwood-Childs &lt;<a href=3D"mai=
lto:sjl@vctlabs.com">sjl@vctlabs.com</a>&gt; wrote:<br>
&gt; &gt; On Mon, Dec 18, 2017 at 03:17:25PM -0500, Derek Straka wrote:<br>
&gt; &gt; &gt; I have several customers who have optimized for space and wo=
uld like to<br>
&gt; &gt;<br>
&gt; &gt; see<br>
&gt; &gt;<br>
&gt; &gt; &gt; the capability maintained unless core removes the ability to=
 split<br>
&gt; &gt; &gt; python<br>
&gt; &gt; &gt; packages out.=C2=A0 They also remove the *.py files in favor=
 of *.pyo files<br>
&gt; &gt;<br>
&gt; &gt; (via<br>
&gt; &gt;<br>
&gt; &gt; &gt; a custom packaging mechanism).=C2=A0 I have automated tests =
that go through<br>
&gt; &gt;<br>
&gt; &gt; the<br>
&gt; &gt;<br>
&gt; &gt; &gt; module importing on each of the meta-python packages to ensu=
re it works<br>
&gt; &gt;<br>
&gt; &gt; on<br>
&gt; &gt;<br>
&gt; &gt; &gt; minimal python installations.=C2=A0 When other contributors =
don&#39;t do provide<br>
&gt; &gt; &gt; that functionality, I either catch it when I do package upda=
te or when<br>
&gt; &gt; &gt; it<br>
&gt; &gt; &gt; breaks for one of my customers.=C2=A0 I&#39;m fine if you do=
n&#39;t want to perform<br>
&gt; &gt;<br>
&gt; &gt; the<br>
&gt; &gt;<br>
&gt; &gt; &gt; checks yourself and it breaks my use case with missing depen=
dencies, but<br>
&gt; &gt;<br>
&gt; &gt; I<br>
&gt; &gt;<br>
&gt; &gt; &gt; would prefer that you don&#39;t remove the dependencies that=
 are currently<br>
&gt; &gt; &gt; in<br>
&gt; &gt; &gt; place.=C2=A0 Thanks.<br>
&gt; &gt;<br>
&gt; &gt; Me too -- some of my projects still use NAND for rootfs, where sp=
ace is<br>
&gt; &gt; tight and<br>
&gt; &gt; ability to split out python modules is very useful. Thus it is no=
t an<br>
&gt; &gt; unused<br>
&gt; &gt; feature, though many projects have SD/eMMC for rootfs and those o=
nes<br>
&gt; &gt; generally<br>
&gt; &gt; will not care about it.<br>
<br>
</div></div></blockquote></div><br></div>

--94eb2c089f7ad12cb00560a40554--
