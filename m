Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id AA35560B86
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 16:33:05 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id c26so3122962eds.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 08:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=87Dn6nNY7jSs/ybsSazenDnQp7/Y27+ooemJKgqpHKA=;
	b=p6N8C81ccOls/XC0kZuvaJXTPpG//c2kODMRAyF0ZEonaDuN7G7FHqGFfRAKFrMcH6
	1oi7wNDOWUkUkweK5Rr2A0+36oKO9QgDczMZRTwJRtrLMlAwyjmKwdUO2YPKWre+mhHb
	s0+EmywCe6SGYWJ3ODL0/tqkwaFnkLF7jnOVdNND4EL/kQNVQIin4RYZtTltSnFmmqlw
	Xhr2SCSzBLstz65JdOJF5192YKhg6d9b/9RLiEqZ1M5fZ9dICJ5qPjPT70MZlPvgOtr3
	MB+LfyAmYjtq8ZStlnU6X9WOFQrr/FL1eLw008oRDHMw/pEuLSiTbDlQxiIxl2fHCGpU
	G2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=87Dn6nNY7jSs/ybsSazenDnQp7/Y27+ooemJKgqpHKA=;
	b=hHP6QEPbL6DirIoY+BA9sbSbUrqwf2j/nfT20wYD6OwzMap9UvpkNkbmT0Q43u5OnB
	u0CZ0OZz2R7FRNIE6aC+93usL8+hfsucMM5EYJE0RCtC03Lwg6vuQhydzj25zMn5yJJH
	Z0jS1gcyGkfc9+G67+JyXCjS4jh3ul+Y2Sx0FXeX8t7esdRJfLfUOKSyXnHeJUwSGF+K
	GoeP1MmMERHIyQf4fxmHNMXWu2oQPsqTGtNtQfFD4Ussr2fkvx0dwY99ezRRU1Oo/s7F
	IbyxKBMW52ohfq9LEeUwz9jH8OOl4ds38WF4RbZLnvol1cBe/foQfdCYCH4pLkGsFuMN
	9Pew==
X-Gm-Message-State: APjAAAX2kIYCfw40iq0LeBQe+qMGmlcTmy1fTNc4v7LVHdKIli6OhnmH
	XnC/fPswKKZeB54pk8GXnPh6lSeh4O0pqhkBZNAZ+Qr5
X-Google-Smtp-Source: APXvYqySIKeoceMZx5mLzpk6bNschBrH7W20JEt9E0g/RGofvfe64E1xYJzGG4h58BucoFcXrUmp78Q6y1+TywzcbKk=
X-Received: by 2002:a17:906:5a94:: with SMTP id
	l20mr12245099ejq.192.1581525186276; 
	Wed, 12 Feb 2020 08:33:06 -0800 (PST)
MIME-Version: 1.0
References: <20200212051936.1610922-1-raj.khem@gmail.com>
	<CANNYZj9478oh1cNgK0U5oq8RX=q8VMYZpCnPZ8akgvUtQExFmg@mail.gmail.com>
	<CAMKF1srv-UPO0OjHKqqwu0GPW-rcdcO+0NJSnR4B0s-V43i8pg@mail.gmail.com>
In-Reply-To: <CAMKF1srv-UPO0OjHKqqwu0GPW-rcdcO+0NJSnR4B0s-V43i8pg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 12 Feb 2020 17:32:55 +0100
Message-ID: <CA+chaQevfESVZc2ee2p_Y7bJHOc=M54nWEzE4erb2+zJMFzjFA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Wed, 12 Feb 2020 16:33:05 -0000
Content-Type: multipart/alternative; boundary="000000000000ee710c059e6386b9"

--000000000000ee710c059e6386b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Will this work for you without anonymous python? I think it should.

PNBLACKLIST[dnf] ?=3D "${@oe.utils.conditional('PACKAGE_CLASSES',
'package_rpm', '' 'does not build correctly without package_rpm in
PACKAGE_CLASSES', d)}"

