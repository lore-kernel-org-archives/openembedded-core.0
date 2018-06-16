Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5627B74FBB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 00:24:58 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id z16-v6so7489772uaz.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 17:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5tnOmozg8M3bvGmzDPC+GTU9WmkXiS626K+geHTmN6A=;
	b=OyDThIhrO8vkshu5Jrmb81CduVqgxLoyc4GyXRL5vjWCD/8XcZPyJUCxpxV0H0aht1
	1KXHDirCg+McvqiwwYq8OxuJdJQB6Um8pYgyj/kAjC1UqQ/5MYwC22beT646LjDUuaT6
	h8RNYoJboyEyAmqhAupN+J9dOn0wbNgr29s/hY6cbwV7MWQVuHOW4O4bk3Jdj5HK1KQH
	z66zHr8vaQQZXiCIGljffyyVqyYjTLAav6MX2uGy7HjSMil5PVvM67ftuip7RB6hmMqS
	z1iH+3LvS2wqX0z3/W2OqV1CI9yCvkMAFf6UsbQWRoYhKbvJEv2ZHDZi3vlzOoHF81/U
	Rs3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5tnOmozg8M3bvGmzDPC+GTU9WmkXiS626K+geHTmN6A=;
	b=A6c6QGAAJrGQO0E9R3zjFaAJy3Vu/ghNPpS3DlMc1DreNM/u7n3GA8lfl/ShLJzRMg
	vr7H3STM5kc5RGDbAg9wDprP8PbMa1r5UDzt6cusKUYmTfMYFzJYMJL/8KEHksI8LKFi
	p8hdwJY/0WVK2/0cFi6fTZWQPLTpil04Z0kAcTHuzozXmjF4IzYOEZe4O06atsi9RiU+
	Ez6kwItcyi/5s4Qho7bY5CTl4hSdW7CWLtI7AlvKoPCSIdH/e8FbWGGZ/nBa1pMMzzOn
	STCk7QXN6dR7q6KoLG32oyop3g4Hbj2EQ8bQEvLoZVZ80L30q/+CoCEI45Ds+84qcjrI
	c0HA==
X-Gm-Message-State: APt69E2y8L37gIALmZyBYABCXq0HkGOKWIN6TRcyNAVAfQa6hQk9IwEz
	wPvzAYyTvXLeAJuaE/+qISaMhVQ4ZsbjjEHTvoc=
X-Google-Smtp-Source: ADUXVKKaxSIbYOBB2jImlPWRJZXAzjB8j8UUR79ctCVoYJaqd1Mc4PmH+a0EZ0gyv2z+/YjuktB3Lrd5fAzrZXrzwco=
X-Received: by 2002:ab0:5851:: with SMTP id
	p17-v6mr2550019uac.164.1529108698939; 
	Fri, 15 Jun 2018 17:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <1529093808-10025-1-git-send-email-armccurdy@gmail.com>
	<22e45738-aa92-24c7-a3fc-03a0918a1c3a@windriver.com>
	<CAMKF1srvZ830wY4_PEV06L4Tea6OkHkSi+fcZMuG0sungLCdyQ@mail.gmail.com>
	<CAJ86T=VjYfk1T0MmN-6oyVSZmjYXZ3VNnaGAdLt49d12ZDEWwA@mail.gmail.com>
In-Reply-To: <CAJ86T=VjYfk1T0MmN-6oyVSZmjYXZ3VNnaGAdLt49d12ZDEWwA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jun 2018 17:23:53 -0700
Message-ID: <CAMKF1srWE9vVhv7MjcVh32mK+_FPt4OgYU7j9nWhW5fdd_hQ8Q@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@jci.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH] common-licenses: Add BSD-1-Clause
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
X-List-Received-Date: Sat, 16 Jun 2018 00:24:58 -0000
Content-Type: multipart/alternative; boundary="000000000000d2c7ae056eb75c0e"

