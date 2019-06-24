Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id BB8E971BB9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 01:50:00 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id w25so491009ioc.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 18:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dHR0Yg1xUmtZiPuaelnDA1+GNPz5m+EsydRHQ0ZNQkc=;
	b=D7l+r5Pmhiak6RS8hF4ISN5SC9wV2b667UxgDCtwDc/YmXdVILPIF7AuIF0xiwp/wL
	CnsstEZh6WC7206a2xnvEGyGKZTkEJ2+YWrHrptElZ9np8cddhBoM+e86bj2yIkbE5hE
	NwcdnpQF9TBBFjC86A0RIiyHwL2Xhi82H6MeRP2+Nu2LStALTWuBG569XYHLCUmbpL0z
	cDeNY9ilTp1TZomJrDa504F8ECWPvfG/u79o1OaeKk0GQWBFxBBELayiVlGH5XCVvZTW
	QLZ+odrSD5SUaGrMjo8uf+PEWAfxkLhZsUHCHMldmpHuxDDRNwCrcNllM88cmr6QwEpv
	zp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dHR0Yg1xUmtZiPuaelnDA1+GNPz5m+EsydRHQ0ZNQkc=;
	b=M+3mmpnYPyhIm045+Cyh7129XVmNqN235oTrCJzuXvtIMjWMZPjGCZsHonUDXqko3u
	KY0CSUxT1DuEfOR08OU6eKRe6t3mI7xZNVdxChLZtOjjcAkbdGXNJelCB3jfkvXhs8ge
	yq/r5Agi3AbvDanQOUlFQHHxjqQLs89dcCe/tQ7lUOpiCaD1BsfEIvHVaCCokGJw5u2P
	HT1Gtwy2Rr9lJFZaOtWus+GHIb+zFaCL0Jq4vppmV3NYGjuJYL7BSzeobNKGN2LWIcq3
	YnwoItcbHGLYdyRW0K4yl5axM+RVvGAqGyh0TcsnkidPL8lBk+leA38VmTbLfeDJZHS2
	aMew==
X-Gm-Message-State: APjAAAWjwMeQAGCfOcCD5ZIC3J2XJsUid8ockrbdh1s2AEQ6tcl7opEG
	9Ax/7HmVgP6mLwIW2vOwF1KbObzFNbvWrSSzQ+A=
X-Google-Smtp-Source: APXvYqzUzLUf3CvZ8r0OvwgRcYsp1lQar6YcdoxsoW+/MFzDWrsz8Ahcn4qicr3BXb0/vDia1uOn7exwYaABJ4xVLJY=
X-Received: by 2002:a02:1146:: with SMTP id 67mr128593857jaf.10.1561341001614; 
	Sun, 23 Jun 2019 18:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
	<0f5adba2f96da9396faa1e70f9eed84118cf735e.1559950879.git.timothy.t.orling@linux.intel.com>
	<CAMKF1sq5aOZ+6CSP+G88+JCYd4zMb6ZSe5MP5KWSSofPRbe4Ow@mail.gmail.com>
	<CANx9H-DLg1_vSEi1bBSSLCmycdyEa2MiJjZ9d=Owsc5bsR-GBA@mail.gmail.com>
	<CAMKF1sr+Ffk0nCd3aVhGfsdRreFX7cpqEAqH8606LMqg=-ijww@mail.gmail.com>
	<20190622085840.GB9472@localhost>
	<CAMKF1sq7AwbG_pM3sivhvQjaJ_mwR6R-GDEv5J23rpEYjsMT2Q@mail.gmail.com>
	<CANx9H-C63ech2pPxYwirWJRE4-p9uQTA0zcBAzepYK0L4mth0Q@mail.gmail.com>
	<20190623192439.GA11669@localhost>
In-Reply-To: <20190623192439.GA11669@localhost>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 23 Jun 2019 18:49:50 -0700
Message-ID: <CANx9H-B=vJdbtyx6RytcKro3E5WrT9O+PCScMfnXW=Jy3CzuNg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] scons.bbclass: use python3-scons
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
X-List-Received-Date: Mon, 24 Jun 2019 01:50:00 -0000
Content-Type: multipart/alternative; boundary="000000000000c64ba7058c0807ba"

--000000000000c64ba7058c0807ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 12:24 PM Adrian Bunk <bunk@stusta.de> wrote:

