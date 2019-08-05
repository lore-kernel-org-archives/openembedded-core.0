Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8B37D7F346
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 12:53:40 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id a186so54247632vsd.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 05:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=q73ve8EWqHAl9CH97V4Izi5Yx832ZChXQ/tPvKm7Sks=;
	b=Rs+Fu2svp4zEhEfgrvvwnquAKtcTze4C+qrvnuYlvTU3alz0q1QRtTGF7BhtDlJDbY
	mxucpjGCFjlLqVMlJ7iktyK1Q3iLhCsq2kMoWsZTPYDsSkyZaiU56cKd+0wQfiyI++HM
	YGpJwd4o6miUL7KW3NGtKnVw3SSSZj8obcAueOlhm4NaiDNqwlw3myBQ1LCaCu4zsNaj
	h7htEsvHlkeKP26QyNreqMOJPEOIlY9Z7wRjltXNf7L2vqdgLlbueFj787ljk6G9qlGn
	gPg/kMcetnSh4/f57zojJpc0vgQUoaHFTjMsvp18UDerUgO+TdzpbqlbfINpuIgt/nEa
	aJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=q73ve8EWqHAl9CH97V4Izi5Yx832ZChXQ/tPvKm7Sks=;
	b=V0MiHxDcac29cOdlrsXVjkvLjwAVzuYUWRS9WF7crmsPn0RFTOstLqOz17qZV2B/g0
	YOmIU7AC3J/e1bK9slxZ8GIRizvlq577V5hYXRouU113KPHBsYO3rh3aj8CB7m5DJ7+V
	9XZxAPKtsL/Jjahg4zRdkjX9impUP8q6VWCnvji7LOMmW97aFSVx8zDpMfp3+ZNUL9EP
	OKe0qZWOq93LPK7TNjYdPZhl+1vOOTqrSXkL3L91exOj6CKEylo6FTJR2+V5EBtOPX3f
	lWwN9AX/DKGblD+LGyzYNDwEdAyElJmNFGTO6vYlzIfPxNajdDHjaRL38/PTMFuEvjH5
	AU4g==
X-Gm-Message-State: APjAAAW8uYWmAMhZpPzLV0zbO2AvXmpxfAqJMl7VpLyZ9gp5Y56bh+Vd
	Rt3jFWxtcWFreG9SJUWnW6kymnVxVBM/KIi9x7AhfdYY
X-Google-Smtp-Source: APXvYqw0VZkto0VhYd5UgyJQbuZFHBbJ+TeBtDHIIH4SCAHiE8Cs+lH828+STDG7DVoud2+ZfCANfnon9eTafTrD82s=
X-Received: by 2002:a67:fd13:: with SMTP id f19mr93429228vsr.25.1565009621656; 
	Mon, 05 Aug 2019 05:53:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190805115728.31260-1-alex.kanavin@gmail.com>
	<96bb7537-8b1c-c3f5-1c5a-ec1f80aca5a6@oleksandr-kravchuk.com>
In-Reply-To: <96bb7537-8b1c-c3f5-1c5a-ec1f80aca5a6@oleksandr-kravchuk.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 5 Aug 2019 14:53:30 +0200
Message-ID: <CANNYZj_X57+kx82zLrqKd+WFe+KKr-fGngkc0JoipWc5rk=Pow@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] maintainers.inc: give python recipes to Oleksandr Kravchuk
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
X-List-Received-Date: Mon, 05 Aug 2019 12:53:41 -0000
Content-Type: multipart/alternative; boundary="00000000000091aa43058f5e3207"

--00000000000091aa43058f5e3207
Content-Type: text/plain; charset="UTF-8"

No problem.

In practice this means you will start getting version updates patches from
AUH once a month or so (or information why AUH couldn't produce them), and
not much else. I mostly don't want these patches to go to somebody who
ignores them :)

Alex



