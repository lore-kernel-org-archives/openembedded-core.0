Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1145AE77187
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 18:05:07 +0000 (UTC)
Received: from so254-41.mailgun.net (so254-41.mailgun.net [198.61.254.41])
 by mx.groups.io with SMTP id smtpd.web10.111965.1734545103000186304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 10:05:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@asterius.io header.s=mailo header.b=eD2A5Ez+;
 spf=pass (domain: asterius.io, ip: 198.61.254.41, mailfrom: bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt; s=mailo; t=1734545102; x=1734552302;
 h=Content-Type: Cc: To: To: Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References: MIME-Version: Sender: Sender;
 bh=nKAFgtBWcFhFl8btzxSYGRbXkJamkDk3gIAnFIstwds=;
 b=eD2A5Ez+GvHXq8E9zh3LPOwbLEynKqOFwQpjCxfos/gjJb9MjrER2Bq0OscJPtJ4gbnUIf1Vp4Q/18otkla6UPV/i0uzQTjwRsvnKi6uktVIwiubZqG2gFmiPGzVd7y3LVcS0ogeAul5U0uU9iiivir6z3hg6koNDzpRPUEgjkQ=
X-Mailgun-Sending-Ip: 198.61.254.41
X-Mailgun-Sending-Ip-Pool-Name: 
X-Mailgun-Sending-Ip-Pool: 
X-Mailgun-Sid: WyJiMTQwMSIsIm9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmciLCIzYTU2ODUiXQ==
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42]) by
 7e4befaa6498 with SMTP id 67630ecd8d01bf1d14473cd6 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Wed, 18 Dec 2024 18:05:01 GMT
Sender: derek@asterius.io
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa6aee68a57so1001012166b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 10:05:01 -0800 (PST)
X-Gm-Message-State: AOJu0YxlKHa/9hFFXblYvzUAdvjyIjLpgOlP+qllPEqCsvOedgFyEmIK
	0n8GxHYeQqAyA2+hRMjtaSn4gC/iTU+H1hvO74EKeeTjLu4fp+GBE4d38RASnm/hx7pRzkK0K4B
	He5XH/B7GMHX7XawURhV+UKQCDfg=
X-Google-Smtp-Source: AGHT+IH+q656gmWxdQ5RdU6JcFHKXVScdgaYR4rw1HtNwQogwg9ulSq1ejRDnhdDyRbE4bE+guHwf2l+2ewyDg3hhpM=
X-Received: by 2002:a17:907:97c2:b0:aab:cd46:561a with SMTP id
 a640c23a62f3a-aabf49911c8mr318924066b.59.1734545100395; Wed, 18 Dec 2024
 10:05:00 -0800 (PST)
MIME-Version: 1.0
References: <20241217231202.3384873-1-derek@asterius.io> <3edaa887-9925-4503-9126-22fcb0a6175a@cherry.de>
In-Reply-To: <3edaa887-9925-4503-9126-22fcb0a6175a@cherry.de>
From: Derek Straka <derek@asterius.io>
Date: Wed, 18 Dec 2024 12:04:48 -0600
X-Gmail-Original-Message-ID: <CADNbA1oNnU6mt_D9p+nzNwjEqsOVx4syTXEShuYgHFO4tg7O=Q@mail.gmail.com>
Message-ID: <CADNbA1oNnU6mt_D9p+nzNwjEqsOVx4syTXEShuYgHFO4tg7O=Q@mail.gmail.com>
Subject: Re: [OE-core][PATCHv2 1/2] classes/ptest-python-pytest: add a new
 class to consolidate pytest ptest functionality
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008e630106298f4024"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 18:05:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208875

--0000000000008e630106298f4024
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

V3 to be sent shortly based on inputs from you and Alex.

On Wed, Dec 18, 2024 at 7:32=E2=80=AFAM Quentin Schulz <quentin.schulz@cher=
ry.de>
wrote:

> Hi Derek,
>
Hi Quentin,

Thanks for your note.

