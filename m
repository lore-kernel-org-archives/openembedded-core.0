Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0C92C60BBD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 07:53:34 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id i4so1324893vkc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 23:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j+L9vxlzdSxM0NHrF0JmMYvgDgvpGI0SVKqbRf7UkZA=;
	b=M7udYIqNvr61r4s3PiFYM3kLUPFP5ikWSM5UTqKeZArGo8EBWdS2sBU/2h5Ofrhjmk
	j9/DOzHFWpf5eC5e9opLHqSJceZT7mp0nig8Hc35Lg7IdTeGzuJUx+5XR5UqRU0/oKYZ
	9OByzwhVfa0oFkfe9f1D5ehW2z57gnOxbjGRL9dM9PKi4O4depTxaWA+kg9o/2IwjsZg
	wlDvEEUongG1CC9Zh+YtDxrAy1JKFHCJc6X2C1wqFJltwrmYI6188/DB7r8BT8aC3AYf
	ahYpZHpOgHH4wVhFfRbpjj8Kd4Lqr57BTtirlPX4+Ba7K7qnDj8TIaQbgGEDc+7S+Rvb
	6bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j+L9vxlzdSxM0NHrF0JmMYvgDgvpGI0SVKqbRf7UkZA=;
	b=NZASyQjDuc8pjqMromhUYM79FBtLSyy9Sek6uhTAlim/+ABVGuDi+MbtSsvbGdSGIy
	Lz3iKtmoB2TJFyxEMsK83c1XFA1Yp/zhuMyl+3AKpMuvplNbwBkFLd1VQH/4RY5mG8lW
	un2x9pIz2MugUriI6rBKaBnpdztcKDvCi8fl3+Y/tuHoHzbauq2FjS+c55xLdtALbUU+
	kP8HMrI29z7tpKjOSo3qXJjqxQfKqlaQMa9YZE3DYlj/iRKm0J4a55tYuFCNjCnkgP24
	qbUZ6YcD/WVNCGuXK67DT4tFZ6DC+7wcGhNpydUNNQQzRh0/Uy6lfnyybxCF5+AlxGFF
	c7bQ==
X-Gm-Message-State: APjAAAVsB2bGtFhKgvGzfRdyz6DAuEfO1YWS3LA3sIuB63u4hDIM3yYg
	qCx8hK8Hg6gtWhTDWY1kfw+b0wUVYL+YmN9w0u4=
X-Google-Smtp-Source: APXvYqzV4e9LC10AlAOdlZKVRo0f3HxWSP4xGL461kL1HzU2y1MKrG9TeDz0oK9xsZwlGIoo1vUIAWhpvrSFpVaLr9s=
X-Received: by 2002:a1f:7dcd:: with SMTP id y196mr10041513vkc.29.1581580415870;
	Wed, 12 Feb 2020 23:53:35 -0800 (PST)
MIME-Version: 1.0
References: <20200212191927.2708197-1-raj.khem@gmail.com>
	<CANNYZj9-oPmywGhB8S6aaoJyfs7mdYLTsPTdDULgdyt6yQJb5g@mail.gmail.com>
	<CAMKF1sowa6qCZwD=1Q7RRMpY1q7SbuW4izg4YFTqOhB2sAuUWw@mail.gmail.com>
	<CANNYZj8kTvu7Z3C5JtXbjLNvu1NymoTbOgiJnLS3cqLMOKO3pw@mail.gmail.com>
	<CAMKF1spSwxqzVW0r2wxQQqPg6PW3ZwZM+HcNh9L0zai7wz4HfQ@mail.gmail.com>
In-Reply-To: <CAMKF1spSwxqzVW0r2wxQQqPg6PW3ZwZM+HcNh9L0zai7wz4HfQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Feb 2020 08:53:24 +0100
Message-ID: <CANNYZj_7n9NKm22GDjT9rBU+XokBhuqZthM20Gz-X-AoAxNP=A@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Feb 2020 07:53:35 -0000
Content-Type: multipart/alternative; boundary="000000000000df2d34059e70629f"

--000000000000df2d34059e70629f
Content-Type: text/plain; charset="UTF-8"

World builds also enable apt and dpkg, but there is no problem with that
for you? There is no consistency here; if you want to start excluding
things from world based on what packaging is enabled, you need to treat all
options equally, including deb and ipk.

The original problem was that libsolv pulls in the full set of rpm
executables and libraries, which erroneously triggers the rpm test on
target. We can solve this by making libsolv pull in only the rpm libraries
and not executables, so that rpm test will be skipped. Or maybe even make
the test itself check whether rpm is the packaging format and skip
otherwise.

Alex