On Mon, 5 Aug 2019 at 14:40, Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> > Oleksandr has been the de facto maintainer meanwhile.
>
> So have you, so don't leave me alone ;)
>
> On 05/08/2019 13:57, Alexander Kanavin wrote:
> > Derek Straka has been inactive for about a yer; Oleksandr
> > has been the de facto maintainer meanwhile.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc | 60 ++++++++++++------------
> >  1 file changed, 30 insertions(+), 30 deletions(-)
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index 0df1d8c929b..bc13be2fd4f 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -586,38 +586,38 @@ RECIPE_MAINTAINER_pn-ptest-runner = "Ross Burton <
> ross.burton@intel.com>"
> >  RECIPE_MAINTAINER_pn-pulseaudio = "Tanu Kaskinen <tanuk@iki.fi>"
> >  RECIPE_MAINTAINER_pn-pulseaudio-client-conf-sato = "Tanu Kaskinen <
> tanuk@iki.fi>"
> >  RECIPE_MAINTAINER_pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
> > -RECIPE_MAINTAINER_pn-python = "Derek Straka <derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python-native = "Derek Straka <derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python-nose = "Derek Straka <derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python-numpy = "Derek Straka <derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python-scons = "Derek Straka <derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python-scons-native = "Derek Straka <
> derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python-setuptools = "Derek Straka <
> derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python3 = "Derek Straka <derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python3-async = "Derek Straka <derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python3-dbus = "Derek Straka <derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python3-docutils = "Derek Straka <
> derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python3-extras = "Derek Straka <derek@asterius.io
> >"
> > -RECIPE_MAINTAINER_pn-python3-file-utils = "Derek Straka <
> derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python3-git = "Derek Straka <derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python3-gitdb = "Derek Straka <derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python3-iniparse = "Derek Straka <
> derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python3-mako = "Derek Straka <derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python3-native = "Derek Straka <derek@asterius.io
> >"
> > -RECIPE_MAINTAINER_pn-python3-nose = "Derek Straka <derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python3-numpy = "Derek Straka <derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python3-pbr = "Derek Straka <derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python3-pip = "Derek Straka <derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python3-pycairo = "Derek Straka <derek@asterius.io
> >"
> > -RECIPE_MAINTAINER_pn-python3-pygments = "Derek Straka <
> derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python3-pygobject = "Derek Straka <
> derek@asterius.io>"
> > +RECIPE_MAINTAINER_pn-python = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python-native = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python-nose = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python-numpy = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python-scons = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python-scons-native = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python-setuptools = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3 = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-async = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-dbus = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-docutils = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-file-utils = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-gitdb = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-native = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-nose = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-numpy = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-pbr = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-pip = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-pycairo = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-pygments = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-pygobject = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> >  RECIPE_MAINTAINER_pn-python3-scons = "Tim Orling <
> timothy.t.orling@linux.intel.com>"
> >  RECIPE_MAINTAINER_pn-python3-scons-native = "Tim Orling <
> timothy.t.orling@linux.intel.com>"
> > -RECIPE_MAINTAINER_pn-python3-setuptools = "Derek Straka <
> derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python3-six = "Derek Straka <derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python3-smmap = "Derek Straka <derek@asterius.io>"
> > -RECIPE_MAINTAINER_pn-python3-subunit = "Derek Straka <derek@asterius.io
> >"
> > -RECIPE_MAINTAINER_pn-python3-testtools = "Derek Straka <
> derek@asterius.io>"
> > +RECIPE_MAINTAINER_pn-python3-setuptools = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-six = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-smmap = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-subunit = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-testtools = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
> >  RECIPE_MAINTAINER_pn-qemu = "Richard Purdie <
> richard.purdie@linuxfoundation.org>"
> >  RECIPE_MAINTAINER_pn-qemu-helper-native = "Richard Purdie <
> richard.purdie@linuxfoundation.org>"
> >  RECIPE_MAINTAINER_pn-qemu-native = "Richard Purdie <
> richard.purdie@linuxfoundation.org>"
>

