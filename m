Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id A3BB365CBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 16:30:54 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id i75so4369667ioa.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tt1qypC+u9reid+MlT/nXrSOPmVK3OesiZZZTaUxprY=;
	b=tkJTxrbwLDYshPvU46JevdVCfIZJMWJbPWafL/2hiz3dfdKH1jlZ/mnFPj322ajHko
	w95Uh2tXuwlZIn7vu+6i/yibvqW6zgYKb074wKBEbAdHS1KloHKUELRcQX8gdVhZ8AXy
	GIJ84yzIhPeFnMWBxCqoseRTwSe1M4Tbf+CoSi8FxX2a03R9vz3eXP76wewWjMJq+Z3o
	mdiIj2XM26BpTrEddqtSAbVHdL0f5BABndo2xcOFhGjCb3EHeKv7GkrLMIcymxGLHEFH
	Q6+uJVm4i2J8aXIxyhbctm/eeKjhy/vxTaJT80W6y5Hf4Ll3Nyx8X9NYmsfX4natEYR4
	pPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tt1qypC+u9reid+MlT/nXrSOPmVK3OesiZZZTaUxprY=;
	b=ImQAio5JJcq4oMGPLYHImwegJjSzkQQo1WgEoDOmI7M9GgVTfco7GkqvM8ohWcwzBz
	QtS60bUG0pF3ZTg/qZDyHe8MrYjGudLMljWE9UnDHxLEeeWKcGV4M7XDCdTKgkQv2HDn
	CLk7xvsK1EzhKF8SoMOKh4NdYGX+V0Ow/Kex+cUt+jAK4QY5Ooc20qurfjjdWbhWxI4J
	/biBYSNkEqT+I0SFAPz8LFRXrXwS/CPSAUkQaTeFHnd6bT0QrBiBbtPuNkw8IpSYqmIF
	HB9tYqnD/O/QsFXrBESmtql6JPEtu+Rv7i1BfCdg3OTw2nfd6X7y+x7+tiOj3EHIFxKp
	kNHw==
X-Gm-Message-State: AOPr4FVz+J8D3ax45uLP6yzoNSVIlMVsMxfjPPKY5fq8p5C+tyHOJcefAYJ5lHaHiPpgx+9l+fSACEi15+qJ9g==
X-Received: by 10.36.204.198 with SMTP id x189mr1339234itf.19.1463157055436;
	Fri, 13 May 2016 09:30:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.134.70 with HTTP; Fri, 13 May 2016 09:30:36 -0700 (PDT)
In-Reply-To: <1463156855.9746.112.camel@linuxfoundation.org>
References: <1462983927-19691-1-git-send-email-kergoth@gmail.com>
	<20160512132406.12f33a04@seebs-worktop>
	<1463156855.9746.112.camel@linuxfoundation.org>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 13 May 2016 09:30:36 -0700
Message-ID: <CABcZANkc3g2ST9WoxdEEBfQSZ7bq+H4-YHodQU0fpz+SpBBzJQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: obey our LDFLAGS
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
X-List-Received-Date: Fri, 13 May 2016 16:30:55 -0000
Content-Type: multipart/alternative; boundary=94eb2c0602fe8a54ba0532bbcc4a

--94eb2c0602fe8a54ba0532bbcc4a
Content-Type: text/plain; charset=UTF-8

On Fri, May 13, 2016 at 9:27 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2016-05-12 at 13:24 -0500, Peter Seebach wrote:
> > On Wed, 11 May 2016 09:25:27 -0700
> > Christopher Larson <kergoth@gmail.com> wrote:
> >
> > > +Subject: [PATCH] Obey external LDFLAGS the way we obey CFLAGS
> >
> > This has been merged into pseudo's upstream, now, but it's on top of
> > some
> > large changes, so we should probably go ahead with the local patch
> > until
> > later.
>
> The original patch was missing an Upstream-Status. Since I don't
> particularly want to have to think about this again, I've queued it
> with an Upstream-Status: Backport in this case.


Thanks, sorry about that.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c0602fe8a54ba0532bbcc4a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, May 13, 2016 at 9:27 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><span class=3D"">On Thu, 2016-05-12 at 13:24 -0500, Peter Seebach w=
rote:<br>
&gt; On Wed, 11 May 2016 09:25:27 -0700<br>
&gt; Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.com">kergoth@gm=
ail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; +Subject: [PATCH] Obey external LDFLAGS the way we obey CFLAGS<br=
>
&gt;<br>
&gt; This has been merged into pseudo&#39;s upstream, now, but it&#39;s on =
top of<br>
&gt; some<br>
&gt; large changes, so we should probably go ahead with the local patch<br>
&gt; until<br>
&gt; later.<br>
<br>
</span>The original patch was missing an Upstream-Status. Since I don&#39;t=
<br>
particularly want to have to think about this again, I&#39;ve queued it<br>
with an Upstream-Status: Backport in this case.</blockquote></div><br>Thank=
s, sorry about that.<br>-- <br><div class=3D"gmail_signature"><div dir=3D"l=
tr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, Op=
enEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, M=
entor Graphics</div></div>
</div></div>

--94eb2c0602fe8a54ba0532bbcc4a--
