Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
	[209.85.217.52])
	by mail.openembedded.org (Postfix) with ESMTP id 91D297C603
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 18:50:21 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id u124so36775768vsu.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 11:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rkMZX3xSnIi5S6UXfHQnJvoWJ2wkxpdwV2tS1rZvvs4=;
	b=M5AEMTLRLTiZEh49Cuy+1W6IIE1csgoyHYjfNMvBqQvfRnzQG/NcXcBMs1tP+qtSV3
	1seNOFS1FAvmnt8wOTK+aa7JdDAfaZxdMz5gYpBJaAA6eqNCyNI3xIHcrvraP0cbOmd8
	bkl2Cz2jFMxT+eYFl+UOvD9gyc/lV5y2aJcPOVH3u+YRSJagF2kBpqGcYP8KvBgDzka3
	0+5LmoyEgDRy0Q7tf44DrAABa4F8DFBdHD5l5KvjYvWv/vix9Hov5I9pM9L0pSS72nuP
	AFVYSwZfm6fGsGWIC//amJlnJyqBk8fRD/cNDaD7yAHH9fdRVSp9aaFm5gTVjDH4gY1q
	N6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rkMZX3xSnIi5S6UXfHQnJvoWJ2wkxpdwV2tS1rZvvs4=;
	b=PfkNfxhnFbb4IQBtHenCukpYI8kMds+nNLbNr7UVvkwcN9dEMKKqcs+R6TtcCb/5bG
	nFZ/ZfKcpZWpDFmWISDV5DKu2PCDj6VE6fe5a0j8nDm+3K6sFNL/eMF58uicffwMwPka
	h2UtsJxKUSmlarjBCiYzJEbtTc+0lsXBo03avIzirERIqfgTm0BWXPuC6irYMYmHQfAl
	Ypu4kj9lGIs++k/o8RUTYD1QlMJ5w7FPfWhSqAmBElZ7vXxuaWHXgyFlVx/Iuz2petJ4
	nEi/JjFgayj0y1364wwEs5WcN9agGU9c+3+lidB4eiwPhJ6kGn/9bjvpCWb8Pp+ln36H
	paYA==
X-Gm-Message-State: APjAAAW2S3cx//Q2a8EzY/jkPYdDiUXMh6wYzDdHLxdw273k+0TC2MSd
	scIiajsfN4KTYeWCr4L/uUIChz+ba3J9N8i0BIU=
X-Google-Smtp-Source: APXvYqyF2Baxd+hfdl5F2YdVAFvJCtyMB6zHsZzSgRH53sTjm1IPR+DXi8/yCYB3x604b8moZrprgng252EDliMDnt8=
X-Received: by 2002:a67:fd13:: with SMTP id f19mr60440315vsr.25.1564167022244; 
	Fri, 26 Jul 2019 11:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190726153927.14245-1-tworaz@tworaz.net>
	<CAJTo0Lbwj-5k4K8UDVY0cD+eXnSL1Cv1QoR_Ddvfboh3KDkANw@mail.gmail.com>
	<aa275fd3-1f67-ae34-86cd-3e761d1c0c8c@tworaz.net>
In-Reply-To: <aa275fd3-1f67-ae34-86cd-3e761d1c0c8c@tworaz.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Jul 2019 21:50:10 +0300
Message-ID: <CANNYZj_MRhgSz89mGkEn+RO8bOYe9nT5DnGyXEsWrve13JQbfg@mail.gmail.com>
To: Piotr Tworek <tworaz@tworaz.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] itstool: Use python3 binary fom PATH instead of /usr/bin/python3
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
X-List-Received-Date: Fri, 26 Jul 2019 18:50:21 -0000
Content-Type: multipart/alternative; boundary="000000000000baf916058e9a03a8"

--000000000000baf916058e9a03a8
Content-Type: text/plain; charset="UTF-8"

I think this should be fine, as long as you:
1. Modify the commit to fix the original place in the source code via a
SRC_URI patch (instead of doing it after the fact with sed - such ad hoc
patching is hard to read and understand).
2. Write a better description: we need to preserve explanations like this
in commit history.

Alex

On Fri, 26 Jul 2019 at 21:31, Piotr Tworek <tworaz@tworaz.net> wrote:

