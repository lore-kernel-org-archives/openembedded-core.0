Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 5368560116;
	Tue, 19 Apr 2016 02:17:39 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id o126so5209685iod.0;
	Mon, 18 Apr 2016 19:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JaM7UPcMV19lpmPo8wXUSKbW+780asOElM6OrMByUJc=;
	b=egTMfOOlmw2JcRF4hmB7Qu8ofcTP/ko5KND/U7waB2tie6GUD5ggUklFdBoTj/M12W
	WdmgYrZoJJASnAry+hVNWDD9pF7UYV9r3LrN+AowR516hUwqhH8J9ts6a0622ZxGtaHg
	dOsRWtnxNfMmziTYTji1s6+uK3SiJVpo6E+8uZ1iHHY0M8tAJ3MjonVu+SIcdNRZ49RP
	HD3N8DyRbAXE7XhpkTHM/ciiehI/oxnaZUdkTEEjswL/kLh/e/nqv+iDtCt3UrcV2+NH
	iwYRfu5veMHxCQ3fJ8mtlRBF8Q2xuzmhrGdo1skeBhOFg7IjS/M2F6qsgrHtzavVNgaM
	Z+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JaM7UPcMV19lpmPo8wXUSKbW+780asOElM6OrMByUJc=;
	b=F+MZXZhC+FQj7Z7OMVjCFGi1QejN/Xi7yppbiA1i2yI9H27/YVwdvRjNaGj9EBJGeK
	IHFsaW5mPpxGu3q3OSdJLZGy70++vrZMyGQZA6vOjvuGAMS5BTu+RnaI17CiUjKukTjx
	INXryi0ATNwSbbifRmV0hywk5LuEHIw62eOU50J5pGIwahriEn43Vg7hB4beNDTLqBr6
	s7hJGPKO7n4+f0ZsQBAPTpU2EAn8iLaKb9ujtp0Hr7f9pcPdlZrQzMao16BS5naqHS2A
	ghx5k4crf2ohXdPAiGn4mEqdJp2J71yJzHQddFMO1OLi/cS1vOMAS9Ehbt0kILIbV3lx
	T+nQ==
X-Gm-Message-State: AOPr4FVXZD2huYdUNaMMB2BhnHkKQxxbyOSHSa7aeShOslmb0/r9c8udp6lYzwCo+kzmFkLvxvN7AIDAlIl+kw==
X-Received: by 10.107.131.12 with SMTP id f12mr957101iod.126.1461032260419;
	Mon, 18 Apr 2016 19:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAJTo0LZtDL-hbxXmYWdgf7HTZtSA4D2FgRKtx1+n6Rqxq50n=g@mail.gmail.com>
	<CAMKF1spGMHQMVP_-mrHYmDnjM+DPk0mktK_e+9G1bekuP6PnUA@mail.gmail.com>
	<1461019868.9308.224.camel@linuxfoundation.org>
	<CAMKF1spKB=HXLipbo_qFBY6mo67LOWAB-uQxRA25ghZTwD=i5Q@mail.gmail.com>
In-Reply-To: <CAMKF1spKB=HXLipbo_qFBY6mo67LOWAB-uQxRA25ghZTwD=i5Q@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 19 Apr 2016 02:17:30 +0000
Message-ID: <CABcZANm7+ewyU8d2iMkMM6uNB7ZSBhcToE3g=rKWkAxrGCP85w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: yocto@yoctoproject.org, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: bugzilla.yoctoproject.org policy for bugs against multiple releases
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
X-List-Received-Date: Tue, 19 Apr 2016 02:17:41 -0000
Content-Type: multipart/alternative; boundary=001a113f31c2e345e40530cd1414

--001a113f31c2e345e40530cd1414
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 18, 2016 at 5:50 PM Khem Raj <raj.khem@gmail.com> wrote:

>
> On Apr 18, 2016 3:51 PM, "Richard Purdie" <
> richard.purdie@linuxfoundation.org> wrote:
> >
> > On Mon, 2016-04-18 at 10:35 -0700, Khem Raj wrote:
> > > Can we have a possibility to select  field like "affected version"
> > > and have it such that multiple versions can be specified
> >
> > That doesn't really allow us to mark version X as merged and version Y
> > as pending review though and as I understand it, that is the real issue
> > atm :/.
>
> May be bugzilla can be programmed to have such triggers. Having separate
> bug is not a good looking solution
>

I'd agree that it's not ideal, but it's definitely a *common* solution in
many bug tracking systems, since it's usually the only way to maintain
separate states for each version. I know I've seen it done that way in
bugzilla, jira, and others over the years.

There may be something better out there, and if we can find it, great, but
I think separate issues is better than not addressing the issue at all, but
only if the tooling is good enough to help reduce overhead on the part of
the devs dealing with it. Issue tracker overhead gets pretty frustrating at
times.

--001a113f31c2e345e40530cd1414
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon=
, Apr 18, 2016 at 5:50 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><p dir=3D"ltr"><br>
On Apr 18, 2016 3:51 PM, &quot;Richard Purdie&quot; &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfo=
undation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, 2016-04-18 at 10:35 -0700, Khem Raj wrote:<br>
&gt; &gt; Can we have a possibility to select=C2=A0 field like &quot;affect=
ed version&quot;<br>
&gt; &gt; and have it such that multiple versions can be specified<br>
&gt;<br>
&gt; That doesn&#39;t really allow us to mark version X as merged and versi=
on Y<br>
&gt; as pending review though and as I understand it, that is the real issu=
e<br>
&gt; atm :/.</p>
<p dir=3D"ltr">May be bugzilla can be programmed to have such triggers. Hav=
ing separate bug is not a good looking solution</p></blockquote><div><br></=
div><div>I&#39;d agree that it&#39;s not ideal, but it&#39;s definitely a *=
common* solution in many bug tracking systems, since it&#39;s usually the o=
nly way to maintain separate states for each version. I know I&#39;ve seen =
it done that way in bugzilla, jira, and others over the years.</div><div><b=
r></div><div>There may be something better out there, and if we can find it=
, great, but I think separate issues is better than not addressing the issu=
e at all, but only if the tooling is good enough to help reduce overhead on=
 the part of the devs dealing with it. Issue tracker overhead gets pretty f=
rustrating at times.</div></div></div>

--001a113f31c2e345e40530cd1414--
