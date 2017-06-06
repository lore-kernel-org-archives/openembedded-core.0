Return-Path: <net147@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9E0DC71DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 22:01:03 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id i7so111759ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jun 2017 15:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S0h74wuFDnt2HZhFZqOE21RYV87ktf5S0WGQbMuuNGM=;
	b=uloxWHhzbp6kBH7GZV/TOn3d/imYuzenUpuD54jbIF6AxVq/rQAqYMT+5+u7oKQgWJ
	4vcljFPs+avutGyleXPnwK5xBfwn7JJCcMZAlUAUved6tvEZurGNVtnTz0UZd8tzfCSJ
	gcB7dIzpQzuJnQWtc6ooFFclT8l/yh24ATzSkOQkZaN7SEjvrTeHSp+FIj5n5CP4bG89
	gtFEU5ikNvRsobIk+pnRu9F0oK0PD16VKJ9cwK9m/WYKVCqna34+SonEAPe/q20GJkEZ
	JY5Yo3XGdbW6SccgceQL8Z6rAQFg7S8SqAmPJcxChkuNWfM4H6rIUcDGjdjW9FsSz62E
	hoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S0h74wuFDnt2HZhFZqOE21RYV87ktf5S0WGQbMuuNGM=;
	b=eswCzV6s/sTesKt5ya8rhqqZcgAamanTBLPcAYi7JtH4a/+sEXNEI/9GZEpxaXf4Vo
	RmPQuydeHHztiuififPJssvoiLfMELcTZz8kCI+RMloDhm3P5mB8uo3OSdtVk03/gDBl
	HPstY89sTst5rZyfBkj8pjQ+GUrv3lg0hOstv36d9Wy5T6PL1oWZzoc+WkxtfCqoRRkh
	sSZXukPVlVF18hvVA3mEW0PoZ8QWItCUCf3wDDd2g5Qxa2A+r2u8nScFp2xi2zhHxtld
	WUX8dMpxghll1AGEjAxh/5EkEZEN4VlUQsAiPMXxolsl30Aqo0PROKMySmScgUN+s90S
	fv0w==
X-Gm-Message-State: AODbwcAsH4VWEPfuK6xHlbxkh0u9sMgGeSW3PsHjJfXNYK4XLcOY3fjk
	EycyAZPPEh8PE//Wy583664OOHM8fA==
X-Received: by 10.107.192.6 with SMTP id q6mr27758061iof.37.1496786463871;
	Tue, 06 Jun 2017 15:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <655290B7709079438B7932553958E60DA13093A0@ESS-EX01.essvote.corp.local>
	<CANwerB2eshSg18OsfbP7fA=EyFBBnrON-PvqeXTRkZrfFngFvQ@mail.gmail.com>
	<655290B7709079438B7932553958E60DA1311709@ESS-EX01.essvote.corp.local>
In-Reply-To: <655290B7709079438B7932553958E60DA1311709@ESS-EX01.essvote.corp.local>
From: Jonathan Liu <net147@gmail.com>
Date: Tue, 06 Jun 2017 22:00:53 +0000
Message-ID: <CANwerB2o98GhytVTMtG97AGjS+dnFEKaq9BsSNv27X=XFGwzKQ@mail.gmail.com>
To: "Davis, Michael" <michael.davis@essvote.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: DISK_SIGNATURE no longer functional
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
X-List-Received-Date: Tue, 06 Jun 2017 22:01:03 -0000
Content-Type: multipart/alternative; boundary="001a114f0b7e7bd752055151c1ce"

--001a114f0b7e7bd752055151c1ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

See https://patchwork.openembedded.org/patch/128565/. SYSLINUX_ROOT was
renamed to ROOT_VM in Krogoth.

Regards,
Jonathan

On Tue., 6 Jun. 2017 at 11:29 pm, Davis, Michael <michael.davis@essvote.com=
>
wrote:

