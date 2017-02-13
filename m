Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id EBDDF71D9E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:36:21 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id t18so6934436wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 06:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CN5NpbTMNdpQ2dt4KmrSVZ2T4M8CAaIsJVWczfcJV2M=;
	b=rgE9V8LwMlysB/B/v1lSx5KIXnt63CtEfxwZQOm79PCs87GufU3GNpUkveXHBGfGdw
	PaI5gqDv63BcnzKhZZNsAeUe4di8RKSV+e5G1g9BbP7DZp8dtPTQ+t3oPRk4SEXwn73S
	YzTVUCaMfUukZO80SwgSwXbNdBpREK+V4+RbPe91SgbT1XMlzDVujiMagXpCTRLjXjZv
	trgdbdbNrOpmLz2a99HR9a/jBdUz/gOwkI+lhiR4xvLTECBfVRlCH5ELXq8OPOMXpPEb
	/ongO9rM/My5ogWYIUVsrF7QK9kIbi5pC/DKMXZ6PU9rZoG/ZBlRSoGX1azNkmVIcHmw
	AOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CN5NpbTMNdpQ2dt4KmrSVZ2T4M8CAaIsJVWczfcJV2M=;
	b=hK8WW6LQ0zOMAiwEzmIU/gpkNPVRlSpfy7cQ80njPonNZDsPvcSTc9/RyfUl7ghZyc
	1GJXyE1BOZuQomvfqv7GqCG+KjGGdEJK+kEvcEvk3b0IgyH02hVgJEnEpqxJ3dotH9vk
	YnA9lKbHTKvPfn/rrGGestaF8rCgcDuqamrO3agUgrfSxQ88s42U/qy+cqaGVzEeusop
	bJSuZgGNLek94/eZawOFJG4LshxBimSmeEqB8CM4qo+Bxad5fz8bmn2Aha4Q0zPM/xZn
	dlg4g2GtlKmAmqF4RhnL2LOZEZI5NchlW6GxUaWjtYmntb372PgcUmiOdvZYKOH+A+MM
	6+TQ==
X-Gm-Message-State: AMke39nhQ+pBhMa6cFHoH2gvqCo756IAX/VJU21E5XYZ43NzmVyDISEep6LO/4C4gdV3SiliZ+h4tmHRhjtkcw==
X-Received: by 10.28.211.205 with SMTP id k196mr36546062wmg.124.1486996581667; 
	Mon, 13 Feb 2017 06:36:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Mon, 13 Feb 2017 06:36:21 -0800 (PST)
In-Reply-To: <CALbNGRR1+yVyMC1O1G1mCYp8e87Q2kucGEgs-dL0P3KHxi8WCQ@mail.gmail.com>
References: <CALbNGRSgxbz1F2YLzQ-F2Fn+01hiA4LAoDgQuQ-qLg9KMVTHAw@mail.gmail.com>
	<CALbNGRR1+yVyMC1O1G1mCYp8e87Q2kucGEgs-dL0P3KHxi8WCQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 15:36:21 +0100
Message-ID: <CA+chaQcHBzDJ4UbW1NCex70T56PL02+agOZBMoK4=Q1WWSm2EA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does recipe specific sysrooot (or whatelse in current oe) break native dependencies?
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
X-List-Received-Date: Mon, 13 Feb 2017 14:36:22 -0000
Content-Type: multipart/alternative; boundary=001a1146e4d0086f7405486a5f34

--001a1146e4d0086f7405486a5f34
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

I think it's feature which was already there, but almost never triggered
(even in test-dependencies.sh tests), but with RSS it fails reliably.

See:
http://lists.openembedded.org/pipermail/openembedded-core/2016-July/124435.=
html

