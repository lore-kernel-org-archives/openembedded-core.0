Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
	[209.85.222.45])
	by mail.openembedded.org (Postfix) with ESMTP id D26C3606DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 04:49:52 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id y3so1812983uae.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 20:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t/02DIvfnBWVyYglARavlflNFAWCe5jI/a74lsd0qZM=;
	b=e8+gL7gBzTinU59Rjf8EMEG5XAqAxZfGxS1r44+nU4BNHq5zCjE1EzICFk2r01Ka5l
	+0FRqYYAC0DRmV3ECGFASEQSyX6QFNqbrgn9PXfmyH9FxBjQ4qQGcPGMCb2T5OHFXB2B
	HRqLnDqnkNXnvpVJ1nREftAfSn07/w1g+9aUCmf4+5JTqbl4rxbQ7nJpQys30jNV7aS9
	StxY1uqOW78jepR+Ti4KQnPdOAke/pf62qCq3JMuAJdRhWFzdmRN03FKTR/s4CGukNqT
	m2ajK7YSjf1IBkaG3doaUp/jAWUZulg8HWLSNhH0vLn+xc+u1cJa6s27xNHG50pj7uM3
	9QEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t/02DIvfnBWVyYglARavlflNFAWCe5jI/a74lsd0qZM=;
	b=tTFabK439Ie20KMlYdNnB7My92Zkd4ALBermDkhI2iLrR18J2AMJXBqtBCty+wnL9m
	cKvKOV+xZkgCtsLapWSkFt5uLl3iR6tlq7+54Nk7cfhvMy6tVsbahkOpaOdNbgHxLSgp
	tGEawA3GKMzj1ihWBjQtIEyvslDS/uNv17bfQFK1ziPNWXLquqCZ5W7UFZR+kLaSJaGE
	7jvVMbBc8qzQPyWvKfl6st7fUhh1v/kEeeCPNtRsiyBgpIsE8kUnjOKUSHsiV7w0NvUy
	0KbydVDguXb3h+DN7KtXO/dBP4yMVjj9QlACblV+8KJ7B2ubGOUst44I/D5H57V6tN5e
	84lA==
X-Gm-Message-State: APjAAAUijIh+ZJi4TD4lp+xeY8ta6tJk4LMioI/GbnIe9fBPCWzWXnUl
	vRoDtwP6fx7lbtAvosvRM0KmnRU22YHti7dHb2w=
X-Google-Smtp-Source: APXvYqzuamENA1T0hqur7Uyiv4nQpgNsZTVPVA6ruLmlrueXEWkrhTeN2tQ7Pl531l4vRJjEcfGaYpd0zt4dMZEANdk=
X-Received: by 2002:ab0:658d:: with SMTP id v13mr6155752uam.71.1581569393425; 
	Wed, 12 Feb 2020 20:49:53 -0800 (PST)
MIME-Version: 1.0
References: <20200212191927.2708197-1-raj.khem@gmail.com>
	<CANNYZj9-oPmywGhB8S6aaoJyfs7mdYLTsPTdDULgdyt6yQJb5g@mail.gmail.com>
	<CAMKF1sowa6qCZwD=1Q7RRMpY1q7SbuW4izg4YFTqOhB2sAuUWw@mail.gmail.com>
In-Reply-To: <CAMKF1sowa6qCZwD=1Q7RRMpY1q7SbuW4izg4YFTqOhB2sAuUWw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Feb 2020 05:49:42 +0100
Message-ID: <CANNYZj8kTvu7Z3C5JtXbjLNvu1NymoTbOgiJnLS3cqLMOKO3pw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Thu, 13 Feb 2020 04:49:53 -0000
Content-Type: multipart/alternative; boundary="000000000000e203be059e6dd18d"

--000000000000e203be059e6dd18d
Content-Type: text/plain; charset="UTF-8"

But you do not need to fix or touch dnf at all. You only need to adjust rpm
packaging and split it in two parts instead of bundling everything into a
single package.

Alex

