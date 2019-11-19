Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 650D47F841
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 13:10:33 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id k15so14162283vsp.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 05:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GCG/BupFBBO2P3q93bQolqLQABtGH305nYl8+1Gij+U=;
	b=brYNEIehj97CHpB7fdY9e7Mcsys2IEhX7Mc/uCFVNP+ObkiH26dTbdRLbKCjFhZl7G
	0zvSPU5tBqRATkwz2O7HDDoJpZsVT50h6PNHvo9AUHjndhCwRcu+UNYV7Q77kn4/iEYk
	P2ZmdpGhYbYk+r/YUVwaF5eeOssfviQ1ZMwjYb3PmK7xb5k5vQSAgYJSPwycogslz6QB
	7gWd4TxC+dlzxDVN8ztvbzzoDmALnnkplAqlX1v3SC83tiddyPTDfy3v3U4UXDNTRsRy
	1mIFOO2+/xdtZuYmSxtvsm3o4EPKcjPJREA0v7gyuobcgcOsWK8Gyri9SjaORDKBOMaU
	RZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GCG/BupFBBO2P3q93bQolqLQABtGH305nYl8+1Gij+U=;
	b=qLewiJrHOfkQy0xmSi+ljvggbaR9MprbWftGWwgGJFJWlswMhueuHBiV+f+a9gtBPQ
	/LQbOTzJdgdhji0nzXAI5sDKHZ8629OPODEoY6Ku/GgntyPBG+UjnLnYqRY4RjJ52D0/
	mA2fluRwvcP+DU6LB3laIHxC+RKQjUVuW53+DMiIxVuS27I72+jy9lP0VW66f6IzphCz
	hl0wVujhrcRxTEU+Z4Tnv3ZPjNQ6c6OvOVA+pvb7WpQ5TOmQKVzXleypOWjQOwvoRZR3
	wr/cO3RV7eEqVIDh7xuvdzo2QM20bfAbUPp+Vv33Wxi+bFXk8wzYWopPwrZDKXC1tDQd
	kfUg==
X-Gm-Message-State: APjAAAUBLIrm5Nm0P18UL45ZtjbjG+v/13YJVG4WJdMlRwtwW6kTeaxc
	NuL3d9leeUePc0lra+Kkf4b3SY5bMJoymt+x34E=
X-Google-Smtp-Source: APXvYqzaN26gO2s3sU0d9tvKe+kZr0roEiRmZJitYNI9oIgPu0/m5JFvp0qeOdyDlGsQMIWW9h3j8jmj4Xlu6v4LEYI=
X-Received: by 2002:a67:e343:: with SMTP id s3mr21885645vsm.83.1574169033990; 
	Tue, 19 Nov 2019 05:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
	<20191118142852.22981-7-alex.kanavin@gmail.com>
	<d81ce2616b381df45bc4b387e50db3754144f2a1.camel@intel.com>
In-Reply-To: <d81ce2616b381df45bc4b387e50db3754144f2a1.camel@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Nov 2019 14:10:22 +0100
Message-ID: <CANNYZj-1utNQ2E63jpUWZSGNAwqXg+f+muCYS0zQerMK47bMtg@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/13] psmisc: update to 23.3
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
X-List-Received-Date: Tue, 19 Nov 2019 13:10:33 -0000
Content-Type: multipart/alternative; boundary="00000000000016658a0597b2ca5a"

--00000000000016658a0597b2ca5a
Content-Type: text/plain; charset="UTF-8"

Thanks, I've checked that and queued a commit that removes the patch.

Alex

On Tue, 19 Nov 2019 at 13:42, Mittal, Anuj <anuj.mittal@intel.com> wrote:

> On Mon, 2019-11-18 at 15:28 +0100, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...am-create-src-directory-before-attempting-t.patch | 12 +++++-----
> > --
> >  .../psmisc/{psmisc_23.2.bb => psmisc_23.3.bb}        |  2 +-
> >  2 files changed, 6 insertions(+), 8 deletions(-)
> >  rename meta/recipes-extended/psmisc/{psmisc_23.2.bb =>
> > psmisc_23.3.bb} (87%)
> >
> > diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-
> > create-src-directory-before-attempting-t.patch b/meta/recipes-
> > extended/psmisc/psmisc/0001-Makefile.am-create-src-directory-before-
> > attempting-t.patch
> > index 4d44495fd3f..9451303dd7b 100644
> > --- a/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-
> > src-directory-before-attempting-t.patch
> > +++ b/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-
> > src-directory-before-attempting-t.patch
> > @@ -1,4 +1,4 @@
> > -From 285877b7761d74736aca2687ed9bef2f78b82c33 Mon Sep 17 00:00:00
> > 2001
> > +From dac375f640fecd45e6254a8d870ee37ec8f41670 Mon Sep 17 00:00:00
> > 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Thu, 2 Nov 2017 16:21:22 +0200
> >  Subject: [PATCH] Makefile.am: create src directory before attempting
> > to write
> > @@ -8,23 +8,21 @@ Otherwise out of tree builds will fail.
> >
> >  Upstream-Status: Pending
> >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +
> >  ---
> >   Makefile.am | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/Makefile.am b/Makefile.am
> > -index 9f61ab4..b4ced7f 100644
> > +index 441ae94..882969d 100644
> >  --- a/Makefile.am
> >  +++ b/Makefile.am
> > -@@ -79,7 +79,7 @@ EXTRA_DIST = src/signames.c README.md
> > +@@ -86,7 +86,7 @@ EXTRA_DIST = src/signames.c README.md misc/git-
> > version-gen
> >   CLEANFILES = src/signames.h
> >
> > - src/signames.h: src/signames.c Makefile
> > + src/signames.h: src/signames.c Makefile src/$(am__dirstamp)
>
> This patch is probably not needed now considering this new change.
>
>
> https://gitlab.com/psmisc/psmisc/commit/b7dc1c5eb9459f83b2355c8f061933c74b71c724
>
> Thanks,
>
> Anuj
>

