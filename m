Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 19E0B78D48
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 12:56:10 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id n23-v6so4576110wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jB1Znmutxu7ocnjG5HNSF9NCrrH1bJDkRFI0BLx8p/8=;
	b=hhC6ruhjxRbXGjdd/Lg66u6oihcS8vgRMf1bNCe+lu55hv0GhB1z3WR94UxR8lSN8y
	QskE+KY1qdvfC9egu2js9UCjqEFYJG14mSjpQR18uLUQ9rylm0ffQ3si1aiIm/65oYWI
	Fz85PEd0uOiHl9vkwEzTnjTFOmuPnYF2roJH225GXHurFOccGOnnPDnkU5fmUu0LeZuH
	8hf0DFo5pNdAZQnzq0igpN+sOUEQp18sOZhU3jgKsC+nAhgZBaw3JP1gBOrp6cFs1Bx8
	j1iCmE/LvvW8g0gMIZG0x5ahNFzl93NMBFtdaOg8YxuodtBEU5zUeBWS5oAcFdIDWPt3
	9/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jB1Znmutxu7ocnjG5HNSF9NCrrH1bJDkRFI0BLx8p/8=;
	b=eIm/LZxcnjcjXaSQU86RXQvqr61hU/lWRjFKfWbZuVID27eL9XLqz86nXgWxT0WZgY
	vI3jtCMR/QlCHZxPsi8XreVLlTpxaKgIZspHZcxUJaQQNDBuRqp3V/FOLrb+Yro6txxX
	pDDV326lOQtFt6LsqKakyoax/thI5ktMGlPQN8u0gXPduGhX46iRulPKDeWJIq1F3Gve
	ao+QmE92nb7Pw5KnzyiehzeY+Pz7JvAtLTFwhq8alvP97nfRnYPDDjRUdDbfzs2uQ6vM
	1/WbV0OfzT7ZeKmK1c7ArN0WakSiaS1dnZaSSUmuIcahAuPXIVlwTIIJM9XStb6SZjmW
	63Cw==
X-Gm-Message-State: ABuFfohCDz6rA9Tcy8qnhp1hcA9sfyNKq6egbSbgwXhAiYTWlJocT8bK
	iZxjKmxM56O314AzcfesKFhEhAlpyDivDQBFIQM=
X-Google-Smtp-Source: ACcGV61nBAQgl9r8wnqhTNz92VGYTcU+VmJgRxBbBIOJ1N8pCVidpflbSRhUk0fhQVFtg5qSYVbj0gCoAM8Amplqf5I=
X-Received: by 2002:a1c:cec5:: with SMTP id
	e188-v6mr4282882wmg.85.1538225770738; 
	Sat, 29 Sep 2018 05:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1538189779.git.Qi.Chen@windriver.com>
	<7e21f0e0a9d537ea22ccebab46ce5e4f4912d5ba.1538189779.git.Qi.Chen@windriver.com>
	<9e2836e7ec7b062fe9bcf06a498eea30f983eb65.camel@linuxfoundation.org>
In-Reply-To: <9e2836e7ec7b062fe9bcf06a498eea30f983eb65.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 29 Sep 2018 14:55:58 +0200
Message-ID: <CA+chaQdqVSwjnhUF0Ysj=-eucw9X14SO1Q0KqRa5zAh4Q-LP-g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] glibc: refresh patch to also fix qemuppc
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
X-List-Received-Date: Sat, 29 Sep 2018 12:56:10 -0000
Content-Type: multipart/alternative; boundary="000000000000a6376b05770218ab"

--000000000000a6376b05770218ab
Content-Type: text/plain; charset="UTF-8"

I'm refreshing the patch based on feedback from upstream, I'll integrate
the changes for ppc as well.

