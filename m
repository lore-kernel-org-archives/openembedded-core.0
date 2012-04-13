Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SIe0c-00066U-Tr
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 12:45:42 +0200
Received: by wgbdr12 with SMTP id dr12so2426367wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 03:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=6r6tei5/bE6Lv2owHkF5L/qQnXw01WD5CI1pSO+fcvg=;
	b=nqZYzCvs1qFhZazXraBVPLOOsHJsFx6dCN0ZGUtCi32fDqK4RMVwqlnN4p0V05q7+7
	/twkrahOTm0oDC3CMX9ysA8ojJHP67afgFLl+Bf5juLXkZkrEXx2uzEPMhR9+Ej3ol6f
	7IQKH2aJOcjN/x8QVhkmI/g93O6wZfLCRvO19+XVM/Q0k0bfr1dmqegLksWScuXQ5cl5
	H0wpy89SqOMZ80BBQA6SJA22akpHPDR14v/LJdA98w0IaypVxaqTyyNi65c01HfVUEr3
	hRlCvcgrTNfo7miLpV/lkDlhQac7O5HBdbU3Ab0KUB7+CXsw68gGPp5snxTSsz0Os7qk
	xtHA==
Received: by 10.180.89.98 with SMTP id bn2mr3366558wib.22.1334313380548; Fri,
	13 Apr 2012 03:36:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.227.128.9 with HTTP; Fri, 13 Apr 2012 03:36:00 -0700 (PDT)
X-Originating-IP: [93.114.75.57]
In-Reply-To: <20120413080312.GB3651@jama.jama.net>
References: <cover.1334159446.git.andrei@gherzan.ro>
	<a9b864635df3ef1e7c3ceeeb05adc491d4e5b97b.1334159446.git.andrei@gherzan.ro>
	<20120413080312.GB3651@jama.jama.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 13 Apr 2012 13:36:00 +0300
Message-ID: <CAK18fxEFbaHWnhWw6ayhdvLem9Qki7Ae=W9V-yAM-dpCKBuG+Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmHUikX5wlXJQcnF2v3ZqZOXzRRXHdqQiZI1HLbYZ+1H/bXE3RQ/9veJupPIZONb08lVb8w
Subject: Re: [V4 2/2] PR bump packages with gdbm in DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Apr 2012 10:45:43 -0000
Content-Type: multipart/alternative; boundary=f46d04447fbb110fd404bd8d0b04

--f46d04447fbb110fd404bd8d0b04
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Apr 13, 2012 at 11:03, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Wed, Apr 11, 2012 at 06:54:14PM +0300, Andrei Gherzan wrote:
> > This is done because of this change in gdbm:
> > "gdbm: Package compat libs in gdbm-compat"
> >
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > ---
> >  meta/recipes-devtools/perl/perl_5.14.2.bb          |    2 +-
> >  meta/recipes-devtools/python/python_2.7.2.bb       |    2 +-
> >  .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
> >  meta/recipes-support/apr/apr-util_1.4.1.bb         |    2 +-
> >  4 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bbb/meta/recipes-devtools/perl/
> perl_5.14.2.bb
> > index 92ca9b8..8f3ad25 100644
> > --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
> > +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
> >  # We need gnugrep (for -I)
> >  DEPENDS = "virtual/db grep-native"
> >  DEPENDS += "gdbm zlib"
> > -PR = "r4"
> > +PR = "r5"
> >
> >  # 5.10.1 has Module::Build built-in
> >  PROVIDES += "libmodule-build-perl"
> > diff --git a/meta/recipes-devtools/python/python_2.7.2.bbb/meta/recipes-devtools/python/
> python_2.7.2.bb
> > index a3a2c96..00a5558 100644
> > --- a/meta/recipes-devtools/python/python_2.7.2.bb
> > +++ b/meta/recipes-devtools/python/python_2.7.2.bb
> > @@ -1,6 +1,6 @@
> >  require python.inc
> >  DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
> > -PR = "${INC_PR}.14"
> > +PR = "${INC_PR}.15"
>
> This does not apply
>
> current PR is:
> PR = "${INC_PR}.10"
>
> http://git.openembedded.org/openembedded-core/log/meta/recipes-devtools/python/python_2.7.2.bb
>
> so no idea where you got 'PR = "${INC_PR}.14"'
>
> Cheers,
>
>
Thank you Martin. V5 sent.