>
> On 12/18/24 12:12 AM, Derek Straka via lists.openembedded.org wrote:
> > A large number of python packages leverage the pytest unit test
> > framework for their ptest functionality.  Currently, many of the tests
> > have duplicate code for:
> >      1. Installing pytest files
> >      2. Declaring ptest dependencies
> >      3. Script for executing tests (run-ptes)
> >
> > To simplify adding common pytest based ptests, added a new class
> > enabling base functionality.  Users can also override the location of
> > the pytest files in addition to using their own version of run-ptest
> >
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >   .../ptest-python-pytest.bbclass               | 42 ++++++++++++++++++=
+
> >   meta/files/ptest-python-pytest/run-ptest      |  3 ++
> >   2 files changed, 45 insertions(+)
> >   create mode 100644 meta/classes-recipe/ptest-python-pytest.bbclass
> >   create mode 100755 meta/files/ptest-python-pytest/run-ptest
> >
> > diff --git a/meta/classes-recipe/ptest-python-pytest.bbclass
> b/meta/classes-recipe/ptest-python-pytest.bbclass
> > new file mode 100644
> > index 0000000000..89ff10c335
> > --- /dev/null
> > +++ b/meta/classes-recipe/ptest-python-pytest.bbclass
> > @@ -0,0 +1,42 @@
> > +#
> > +# Copyright OpenEmbedded Contributors
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +
> > +inherit ptest
> > +
> > +FILESEXTRAPATHS:prepend :=3D "${COREBASE}/meta/files:"
>
> I think it'd make sense to use :append here as we don't want to override
> anything, just provide a fallback in case the
> ptest-python-pytest/run-ptest isn't find anywhere else. This would also
> allow to easily override this file by just adding the file next to the
> recipe, instead of having to add a FILESEXTRAPATHS:prepend :=3D
> "${THISDIR}/${PN}:" in the recipe after the inherit for example.
>
> I was able to override in oe-core without adding any prepends in the
recipes.  My understanding is the EXTRA paths are searched as a last
resort, so recipes having their own run-ptest get theirs included first.
Overall, the class was adapted from ptest-perl and ptest-cargo.

> > +
> > +SRC_URI +=3D "file://ptest-python-pytest/run-ptest"
> > +
>
> We use append/prepend everywhere but here, should we?
>
> The code was borrowed from ptest-perl.bbclass.  I'll update the python
class as suggested.

