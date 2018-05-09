Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 32EB774F28
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 16:16:49 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id t7-v6so17287355itf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 09:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KuzpJ2cjRxU1dK3zHhpc6+ruu4ZeMraznEEo33iNe70=;
	b=KsKL0oNj58YIlMoUhvoHbna0CYzYCy//Ojel1wBvpyr9x5D3OCIQLgr+zHhScWpPw9
	uy1HQVns44N19BzvLjyYeaji5gyIymFOnIPj/70PgyMNBuB0LqWHYMVY/PfMaCUVpjQf
	GUjjyuQZlLUNC4px31OPtoFnZcYD00kBixkq//h0oCs5YLWYiSYhpF2oklWOj+N+GrNQ
	8+y2VlJDp3YmdowCMlZGH9SkUnV2Iv21VCOni/2Yjn6OaWQwg7BMJagjFboXlXENfjfM
	vs9GQ2LTcY9kDHZQ7odbqN3lSwn0yxf/Y/GZ93Q4Wr51b1mXwRGMuUn60OzFtWINr4+D
	TEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KuzpJ2cjRxU1dK3zHhpc6+ruu4ZeMraznEEo33iNe70=;
	b=TEy6Awk19EVrhfUAY0T4HktlXUNXBhY2lUyk3HyQEk+Nkt0RpMcX2zHIj/czQruonK
	QD8dYtwEJyPs1LMwU40tznB7b0n+2Dy+lmfK8HrOjcB674r6QdLVg3/Ne26TnVKT0UpE
	7GMp4qFvVg3aUzDhH2qRkWLNUjF6UdCQilbUUkVGA4JpYQi/EzsWXQKCSrohL3nW/f6X
	676HJPNJuc1BmDsuO10rp+RGVhoLxbLubPOUdu/Y5Y6Y2EZkNRIJ7foKlMgCUyYMDy7R
	cy4bpPehS5LYaNZYQLiSYLHfFPro8oy6N26RJQAZUgNqBYNQ1IiA4/b1haMS6UaStx3d
	WZSQ==
X-Gm-Message-State: ALKqPwdhs4obNfZK7gII3jyWBv1VmguR1n/HT8vdOMTNibVdKR+Wvdc8
	aHJGBfaN6mvJaPTpfXl0RICoJWwwT5G/CHtHBf/Iwg==
X-Google-Smtp-Source: AB8JxZrGFHs5/aDAdZy9/rnwTOKAcbwiC1uEthCH/7AQAmSsYt5KUWUL1k3gceWOBaWSCLrcBmrqif8TZKaxtF4+p30=
X-Received: by 2002:a24:3a0a:: with SMTP id
	m10-v6mr11179681itm.45.1525882610966; 
	Wed, 09 May 2018 09:16:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Wed, 9 May 2018 09:16:30 -0700 (PDT)
In-Reply-To: <3120035.nktNMt2fzU@yow-masselst-lx1>
References: <1523387170-30191-1-git-send-email-denis@denix.org>
	<3814374.oaZWZoq0et@yow-masselst-lx1>
	<CAJTo0LaHtEh3JBQqnsx1v6c31jbTYe2jLUztLtpiqwDi+W3nLg@mail.gmail.com>
	<3120035.nktNMt2fzU@yow-masselst-lx1>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 May 2018 17:16:30 +0100
Message-ID: <CAJTo0LbbNr-JEyfuyB+w6bHTnZ7h8NQ_tnRbKGh6SqCXBKBd9w@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wayland: upgrade to 1.15.0
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
X-List-Received-Date: Wed, 09 May 2018 16:16:50 -0000
Content-Type: multipart/alternative; boundary="000000000000fefd9c056bc83a11"

--000000000000fefd9c056bc83a11
Content-Type: text/plain; charset="UTF-8"

Good news: Denys beat you.

Ross

On 9 May 2018 at 17:09, Mark Asselstine <mark.asselstine@windriver.com>
wrote:

