Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 994B471014
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 12:32:05 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id c9so3650667qcz.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Dec 2014 04:32:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XuiZm7/GJPITSOcaLexLjPXEGzZoaj6bpjeTXIZMOu4=;
	b=Zo2+metZ1rDrGd+oKzBGvjGdmTbfTqQ4kCAYSYbFBp1Ws3g3BFvBPtnewCzVZIyxi2
	0aFmXAE4WsqoBfz8ehbXFTTWRhdDEuhA0xud/MeuW8vcR1w3Xc82eiIltGW8fJ5Q1QAP
	5zZGO+HSs9ZpyjiyEN4ry1Y1JDBYCH+pb6hWymKieh3hQbZWTd2nBIDCW4gpmoRILO5M
	3FfQ+JtzDUcdgvHiqcr68C8iVeJ3yY9bIeBaEoD1w0Am+5woV0IRlCqiiac8YGej4N57
	Ijv6IdY4sWStAZ9ftilzeA0H8cmoFq2DlqnA2Euuczn0fUevCgaNsYDLmNlHthSrNiip
	uqbw==
X-Gm-Message-State: ALoCoQkaf3EYiDc5jTv0hfKzh8yVVtGMIA4QwtoNax4bSiUY/ReC5dOY7H0Dp91QzBMnPjuNmla+
X-Received: by 10.224.3.137 with SMTP id 9mr19715141qan.64.1418301126274; Thu,
	11 Dec 2014 04:32:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 11 Dec 2014 04:31:45 -0800 (PST)
In-Reply-To: <20141211121417.GB2467@jama>
References: <20141211092332.GA2467@jama>
	<CAJTo0LYwYW40XvxNN=rY4z6fK+4NJ2ZFxa2xsUvuspERa_MT+A@mail.gmail.com>
	<20141211121417.GB2467@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Dec 2014 12:31:45 +0000
Message-ID: <CAJTo0LYEvdspWOu=_LQTtD6xZTFZvHTyZpwQOEXbtpbSnPE-5Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, test-dependencies 2014-12-11
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
X-List-Received-Date: Thu, 11 Dec 2014 12:32:07 -0000
Content-Type: multipart/alternative; boundary=001a11c2480ad113d10509eff621

--001a11c2480ad113d10509eff621
Content-Type: text/plain; charset=UTF-8

On 11 December 2014 at 12:14, Martin Jansa <martin.jansa@gmail.com> wrote:

> > > WARN: gst-plugins-bad: gst-plugins-bad-meta rdepends on
> > > gst-plugins-bad-rtmp, but it isn't a build dependency?
> > > ERROR: gst-plugins-bad: gst-plugins-bad-rtmp package isn't created when
> > > building with minimal dependencies?
> > > ERROR: gst-plugins-bad: gst-plugins-bad-rtmp-dev package isn't created
> > > when building with minimal dependencies?
> > >
> >
> > Coincidently last night my world run gave me warnings that
> > gst-plugins-bad-rtmp was depending on rtmpdump without a build depends,
> so
> > I've copied the PACKAGECONFIG[rtmp] from gstreamer1.0-plugins-bad to
> > gst-plugins-bad.  Presumably this will fix these errors, although that
> > warning seems odd.
>
> Why odd? It just means that gst-plugins-bad-rtmp* packages aren't
> created at all when rtmp isn't autodetected.


But gst-plugins-bad-meta won't depend on -rtmp when rtmp isn't detected as
the splitting is dynamically done.

Ross

--001a11c2480ad113d10509eff621
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 December 2014 at 12:14, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb =
adM"><div class=3D"">&gt; &gt; WARN: gst-plugins-bad: gst-plugins-bad-meta =
rdepends on<br>
&gt; &gt; gst-plugins-bad-rtmp, but it isn&#39;t a build dependency?<br>
&gt; &gt; ERROR: gst-plugins-bad: gst-plugins-bad-rtmp package isn&#39;t cr=
eated when<br>
&gt; &gt; building with minimal dependencies?<br>
&gt; &gt; ERROR: gst-plugins-bad: gst-plugins-bad-rtmp-dev package isn&#39;=
t created<br>
&gt; &gt; when building with minimal dependencies?<br>
&gt; &gt;<br>
&gt;<br>
&gt; Coincidently last night my world run gave me warnings that<br>
&gt; gst-plugins-bad-rtmp was depending on rtmpdump without a build depends=
, so<br>
&gt; I&#39;ve copied the PACKAGECONFIG[rtmp] from gstreamer1.0-plugins-bad =
to<br>
&gt; gst-plugins-bad.=C2=A0 Presumably this will fix these errors, although=
 that<br>
&gt; warning seems odd.<br>
<br>
</div></div>Why odd? It just means that gst-plugins-bad-rtmp* packages aren=
&#39;t<br>
created at all when rtmp isn&#39;t autodetected.</blockquote></div><br>But =
gst-plugins-bad-meta won&#39;t depend on -rtmp when rtmp isn&#39;t detected=
 as the splitting is dynamically done.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--001a11c2480ad113d10509eff621--
