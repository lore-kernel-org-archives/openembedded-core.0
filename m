Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E639AC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 18:47:29 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.385.1646851648715841425
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 10:47:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NpCgNqUq;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: ticotimo@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so3994229wms.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 10:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cDPssv8MbFEEP9b20V9hqyRlWMJb9yTZHeKWsbeW1VQ=;
        b=NpCgNqUqdmf7NsbwTHAh9XU/3gILm151pyccJYOTP4XKlaREf/9dcueW9t7ItX7DVL
         pmUmd127VXkSDae4kp61qqd5yKTq4sBFBxrJnmla5XBBWYeWFs+aRTdfueDWXzIbUtBV
         Po4mAbAfKro4zlZOFNIHBC9csC6WAbSd0w7UR4JhSOXH+u4czVNjv7n1hpXIZvAegw+U
         YnEG/KpYpWOupbiR+5tqLHzO8Kzyk5qZwLoZ3boBwNG7nAXEFMNtCp2Um0BmHM2hBWI/
         OfgB8U3+3fsQCqfbAfWteUz7M3QjPSwyAHcFSgjjerzibg/ZM0MtKj5LbOwX9lPfOL4v
         s6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cDPssv8MbFEEP9b20V9hqyRlWMJb9yTZHeKWsbeW1VQ=;
        b=TguNzaT2nltnXbg2Bnwj7Fm7vfpVwz98M2EMDAej/bjzvcPGhhtk25ZoHHeN/Mdzb2
         sDIHMxO0iOboIGnCxiOVLbPbKF80JjmITovkCzPJcFC9RN5cZy+XUNWdBmdoNhyUF1L3
         Imb1vIsVGQdWq0Of6CrZ2X2M3GSlpX0KtEGW7M/uOIolghuAqbMwYw0a/FbPq1qwVvzg
         C4CqyQ08l/0vvv5JDZm0/AHvhRs9f38NtmhqI4P1ThPzdfRlzLxBee19RRW7Nc4maeW9
         Ec/HhmZ5rGgYmUCzQtsN+E+14JfBcy1s9+DSDO6/q7wjBGC9XVAs3pLtS4Q6JB6TFwAk
         N/Dw==
X-Gm-Message-State: AOAM531cw7QFNDGtRah9zgCzchB4Ck4NbGi6UZkPj3J0j1myP+MaA+bO
	5C8bVFl0b7CQc8wb1FZzMTfHs5I2ziA7Po5aC4s=
X-Google-Smtp-Source: 
 ABdhPJy6e97cAkOQxDiptEs3ej1Do44+3msyFD7NJB96yNjwHOPZM8OZdd2R3DEA+vbHdeJdpIARj6bjgRZcbom945M=
X-Received: by 2002:a1c:540a:0:b0:382:aa24:dfc2 with SMTP id
 i10-20020a1c540a000000b00382aa24dfc2mr9009589wmb.42.1646851646997; Wed, 09
 Mar 2022 10:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20220309165113.2757010-1-ross.burton@arm.com>
 <CAMKF1spVGtp8pcZHwcmQ=XV536Y5aJyVyO9YrtmN_s20_tqRZA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spVGtp8pcZHwcmQ=XV536Y5aJyVyO9YrtmN_s20_tqRZA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 9 Mar 2022 10:47:16 -0800
Message-ID: 
 <CANx9H-AyhTrVfQpZEX+rJghO2HuiwbaqX_2ax=q0rt1TQebPAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] pip_install_wheel: install wheel with a glob
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Ross Burton <ross@burtonini.com>
Content-Type: multipart/alternative; boundary="0000000000006ac7db05d9cd87a1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 18:47:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162989

--0000000000006ac7db05d9cd87a1
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 9, 2022 at 9:14 AM Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Mar 9, 2022 at 8:51 AM Ross Burton <ross@burtonini.com> wrote:
> >
> > Now that the build systems that use pip_install_wheel are all building
> > their wheel into a directory that we knew was empty before, we can just
> > install *.whl and not need to know the precise names.
> >
> > By design a pyproject.toml will always build a single wheel, so there
> > shouldn't be any way for this to end up installing more than expected.
> >
> > This obsoletes PIP_INSTALL_PACKAGE and PYPA_WHEEL, neither of which are
> > needed anymore.
> >
>
> this looks a better approach, we can unbold ton of workaround on
> meta-openembedded with this