On Wed 12. Feb 2020 at 23.16, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Feb 12, 2020 at 2:00 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > I would still prefer to just split rpm packaging into binaries and
> libraries, and avoid the need to blacklist and tweak recipes based on what
> PACKAGE_CLASSES is set to altogether. That setting should not leak into
> recipes, and should only matter from do_package onwards. Can you look into
> the rpm recipe please?
> >
>
>  dnf and dnf related packages expecting rpmdb support in libresolv. I
> do not know dnf well enough to fix it and moreover it has no direct
> use for my usecase either. I also don't see a point of entertaining
> dnf for non-rpm backends. Its not intended for that either even if we
> were to make dnf not want rpmdb what good will it do to build for
> distros who do not use rpm. These changes do not change poky defaults
> which use rpm as default. OE-core does not and I dont know of any
> opkg user who also has rpmdb needed.
>
> > Alex
> >
> > On Wed, 12 Feb 2020 at 20:19, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> dnf does not work with opkg or dpkg/apt anyway
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >> v2: Use PNBLACKLIST instead of anon python
> >>
> >>  meta/recipes-devtools/dnf/dnf_4.2.2.bb        | 2 ++
> >>  meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 1 +
> >>  2 files changed, 3 insertions(+)
> >>
> >> diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> >> index f38167f1ad..220f1aabbd 100644
> >> --- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> >> +++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> >> @@ -84,3 +84,5 @@ SYSTEMD_SERVICE_${PN} = "dnf-makecache.service
> dnf-makecache.timer \
> >>                           dnf-automatic-notifyonly.service
> dnf-automatic-notifyonly.timer \
> >>  "
> >>  SYSTEMD_AUTO_ENABLE ?= "disable"
> >> +
> >> +PNBLACKLIST[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES',
> 'package_rpm', '', 'does not build correctly without package_rpm in
> PACKAGE_CLASSES', d)}"
> >> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> >> index 882c435b32..49afa04812 100644
> >> --- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> >> +++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> >> @@ -26,4 +26,5 @@ EXTRA_OECMAKE_append_class-native = " -DWITH_GIR=OFF"
> >>  EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_GIR=OFF"
> >>
> >>  BBCLASSEXTEND = "native nativesdk"
> >> +PNBLACKLIST[libdnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES',
> 'package_rpm', '', 'does not build correctly without package_rpm in
> PACKAGE_CLASSES', d)}"
> >>
> >> --
> >> 2.25.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000e203be059e6dd18d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">But you do not need to fix or touch dnf at all. You =
only need to adjust rpm packaging and split it in two parts instead of bund=
ling everything into a single package.</div></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed 12. Feb 2020 at 23.16, Khem Raj &lt;<a=
 href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">On Wed, Feb 12, 2020 at 2:00 PM Alexande=
r Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I would still prefer to just split rpm packaging into binaries and lib=
raries, and avoid the need to blacklist and tweak recipes based on what PAC=
KAGE_CLASSES is set to altogether. That setting should not leak into recipe=
s, and should only matter from do_package onwards. Can you look into the rp=
m recipe please?<br>
&gt;<br>
<br>
=C2=A0dnf and dnf related packages expecting rpmdb support in libresolv. I<=
br>
do not know dnf well enough to fix it and moreover it has no direct<br>
use for my usecase either. I also don&#39;t see a point of entertaining<br>
dnf for non-rpm backends. Its not intended for that either even if we<br>
were to make dnf not want rpmdb what good will it do to build for<br>
distros who do not use rpm. These changes do not change poky defaults<br>
which use rpm as default. OE-core does not and I dont know of any<br>
opkg user who also has rpmdb needed.<br>
<br>
&gt; Alex<br>
&gt;<br>
&gt; On Wed, 12 Feb 2020 at 20:19, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; dnf does not work with opkg or dpkg/apt anyway<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; v2: Use PNBLACKLIST instead of anon python<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" re=
l=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 2 ++<br>
&gt;&gt;=C2=A0 meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a> | 1 +<br>
&gt;&gt;=C2=A0 2 files changed, 3 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2=
.bb" rel=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a> b/meta/recipes-d=
evtools/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">dnf_4.2.2.bb</a><br>
&gt;&gt; index f38167f1ad..220f1aabbd 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" re=
l=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a><br>
&gt;&gt; +++ b/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" re=
l=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a><br>
&gt;&gt; @@ -84,3 +84,5 @@ SYSTEMD_SERVICE_${PN} =3D &quot;dnf-makecache.se=
rvice dnf-makecache.timer \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dnf-automatic-notifyonly.service dnf-automat=
ic-notifyonly.timer \<br>
&gt;&gt;=C2=A0 &quot;<br>
&gt;&gt;=C2=A0 SYSTEMD_AUTO_ENABLE ?=3D &quot;disable&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +PNBLACKLIST[dnf] ?=3D &quot;${@bb.utils.contains(&#39;PACKAGE_CLA=
SSES&#39;, &#39;package_rpm&#39;, &#39;&#39;, &#39;does not build correctly=
 without package_rpm in PACKAGE_CLASSES&#39;, d)}&quot;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf=
_0.28.1.bb" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a> b/met=
a/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">libdnf_0.28.1.bb</a><br>
&gt;&gt; index 882c435b32..49afa04812 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a><br>
&gt;&gt; +++ b/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a><br>
&gt;&gt; @@ -26,4 +26,5 @@ EXTRA_OECMAKE_append_class-native =3D &quot; -DW=
ITH_GIR=3DOFF&quot;<br>
&gt;&gt;=C2=A0 EXTRA_OECMAKE_append_class-nativesdk =3D &quot; -DWITH_GIR=
=3DOFF&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;&gt; +PNBLACKLIST[libdnf] ?=3D &quot;${@bb.utils.contains(&#39;PACKAGE_=
CLASSES&#39;, &#39;package_rpm&#39;, &#39;&#39;, &#39;does not build correc=
tly without package_rpm in PACKAGE_CLASSES&#39;, d)}&quot;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.25.0<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000e203be059e6dd18d--