On Thu 13. Feb 2020 at 7.01, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Feb 12, 2020 at 8:49 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > But you do not need to fix or touch dnf at all. You only need to adjust
> rpm packaging and split it in two parts instead of bundling everything into
> a single package.
> >
>
> when we do world builds without package_rpm, dnf and related packages
> get compiled which is unnecessary and moreover wrong and when we mark
> libsolv to enable rpmdb only for package_rpm, this becomes even more
> evident.
>
> Perhaps, I am missing what you intend to convey, in that case maybe you
> can send
> code changes to support what you are intending here.
>
> > Alex
> >
> > On Wed 12. Feb 2020 at 23.16, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Wed, Feb 12, 2020 at 2:00 PM Alexander Kanavin
> >> <alex.kanavin@gmail.com> wrote:
> >> >
> >> > I would still prefer to just split rpm packaging into binaries and
> libraries, and avoid the need to blacklist and tweak recipes based on what
> PACKAGE_CLASSES is set to altogether. That setting should not leak into
> recipes, and should only matter from do_package onwards. Can you look into
> the rpm recipe please?
> >> >
> >>
> >>  dnf and dnf related packages expecting rpmdb support in libresolv. I
> >> do not know dnf well enough to fix it and moreover it has no direct
> >> use for my usecase either. I also don't see a point of entertaining
> >> dnf for non-rpm backends. Its not intended for that either even if we
> >> were to make dnf not want rpmdb what good will it do to build for
> >> distros who do not use rpm. These changes do not change poky defaults
> >> which use rpm as default. OE-core does not and I dont know of any
> >> opkg user who also has rpmdb needed.
> >>
> >> > Alex
> >> >
> >> > On Wed, 12 Feb 2020 at 20:19, Khem Raj <raj.khem@gmail.com> wrote:
> >> >>
> >> >> dnf does not work with opkg or dpkg/apt anyway
> >> >>
> >> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> >> ---
> >> >> v2: Use PNBLACKLIST instead of anon python
> >> >>
> >> >>  meta/recipes-devtools/dnf/dnf_4.2.2.bb        | 2 ++
> >> >>  meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 1 +
> >> >>  2 files changed, 3 insertions(+)
> >> >>
> >> >> diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> >> >> index f38167f1ad..220f1aabbd 100644
> >> >> --- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> >> >> +++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> >> >> @@ -84,3 +84,5 @@ SYSTEMD_SERVICE_${PN} = "dnf-makecache.service
> dnf-makecache.timer \
> >> >>                           dnf-automatic-notifyonly.service
> dnf-automatic-notifyonly.timer \
> >> >>  "
> >> >>  SYSTEMD_AUTO_ENABLE ?= "disable"
> >> >> +
> >> >> +PNBLACKLIST[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES',
> 'package_rpm', '', 'does not build correctly without package_rpm in
> PACKAGE_CLASSES', d)}"
> >> >> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> >> >> index 882c435b32..49afa04812 100644
> >> >> --- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> >> >> +++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> >> >> @@ -26,4 +26,5 @@ EXTRA_OECMAKE_append_class-native = "
> -DWITH_GIR=OFF"
> >> >>  EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_GIR=OFF"
> >> >>
> >> >>  BBCLASSEXTEND = "native nativesdk"
> >> >> +PNBLACKLIST[libdnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES',
> 'package_rpm', '', 'does not build correctly without package_rpm in
> PACKAGE_CLASSES', d)}"
> >> >>
> >> >> --
> >> >> 2.25.0
> >> >>
> >> >> --
> >> >> _______________________________________________
> >> >> Openembedded-core mailing list
> >> >> Openembedded-core@lists.openembedded.org
> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000df2d34059e70629f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">World builds also enable apt and dpkg, but there is =
no problem with that for you? There is no consistency here; if you want to =
start excluding things from world based on what packaging is enabled, you n=
eed to treat all options equally, including deb and ipk.</div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">The original problem was that libsol=
v pulls in the full set of rpm executables and libraries, which erroneously=
 triggers the rpm test on target. We can solve this by making libsolv pull =
in only the rpm libraries and not executables, so that rpm test will be ski=
pped. Or maybe even make the test itself check whether rpm is the packaging=
 format and skip otherwise.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Thu 13. Feb 2020 at 7.01, Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On Wed, Feb 12, 2020 at 8:49 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; But you do not need to fix or touch dnf at all. You only need to adjus=
t rpm packaging and split it in two parts instead of bundling everything in=
to a single package.<br>
&gt;<br>
<br>
when we do world builds without package_rpm, dnf and related packages<br>
get compiled which is unnecessary and moreover wrong and when we mark<br>
libsolv to enable rpmdb only for package_rpm, this becomes even more eviden=
t.<br>
<br>
Perhaps, I am missing what you intend to convey, in that case maybe you can=
 send<br>
code changes to support what you are intending here.<br>
<br>
&gt; Alex<br>
&gt;<br>
&gt; On Wed 12. Feb 2020 at 23.16, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Feb 12, 2020 at 2:00 PM Alexander Kanavin<br>
&gt;&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">al=
ex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I would still prefer to just split rpm packaging into binarie=
s and libraries, and avoid the need to blacklist and tweak recipes based on=
 what PACKAGE_CLASSES is set to altogether. That setting should not leak in=
to recipes, and should only matter from do_package onwards. Can you look in=
to the rpm recipe please?<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 dnf and dnf related packages expecting rpmdb support in libr=
esolv. I<br>
&gt;&gt; do not know dnf well enough to fix it and moreover it has no direc=
t<br>
&gt;&gt; use for my usecase either. I also don&#39;t see a point of enterta=
ining<br>
&gt;&gt; dnf for non-rpm backends. Its not intended for that either even if=
 we<br>
&gt;&gt; were to make dnf not want rpmdb what good will it do to build for<=
br>
&gt;&gt; distros who do not use rpm. These changes do not change poky defau=
lts<br>
&gt;&gt; which use rpm as default. OE-core does not and I dont know of any<=
br>
&gt;&gt; opkg user who also has rpmdb needed.<br>
&gt;&gt;<br>
&gt;&gt; &gt; Alex<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Wed, 12 Feb 2020 at 20:19, Khem Raj &lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; dnf does not work with opkg or dpkg/apt anyway<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt; v2: Use PNBLACKLIST instead of anon python<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2=
.2.bb" rel=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 ++<br>
&gt;&gt; &gt;&gt;=C2=A0 meta/recipes-devtools/libdnf/<a href=3D"http://libd=
nf_0.28.1.bb" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a> | 1=
 +<br>
&gt;&gt; &gt;&gt;=C2=A0 2 files changed, 3 insertions(+)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/meta/recipes-devtools/dnf/<a href=3D"http://=
dnf_4.2.2.bb" rel=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a> b/meta/=
recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">dnf_4.2.2.bb</a><br>
&gt;&gt; &gt;&gt; index f38167f1ad..220f1aabbd 100644<br>
&gt;&gt; &gt;&gt; --- a/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2=
.2.bb" rel=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a><br>
&gt;&gt; &gt;&gt; +++ b/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2=
.2.bb" rel=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a><br>
&gt;&gt; &gt;&gt; @@ -84,3 +84,5 @@ SYSTEMD_SERVICE_${PN} =3D &quot;dnf-mak=
ecache.service dnf-makecache.timer \<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dnf-automatic-notifyonly.service d=
nf-automatic-notifyonly.timer \<br>
&gt;&gt; &gt;&gt;=C2=A0 &quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 SYSTEMD_AUTO_ENABLE ?=3D &quot;disable&quot;<br>
&gt;&gt; &gt;&gt; +<br>
&gt;&gt; &gt;&gt; +PNBLACKLIST[dnf] ?=3D &quot;${@bb.utils.contains(&#39;PA=
CKAGE_CLASSES&#39;, &#39;package_rpm&#39;, &#39;&#39;, &#39;does not build =
correctly without package_rpm in PACKAGE_CLASSES&#39;, d)}&quot;<br>
&gt;&gt; &gt;&gt; diff --git a/meta/recipes-devtools/libdnf/<a href=3D"http=
://libdnf_0.28.1.bb" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb<=
/a> b/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.bb" rel=
=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a><br>
&gt;&gt; &gt;&gt; index 882c435b32..49afa04812 100644<br>
&gt;&gt; &gt;&gt; --- a/meta/recipes-devtools/libdnf/<a href=3D"http://libd=
nf_0.28.1.bb" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a><br>
&gt;&gt; &gt;&gt; +++ b/meta/recipes-devtools/libdnf/<a href=3D"http://libd=
nf_0.28.1.bb" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a><br>
&gt;&gt; &gt;&gt; @@ -26,4 +26,5 @@ EXTRA_OECMAKE_append_class-native =3D &=
quot; -DWITH_GIR=3DOFF&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 EXTRA_OECMAKE_append_class-nativesdk =3D &quot; -DW=
ITH_GIR=3DOFF&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;&gt; &gt;&gt; +PNBLACKLIST[libdnf] ?=3D &quot;${@bb.utils.contains(&#39=
;PACKAGE_CLASSES&#39;, &#39;package_rpm&#39;, &#39;&#39;, &#39;does not bui=
ld correctly without package_rpm in PACKAGE_CLASSES&#39;, d)}&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; 2.25.0<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; _______________________________________________<br>
&gt;&gt; &gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; &gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.or=
g" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; &gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo=
/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.opene=
mbedded.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000df2d34059e70629f--
