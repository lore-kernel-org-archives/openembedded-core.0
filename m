Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4E4507FE56
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 13:16:26 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id b4so4124280vsa.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 05:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1TEyGYlGJEoXkUXODJKhgzedEWQ2Bq29jj00Eq3+y/c=;
	b=HFgjyZBaSqqo91NS1GzgNWm+LDhGsbRB1rinxMwsJtn+KSUDUE4MlXkqqLM3ReUbDI
	nUcMmNk+7bsT1C38lyoTugK+4e8F9dNjP7nmAr/NzKcN0ySxk3CBUV3iBz3UCv/zL5JE
	ZQl3O3HUbv6+Pjv3Wgu0xFBLyIX6fmEYofn5Tpinrwu+GRiFQDqz6HdSbS1KGnIPxGY1
	KBFLgvoSa4rEz/m1tA8OQo6XDmlt47d6tpANAMTzw5CLcH/eI9NSvDeL/CFHvZ8Z84K0
	4lofNldPSlyno7B+r2/CzBEY0BXQ+ANtO3bsgp85x93ldhYNua4YKD5Oyu3qV4xE03rc
	JgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1TEyGYlGJEoXkUXODJKhgzedEWQ2Bq29jj00Eq3+y/c=;
	b=l6tJxKN1hAbNfSthRPQTKVEr8p57tdtCNth6P62E24qq7ZDkgP8kXg+Mm2Fs9y4dtO
	3pziObx5ZjA51ZFK7+uvULbJUvIq8SRnS1Wa6bDDHdBEvuAMv7kv4H12MsDDENBPECJv
	fsQxdBK5hLw1YsonkFbSCzkCdbgY/T6znWSZox3Cf8/v//KVD3CUMpMwPJPEX44slaRb
	eyR9/PdukbqeWP3DlHXdPCXrhT7zInlwc+naJGfHOMcrLxT7q5wtTBPxXxPn24ksQBR5
	Qkw8O/8uyoBPyXj98Mf4U4aGuhc7QdEi944nJdxfgtR4F1/nxo02iyUBPyGTwNhScTUq
	jRuw==
X-Gm-Message-State: APjAAAVdMH0FmdOKjGF0gYfa7Y+ysMyJMtEf39KQrOOJnHG+oll5FVwb
	fWlaQrgXLgFAgjvdq79IpmeWmohFY6v3J5dj/HM=
X-Google-Smtp-Source: APXvYqwLvCWYlHajxTBgI36GOKAFG2IlgTObtziICjj074kK4bo9Akii1mfaRVqsAcFAQpSw0eHHVKDBtiZDRy4b8vE=
X-Received: by 2002:a67:3187:: with SMTP id x129mr6116432vsx.23.1578575786967; 
	Thu, 09 Jan 2020 05:16:26 -0800 (PST)
MIME-Version: 1.0
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-14-alex.kanavin@gmail.com>
	<2fc677f1e980e80cd75d8b2e3c926556be06a8ef.camel@linuxfoundation.org>
	<CAMKF1sp2+x5P0368UKgZr6DuFPy-0k1=fR3tnUwSwFdmyiWHqg@mail.gmail.com>
	<20200109114604.GA29022@localhost>
In-Reply-To: <20200109114604.GA29022@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jan 2020 14:16:15 +0100
Message-ID: <CANNYZj9D7-oCiUkKUDS0Wjs5dnfWz+ozsVL1tvMgsJWpQxKJ-g@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/28] libcap: update to 2.30
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
X-List-Received-Date: Thu, 09 Jan 2020 13:16:26 -0000
Content-Type: multipart/alternative; boundary="0000000000000887e4059bb4d1e4"

--0000000000000887e4059bb4d1e4
Content-Type: text/plain; charset="UTF-8"

Thanks, this is now resolved.

Alex

On Thu, 9 Jan 2020 at 12:46, Adrian Bunk <bunk@stusta.de> wrote:

> On Wed, Jan 08, 2020 at 05:31:45PM -0800, Khem Raj wrote:
> > On Wed, Jan 8, 2020 at 1:22 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Wed, 2020-01-08 at 14:27 +0100, Alexander Kanavin wrote:
> > > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > ---
> > > >  ...-tests-do-not-run-target-executables.patch | 33
> > > > +++++++++++++++++++
> > > >  .../libcap/{libcap_2.27.bb => libcap_2.30.bb} |  5 +--
> > > >  2 files changed, 36 insertions(+), 2 deletions(-)
> > > >  create mode 100644 meta/recipes-support/libcap/files/0002-tests-do-
> > > > not-run-target-executables.patch
> > > >  rename meta/recipes-support/libcap/{libcap_2.27.bb =>
> > > > libcap_2.30.bb} (90%)
> > >
> > > I think this causes iputils to fail to build:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/331
> >
> > also
> > https://errors.yoctoproject.org/Errors/Details/305696/
>
> https://github.com/iputils/iputils/issues/246
>
> cu
> Adrian
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000000887e4059bb4d1e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, this is now resolved.</div><div><br></div><di=
v>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, 9 Jan 2020 at 12:46, Adrian Bunk &lt;<a href=3D"mai=
lto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Wed, Jan 08, 2020 at 05:31:45PM -0800,=
 Khem Raj wrote:<br>
&gt; On Wed, Jan 8, 2020 at 1:22 PM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Wed, 2020-01-08 at 14:27 +0100, Alexander Kanavin wrote:<br>
&gt; &gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.=
kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 ...-tests-do-not-run-target-executables.patch | 33<br>
&gt; &gt; &gt; +++++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 .../libcap/{<a href=3D"http://libcap_2.27.bb" rel=3D"n=
oreferrer" target=3D"_blank">libcap_2.27.bb</a> =3D&gt; <a href=3D"http://l=
ibcap_2.30.bb" rel=3D"noreferrer" target=3D"_blank">libcap_2.30.bb</a>} |=
=C2=A0 5 +--<br>
&gt; &gt; &gt;=C2=A0 2 files changed, 36 insertions(+), 2 deletions(-)<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-support/libcap/files/0=
002-tests-do-<br>
&gt; &gt; &gt; not-run-target-executables.patch<br>
&gt; &gt; &gt;=C2=A0 rename meta/recipes-support/libcap/{<a href=3D"http://=
libcap_2.27.bb" rel=3D"noreferrer" target=3D"_blank">libcap_2.27.bb</a> =3D=
&gt;<br>
&gt; &gt; &gt; <a href=3D"http://libcap_2.30.bb" rel=3D"noreferrer" target=
=3D"_blank">libcap_2.30.bb</a>} (90%)<br>
&gt; &gt;<br>
&gt; &gt; I think this causes iputils to fail to build:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/104/builds/331" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/104/builds/331</a><br>
&gt; <br>
&gt; also<br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/305696/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/De=
tails/305696/</a><br>
<br>
<a href=3D"https://github.com/iputils/iputils/issues/246" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/iputils/iputils/issues/246</a><br>
<br>
cu<br>
Adrian<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000000887e4059bb4d1e4--
