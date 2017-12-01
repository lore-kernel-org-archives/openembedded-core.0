Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 399A471A1A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:01:46 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id j14so8287391uag.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 08:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=axHbbJWrB6Z2wMPibgyEreXo5dggiS2tEtnI0gJj1M0=;
	b=aRXJhtKhIClNgWIyt5ECogjxkEUSpVAWDYT7hfKddisevFupzbCjljnL+s8E6auzYO
	S7IReBmVC4XeKPm4ddtDGCw7ilId0iFk3zObvh0zFN9WkVr+SqtbsUyUO0ivk/aRbX2C
	bFfHszsDmjMxUxo11QCZCZuLni6K0R/HBHKdY8AEEZBJi0E9Ieogt2SibRKe5QiEn5of
	LS91u9iU6MMMdWKj16gA0JctrsVXBt5JwXxtmgR8bPgD0PzcaJY90w4i6yFa2xZcl/V6
	QdLiz2KtawO4ehfLpSSqhSSzyhPYP1LhtH+myndCyAWohw1f7PTjggq9uyZaA8S0qZz4
	lCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=axHbbJWrB6Z2wMPibgyEreXo5dggiS2tEtnI0gJj1M0=;
	b=KD3BN1DA3HfrDA2ovu3sieTb+B5lTxHLfb11PXDQ/7/Avh4nzEVDPoxjTPFwa768JF
	78ZK8RssthEO89x0AJr0cpbYwklGEqq8DvCR3RQBsjY6sykXzauBg6dXdpyYzWKYJEcA
	9P5oL8Y6xqeTBj7KevTf9k4kkUfyb5Rhiow1aSgOyiYwgtEVz/bAKTLfcxkFj4sqiMCH
	7V7mxBwhWO3nfNUlVbYAuCfeB5z5x0cPNtGzLUQnCHKDMNbjO8neaUBxIZ3caHm9vT8i
	EDU1JK/7IJFWiZdZe0z0pORT9XLG/kTdu7sDanJAA1expiKz2o/FLep9c5gijq8apPy9
	YypQ==
X-Gm-Message-State: AKGB3mIVVhUdNADeJ9WxhgmE8At4TQRZAK0uLWm2znbb2CPU0O3Knpae
	yMHqCJOyYZ0zJ+3CbB034cxCr05ynqfdG1AK5PlQ8w==
X-Google-Smtp-Source: AGs4zMYucsWlJACynR0zsfNyAFCHqC8Y5/mJDWPkR4K8xMfGZWUQWbpMVjNBJoq7IRDUnRO7wYe5sHoIi6MFJoMo5Nw=
X-Received: by 10.176.16.67 with SMTP id g3mr5622798uab.109.1512144107922;
	Fri, 01 Dec 2017 08:01:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1512111404.git.dengke.du@windriver.com>
	<43d0b786bf6dc1ae091ddb6c5c590880cadcc6fe.1512111404.git.dengke.du@windriver.com>
	<CAMKF1sq-VPxdRuKcpbvfK74GRnTk5mNwthuYj6S92bXCdPuF3Q@mail.gmail.com>
In-Reply-To: <CAMKF1sq-VPxdRuKcpbvfK74GRnTk5mNwthuYj6S92bXCdPuF3Q@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 01 Dec 2017 16:01:37 +0000
Message-ID: <CANx9H-DT97H1kJDMRzmHQh9CZB5GFw4y-_vj8D8y=ZZ+f1Mmhw@mail.gmail.com>
To: "dengke.du@windriver.com" <dengke.du@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ltp: add runtime depends ltp-staticdev
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
X-List-Received-Date: Fri, 01 Dec 2017 16:01:47 -0000
Content-Type: multipart/alternative; boundary="f403045e1d5866eae8055f497c4f"

