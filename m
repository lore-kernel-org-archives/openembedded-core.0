Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id BB1E6719CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 15:07:46 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id i127so7606744oia.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 08:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=13m3V3DZKFD7TgFz2fuv7cvFZsmYaG2skiOw7Ubk1sY=;
	b=kT71VmW+tKoHipGbqNWgvjMBWwV+6d81s9GlvuFw+ceLQkql6Hz2aWOIenoihSisyL
	z/7YEiAmz4FfF7R913jshNDzuyj+F9rRLKsQH0bJqujwlxx8fSYpOGuue265ewbQ7XvJ
	S7vcDgCiJA8zUczHbzxqTBeSwYivL7+MZL54coP5LrQCEQpsix1fqLv28eH4wMnZ7uuV
	DsYQhPNuQSFTiO8caEgX+1ttXU+Z231DW0ua4exurY+CdqVlIyf8R+AByEHX9wmCQqlJ
	tmxhBGN3NU6AcoCOmY4tFo5a2C/b9VntnuQQ8gv2QvAMhEFqbZ4Rv24OdccK1gjnNdI0
	JQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=13m3V3DZKFD7TgFz2fuv7cvFZsmYaG2skiOw7Ubk1sY=;
	b=Abm9tO/SQdbiDp1NIAjaZYNIHWWuvnpPMdcNKzAqm0pyUHpcGTUb6OEdmP2/0peQYh
	2bL6YRwycXc1Yf0PwgjJ0Qp9la3Ywr5ZaDRz8xhw6QRgTPk0LK2N6JkkBrb+AYebZ5KA
	bUw4ONAunc7Qgkb4bsO+87UtsgMz7jXd6H7D7HoDIeZ8ajuNKAW3L0SYLoUkl/BOXlW4
	9OLHPMCWxOvaOKI2Ig7fb4BpYeSijjWU8m0b0tWGZ9C2MpuXv1JVa8JgsuEuMQP0F3Mk
	P0U6PRmodRZeC1Sw0hPthn0Zgs8q8S5NWx2Fx2b7gNUXTi7eQ0DNIzM9lCzrGJHJoeNj
	4U1A==
X-Gm-Message-State: ABUngvcpmP9O6bMaVi+fLrSAbbWPdHuwGbQInZJOA/Up0K3KcnneXCP19YAJP9qyTgNx2GugL+Jp9bZhothWMw==
X-Received: by 10.157.31.18 with SMTP id x18mr5058022otd.29.1477408067404;
	Tue, 25 Oct 2016 08:07:47 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Tue, 25 Oct 2016 08:07:27 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1610250303460.20837@localhost.localdomain>
References: <alpine.LFD.2.20.1610241644480.15919@localhost.localdomain>
	<CABcZANnYLS0pfSpdzf3NVV4KEg_88b9mPark9gpstJUFHZTzxQ@mail.gmail.com>
	<alpine.LFD.2.20.1610250246460.19688@localhost.localdomain>
	<alpine.LFD.2.20.1610250303460.20837@localhost.localdomain>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 25 Oct 2016 08:07:27 -0700
X-Google-Sender-Auth: G2os0Q_YtgtmodnObSprLd2yM8c
Message-ID: <CABcZANnku9xzQ=Zz6NnUX+myzbAX9K34gPVjkTCd0jKSAXSXRw@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: most efficient way to map perl RH rpms to OE package names?
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
X-List-Received-Date: Tue, 25 Oct 2016 15:07:48 -0000
Content-Type: multipart/alternative; boundary=001a113d028c0bc9b0053fb1dfba

