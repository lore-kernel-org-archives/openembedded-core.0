Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web12.3174.1593233963053166282
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 21:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SfkXvgMC;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id h4so11965746ior.5
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 21:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ha8wmsTOchBxOlY4oJxM/MiUKKG81elQ5Rn6dEBIbMg=;
        b=SfkXvgMCKudKOnxtynR6ljJE/h8W8ZZ+ih0BVpfrG4wnWuWwjzdzCc/VYfTUjiK3Y2
         KJkx9hMVdYa2qdpR59mqOxdga6Txt5aLri+syusQkh7d29qQFz+5pMiy7MJAiwfvu4dw
         iiTKRbVDqUJmH2AorzTspfJ6G2Y4WcnmezJO3u3RIlbSOK+bD3ts87YQO//Sd/fGB9kv
         DppGJjh+Xo3etb4ApMStvkJ58sooCOUPkckCDiMzN6fmbI8iWsSNh2vJ/vjKILkNBtf+
         +/MZvwD5n2TT0LF1bKrEFIzjVpVQNrEVL7gR3ouQCV0ja2Dc9+ygRM1l9CnGaje59pDR
         qKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ha8wmsTOchBxOlY4oJxM/MiUKKG81elQ5Rn6dEBIbMg=;
        b=CeVOS7Z/bTRRHOcq3ATU1xtSOI8zl1xMQVoYwY742sv23cXsK9PhX0OXB+RmpSERZ8
         uQNEIFSdoUAFD2o3xj3g85nfMKbcGhBZhzdj4dNuLzWV2jlvzqhG4g3cEYo0XDmg4RK4
         52xRftoMP+8IdYCKnmbxv9+OacSDW4oKCJ/r1O50fI41T2OWCzxnBCVI29oiCl59Nw/2
         6jnEM2iHE7vULksCRO0aKIksfgAHK01DSR7iwNnyZgLG84xW9OUm97fgBJCsfrNsBXsl
         B4rs26clwMUxXRt7/MBx5yfyqzXUHQOq748cwd5y7rj/8JqiG25jOBOFP9oRiKJwM9jB
         x5pg==
X-Gm-Message-State: AOAM533mEcRuuLLCSk9aDrcUOmSlnIf/kLbqZXxM3zX0eiAzs1LQPwNL
	yUolIzmlnJYv00xD7ZHjW4B9QmH3GYB0d3c+Hw4=
X-Google-Smtp-Source: ABdhPJzruaBFZaeW68m6Z9KTq/TSwEqQslcIr7CbdBYguPcZvLuf/+grmgA3iGDElIT4a/VPWDLNDUBtSJPWqyDARe4=
X-Received: by 2002:a05:6602:164f:: with SMTP id y15mr6988468iow.210.1593233962249;
 Fri, 26 Jun 2020 21:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200625101413.2783-1-fredrigu@axis.com> <CAAnfSTuK-ucvmFTK9+oexvPyaXgTg4Tn3nhKSMwjhRxe=NUXrw@mail.gmail.com>
In-Reply-To: <CAAnfSTuK-ucvmFTK9+oexvPyaXgTg4Tn3nhKSMwjhRxe=NUXrw@mail.gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 26 Jun 2020 21:59:11 -0700
Message-ID: <CANx9H-DtOwG74TJhPeakMpQz-gSQkFtUcpOL5HQD+G_hCxYJJA@mail.gmail.com>
Subject: Re: [OE-core] Add package managers as a plugin
To: Ross Burton <ross@burtonini.com>
Cc: Fredrik Gustafsson <fredrik.gustafsson@axis.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, hugo.cedervall@axis.com, 
	tools-cfpbuild-internal@axis.com
Content-Type: multipart/alternative; boundary="0000000000005d33b205a909b0a9"

--0000000000005d33b205a909b0a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2020 at 3:53 AM Ross Burton <ross@burtonini.com> wrote:

> On Thu, 25 Jun 2020 at 11:14, Fredrik Gustafsson
> <fredrik.gustafsson@axis.com> wrote:
> > Poky today has three different package managers, the well-known format=
s
> deb
> > and rpm is supported as well as ipkg that is good for embedded devices=
.
> >
> > When building and having a good cache hit, a significant amount of tim=
e
> is
> > spent in the phase of generating a rootfs, which is really about the
> > performance of the package manager. ipkg is way slower than deb or rpm=
.
> To
> > save build time and also get a package manager that is suitanle for us=
e
> on
> > targets where flash memory is a concern, support for apk is suggested.
> >
> > However, it might or might not be what's wanted for Poky since it
> increases
> > the test matrix. Therefore this patch series refactors the package
> > management code so that it's possible to add more package managers in
> other
> > own layer. I will send another patch serie that will add apk.
>
> As to the code review I mostly second what Paul said.
>
> However, obviously you actually have strong feelings on this as the
> series represents a fair amount of work.  What are the compelling
> reasons to use apk?  Five seconds on core-image-minimal doesn't really
> sell it to me, I don't think anyone ever claimed that opkg has been
> performance optimised, dpkg isn't really used that much: maybe we
> should re-evaluate what package managers are supported if apk has
> feature parity but is significantly faster or has other advantages.
>

FWIW, I was contemplating apk packaging because of heavy usage in Docker
containers based on Alpine Linux.

I haven=E2=80=99t reviewed the patch series, but the theme of adding apk a=
s another
viable package type is welcome.


> Ross
>=20
>

--0000000000005d33b205a909b0a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Fri, Jun 26, 2020 at 3:53 AM Ross Burton &lt;<a href=3D"mailto:ross@burto=
nini.com">ross@burtonini.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">On Thu, 25 Jun 2020 at 11:14, Fredrik Gustafsson<br>
&lt;<a href=3D"mailto:fredrik.gustafsson@axis.com" target=3D"_blank">fredr=
ik.gustafsson@axis.com</a>&gt; wrote:<br>
&gt; Poky today has three different package managers, the well-known forma=
ts deb<br>
&gt; and rpm is supported as well as ipkg that is good for embedded device=
s.<br>
&gt;<br>
&gt; When building and having a good cache hit, a significant amount of ti=
me is<br>
&gt; spent in the phase of generating a rootfs, which is really about the<=
br>
&gt; performance of the package manager. ipkg is way slower than deb or rp=
m. To<br>
&gt; save build time and also get a package manager that is suitanle for u=
se on<br>
&gt; targets where flash memory is a concern, support for apk is suggested=
.<br>
&gt;<br>
&gt; However, it might or might not be what&#39;s wanted for Poky since it=
 increases<br>
&gt; the test matrix. Therefore this patch series refactors the package<br=
>
&gt; management code so that it&#39;s possible to add more package manager=
s in other<br>
&gt; own layer. I will send another patch serie that will add apk.<br>
<br>
As to the code review I mostly second what Paul said.<br>
<br>
However, obviously you actually have strong feelings on this as the<br>
series represents a fair amount of work.=C2=A0 What are the compelling<br>
reasons to use apk?=C2=A0 Five seconds on core-image-minimal doesn&#39;t r=
eally<br>
sell it to me, I don&#39;t think anyone ever claimed that opkg has been<br=
>
performance optimised, dpkg isn&#39;t really used that much: maybe we<br>
should re-evaluate what package managers are supported if apk has<br>
feature parity but is significantly faster or has other advantages.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">FWIW, I was con=
templating apk packaging because of heavy usage in Docker containers based =
on Alpine Linux.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I haven=
=
=E2=80=99t reviewed the patch series, but the theme of adding apk as anoth=
er viable package type is welcome.</div><div dir=3D"auto"><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><br>
Ross<br>
<br>
</blockquote></div></div>

--0000000000005d33b205a909b0a9--
