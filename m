Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id EA65F7F36F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2019 21:53:53 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f129so5479194wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2019 13:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vfSEtfStkDdPw5fPwz3uItScp8X8fs+M31avmCTaGNE=;
	b=p7e4d/ZMDTdAVL3kelfcugnPSYYkIekFOwN7gkThF3KSs+Whb//TahJDwOgQBD9BD9
	EqTtbXD+mVL0jJeeErtnbB22i2HcXo7VNfJYEdt9xzxXlFym5x8oJxuN5idTsRjNeFxu
	1o7MbEDdPy2AoUCHKVhpneZxToU6PlREpXLnyqB3MjNhz6xb218Wz0s7Rw04M23GhcqD
	Ii3MWC85OIAauZHmhUAFQi9nmTMhnie2hmNqFd3cm1iakZSaN48MEK3XRY/zRsQhWlhS
	P3zP2PB1vgm3WYLhJpE7J6yssSqIFH9Mb21c8ZAa5ujqkupLf31rrsFirWLEVxbY4psB
	oEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vfSEtfStkDdPw5fPwz3uItScp8X8fs+M31avmCTaGNE=;
	b=EelOMn2f8sXaxzMZGWzVbdwaIowOiJKw1cfxFX8XNvnjiavIHAk9dUGyvhdRCJUDaz
	a0+2wXIFg8os75eaO4QwzvN7AOBjPUyxRgKIGZ9plySlvLejwfdF5+vm0plnP+XJOZvQ
	JGvbN364hSX5B90aWRW5AvXiQyeH2NK6NRz95rUbO/if1Ph75YLH2O6QcHw8xZUqDdQP
	Z206RNOwr9FtiARq8HrM4qkXHyQd2AD9TtNinAW1GlvwNh/shz6/9Agm1CwkA3HJzmq/
	Wd8pUDAg1C1QpDeqtPjmZx/3tFzcR7raAYUpqdAXXzc7XpL/OHiOT3sa08TJ+QBY2Svw
	iJBA==
X-Gm-Message-State: APjAAAVWC/KcHeLXbPZJvHlQmqGYgr/YrQr40bxyNDxIil817efsnasW
	dgeBK+KAzt3Ovh5kG3AP5LO5d8u0PkdpgFMAV20=
X-Google-Smtp-Source: APXvYqxAGp5A02M/Ce7N5Lx3tiUNS1rsOuYebJ5AjdCbJriDu070ephwDwJYdlRMuvmeJ07mUr9IyWE3vwrFA22+bxw=
X-Received: by 2002:a7b:cf01:: with SMTP id l1mr20157535wmg.86.1575410034607; 
	Tue, 03 Dec 2019 13:53:54 -0800 (PST)
MIME-Version: 1.0
References: <1575398680-3272-1-git-send-email-liu.ming50@gmail.com>
	<CAMKF1sqik8nwKMwm98Oxnz+ggvoyf6=+u0jcppCbJ=_4oKC+ZQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqik8nwKMwm98Oxnz+ggvoyf6=+u0jcppCbJ=_4oKC+ZQ@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 3 Dec 2019 22:53:43 +0100
Message-ID: <CALatG=6cKC+WxafrxZVjrTywQ_4HwiBsC0+PtHivZmhpx9TrnA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: fix ldconfig packaging issue
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
X-List-Received-Date: Tue, 03 Dec 2019 21:53:54 -0000
Content-Type: multipart/alternative; boundary="0000000000007d0b340598d3bb9c"

--0000000000007d0b340598d3bb9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Khem:

I don't think so, the problem is the package names in PACKAGES are being
handled in package task in order, if ldconfig is after glibc-utils, and
they both contains /sbin (or /usr/sbin for usermerge) path, then
/sbin/ldconfig (or /usr/sbin/usermerge) would be split into glibc-utils.

It could be reproduced by enabling usermerge distro feature.

//Ming Liu

Khem Raj <raj.khem@gmail.com> =E6=96=BC 2019=E5=B9=B412=E6=9C=883=E6=97=A5 =
=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:16=E5=AF=AB=E9=81=93=EF=BC=9A

