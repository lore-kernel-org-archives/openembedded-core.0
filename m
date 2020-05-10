Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web11.20231.1589136251246910619
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2020 11:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D0lBRtdR;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id x5so900744ioh.6
        for <openembedded-core@lists.openembedded.org>; Sun, 10 May 2020 11:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=afOEmycRVoqJbz93LhygN3Mwl1frt+z1Mw+v4ubufno=;
        b=D0lBRtdRuA+L9CO810OfRhhNkanjk2cioxqBzIu0jbFae9Zej61XjMEzeA9rZ5nQVe
         c6fcH/ge3I/Bnzyw1gS7VWQvOayLbGP3lLViW99f1TBSGvTixNvHqKZ0RGdf+ttlvFjc
         Xrj1ymfRPgQVzxAOBUfCpmL+/pm5bGXTmbRVCUPsBB7dlPkNZMmc9uEYGpfuBkSOWHQg
         GCwF3Re6jeEPfo/PpucCGMCYX2QLKClH0ym/+4AN7cAEmKLVRwxzDHWB7Cwm1oKtWcVv
         RkRkpSPPgZTdg2wFFQZv+xV927xVa5SsgH2By0PLLnblLG35iQnyDZQ9kzcJzCyzt2NH
         0hXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=afOEmycRVoqJbz93LhygN3Mwl1frt+z1Mw+v4ubufno=;
        b=Exh9bdjkieQ7wWiccS6cHKbeci1qszQVoxzrBcqQkTBeOKErf+D8c73dwQGK9kqfAJ
         9ldH8UcxkbjutEJpEhvZ7++AgsJ1H7xRyov3gtuto/XGY5Uw73VRnXftwX4sid0HOYZc
         XKgT+5qlOgjK1PVN0mvf/igxwoTa/1QMA6hDQ55yzh+OXJZEDWLT7EPaspVa5U99qyaR
         qMeJg57Lrvqqzg2gnw9mP1W17UmRx8q5PAxgcpWXkdhhzq/2S6uGQtdZCH2LESq/X6vF
         NG6xMXx2i/HBtfxeKNAIE9/RBQ2BUZHxXx+ZBu8LVfFCiFkrsslu1dKR2BgXrAsUOys5
         zC6w==
X-Gm-Message-State: AGi0PuadjDYW1wsjragpb/gB3i1O7cbl1zJF8eR5eG6daIdXbtTHZx2I
	CKiCObdu3F4u6wNDpZ9Mwohb37iUryeFdmZCWms=
X-Google-Smtp-Source: APiQypJEH326jyqrTsz0FeOMgPevB7fCi+H7aFqXMBYfRMSi2F9OFv5Ao6ZxucWnSoJfaxM3s5nSesT2e/Gk7cXS+ww=
X-Received: by 2002:a05:6638:109:: with SMTP id x9mr12287249jao.10.1589136250633;
 Sun, 10 May 2020 11:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <AM7PR05MB68810C07AC538B986CE47C92A8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <160D7887899C970D.32017@lists.openembedded.org> <CANx9H-CiaTE9ahgRUZO3dU43RBn4AmOKoJ_0Nwk6ph=Be3J0kw@mail.gmail.com>
 <20200510184055.GF11927@denix.org>
In-Reply-To: <20200510184055.GF11927@denix.org>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Sun, 10 May 2020 11:43:59 -0700
Message-ID: <CANx9H-DDTDXZQcw0A8JkVNS-4Hdsniybgss77_M+20DW4cXtjQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] pypi.bbclass: mind package suffix on version check
To: Denys Dmytriyenko <denis@denix.org>
Cc: Armin Kuster <akuster808@gmail.com>, "Mittal, Anuj" <anuj.mittal@intel.com>, 
	Steve Sakoman <steve@sakoman.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b8008005a54f9db3"

--000000000000b8008005a54f9db3
Content-Type: text/plain; charset="UTF-8"

On Sun, May 10, 2020 at 11:41 AM Denys Dmytriyenko <denis@denix.org> wrote:

> On Sat, May 09, 2020 at 02:29:09PM -0700, Tim Orling wrote:
> > This is a candidate for backport to stable once it lands in master.
>
> How so?
>

It fixes a bug in upgrade check. For users that are on stable releases, who
might be maintaining their own python packages, they will be affected by
this.


