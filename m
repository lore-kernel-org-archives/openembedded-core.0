Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id B85B875D22
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 14:59:52 +0000 (UTC)
Received: by igpw7 with SMTP id w7so37478924igp.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 06:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=YuI0gQQ/nwDT8I1U18nAT3lp+XLrD910oWsKWFbTD1U=;
	b=UMp8UVieEpD/YqSVEXdk5N8Z2MXgoKOUkSbQj2NNM7Vnl0OvzHnuyHMzaxDELzpdDR
	vScMxBzFYX0Sc/ZDhhpRKpRAo7xhvD3hfRXM+Qmd4qkKEecngEjxVg4uv78MizuuPhDP
	bH/ZQt+wsY3IaazzXTdYzl2CBKGjAoGVGHZaiLXujFr/gwHFoDrcuxuvSQHqM/+Ac0Vu
	k2oh+7qdBrVy/HaJ2acbjuEd92PA+xXFaNmRe5m4mY1qivs45xSqZTPh41lBCNkI1Fli
	hwsNVo6G+55ttVX3Wv4/cX9GYWDlJh3CmpA5EQ6iBiADzIYK5QleRNpA022KxWdRu2y7
	+jRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=YuI0gQQ/nwDT8I1U18nAT3lp+XLrD910oWsKWFbTD1U=;
	b=KvCOdfffAiTk4c6TutaR7LHQGLsAXTLFDzW1Zl6kDeqMby1Weg0JKtzPXLqjUmKIJr
	/fxAomW55jLrgRS9edPfhzA1hmHGxk2rI0Cx3brx4LpcTFxS0PMherHpkO1O/KBz863b
	gPsH9+GiCLmAnfacY8Il/k8TI0USRhoaWoz94SZjx8nrmh2Rgl436zKMuaCC5Qes6oeN
	yzInoRKuY11QuLtu/4li98zJJRgMmPINniVpWupS9S8qOKhqQR4TQ7gfvKCqAak3ayns
	MwJwNczs2zrmvM0lbBlqQ2yw1013iwjDv1fdFxrCbPZcl3mamf4SO5FfRMfoLv12pKgf
	3tiw==
X-Received: by 10.50.50.139 with SMTP id c11mr9915305igo.10.1446821992374;
	Fri, 06 Nov 2015 06:59:52 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.93.7 with HTTP; Fri, 6 Nov 2015 06:59:32 -0800 (PST)
In-Reply-To: <20151106131831.GA2550@jama>
References: <1446734821-6011-1-git-send-email-mac@mcrowe.com>
	<CAJ86T=WxqbJ83S4RESL_oKX9gYNg6-aAPGUYR3btSQBhKQo-1g@mail.gmail.com>
	<20151106103004.GA7454@mcrowe.com> <20151106131831.GA2550@jama>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 6 Nov 2015 07:59:32 -0700
X-Google-Sender-Auth: aovRkWDynBLUr8_biJyNuDAkx18
Message-ID: <CABcZANnxTw-eAUWHtkfg3nP69aBrS2WfGJ4Zbz5g3Q=PWprz6w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Mike Crowe <mac@mcrowe.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf, module.bbclass: Support opting out of legacy EXTRA_OEMAKE
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
X-List-Received-Date: Fri, 06 Nov 2015 14:59:52 -0000
Content-Type: multipart/alternative; boundary=047d7bdca040e8aa8d0523e07ee6

--047d7bdca040e8aa8d0523e07ee6
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 6, 2015 at 6:18 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Fri, Nov 06, 2015 at 10:30:04AM +0000, Mike Crowe wrote:
> > On Friday 06 November 2015 at 01:16:46 -0800, Andre McCurdy wrote:
> > > On Thu, Nov 5, 2015 at 6:47 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > > > Give recipes and classes the ability to opt out of EXTRA_OEMAKE
> > > > containing the legacy value without removing other recipe-specific or
> > > > local additions.
> > >
> > > Isn't this possible already from within a recipe or class by using
> > >
> > >   EXTRA_OEMAKE = ...
> > >
> > > instead of
> > >
> > >   EXTRA_OEMAKE += ...
> > >
> > > ie what autotools.bbclass, kernel.bbclass and many recipes do already.
> > >
> > > For the specific case of module.bbclass, changing the EXTRA_OEMAKE
> > > assignment to '=' might require some recipes to be tweaked to so that
> > > they "inherit module" before adding their own options to EXTRA_OEMAKE,
> > > but it seems like a cleaner solution?
> >
> > It would be, but I was afraid of what I might break. I suspect that there
> > are many unseen third-party and local recipes that inherit
> module.bbclass.
> >
> > It would be great to get to the point that EXTRA_OEMAKE is empty by
> default
> > but I imagine that the experts are already aware of the difficulties with
> > doing this which is why the current value has lasted so long.
>
> Is it really good goal to get rid of "-e"?
>
> I know that the environment used in bitbake tasks is already well
> defined and controlled, but I still find a bit more control with -e to
> be useful in many cases.
>
> I know I'll be able to return -e where useful, but what's the main
> advantage of removing it from default?


