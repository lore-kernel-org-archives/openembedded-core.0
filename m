Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B263E77197
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 00:15:57 +0000 (UTC)
Received: from m43-12.mailgun.net (m43-12.mailgun.net [69.72.43.12])
 by mx.groups.io with SMTP id smtpd.web11.7700.1736295354444926724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 16:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@asterius.io header.s=mailo header.b=WA3SNO7n;
 spf=pass (domain: asterius.io, ip: 69.72.43.12, mailfrom: bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt; s=mailo; t=1736295353; x=1736302553;
 h=Content-Type: Cc: To: To: Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References: MIME-Version: Sender: Sender;
 bh=6e6qXhe/lPVhLi9Yondc4MDdiAjPcjviIVXsgnT/M8w=;
 b=WA3SNO7nABZLysfA6uf4tMfjmT93doNWdb4/+PH3bG0WsrpbNmLMHRmGinZpwqHtH7OttML7KSS8Lg6hwuUVTatvzpS9ESJzXG4EQIX3IgjibYAWVRleRs71pfYS9FifdYbL0nAPXoNJnLnbxGetE/5uhrR7eFuLV+IE/SR4dHU=
X-Mailgun-Sending-Ip: 69.72.43.12
X-Mailgun-Sending-Ip-Pool-Name: 
X-Mailgun-Sending-Ip-Pool: 
X-Mailgun-Sid: WyJiMTQwMSIsIm9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmciLCIzYTU2ODUiXQ==
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53]) by
 627e50130b53 with SMTP id 677dc3b947629dd9947a8e54 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Wed, 08 Jan 2025 00:15:53 GMT
Sender: derek@asterius.io
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3f28a4fccso25668828a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 16:15:53 -0800 (PST)
X-Gm-Message-State: AOJu0YyC9hHkWlwJ+EGJ1YJSUtYSvBZTgPFPlfnVQMFYwLe56NIDWdDE
	SJOJTRSt+VFwLqX3cXZ2jFaQ0M5SZpSi4pkeRZE8jxEFNISxDyGqbDuoBeueiamLupitQLloT++
	3POSXXV3YhieWMS4tW+JIAoTkis4=
X-Google-Smtp-Source: AGHT+IFg87thv8y2D0mUD8+5GRfb56TQJ77qC4rjxyFpw31YR13UXN2mQSS6ZgwDz3BMhtSEHitY/7VWYqVwsxvGQKQ=
X-Received: by 2002:a17:907:9622:b0:aa6:af66:7c89 with SMTP id
 a640c23a62f3a-ab2ab670587mr58078566b.5.1736295352558; Tue, 07 Jan 2025
 16:15:52 -0800 (PST)
MIME-Version: 1.0
References: <20250107203009.3251029-1-derek@asterius.io> <5f83f87b91961f4c1ba449029b4f904f288c3a6c.camel@linuxfoundation.org>
In-Reply-To: <5f83f87b91961f4c1ba449029b4f904f288c3a6c.camel@linuxfoundation.org>
From: Derek Straka <derek@asterius.io>
Date: Tue, 7 Jan 2025 18:15:41 -0600
X-Gmail-Original-Message-ID: <CADNbA1ojY=For_swJjC5SFRY3uRyayx2JAwNz=uBJ4GD=nhNyw@mail.gmail.com>
X-Gm-Features: AbW1kva-baK_Eb3Xr1vkkURSGT9Env6CbVykxpKhsItwbsWmU6sG-hjjhjxZ8bc
Message-ID: <CADNbA1ojY=For_swJjC5SFRY3uRyayx2JAwNz=uBJ4GD=nhNyw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/ptest-python-pytest: simplify python
 ptest file overriding
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b6f267062b26c357"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209507

--000000000000b6f267062b26c357
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review!  Yes, I shouldn't make an assumption about the
execute bit.  I will send a v2 with that and an update to look at S
or UNPACKDIR as the key to create the default run-ptest in the morning.