>
> > On Sat, May 9, 2020 at 2:12 PM Tim Orling via lists.openembedded.org
> > <ticotimo=gmail.com@lists.openembedded.org> wrote:
> >
> > > This version looks good.
> > >
> > > On Sat, May 9, 2020 at 1:33 PM Konrad Weihmann <kweihmann@outlook.com>
> > > wrote:
> > >
> > >> Some pypi packages do have suffixes like dev, or a0 or b1.
> > >> When doing a version check on these, the version will get falsely
> > >> identified as major release versions.
> > >> Add a terminating slash to rule out those false positives
> > >>
> > >> Changes v2:
> > >>
> > >> - ignore suffix versions instead of reporting them
> > >>
> > >> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> > >>
> > >
> > > Reviewed-by: Tim Orling <ticotimo@gmail.com>
> > >
> > > ---
> > >>  meta/classes/pypi.bbclass | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
> > >> index e5d7ab3ce1..ffa8aa3ff4 100644
> > >> --- a/meta/classes/pypi.bbclass
> > >> +++ b/meta/classes/pypi.bbclass
> > >> @@ -23,4 +23,4 @@ SRC_URI += "${PYPI_SRC_URI}"
> > >>  S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
> > >>
> > >>  UPSTREAM_CHECK_URI ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/
> "
> > >> -UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
> > >> +UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
> > >> --
> > >> 2.20.1
> > >>
> > >>
> > >>
> > >
>
> > 
>
>

--000000000000b8008005a54f9db3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, May 10, 2020 at 11:41 AM Denys Dmytriyenko &lt;<a =
href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On Sat, May 09, 2020 at 02:29:09PM -0700, Tim O=
rling wrote:<br>
&gt; This is a candidate for backport to stable once it lands in master.<b=
r>
<br>
How so?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">It fixes a bug =
in upgrade check. For users that are on stable releases, who might be maint=
aining their own python packages, they will be affected by this.</div><div =
dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
&gt; On Sat, May 9, 2020 at 2:12 PM Tim Orling via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a><br>
&gt; &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" ta=
rget=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; This version looks good.<br>
&gt; &gt;<br>
&gt; &gt; On Sat, May 9, 2020 at 1:33 PM Konrad Weihmann &lt;<a href=3D"ma=
ilto:kweihmann@outlook.com" target=3D"_blank">kweihmann@outlook.com</a>&gt;=
<br>
&gt; &gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; Some pypi packages do have suffixes like dev, or a0 or b1.<b=
r>
&gt; &gt;&gt; When doing a version check on these, the version will get fa=
lsely<br>
&gt; &gt;&gt; identified as major release versions.<br>
&gt; &gt;&gt; Add a terminating slash to rule out those false positives<br=
>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Changes v2:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; - ignore suffix versions instead of reporting them<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Konrad Weihmann &lt;<a href=3D"mailto:kweihma=
nn@outlook.com" target=3D"_blank">kweihmann@outlook.com</a>&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; Reviewed-by: Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com=
" target=3D"_blank">ticotimo@gmail.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&gt;=C2=A0 meta/classes/pypi.bbclass | 2 +-<br>
&gt; &gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.b=
bclass<br>
&gt; &gt;&gt; index e5d7ab3ce1..ffa8aa3ff4 100644<br>
&gt; &gt;&gt; --- a/meta/classes/pypi.bbclass<br>
&gt; &gt;&gt; +++ b/meta/classes/pypi.bbclass<br>
&gt; &gt;&gt; @@ -23,4 +23,4 @@ SRC_URI +=3D &quot;${PYPI_SRC_URI}&quot;<b=
r>
&gt; &gt;&gt;=C2=A0 S =3D &quot;${WORKDIR}/${PYPI_PACKAGE}-${PV}&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 UPSTREAM_CHECK_URI ?=3D &quot;<a href=3D"https://pypi.=
python.org/pypi/$%7BPYPI_PACKAGE%7D/" rel=3D"noreferrer" target=3D"_blank">=
https://pypi.python.org/pypi/${PYPI_PACKAGE}/</a>&quot;<br>
&gt; &gt;&gt; -UPSTREAM_CHECK_REGEX ?=3D &quot;/${PYPI_PACKAGE}/(?P&lt;pve=
r&gt;(\d+[\.\-_]*)+)&quot;<br>
&gt; &gt;&gt; +UPSTREAM_CHECK_REGEX ?=3D &quot;/${PYPI_PACKAGE}/(?P&lt;pve=
r&gt;(\d+[\.\-_]*)+)/&quot;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.20.1<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; <br>
&gt; &gt;<br>
<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000b8008005a54f9db3--
