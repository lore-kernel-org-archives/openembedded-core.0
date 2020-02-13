Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 31E9C60B98
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 16:06:46 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id l21so4733065qtr.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=k9WjiXzWd9CCrB28NTevTm/90tyRM3vGYhjcR197Bp8=;
	b=jvplA6o0sLmJPrb65LJGhETq/BSKvCKp1LuFoMXSmWXdSSuIQ5aLr4elq4KS0ZMh5u
	h7qf0QNa1Fsbk+njlP+krxLn3/5x0YcK0tY4uvUNfZ5NunSH4KX6kZHOfGsfp1meMn/x
	FNftJhX7XTxpgde1WtyQNIXyTOKiKfHRbR+0s1/tMVaCZgr1AWErNCGaIY1vpLlgN84c
	oQIJI7mvEElX6D2Vxc15KYpfnLX6PhJ/OX1GjHviKy/Lmh6X4DAbvB5fofilbEQ4Tw7j
	afEcIbpfkuZ4OYXb9Yufw9ENgVUwaM5rDS9bFnrC0l2Y5wvojxl+xWxTsiufqYNQjwRa
	kqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k9WjiXzWd9CCrB28NTevTm/90tyRM3vGYhjcR197Bp8=;
	b=fniR/nzZvzFM3L+RAK2CHzJcBNzIWl2QO8qzWM95MEEu2iA3Wa5p367SYJN8boECLW
	TylqdHLBXb1nDQvliUunobdFMMuICu66V+KnCXp13byqJ/UAnVAKGzIr5zqXRvUeRv+n
	koKPVm/hDHQ6D0JvE0U/bA0QNY7gUHfZLVe78MwffZ8jBtYEDS+noj8HxJljwo3zn7xj
	lTaGeBODQFF/BKIcBQGVd3hstOKq/lIYUX9AUVTegYWi9GENdGTz9zYhHkhPRZNTlp7/
	zKbSNSEjZL6WVLujzDyWWZ2N1AL+l5yG4Cx9bBgcsWkE5FJh+M8/E27VQghCK+M03eJx
	fu1Q==
X-Gm-Message-State: APjAAAXW0F7IVLFrGIGOVUMRU4KltpEjvg7/u2rstQwYrjPG5gU1pet2
	W7b1UnXgnu8afxkIF1r63Y30l9G3if9Zqt+kf40=
X-Google-Smtp-Source: APXvYqzV0Yr6RTG56d95oeWs2Fq1fi6uckNPnjC6aISsfNniGdLK3Xl3oYyVEoShUnS9xwTlaSfiXgv1XmOAYdgueL8=
X-Received: by 2002:ac8:1a30:: with SMTP id v45mr12092363qtj.80.1581610006672; 
	Thu, 13 Feb 2020 08:06:46 -0800 (PST)
MIME-Version: 1.0
References: <20200212191927.2708197-1-raj.khem@gmail.com>
	<CANNYZj9-oPmywGhB8S6aaoJyfs7mdYLTsPTdDULgdyt6yQJb5g@mail.gmail.com>
	<CAMKF1sowa6qCZwD=1Q7RRMpY1q7SbuW4izg4YFTqOhB2sAuUWw@mail.gmail.com>
	<CANNYZj8kTvu7Z3C5JtXbjLNvu1NymoTbOgiJnLS3cqLMOKO3pw@mail.gmail.com>
	<CAMKF1spSwxqzVW0r2wxQQqPg6PW3ZwZM+HcNh9L0zai7wz4HfQ@mail.gmail.com>
	<CANNYZj_7n9NKm22GDjT9rBU+XokBhuqZthM20Gz-X-AoAxNP=A@mail.gmail.com>