On Mon, Feb 13, 2017 at 2:47 PM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Mon, Feb 13, 2017 at 1:26 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > Hi
> >
> > I try to get meta-qt5-extra fit for latest oe-core (RSS). One thing
> > that causes my attention is that many recipes's configure can be fixed
> > by adding gettext-native. This seems odd to me because all of these
> > recipes depend upon kdoctools which depends on gettext-native.
> > For instance for kconfigwidgets depending on kdoctools:
> >
> > * in kdoctool'sworkdir/recipe-sysroot-native/usr/bin there is a gettext
> binary
> > * but in kconfigwidgets'sworkdir/recipe-sysroot-native/usr/bin there
> > isn't a gettext binary
> >
> > Is it possible that recipe specific sysroot broke native dependency
> chain?
> >
> > One note which might be important for this issue: In meta-qt5-extra I
> > chose a the following design decision: If there is a pair of
> > native/cross recipes
> > * each cross recipe depends on native recipe
> > * all other recipes depend on cross recipes
> >
> > This reduced maintenance efforts (I don't have to care if a recipe
> > depends on cross libs or native executables) and avoids race trouble
> > with cmake's toolchain path sequence 1. cross 2. native
> >
> > So what goes wrong here - or where am I mistaken?
> >
> Another more common examples:
>
> * in meta-qt5-extra I could fix many recipes by depending on
> qtbase-native although they already depended on qtbase (qtbase depends
> on qtbase-native)
> * right after recipe specific sysroot a dependency on qtbase-native
> was added in cmake_qt5.bbclass although it depended on qtbase already
> and qtbase depends on qtbase-native
>
> Before we carry on adding dozens of dependencies and blacklisting
> world: Are missing native dependencies a bug or a feature - or where
> am I going wrong? What scares me most is that my way of depending
> always on cross recipes in meta-qt5-extra will not work anymore
> (mentioned in my previous mail) and turn into a unmaintainable burden.
>
> Andreas
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1146e4d0086f7405486a5f34
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Andreas,<div><br></div><div>I think it&#39;s feature wh=
ich was already there, but almost never triggered (even in test-dependencie=
s.sh tests), but with RSS it fails reliably.</div><div><br></div><div>See:<=
/div><div><a href=3D"http://lists.openembedded.org/pipermail/openembedded-c=
ore/2016-July/124435.html">http://lists.openembedded.org/pipermail/openembe=
dded-core/2016-July/124435.html</a><br></div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On Mon, Feb 13, 2017 at 2:47 PM, Andreas =
M=C3=BCller <span dir=3D"ltr">&lt;<a href=3D"mailto:schnitzeltony@googlemai=
l.com" target=3D"_blank">schnitzeltony@googlemail.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon, Feb 13, 2017 at=
 1:26 AM, Andreas M=C3=BCller<br>
&lt;<a href=3D"mailto:schnitzeltony@googlemail.com">schnitzeltony@googlemai=
l.com</a>&gt; wrote:<br>
&gt; Hi<br>
&gt;<br>
&gt; I try to get meta-qt5-extra fit for latest oe-core (RSS). One thing<br=
>
&gt; that causes my attention is that many recipes&#39;s configure can be f=
ixed<br>
&gt; by adding gettext-native. This seems odd to me because all of these<br=
>
&gt; recipes depend upon kdoctools which depends on gettext-native.<br>
&gt; For instance for kconfigwidgets depending on kdoctools:<br>
&gt;<br>
&gt; * in kdoctool&#39;sworkdir/recipe-<wbr>sysroot-native/usr/bin there is=
 a gettext binary<br>
&gt; * but in kconfigwidgets&#39;sworkdir/<wbr>recipe-sysroot-native/usr/bi=
n there<br>
&gt; isn&#39;t a gettext binary<br>
&gt;<br>
&gt; Is it possible that recipe specific sysroot broke native dependency ch=
ain?<br>
&gt;<br>
&gt; One note which might be important for this issue: In meta-qt5-extra I<=
br>
&gt; chose a the following design decision: If there is a pair of<br>
&gt; native/cross recipes<br>
&gt; * each cross recipe depends on native recipe<br>
&gt; * all other recipes depend on cross recipes<br>
&gt;<br>
&gt; This reduced maintenance efforts (I don&#39;t have to care if a recipe=
<br>
&gt; depends on cross libs or native executables) and avoids race trouble<b=
r>
&gt; with cmake&#39;s toolchain path sequence 1. cross 2. native<br>
&gt;<br>
&gt; So what goes wrong here - or where am I mistaken?<br>
&gt;<br>
</span>Another more common examples:<br>
<br>
* in meta-qt5-extra I could fix many recipes by depending on<br>
qtbase-native although they already depended on qtbase (qtbase depends<br>
on qtbase-native)<br>
* right after recipe specific sysroot a dependency on qtbase-native<br>
was added in cmake_qt5.bbclass although it depended on qtbase already<br>
and qtbase depends on qtbase-native<br>
<br>
Before we carry on adding dozens of dependencies and blacklisting<br>
world: Are missing native dependencies a bug or a feature - or where<br>
am I going wrong? What scares me most is that my way of depending<br>
always on cross recipes in meta-qt5-extra will not work anymore<br>
(mentioned in my previous mail) and turn into a unmaintainable burden.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
Andreas<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1146e4d0086f7405486a5f34--