--00000000000016658a0597b2ca5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, I&#39;ve checked that and queued a commit tha=
t removes the patch.</div><div><br></div><div>Alex<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 19 Nov =
2019 at 13:42, Mittal, Anuj &lt;<a href=3D"mailto:anuj.mittal@intel.com">an=
uj.mittal@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Mon, 2019-11-18 at 15:28 +0100, Alexander Kanavin wro=
te:<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...am-create-src-directory-before-attempting-t.patch | 12 +++++-=
----<br>
&gt; --<br>
&gt;=C2=A0 .../psmisc/{<a href=3D"http://psmisc_23.2.bb" rel=3D"noreferrer"=
 target=3D"_blank">psmisc_23.2.bb</a> =3D&gt; <a href=3D"http://psmisc_23.3=
.bb" rel=3D"noreferrer" target=3D"_blank">psmisc_23.3.bb</a>}=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;=C2=A0 2 files changed, 6 insertions(+), 8 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-extended/psmisc/{<a href=3D"http://psmisc_23=
.2.bb" rel=3D"noreferrer" target=3D"_blank">psmisc_23.2.bb</a> =3D&gt;<br>
&gt; <a href=3D"http://psmisc_23.3.bb" rel=3D"noreferrer" target=3D"_blank"=
>psmisc_23.3.bb</a>} (87%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-<br>
&gt; create-src-directory-before-attempting-t.patch b/meta/recipes-<br>
&gt; extended/psmisc/psmisc/0001-Makefile.am-create-src-directory-before-<b=
r>
&gt; attempting-t.patch<br>
&gt; index 4d44495fd3f..9451303dd7b 100644<br>
&gt; --- a/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-<br>
&gt; src-directory-before-attempting-t.patch<br>
&gt; +++ b/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-<br>
&gt; src-directory-before-attempting-t.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 285877b7761d74736aca2687ed9bef2f78b82c33 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From dac375f640fecd45e6254a8d870ee37ec8f41670 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Thu, 2 Nov 2017 16:21:22 +0200<br>
&gt;=C2=A0 Subject: [PATCH] Makefile.am: create src directory before attemp=
ting<br>
&gt; to write<br>
&gt; @@ -8,23 +8,21 @@ Otherwise out of tree builds will fail.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Upstream-Status: Pending<br>
&gt;=C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0Makefile.am | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 diff --git a/Makefile.am b/Makefile.am<br>
&gt; -index 9f61ab4..b4ced7f 100644<br>
&gt; +index 441ae94..882969d 100644<br>
&gt;=C2=A0 --- a/Makefile.am<br>
&gt;=C2=A0 +++ b/Makefile.am<br>
&gt; -@@ -79,7 +79,7 @@ EXTRA_DIST =3D src/signames.c README.md<br>
&gt; +@@ -86,7 +86,7 @@ EXTRA_DIST =3D src/signames.c README.md misc/git-<b=
r>
&gt; version-gen<br>
&gt;=C2=A0 =C2=A0CLEANFILES =3D src/signames.h<br>
&gt;=C2=A0 =C2=A0<br>
&gt; - src/signames.h: src/signames.c Makefile<br>
&gt; + src/signames.h: src/signames.c Makefile src/$(am__dirstamp)<br>
<br>
This patch is probably not needed now considering this new change.<br>
<br>
<a href=3D"https://gitlab.com/psmisc/psmisc/commit/b7dc1c5eb9459f83b2355c8f=
061933c74b71c724" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/p=
smisc/psmisc/commit/b7dc1c5eb9459f83b2355c8f061933c74b71c724</a><br>
<br>
Thanks,<br>
<br>
Anuj<br>
</blockquote></div>

--00000000000016658a0597b2ca5a--