--001a113d028c0bc9b0053fb1dfba
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2016 at 12:05 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Tue, 25 Oct 2016, Robert P. J. Day wrote:
>
> > On Mon, 24 Oct 2016, Christopher Larson wrote:
> >
> > >
> > > On Mon, Oct 24, 2016 at 1:53 PM, Robert P. J. Day <
> rpjday@crashcourse.ca> wrote:
> > >         i've just been handed a list of about 200 perl packages by
> their
> > >       centos rpm names, and i want to map most, if not all, of them t=
o
> their
> > >       equivalent OE package names.
> > >
> > >        my first instinct (based on not having used a lot of perl OE
> > >       packages) is to add both "perl" and "perl-modules" to
> IMAGE_INSTALL,
> > >       just to fetch and build every possible module available through
> the OE
> > >       perl recipe -- that will at least give me an idea of what's
> available.
> > >
> > >         next, i can see the pattern in some OE package names -- i've
> > >       verified that the Time::HiRes package is available in OE as
> > >       perl-module-time-hires, which i assume is part of the dynamic
> naming
> > >       being done in perl_5.22.1.bb.
> > >
> > >        am i approaching this the right way?
> > >
> > >
> > > Could also bitbake perl, then use oe-pkgdata-util to locate the
> > > actual perl modules in the packages, i.e. */Time/HiRes.pm.
> >
> >   i once wrote a wiki page on "bb", distinguishing between queries
> > you could make before you did a build, versus queries that needed a
> > build. it seems like oe-pkgdata-util needs a completed build for
> > pretty much everything, do i have that right?
>
>   never mind, i just read this snippet from the YP ref manual:
>
> "You can use the oe-pkgdata-util command-line utility to query
> PKGDATA_DIR and display various package-related information. When you
> use the utility, you must use it to view information on packages that
> have already been built."
>
> so i'm assuming that means for *all* oe-pkgdata subcommands, no
> exceptions.


Right, oe-pkgdata-util is about inspecting build output via pkgdata,
whereas most of bb is inspection tools about the metadata =E2=80=94 before =
the
build. The only exception is bb-contents, which is a convenience, just
wraps oe-pkgdata-util under the hood and tells the user the oe-pkgdata-util
command in case they want to run it directly.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113d028c0bc9b0053fb1dfba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Oct 25, 2016 at 12:05 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse=
.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"=
">On Tue, 25 Oct 2016, Robert P. J. Day wrote:<br>
<br>
&gt; On Mon, 24 Oct 2016, Christopher Larson wrote:<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Oct 24, 2016 at 1:53 PM, Robert P. J. Day &lt;<a href=3D"=
mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 i&#39;ve just been handed a list=
 of about 200 perl packages by their<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0centos rpm names, and i want to map mos=
t, if not all, of them to their<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0equivalent OE package names.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0my first instinct (based on not h=
aving used a lot of perl OE<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0packages) is to add both &quot;perl&quo=
t; and &quot;perl-modules&quot; to IMAGE_INSTALL,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0just to fetch and build every possible =
module available through the OE<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0perl recipe -- that will at least give =
me an idea of what&#39;s available.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 next, i can see the pattern in s=
ome OE package names -- i&#39;ve<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0verified that the Time::HiRes package i=
s available in OE as<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0perl-module-time-hires, which i assume =
is part of the dynamic naming<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0being done in <a href=3D"http://perl_5.=
22.1.bb" rel=3D"noreferrer" target=3D"_blank">perl_5.22.1.bb</a>.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0am i approaching this the right w=
ay?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Could also bitbake perl, then use oe-pkgdata-util to locate the<b=
r>
&gt; &gt; actual perl modules in the packages, i.e. */Time/HiRes.pm.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0i once wrote a wiki page on &quot;bb&quot;, distinguishing=
 between queries<br>
&gt; you could make before you did a build, versus queries that needed a<br=
>
&gt; build. it seems like oe-pkgdata-util needs a completed build for<br>
&gt; pretty much everything, do i have that right?<br>
<br>
</span>=C2=A0 never mind, i just read this snippet from the YP ref manual:<=
br>
<br>
&quot;You can use the oe-pkgdata-util command-line utility to query<br>
PKGDATA_DIR and display various package-related information. When you<br>
use the utility, you must use it to view information on packages that<br>
have already been built.&quot;<br>
<br>
so i&#39;m assuming that means for *all* oe-pkgdata subcommands, no<br>
exceptions.</blockquote></div><br>Right, oe-pkgdata-util is about inspectin=
g build output via pkgdata, whereas most of bb is inspection tools about th=
e metadata =E2=80=94 before the build. The only exception is bb-contents, w=
hich is a convenience, just wraps oe-pkgdata-util under the hood and tells =
the user the oe-pkgdata-util command in case they want to run it directly.<=
br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, Ope=
nEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Me=
ntor Graphics</div>
</div></div>

--001a113d028c0bc9b0053fb1dfba--
