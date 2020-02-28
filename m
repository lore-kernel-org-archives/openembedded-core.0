Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 75185618E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 04:32:28 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id t17so1577536ilm.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 20:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YgfmbYwtQS9aZjRj0FPScwAvemlJpqrl5KzgCXgw0p0=;
	b=N692U0r8BIjGxBzP1VuzdtEkHjmimhLs5Pbswi8Zk5AVMtdESV/S2W9VALvKS1s1rN
	mdI6Df93L/5vYNWS4pz5L04xvyp/tkAKSlYrrZwNNx2uWGBjrE+30x76PMHPub+S2nYq
	r/GOcGT9QwVV9Os5iUmux6O+B7nxdVNHLq5DJYJJymnVWyHjdRQOVOrwdvMiqVmfy0vK
	+dxcFbY9kaKQlqL+T/tnnG9ySVsB8ncRkjiS4OjJuIpxpQoYbWfgGezB9IPJQi3KhG6E
	CtDgiWnC30TLpTAQc5qSwZIge7mGGXfPMDlXdQkg1n+ryhzVhoOPcv7PIrKsCV8QaSuh
	NanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YgfmbYwtQS9aZjRj0FPScwAvemlJpqrl5KzgCXgw0p0=;
	b=h8daSQapKgNDl49QHrG39WA++AsmWeW6FEZ//jwJ1OQuKD66RvygQsctvjHlaWz3U2
	ikWcn9DVE6ClAxPEsen9aVis1yHy7WQ+WTCew9756Nh+KziSwXNSB0CZ0lGReY5re7Zr
	S5wCk7omlscSVRtq8Ds/EaoFlQhk4ZjfvD21/sMvzC1lvOccNaRW8RTlL5DysB3Cfk6P
	Xp1E9dfj/QVJY7wSOCMYx13mgVy0mcelUCFPO8p03dmfBHFsNQ+x6KRtFazWdk8qF+lr
	q181D+vAzxQZ3NhZFahF1OJxbeXrAI7WSyXpoTN5hwVhXEjnThkbwqDqbBkO9OVz1fyP
	ulLg==
X-Gm-Message-State: APjAAAVHvE1/lgm2rg1M2uigdCHkaivs1YXLkaelR3U11D3dlYHRBbgp
	Y2+zxMo0aNDunH2IcGWUm0COLfKtYDBfGGZCnws=
X-Google-Smtp-Source: APXvYqxN3sSQoZtFDmKGSzp7BO3P7MMdMp/vfHSNIUUVcbvKz6Zssu6f4cXXH2MMpopC/SrD4uHdcD7Gn8Dra9RRNsc=
X-Received: by 2002:a92:194:: with SMTP id 142mr1580068ilb.198.1582864349300; 
	Thu, 27 Feb 2020 20:32:29 -0800 (PST)
MIME-Version: 1.0
References: <20200227000603.14252-1-timothy.t.orling@linux.intel.com>
	<20200227000603.14252-4-timothy.t.orling@linux.intel.com>
	<2c3ea5cc-29e6-0ce6-f9b3-c720e835e363@intel.com>
	<7956231e-1523-6213-b757-633b75eb2eb2@gmail.com>
In-Reply-To: <7956231e-1523-6213-b757-633b75eb2eb2@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 27 Feb 2020 20:32:18 -0800
Message-ID: <CANx9H-CiC8xMqVKDYXzAupOrShPvGvpeu0j8r0CFjZ0OTSdsJA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] at-spi2-atk: upgrade 2.32.0 -> 2.34.1
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
X-List-Received-Date: Fri, 28 Feb 2020 04:32:28 -0000
Content-Type: multipart/alternative; boundary="000000000000448dbe059f9b5316"

--000000000000448dbe059f9b5316
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Strange. I built it in new environment, tip of master, on Debian-10 and no
problems. I=E2=80=99ll look into it tomorrow.

Thank you for the information.