--f403045e1d5866eae8055f497c4f
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 1, 2017 at 6:52 AM Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Nov 30, 2017 at 10:58 PM, Dengke Du <dengke.du@windriver.com>
> wrote:
> > The test case nm01 depends on /opt/ltp/testcases/data/nm01/lib.a in
> > ltp-staticdev package.
> >
>
> perhaps its better to create a packaging exception to include this static
> library to be packaged into ${PN}
>
> > Signed-off-by: Dengke Du <dengke.du@windriver.com>
> > ---
> >  meta/recipes-extended/ltp/ltp_20170929.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-extended/ltp/ltp_20170929.bb
> b/meta/recipes-extended/ltp/ltp_20170929.bb
> > index 93a59b3..6fd280c 100644
> > --- a/meta/recipes-extended/ltp/ltp_20170929.bb
> > +++ b/meta/recipes-extended/ltp/ltp_20170929.bb
> > @@ -108,6 +108,7 @@ RDEPENDS_${PN} = "\
> >  FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a
> /opt/ltp/testcases/data/nm01/lib.a"
> >
> >  FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/*
> /opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/*
> /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscripts/*
> /opt/ltp/testcases/open_posix_testsuite/*
> /opt/ltp/testcases/open_posix_testsuite/conformance/*
> /opt/ltp/testcases/open_posix_testsuite/Documentation/*
> /opt/ltp/testcases/open_posix_testsuite/functional/*
> /opt/ltp/testcases/open_posix_testsuite/include/*
> /opt/ltp/testcases/open_posix_testsuite/scripts/*
> /opt/ltp/testcases/open_posix_testsuite/stress/*
> /opt/ltp/testcases/open_posix_testsuite/tools/*"
> > +RDEPENDES_${PN} += "${PN}-staticdev"
>

Typo in RDEPENDS
Please make sure you test patches before submitting. This could not have
worked as intended.

>
> >  # Avoid generated binaries stripping. Otherwise some of the ltp tests
> such as ldd01 & nm01 fails
> >  INHIBIT_PACKAGE_STRIP = "1"
> > --
> > 2.8.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045e1d5866eae8055f497c4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><div class=3D"gmail_quote"><div dir=3D"auto">On Fri, Dec 1, 2017 =
at 6:52 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">On Thu, Nov 30, 2017 at 10:58 PM, Dengke Du &lt;<a href=3D"mailto:dengk=
e.du@windriver.com" target=3D"_blank">dengke.du@windriver.com</a>&gt; wrote=
:<br>
&gt; The test case nm01 depends on /opt/ltp/testcases/data/nm01/lib.a in<br=
>
&gt; ltp-staticdev package.<br>
&gt;<br>
<br>
perhaps its better to create a packaging exception to include this static<b=
r>
library to be packaged into ${PN}<br>
<br>
&gt; Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com=
" target=3D"_blank">dengke.du@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-extended/ltp/<a href=3D"http://ltp_20170929.bb" rel=
=3D"noreferrer" target=3D"_blank">ltp_20170929.bb</a> | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20170929.=
bb" rel=3D"noreferrer" target=3D"_blank">ltp_20170929.bb</a> b/meta/recipes=
-extended/ltp/<a href=3D"http://ltp_20170929.bb" rel=3D"noreferrer" target=
=3D"_blank">ltp_20170929.bb</a><br>
&gt; index 93a59b3..6fd280c 100644<br>
&gt; --- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20170929.bb" rel=
=3D"noreferrer" target=3D"_blank">ltp_20170929.bb</a><br>
&gt; +++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20170929.bb" rel=
=3D"noreferrer" target=3D"_blank">ltp_20170929.bb</a><br>
&gt; @@ -108,6 +108,7 @@ RDEPENDS_${PN} =3D &quot;\<br>
&gt;=C2=A0 FILES_${PN}-staticdev +=3D &quot;/opt/ltp/lib/libmem.a /opt/ltp/=
testcases/data/nm01/lib.a&quot;<br>
&gt;<br>
&gt;=C2=A0 FILES_${PN} +=3D &quot;/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/sc=
enario_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /op=
t/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/test=
cases/open_posix_testsuite/conformance/* /opt/ltp/testcases/open_posix_test=
suite/Documentation/* /opt/ltp/testcases/open_posix_testsuite/functional/* =
/opt/ltp/testcases/open_posix_testsuite/include/* /opt/ltp/testcases/open_p=
osix_testsuite/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /=
opt/ltp/testcases/open_posix_testsuite/tools/*&quot;<br>
&gt; +RDEPENDES_${PN} +=3D &quot;${PN}-staticdev&quot;<br>
</blockquote><div dir=3D"auto"><br></div></div></div></div><div><div><div c=
lass=3D"gmail_quote"><div dir=3D"auto">Typo in RDEPENDS</div><div dir=3D"au=
to">Please make sure you test patches before submitting. This could not hav=
e worked as intended.</div></div></div></div><div><div><div class=3D"gmail_=
quote"><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt;<br>
&gt;=C2=A0 # Avoid generated binaries stripping. Otherwise some of the ltp =
tests such as ldd01 &amp; nm01 fails<br>
&gt;=C2=A0 INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&gt; --<br>
&gt; 2.8.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--f403045e1d5866eae8055f497c4f--
