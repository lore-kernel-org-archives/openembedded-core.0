Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 22D6B7FEC7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 19:00:48 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id x16so5213843uao.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 11:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jbccmhTqfX8786WDp+aUuFs6S/q9fMsJ5BdKa8YRuWo=;
	b=tTMFTTtHrfbekvqEwXcK/R23HKsENdTz8tfXOb3nFbLZSeZJt1T86S/kPr4QJosa2q
	c6SQFVOdCDCBVoBQ42T4MxKbiUxciECUX8tUdT/Fouc4gCc9l6ZAh13CY0wJ3Xu4q5zN
	4m2oj1avhU1KBz6daGomiXcRxpSxW1pWJJssox9Dxf6D97YbTAD+gD9f+y7b5tevXFWW
	xR8lkSqq6gJLx6CdVyfyzUzrQRsghOLmcg6jdhxJLljUJliB7EudxKNuRiqUak/npMQo
	QY44YgFazWbgjms+nymyJ7lSqDWKxndR6lReNyf8BumoTI3Mh/zyJV2OZC3E8YVqe9VV
	FR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jbccmhTqfX8786WDp+aUuFs6S/q9fMsJ5BdKa8YRuWo=;
	b=BPwuPF+xEvBj00PMnkuEwzqj+uKwLthFBVhQWIU3aziBQFGVti+jnTKftcMmIqkzpQ
	/Ep7AK0258gLoxRy0UhnU7JjoIXpubiHtt357DrUa2zAFBL1oSgn/lT5SYkXvva7eCwi
	plzu9thE4oqp3x7bdAXJIesq0UsPgthehfa0zDFQgm4/xbYqbiOBltng9eHPjdTNwBay
	X5zhj5qRtO9yJKFWvqktAyg/OsGG9XKblK/cCgpa8TFLCz1RF8/7lJOoNF+P3bD5zbm2
	KDMbzoTIEzshMdJ+I8U1VCwsO4hFBBIxWiJ7LgCH73FSIKORm14K35jqavptv1EPTBOb
	1Ujg==
X-Gm-Message-State: APjAAAUFpcy+v63jRu9vmNBjQn0J7jGPDeuMTTtOQFCZuZfEV13IFKQB
	+KRFE3xSO2e+m5rdiRALnC/ROA16evz+9mMaOCo=
X-Google-Smtp-Source: APXvYqwwekbsI2ZSxnI4YuU4oiZXXSL5DihGE2rDUDNhdNzcC2hwhLCUCtv2NM7BUmm1A2svcEk7CUayRFRaqFeapws=
X-Received: by 2002:ab0:6894:: with SMTP id t20mr13825100uar.100.1580238049759;
	Tue, 28 Jan 2020 11:00:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580066507.git.raj.khem@gmail.com>
	<d6dd73600145030ed93604364c66b129c8d843af.1580066507.git.raj.khem@gmail.com>
	<20200128110213.3ji3swjy2km22d7e@jama>
	<CAMKF1srz05b3nEVD7tNautZJ5E1WEObajGXi6miukyEVOQaJLw@mail.gmail.com>
	<CANNYZj-e+_y_=FbvoTALYduvi=yRy7j+VhDqHtr8nvmzkp1msA@mail.gmail.com>
	<CAMKF1sqkSGcEFRN-2LKrYKO0WbxSxVX8i9JhgxvQSL3OTSY+aQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqkSGcEFRN-2LKrYKO0WbxSxVX8i9JhgxvQSL3OTSY+aQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Jan 2020 20:00:38 +0100
Message-ID: <CANNYZj9bce0cVH4b+CPdG7RNnu_F=bWVGHoo9=QG_UPbo-Gvtg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/13] glibc: Update to final 2.31 release
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
X-List-Received-Date: Tue, 28 Jan 2020 19:00:49 -0000
Content-Type: multipart/alternative; boundary="0000000000009dd6fb059d37d7d7"

--0000000000009dd6fb059d37d7d7
Content-Type: text/plain; charset="UTF-8"

Sure, and testing prior to actual releases is very beneficial and
appreciated. I only wanted to make sure we don't tag something as 2.31
final when it's still a pre-release.

Alex

