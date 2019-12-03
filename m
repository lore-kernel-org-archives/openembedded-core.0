Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3F8937E507
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2019 23:35:34 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d202so5387829qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2019 15:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GwvKPX2PqxVmY1NS1sIxV1veZLjmvPUkaUk5N46fN3E=;
	b=BEceSvOVjnFhDd+zunqhTG8l9syTiQpwdGPofxkzSybKe1IJHW+dU99fBr2BuVJ9tF
	KrGfIX+wtsQam8Jf5hVc5jqTp+gaSzDU7ZhADFkly6MHc37RujxIFg3+OJ8hCZ0+707H
	RhgmPlF+No6tfVmko9BgERLbH1mpc3chrIgaM4vfqBoHCrsVd7FR2kwR/SGsZAvphhZR
	EYcaVSa9JaOHpTVOLWv8atNo8wnPoscpjYngkAgADzCHYj6RaQpR6uvqULv9jK6B5pi4
	htey95uZpz3BdsYmKwgn3FQzQQ0nJSdTuhxvCGPO0OVL3MF2qyrON19S+Zobf//HqmXm
	GPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GwvKPX2PqxVmY1NS1sIxV1veZLjmvPUkaUk5N46fN3E=;
	b=lxngSmcbq6BgFOgDuK69ClhD5jPwljZ0NVV2/zmwT81DWMdoex0WDHBesx8iszbGGO
	dBPYHSG7pSSaoIQkykPUtu2DswbLdKU6fgX/BuNq69MhoV9VFeM1DhQrQtHoc1lK1BUQ
	jPBfbSphtN+WARcqt8zIaU8UYuOOgonPAvND0+1nZcDa12dNRc2paCVSnVFGEdBpRAP2
	dPDHPBbpEqh7L873wteaW4QhWRt0r8d1UF/KT6OQTFJC4x1bFM5DllK338vCNDtt5+n5
	1BrvEL0VP4MIOfCp8n9L0agA5/aJ8G+Tb8SW7kOdt61KsAnreHblszswTblyeBmTaR+D
	PQWw==
X-Gm-Message-State: APjAAAWpAQ4lH7mqFule7xjfExka7T3O5aVnbi+c2Le+Os+uRcvFbOhB
	VETNMPeh/Q12yf+nLoHVWLANl/En3KTX50Uhllg=
X-Google-Smtp-Source: APXvYqzMoprdRzUCBEY+MZ+9ZtY6klFH8gwjreMqEztrMiYzlqQw8ykl5t2NLxS83ZPiSUZ3i3zJBAsx/6cidS4ke8Q=
X-Received: by 2002:a37:4cd3:: with SMTP id z202mr49697qka.212.1575416134586; 
	Tue, 03 Dec 2019 15:35:34 -0800 (PST)
MIME-Version: 1.0
References: <1575398680-3272-1-git-send-email-liu.ming50@gmail.com>
	<CAMKF1sqik8nwKMwm98Oxnz+ggvoyf6=+u0jcppCbJ=_4oKC+ZQ@mail.gmail.com>
	<CALatG=6cKC+WxafrxZVjrTywQ_4HwiBsC0+PtHivZmhpx9TrnA@mail.gmail.com>
In-Reply-To: <CALatG=6cKC+WxafrxZVjrTywQ_4HwiBsC0+PtHivZmhpx9TrnA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Dec 2019 15:35:23 -0800
Message-ID: <CAMKF1sprGxVY8zV90aEpWonC72eih_e0jJTVm1yN9x_8JYXCdA@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
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
X-List-Received-Date: Tue, 03 Dec 2019 23:35:34 -0000
Content-Type: multipart/alternative; boundary="0000000000001354fa0598d52779"

--0000000000001354fa0598d52779
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2019 at 1:53 PM Ming Liu <liu.ming50@gmail.com> wrote:

> Hi, Khem:
>
> I don't think so, the problem is the package names in PACKAGES are being
> handled in package task in order, if ldconfig is after glibc-utils, and
> they both contains /sbin (or /usr/sbin for usermerge) path, then
> /sbin/ldconfig (or /usr/sbin/usermerge) would be split into glibc-utils.
>
> It could be reproduced by enabling usermerge distro feature.
>

Yes no worries I see that we are defining PACKAGES variable there so this
change is ok


> //Ming Liu
>
> Khem Raj <raj.khem@gmail.com> =E6=96=BC 2019=E5=B9=B412=E6=9C=883=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:16=E5=AF=AB=E9=81=93=EF=BC=9A
>
>> On Tue, Dec 3, 2019 at 10:45 AM <liu.ming50@gmail.com> wrote:
>> >
>> > From: Ming Liu <liu.ming50@gmail.com>
>> >
>> > ldconfig should be prior to glibc-utils in PACKAGES variable, or else
>> > ldconfig binary would not be split to its own package, hence will lead
>> > to runtime issues for the packages that depending on ldconfig, like
>> > systemd.
>>
>> hmmm perhaps FILES_ldconfig =3D+ would help ?
>>
>> >
>> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
>> > ---
>> >  meta/recipes-core/glibc/glibc-package.inc | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-core/glibc/glibc-package.inc
>> b/meta/recipes-core/glibc/glibc-package.inc
>> > index 9dd5a0d..ede9e9b 100644
>> > --- a/meta/recipes-core/glibc/glibc-package.inc
>> > +++ b/meta/recipes-core/glibc/glibc-package.inc
>> > @@ -1,6 +1,6 @@
>> >  INHIBIT_SYSROOT_STRIP =3D "1"
>> >
>> > -PACKAGES =3D "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db
>> ${PN}-pic libcidn libmemusage libnss-db libsegfault ${PN}-pcprofile
>> libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev
>> ${PN}-doc ldconfig"
>> > +PACKAGES =3D "${PN}-dbg catchsegv sln nscd ldconfig ldd tzcode
>> glibc-thread-db ${PN}-pic libcidn libmemusage libnss-db libsegfault
>> ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev
>> ${PN}-staticdev ${PN}-doc"
>> >
>> >  # The ld.so in this glibc supports the GNU_HASH
>> >  RPROVIDES_${PN} =3D "eglibc rtld(GNU_HASH)"
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--0000000000001354fa0598d52779
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Dec 3, 2019 at 1:53 PM Ming Liu &lt;<a href=3D"mail=
to:liu.ming50@gmail.com">liu.ming50@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div dir=3D"ltr">Hi, Khem:<div><br></div><div>I d=
on&#39;t think so, the problem is the package names in PACKAGES are being h=
andled in package task in order, if ldconfig is after glibc-utils, and they=
 both contains /sbin (or /usr/sbin for usermerge) path, then /sbin/ldconfig=
 (or /usr/sbin/usermerge) would be split into=C2=A0glibc-utils.</div><div><=
br></div><div>It could be reproduced by enabling=C2=A0usermerge distro feat=
ure.</div><div></div></div></blockquote><div dir=3D"auto"><br></div><div di=
r=3D"auto">Yes no worries I see that we are defining PACKAGES variable ther=
e so this change is ok=C2=A0</div><div dir=3D"auto"><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div dir=3D"ltr"><div><br></div><div>//Ming Liu</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@g=
mail.com</a>&gt; =E6=96=BC 2019=E5=B9=B412=E6=9C=883=E6=97=A5 =E9=80=B1=E4=
=BA=8C =E4=B8=8B=E5=8D=889:16=E5=AF=AB=E9=81=93=EF=BC=9A<br></div></div><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Tue, Dec 3, 2019 at 10:45 AM &lt;<a href=3D"mailto:liu.ming50@gmail.com" =
target=3D"_blank">liu.ming50@gmail.com</a>&gt; wrote:<br>
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
</blockquote></div></div>

--0000000000001354fa0598d52779--
