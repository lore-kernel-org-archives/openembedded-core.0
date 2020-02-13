Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
	[209.85.217.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6727260BA9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:19:45 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id c18so3023754vsq.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 00:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wncqhKSO9UP3q3ZZRG+U/Uq1OucDwiHYb2GdcL3B0cg=;
	b=d5hnLpTm6zsqFMpyGGFp6WFegMDx9faAHkRsijcPyg7b2C1jUiHKnFaYJ1As8HL8ox
	MeQM9N9ZL8cYILL+OVKHFh96kQtnOXpqGsvbVfrZYLT129N7UyNd4tiPf/WKgDEKgL54
	XOeeZUEoF4WNZ5ZxcYtoW41AU3SE+1IP5HSZCpJvkZ7DY9Bk34KANzB730vgJsGLCt7O
	JvmK4Kv4R7lyyNMw9puQOVUl3ddvBjtn5boTvLsPbku6CHnghDnmT6GXr4UfkDTZUCUp
	IHCUvSbhNTcvIXJ/+VDAR+O6XBCU5MN/+rMipas28synRgpLmnLCxDsWW5RYf8v31xCr
	n3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wncqhKSO9UP3q3ZZRG+U/Uq1OucDwiHYb2GdcL3B0cg=;
	b=ZTG9c83mq1kPMrNc60686HeNbKKP6yG3tJXvpHLYmPdygjThWQ8XywGtkoo8CA4wal
	lHmLNcD4NrHtfAeJIh8sdUUdQHZ8QeZbv0mRWH+XgXxc6xz+y2g7XLliDylflyl3A1CQ
	VAYvaXxTGp+ZWV98yBxdsSzrTAtXAoPpjf0EnAlGnvza+hqDX37JPe2XyGuTKXnDH49t
	72TyRgnnislmjfUvDTHwo8+VFLl66SvmRKoYPTuojvkegAbfs3ryrPRO/FM2AghsDrG6
	K8ou/+gtrvHz2p7Ci07lUU61MEfU6m60EzxJGz0/8jVS4F+k8qoqydqGvF/xR9tvxu0a
	kNzA==
X-Gm-Message-State: APjAAAV/+/t7+iod04dyGHwq6L51oa1dSVc/p1TyjGMavFDuE5vw1C1H
	osPJZ543cennRZy0kbAVc2rU3owbNPhBTAf3bXs=
X-Google-Smtp-Source: APXvYqzLdD/VmV9Qc8USF5hHTm6q/gVlUP1mur1wZiSu5SvtrsmVOb4/5MWm+KnxKX8YDdh7hRuGinLLZ5mUayjnmW4=
X-Received: by 2002:a05:6102:52e:: with SMTP id
	m14mr14975613vsa.25.1581581986250; 
	Thu, 13 Feb 2020 00:19:46 -0800 (PST)
MIME-Version: 1.0
References: <20200212191927.2708197-1-raj.khem@gmail.com>
	<CANNYZj9-oPmywGhB8S6aaoJyfs7mdYLTsPTdDULgdyt6yQJb5g@mail.gmail.com>
	<CAMKF1sowa6qCZwD=1Q7RRMpY1q7SbuW4izg4YFTqOhB2sAuUWw@mail.gmail.com>
	<CANNYZj8kTvu7Z3C5JtXbjLNvu1NymoTbOgiJnLS3cqLMOKO3pw@mail.gmail.com>
	<CAMKF1spSwxqzVW0r2wxQQqPg6PW3ZwZM+HcNh9L0zai7wz4HfQ@mail.gmail.com>
	<CANNYZj_7n9NKm22GDjT9rBU+XokBhuqZthM20Gz-X-AoAxNP=A@mail.gmail.com>
In-Reply-To: <CANNYZj_7n9NKm22GDjT9rBU+XokBhuqZthM20Gz-X-AoAxNP=A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Feb 2020 09:19:35 +0100
Message-ID: <CANNYZj_yW7pZ-XErMtbbzyXuG+1XWM1dDvFJsdn8WEkZrP2KNg@mail.gmail.com>
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
X-List-Received-Date: Thu, 13 Feb 2020 08:19:45 -0000
Content-Type: multipart/alternative; boundary="00000000000079468b059e70c0d9"

--00000000000079468b059e70c0d9
Content-Type: text/plain; charset="UTF-8"

I took a look at meta/lib/oeqa/runtime/cases/rpm.py.

All tests depend on test_rpm_query, which should be skipped if rpm is not
used for packaging:

        status, output = self.target.run('ls /var/lib/rpm/')
        if status != 0:
            self.skipTest('No /var/lib/rpm on target')

Can you please check, how the tests fails for you exactly, and why
/var/lib/rpm exists (and what is the content of it)?

The test used to have the check I am talking about, but it was removed by

commit 633bd85270922d71ab4b1f94cd166da51fbe1458
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Thu Nov 8 19:55:17 2018 +0000

    oeqa/runtime/cases: Improve test dependency information
...
-    @classmethod
-    def setUpClass(cls):
-        if cls.tc.td['PACKAGE_CLASSES'].split()[0] != 'package_rpm':
-            cls.skipTest('Tests require image to be build from rpm')

Alex


On Thu, 13 Feb 2020 at 08:53, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> World builds also enable apt and dpkg, but there is no problem with that
> for you? There is no consistency here; if you want to start excluding
> things from world based on what packaging is enabled, you need to treat all
> options equally, including deb and ipk.
>
> The original problem was that libsolv pulls in the full set of rpm
> executables and libraries, which erroneously triggers the rpm test on
> target. We can solve this by making libsolv pull in only the rpm libraries
> and not executables, so that rpm test will be skipped. Or maybe even make
> the test itself check whether rpm is the packaging format and skip
> otherwise.
>
> Alex
>
> On Thu 13. Feb 2020 at 7.01, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Wed, Feb 12, 2020 at 8:49 PM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > But you do not need to fix or touch dnf at all. You only need to adjust
>> rpm packaging and split it in two parts instead of bundling everything into
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
>> libraries, and avoid the need to blacklist and tweak recipes based on what
>> PACKAGE_CLASSES is set to altogether. That setting should not leak into
>> recipes, and should only matter from do_package onwards. Can you look into
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
>> >> >> @@ -84,3 +84,5 @@ SYSTEMD_SERVICE_${PN} = "dnf-makecache.service
>> dnf-makecache.timer \
>> >> >>                           dnf-automatic-notifyonly.service
>> dnf-automatic-notifyonly.timer \
>> >> >>  "
>> >> >>  SYSTEMD_AUTO_ENABLE ?= "disable"
>> >> >> +
>> >> >> +PNBLACKLIST[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES',
>> 'package_rpm', '', 'does not build correctly without package_rpm in
>> PACKAGE_CLASSES', d)}"
>> >> >> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>> b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>> >> >> index 882c435b32..49afa04812 100644
>> >> >> --- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>> >> >> +++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
>> >> >> @@ -26,4 +26,5 @@ EXTRA_OECMAKE_append_class-native = "
>> -DWITH_GIR=OFF"
>> >> >>  EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_GIR=OFF"
>> >> >>
>> >> >>  BBCLASSEXTEND = "native nativesdk"
>> >> >> +PNBLACKLIST[libdnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES',
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

--00000000000079468b059e70c0d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I took a look at meta/lib/oeqa/runtime/cases/rpm.py.<=
/div><div><br></div><div>All tests depend on test_rpm_query, which should b=
e skipped if rpm is not used for packaging:</div><div><br></div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.target.run(&#39;ls /var/lib/r=
pm/&#39;)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 if status !=3D 0:<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;No /var/lib/rpm on target&#=
39;)</div><div><br></div><div>Can you please check, how the tests fails for=
 you exactly, and why /var/lib/rpm exists (and what is the content of it)?<=
/div><div><br></div><div>The test used to have the check I am talking about=
, but it was removed by <br></div><div><br></div><div>commit 633bd85270922d=
71ab4b1f94cd166da51fbe1458<br>Author: Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt;<br>Date: =C2=A0 Thu Nov 8 19:55:17 2018 +0000<br><br>=C2=A0 =C2=A0 oeqa=
/runtime/cases: Improve test dependency information</div><div>...<br></div>=
<div>- =C2=A0 =C2=A0@classmethod<br>- =C2=A0 =C2=A0def setUpClass(cls):<br>=
- =C2=A0 =C2=A0 =C2=A0 =C2=A0if <a href=3D"http://cls.tc.td">cls.tc.td</a>[=
&#39;PACKAGE_CLASSES&#39;].split()[0] !=3D &#39;package_rpm&#39;:<br>- =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cls.skipTest(&#39;Tests require image=
 to be build from rpm&#39;)<br></div><div><br></div><div>Alex<br></div><div=
><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Thu, 13 Feb 2020 at 08:53, Alexander Kanavin &lt;<a href=3D"m=
ailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div dir=3D"auto">=
World builds also enable apt and dpkg, but there is no problem with that fo=
r you? There is no consistency here; if you want to start excluding things =
from world based on what packaging is enabled, you need to treat all option=
s equally, including deb and ipk.</div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">The original problem was that libsolv pulls in the full set=
 of rpm executables and libraries, which erroneously triggers the rpm test =
on target. We can solve this by making libsolv pull in only the rpm librari=
es and not executables, so that rpm test will be skipped. Or maybe even mak=
e the test itself check whether rpm is the packaging format and skip otherw=
ise.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu 13.=
 Feb 2020 at 7.01, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targe=
t=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Wed, Feb 12, 2020 at 8:49 PM Alexander =
Kanavin<br>
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
</blockquote></div>

--00000000000079468b059e70c0d9--
