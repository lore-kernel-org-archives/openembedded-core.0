Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3E3AF600E3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 18:03:10 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id f6so1647921ual.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 11:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aHXSieop1Dwt8NNWjbsULK2IZotR4wkCZdNAam6o3Oc=;
	b=GSuSFjZWXc4TxV9Kz7WOZSm4bxV17cLzNPfwsXRDbwQCGSqxtym7wgiwNKZxw3C9Sz
	hp0D3FJvt5vbe3wOJ9qDnXkU4JPzLKcbxNddNmEPvLTNU/SzcOucTuAiAh+QgmVFmuqU
	KC1Gk8hd5iyyVPVYjjOhxtau4OMF594Avf0FcXQ1WE431lJjbrbSSgDgfH/ceqFq5S36
	gaLUYUb8r9YN4MgtNjdOJ00uiz5wwk9HJT+Y9PKn5EjkfT313prSh2xVdQoH4YgNmXQc
	rmgk3O1qQZVsneDE0GaKaDlwLzIywnsqkxZmMcVW34lsyHg3hCLuDS9jaT57ITB922tD
	XekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aHXSieop1Dwt8NNWjbsULK2IZotR4wkCZdNAam6o3Oc=;
	b=svTkRVmPl2oEAwDRhNVxDkFKRSptM8L9U/KJ3LEbiC54Bejp9XM/i7YdKyjWFzuodf
	/RoIMCEq0HepWIw29N9nGUJbHiu9WCCLeIF1arksXGi6RIx1qtU5rFmwAmR8fwfI2E6M
	VLjsGzdZUwponY2ILlFFei5mgObp0wRsF3EdHXiDoMbPKKb1fgbVbbWNfkv+0IuurJfC
	/D7d3tujm/dQ3UQP3n9HdXUrX9CeNujq5HyVW3NELgzyAebM4uLvOOLuJcZtWP/adzEK
	Rzml9VBhGeCnPVdzUrwZ81AV9sqgG/kyyqYubYmfid6Zs83SruVgmvT0gJ/srxmiLUFG
	JOrA==
X-Gm-Message-State: AElRT7FZ0qVIs+sBH4LFHpvDX8tBxhNrSv87bwxyp19UfkL2sEHbmjFg
	qHlrbN0YkfkpVUE59ZVOTKbDBe+QPAkddm7HK5g=
X-Google-Smtp-Source: AG47ELvPtH+i55//dXrduuALOPkvPp5ZeRXrPC83Du/M9D2CgdWCsgQE6HHrnUTGBcSytVzJTBnv10nZvI/aHW/JKsA=
X-Received: by 10.176.29.147 with SMTP id l19mr9366451uak.23.1521568991654;
	Tue, 20 Mar 2018 11:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAPGMVzHSpbw+h_dbc=-9Cdm0_Q3o4EnOEcjH6fxZ3kpv6wwGNg@mail.gmail.com>
	<CAMKF1spNrTtZr4erB-7m-J+R3mzzJoR0t1T66qz-fLbLr54QdQ@mail.gmail.com>
In-Reply-To: <CAMKF1spNrTtZr4erB-7m-J+R3mzzJoR0t1T66qz-fLbLr54QdQ@mail.gmail.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Tue, 20 Mar 2018 18:03:00 +0000
Message-ID: <CAPGMVzE0N_aOUd5m6SruO8OQA2n8nd1CYH1XVKDY6vFK-yqyLw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Packages build via recipe
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
X-List-Received-Date: Tue, 20 Mar 2018 18:03:11 -0000
Content-Type: multipart/alternative; boundary="089e08264cd83fb73a0567dbe39a"

--089e08264cd83fb73a0567dbe39a
Content-Type: text/plain; charset="UTF-8"

There are no recipes related to keras and tensorflow and there is nothing
ok web. As you told the only option is to write one.

On Tue, 20 Mar 2018, 22:12 Khem Raj, <raj.khem@gmail.com> wrote:

> On Tue, Mar 20, 2018 at 5:05 AM, Rajath C S <rajathcs.1996@gmail.com>
> wrote:
> > I have been trying to build keras and tensor flow packages on yocto's
> image
> > that is poky but not able to do so since there are no recipes for them.
> >
> >
> > What's the way to add keras and tensor flow packages to poky?
> >
>
> you can look into layers.openembedded.org and see if they are there.
> if not try to find it on web. otherwise write one
>

--089e08264cd83fb73a0567dbe39a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">There are no recipes related to keras and tensorflow and =
there is nothing ok web. As you told the only option is to write one.</div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, 20 Mar 2018, 22:12 =
Khem Raj, &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">On Tue, Mar 20, 2018 at 5:05 AM, Rajath C S &lt;<a href=3D"m=
ailto:rajathcs.1996@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">rajathcs.1996@gmail.com</a>&gt; wrote:<br>
&gt; I have been trying to build keras and tensor flow packages on yocto&#3=
9;s image<br>
&gt; that is poky but not able to do so since there are no recipes for them=
.<br>
&gt;<br>
&gt;<br>
&gt; What&#39;s the way to add keras and tensor flow packages to poky?<br>
&gt;<br>
<br>
you can look into <a href=3D"http://layers.openembedded.org" rel=3D"norefer=
rer noreferrer noreferrer" target=3D"_blank">layers.openembedded.org</a> an=
d see if they are there.<br>
if not try to find it on web. otherwise write one<br>
</blockquote></div>

--089e08264cd83fb73a0567dbe39a--