> On Sun, Jun 23, 2019 at 09:44:07AM -0700, Tim Orling wrote:
> > On Sat, Jun 22, 2019 at 5:03 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > >
> > >
> > > On Sat, Jun 22, 2019 at 1:58 AM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > >> On Thu, Jun 20, 2019 at 09:27:15PM -0600, Khem Raj wrote:
> > >> > On Thu, Jun 20, 2019 at 6:18 PM Tim Orling <ticotimo@gmail.com>
> wrote:
> > >> >...
> > >> > > Latest mongo release appears to be 4.3.0 and appears to support
> > >> python3:
> > >> > >
> > >> > >
> > >> > >
> > >>
> https://github.com/mongodb/mongo/blob/89e7419a897b2270931c9c029abf6de555d=
83e0f/SConstruct
> > >> > >
> > >> > > Is this an aceptable upgrade? I am not savvy on which versions a=
re
> > >> > > desirable.
> > >> >
> > >> > Yes for master this upgrade is fine
> > >>
> > >> Are you approving the changed licence for OE,
> > >> or were you not aware that this was the question?
> > >>
> > >
> > > What has changed between 4.0.6 and 4.3.0 w.r.t. licensing ?
> > >
> >
> > The Server Side License is already in 4.0.6
> >
> https://github.com/mongodb/mongo/blob/caa42a1f75a56c7643d0b68d3880444375e=
c42e3/LICENSE-Community.txt
> >...
>
> Ah sorry, I missed that.


>
I didn=E2=80=99t know either. And you are correct in identifying what I was
asking.... (without asking)


> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
>

--000000000000c64ba7058c0807ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jun 23, 2019 at 12:24 PM Adrian Bunk &lt;<a href=3D=
"mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">On Sun, Jun 23, 2019 at 09:44:07AM -0700, Tim Orling wro=
te:<br>
&gt; On Sat, Jun 22, 2019 at 5:03 PM Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Sat, Jun 22, 2019 at 1:58 AM Adrian Bunk &lt;<a href=3D"mailto=
:bunk@stusta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; On Thu, Jun 20, 2019 at 09:27:15PM -0600, Khem Raj wrote:<br>
&gt; &gt;&gt; &gt; On Thu, Jun 20, 2019 at 6:18 PM Tim Orling &lt;<a href=
=3D"mailto:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt;=
 wrote:<br>
&gt; &gt;&gt; &gt;...<br>
&gt; &gt;&gt; &gt; &gt; Latest mongo release appears to be 4.3.0 and appear=
s to support<br>
&gt; &gt;&gt; python3:<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; <a href=3D"https://github.com/mongodb/mongo/blob/89e7419a897b=
2270931c9c029abf6de555d83e0f/SConstruct" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/mongodb/mongo/blob/89e7419a897b2270931c9c029abf6de555=
d83e0f/SConstruct</a><br>
&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt; &gt; Is this an aceptable upgrade? I am not savvy on whi=
ch versions are<br>
&gt; &gt;&gt; &gt; &gt; desirable.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Yes for master this upgrade is fine<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Are you approving the changed licence for OE,<br>
&gt; &gt;&gt; or were you not aware that this was the question?<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; What has changed between 4.0.6 and 4.3.0 w.r.t. licensing ?<br>
&gt; &gt;<br>
&gt; <br>
&gt; The Server Side License is already in 4.0.6<br>
&gt; <a href=3D"https://github.com/mongodb/mongo/blob/caa42a1f75a56c7643d0b=
68d3880444375ec42e3/LICENSE-Community.txt" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/mongodb/mongo/blob/caa42a1f75a56c7643d0b68d38804443=
75ec42e3/LICENSE-Community.txt</a><br>
&gt;...<br>
<br>
Ah sorry, I missed that.</blockquote><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I didn=E2=80=99t=
 know either. And you are correct in identifying what I was asking.... (wit=
hout asking)</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><br>
cu<br>
Adrian<br>
<br>
-- <br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Is there not promise of rain?&quot; Ling T=
an asked suddenly out<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of the darkness. There had been need of rain fo=
r many days.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Only a promise,&quot; Lao Er said.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pearl S. =
Buck - Dragon Seed<br>
<br>
</blockquote></div></div>

--000000000000c64ba7058c0807ba--