On Wed, Feb 12, 2020 at 4:12 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Feb 11, 2020 at 11:11 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Please let=E2=80=99s try to avoid anonymous python. What problem does t=
his
> solve? If package_rpm is not enabled, then there should not be a dependen=
cy
> chain that builds these anyway.
>
> for non rpm backend opkg, rpm is pulled in which is not desired
> because opkg depends on libsolv
> and libsolv by default depends on rpm which I sent another patch to
> decouple, This caused opkg images to fail tests because testing infra
> found rpm in the image and ran tests for it which obviously would
> fail.
>
>  libsolv does have rpm support as packageconfig but when that
> is disabled then libdnf does not build anymore since it expects rpmdb
> support in libsolv.
>
> so when we do world builds with opkg as package management then dnf
> and libdbf starts to fail
> due to their RPM needs.
>
> IF there was an override to identity packaging backends then we could
> have used that
>
> If you have better suggestions to avoid anon python here, I am all ears.
>
> >
> > Alex
> >
> > On Wed 12. Feb 2020 at 6.20, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> dnf does not work with opkg or dpkg/apt anyway
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  meta/recipes-devtools/dnf/dnf_4.2.2.bb        | 8 ++++++++
> >>  meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 7 +++++++
> >>  2 files changed, 15 insertions(+)
> >>
> >> diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> >> index f38167f1ad..9e6d5741af 100644
> >> --- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> >> +++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
> >> @@ -84,3 +84,11 @@ SYSTEMD_SERVICE_${PN} =3D "dnf-makecache.service
> dnf-makecache.timer \
> >>                           dnf-automatic-notifyonly.service
> dnf-automatic-notifyonly.timer \
> >>  "
> >>  SYSTEMD_AUTO_ENABLE ?=3D "disable"
> >> +
> >> +python () {
> >> +    pkgb =3D d.getVar("PACKAGE_CLASSES")
> >> +    pkgn =3D d.getVar("PN")
> >> +    pkgv =3D d.getVar("PV")
> >> +    if "package_rpm" not in pkgb:
> >> +        raise bb.parse.SkipPackage("%s-%s Needs rpmdb support in
> libsolv" % (pkgn, pkgv))
> >> +}
> >> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> >> index 882c435b32..5c9326ca64 100644
> >> --- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> >> +++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
> >> @@ -27,3 +27,10 @@ EXTRA_OECMAKE_append_class-nativesdk =3D "
> -DWITH_GIR=3DOFF"
> >>
> >>  BBCLASSEXTEND =3D "native nativesdk"
> >>
> >> +python () {
> >> +    pkgb =3D d.getVar("PACKAGE_CLASSES")
> >> +    pkgn =3D d.getVar("PN")
> >> +    pkgv =3D d.getVar("PV")
> >> +    if "package_rpm" not in pkgb:
> >> +        raise bb.parse.SkipPackage("%s-%s Needs rpmdb support in
> libsolv" % (pkgn, pkgv))
> >> +}
> >> --
> >> 2.25.0
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

--000000000000ee710c059e6386b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Will this work for you without anonymous python? I th=
ink it should.</div><div><br></div>PNBLACKLIST[dnf] ?=3D &quot;${@oe.utils.=
conditional(&#39;PACKAGE_CLASSES&#39;, &#39;package_rpm&#39;, &#39;&#39; &#=
39;does not build correctly without package_rpm in PACKAGE_CLASSES&#39;, d)=
}&quot;<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Feb 12, 2020 at 4:12 PM Khem Raj &lt;<a href=3D"mailto:r=
aj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Tue, Feb 11, 2020 at 11:11 PM Alexa=
nder Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Please let=E2=80=99s try to avoid anonymous python. What problem does =
this solve? If package_rpm is not enabled, then there should not be a depen=
dency chain that builds these anyway.<br>
<br>
for non rpm backend opkg, rpm is pulled in which is not desired<br>
because opkg depends on libsolv<br>
and libsolv by default depends on rpm which I sent another patch to<br>
decouple, This caused opkg images to fail tests because testing infra<br>
found rpm in the image and ran tests for it which obviously would<br>
fail.<br>
<br>
=C2=A0libsolv does have rpm support as packageconfig but when that<br>
is disabled then libdnf does not build anymore since it expects rpmdb<br>
support in libsolv.<br>
<br>
so when we do world builds with opkg as package management then dnf<br>
and libdbf starts to fail<br>
due to their RPM needs.<br>
<br>
IF there was an override to identity packaging backends then we could<br>
have used that<br>
<br>
If you have better suggestions to avoid anon python here, I am all ears.<br=
>
<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Wed 12. Feb 2020 at 6.20, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; dnf does not work with opkg or dpkg/apt anyway<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" re=
l=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 8 ++++++++<br>
&gt;&gt;=C2=A0 meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a> | 7 +++++++<=
br>
&gt;&gt;=C2=A0 2 files changed, 15 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2=
.bb" rel=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a> b/meta/recipes-d=
evtools/dnf/<a href=3D"http://dnf_4.2.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">dnf_4.2.2.bb</a><br>
&gt;&gt; index f38167f1ad..9e6d5741af 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" re=
l=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a><br>
&gt;&gt; +++ b/meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.2.2.bb" re=
l=3D"noreferrer" target=3D"_blank">dnf_4.2.2.bb</a><br>
&gt;&gt; @@ -84,3 +84,11 @@ SYSTEMD_SERVICE_${PN} =3D &quot;dnf-makecache.s=
ervice dnf-makecache.timer \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dnf-automatic-notifyonly.service dnf-automat=
ic-notifyonly.timer \<br>
&gt;&gt;=C2=A0 &quot;<br>
&gt;&gt;=C2=A0 SYSTEMD_AUTO_ENABLE ?=3D &quot;disable&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +python () {<br>
&gt;&gt; +=C2=A0 =C2=A0 pkgb =3D d.getVar(&quot;PACKAGE_CLASSES&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 pkgn =3D d.getVar(&quot;PN&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 pkgv =3D d.getVar(&quot;PV&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 if &quot;package_rpm&quot; not in pkgb:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&quot;%s-%=
s Needs rpmdb support in libsolv&quot; % (pkgn, pkgv))<br>
&gt;&gt; +}<br>
&gt;&gt; diff --git a/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf=
_0.28.1.bb" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a> b/met=
a/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">libdnf_0.28.1.bb</a><br>
&gt;&gt; index 882c435b32..5c9326ca64 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a><br>
&gt;&gt; +++ b/meta/recipes-devtools/libdnf/<a href=3D"http://libdnf_0.28.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libdnf_0.28.1.bb</a><br>
&gt;&gt; @@ -27,3 +27,10 @@ EXTRA_OECMAKE_append_class-nativesdk =3D &quot;=
 -DWITH_GIR=3DOFF&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;&gt;<br>
&gt;&gt; +python () {<br>
&gt;&gt; +=C2=A0 =C2=A0 pkgb =3D d.getVar(&quot;PACKAGE_CLASSES&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 pkgn =3D d.getVar(&quot;PN&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 pkgv =3D d.getVar(&quot;PV&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 if &quot;package_rpm&quot; not in pkgb:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&quot;%s-%=
s Needs rpmdb support in libsolv&quot; % (pkgn, pkgv))<br>
&gt;&gt; +}<br>
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
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000ee710c059e6386b9--