> Hi Ross,
>
> Thanks for looking at my patch. You're right that my explanation behind
> it is a wrong, I was a bit lazy there. Its not really about python3 not
> being installed on the host system. My patch does fix a real issue with
> itstool-native which is currently unusable. The main problem is we can't
> mix host and OE provided python3 usage in one recipe. The problem I
> found is that if  the recipe inherits python3native bbclass any use of
> system provided python3 will fail. This seems to happen because
> python3native bbclass exports
> _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata". If I try to invoke host
> python3 binary with this export it fails to start.complaining it can't
> find module named _sysconfigdata.
>
> You might ask why nobody noticed it before. The explanation is pretty
> simple. In meta-oe there are two recipes which depend on itstool-native.
> Those are gnome-desktop3 and gnome-system-monitor. Both recipes inherit
> meson class which in turn inherit python3native so in theory they should
> fail. This does not happen because both recipes actually disable
> document generation steps for which itstool is invoked.
> Gnome-system-monitor has a patch for it while gnome-desktop3 has
> desktop_docs=false in EXTRA_OEMESON. I haven't tried it yet, but with my
> patch the document generation step should probably work fine in both
> cases. This was the case for some other gnome related recipes which I
> have in my own custom layer.
>
> Is there anything besides the explanation that is wrong with my patch?
>
> /ptw
>
> On 26/07/2019 17:57, Burton, Ross wrote:
> > Considering:
> >
> > 1) bitbake is written in Python 3
> > 2) HOSTTOOLS contains python3
> >
> > There *really* is a host python 3 binary, and the canonical path to it
> > is ${HOSTTOOLS_DIR}/python3.
> >
> > Ross
> >
> > On Fri, 26 Jul 2019 at 16:40, Piotr Tworek <tworaz@tworaz.net> wrote:
> >> Although /usr/bin/python3 works fine for class-target builds its not
> >> really what we want for class-native. The host system might not even
> >> have python3 installed. The native itstool version should use pythn3
> >> provided in recipe-sysroot-native. To accomplish it modify the default
> >> shebang to use /usr/bin/env. This works as expected for both native and
> >> target builds.
> >>
> >> Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
> >> ---
> >>   meta-oe/recipes-support/itstool/itstool_2.0.5.bb | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
> b/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
> >> index a0af44a71..f21e7f39b 100644
> >> --- a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
> >> +++ b/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
> >> @@ -13,7 +13,7 @@ SRC_URI[sha256sum] =
> "100506f8df62cca6225ec3e631a8237e9c04650c77495af4919ac6a100
> >>
> >>   do_install_append() {
> >>       # fix shebang of main script
> >> -    sed -i 's:^#!${WORKDIR}.*${PYTHON_PN}
> -s:#!${bindir_native}/${PYTHON_PN} -s:' ${D}${bindir}/itstool
> >> +    sed -i 's:^#!${WORKDIR}.*${PYTHON_PN} -s:#!${bindir_native}/env -S
> ${PYTHON_PN} -s:' ${D}${bindir}/itstool
> >>   }
> >>
> >>   BBCLASSEXTEND = "native"
> >> --
> >> 2.21.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000baf916058e9a03a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think this should be fine, as long as you:<div>1. Modify=
 the commit to fix the original place in the source code via a SRC_URI patc=
h (instead of doing it after the fact with sed - such ad hoc patching is ha=
rd to read and understand).</div><div>2. Write a better description: we nee=
d to preserve explanations like this in commit history.</div><div><br></div=
><div>Alex</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, 26 Jul 2019 at 21:31, Piotr Tworek &lt;<a href=3D"m=
ailto:tworaz@tworaz.net">tworaz@tworaz.net</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-l=
eft:1ex">Hi Ross,<br>
<br>
Thanks for looking at my patch. You&#39;re right that my explanation behind=
 <br>
it is a wrong, I was a bit lazy there. Its not really about python3 not <br=
>
being installed on the host system. My patch does fix a real issue with <br=
>
itstool-native which is currently unusable. The main problem is we can&#39;=
t <br>
mix host and OE provided python3 usage in one recipe. The problem I <br>
found is that if=C2=A0 the recipe inherits python3native bbclass any use of=
 <br>
system provided python3 will fail. This seems to happen because <br>
python3native bbclass exports <br>
_PYTHON_SYSCONFIGDATA_NAME=3D&quot;_sysconfigdata&quot;. If I try to invoke=
 host <br>