In-Reply-To: <CANNYZj_7n9NKm22GDjT9rBU+XokBhuqZthM20Gz-X-AoAxNP=A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2020 08:06:35 -0800
Message-ID: <CAMKF1sqiOxhyd98HTVbqCLWhxBeqW1sZ_d5cvT8E+OMUQejMHQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
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
X-List-Received-Date: Thu, 13 Feb 2020 16:06:46 -0000
Content-Type: multipart/alternative; boundary="0000000000009ef8dd059e77463c"

--0000000000009ef8dd059e77463c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2020 at 11:53 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> World builds also enable apt and dpkg, but there is no problem with that
> for you? There is no consistency here; if you want to start excluding
> things from world based on what packaging is enabled, you need to treat a=
ll
> options equally, including deb and ipk.
>

No, problem is that if One wants to use opkg backend then rpm drags along
but apt or dpkg don=E2=80=99t
World builds are also problem but secondary
Please try to understand the entirety of problem

I tried everything to keep it building but i could not and I have been
saying that all along

If you can come up with patches to dnf to build with libresolv that is not
build with rpm support we might get to built however I don=E2=80=99t think =
it will
of any use at runtime


>
> The original problem was that libsolv pulls in the full set of rpm
> executables and libraries, which erroneously triggers the rpm test on
> target. We can solve this by making libsolv pull in only the rpm librarie=
s
> and not executables,
>

Libsolve already has option to disable rpmdb support and we use it

so that rpm test will be skipped. Or maybe even make the test itself check
> whether rpm is the packaging format and skip otherwise.
>

No. Skipping test is just symptom of the problem I knew we could paper over
it but that=E2=80=99s not the point

Even if test is made to pass rpm will be dragged into
Images which is not desired