Agreed. The second set of eyes on this is improving things dramatically.


>
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/classes/pip_install_wheel.bbclass | 20 ++++++++------------
> >  1 file changed, 8 insertions(+), 12 deletions(-)
> >
> > diff --git a/meta/classes/pip_install_wheel.bbclass
> b/meta/classes/pip_install_wheel.bbclass
> > index 954a6b750f..3861dae75a 100644
> > --- a/meta/classes/pip_install_wheel.bbclass
> > +++ b/meta/classes/pip_install_wheel.bbclass
> > @@ -1,20 +1,10 @@
> >  DEPENDS:append = " python3-pip-native"
> >
> > -def guess_pip_install_package_name(d):
> > -    import re
> > -    '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'
> ''
> > -    name = d.getVar('PYPI_PACKAGE') or re.sub(r"^python3-", "",
> d.getVar('BPN'))
> > -    return name.replace('-', '_')
> > -
> > -PIP_INSTALL_PACKAGE ?= "${@guess_pip_install_package_name(d)}"
> > -
> >  # The directory where wheels should be written too. Build classes
> >  # will ideally [cleandirs] this but we don't do that here in case
> >  # a recipe wants to install prebuilt wheels.
> >  PIP_INSTALL_DIST_PATH ?= "${WORKDIR}/dist"
> >
> > -PYPA_WHEEL ??= "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-*-*.whl"
> > -
> >  PIP_INSTALL_ARGS = "\
> >      -vvvv \
> >      --ignore-installed \
> > @@ -29,8 +19,14 @@ PIP_INSTALL_PYTHON = "python3"
> >  PIP_INSTALL_PYTHON:class-native = "nativepython3"
> >
> >  pip_install_wheel_do_install () {
> > -    nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PYPA_WHEEL} ||
> > -      bbfatal_log "Failed to pip install wheel. Check the logs."
> > +    COUNT=$(find ${PIP_INSTALL_DIST_PATH} -name '*.whl' | wc -l)
> > +    if test $COUNT -eq 0; then
> > +        bbfatal No wheels found in ${PIP_INSTALL_DIST_PATH}
> > +    elif test $COUNT -gt 1; then
> > +        bbfatal More than one wheel found in ${PIP_INSTALL_DIST_PATH},
> this should not happen
> > +    fi
> > +
> > +    nativepython3 -m pip install ${PIP_INSTALL_ARGS}
> ${PIP_INSTALL_DIST_PATH}/*.whl
> >
> >      cd ${D}
> >      for i in ${D}${bindir}/* ${D}${sbindir}/*; do
> > --
> > 2.25.1
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162981):
> https://lists.openembedded.org/g/openembedded-core/message/162981
> Mute This Topic: https://lists.openembedded.org/mt/89666433/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000006ac7db05d9cd87a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Mar 9, 2022 at 9:14 AM Khem Raj &lt;<a href=3D"mail=
to:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">On Wed, Mar 9, 2022 at 8:51 AM Ross Burton &lt;<a hre=
f=3D"mailto:ross@burtonini.com" target=3D"_blank">ross@burtonini.com</a>&gt=
; wrote:<br>
&gt;<br>
&gt; Now that the build systems that use pip_install_wheel are all building=
<br>
&gt; their wheel into a directory that we knew was empty before, we can jus=
t<br>
&gt; install *.whl and not need to know the precise names.<br>
&gt;<br>
&gt; By design a pyproject.toml will always build a single wheel, so there<=
br>
&gt; shouldn&#39;t be any way for this to end up installing more than expec=
ted.<br>
&gt;<br>
&gt; This obsoletes PIP_INSTALL_PACKAGE and PYPA_WHEEL, neither of which ar=
e<br>
&gt; needed anymore.<br>
&gt;<br>
<br>
this looks a better approach, we can unbold ton of workaround on<br>
meta-openembedded with this</blockquote><div dir=3D"auto"><br></div><div di=
r=3D"auto">Agreed. The second set of eyes on this is improving things drama=
tically.</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" di=
r=3D"auto"><br>
<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" =
target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/pip_install_wheel.bbclass | 20 ++++++++------------=
<br>
&gt;=C2=A0 1 file changed, 8 insertions(+), 12 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip=
_install_wheel.bbclass<br>
&gt; index 954a6b750f..3861dae75a 100644<br>
&gt; --- a/meta/classes/pip_install_wheel.bbclass<br>
&gt; +++ b/meta/classes/pip_install_wheel.bbclass<br>
&gt; @@ -1,20 +1,10 @@<br>
&gt;=C2=A0 DEPENDS:append =3D &quot; python3-pip-native&quot;<br>
&gt;<br>
&gt; -def guess_pip_install_package_name(d):<br>
&gt; -=C2=A0 =C2=A0 import re<br>
&gt; -=C2=A0 =C2=A0 &#39;&#39;&#39;<a href=3D"https://www.python.org/dev/pe=
ps/pep-0491/#escaping-and-unicode&#39;" rel=3D"noreferrer" target=3D"_blank=
">https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode&#39;</a>&#=
39;&#39;<br>
&gt; -=C2=A0 =C2=A0 name =3D d.getVar(&#39;PYPI_PACKAGE&#39;) or re.sub(r&q=
uot;^python3-&quot;, &quot;&quot;, d.getVar(&#39;BPN&#39;))<br>
&gt; -=C2=A0 =C2=A0 return name.replace(&#39;-&#39;, &#39;_&#39;)<br>
&gt; -<br>
&gt; -PIP_INSTALL_PACKAGE ?=3D &quot;${@guess_pip_install_package_name(d)}&=
quot;<br>
&gt; -<br>
&gt;=C2=A0 # The directory where wheels should be written too. Build classe=
s<br>
&gt;=C2=A0 # will ideally [cleandirs] this but we don&#39;t do that here in=
 case<br>
&gt;=C2=A0 # a recipe wants to install prebuilt wheels.<br>
&gt;=C2=A0 PIP_INSTALL_DIST_PATH ?=3D &quot;${WORKDIR}/dist&quot;<br>
&gt;<br>
&gt; -PYPA_WHEEL ??=3D &quot;${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE=
}-*-*.whl&quot;<br>
&gt; -<br>
&gt;=C2=A0 PIP_INSTALL_ARGS =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -vvvv \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 --ignore-installed \<br>
&gt; @@ -29,8 +19,14 @@ PIP_INSTALL_PYTHON =3D &quot;python3&quot;<br>
&gt;=C2=A0 PIP_INSTALL_PYTHON:class-native =3D &quot;nativepython3&quot;<br=
>
&gt;<br>
&gt;=C2=A0 pip_install_wheel_do_install () {<br>
&gt; -=C2=A0 =C2=A0 nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PYPA=
_WHEEL} ||<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 bbfatal_log &quot;Failed to pip install wheel. C=
heck the logs.&quot;<br>
&gt; +=C2=A0 =C2=A0 COUNT=3D$(find ${PIP_INSTALL_DIST_PATH} -name &#39;*.wh=
l&#39; | wc -l)<br>
&gt; +=C2=A0 =C2=A0 if test $COUNT -eq 0; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal No wheels found in ${PIP_INSTALL_=
DIST_PATH}<br>
&gt; +=C2=A0 =C2=A0 elif test $COUNT -gt 1; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal More than one wheel found in ${PI=
P_INSTALL_DIST_PATH}, this should not happen<br>
&gt; +=C2=A0 =C2=A0 fi<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PIP_=
INSTALL_DIST_PATH}/*.whl<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cd ${D}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for i in ${D}${bindir}/* ${D}${sbindir}/*; do<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#162981): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/162981" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/162981</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89666433/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89666433/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000006ac7db05d9cd87a1--

