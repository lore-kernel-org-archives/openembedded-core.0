Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id E4AF561B99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 18:40:06 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id 9so610018uav.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 11:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oTPgUvk+SHJIDGRQtUdeNFYmH1jWrWzFXjj/mo6NJYE=;
	b=KoN/z5aosFCSIpsEFmONWVfeA6K/ud/prmjzlfE6Lc16PqWYZpZphDWEYio1ugSuaG
	PwC/TNeeXTCvU9SI9VHhtGbuP6NeTlUJkGYQqW8u08HJJq8CVitfRXqpZIQhgMgkXNz2
	IvcPA5zvRmtkyCgOWIY/upql2QWH0OOvhsMQHKi4o8yO8iP+iRR1TBcsFzdSnwL7pmWU
	9zj3ndyVipPArodl9HwiRW0OzWCYDERGjB7fXovxGLEHv7+8qEAgDPDjzaLowy1Qc1a7
	vx9Hny57R2lTj1ovEgvjTC9qH5b6TTXLMLvKmLRyZ+/Z5ACrIlsQyz2awWKBz194nHMQ
	Waow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oTPgUvk+SHJIDGRQtUdeNFYmH1jWrWzFXjj/mo6NJYE=;
	b=k9Pt0rUVHR6Sju8CBNi8PcmcL3XrorLcylU5I3t9/CNjmbrw4XYWONwRoC2Vh98x4w
	yetLh7GFCwETsr8SBN1ZK8a/QN2O9vGSjQCfkmLVoj9cCM9yZUcy803RWPOPPsruKyIC
	IABHN+6P0ZKdt74P/63t2rthDUkN6E0+BQJULe1IncQMvObDzS9leqtTIkyp5zgGrrIy
	u536/HVTVctnRf4VbsJROd7Kfun+YbqvRqIEphxzHkG62uKS3M5RolHh5ikXs7lrtxJj
	scazy7nQF06O9VCzxvdZEGRP/exEAP3k9eIUaehVEgn32WyH/dpfGMSeBmzrkD4i+0Zf
	Rsxg==
X-Gm-Message-State: ANhLgQ1GKSlsxS8B/M9nXcvrsGjYVqZvse6Sr98uOw+K9SLWUAlbo0Oj
	L47aiBom9dhvi0UDGlKaUp86yB1XZQIx2zZW39E=
X-Google-Smtp-Source: ADFU+vsC+J/lzHqg+gt7aN16gXcAMHj4VHvuQHne/DAAzgyZujWnJ1YiyiNjSGQlO82GYwOD9QidFBXo8S9QeTH+6Sw=
X-Received: by 2002:ab0:7802:: with SMTP id x2mr2675199uaq.100.1583952007747; 
	Wed, 11 Mar 2020 11:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200311165221.23475-1-domarys.correa@ossystems.com.br>
	<CANNYZj_wh5Xxx38jyzDc6SaFWV9KfVsh=G-k8ceYim=NTi1iVw@mail.gmail.com>
	<CAP9ODKqbUzA1+FKH=nS6oKdg8bj-rzDAzv7nhi6C05Ywu+hQMg@mail.gmail.com>
In-Reply-To: <CAP9ODKqbUzA1+FKH=nS6oKdg8bj-rzDAzv7nhi6C05Ywu+hQMg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 11 Mar 2020 19:39:56 +0100
Message-ID: <CANNYZj_5-=k=T5yhvb_=6hy9RvTkm_uMiaRMs=CwGKNUtrLQ6Q@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston-init: Allow use of weston without input devices
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
X-List-Received-Date: Wed, 11 Mar 2020 18:40:07 -0000
Content-Type: multipart/alternative; boundary="000000000000c35f2e05a098904b"

--000000000000c35f2e05a098904b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

But shouldn=E2=80=99t you take it all the way upstream then and change the =
default
there? My concern is that we currently ship a blank configuration and rely
on defaults and auto-discovery; I wouldn=E2=80=99t want to erode that with =
all
sorts of customizations.

Alex

On Wed 11. Mar 2020 at 19.19, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Hello Alex,
>
> On Wed, Mar 11, 2020 at 2:22 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> > I do not think we should be overriding upstream defaults like this. If
> your use case is different, you can always provide a custom weston.ini
> through a bbappend.
>
> I'd like to argue why, in this case, it makes sense.
>
> The weston is getting more and more adoption and often we use it on
> devices that do not have keyboard and mouse connected. The default
> configuration file, on OE-Core, should be adequate for common use
> cases as we see on embedded devices and failing to start just because
> we lack input devices is far from user-friendly.
>
> We do have a bbappend our multiple customer layers and as it has
> become common we'd like to upstream it as we used quite some time to
> understand why it was failing when we first faced it.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>

--000000000000c35f2e05a098904b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">But shouldn=E2=80=99t you take it all the way upstre=
am then and change the default there? My concern is that we currently ship =
a blank configuration and rely on defaults and auto-discovery; I wouldn=E2=
=80=99t want to erode that with all sorts of customizations.</div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 11. Mar 2020 at =
19.19, Otavio Salvador &lt;<a href=3D"mailto:otavio.salvador@ossystems.com.=
br">otavio.salvador@ossystems.com.br</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Hello Alex,<br>
<br>
On Wed, Mar 11, 2020 at 2:22 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt; I do not think we should be overriding upstream defaults like this. If=
 your use case is different, you can always provide a custom weston.ini thr=
ough a bbappend.<br>
<br>
I&#39;d like to argue why, in this case, it makes sense.<br>
<br>
The weston is getting more and more adoption and often we use it on<br>
devices that do not have keyboard and mouse connected. The default<br>
configuration file, on OE-Core, should be adequate for common use<br>
cases as we see on embedded devices and failing to start just because<br>
we lack input devices is far from user-friendly.<br>
<br>
We do have a bbappend our multiple customer layers and as it has<br>
become common we&#39;d like to upstream it as we used quite some time to<br=
>
understand why it was failing when we first faced it.<br>
<br>
-- <br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: +55 (53) 9 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile: +1 (=
347) 903-9750<br>
</blockquote></div></div>

--000000000000c35f2e05a098904b--