--00000000000091aa43058f5e3207
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>No problem.<br></div><div dir=3D"ltr"><br></div><div =
dir=3D"ltr">In practice this means you will start getting version updates p=
atches from AUH once a month or so (or information why AUH couldn&#39;t pro=
duce them), and not much else. I mostly don&#39;t want these patches to go =
to somebody who ignores them :)</div><div dir=3D"ltr"><br></div><div>Alex<b=
r></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><br></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 5 Aug 2019 =
at 14:40, Oleksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksandr-kr=
avchuk.com">open.source@oleksandr-kravchuk.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">&gt; Oleksandr has been the d=
e facto maintainer meanwhile.<br>
<br>
So have you, so don&#39;t leave me alone ;)<br>
<br>
On 05/08/2019 13:57, Alexander Kanavin wrote:<br>
&gt; Derek Straka has been inactive for about a yer; Oleksandr<br>
&gt; has been the de facto maintainer meanwhile.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc | 60 ++++++++++++------=
------<br>
&gt;=C2=A0 1 file changed, 30 insertions(+), 30 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt; index 0df1d8c929b..bc13be2fd4f 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -586,38 +586,38 @@ RECIPE_MAINTAINER_pn-ptest-runner =3D &quot;Ross=
 Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross=
.burton@intel.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-pulseaudio =3D &quot;Tanu Kaskinen &lt;<a h=
ref=3D"mailto:tanuk@iki.fi" target=3D"_blank">tanuk@iki.fi</a>&gt;&quot;<br=
>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-pulseaudio-client-conf-sato =3D &quot;Tanu =
Kaskinen &lt;<a href=3D"mailto:tanuk@iki.fi" target=3D"_blank">tanuk@iki.fi=
</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-puzzles =3D &quot;Anuj Mittal &lt;<a href=
=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</=
a>&gt;&quot;<br>
&gt; -RECIPE_MAINTAINER_pn-python =3D &quot;Derek Straka &lt;<a href=3D"mai=
lto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&quot;<br=
>
&gt; -RECIPE_MAINTAINER_pn-python-native =3D &quot;Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&q=
uot;<br>
&gt; -RECIPE_MAINTAINER_pn-python-nose =3D &quot;Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&q=
uot;<br>
&gt; -RECIPE_MAINTAINER_pn-python-numpy =3D &quot;Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&q=
uot;<br>
&gt; -RECIPE_MAINTAINER_pn-python-scons =3D &quot;Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&q=
uot;<br>
&gt; -RECIPE_MAINTAINER_pn-python-scons-native =3D &quot;Derek Straka &lt;<=
a href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>=
&gt;&quot;<br>
&gt; -RECIPE_MAINTAINER_pn-python-setuptools =3D &quot;Derek Straka &lt;<a =
href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&g=
t;&quot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3 =3D &quot;Derek Straka &lt;<a href=3D"ma=
ilto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&quot;<b=
r>
&gt; -RECIPE_MAINTAINER_pn-python3-async =3D &quot;Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&q=
uot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-dbus =3D &quot;Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&q=
uot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-docutils =3D &quot;Derek Straka &lt;<a h=
ref=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt=
;&quot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-extras =3D &quot;Derek Straka &lt;<a hre=
f=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&=
quot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-file-utils =3D &quot;Derek Straka &lt;<a=
 href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&=
gt;&quot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-git =3D &quot;Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&q=
uot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-gitdb =3D &quot;Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&q=
uot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-iniparse =3D &quot;Derek Straka &lt;<a h=
ref=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt=
;&quot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-mako =3D &quot;Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&q=
uot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-native =3D &quot;Derek Straka &lt;<a hre=
f=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&=
quot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-nose =3D &quot;Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&q=
uot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-numpy =3D &quot;Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&q=
uot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-pbr =3D &quot;Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&q=
uot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-pip =3D &quot;Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&q=
uot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-pycairo =3D &quot;Derek Straka &lt;<a hr=
ef=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;=
&quot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-pygments =3D &quot;Derek Straka &lt;<a h=
ref=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt=
;&quot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-pygobject =3D &quot;Derek Straka &lt;<a =
href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&g=
t;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python =3D &quot;Oleksandr Kravchuk &lt;<a href=
=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.sourc=
e@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python-native =3D &quot;Oleksandr Kravchuk &lt;<=
a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open=
.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python-nose =3D &quot;Oleksandr Kravchuk &lt;<a =
href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.s=
ource@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python-numpy =3D &quot;Oleksandr Kravchuk &lt;<a=
 href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.=
