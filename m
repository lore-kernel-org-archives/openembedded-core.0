Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C60FE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 17:58:25 +0000 (UTC)
Received: from m43-12.mailgun.net (m43-12.mailgun.net [69.72.43.12])
 by mx.groups.io with SMTP id smtpd.web11.135044.1734631096465550656
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 09:58:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@asterius.io header.s=mailo header.b=mzK2xB1C;
 spf=pass (domain: asterius.io, ip: 69.72.43.12, mailfrom: bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt; s=mailo; t=1734631094; x=1734638294;
 h=Content-Type: Cc: To: To: Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References: MIME-Version: Sender: Sender;
 bh=WRHgJ+9NSPpGF3f8KfPgS83qGz5FC5vbn4D/jx8lE6s=;
 b=mzK2xB1C0KFLSAFKlRX/ms++7hz3J3Ura9KZ8O6ymtYHnidz2E5vvtd6p375Ts2gPHHQA9J3LsIjTuEzlz79L8HkMzIB5UEJ+1wMYaANxTT+3vM7hisBFC04AFUYt6guQHB3fIpBrOGNXX8sFphWcwDKv4fBK3RXBko7j9W4rN0=
X-Mailgun-Sending-Ip: 69.72.43.12
X-Mailgun-Sending-Ip-Pool-Name: 
X-Mailgun-Sending-Ip-Pool: 
X-Mailgun-Sid: WyJiMTQwMSIsIm9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmciLCIzYTU2ODUiXQ==
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53]) by
 cb2fc9c3db23 with SMTP id 67645eb6bef4ca7b16614ebe (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Thu, 19 Dec 2024 17:58:14 GMT
Sender: derek@asterius.io
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aab9e281bc0so190048866b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 09:58:13 -0800 (PST)
X-Gm-Message-State: AOJu0Yyt3a4euvuYH4zwd84JAkqD2qzmxHoFLFvIAu/brAk3XtURexjT
	nN247RZ2KNnzkq9cCjwUyj1WwBrPFLPSkTM197wKtnJiraoP4MnpNOkqBV8xGFIUncQs93rCaHU
	6MWXQ3xjN2i5jFRz9ycjWCDr4gEA=
X-Google-Smtp-Source: AGHT+IFhd8vByZOlCwcPh4rUdZnn1A3Yuk/rCDycFCDVpHtb+oXli6q/D8EMr23YgKIRls+5ImqjWHuI2ejuo/xaZ0A=
X-Received: by 2002:a17:906:a91:b0:aac:1b56:324a with SMTP id
 a640c23a62f3a-aac1b563322mr145870566b.26.1734631093284; Thu, 19 Dec 2024
 09:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20241217231202.3384873-1-derek@asterius.io> <3edaa887-9925-4503-9126-22fcb0a6175a@cherry.de>
 <CADNbA1oNnU6mt_D9p+nzNwjEqsOVx4syTXEShuYgHFO4tg7O=Q@mail.gmail.com> <e1856b91-8aa9-4e01-a85c-5ba1ba05f18d@cherry.de>
In-Reply-To: <e1856b91-8aa9-4e01-a85c-5ba1ba05f18d@cherry.de>
From: Derek Straka <derek@asterius.io>
Date: Thu, 19 Dec 2024 11:58:02 -0600
X-Gmail-Original-Message-ID: <CADNbA1oJRjzD5ApsJmD1mvAvvrjcJSWGxcs99F0cyLt6sJf5xA@mail.gmail.com>
Message-ID: <CADNbA1oJRjzD5ApsJmD1mvAvvrjcJSWGxcs99F0cyLt6sJf5xA@mail.gmail.com>
Subject: Re: [OE-core][PATCHv2 1/2] classes/ptest-python-pytest: add a new
 class to consolidate pytest ptest functionality
To: Quentin Schulz <quentin.schulz@cherry.de>, Ross Burton <Ross.Burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000021bca90629a34607"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 17:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208925

--00000000000021bca90629a34607
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the detailed explanation.  Paths have evolved a bit over
time.  I intend the run-ptest to be a file of last resort.

I'd ask the broader community what's the preferred way of adding a default
file from a class if it does not exist in bbappend or bb files?  I'm
struggling to get the syntax correct.  Thanks!

On Thu, Dec 19, 2024 at 4:37=E2=80=AFAM Quentin Schulz <quentin.schulz@cher=
ry.de>
wrote:

> Hi Derek,
>
> On 12/18/24 7:04 PM, Derek Straka wrote:
> > V3 to be sent shortly based on inputs from you and Alex.
> >
> > On Wed, Dec 18, 2024 at 7:32=E2=80=AFAM Quentin Schulz <quentin.schulz@=
cherry.de
> >
> > wrote:
> >
> >> Hi Derek,
> >>
> > Hi Quentin,
> >
> > Thanks for your note.
> >
> >>
> >> On 12/18/24 12:12 AM, Derek Straka via lists.openembedded.org wrote:
> >>> A large number of python packages leverage the pytest unit test
> >>> framework for their ptest functionality.  Currently, many of the test=
s
> >>> have duplicate code for:
> >>>       1. Installing pytest files
> >>>       2. Declaring ptest dependencies
> >>>       3. Script for executing tests (run-ptes)
> >>>
> >>> To simplify adding common pytest based ptests, added a new class
> >>> enabling base functionality.  Users can also override the location of
> >>> the pytest files in addition to using their own version of run-ptest
> >>>
> >>> Signed-off-by: Derek Straka <derek@asterius.io>
> >>> ---
> >>>    .../ptest-python-pytest.bbclass               | 42
> +++++++++++++++++++
> >>>    meta/files/ptest-python-pytest/run-ptest      |  3 ++
> >>>    2 files changed, 45 insertions(+)
> >>>    create mode 100644 meta/classes-recipe/ptest-python-pytest.bbclass
> >>>    create mode 100755 meta/files/ptest-python-pytest/run-ptest
> >>>
> >>> diff --git a/meta/classes-recipe/ptest-python-pytest.bbclass
> >> b/meta/classes-recipe/ptest-python-pytest.bbclass
> >>> new file mode 100644
> >>> index 0000000000..89ff10c335
> >>> --- /dev/null
> >>> +++ b/meta/classes-recipe/ptest-python-pytest.bbclass
> >>> @@ -0,0 +1,42 @@
> >>> +#
> >>> +# Copyright OpenEmbedded Contributors
> >>> +#
> >>> +# SPDX-License-Identifier: MIT
> >>> +#
> >>> +
> >>> +inherit ptest
> >>> +
> >>> +FILESEXTRAPATHS:prepend :=3D "${COREBASE}/meta/files:"
> >>
> >> I think it'd make sense to use :append here as we don't want to overri=
de
> >> anything, just provide a fallback in case the
> >> ptest-python-pytest/run-ptest isn't find anywhere else. This would als=
o
> >> allow to easily override this file by just adding the file next to the
> >> recipe, instead of having to add a FILESEXTRAPATHS:prepend :=3D
> >> "${THISDIR}/${PN}:" in the recipe after the inherit for example.
> >>
> > I was able to override in oe-core without adding any prepends in the
> > recipes.  My understanding is the EXTRA paths are searched as a last
> > resort, so recipes having their own run-ptest get theirs included first=
.
> > Overall, the class was adapted from ptest-perl and ptest-cargo.
> >
>
> FILESEXTRAPATHS:prepend is what we use in bbappends to search in the
> directory next to the bbappend **first** and then from the original
> recipe second.
>
> It's a bit convoluted, but FILESPATH stores a list of paths that is
> constructed from FILESEXTRAPATHS + <original-recipe-dir>/${BP} +
> <original-recipe-dir>/${BPN} + <original-recipe-dir>/files (c.f.
> meta/classes-global/base.bbclass line 59, which calls base_set_filespath
> from meta/classes-global/utils.bbclass). FILESPATH is then read from
> left to right and the first path to have the listed file "wins".
>
> Can you please provide the code you used to validate overriding
> run-ptest from the recipe? If that is the case, then I would like to
> understand how that happens and we possibly have hit a corner case we
> should fix (or at least be aware of).
>
> >>> +
> >>> +SRC_URI +=3D "file://ptest-python-pytest/run-ptest"
> >>> +
> >>
> >> We use append/prepend everywhere but here, should we?
> >>
> >> The code was borrowed from ptest-perl.bbclass.  I'll update the python
> > class as suggested.
> >
> >>> +# Overridable configuration for the directory within the source tree
> >>> +# containing the pytest files
> >>> +PTEST_PYTEST_DIR ?=3D "/tests"
> >>> +
> >>> +do_install_ptest_python_pytest() {
> >>> +     if [ ! -f ${D}${PTEST_PATH}/run-ptest ]; then
> >>> +             install -m 0755
> ${UNPACKDIR}/ptest-python-pytest/run-ptest
> >> ${D}${PTEST_PATH}
> >>> +     fi
> >>
> >> This means if we ever built the recipe and don't clean its WORKDIR, bu=
t
> >> update the file, it will never be updated. I don't think that's what w=
e
> >> want. Can you explain what you're trying to prevent here by having a
> >> check for NOT installing the file?
> >>
> >>> +    if [ -d "${S}/${PTEST_PYTEST_DIR}" ]; then
> >>
> >> Shouldn't we use UNPACKDIR for file:// SRC_URI in master?
> >>
> > To my knowledge, the pypi recipes aren't putting the sources into
> UNPACKDIR
> > for better or worse.  I looked at several packages, and they're using `=
S
> =3D
> > "${WORKDIR}/${PYPI_PACKAGE}-${PV}"` (See pypi.bbclass)
> >
>
> I'm not familiar with UNPACKDIR and its use as I'm still on Scarthgap.
>
> Cheers,
> Quentin
>

--00000000000021bca90629a34607
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank=C2=A0you for the detailed explanation.=C2=A0 Paths h=
ave evolved a bit over time.=C2=A0 I intend the=C2=A0run-ptest to be a file=
 of last resort.<div><br></div><div>I&#39;d ask the broader community what&=
#39;s the preferred way of adding a default file from a class if it does no=
t exist=C2=A0in bbappend or bb files?=C2=A0 I&#39;m struggling to get the s=
yntax=C2=A0correct.=C2=A0 Thanks!</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 19, 2024 at 4:37=E2=80=
=AFAM Quentin Schulz &lt;<a href=3D"mailto:quentin.schulz@cherry.de" target=
=3D"_blank">quentin.schulz@cherry.de</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Hi Derek,<br>
<br>
On 12/18/24 7:04 PM, Derek Straka wrote:<br>
&gt; V3 to be sent shortly based on inputs from you and Alex.<br>
&gt; <br>
&gt; On Wed, Dec 18, 2024 at 7:32=E2=80=AFAM Quentin Schulz &lt;<a href=3D"=
mailto:quentin.schulz@cherry.de" target=3D"_blank">quentin.schulz@cherry.de=
</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt;&gt; Hi Derek,<br>
&gt;&gt;<br>
&gt; Hi Quentin,<br>
&gt; <br>
&gt; Thanks for your note.<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; On 12/18/24 12:12 AM, Derek Straka via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a> wrote:<br>
&gt;&gt;&gt; A large number of python packages leverage the pytest unit tes=
t<br>
&gt;&gt;&gt; framework for their ptest functionality.=C2=A0 Currently, many=
 of the tests<br>
&gt;&gt;&gt; have duplicate code for:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01. Installing pytest files<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A02. Declaring ptest dependencies<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A03. Script for executing tests (run-p=
tes)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; To simplify adding common pytest based ptests, added a new cla=
ss<br>
&gt;&gt;&gt; enabling base functionality.=C2=A0 Users can also override the=
 location of<br>
&gt;&gt;&gt; the pytest files in addition to using their own version of run=
-ptest<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asteri=
us.io" target=3D"_blank">derek@asterius.io</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 .../ptest-python-pytest.bbclass=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 42 +++++++++++++++++++<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 meta/files/ptest-python-pytest/run-ptest=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 3 ++<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 2 files changed, 45 insertions(+)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 create mode 100644 meta/classes-recipe/ptest-pyth=
on-pytest.bbclass<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 create mode 100755 meta/files/ptest-python-pytest=
/run-ptest<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meta/classes-recipe/ptest-python-pytest.bbclass<b=
r>
&gt;&gt; b/meta/classes-recipe/ptest-python-pytest.bbclass<br>
&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt; index 0000000000..89ff10c335<br>
&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt; +++ b/meta/classes-recipe/ptest-python-pytest.bbclass<br>
&gt;&gt;&gt; @@ -0,0 +1,42 @@<br>
&gt;&gt;&gt; +#<br>
&gt;&gt;&gt; +# Copyright OpenEmbedded Contributors<br>
&gt;&gt;&gt; +#<br>
&gt;&gt;&gt; +# SPDX-License-Identifier: MIT<br>
&gt;&gt;&gt; +#<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +inherit ptest<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +FILESEXTRAPATHS:prepend :=3D &quot;${COREBASE}/meta/files:&qu=
ot;<br>
&gt;&gt;<br>
&gt;&gt; I think it&#39;d make sense to use :append here as we don&#39;t wa=
nt to override<br>
&gt;&gt; anything, just provide a fallback in case the<br>
&gt;&gt; ptest-python-pytest/run-ptest isn&#39;t find anywhere else. This w=
ould also<br>
&gt;&gt; allow to easily override this file by just adding the file next to=
 the<br>
&gt;&gt; recipe, instead of having to add a FILESEXTRAPATHS:prepend :=3D<br=
>
&gt;&gt; &quot;${THISDIR}/${PN}:&quot; in the recipe after the inherit for =
example.<br>
&gt;&gt;<br>
&gt; I was able to override in oe-core without adding any prepends in the<b=
r>
&gt; recipes.=C2=A0 My understanding is the EXTRA paths are searched as a l=
ast<br>
&gt; resort, so recipes having their own run-ptest get theirs included firs=
t.<br>
&gt; Overall, the class was adapted from ptest-perl and ptest-cargo.<br>
&gt;<br>
<br>
FILESEXTRAPATHS:prepend is what we use in bbappends to search in the <br>
directory next to the bbappend **first** and then from the original <br>
recipe second.<br>
<br>
It&#39;s a bit convoluted, but FILESPATH stores a list of paths that is <br=
>
constructed from FILESEXTRAPATHS + &lt;original-recipe-dir&gt;/${BP} + <br>
&lt;original-recipe-dir&gt;/${BPN} + &lt;original-recipe-dir&gt;/files (c.f=
. <br>
meta/classes-global/base.bbclass line 59, which calls base_set_filespath <b=
r>
from meta/classes-global/utils.bbclass). FILESPATH is then read from <br>
left to right and the first path to have the listed file &quot;wins&quot;.<=
br>
<br>
Can you please provide the code you used to validate overriding <br>
run-ptest from the recipe? If that is the case, then I would like to <br>
understand how that happens and we possibly have hit a corner case we <br>
should fix (or at least be aware of).<br>
<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +SRC_URI +=3D &quot;file://ptest-python-pytest/run-ptest&quot;=
<br>
&gt;&gt;&gt; +<br>
&gt;&gt;<br>
&gt;&gt; We use append/prepend everywhere but here, should we?<br>
&gt;&gt;<br>
&gt;&gt; The code was borrowed from ptest-perl.bbclass.=C2=A0 I&#39;ll upda=
te the python<br>
&gt; class as suggested.<br>
&gt; <br>
&gt;&gt;&gt; +# Overridable configuration for the directory within the sour=
ce tree<br>
&gt;&gt;&gt; +# containing the pytest files<br>
&gt;&gt;&gt; +PTEST_PYTEST_DIR ?=3D &quot;/tests&quot;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +do_install_ptest_python_pytest() {<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0if [ ! -f ${D}${PTEST_PATH}/run-ptest ]; =
then<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 07=
55 ${UNPACKDIR}/ptest-python-pytest/run-ptest<br>
&gt;&gt; ${D}${PTEST_PATH}<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt;<br>
&gt;&gt; This means if we ever built the recipe and don&#39;t clean its WOR=
KDIR, but<br>
&gt;&gt; update the file, it will never be updated. I don&#39;t think that&=
#39;s what we<br>
&gt;&gt; want. Can you explain what you&#39;re trying to prevent here by ha=
ving a<br>
&gt;&gt; check for NOT installing the file?<br>
&gt;&gt;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 if [ -d &quot;${S}/${PTEST_PYTEST_DIR}&quot; ];=
 then<br>
&gt;&gt;<br>
&gt;&gt; Shouldn&#39;t we use UNPACKDIR for file:// SRC_URI in master?<br>
&gt;&gt;<br>
&gt; To my knowledge, the pypi recipes aren&#39;t putting the sources into =
UNPACKDIR<br>
&gt; for better or worse.=C2=A0 I looked at several packages, and they&#39;=
re using `S =3D<br>
&gt; &quot;${WORKDIR}/${PYPI_PACKAGE}-${PV}&quot;` (See pypi.bbclass)<br>
&gt; <br>
<br>
I&#39;m not familiar with UNPACKDIR and its use as I&#39;m still on Scarthg=
ap.<br>
<br>
Cheers,<br>
Quentin<br>
</blockquote></div>

--00000000000021bca90629a34607--

