Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id EBAEE7C274
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 04:25:50 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id i10so1380066iol.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 21:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8rcaDF6C0Jbagnd4TU7TggFmXO8GL6ALQL6sFqA+hJU=;
	b=Ij1LpuVY8tlp1bM8BjODyBh0fEYv5HuEKfiR8wejF2DykgozakpDkU3vLc11vIqQtX
	qXMPkGgKatPZIYvX8cU7j3HZ/dAnV/08QY8vdKnWX9fT7abb4Mq5hddty7gnGQHRpqNU
	szrXGTUVYHnixL7wcx81AFzHXpfLVKV9D4Zv+wxyJRZtJEfOsvZSdwU4nlG5GUrBe0VD
	x8ifQR/AInbFOe09WnOgnFQ5ZTt8SKPtBRmxhE8d81ExYXvJhn0Z7YHbYh8XPZ36cBKl
	8BTffihrxN4Lzt64s6+5/0sXX1ipk3Uj96m6fe071HzVs2WGzKH8CRtJXDZVd0HV7EFI
	yqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8rcaDF6C0Jbagnd4TU7TggFmXO8GL6ALQL6sFqA+hJU=;
	b=bpvTkeDg2UCYsSWaypoqhK/vlE3PrzcAUSg2hdPyCf2EI6pumsFBbmGtlyWi6GSW5j
	QVHVsP7bjyYk4Cni9L2wWSEbYEA+/0ueTweL8VMnlGfRvrydjgKe+Dt/XBDv46EfOb2S
	kfIU14Mf8sjKxeacN63rjjqdrDxWPxTOGyJoUgAgYjJDVtQHPjsAjTIZXMiw4JGTEQSo
	cuyuJQPVAxgJGeFIntQkbM41qan/M/YLU0L0kNuBhgydEQeccp2YyVvdNH/FbmhjgySL
	15BJAm5hnNCf3amJPsEbqAo1I55D8or28qfg1nRvWiYCi1CedV7+mtS5w/lTrf4mwXEM
	FwzQ==
X-Gm-Message-State: APjAAAWzVWY++HrYOWZaeUy7+05CgA3d5Qh8qMecEVe7Zn50hbQCcebE
	NLBUd7/ZZbF04pGAWMGg/2xGVsrJTxVuWmP22CM=
X-Google-Smtp-Source: APXvYqxtq4Lt8ektS1hBAqSI++LW7n5xqP2jBRflIpS6mvU/s3yRbnb7qbHDIRMH1cha+19g9y3oKEv/NFm6UswAZ/s=
X-Received: by 2002:a02:54c1:: with SMTP id t184mr7632266jaa.10.1561436751663; 
	Mon, 24 Jun 2019 21:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <1561368577-265361-1-git-send-email-changqing.li@windriver.com>
	<CAJTo0LZJUL7Qk8EUV0jSneyH3BAZCrTz_YqS8dwNrPBsxF6NAA@mail.gmail.com>
	<0a3609e6-1570-4d6e-f50a-c1f49143b00d@windriver.com>
In-Reply-To: <0a3609e6-1570-4d6e-f50a-c1f49143b00d@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 24 Jun 2019 21:25:40 -0700
Message-ID: <CANx9H-DXE5Q=VL4Kz9AG12QNCGzPGSnvMySM9ct2=yC3Z0fbAw@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scons: fix conflict during do_rootfs
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
X-List-Received-Date: Tue, 25 Jun 2019 04:25:51 -0000
Content-Type: multipart/alternative; boundary="000000000000ec542a058c1e52d2"

--000000000000ec542a058c1e52d2
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 24, 2019 at 6:26 PM Changqing Li <changqing.li@windriver.com>
wrote:

>
> On 6/24/19 5:43 PM, Burton, Ross wrote:
> > Is this actually needed?  Can we just delete python-scons?
> >
> > Ross
>
> I checked under meta-openembeded and oe-core, no one depend on
> python-scons.
>
> If no one has objections,  since python2 will  retire in 2020, I  will
> delete python-scons and python-scons-native.
>
> Also add the maintainer into the to list.
>
>
Please see this thread:
http://lists.openembedded.org/pipermail/openembedded-core/2019-June/283891.html


at least MongoDB currently depends on python(2)-scons to build. Adrian also
mentioned gpsd.