On Sat, Sep 29, 2018 at 2:26 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2018-09-29 at 10:58 +0800, Chen Qi wrote:
> > The patch 0031-sysdeps-ieee754-prevent-maybe-uninitialized-
> > errors.patch
> > did not take into consideration of qemuppc. Refresh it to also fix
> > building for qemuppc.
> >
> > The related error message is like below:
> >
> >   ../sysdeps/ieee754/ldbl-128ibm/e_jnl.c:153:20: error: 'temp' may be
> > used uninitialized in this function [-Werror=maybe-uninitialized]
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  ...eee754-prevent-maybe-uninitialized-errors.patch | 41
> > +++++++++++++++++-----
> >  1 file changed, 32 insertions(+), 9 deletions(-)
> >
> > diff --git a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-
> > prevent-maybe-uninitialized-errors.patch b/meta/recipes-
> > core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-
> > errors.patch
> > index b02c4ec..1c5b254 100644
> > --- a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-
> > maybe-uninitialized-errors.patch
> > +++ b/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-
> > maybe-uninitialized-errors.patch
> > @@ -1,4 +1,4 @@
> > -From c6cc5a6ef46837e341fe271b5ffa6def23810082 Mon Sep 17 00:00:00
> > 2001
> > +From 113241a738662854256c5e2e415397721b842862 Mon Sep 17 00:00:00
> > 2001
> >  From: Martin Jansa <Martin.Jansa@gmail.com>
> >  Date: Fri, 14 Sep 2018 23:23:03 +0000
> >  Subject: [PATCH] sysdeps/ieee754: prevent maybe-uninitialized errors
> > @@ -21,13 +21,14 @@ Upstream-Status: Submitted [https://www.sourcewar
> > e.org/ml/libc-alpha/2018-09/msg
>
> I get nervous when we modify a patch submitted upstream. Was the patch
> submitted accepted? Do we need to send this other piece upstream?
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000a6376b05770218ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m refreshing the patch based on feedback from upstre=
am, I&#39;ll integrate the changes for ppc as well.</div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr">On Sat, Sep 29, 2018 at 2:26 PM Richard Purdi=
e &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@=
linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
On Sat, 2018-09-29 at 10:58 +0800, Chen Qi wrote:<br>
&gt; The patch 0031-sysdeps-ieee754-prevent-maybe-uninitialized-<br>
&gt; errors.patch<br>
&gt; did not take into consideration of qemuppc. Refresh it to also fix<br>
&gt; building for qemuppc.<br>
&gt; <br>
&gt; The related error message is like below:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0../sysdeps/ieee754/ldbl-128ibm/e_jnl.c:153:20: error: &#39=
;temp&#39; may be<br>
&gt; used uninitialized in this function [-Werror=3Dmaybe-uninitialized]<br=
>
&gt; <br>
&gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" ta=
rget=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...eee754-prevent-maybe-uninitialized-errors.patch | 41<br>
&gt; +++++++++++++++++-----<br>
&gt;=C2=A0 1 file changed, 32 insertions(+), 9 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-<br>
&gt; prevent-maybe-uninitialized-errors.patch b/meta/recipes-<br>
&gt; core/glibc/glibc/0031-sysdeps-ieee754-prevent-maybe-uninitialized-<br>
&gt; errors.patch<br>
&gt; index b02c4ec..1c5b254 100644<br>
&gt; --- a/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-<br>
&gt; maybe-uninitialized-errors.patch<br>
&gt; +++ b/meta/recipes-core/glibc/glibc/0031-sysdeps-ieee754-prevent-<br>
&gt; maybe-uninitialized-errors.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From c6cc5a6ef46837e341fe271b5ffa6def23810082 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From 113241a738662854256c5e2e415397721b842862 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt;=C2=A0 From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com"=
 target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Fri, 14 Sep 2018 23:23:03 +0000<br>
&gt;=C2=A0 Subject: [PATCH] sysdeps/ieee754: prevent maybe-uninitialized er=
rors<br>
&gt; @@ -21,13 +21,14 @@ Upstream-Status: Submitted [<a href=3D"https://www=
.sourcewar" rel=3D"noreferrer" target=3D"_blank">https://www.sourcewar</a><=
br>
&gt; <a href=3D"http://e.org/ml/libc-alpha/2018-09/msg" rel=3D"noreferrer" =
target=3D"_blank">e.org/ml/libc-alpha/2018-09/msg</a><br>
<br>
I get nervous when we modify a patch submitted upstream. Was the patch<br>
submitted accepted? Do we need to send this other piece upstream?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000a6376b05770218ab--