--000000000000d2c7ae056eb75c0e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2018 at 3:48 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Fri, Jun 15, 2018 at 3:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Fri, Jun 15, 2018 at 3:14 PM Mark Hatle <mark.hatle@windriver.com>
> wrote:
> >>
> >> On 6/15/18 3:16 PM, Andre McCurdy wrote:
> >> > From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> >> >
> >> > Some projects are starting to use it.
> >> >   https://spdx.org/licenses//BSD-1-Clause.html
> >> >
> >> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> >> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> >> > (cherry picked from commit 77f692ecb39d880b2cb420850a31534860eb2cc5)
> >> > Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> >> > ---
> >> >  meta/files/common-licenses/BSD-1-Clause | 9 +++++++++
> >> >  1 file changed, 9 insertions(+)
> >> >  create mode 100644 meta/files/common-licenses/BSD-1-Clause
> >> >
> >> > diff --git a/meta/files/common-licenses/BSD-1-Clause
> b/meta/files/common-licenses/BSD-1-Clause
> >> > new file mode 100644
> >> > index 0000000..ded8897
> >> > --- /dev/null
> >> > +++ b/meta/files/common-licenses/BSD-1-Clause
> >> > @@ -0,0 +1,9 @@
> >> > +
> >> > +Copyright (c) <YEAR>, <OWNER>
> >> > +All rights reserved.
> >> > +
> >> > +Redistribution and use in source and binary forms, with or without
> modification, are permitted provided that the following conditions are me=
t:
> >> > +
> >> > +Redistributions of source code must retain the above copyright
> notice, this list of conditions and the following disclaimer.
> >> > +THIS SOFTWARE IS PROVIDED BY Berkeley Software Design, Inc. "AS IS"
> AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> >>
> >> Hate to nitpick, but isn't BSDi defunct?  I don't think it makes sense
> to list
> >> BSDI, since as far as I know they never had a '1-Clause' license.
> >>
> >> Maybe a <Organization Here> would be more appropriate.
> >>
> >
> > I think we should sync the files we carry with SPDX e.g.
> > https://github.com/spdx/license-list-data/tree/master/text
>
> It doesn't look like that will fix the inconsistencies... those
> versions are inconsistent too:


We should report that to spdx folks since they
Work on licenses and might be interested in addressing this

