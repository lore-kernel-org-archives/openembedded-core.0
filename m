Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id A33FD6C129
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 15:24:48 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id a17so13928008qth.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 08:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nWS2Y5R8aZiTaBczn1b7JyUhpi0RUYgoiFjUwbdltI8=;
	b=dIaljj+jVTrCBoSJ2EG+/F+W8DajM4vRyr46TNLG/NK9kP05QxiiwJYaXCyXfl7UgQ
	8ZVsadzIlF7S9zCn/NcIiHpkBmq+cK47NTmPcwgWHAFhNXM997qUdOm44vlQaUMr6ixD
	9cCyoZMgwCexZTCusvbXFGAfl+wp1UnEYhG01Gujt8HYcF/DSGOpPN/eF8HrMv1F0Gga
	ZECIkXSm6c0mEiABOGIGmufMX+jzp2AfVl82OF4ErixuBUCNG8tMEXrAOwunMStfg5Pb
	4lRmtaKwfkdVPaqGNE60BzMBp17Bkz2c3qHdtx/PRu3cZs7O4JcZNh+qddL4s72ADEAU
	JqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nWS2Y5R8aZiTaBczn1b7JyUhpi0RUYgoiFjUwbdltI8=;
	b=ccoSS0kOvDUOvZmrjbAHhspdNmFjJdR2n9Gf2kyWXeFUXSiCgDjqAGf2p4bTKjodYz
	zeU0B0d+IdAqJqMKsS+2mmX3+qcef/mkxGQseM9euddbQnPTDjDptv1K0EFAZvNQIDS6
	oSdap6hPRPaYEWgN0YPe7XUxSCcS7sjVZYKFZhTtzvW2IeKuaK/1OVmUGstfoYqXiEAF
	kXwfgQWLTIbNSqWm7JgSHQrDNgjLHdxKzsEAgAg0nFWACe8ZHMgKrPAj44jrMq+vQK0Q
	UuJMUm2u+J5go+5D2EA7kYwSykSqo4FBQ7sXesg+zK1WQiSI/U6KtdW6h1p4FySNw9RD
	ME4w==
X-Gm-Message-State: APjAAAXlHu5jpvh5xA8VMZUeWLBvH0ztsQyhGbyADr6MRW+DJ5wMMf87
	biUE2mlt1a3N/1vzegcg9ijRQX/HIXLxDfZ7VCs=
X-Google-Smtp-Source: APXvYqzZX8mOXi/8NH7CycqiS+pvDvYavMF7/rmF+bvdtwmGaWNc5eSKmOrqa5s76lCGzeRRRYa4kxbo8avYHlD2miE=
X-Received: by 2002:aed:3827:: with SMTP id j36mr23866418qte.196.1557761089272;
	Mon, 13 May 2019 08:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190509214007.13927-1-luca.boccassi@gmail.com>
	<20190510120932.29765-1-luca.boccassi@gmail.com>
	<CAMKF1spVZzywgp8PE3OuZ+x60tkyXgHCD3QpDfMfkVFefEMZrw@mail.gmail.com>
	<41ac4abea0dd66e99d21bdda69acd08ef81807e7.camel@gmail.com>
In-Reply-To: <41ac4abea0dd66e99d21bdda69acd08ef81807e7.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 May 2019 08:24:38 -0700
Message-ID: <CAMKF1so-_bkEVm7cze8tdy9xhY6PE0H3uWRjEaB1+j02T4eg8g@mail.gmail.com>
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: enable portabled by default
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
X-List-Received-Date: Mon, 13 May 2019 15:24:48 -0000
Content-Type: multipart/alternative; boundary="0000000000005f02430588c684cc"

--0000000000005f02430588c684cc
Content-Type: text/plain; charset="UTF-8"

On Mon, May 13, 2019 at 3:10 AM Luca Boccassi <luca.boccassi@gmail.com>
wrote:

> On Fri, 2019-05-10 at 09:45 -0700, Khem Raj wrote:
> > On Fri, May 10, 2019 at 5:10 AM <
> > luca.boccassi@gmail.com
> > > wrote:
> > > From: Luca Boccassi <
> > > luca.boccassi@microsoft.com
> > > >
> > >
> > > portable services have been declared production ready with v241, so
> > > enable
> > > by default and install the files in the main package.
> > >
> >
> > what is the rationale to enable it by default ?
>
> Hi,
>
> commit ada8a5d9175b disabled it by default because it was experimental:
> "Add a new PACKAGECONFIG item 'portabled'. Default to disable it
> because it's still experimental, according to the announcement letter."
>
> Now it's been declared as stable by upstream, and also given machined
> and nspawn are enabled by default I don't see a reason why this
> shouldn't be as well, as they all provide the same "kind" of
> feature/functionality, albeit on a different level.
>