> On Wednesday, May 9, 2018 12:03:26 PM EDT Burton, Ross wrote:
> > On 9 May 2018 at 17:00, Mark Asselstine <mark.asselstine@windriver.com>
> >
> > wrote:
> > > I am also seeing build failures due to this conflict:
> > >
> > > ERROR: libglu-2_9.0.0-0 do_prepare_recipe_sysroot: The file /usr/lib64/
> > > libwayland-egl.la is installed by both wayland and mesa, aborting
> > > ..
> > > ERROR: mesa-2_18.0.2-r0 do_package: QA Issue: mesa: Files/directories
> were
> > >
> > > installed but not shipped in any package:
> > >   /usr/lib64/libwayland-egl.la
> > >
> > > Please set FILES such that these items are packaged. Alternatively if
> they
> > > are
> > > unneeded, avoid installing them or delete them within do_install.
> > > mesa: 1 installed and not shipped files. [installed-vs-shipped]
> > >
> > > is someone working on a fix or should I take some time to put something
> > > together?
> >
> > As it appears you can test quickly then I think you just drew the short
> > straw.  Should be a trivial patch...
>
> I knew that this had a 50/50 chance of going this way :). Lunch then a
> fix. I
> assume then we will go with Martin's suggestion of an explicit remove in
> mesa.inc?
>
> Mark
>
> >
> > Ross
>
>
>
>
>

--000000000000fefd9c056bc83a11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Good news: Denys beat you.<div><br></div><div>Ross</div></=
div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 9 May 2018=
 at 17:09, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.ass=
elstine@windriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Wed=
nesday, May 9, 2018 12:03:26 PM EDT Burton, Ross wrote:<br>
&gt; On 9 May 2018 at 17:00, Mark Asselstine &lt;<a href=3D"mailto:mark.ass=
elstine@windriver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
&gt; <br>
&gt; wrote:<br>
&gt; &gt; I am also seeing build failures due to this conflict:<br>
&gt; &gt; <br>
&gt; &gt; ERROR: libglu-2_9.0.0-0 do_prepare_recipe_sysroot: The file /usr/=
lib64/<br>
&gt; &gt; <a href=3D"http://libwayland-egl.la" rel=3D"noreferrer" target=3D=
"_blank">libwayland-egl.la</a> is installed by both wayland and mesa, abort=
ing<br>
&gt; &gt; ..<br>
&gt; &gt; ERROR: mesa-2_18.0.2-r0 do_package: QA Issue: mesa: Files/directo=
ries were<br>
&gt; &gt; <br>
&gt; &gt; installed but not shipped in any package:<br>
&gt; &gt;=C2=A0 =C2=A0/usr/lib64/<a href=3D"http://libwayland-egl.la" rel=
=3D"noreferrer" target=3D"_blank">libwayland-egl.la</a><br>
&gt; &gt; <br>
&gt; &gt; Please set FILES such that these items are packaged. Alternativel=
y if they<br>
&gt; &gt; are<br>
&gt; &gt; unneeded, avoid installing them or delete them within do_install.=
<br>
&gt; &gt; mesa: 1 installed and not shipped files. [installed-vs-shipped]<b=
r>
&gt; &gt; <br>
&gt; &gt; is someone working on a fix or should I take some time to put som=
ething<br>
&gt; &gt; together?<br>
&gt; <br>
&gt; As it appears you can test quickly then I think you just drew the shor=
t<br>
&gt; straw.=C2=A0 Should be a trivial patch...<br>
<br>
</span>I knew that this had a 50/50 chance of going this way :). Lunch then=
 a fix. I <br>
assume then we will go with Martin&#39;s suggestion of an explicit remove i=
n <br>
mesa.inc?<br>
<br>
Mark<br>
<br>
&gt; <br>
&gt; Ross<br>
<br>
<br>
<br>
<br>
</blockquote></div><br></div>

--000000000000fefd9c056bc83a11--