> > +# Overridable configuration for the directory within the source tree
> > +# containing the pytest files
> > +PTEST_PYTEST_DIR ?=3D "/tests"
> > +
> > +do_install_ptest_python_pytest() {
> > +     if [ ! -f ${D}${PTEST_PATH}/run-ptest ]; then
> > +             install -m 0755 ${UNPACKDIR}/ptest-python-pytest/run-ptes=
t
> ${D}${PTEST_PATH}
> > +     fi
>
> This means if we ever built the recipe and don't clean its WORKDIR, but
> update the file, it will never be updated. I don't think that's what we
> want. Can you explain what you're trying to prevent here by having a
> check for NOT installing the file?
>
> > +    if [ -d "${S}/${PTEST_PYTEST_DIR}" ]; then
>
> Shouldn't we use UNPACKDIR for file:// SRC_URI in master?
>
To my knowledge, the pypi recipes aren't putting the sources into UNPACKDIR
for better or worse.  I looked at several packages, and they're using `S =
=3D
"${WORKDIR}/${PYPI_PACKAGE}-${PV}"` (See pypi.bbclass)

>
> Cheers,
> Quentin
>

--0000000000008e630106298f4024
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>V3 to be sent shortly based on inputs from you and Al=
ex.</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, Dec 18, 2024 at 7:32=E2=80=AFAM Quentin Sc=
hulz &lt;<a href=3D"mailto:quentin.schulz@cherry.de">quentin.schulz@cherry.=
de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hi Derek,<br></blockquote><div>Hi Quentin,</div><div><br></div><div>Thank=
s for your note.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
On 12/18/24 12:12 AM, Derek Straka via <a href=3D"http://lists.openembedded=
.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote=
:<br>
&gt; A large number of python packages leverage the pytest unit test<br>
&gt; framework for their ptest functionality.=C2=A0 Currently, many of the =
tests<br>
&gt; have duplicate code for:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 1. Installing pytest files<br>
&gt;=C2=A0 =C2=A0 =C2=A0 2. Declaring ptest dependencies<br>
&gt;=C2=A0 =C2=A0 =C2=A0 3. Script for executing tests (run-ptes)<br>
&gt; <br>
&gt; To simplify adding common pytest based ptests, added a new class<br>
&gt; enabling base functionality.=C2=A0 Users can also override the locatio=
n of<br>
&gt; the pytest files in addition to using their own version of run-ptest<b=
r>
&gt; <br>
&gt; Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io" t=
arget=3D"_blank">derek@asterius.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../ptest-python-pytest.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 42 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0meta/files/ptest-python-pytest/run-ptest=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 3 ++<br>
&gt;=C2=A0 =C2=A02 files changed, 45 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/classes-recipe/ptest-python-pytest=
.bbclass<br>
&gt;=C2=A0 =C2=A0create mode 100755 meta/files/ptest-python-pytest/run-ptes=
t<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/ptest-python-pytest.bbclass b/meta/cl=
asses-recipe/ptest-python-pytest.bbclass<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..89ff10c335<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/classes-recipe/ptest-python-pytest.bbclass<br>
&gt; @@ -0,0 +1,42 @@<br>
&gt; +#<br>
&gt; +# Copyright OpenEmbedded Contributors<br>
&gt; +#<br>
&gt; +# SPDX-License-Identifier: MIT<br>
&gt; +#<br>
&gt; +<br>
&gt; +inherit ptest<br>
&gt; +<br>
&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${COREBASE}/meta/files:&quot;<br>
<br>
I think it&#39;d make sense to use :append here as we don&#39;t want to ove=
rride <br>
anything, just provide a fallback in case the <br>
ptest-python-pytest/run-ptest isn&#39;t find anywhere else. This would also=
 <br>
allow to easily override this file by just adding the file next to the <br>
recipe, instead of having to add a FILESEXTRAPATHS:prepend :=3D <br>
&quot;${THISDIR}/${PN}:&quot; in the recipe after the inherit for example.<=
br>
<br></blockquote><div>I was able to override in oe-core without adding any =
prepends in the recipes.=C2=A0 My understanding is the EXTRA paths are sear=
ched as a last resort, so recipes having their own run-ptest get theirs inc=
luded first.=C2=A0 Overall, the class was adapted from ptest-perl and ptest=
-cargo.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +SRC_URI +=3D &quot;file://ptest-python-pytest/run-ptest&quot;<br>
&gt; +<br>
<br>
We use append/prepend everywhere but here, should we?<br>
<br></blockquote><div>The code was borrowed from ptest-perl.bbclass.=C2=A0 =
I&#39;ll update the python class as suggested.</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
&gt; +# Overridable configuration for the directory within the source tree<=
br>
&gt; +# containing the pytest files<br>
&gt; +PTEST_PYTEST_DIR ?=3D &quot;/tests&quot;<br>
&gt; +<br>
&gt; +do_install_ptest_python_pytest() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ ! -f ${D}${PTEST_PATH}/run-ptest ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${UNP=
ACKDIR}/ptest-python-pytest/run-ptest ${D}${PTEST_PATH}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
<br>
This means if we ever built the recipe and don&#39;t clean its WORKDIR, but=
 <br>
update the file, it will never be updated. I don&#39;t think that&#39;s wha=
t we <br>
want. Can you explain what you&#39;re trying to prevent here by having a <b=
r>
check for NOT installing the file?<br>
<br>
&gt; +=C2=A0 =C2=A0 if [ -d &quot;${S}/${PTEST_PYTEST_DIR}&quot; ]; then<br=
>
<br>
Shouldn&#39;t we use UNPACKDIR for file:// SRC_URI in master?<br></blockquo=
te><div>To my knowledge, the pypi recipes aren&#39;t putting the=C2=A0sourc=
es into UNPACKDIR for better or worse.=C2=A0 I looked at several packages, =
and they&#39;re using `S =3D &quot;${WORKDIR}/${PYPI_PACKAGE}-${PV}&quot;` =
(See pypi.bbclass)</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
Quentin<br>
</blockquote></div></div>

--0000000000008e630106298f4024--