source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python-scons =3D &quot;Oleksandr Kravchuk &lt;<a=
 href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.=
source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python-scons-native =3D &quot;Oleksandr Kravchuk=
 &lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank=
">open.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python-setuptools =3D &quot;Oleksandr Kravchuk &=
lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">=
open.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3 =3D &quot;Oleksandr Kravchuk &lt;<a href=
=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.sourc=
e@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-async =3D &quot;Oleksandr Kravchuk &lt;<=
a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open=
.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-dbus =3D &quot;Oleksandr Kravchuk &lt;<a=
 href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.=
source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-docutils =3D &quot;Oleksandr Kravchuk &l=
t;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">o=
pen.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-extras =3D &quot;Oleksandr Kravchuk &lt;=
<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">ope=
n.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-file-utils =3D &quot;Oleksandr Kravchuk =
&lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank"=
>open.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-git =3D &quot;Oleksandr Kravchuk &lt;<a =
href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.s=
ource@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-gitdb =3D &quot;Oleksandr Kravchuk &lt;<=
a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open=
.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-iniparse =3D &quot;Oleksandr Kravchuk &l=
t;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">o=
pen.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-mako =3D &quot;Oleksandr Kravchuk &lt;<a=
 href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.=
source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-native =3D &quot;Oleksandr Kravchuk &lt;=
<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">ope=
n.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-nose =3D &quot;Oleksandr Kravchuk &lt;<a=
 href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.=
source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-numpy =3D &quot;Oleksandr Kravchuk &lt;<=
a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open=
.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-pbr =3D &quot;Oleksandr Kravchuk &lt;<a =
href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.s=
ource@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-pip =3D &quot;Oleksandr Kravchuk &lt;<a =
href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.s=
ource@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-pycairo =3D &quot;Oleksandr Kravchuk &lt=
;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">op=
en.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-pygments =3D &quot;Oleksandr Kravchuk &l=
t;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">o=
pen.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-pygobject =3D &quot;Oleksandr Kravchuk &=
lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">=
open.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-python3-scons =3D &quot;Tim Orling &lt;<a h=
ref=3D"mailto:timothy.t.orling@linux.intel.com" target=3D"_blank">timothy.t=
.orling@linux.intel.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-python3-scons-native =3D &quot;Tim Orling &=
lt;<a href=3D"mailto:timothy.t.orling@linux.intel.com" target=3D"_blank">ti=
mothy.t.orling@linux.intel.com</a>&gt;&quot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-setuptools =3D &quot;Derek Straka &lt;<a=
 href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&=
gt;&quot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-six =3D &quot;Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&q=
uot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-smmap =3D &quot;Derek Straka &lt;<a href=
=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;&q=
uot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-subunit =3D &quot;Derek Straka &lt;<a hr=
ef=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&gt;=
&quot;<br>
&gt; -RECIPE_MAINTAINER_pn-python3-testtools =3D &quot;Derek Straka &lt;<a =
href=3D"mailto:derek@asterius.io" target=3D"_blank">derek@asterius.io</a>&g=
t;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-setuptools =3D &quot;Oleksandr Kravchuk =
&lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank"=
>open.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-six =3D &quot;Oleksandr Kravchuk &lt;<a =
href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.s=
ource@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-smmap =3D &quot;Oleksandr Kravchuk &lt;<=
a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open=
.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-subunit =3D &quot;Oleksandr Kravchuk &lt=
;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">op=
en.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-python3-testtools =3D &quot;Oleksandr Kravchuk &=
lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">=
open.source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-qemu =3D &quot;Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-qemu-helper-native =3D &quot;Richard Purdie=
 &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
">richard.purdie@linuxfoundation.org</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-qemu-native =3D &quot;Richard Purdie &lt;<a=
 href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richa=
rd.purdie@linuxfoundation.org</a>&gt;&quot;<br>
</blockquote></div></div>

--00000000000091aa43058f5e3207--