> Pyro.
>
> Guessing something with all the new wic additions killed it.
>
>
> -----Original Message-----
> From: Jonathan Liu [mailto:net147@gmail.com]
> Sent: Monday, June 05, 2017 7:17 PM
> To: Davis, Michael
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [oe-core] DISK_SIGNATURE no longer functional
>
> Hi Michael,
>
> On 21 May 2017 at 03:16, Davis, Michael <michael.davis@essvote.com> wrote=
:
> > I am trying to create a generic MSDOS PC_BIOS hdddirect image with a ro=
ot
> > partition set by the DISK_SIGNATURE.
> >
> > SYSLINUX_ROOT =3D "root=3DPARTUUID=3D${DISK_SIGNATURE}-02"
> >
> >
> >
> > However the signature generated in syslinux.cfg and the one on the disk
> > don=E2=80=99t match.
> >
> > I tried defining my own signature and the one in syslinux changes, but
> the
> > one on the disk doesn=E2=80=99t match.
> >
> >
> >
> > root=3DPARTUUID=3D22aaf83b-02
> >
> >
> >
> > NAME   PARTUUID
> >
> > sdd
> >
> > =E2=94=9C=E2=94=80sdd2 341e84a7-02
> >
> > =E2=94=9C=E2=94=80sdd3 341e84a7-03
> >
> > =E2=94=94=E2=94=80sdd1 341e84a7-01
>
> Which release did DISK_SIGNATURE stop working?
>
> Regards,
> Jonathan
>

--001a114f0b7e7bd752055151c1ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Michael,</div><div><br></div><div>See=C2=A0<a href=3D"https://patch=
work.openembedded.org/patch/128565/">https://patchwork.openembedded.org/pat=
ch/128565/</a>. SYSLINUX_ROOT was renamed to ROOT_VM in Krogoth.</div><div>=
<br></div><div>Regards,</div><div>Jonathan</div><div><br><div class=3D"gmai=
l_quote"><div>On Tue., 6 Jun. 2017 at 11:29 pm, Davis, Michael &lt;<a href=
=3D"mailto:michael.davis@essvote.com">michael.davis@essvote.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Pyro.<br>
<br>
Guessing something with all the new wic additions killed it.<br>
<br>
<br>
-----Original Message-----<br>
From: Jonathan Liu [mailto:<a href=3D"mailto:net147@gmail.com" target=3D"_b=
lank">net147@gmail.com</a>]<br>
Sent: Monday, June 05, 2017 7:17 PM<br>
To: Davis, Michael<br>
Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=3D"_=
blank">openembedded-core@lists.openembedded.org</a><br>
Subject: Re: [OE-core] [oe-core] DISK_SIGNATURE no longer functional<br>
<br>
Hi Michael,<br>
<br>
On 21 May 2017 at 03:16, Davis, Michael &lt;<a href=3D"mailto:michael.davis=
@essvote.com" target=3D"_blank">michael.davis@essvote.com</a>&gt; wrote:<br=
>
&gt; I am trying to create a generic MSDOS PC_BIOS hdddirect image with a r=
oot<br>
&gt; partition set by the DISK_SIGNATURE.<br>
&gt;<br>
&gt; SYSLINUX_ROOT =3D &quot;root=3DPARTUUID=3D${DISK_SIGNATURE}-02&quot;<b=
r>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; However the signature generated in syslinux.cfg and the one on the dis=
k<br>
&gt; don=E2=80=99t match.<br>
&gt;<br>
&gt; I tried defining my own signature and the one in syslinux changes, but=
 the<br>
&gt; one on the disk doesn=E2=80=99t match.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; root=3DPARTUUID=3D22aaf83b-02<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; NAME=C2=A0 =C2=A0PARTUUID<br>
&gt;<br>
&gt; sdd<br>
&gt;<br>
&gt; =E2=94=9C=E2=94=80sdd2 341e84a7-02<br>
&gt;<br>
&gt; =E2=94=9C=E2=94=80sdd3 341e84a7-03<br>
&gt;<br>
&gt; =E2=94=94=E2=94=80sdd1 341e84a7-01<br>
<br>
Which release did DISK_SIGNATURE stop working?<br>
<br>
Regards,<br>
Jonathan<br>
</blockquote></div></div>

--001a114f0b7e7bd752055151c1ce--