> On Tue, Dec 3, 2019 at 10:45 AM <liu.ming50@gmail.com> wrote:
> >
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > ldconfig should be prior to glibc-utils in PACKAGES variable, or else
> > ldconfig binary would not be split to its own package, hence will lead
> > to runtime issues for the packages that depending on ldconfig, like
> > systemd.
>
> hmmm perhaps FILES_ldconfig =3D+ would help ?
>
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >  meta/recipes-core/glibc/glibc-package.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/glibc/glibc-package.inc
> b/meta/recipes-core/glibc/glibc-package.inc
> > index 9dd5a0d..ede9e9b 100644
> > --- a/meta/recipes-core/glibc/glibc-package.inc
> > +++ b/meta/recipes-core/glibc/glibc-package.inc
> > @@ -1,6 +1,6 @@
> >  INHIBIT_SYSROOT_STRIP =3D "1"
> >
> > -PACKAGES =3D "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db
> ${PN}-pic libcidn libmemusage libnss-db libsegfault ${PN}-pcprofile
> libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev
> ${PN}-doc ldconfig"
> > +PACKAGES =3D "${PN}-dbg catchsegv sln nscd ldconfig ldd tzcode
> glibc-thread-db ${PN}-pic libcidn libmemusage libnss-db libsegfault
> ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev
> ${PN}-staticdev ${PN}-doc"
> >
> >  # The ld.so in this glibc supports the GNU_HASH
> >  RPROVIDES_${PN} =3D "eglibc rtld(GNU_HASH)"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000007d0b340598d3bb9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Khem:<div><br></div><div>I don&#39;t think so, the pro=
blem is the package names in PACKAGES are being handled in package task in =
order, if ldconfig is after glibc-utils, and they both contains /sbin (or /=
usr/sbin for usermerge) path, then /sbin/ldconfig (or /usr/sbin/usermerge) =
would be split into=C2=A0glibc-utils.</div><div><br></div><div>It could be =
reproduced by enabling=C2=A0usermerge distro feature.</div><div><br></div><=
div>//Ming Liu</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.=
khem@gmail.com</a>&gt; =E6=96=BC 2019=E5=B9=B412=E6=9C=883=E6=97=A5 =E9=80=
=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:16=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Dec 3, 2019 at 10:45=
 AM &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">liu.ming5=
0@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_=
blank">liu.ming50@gmail.com</a>&gt;<br>
&gt;<br>
&gt; ldconfig should be prior to glibc-utils in PACKAGES variable, or else<=
br>
&gt; ldconfig binary would not be split to its own package, hence will lead=
<br>
&gt; to runtime issues for the packages that depending on ldconfig, like<br=
>
&gt; systemd.<br>
<br>
hmmm perhaps FILES_ldconfig =3D+ would help ?<br>
<br>
&gt;<br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" ta=
rget=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/glibc/glibc-package.inc | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-=
core/glibc/glibc-package.inc<br>
&gt; index 9dd5a0d..ede9e9b 100644<br>
&gt; --- a/meta/recipes-core/glibc/glibc-package.inc<br>
&gt; +++ b/meta/recipes-core/glibc/glibc-package.inc<br>
&gt; @@ -1,6 +1,6 @@<br>
&gt;=C2=A0 INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&gt;<br>
&gt; -PACKAGES =3D &quot;${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thre=
ad-db ${PN}-pic libcidn libmemusage libnss-db libsegfault ${PN}-pcprofile l=
ibsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}=
-doc ldconfig&quot;<br>
&gt; +PACKAGES =3D &quot;${PN}-dbg catchsegv sln nscd ldconfig ldd tzcode g=
libc-thread-db ${PN}-pic libcidn libmemusage libnss-db libsegfault ${PN}-pc=
profile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-static=
dev ${PN}-doc&quot;<br>
&gt;<br>
&gt;=C2=A0 # The ld.so in this glibc supports the GNU_HASH<br>
&gt;=C2=A0 RPROVIDES_${PN} =3D &quot;eglibc rtld(GNU_HASH)&quot;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000007d0b340598d3bb9c--