The original goal of the default EXTRA_OEMAKE was to let us keep our
recipes as minimal as possible and have as many "Just Work" out of the box
as possible. It succeeded in this goal. The problem is the corner cases,
and more importantly, it encourages people creating recipes for custom
make-based buildsystems to just try building it and hack at it till it
works, rather than reading the makefiles, determining which variables to
pass in, in what form, and customizing EXTRA_OEMAKE to explicitly pass
what's needed in the appropriate ways.

That's my biggest concern with it, other than the aforementioned occasional
breakage. It's implicit, automatic, rather than explicit, and tacitly
encourages ignorance of the buildsystem in question.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7bdca040e8aa8d0523e07ee6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Nov 6, 2015 at 6:18 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">O=
n Fri, Nov 06, 2015 at 10:30:04AM +0000, Mike Crowe wrote:<br>
&gt; On Friday 06 November 2015 at 01:16:46 -0800, Andre McCurdy wrote:<br>
&gt; &gt; On Thu, Nov 5, 2015 at 6:47 AM, Mike Crowe &lt;<a href=3D"mailto:=
mac@mcrowe.com">mac@mcrowe.com</a>&gt; wrote:<br>
&gt; &gt; &gt; Give recipes and classes the ability to opt out of EXTRA_OEM=
AKE<br>
&gt; &gt; &gt; containing the legacy value without removing other recipe-sp=
ecific or<br>
&gt; &gt; &gt; local additions.<br>
&gt; &gt;<br>
&gt; &gt; Isn&#39;t this possible already from within a recipe or class by =
using<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0EXTRA_OEMAKE =3D ...<br>
&gt; &gt;<br>
&gt; &gt; instead of<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0EXTRA_OEMAKE +=3D ...<br>
&gt; &gt;<br>
&gt; &gt; ie what autotools.bbclass, kernel.bbclass and many recipes do alr=
eady.<br>
&gt; &gt;<br>
&gt; &gt; For the specific case of module.bbclass, changing the EXTRA_OEMAK=
E<br>
&gt; &gt; assignment to &#39;=3D&#39; might require some recipes to be twea=
ked to so that<br>
&gt; &gt; they &quot;inherit module&quot; before adding their own options t=
o EXTRA_OEMAKE,<br>
&gt; &gt; but it seems like a cleaner solution?<br>
&gt;<br>
&gt; It would be, but I was afraid of what I might break. I suspect that th=
ere<br>
&gt; are many unseen third-party and local recipes that inherit module.bbcl=
ass.<br>
&gt;<br>
&gt; It would be great to get to the point that EXTRA_OEMAKE is empty by de=
fault<br>
&gt; but I imagine that the experts are already aware of the difficulties w=
ith<br>
&gt; doing this which is why the current value has lasted so long.<br>
<br>
</span>Is it really good goal to get rid of &quot;-e&quot;?<br>
<br>
I know that the environment used in bitbake tasks is already well<br>
defined and controlled, but I still find a bit more control with -e to<br>
be useful in many cases.<br>
<br>
I know I&#39;ll be able to return -e where useful, but what&#39;s the main<=
br>
advantage of removing it from default?</blockquote></div><br>The original g=
oal of the default EXTRA_OEMAKE was to let us keep our recipes as minimal a=
s possible and have as many &quot;Just Work&quot; out of the box as possibl=
e. It succeeded in this goal. The problem is the corner cases, and more imp=
ortantly, it encourages people creating recipes for custom make-based build=
systems to just try building it and hack at it till it works, rather than r=
eading the makefiles, determining which variables to pass in, in what form,=
 and customizing EXTRA_OEMAKE to explicitly pass what&#39;s needed in the a=
ppropriate ways.</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">That&#39;s my biggest concern with it, other than the aforementi=
oned occasional breakage. It&#39;s implicit, automatic, rather than explici=
t, and tacitly encourages ignorance of the buildsystem in question.<br>-- <=
br><div class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth =
dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tsli=
b<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--047d7bdca040e8aa8d0523e07ee6--