On Thu, Feb 27, 2020 at 8:28 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 2/27/20 7:54 PM, Anuj Mittal wrote:
> > Hi Tim,
> >
> > On 27-Feb-20 08:06 AM, Tim Orling wrote:
> >> Release notes:
> >>
> https://gitlab.gnome.org/GNOME/at-spi2-atk/-/raw/043b793de2161a0548835424=
f4d087ac90d1172d/NEWS
> >>
> >>
> >> License-Update: Changed to LGPL-2.1+
> >>
> >> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> >> ---
> >>   .../atk/{at-spi2-atk_2.32.0.bb =3D> at-spi2-atk_2.34.1.bb}  | 8
> ++++----
> >>   1 file changed, 4 insertions(+), 4 deletions(-)
> >>   rename meta/recipes-support/atk/{at-spi2-atk_2.32.0.bb =3D>
> >> at-spi2-atk_2.34.1.bb} (66%)
> >
> > This is failing on musl-qemu86:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1623
> >
> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: unknown field
> > =E2=80=98tv_sec=E2=80=99 specified in initializer
> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: excess
> > elements in struct initializer [enabled by default]
> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: (near
> > initialization for =E2=80=98timeout=E2=80=99) [enabled by default]
> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: unknown field
> > =E2=80=98tv_nsec=E2=80=99 specified in initializer
> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: excess
> > elements in struct initializer [enabled by default]
> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: (near
> > initialization for =E2=80=98timeout=E2=80=99) [enabled by default]
> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:19: error: storage size
> > of =E2=80=98timeout=E2=80=99 isn=E2=80=99t known
> >     struct timespec timeout =3D { .tv_sec =3D 0, .tv_nsec =3D 10 * 1000=
000 };
> >                     ^
> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:90:5: warning: implicit
> > declaration of function =E2=80=98nanosleep=E2=80=99 [-Wimplicit-functio=
n-declaration]
> >       nanosleep(&timeout, NULL);
> >       ^
> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c: In function =E2=80=98termi=
nate_app=E2=80=99:
> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: variable
> > =E2=80=98timeout=E2=80=99 has initializer but incomplete type
> >     struct timespec timeout =3D { .tv_sec =3D 0, .tv_nsec =3D 10 * 1000=
000 };
> >            ^
> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: unknown fiel=
d
> > =E2=80=98tv_sec=E2=80=99 specified in initializer
> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: excess
> > elements in struct initializer [enabled by default]
> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: (near
> > initialization for =E2=80=98timeout=E2=80=99) [enabled by default]
> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: unknown fiel=
d
> > =E2=80=98tv_nsec=E2=80=99 specified in initializer
> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: excess
> > elements in struct initializer [enabled by default]
> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: (near
> > initialization for =E2=80=98timeout=E2=80=99) [enabled by default]
> > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:19: error: storage size
> > of =E2=80=98timeout=E2=80=99 isn=E2=80=99t known
> >     struct timespec timeout =3D { .tv_sec =3D 0, .tv_nsec =3D 10 * 1000=
000 };
> >
>
> yeah this is exposing a bug in use if time_t struct in this component.
> there are several patches done to address that, we will perhaps need one
> of these patches here.
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000448dbe059f9b5316
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Strange. I built it in new environment, tip of maste=
r, on Debian-10 and no problems. I=E2=80=99ll look into it tomorrow.=C2=A0<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you for the inform=
ation.</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Thu, Feb 27, 2020 at 8:28 PM Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><br>
<br>
On 2/27/20 7:54 PM, Anuj Mittal wrote:<br>
&gt; Hi Tim,<br>
&gt; <br>
&gt; On 27-Feb-20 08:06 AM, Tim Orling wrote:<br>
&gt;&gt; Release notes:<br>
&gt;&gt; <a href=3D"https://gitlab.gnome.org/GNOME/at-spi2-atk/-/raw/043b79=
3de2161a0548835424f4d087ac90d1172d/NEWS" rel=3D"noreferrer" target=3D"_blan=
k">https://gitlab.gnome.org/GNOME/at-spi2-atk/-/raw/043b793de2161a054883542=
4f4d087ac90d1172d/NEWS</a> <br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; License-Update: Changed to LGPL-2.1+<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@l=
inux.intel.com" target=3D"_blank">timothy.t.orling@linux.intel.com</a>&gt;<=
br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 .../atk/{<a href=3D"http://at-spi2-atk_2.32.0.bb" rel=3D"no=
referrer" target=3D"_blank">at-spi2-atk_2.32.0.bb</a> =3D&gt; <a href=3D"ht=
tp://at-spi2-atk_2.34.1.bb" rel=3D"noreferrer" target=3D"_blank">at-spi2-at=
k_2.34.1.bb</a>}=C2=A0 | 8 ++++----<br>
&gt;&gt; =C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;&gt; =C2=A0 rename meta/recipes-support/atk/{<a href=3D"http://at-spi2-=
atk_2.32.0.bb" rel=3D"noreferrer" target=3D"_blank">at-spi2-atk_2.32.0.bb</=
a> =3D&gt; <br>
&gt;&gt; <a href=3D"http://at-spi2-atk_2.34.1.bb" rel=3D"noreferrer" target=
=3D"_blank">at-spi2-atk_2.34.1.bb</a>} (66%)<br>
&gt; <br>
&gt; This is failing on musl-qemu86:<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/64/=
builds/1623" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto=
project.org/typhoon/#/builders/64/builds/1623</a><br>
&gt; <br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: unknown fiel=
d <br>
&gt; =E2=80=98tv_sec=E2=80=99 specified in initializer<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: excess <br=
>
&gt; elements in struct initializer [enabled by default]<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: (near <br>
&gt; initialization for =E2=80=98timeout=E2=80=99) [enabled by default]<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: unknown fiel=
d <br>
&gt; =E2=80=98tv_nsec=E2=80=99 specified in initializer<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: excess <br=
>
&gt; elements in struct initializer [enabled by default]<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: (near <br>
&gt; initialization for =E2=80=98timeout=E2=80=99) [enabled by default]<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:19: error: storage size=
 <br>