On Tue, Jan 7, 2025 at 4:35=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2025-01-07 at 20:30 +0000, Derek Straka via lists.openembedded.or=
g
> wrote:
> > The complexity of overriding files from the bbclass made the behavior a=
t
> > times hard to follow. This change replaces the default file with a
> > heredoc equivalent that creates a default file if the user does not
> provide their
> > own version of run-ptest.
> >
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >  meta/classes-recipe/ptest-python-pytest.bbclass | 12 +++++-------
> >  meta/files/ptest-python-pytest/run-ptest        |  3 ---
> >  2 files changed, 5 insertions(+), 10 deletions(-)
> >  delete mode 100755 meta/files/ptest-python-pytest/run-ptest
> >
> > diff --git a/meta/classes-recipe/ptest-python-pytest.bbclass
> b/meta/classes-recipe/ptest-python-pytest.bbclass
> > index 801079e6ab..7ed84584b7 100644
> > --- a/meta/classes-recipe/ptest-python-pytest.bbclass
> > +++ b/meta/classes-recipe/ptest-python-pytest.bbclass
> > @@ -6,19 +6,17 @@
> >
> >  inherit ptest
> >
> > -FILESEXTRAPATHS:prepend :=3D "${COREBASE}/meta/files:"
> > -
> > -SRC_URI:append =3D "\
> > -    file://ptest-python-pytest/run-ptest \
> > -"
> > -
> >  # Overridable configuration for the directory within the source tree
> >  # containing the pytest files
> >  PTEST_PYTEST_DIR ?=3D "tests"
> >
> >  do_install_ptest() {
> >       if [ ! -f ${D}${PTEST_PATH}/run-ptest ]; then
> > -             install -m 0755 ${UNPACKDIR}/ptest-python-pytest/run-ptes=
t
> ${D}${PTEST_PATH}
> > +             cat > ${D}${PTEST_PATH}/run-ptest << EOF
> > +#!/bin/sh
> > +pytest --automake
> > +EOF
> > +
>
> Do you need to set the exec bit on that file having created it?
>
> Cheers,
>
> Richard
>
>

--000000000000b6f267062b26c357
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the review!=C2=A0 Yes, I shouldn&#39;t make an =
assumption about the execute=C2=A0bit.=C2=A0 I will send a v2 with that and=
 an update to look at S or=C2=A0UNPACKDIR=C2=A0as the key to create the def=
ault run-ptest in the morning.</div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 7, 2025 at =
4:35=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2025-01-07 at 20:30=
 +0000, Derek Straka via <a href=3D"http://lists.openembedded.org" rel=3D"n=
oreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; The complexity of overriding files from the bbclass made the behavior =
at<br>
&gt; times hard to follow. This change replaces the default file with a<br>
&gt; heredoc equivalent that creates a default file if the user does not pr=
ovide their<br>
&gt; own version of run-ptest.<br>
&gt; <br>
&gt; Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" t=
arget=3D"_blank">derek@asterius.io</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes-recipe/ptest-python-pytest.bbclass | 12 +++++------=
-<br>
&gt; =C2=A0meta/files/ptest-python-pytest/run-ptest=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ---<br>
&gt; =C2=A02 files changed, 5 insertions(+), 10 deletions(-)<br>
&gt; =C2=A0delete mode 100755 meta/files/ptest-python-pytest/run-ptest<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/ptest-python-pytest.bbclass b/meta/cl=
asses-recipe/ptest-python-pytest.bbclass<br>
&gt; index 801079e6ab..7ed84584b7 100644<br>
&gt; --- a/meta/classes-recipe/ptest-python-pytest.bbclass<br>
&gt; +++ b/meta/classes-recipe/ptest-python-pytest.bbclass<br>
&gt; @@ -6,19 +6,17 @@<br>
&gt; =C2=A0<br>
&gt; =C2=A0inherit ptest<br>
&gt; =C2=A0<br>
&gt; -FILESEXTRAPATHS:prepend :=3D &quot;${COREBASE}/meta/files:&quot;<br>
&gt; -<br>
&gt; -SRC_URI:append =3D &quot;\<br>
&gt; -=C2=A0=C2=A0=C2=A0 file://ptest-python-pytest/run-ptest=C2=A0\<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; =C2=A0# Overridable configuration for the directory within the source =
tree<br>
&gt; =C2=A0# containing the pytest files<br>
&gt; =C2=A0PTEST_PYTEST_DIR ?=3D &quot;tests&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0do_install_ptest() {<br>
&gt; =C2=A0=C2=A0 =C2=A0 =C2=A0if [ ! -f ${D}${PTEST_PATH}/run-ptest ]; the=
n<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${UNP=
ACKDIR}/ptest-python-pytest/run-ptest ${D}${PTEST_PATH}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cat &gt; ${D}${PTEST_=
PATH}/run-ptest &lt;&lt; EOF<br>
&gt; +#!/bin/sh<br>
&gt; +pytest --automake<br>
&gt; +EOF<br>
&gt; +<br>
<br>
Do you need to set the exec bit on that file having created it?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--000000000000b6f267062b26c357--