@g

--f46d04447fbb110fd404bd8d0b04
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Apr 13, 2012 at 11:03, Martin Jansa <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gm=
ail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<div class=3D"HOEnZb"><div class=3D"h5">On Wed, Apr 11, 2012 at 06:54:14PM =
+0300, Andrei Gherzan wrote:<br>
&gt; This is done because of this change in gdbm:<br>
&gt; &quot;gdbm: Package compat libs in gdbm-compat&quot;<br>
&gt;<br>
&gt; Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro"=
>andrei@gherzan.ro</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/recipes-devtools/perl/<a href=3D"http://perl_5.14.2.bb" target=
=3D"_blank">perl_5.14.2.bb</a> =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-<br>
&gt; =A0meta/recipes-devtools/python/<a href=3D"http://python_2.7.2.bb" tar=
get=3D"_blank">python_2.7.2.bb</a> =A0 =A0 =A0 | =A0 =A02 +-<br>
&gt; =A0.../pulseaudio/<a href=3D"http://pulseaudio_1.1.bb" target=3D"_blan=
k">pulseaudio_1.1.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-<=
br>
&gt; =A0meta/recipes-support/apr/<a href=3D"http://apr-util_1.4.1.bb" targe=
t=3D"_blank">apr-util_1.4.1.bb</a> =A0 =A0 =A0 =A0 | =A0 =A02 +-<br>
&gt; =A04 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.14.2.=
bb" target=3D"_blank">perl_5.14.2.bb</a> b/meta/recipes-devtools/perl/<a hr=
ef=3D"http://perl_5.14.2.bb" target=3D"_blank">perl_5.14.2.bb</a><br>
&gt; index 92ca9b8..8f3ad25 100644<br>
&gt; --- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.14.2.bb" tar=
get=3D"_blank">perl_5.14.2.bb</a><br>
&gt; +++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.14.2.bb" tar=
get=3D"_blank">perl_5.14.2.bb</a><br>
&gt; @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://Copying;md5=3D2b4c6f=
fbcfcbdee469f02565f253d81a \<br>
&gt; =A0# We need gnugrep (for -I)<br>
&gt; =A0DEPENDS =3D &quot;virtual/db grep-native&quot;<br>
&gt; =A0DEPENDS +=3D &quot;gdbm zlib&quot;<br>
&gt; -PR =3D &quot;r4&quot;<br>
&gt; +PR =3D &quot;r5&quot;<br>
&gt;<br>
&gt; =A0# 5.10.1 has Module::Build built-in<br>
&gt; =A0PROVIDES +=3D &quot;libmodule-build-perl&quot;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python_2.7=
.2.bb" target=3D"_blank">python_2.7.2.bb</a> b/meta/recipes-devtools/python=
/<a href=3D"http://python_2.7.2.bb" target=3D"_blank">python_2.7.2.bb</a><b=
r>
&gt; index a3a2c96..00a5558 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python_2.7.2.bb" =
target=3D"_blank">python_2.7.2.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python_2.7.2.bb" =
target=3D"_blank">python_2.7.2.bb</a><br>
&gt; @@ -1,6 +1,6 @@<br>
&gt; =A0require python.inc<br>
&gt; =A0DEPENDS =3D &quot;python-native bzip2 db gdbm openssl readline sqli=
te3 zlib&quot;<br>
&gt; -PR =3D &quot;${INC_PR}.14&quot;<br>
&gt; +PR =3D &quot;${INC_PR}.15&quot;<br>
<br>
</div></div>This does not apply<br>
<br>
current PR is:<br>
PR =3D &quot;${INC_PR}.10&quot;<br>
<a href=3D"http://git.openembedded.org/openembedded-core/log/meta/recipes-d=
evtools/python/python_2.7.2.bb" target=3D"_blank">http://git.openembedded.o=
rg/openembedded-core/log/meta/recipes-devtools/python/python_2.7.2.bb</a><b=
r>


<br>
so no idea where you got &#39;PR =3D &quot;${INC_PR}.14&quot;&#39;<br>
<br>
Cheers,<br>
<div class=3D"im"><br></div></blockquote><div><br></div><div>Thank you Mart=
in. V5 sent. =A0</div><div><br></div><div>@g</div></div>

--f46d04447fbb110fd404bd8d0b04--
