Return-Path: <nickdademo@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 350AE6CBD7;
	Mon, 20 Jan 2014 13:09:01 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id uy5so2882803obc.5
	for <multiple recipients>; Mon, 20 Jan 2014 05:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=EQacwuhh6vj8qRNiw5r5L5w2ZOD53LAYw+Jz0nnDmaU=;
	b=r1P9qtwrMaArmgMA3RBGhdCsdiZM6ODjYoUnIshj2wTAHHbOw/kjvPG83O8a685gwU
	reQKIn+DOlpscn7ME4ZqId+yivpKMZo7UQ2q6AUOjMpL1CfthBgHC1gWyIRpL2uoQO3/
	AU4GgeJilfXMizKnwFbIxqzY5XZET75I7JiQ/9cv7qBPyH2R4tB/y30OhjXQj7+dB9aY
	OmgUBk279tP0tdVKziSkWOZLneuBj/5cd8tNNOiM9DxdHt0ZuO8vQF69AgQlsJhU9WMO
	2OPXNhZkXYsu/iHjJCIzjBK0xO7xq2Wo+vKQh1bORJtq1ulTDVf3cnBUpdSWYgF5PlZD
	HAjg==
X-Received: by 10.60.165.36 with SMTP id yv4mr1395732oeb.55.1390223342103;
	Mon, 20 Jan 2014 05:09:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.79.165 with HTTP; Mon, 20 Jan 2014 05:08:41 -0800 (PST)
In-Reply-To: <20140115103059.GH3717@jama>
References: <20140106112936.C3F0C50472@opal> <20140109144245.GF3709@jama>
	<1389763343.3092.17.camel@dvhart-mobl4.amr.corp.intel.com>
	<52D62433.8020402@windriver.com> <20140115103059.GH3717@jama>
From: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Tue, 21 Jan 2014 00:08:41 +1100
Message-ID: <CANR6C55w4BGDQadD5+Udv=2ae6nBUZiO8UdfVnFdSDkHGb2L9w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : autogen-native: upgrade to 5.18.2
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
X-List-Received-Date: Mon, 20 Jan 2014 13:09:02 -0000
Content-Type: multipart/alternative; boundary=047d7b3a86747733f304f06698e2

--047d7b3a86747733f304f06698e2
Content-Type: text/plain; charset=ISO-8859-1

Any update on this one? (it's actually a showstopper to my build)
Is a fix in progress? Alternatively, I can try and tackle it.

Nick



On Wed, Jan 15, 2014 at 9:30 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Wed, Jan 15, 2014 at 02:01:23PM +0800, Robert Yang wrote:
> >
> >
> > On 01/15/2014 01:22 PM, Darren Hart wrote:
> > > On Thu, 2014-01-09 at 15:42 +0100, Martin Jansa wrote:
> > >> On Mon, Jan 06, 2014 at 11:29:36AM +0000, git@git.openembedded.orgwrote:
> > >>> Module: openembedded-core.git
> > >>> Branch: master
> > >>> Commit: 6bcd2dafa379badab11bff9d7b607f7f5d72fc94
> > >>> URL:
> http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=6bcd2dafa379badab11bff9d7b607f7f5d72fc94
> > >>>
> > >>> Author: Robert Yang <liezhi.yang@windriver.com>
> > >>> Date:   Fri Dec 27 01:05:14 2013 +0800
> > >>>
> > >>> autogen-native: upgrade to 5.18.2
> > >>>
> > >>> * Upgrade from 5.17.4 to 5.18.2
> > >>> * Rename files -> autogen
> > >>>
> > >>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > >>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > >>
> > >> Fails in world builds:
> > >
> > > Guessing I'm behind somewhere - seeing this as well. I thought it was
> an
> > > sstate issue, but doesn't appear to be. Is this addressed in a MUT
> build
> > > or something already?
> > >
> >
> > Hi Darren,
> >
> > I'm trying to figure out the reason, but haven't got much progress yet.
>
> Does autogen autodetect guile like make-4 does? RP fixed it in make
> yesterday.
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--047d7b3a86747733f304f06698e2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Any update on this one? (it&#39;s actually a showstop=
per to my build)<br>Is a fix in progress? Alternatively, I can try and tack=
le it.<br><br></div>Nick<br><div><div class=3D"gmail_extra"><br clear=3D"al=
l">


<br><br><div class=3D"gmail_quote">On Wed, Jan 15, 2014 at 9:30 PM, Martin =
Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" targe=
t=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">

<div class=3D"im">On Wed, Jan 15, 2014 at 02:01:23PM +0800, Robert Yang wro=
te:<br>
&gt;<br>
&gt;<br>
&gt; On 01/15/2014 01:22 PM, Darren Hart wrote:<br>
&gt; &gt; On Thu, 2014-01-09 at 15:42 +0100, Martin Jansa wrote:<br>
&gt; &gt;&gt; On Mon, Jan 06, 2014 at 11:29:36AM +0000, <a href=3D"mailto:g=
it@git.openembedded.org">git@git.openembedded.org</a> wrote:<br>
&gt; &gt;&gt;&gt; Module: openembedded-core.git<br>
&gt; &gt;&gt;&gt; Branch: master<br>
&gt; &gt;&gt;&gt; Commit: 6bcd2dafa379badab11bff9d7b607f7f5d72fc94<br>
&gt; &gt;&gt;&gt; URL: =A0 =A0<a href=3D"http://git.openembedded.org/?p=3Do=
penembedded-core.git&amp;a=3Dcommit;h=3D6bcd2dafa379badab11bff9d7b607f7f5d7=
2fc94" target=3D"_blank">http://git.openembedded.org/?p=3Dopenembedded-core=
.git&amp;a=3Dcommit;h=3D6bcd2dafa379badab11bff9d7b607f7f5d72fc94</a><br>


&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Author: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@win=
driver.com">liezhi.yang@windriver.com</a>&gt;<br>
&gt; &gt;&gt;&gt; Date: =A0 Fri Dec 27 01:05:14 2013 +0800<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; autogen-native: upgrade to 5.18.2<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; * Upgrade from 5.17.4 to 5.18.2<br>
&gt; &gt;&gt;&gt; * Rename files -&gt; autogen<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.y=
ang@windriver.com">liezhi.yang@windriver.com</a>&gt;<br>
&gt; &gt;&gt;&gt; Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.=
intel.com">sgw@linux.intel.com</a>&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Fails in world builds:<br>
&gt; &gt;<br>
&gt; &gt; Guessing I&#39;m behind somewhere - seeing this as well. I though=
t it was an<br>
&gt; &gt; sstate issue, but doesn&#39;t appear to be. Is this addressed in =
a MUT build<br>
&gt; &gt; or something already?<br>
&gt; &gt;<br>
&gt;<br>
&gt; Hi Darren,<br>
&gt;<br>
&gt; I&#39;m trying to figure out the reason, but haven&#39;t got much prog=
ress yet.<br>
<br>
</div>Does autogen autodetect guile like make-4 does? RP fixed it in make<b=
r>
yesterday.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
Martin &#39;JaMa&#39; Jansa =A0 =A0 jabber: <a href=3D"mailto:Martin.Jansa@=
gmail.com">Martin.Jansa@gmail.com</a><br>
</div></div><br>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
<br></blockquote></div><br></div></div></div>

--047d7b3a86747733f304f06698e2--