> Alex
>
> On Thu 13. Feb 2020 at 7.01, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Wed, Feb 12, 2020 at 8:49 PM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > But you do not need to fix or touch dnf at all. You only need to adjus=
t
>> rpm packaging and split it in two parts instead of bundling everything i=
nto
>> a single package.
>> >
>>
>> when we do world builds without package_rpm, dnf and related packages
>> get compiled which is unnecessary and moreover wrong and when we mark
>> libsolv to enable rpmdb only for package_rpm, this becomes even more
>> evident.
>>
>> Perhaps, I am missing what you intend to convey, in that case maybe you
>> can send
>> code changes to support what you are intending here.
>>
>> > Alex
>> >
>> > On Wed 12. Feb 2020 at 23.16, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> On Wed, Feb 12, 2020 at 2:00 PM Alexander Kanavin
>> >> <alex.kanavin@gmail.com> wrote:
>> >> >
>> >> > I would still prefer to just split rpm packaging into binaries and
>> libraries, and avoid the need to blacklist and tweak recipes based on wh=
at
>> PACKAGE_CLASSES is set to altogether. That setting should not leak into
>> recipes, and should only matter from do_package onwards. Can you look in=
to
>> the rpm recipe please?
>> >> >
>> >>
>> >>  dnf and dnf related packages expecting rpmdb support in libresolv. I
>> >> do not know dnf well enough to fix it and moreover it has no direct
>> >> use for my usecase either. I also don't see a point of entertaining
>> >> dnf for non-rpm backends. Its not intended for that either even if we
>> >> were to make dnf not want rpmdb what good will it do to build for
>> >> distros who do not use rpm. These changes do not change poky defaults
>> >> which use rpm as default. OE-core does not and I dont know of any
>> >> opkg user who also has rpmdb needed.
>> >>
>> >> > Alex
>> >> >
>> >> > On Wed, 12 Feb 2020 at 20:19, Khem Raj <raj.khem@gmail.com> wrote:
>> >> >>
>> >> >> dnf does not work with opkg or dpkg/apt anyway
>> >> >>
>> >> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> >> ---
>> >> >> v2: Use PNBLACKLIST instead of anon python
>> >> >>
>> >> >>  meta/recipes-devtools/dnf/dnf_4.2.2.bb        | 2 ++
>> >> >>  meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 1 +
>> >> >>  2 files changed, 3 insertions(+)
>> >> >>
>> >> >> diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
>> b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
>> >> >> index f38167f1ad..220f1aabbd 100644
>> >> >> --- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
>> >> >> +++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
>> >> >> @@ -84,3 +84,5 @@ SYSTEMD_SERVICE_${PN} =3D "dnf-makecache.service
>> dnf-makecache.timer \
>> >> >>                           dnf-automatic-notifyonly.service
>> dnf-automatic-notifyonly.timer \
>> >> >>  "
>> >> >>  SYSTEMD_AUTO_ENABLE ?=3D "disable"
>> >> >> +
>> >> >> +PNBLACKLIST[dnf] ?=3D "${@bb.utils.contains('PACKAGE_CLASSES',
>> 'package_rpm', '', 'does not build correctly without package_rpm in
>> PACKAGE_CLASSES', d)}"
>> >> >> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>> b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>> >> >> index 882c435b32..49afa04812 100644
>> >> >> --- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>> >> >> +++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>> >> >> @@ -26,4 +26,5 @@ EXTRA_OECMAKE_append_class-native =3D "
>> -DWITH_GIR=3DOFF"
>> >> >>  EXTRA_OECMAKE_append_class-nativesdk =3D " -DWITH_GIR=3DOFF"
>> >> >>
>> >> >>  BBCLASSEXTEND =3D "native nativesdk"
>> >> >> +PNBLACKLIST[libdnf] ?=3D "${@bb.utils.contains('PACKAGE_CLASSES',
>> 'package_rpm', '', 'does not build correctly without package_rpm in
>> PACKAGE_CLASSES', d)}"
>> >> >>
>> >> >> --
>> >> >> 2.25.0
>> >> >>
>> >> >> --
>> >> >> _______________________________________________
>> >> >> Openembedded-core mailing list
>> >> >> Openembedded-core@lists.openembedded.org
>> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--0000000000009ef8dd059e77463c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Feb 12, 2020 at 11:53 PM Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div><div dir=3D"auto">World build=
s also enable apt and dpkg, but there is no problem with that for you? Ther=
e is no consistency here; if you want to start excluding things from world =
based on what packaging is enabled, you need to treat all options equally, =
including deb and ipk.</div></div></blockquote><div dir=3D"auto"><br></div>=
<div dir=3D"auto">No, problem is that if One wants to use opkg backend then=
 rpm drags along but apt or dpkg don=E2=80=99t</div><div dir=3D"auto">World=
 builds are also problem but secondary</div><div dir=3D"auto">Please try to=
 understand the entirety of problem=C2=A0</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">I tried everything to keep it building but i could not an=
d I have been saying that all along</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">If you can come up with patches to dnf to build with libresolv =
that is not build with rpm support we might get to built however I don=E2=
=80=99t think it will of any use at runtime</div><div dir=3D"auto">=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div><div dir=3D"auto"></div></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">The original problem was that libs=
olv pulls in the full set of rpm executables and libraries, which erroneous=
ly triggers the rpm test on target. We can solve this by making libsolv pul=
l in only the rpm libraries and not executables, </div></blockquote><div di=
r=3D"auto"><br></div><div dir=3D"auto">Libsolve already has option to disab=
le rpmdb support and we use it</div><div dir=3D"auto"><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div dir=3D"auto">so that rpm test will be skipped. Or =
maybe even make the test itself check whether rpm is the packaging format a=
nd skip otherwise.</div></blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">No. Skipping test is just symptom of the problem I knew we could =
paper over it but that=E2=80=99s not the point</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Even if test is made to pass rpm will be dragged int=
o</div><div dir=3D"auto">Images which is not desired=C2=A0</div><div dir=3D=
"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu 13. Feb 2020 at =
7.01, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">=
raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">O=
n Wed, Feb 12, 2020 at 8:49 PM Alexander Kanavin<br>
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
</blockquote></div></div>

--0000000000009ef8dd059e77463c--