Ok being stable is a good thing I agree but I still fail to understand why
make it default I am for disabling nspawn and machined as well

>
> > > Signed-off-by: Luca Boccassi <
> > > luca.boccassi@microsoft.com
> > > >
> > > ---
> > > v2: Just enable by default, and let the files be installed in the
> > > main package
> > >     as requested by reviewers.
> > >
> > >  meta/recipes-core/systemd/systemd_242.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/recipes-core/systemd/systemd_242.bb
> > > b/meta/recipes-core/systemd/systemd_242.bb
> > > index 73e03c7a77..f15d125bf8 100644
> > > --- a/meta/recipes-core/systemd/systemd_242.bb
> > > +++ b/meta/recipes-core/systemd/systemd_242.bb
> > > @@ -81,6 +81,7 @@ PACKAGECONFIG ??= " \
> > >      nss \
> > >      nss-mymachines \
> > >      nss-resolve \
> > > +    portabled \
> > >      quotacheck \
> > >      randomseed \
> > >      resolved \
> > > --
> > > 2.20.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > >
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> --
> Kind regards,
> Luca Boccassi
>
>

--0000000000005f02430588c684cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, May 13, 2019 at 3:10 AM Luca Boccassi &lt;<a href=
=3D"mailto:luca.boccassi@gmail.com">luca.boccassi@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">On Fri, 2019-05-10 at 09:45 -0700, =
Khem Raj wrote:<br>
&gt; On Fri, May 10, 2019 at 5:10 AM &lt;<br>
&gt; <a href=3D"mailto:luca.boccassi@gmail.com" target=3D"_blank">luca.bocc=
assi@gmail.com</a><br>
&gt; &gt; wrote:<br>
&gt; &gt; From: Luca Boccassi &lt;<br>
&gt; &gt; <a href=3D"mailto:luca.boccassi@microsoft.com" target=3D"_blank">=
luca.boccassi@microsoft.com</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt; portable services have been declared production ready with v241, =
so<br>
&gt; &gt; enable<br>
&gt; &gt; by default and install the files in the main package.<br>
&gt; &gt; <br>
&gt; <br>
&gt; what is the rationale to enable it by default ?<br>
<br>
Hi,<br>
<br>
commit ada8a5d9175b disabled it by default because it was experimental:<br>
&quot;Add a new PACKAGECONFIG item &#39;portabled&#39;. Default to disable =
it<br>
because it&#39;s still experimental, according to the announcement letter.&=
quot;<br>
<br>
Now it&#39;s been declared as stable by upstream, and also given machined<b=
r>
and nspawn are enabled by default I don&#39;t see a reason why this<br>
shouldn&#39;t be as well, as they all provide the same &quot;kind&quot; of<=
br>
feature/functionality, albeit on a different level.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ok being stable =
is a good thing I agree but I still fail to understand why make it default =
I am for disabling nspawn and machined as well=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
&gt; &gt; Signed-off-by: Luca Boccassi &lt;<br>
&gt; &gt; <a href=3D"mailto:luca.boccassi@microsoft.com" target=3D"_blank">=
luca.boccassi@microsoft.com</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt; v2: Just enable by default, and let the files be installed in the=
<br>
&gt; &gt; main package<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0as requested by reviewers.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://systemd_242.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_242.bb</a> | 1 +<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_=
242.bb" rel=3D"noreferrer" target=3D"_blank">systemd_242.bb</a><br>
&gt; &gt; b/meta/recipes-core/systemd/<a href=3D"http://systemd_242.bb" rel=
=3D"noreferrer" target=3D"_blank">systemd_242.bb</a><br>
&gt; &gt; index 73e03c7a77..f15d125bf8 100644<br>
&gt; &gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_242.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_242.bb</a><br>
&gt; &gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_242.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_242.bb</a><br>
&gt; &gt; @@ -81,6 +81,7 @@ PACKAGECONFIG ??=3D &quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 nss \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 nss-mymachines \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 nss-resolve \<br>
&gt; &gt; +=C2=A0 =C2=A0 portabled \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 quotacheck \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 randomseed \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 resolved \<br>
&gt; &gt; --<br>
&gt; &gt; 2.20.1<br>
&gt; &gt; <br>
&gt; &gt; --<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.=
org/mailman/listinfo/openembedded-core</a><br>
&gt; &gt; <br>
-- <br>
Kind regards,<br>
Luca Boccassi<br>
<br>
</blockquote></div></div>

--0000000000005f02430588c684cc--
