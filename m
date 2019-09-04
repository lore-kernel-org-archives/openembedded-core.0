Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3ACDB7F2B5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 10:04:51 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id h192so4235664vka.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 03:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MvwR9n+WYpV9GDvf+49Espe7JuT43pTYu6Vy7i8EEG8=;
	b=KuKIJdnd95BPHDGCHya+w3G8ZKj9RbyLe0JRv03fd66Q/X00VWEDnvErteDSu3UKSH
	uYeBMcbKpGZ4LzKK7P0og7U+ioT/OW501g0Q/QMob4swBA2XHyd+FJkb8sRGbosgBxIq
	ke4VOhZRr2zdnY8GbrpSdetQqJxoa4mrX/JmHkBwJ3NihaBhcJlTIBieAkuOBEhADQrn
	xkGyxx6I5lcaMXezOaJssvKmUBOF1D/V5c/2eY9Pf+5tpJAbdb9O2gVLnGs3HwslSAgl
	fOXGoOuQS8oBzA0C4hePRxumVVMwWE8+rXh0b2s0MvpmPQWkuEjY4pGvihozOJ7JoxtC
	mT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MvwR9n+WYpV9GDvf+49Espe7JuT43pTYu6Vy7i8EEG8=;
	b=D3op8DGEmxp3HNiUAXR8z3YpQci4G32Wud7DeUA2AkIvSTQJwFP2XtJdK6f8L/AAG8
	2Q0mVtvCFa5jOEumo3LxIo9HYniCIYpQkERPTJ+gOvUDkXnU+DfZwbC0R9dx3YgjC1BL
	FfZJwye6IdLFjA/C7JTn8/bBZO+nZkT7C1A8fFGEc9LXhyHy70OQxFDiFgNqUdMksjMH
	92nyXc69bksXsjgNp9uEko6tPGp11g+mFuSqIK64HSfs2D6lb+sQWkF1lJcUIn1RiRec
	2t3Rn5OAG/BM/PcMzRYUZXhhiyQlbuq2RLpbe8ER7dLLoezOvo7nZbWpDFaSwEQwoMvD
	6vMg==
X-Gm-Message-State: APjAAAWgWSRpDKil8E6/jjKZVY4CuwbhabiL1WLPQaA3BeWkXdFDLciO
	RQiYuZ7piiFMTv5BKIgLGhVm3RiiH+db1yjUVqJgXA==
X-Google-Smtp-Source: APXvYqzN1yfjj148Eca6Ce5Fjg6xvBJEHNEa/4Oanv8r5TeHfNKBhbtCuUwOcpQ2WISmV4tMobDggtDfQI1s+QUSx+w=
X-Received: by 2002:ac5:ce9d:: with SMTP id 29mr5256689vke.72.1567591491926;
	Wed, 04 Sep 2019 03:04:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190903163241.87739-1-alex.kanavin@gmail.com>
	<20190904073239.rlk6spusid6m2zbd@qschulz>
In-Reply-To: <20190904073239.rlk6spusid6m2zbd@qschulz>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Sep 2019 12:04:40 +0200
Message-ID: <CANNYZj-uTxW=4pn6mJiwomBT91f3DUZ_+YbM0N5WPsuAyaU-TA@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: allow shell-style wildcards in PRIVATE_LIBS
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
X-List-Received-Date: Wed, 04 Sep 2019 10:04:51 -0000
Content-Type: multipart/alternative; boundary="00000000000007812a0591b756f6"

--00000000000007812a0591b756f6
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Sep 2019 at 09:32, Quentin Schulz <
quentin.schulz@streamunlimited.com> wrote:

> >                      # if library is private (only used by package) then
> do not build shlib for it
> > -                    if not private_libs or this_soname not in
> private_libs:
> > +                    import fnmatch
> > +                    if not private_libs or len([i for i in private_libs
> if fnmatch.fnmatch(this_soname, i)]) == 0:
>
> We only need to know if this_soname is matching one of the patterns, we
> don't need to check for each and every pattern.
>
> Something like:
>
> for pattern in private_libs:
>         if fnmatch.fnmatch(this_soname, pattern)]) == 0:
>                 sonames.add(prov)
>                 break
>
> would be possible?
>

Yes, although there should only be very few patterns, and most of the time
just one: *.so*. Not worth it I'd say. There are other spots in do_package
which truly slow down things and could use a bit of optimization.

Alex

--00000000000007812a0591b756f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 4 Sep 2019 at 09:32, Quentin Schu=
lz &lt;<a href=3D"mailto:quentin.schulz@streamunlimited.com">quentin.schulz=
@streamunlimited.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">&gt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # if library is privat=
e (only used by package) then do not build shlib for it<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if not private_libs or this_soname not in private_libs:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 import fnmatch<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if not private_libs or len([i for i in private_libs if fnmatch.fnmatch(thi=
s_soname, i)]) =3D=3D 0:<br>
<br>
We only need to know if this_soname is matching one of the patterns, we<br>
don&#39;t need to check for each and every pattern.<br>
<br>
Something like:<br>
<br>
for pattern in private_libs:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if fnmatch.fnmatch(this_soname, pattern)]) =3D=
=3D 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sonames.add(prov)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
<br>
would be possible?<br></blockquote><div><br></div>Yes, although there shoul=
d only be very few patterns, and most of the time just one: *.so*. Not wort=
h it I&#39;d say. There are other spots in do_package which truly slow down=
 things and could use a bit of optimization.<br></div><div class=3D"gmail_q=
uote"><br></div><div class=3D"gmail_quote">Alex<br></div></div>

--00000000000007812a0591b756f6--