&gt; of =E2=80=98timeout=E2=80=99 isn=E2=80=99t known<br>
&gt;=C2=A0 =C2=A0=C2=A0 struct timespec timeout =3D { .tv_sec =3D 0, .tv_ns=
ec =3D 10 * 1000000 };<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:90:5: warning: implicit <b=
r>
&gt; declaration of function =E2=80=98nanosleep=E2=80=99 [-Wimplicit-functi=
on-declaration]<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 nanosleep(&amp;timeout, NULL);<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 ^<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c: In function =E2=80=98term=
inate_app=E2=80=99:<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: variable <b=
r>
&gt; =E2=80=98timeout=E2=80=99 has initializer but incomplete type<br>
&gt;=C2=A0 =C2=A0=C2=A0 struct timespec timeout =3D { .tv_sec =3D 0, .tv_ns=
ec =3D 10 * 1000000 };<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: unknown fie=
ld <br>
&gt; =E2=80=98tv_sec=E2=80=99 specified in initializer<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: excess <b=
r>
&gt; elements in struct initializer [enabled by default]<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: (near <br=
>
&gt; initialization for =E2=80=98timeout=E2=80=99) [enabled by default]<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: unknown fie=
ld <br>
&gt; =E2=80=98tv_nsec=E2=80=99 specified in initializer<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: excess <b=
r>
&gt; elements in struct initializer [enabled by default]<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: (near <br=
>
&gt; initialization for =E2=80=98timeout=E2=80=99) [enabled by default]<br>
&gt; ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:19: error: storage siz=
e <br>
&gt; of =E2=80=98timeout=E2=80=99 isn=E2=80=99t known<br>
&gt;=C2=A0 =C2=A0=C2=A0 struct timespec timeout =3D { .tv_sec =3D 0, .tv_ns=
ec =3D 10 * 1000000 };<br>
&gt; <br>
<br>
yeah this is exposing a bug in use if time_t struct in this component. <br>
there are several patches done to address that, we will perhaps need one <b=
r>
of these patches here.<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000448dbe059f9b5316--