On Tue, 28 Jan 2020 at 19:45, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Jan 28, 2020 at 9:48 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > But 2.31 hasn't yet been released or tagged?
> >
>
> No, it will be released first week of February, given how much work is
> required for upgrading
> some of these core pieces, getting some early testing and reporting
> any regressions and addressing
> them while time is left in release works well for OE as well as
> upstream components. So I usually
> do pre-release updates for glibc and gcc for these reasons.
>
> > http://sourceware.org/git/?p=glibc.git
> >
> >
> > Alex
> >
> > On Tue, 28 Jan 2020 at 17:06, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>
> >>
> >> On Tue, Jan 28, 2020 at 3:02 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >>>
> >>> On Sun, Jan 26, 2020 at 11:27:43AM -0800, Khem Raj wrote:
> >>> > Drop ppc 8xx clear cache optimization, which we have been carrying
> >>> > through eglibc days, it has been redone in glibc now
> >>> >
> >>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> > ---
> >>> >  .../glibc/cross-localedef-native_2.31.bb      |   9 +-
> >>> >  meta/recipes-core/glibc/glibc-version.inc     |   2 +-
> >>>
> >>> ...
> >>>
> >>> > diff --git a/meta/recipes-core/glibc/glibc-version.inc
> b/meta/recipes-core/glibc/glibc-version.inc
> >>> > index dca1916e80..c2cfb7e2f1 100644
> >>> > --- a/meta/recipes-core/glibc/glibc-version.inc
> >>> > +++ b/meta/recipes-core/glibc/glibc-version.inc
> >>> > @@ -1,6 +1,6 @@
> >>> >  SRCBRANCH ?= "master"
> >>> >  PV = "2.30.9000"
> >>>
> >>> Should this be 2.31 if the SRCREV is the final version?
> >>
> >>
> >> Yes
> >>
> >>>
> >>>
> >>> > -SRCREV_glibc ?= "def9c08c94da60bfb746644d56cffbe7a9de3477"
> >>> > +SRCREV_glibc ?= "352bb99754ae7c83ff1b974f9c52244e974c9410"
> >>> >  SRCREV_localedef ?= "cd9f958c4c94a638fa7b2b4e21627364f1a1a655"
> >>> >
> >>> >  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
> >>> ...
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000009dd6fb059d37d7d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sure, and testing prior to actual releases is very be=
neficial and appreciated. I only wanted to make sure we don&#39;t tag somet=
hing as 2.31 final when it&#39;s still a pre-release.</div><div><br></div><=
div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, 28 Jan 2020 at 19:45, Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Tue, Jan 28, 2020 at 9:48 AM A=
lexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; But 2.31 hasn&#39;t yet been released or tagged?<br>
&gt;<br>
<br>
No, it will be released first week of February, given how much work is<br>
required for upgrading<br>
some of these core pieces, getting some early testing and reporting<br>
any regressions and addressing<br>
them while time is left in release works well for OE as well as<br>
upstream components. So I usually<br>
do pre-release updates for glibc and gcc for these reasons.<br>
<br>
&gt; <a href=3D"http://sourceware.org/git/?p=3Dglibc.git" rel=3D"noreferrer=
" target=3D"_blank">http://sourceware.org/git/?p=3Dglibc.git</a><br>
&gt;<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Tue, 28 Jan 2020 at 17:06, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Jan 28, 2020 at 3:02 AM Martin Jansa &lt;<a href=3D"mailto=
:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; w=
rote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Sun, Jan 26, 2020 at 11:27:43AM -0800, Khem Raj wrote:<br>
&gt;&gt;&gt; &gt; Drop ppc 8xx clear cache optimization, which we have been=
 carrying<br>
&gt;&gt;&gt; &gt; through eglibc days, it has been redone in glibc now<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt;&gt; &gt; ---<br>
&gt;&gt;&gt; &gt;=C2=A0 .../glibc/<a href=3D"http://cross-localedef-native_=
2.31.bb" rel=3D"noreferrer" target=3D"_blank">cross-localedef-native_2.31.b=
b</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-<br>
&gt;&gt;&gt; &gt;=C2=A0 meta/recipes-core/glibc/glibc-version.inc=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ...<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt; diff --git a/meta/recipes-core/glibc/glibc-version.inc b/=
meta/recipes-core/glibc/glibc-version.inc<br>
&gt;&gt;&gt; &gt; index dca1916e80..c2cfb7e2f1 100644<br>
&gt;&gt;&gt; &gt; --- a/meta/recipes-core/glibc/glibc-version.inc<br>
&gt;&gt;&gt; &gt; +++ b/meta/recipes-core/glibc/glibc-version.inc<br>
&gt;&gt;&gt; &gt; @@ -1,6 +1,6 @@<br>
&gt;&gt;&gt; &gt;=C2=A0 SRCBRANCH ?=3D &quot;master&quot;<br>
&gt;&gt;&gt; &gt;=C2=A0 PV =3D &quot;2.30.9000&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Should this be 2.31 if the SRCREV is the final version?<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Yes<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt; -SRCREV_glibc ?=3D &quot;def9c08c94da60bfb746644d56cffbe7=
a9de3477&quot;<br>
&gt;&gt;&gt; &gt; +SRCREV_glibc ?=3D &quot;352bb99754ae7c83ff1b974f9c52244e=
974c9410&quot;<br>
&gt;&gt;&gt; &gt;=C2=A0 SRCREV_localedef ?=3D &quot;cd9f958c4c94a638fa7b2b4=
e21627364f1a1a655&quot;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 GLIBC_GIT_URI ?=3D &quot;git://<a href=3D"http://so=
urceware.org/git/glibc.git" rel=3D"noreferrer" target=3D"_blank">sourceware=
.org/git/glibc.git</a>&quot;<br>
&gt;&gt;&gt; ...<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000009dd6fb059d37d7d7--
