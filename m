Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f45.google.com (unknown [209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0391860559
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 23:47:54 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id gl10so369024lab.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 May 2014 16:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ToCqck9Q3OuJTVkY0QrOCSetIBWnLioOFESxRnXNbBo=;
	b=kms04ekehfdbe8Kg8jA+qyFgOT8gjOltQPdOdTBc6BKdBBxxEipOXl9g9a2XkabEbo
	n39P4lv+nvgFQTsN2xMDvRLNb4Ilqlc8AqZRR+7jbwynPVpz6bZOoiPAQFQDgqHDtBBo
	ZT0MLjAu5mGtfurMEqlGO93HNZflL7ytdSgrnhV8MjAgGySqla3xKzmoa/Rskh+c81Nr
	tNLQw9JFPkN4dfnL7eRznSr6UEOYLNN2PVqMR+F8CzLCJddK0CrrANEr/GvLqb6zxAaC
	U7gyxE1k93xlNN2BTtyInqH0Wv6timlbNvE+8xfmsxWB8Muo1frBsRAx8riapntsWmoh
	Z5qQ==
MIME-Version: 1.0
X-Received: by 10.112.50.194 with SMTP id e2mr13172005lbo.4.1399679275267;
	Fri, 09 May 2014 16:47:55 -0700 (PDT)
Received: by 10.114.216.4 with HTTP; Fri, 9 May 2014 16:47:55 -0700 (PDT)
In-Reply-To: <20140509222915.GC22774@jama>
References: <1399645908-14499-1-git-send-email-ticotimo@gmail.com>
	<CAJTo0LYCdUJMPN8+pZWXrvsRc9fyiq7gm2dOh0N3gRcqWFP1CA@mail.gmail.com>
	<20140509150721.GA22774@jama>
	<CAJTo0LYAv1e0ko7jK6mm9Uz1Hsqvd7rq8dYshogVAE8mCMa=Aw@mail.gmail.com>
	<20140509222915.GC22774@jama>
Date: Fri, 9 May 2014 16:47:55 -0700
Message-ID: <CANx9H-DaY=qd5F303jXiXUCF2F2pArWHY_N0QUv-PdPHGDOKKQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: add lcms, libpoppler-glib dependenies
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
X-List-Received-Date: Fri, 09 May 2014 23:47:56 -0000
Content-Type: multipart/alternative; boundary=001a11336c26007a5304f9003a49

--001a11336c26007a5304f9003a49
Content-Type: text/plain; charset=UTF-8

From upstream:
clients: Drop pdf viewer sample client
http://cgit.freedesktop.org/wayland/weston/commit/?id=a72d37566780ab8abab235cd21817733962cb1e1



On Fri, May 9, 2014 at 3:29 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Fri, May 09, 2014 at 04:18:36PM +0100, Burton, Ross wrote:
> > On 9 May 2014 16:07, Martin Jansa <martin.jansa@gmail.com> wrote:
> > >> For a start libpoppler isn't in oe-core, so this causes a build
> > >> failure for everyone not using meta-oe.
> > >>
> > >> These are for the basic test applications: I'd prefer to see a patch
> > >> that either forcibly disabled the checks or added configure options so
> > >> the dependencies can be controlled.
> > >
> > > FWIW: I've sent WIP patch a while ago, but never finished it
> > > http://patchwork.openembedded.org/patch/57011/
> > >
> > > IIRC it doesn't apply to current version now.
> >
> > If definitely doesn't apply to master: weston doesn't check for
> > poppler anymore as the PDF viewer was removed.
>
> Something still links with it as shows in test-dependencies reports:
>
> weston/weston/latest lost dependency on  lcms
> weston/weston-examples/latest lost dependency on  libpoppler-glib
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--001a11336c26007a5304f9003a49
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From upstream:<br>clients: Drop pdf viewer sample client<b=
r><a href=3D"http://cgit.freedesktop.org/wayland/weston/commit/?id=3Da72d37=
566780ab8abab235cd21817733962cb1e1">http://cgit.freedesktop.org/wayland/wes=
ton/commit/?id=3Da72d37566780ab8abab235cd21817733962cb1e1</a><br>
<br></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On =
Fri, May 9, 2014 at 3:29 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Fri, May 09, 2014 at 04:1=
8:36PM +0100, Burton, Ross wrote:<br>
&gt; On 9 May 2014 16:07, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@g=
mail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt; For a start libpoppler isn&#39;t in oe-core, so this causes a=
 build<br>
&gt; &gt;&gt; failure for everyone not using meta-oe.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; These are for the basic test applications: I&#39;d prefer to =
see a patch<br>
&gt; &gt;&gt; that either forcibly disabled the checks or added configure o=
ptions so<br>
&gt; &gt;&gt; the dependencies can be controlled.<br>
&gt; &gt;<br>
&gt; &gt; FWIW: I&#39;ve sent WIP patch a while ago, but never finished it<=
br>
&gt; &gt; <a href=3D"http://patchwork.openembedded.org/patch/57011/" target=
=3D"_blank">http://patchwork.openembedded.org/patch/57011/</a><br>
&gt; &gt;<br>
&gt; &gt; IIRC it doesn&#39;t apply to current version now.<br>
&gt;<br>
&gt; If definitely doesn&#39;t apply to master: weston doesn&#39;t check fo=
r<br>
&gt; poppler anymore as the PDF viewer was removed.<br>
<br>
</div>Something still links with it as shows in test-dependencies reports:<=
br>
<br>
weston/weston/latest lost dependency on =C2=A0lcms<br>
weston/weston-examples/latest lost dependency on =C2=A0libpoppler-glib<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
Martin &#39;JaMa&#39; Jansa =C2=A0 =C2=A0 jabber: <a href=3D"mailto:Martin.=
Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</div></div></blockquote></div><br></div>

--001a11336c26007a5304f9003a49--