> .
> >
> > On Mon, 24 Jun 2019 at 10:33, <changqing.li@windriver.com> wrote:
> >> From: Changqing Li <changqing.li@windriver.com>
> >>
> >> fix below error:
> >> file /usr/bin/scons conflicts between attempted installs of
> python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> >> file /usr/bin/scons-3.0.5 conflicts between attempted installs of
> python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> >> file /usr/bin/scons-configure-cache conflicts between attempted
> installs of python-scons-3.0.5-r0.core2_32 and
> python3-scons-3.0.5-r0.core2_32
> >> file /usr/bin/scons-configure-cache-3.0.5 conflicts between attempted
> installs of python-scons-3.0.5-r0.core2_32 and
> python3-scons-3.0.5-r0.core2_32
> >> file /usr/bin/scons-time conflicts between attempted installs of
> python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> >> file /usr/bin/scons-time-3.0.5 conflicts between attempted installs of
> python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> >> file /usr/bin/sconsign conflicts between attempted installs of
> python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> >> file /usr/bin/sconsign-3.0.5 conflicts between attempted installs of
> python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32
> >>
> >> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >> ---
> >>   meta/recipes-devtools/python/python-scons_3.0.5.bb  | 14
> +++++++++++++-
> >>   meta/recipes-devtools/python/python3-scons_3.0.5.bb | 14
> +++++++++++++-
> >>   2 files changed, 26 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/recipes-devtools/python/python-scons_3.0.5.bb
> b/meta/recipes-devtools/python/python-scons_3.0.5.bb
> >> index 939c15b..94c2d07 100644
> >> --- a/meta/recipes-devtools/python/python-scons_3.0.5.bb
> >> +++ b/meta/recipes-devtools/python/python-scons_3.0.5.bb
> >> @@ -12,7 +12,7 @@ S = "${WORKDIR}/scons-${PV}"
> >>   UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
> >>   UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
> >>
> >> -inherit setuptools
> >> +inherit setuptools update-alternatives
> >>
> >>   RDEPENDS_${PN} = "\
> >>     python-fcntl \
> >> @@ -22,3 +22,15 @@ RDEPENDS_${PN} = "\
> >>     python-shell \
> >>     python-pprint \
> >>     "
> >> +
> >> +ALTERNATIVE_${PN} = "scons scons-3.0.5 scons-configure-cache
> scons-configure-cache-3.0.5 scons-time scons-time-3.0.5 sconsign
> sconsign-3.0.5"
> >> +ALTERNATIVE_TARGET[scons] = "${bindir}/scons"
> >> +ALTERNATIVE_TARGET[scons-3.0.5] = "${bindir}/scons-3.0.5"
> >> +ALTERNATIVE_TARGET[scons-configure-cache] =
> "${bindir}/scons-configure-cache"
> >> +ALTERNATIVE_TARGET[scons-configure-cache-3.0.5] =
> "${bindir}/scons-configure-cache-3.0.5"
> >> +ALTERNATIVE_TARGET[scons-time] = "${bindir}/scons-time"
> >> +ALTERNATIVE_TARGET[scons-time-3.0.5] = "${bindir}/scons-time-3.0.5"
> >> +ALTERNATIVE_TARGET[sconsign] = "${bindir}/sconsign"
> >> +ALTERNATIVE_TARGET[sconsign-3.0.5] = "${bindir}/sconsign-3.0.5"
> >> +
> >> +ALTERNATIVE_PRIORITY = "20"
> >> diff --git a/meta/recipes-devtools/python/python3-scons_3.0.5.bb
> b/meta/recipes-devtools/python/python3-scons_3.0.5.bb
> >> index 7fb75a6..6e240d8 100644
> >> --- a/meta/recipes-devtools/python/python3-scons_3.0.5.bb
> >> +++ b/meta/recipes-devtools/python/python3-scons_3.0.5.bb
> >> @@ -12,7 +12,7 @@ S = "${WORKDIR}/scons-${PV}"
> >>   UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
> >>   UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
> >>
> >> -inherit setuptools3
> >> +inherit setuptools3 update-alternatives
> >>
> >>   do_install_prepend() {
> >>       sed -i -e "1s,#!.*python.*,#!${USRBINPATH}/env python3,"
> ${S}/script/*
> >> @@ -27,3 +27,15 @@ RDEPENDS_${PN} = "\
> >>     python3-pickle \
> >>     python3-pprint \
> >>     "
> >> +
> >> +ALTERNATIVE_${PN} = "scons scons-3.0.5 scons-configure-cache
> scons-configure-cache-3.0.5 scons-time scons-time-3.0.5 sconsign
> sconsign-3.0.5"
> >> +ALTERNATIVE_TARGET[scons] = "${bindir}/scons"
> >> +ALTERNATIVE_TARGET[scons-3.0.5] = "${bindir}/scons-3.0.5"
> >> +ALTERNATIVE_TARGET[scons-configure-cache] =
> "${bindir}/scons-configure-cache"
> >> +ALTERNATIVE_TARGET[scons-configure-cache-3.0.5] =
> "${bindir}/scons-configure-cache-3.0.5"
> >> +ALTERNATIVE_TARGET[scons-time] = "${bindir}/scons-time"
> >> +ALTERNATIVE_TARGET[scons-time-3.0.5] = "${bindir}/scons-time-3.0.5"
> >> +ALTERNATIVE_TARGET[sconsign] = "${bindir}/sconsign"
> >> +ALTERNATIVE_TARGET[sconsign-3.0.5] = "${bindir}/sconsign-3.0.5"
> >> +
> >> +ALTERNATIVE_PRIORITY = "30"
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> BRs
>
> Sandy(Li Changqing)
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000ec542a058c1e52d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jun 24, 2019 at 6:26 PM Changqing Li &lt;<a href=3D=
"mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><br>
On 6/24/19 5:43 PM, Burton, Ross wrote:<br>
&gt; Is this actually needed?=C2=A0 Can we just delete python-scons?<br>
&gt;<br>
&gt; Ross<br>
<br>
I checked under meta-openembeded and oe-core, no one depend on <br>
python-scons.<br>
<br>
If no one has objections,=C2=A0 since python2 will=C2=A0 retire in 2020, I=
=C2=A0 will <br>
delete python-scons and python-scons-native.<br>
<br>
Also add the maintainer into the to list.<br>
<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Please see this =
thread:=C2=A0</div><div dir=3D"auto"><div><a href=3D"http://lists.openembed=
ded.org/pipermail/openembedded-core/2019-June/283891.html">http://lists.ope=
nembedded.org/pipermail/openembedded-core/2019-June/283891.html</a></div><b=
r></div><div dir=3D"auto"><br></div><div dir=3D"auto">at least MongoDB curr=
ently depends on python(2)-scons to build. Adrian also mentioned gpsd.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">&gt; .<br>
&gt;<br>
&gt; On Mon, 24 Jun 2019 at 10:33, &lt;<a href=3D"mailto:changqing.li@windr=
iver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt; wrote:<br>
&gt;&gt; From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; fix below error:<br>
&gt;&gt; file /usr/bin/scons conflicts between attempted installs of python=
-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32<br>
&gt;&gt; file /usr/bin/scons-3.0.5 conflicts between attempted installs of =
python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32<br>
&gt;&gt; file /usr/bin/scons-configure-cache conflicts between attempted in=
stalls of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_3=
2<br>
&gt;&gt; file /usr/bin/scons-configure-cache-3.0.5 conflicts between attemp=
ted installs of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.c=
ore2_32<br>
&gt;&gt; file /usr/bin/scons-time conflicts between attempted installs of p=
ython-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32<br>
&gt;&gt; file /usr/bin/scons-time-3.0.5 conflicts between attempted install=
s of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32<br>
&gt;&gt; file /usr/bin/sconsign conflicts between attempted installs of pyt=
hon-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32<br>
&gt;&gt; file /usr/bin/sconsign-3.0.5 conflicts between attempted installs =
of python-scons-3.0.5-r0.core2_32 and python3-scons-3.0.5-r0.core2_32<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@win=
driver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta/recipes-devtools/python/<a href=3D"http://python-=
scons_3.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python-scons_3.0.5.bb<=
/a>=C2=A0 | 14 +++++++++++++-<br>
&gt;&gt;=C2=A0 =C2=A0meta/recipes-devtools/python/<a href=3D"http://python3=
-scons_3.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons_3.0.5.b=
b</a> | 14 +++++++++++++-<br>
&gt;&gt;=C2=A0 =C2=A02 files changed, 26 insertions(+), 2 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python=
-scons_3.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python-scons_3.0.5.bb=
</a> b/meta/recipes-devtools/python/<a href=3D"http://python-scons_3.0.5.bb=
" rel=3D"noreferrer" target=3D"_blank">python-scons_3.0.5.bb</a><br>
&gt;&gt; index 939c15b..94c2d07 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python-scons_=
3.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python-scons_3.0.5.bb</a><br=
>
&gt;&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python-scons_=
3.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python-scons_3.0.5.bb</a><br=
>
&gt;&gt; @@ -12,7 +12,7 @@ S =3D &quot;${WORKDIR}/scons-${PV}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://scons.o=
rg/pages/download.html" rel=3D"noreferrer" target=3D"_blank">http://scons.o=
rg/pages/download.html</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d=
+)+)\.tar&quot;<br>
&gt;&gt;<br>
&gt;&gt; -inherit setuptools<br>
&gt;&gt; +inherit setuptools update-alternatives<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0RDEPENDS_${PN} =3D &quot;\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0python-fcntl \<br>
&gt;&gt; @@ -22,3 +22,15 @@ RDEPENDS_${PN} =3D &quot;\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0python-shell \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0python-pprint \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +ALTERNATIVE_${PN} =3D &quot;scons scons-3.0.5 scons-configure-cac=
he scons-configure-cache-3.0.5 scons-time scons-time-3.0.5 sconsign sconsig=
n-3.0.5&quot;<br>
&gt;&gt; +ALTERNATIVE_TARGET[scons] =3D &quot;${bindir}/scons&quot;<br>
&gt;&gt; +ALTERNATIVE_TARGET[scons-3.0.5] =3D &quot;${bindir}/scons-3.0.5&q=
uot;<br>
&gt;&gt; +ALTERNATIVE_TARGET[scons-configure-cache] =3D &quot;${bindir}/sco=
ns-configure-cache&quot;<br>
&gt;&gt; +ALTERNATIVE_TARGET[scons-configure-cache-3.0.5] =3D &quot;${bindi=
r}/scons-configure-cache-3.0.5&quot;<br>
&gt;&gt; +ALTERNATIVE_TARGET[scons-time] =3D &quot;${bindir}/scons-time&quo=
t;<br>
&gt;&gt; +ALTERNATIVE_TARGET[scons-time-3.0.5] =3D &quot;${bindir}/scons-ti=
me-3.0.5&quot;<br>
&gt;&gt; +ALTERNATIVE_TARGET[sconsign] =3D &quot;${bindir}/sconsign&quot;<b=
r>
&gt;&gt; +ALTERNATIVE_TARGET[sconsign-3.0.5] =3D &quot;${bindir}/sconsign-3=
.0.5&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +ALTERNATIVE_PRIORITY =3D &quot;20&quot;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python=
3-scons_3.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons_3.0.5.=
bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-scons_3.0.5=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons_3.0.5.bb</a><br>
&gt;&gt; index 7fb75a6..6e240d8 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-scons=
_3.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons_3.0.5.bb</a><=
br>
&gt;&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-scons=
_3.0.5.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons_3.0.5.bb</a><=
br>
&gt;&gt; @@ -12,7 +12,7 @@ S =3D &quot;${WORKDIR}/scons-${PV}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://scons.o=
rg/pages/download.html" rel=3D"noreferrer" target=3D"_blank">http://scons.o=
rg/pages/download.html</a>&quot;<br>
&gt;&gt;=C2=A0 =C2=A0UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d=
+)+)\.tar&quot;<br>
&gt;&gt;<br>
&gt;&gt; -inherit setuptools3<br>
&gt;&gt; +inherit setuptools3 update-alternatives<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0do_install_prepend() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &quot;1s,#!.*python.*,#!${USRB=
INPATH}/env python3,&quot; ${S}/script/*<br>
&gt;&gt; @@ -27,3 +27,15 @@ RDEPENDS_${PN} =3D &quot;\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0python3-pickle \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0python3-pprint \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +ALTERNATIVE_${PN} =3D &quot;scons scons-3.0.5 scons-configure-cac=
he scons-configure-cache-3.0.5 scons-time scons-time-3.0.5 sconsign sconsig=
n-3.0.5&quot;<br>
&gt;&gt; +ALTERNATIVE_TARGET[scons] =3D &quot;${bindir}/scons&quot;<br>
&gt;&gt; +ALTERNATIVE_TARGET[scons-3.0.5] =3D &quot;${bindir}/scons-3.0.5&q=
uot;<br>
&gt;&gt; +ALTERNATIVE_TARGET[scons-configure-cache] =3D &quot;${bindir}/sco=
ns-configure-cache&quot;<br>
&gt;&gt; +ALTERNATIVE_TARGET[scons-configure-cache-3.0.5] =3D &quot;${bindi=
r}/scons-configure-cache-3.0.5&quot;<br>
&gt;&gt; +ALTERNATIVE_TARGET[scons-time] =3D &quot;${bindir}/scons-time&quo=
t;<br>
&gt;&gt; +ALTERNATIVE_TARGET[scons-time-3.0.5] =3D &quot;${bindir}/scons-ti=
me-3.0.5&quot;<br>
&gt;&gt; +ALTERNATIVE_TARGET[sconsign] =3D &quot;${bindir}/sconsign&quot;<b=
r>
&gt;&gt; +ALTERNATIVE_TARGET[sconsign-3.0.5] =3D &quot;${bindir}/sconsign-3=
.0.5&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +ALTERNATIVE_PRIORITY =3D &quot;30&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.7.4<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
<br>
-- <br>
BRs<br>
<br>
Sandy(Li Changqing)<br>
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

--000000000000ec542a058c1e52d2--