>
>
> https://github.com/spdx/license-list-data/blob/master/text/BSD-1-Clause.t=
xt
> : THIS SOFTWARE IS PROVIDED BY Berkeley Software Design, Inc. "AS IS"
>
> https://github.com/spdx/license-list-data/blob/master/text/BSD-2-Clause.t=
xt
> : THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> "AS IS"
>
> etc...
>
> >
> >> --Mark
> >>
> >> IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
> PURPOSE ARE
> >> DISCLAIMED. IN NO EVENT SHALL Berkeley Software Design, Inc. BE LIABLE
> FOR ANY
> >> DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> DAMAGES
> >> (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
> SERVICES;
> >> LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSE=
D
> AND ON
> >> ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TOR=
T
> >> (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> OF THIS
> >> SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> >> > +
> >> >
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000d2c7ae056eb75c0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Fri=
, Jun 15, 2018 at 3:48 PM Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gma=
il.com">armccurdy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">On Fri, Jun 15, 2018 at 3:36 PM, Khem Raj &lt;<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; On Fri, Jun 15, 2018 at 3:14 PM Mark Hatle &lt;<a href=3D"mailto:mark.=
hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt; wro=
te:<br>
&gt;&gt;<br>
&gt;&gt; On 6/15/18 3:16 PM, Andre McCurdy wrote:<br>
&gt;&gt; &gt; From: Andr=C3=A9 Draszik &lt;<a href=3D"mailto:andre.draszik@=
jci.com" target=3D"_blank">andre.draszik@jci.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Some projects are starting to use it.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://spdx.org/licenses//BSD-1-Claus=
e.html" rel=3D"noreferrer" target=3D"_blank">https://spdx.org/licenses//BSD=
-1-Clause.html</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mailto:andre=
.draszik@jci.com" target=3D"_blank">andre.draszik@jci.com</a>&gt;<br>
&gt;&gt; &gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@=
intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt;&gt; &gt; (cherry picked from commit 77f692ecb39d880b2cb420850a31534860=
eb2cc5)<br>
&gt;&gt; &gt; Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@=
gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/files/common-licenses/BSD-1-Clause | 9 +++++++++<b=
r>
&gt;&gt; &gt;=C2=A0 1 file changed, 9 insertions(+)<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta/files/common-licenses/BSD-1-Cla=
use<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/files/common-licenses/BSD-1-Clause b/meta/f=
iles/common-licenses/BSD-1-Clause<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 0000000..ded8897<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta/files/common-licenses/BSD-1-Clause<br>
&gt;&gt; &gt; @@ -0,0 +1,9 @@<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Copyright (c) &lt;YEAR&gt;, &lt;OWNER&gt;<br>
&gt;&gt; &gt; +All rights reserved.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Redistribution and use in source and binary forms, with or w=
ithout modification, are permitted provided that the following conditions a=
re met:<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Redistributions of source code must retain the above copyrig=
ht notice, this list of conditions and the following disclaimer.<br>
&gt;&gt; &gt; +THIS SOFTWARE IS PROVIDED BY Berkeley Software Design, Inc. =
&quot;AS IS&quot; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT=
 LIMITED TO, THE<br>
&gt;&gt;<br>
&gt;&gt; Hate to nitpick, but isn&#39;t BSDi defunct?=C2=A0 I don&#39;t thi=
nk it makes sense to list<br>
&gt;&gt; BSDI, since as far as I know they never had a &#39;1-Clause&#39; l=
icense.<br>
&gt;&gt;<br>
&gt;&gt; Maybe a &lt;Organization Here&gt; would be more appropriate.<br>
&gt;&gt;<br>
&gt;<br>
&gt; I think we should sync the files we carry with SPDX e.g.<br>
&gt; <a href=3D"https://github.com/spdx/license-list-data/tree/master/text"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/spdx/license-list-=
data/tree/master/text</a><br>
<br>
It doesn&#39;t look like that will fix the inconsistencies... those<br>
versions are inconsistent too:</blockquote><div dir=3D"auto"><br></div><div=
 dir=3D"auto">We should report that to spdx folks since they=C2=A0</div><di=
v dir=3D"auto">Work on licenses and might be interested in addressing this=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><br>
<br>
<a href=3D"https://github.com/spdx/license-list-data/blob/master/text/BSD-1=
-Clause.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/spdx/l=
icense-list-data/blob/master/text/BSD-1-Clause.txt</a><br>
: THIS SOFTWARE IS PROVIDED BY Berkeley Software Design, Inc. &quot;AS IS&q=
uot;<br>
<br>
<a href=3D"https://github.com/spdx/license-list-data/blob/master/text/BSD-2=
-Clause.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/spdx/l=
icense-list-data/blob/master/text/BSD-2-Clause.txt</a><br>
: THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS<br>
&quot;AS IS&quot;<br>
<br>
etc...<br>
<br>
&gt;<br>
&gt;&gt; --Mark<br>
&gt;&gt;<br>
&gt;&gt; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR=
 PURPOSE ARE<br>
&gt;&gt; DISCLAIMED. IN NO EVENT SHALL Berkeley Software Design, Inc. BE LI=
ABLE FOR ANY<br>
&gt;&gt; DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL=
 DAMAGES<br>
&gt;&gt; (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR=
 SERVICES;<br>
&gt;&gt; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER C=
AUSED AND ON<br>
&gt;&gt; ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR=
 TORT<br>
&gt;&gt; (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE =
USE OF THIS<br>
&gt;&gt; SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;<br>
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

--000000000000d2c7ae056eb75c0e--
