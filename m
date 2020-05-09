Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web11.6325.1589011394137996788
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 01:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c5FH6nR8;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id i5so1560841uaq.1
        for <openembedded-core@lists.openembedded.org>; Sat, 09 May 2020 01:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fhE6tAOqcu2wFNenEbSW+rssTSGlw42fBqQRdrrHU5E=;
        b=c5FH6nR8SGTJZvSOQN2lEc7AGbGK+pizGS1WfmVOPegZnpltuuSrEvX5iHkI05OR3y
         SB8lzH6W60LJNAeNAwc0fKwhVPEtWkYnqZxfWRFTxe+QGKl8j2fcBCoDVDSYI9S1EELD
         ryUeunOrnB8u9SkYRUahUmDpUm4vvz5Tf0lBFMUuWFdjToSzxk8fUd6Uhpew4XRBT1n2
         MBBvFo/ffrtnjjDei8DJ/GNcUrcJ7fqRixKp9KRHXMCElhp9LdSo18ca567cm6zzQpbN
         WMTc4DveIrcK0Ieamaf26KYQeij+MjfF1aSZaMnfUJqPP7Q2iut91dXbcE6yfMTY00G4
         NXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fhE6tAOqcu2wFNenEbSW+rssTSGlw42fBqQRdrrHU5E=;
        b=fvnuuz/ZWE4AdxRCaABRWLozvhPTWZ2v/ctfnWCkeweNRenLHExXUR0EE6fRAjMfck
         NdP1uLjBKpV6TTue0hlukAun7juBumFZECACjo2hq9Un//dUkDAj0htHZvXVotzyNgJC
         Q8OKSKSi4682C+K56SiySkceRps6ykiASR5V7mA1MnRf+oyvr9Su4T6FJqbWshpO0/Lu
         XVRJoeaLGe/XWQeRD3lAxoGPBxDCgCVGt44dFRLMpS8/nTIftZ2TjCB0WQuWjohqIFwY
         MLFdCISidyvLUu+q76l/Fmw0GHxcKWhaJ4zASt7j5Y1QgSqC+LsO5P4DEiV3LWbQ8Nh1
         Nw+Q==
X-Gm-Message-State: AGi0PuZCTzBxqChFoi4NHxrMPnCYpu/xXdID/PE3Xusk0YC63fiDesr8
	+9Diwf7tPVc/HYNHEdmgjV1q/rAHOpU3oEGSE/8=
X-Google-Smtp-Source: APiQypKjQ8sAuIi7lIwKtLmsoXLjrkgNi0/Bmr39DZdvfh/ACVW/5ZfPGj06/lpAdUNsvwuwL41vsOGUJFRvccp4CyQ=
X-Received: by 2002:ab0:6313:: with SMTP id a19mr4980709uap.71.1589011393287;
 Sat, 09 May 2020 01:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <AM7PR05MB6881F29B1FAD006F027D07FEA8A20@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <CANx9H-CQXEyXOU4o4x=Y_Hn-BgeK95C5cSAm4kJT59gYfSfK5g@mail.gmail.com>
 <PR3PR05MB6890A8531A904349FDA2EDD5A8A30@PR3PR05MB6890.eurprd05.prod.outlook.com>
 <CANNYZj9=6NLFgbPhVDWdCL1uKmEGLcF25uq17-mOkByq6VJVhA@mail.gmail.com> <AM7PR05MB6881D5974DC228C3A78A0F2BA8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
In-Reply-To: <AM7PR05MB6881D5974DC228C3A78A0F2BA8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 9 May 2020 10:03:01 +0200
Message-ID: <CANNYZj-Gs0xH49tttypiJQMhz=OVf0Fd7mRBkP800vk9URWt9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pypi.bbclass: mind package suffix on version check
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Tim Orling <ticotimo@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a4180805a5328b0e"

--000000000000a4180805a5328b0e
Content-Type: text/plain; charset="UTF-8"

Then maybe appending a / to the regex will do?

Alex

On Sat, 9 May 2020 at 09:45, Konrad Weihmann <kweihmann@outlook.com> wrote:

> Well, I faced that at least on the following packages
>
> - flake8 (current stable 3.7.9, existing alphas 3.8.0a1, 3.8.0a2)
> - markupsafe (current stable 1.1.1, existing alphas 2.0.0a1)
>
>
> On 09.05.20 09:38, Alexander Kanavin wrote:
> > Can you give specific examples please? I think we can probably add \.tar
> > to the end of the existing regex, which will ensure there are no
> > unwanted suffixes. This is already done in plenty of recipes for the
> > same reason.
> >
> > Alex
> >
> > On Sat, 9 May 2020 at 08:55, Konrad Weihmann <kweihmann@outlook.com
> > <mailto:kweihmann@outlook.com>> wrote:
> >
> >     Fully support that, it's same for me.
> >     But then the regex is also not a 100% correct, as it will issue a
> >     notification via "devtool check-upgrade-status", even for an alpha or
> >     beta or dev release - and most important without the suffix, so it's
> >     extra hard to identify if one should take action or not.
> >
> >     And even when using the "devtool upgrade" patch it will run a build
> >     attempt, which will immediately fail, as the reported version is
> >     present, due to the suffix being trimmed during the process.
> >
> >     What I could imagine is to ignore those releases by default using an
> >     inverted group like (?P<pver>(\d+[\.\-_]*)+(?![a-z0-9]+)*) to filter
> >     out
> >     those kind of releases.
> >
> >     What do you think?
> >
> >     On 09.05.20 06:56, Tim Orling wrote:
> >      > We should only be updating to releases, not dev or alpha or any
> >     other
> >      > non-released state. That is why the regex is they way it is.
> >      >
> >      > On Fri, May 8, 2020 at 4:37 AM Konrad Weihmann
> >     <kweihmann@outlook.com <mailto:kweihmann@outlook.com>
> >      > <mailto:kweihmann@outlook.com <mailto:kweihmann@outlook.com>>>
> wrote:
> >      >
> >      >     Some pypi packages do have suffixes like dev, or a0 or b1.
> >      >     When doing a version check on these, the version will get
> falsely
> >      >     trimmed down to a version without the suffix.
> >      >
> >      >     E.g. 3.8.0a1 will become 3.8.0 which then also means that
> >      >     a version upgrade from 3.8.0a1 to 3.8.0a2 will not be
> detected.
> >      >
> >      >     Fix that by inserting an optional suffix group with
> alphanumeric
> >      >     charset.
> >      >
> >      >     Signed-off-by: Konrad Weihmann <kweihmann@outlook.com
> >     <mailto:kweihmann@outlook.com>
> >      >     <mailto:kweihmann@outlook.com <mailto:kweihmann@outlook.com
> >>>
> >      >     ---
> >      >       meta/classes/pypi.bbclass | 2 +-
> >      >       1 file changed, 1 insertion(+), 1 deletion(-)
> >      >
> >      >     diff --git a/meta/classes/pypi.bbclass
> >     b/meta/classes/pypi.bbclass
> >      >     index e5d7ab3ce1..7d0f367a02 100644
> >      >     --- a/meta/classes/pypi.bbclass
> >      >     +++ b/meta/classes/pypi.bbclass
> >      >     @@ -23,4 +23,4 @@ SRC_URI += "${PYPI_SRC_URI}"
> >      >       S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
> >      >
> >      >       UPSTREAM_CHECK_URI ?=
> >      >     "https://pypi.python.org/pypi/${PYPI_PACKAGE}/
> >     <https://pypi.python.org/pypi/$%7BPYPI_PACKAGE%7D/>
> >      >     <https://pypi.python.org/pypi/$%7BPYPI_PACKAGE%7D/>"
> >      >     -UPSTREAM_CHECK_REGEX ?=
> >     "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
> >      >     +UPSTREAM_CHECK_REGEX ?=
> >      >     "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+[a-z0-9]*)"
> >      >     --
> >      >     2.20.1
> >      >
> >      >
> >      >
> >     
> >
>