python3 binary with this export it fails to start.complaining it can&#39;t =
<br>
find module named _sysconfigdata.<br>
<br>
You might ask why nobody noticed it before. The explanation is pretty <br>
simple. In meta-oe there are two recipes which depend on itstool-native. <b=
r>
Those are gnome-desktop3 and gnome-system-monitor. Both recipes inherit <br=
>
meson class which in turn inherit python3native so in theory they should <b=
r>
fail. This does not happen because both recipes actually disable <br>
document generation steps for which itstool is invoked. <br>
Gnome-system-monitor has a patch for it while gnome-desktop3 has <br>
desktop_docs=3Dfalse in EXTRA_OEMESON. I haven&#39;t tried it yet, but with=
 my <br>
patch the document generation step should probably work fine in both <br>
cases. This was the case for some other gnome related recipes which I <br>
have in my own custom layer.<br>
<br>
Is there anything besides the explanation that is wrong with my patch?<br>
<br>
/ptw<br>
<br>
On 26/07/2019 17:57, Burton, Ross wrote:<br>
&gt; Considering:<br>
&gt;<br>
&gt; 1) bitbake is written in Python 3<br>
&gt; 2) HOSTTOOLS contains python3<br>
&gt;<br>
&gt; There *really* is a host python 3 binary, and the canonical path to it=
<br>
&gt; is ${HOSTTOOLS_DIR}/python3.<br>
&gt;<br>
&gt; Ross<br>
&gt;<br>
&gt; On Fri, 26 Jul 2019 at 16:40, Piotr Tworek &lt;<a href=3D"mailto:twora=
z@tworaz.net" target=3D"_blank">tworaz@tworaz.net</a>&gt; wrote:<br>
&gt;&gt; Although /usr/bin/python3 works fine for class-target builds its n=
ot<br>
&gt;&gt; really what we want for class-native. The host system might not ev=
en<br>
&gt;&gt; have python3 installed. The native itstool version should use pyth=
n3<br>
&gt;&gt; provided in recipe-sysroot-native. To accomplish it modify the def=
ault<br>
&gt;&gt; shebang to use /usr/bin/env. This works as expected for both nativ=
e and<br>
&gt;&gt; target builds.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Piotr Tworek &lt;<a href=3D"mailto:tworaz@tworaz.ne=
t" target=3D"_blank">tworaz@tworaz.net</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta-oe/recipes-support/itstool/<a href=3D"http://itst=
ool_2.0.5.bb" rel=3D"noreferrer" target=3D"_blank">itstool_2.0.5.bb</a> | 2=
 +-<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-support/itstool/<a href=3D"http://its=
tool_2.0.5.bb" rel=3D"noreferrer" target=3D"_blank">itstool_2.0.5.bb</a> b/=
meta-oe/recipes-support/itstool/<a href=3D"http://itstool_2.0.5.bb" rel=3D"=
noreferrer" target=3D"_blank">itstool_2.0.5.bb</a><br>
&gt;&gt; index a0af44a71..f21e7f39b 100644<br>
&gt;&gt; --- a/meta-oe/recipes-support/itstool/<a href=3D"http://itstool_2.=
0.5.bb" rel=3D"noreferrer" target=3D"_blank">itstool_2.0.5.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-support/itstool/<a href=3D"http://itstool_2.=
0.5.bb" rel=3D"noreferrer" target=3D"_blank">itstool_2.0.5.bb</a><br>
&gt;&gt; @@ -13,7 +13,7 @@ SRC_URI[sha256sum] =3D &quot;100506f8df62cca6225=
ec3e631a8237e9c04650c77495af4919ac6a100<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0do_install_append() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# fix shebang of main script<br>
&gt;&gt; -=C2=A0 =C2=A0 sed -i &#39;s:^#!${WORKDIR}.*${PYTHON_PN} -s:#!${bi=
ndir_native}/${PYTHON_PN} -s:&#39; ${D}${bindir}/itstool<br>
&gt;&gt; +=C2=A0 =C2=A0 sed -i &#39;s:^#!${WORKDIR}.*${PYTHON_PN} -s:#!${bi=
ndir_native}/env -S ${PYTHON_PN} -s:&#39; ${D}${bindir}/itstool<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.21.0<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000baf916058e9a03a8--