--000000000000a4180805a5328b0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Then maybe appending a / to the regex will do?</div><=
div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Sat, 9 May 2020 at 09:45, Konrad Weihma=
nn &lt;<a href=3D"mailto:kweihmann@outlook.com">kweihmann@outlook.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Well, =
I faced that at least on the following packages<br>
<br>
- flake8 (current stable 3.7.9, existing alphas 3.8.0a1, 3.8.0a2)<br>
- markupsafe (current stable 1.1.1, existing alphas 2.0.0a1)<br>
<br>
<br>
On 09.05.20 09:38, Alexander Kanavin wrote:<br>
&gt; Can you give specific examples please? I think we can probably add \.=
tar <br>
&gt; to the end of the existing regex, which will ensure there are no <br>
&gt; unwanted suffixes. This is already done in plenty of recipes for the =
<br>
&gt; same reason.<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt; On Sat, 9 May 2020 at 08:55, Konrad Weihmann &lt;<a href=3D"mailto:kw=
eihmann@outlook.com" target=3D"_blank">kweihmann@outlook.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:kweihmann@outlook.com" target=3D"_blank"=
>kweihmann@outlook.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Fully support that, it&#39;s same for me.<br>
&gt;=C2=A0 =C2=A0 =C2=A0But then the regex is also not a 100% correct, as =
it will issue a<br>
&gt;=C2=A0 =C2=A0 =C2=A0notification via &quot;devtool check-upgrade-statu=
s&quot;, even for an alpha or<br>
&gt;=C2=A0 =C2=A0 =C2=A0beta or dev release - and most important without t=
he suffix, so it&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0extra hard to identify if one should take action o=
r not.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0And even when using the &quot;devtool upgrade&quot=
; patch it will run a build<br>
&gt;=C2=A0 =C2=A0 =C2=A0attempt, which will immediately fail, as the repor=
ted version is<br>
&gt;=C2=A0 =C2=A0 =C2=A0present, due to the suffix being trimmed during th=
e process.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0What I could imagine is to ignore those releases b=
y default using an<br>
&gt;=C2=A0 =C2=A0 =C2=A0inverted group like (?P&lt;pver&gt;(\d+[\.\-_]*)+(=
?![a-z0-9]+)*) to filter<br>
&gt;=C2=A0 =C2=A0 =C2=A0out<br>
&gt;=C2=A0 =C2=A0 =C2=A0those kind of releases.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0What do you think?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 09.05.20 06:56, Tim Orling wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; We should only be updating to releases, not =
dev or alpha or any<br>
&gt;=C2=A0 =C2=A0 =C2=A0other<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; non-released state. That is why the regex is=
 they way it is.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Fri, May 8, 2020 at 4:37 AM Konrad Weihma=
nn<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:kweihmann@outlook.com" targe=
t=3D"_blank">kweihmann@outlook.com</a> &lt;mailto:<a href=3D"mailto:kweihma=
nn@outlook.com" target=3D"_blank">kweihmann@outlook.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"mailto:kweihmann@outlo=
ok.com" target=3D"_blank">kweihmann@outlook.com</a> &lt;mailto:<a href=3D"m=
ailto:kweihmann@outlook.com" target=3D"_blank">kweihmann@outlook.com</a>&gt=
;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Some pypi packages do hav=
e suffixes like dev, or a0 or b1.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0When doing a version chec=
k on these, the version will get falsely<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0trimmed down to a version=
 without the suffix.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0E.g. 3.8.0a1 will become =
3.8.0 which then also means that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0a version upgrade from 3.=
8.0a1 to 3.8.0a2 will not be detected.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Fix that by inserting an =
optional suffix group with alphanumeric<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0charset.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Konrad Wei=
hmann &lt;<a href=3D"mailto:kweihmann@outlook.com" target=3D"_blank">kweihm=
ann@outlook.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:kweihmann@outlook.com=
" target=3D"_blank">kweihmann@outlook.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mai=
lto:kweihmann@outlook.com" target=3D"_blank">kweihmann@outlook.com</a> &lt;=
mailto:<a href=3D"mailto:kweihmann@outlook.com" target=3D"_blank">kweihmann=
@outlook.com</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meta/classes/pypi.=
bbclass | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 1 =
insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/classes=
/pypi.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/classes/pypi.bbclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0index e5d7ab3ce1..7d0f367=
a02 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/classes/pypi.b=
bclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/classes/pypi.b=
bclass<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0@@ -23,4 +23,4 @@ SRC_URI=
 +=3D &quot;${PYPI_SRC_URI}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0S =3D &quot;${WORK=
DIR}/${PYPI_PACKAGE}-${PV}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0UPSTREAM_CHECK_URI=
 ?=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"https://=
pypi.python.org/pypi/$%7BPYPI_PACKAGE%7D/" rel=3D"noreferrer" target=3D"_bl=
ank">https://pypi.python.org/pypi/${PYPI_PACKAGE}/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://pypi.python.org/pypi/$%7BPY=
PI_PACKAGE%7D/" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.or=
g/pypi/$%7BPYPI_PACKAGE%7D/</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://py=
pi.python.org/pypi/$%7BPYPI_PACKAGE%7D/" rel=3D"noreferrer" target=3D"_blan=
k">https://pypi.python.org/pypi/$%7BPYPI_PACKAGE%7D/</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0-UPSTREAM_CHECK_REGEX ?=
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;/${PYPI_PACKAGE}/(?P&lt;pver&gt;(\d+[\.\-_]*=
)+)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+UPSTREAM_CHECK_REGEX ?=
=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0&quot;/${PYPI_PACKAGE}/(?=
P&lt;pver&gt;(\d+[\.\-_]*)+[a-z0-9]*)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A02.20.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; <br>
</blockquote></div>

--000000000000a4180805a5328b0e--
