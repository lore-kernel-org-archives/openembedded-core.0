Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B033C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 12:48:20 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.12507.1673009291922762754
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 04:48:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tf32I34z;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id g14so1351030ljh.10
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 04:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4Y8pg9spqEmLuY1u51TxS1cbQbAUszFDvmB696GVKik=;
        b=Tf32I34zxjH91xLa91FBPYEzYCIlvDFcEA8CI8ZrSF9iY28QF+itsSNHOXcU61BiiP
         LYN5R1pAaIhj4P41ZWRJPKgVsrIwPxt0Ngkz4XDfBkafxkjZCxOky04ztiNQH0kl+1ip
         pcvGDNJICu5yMadXlPLnSNFXS8jJtX21i7CyYcsaRlCy3miUK/7AAeNsw6L4NcKCSWew
         dOrvpLIDIGTy3CT/1XKN9w9KvtEi6BNbwEp2au/GawDdBTZzrnbGZLjCaPXpgrs+JHKv
         OU5r2xQdsQ/8//I0wXEzwj7x3e2cnhsJDEPrGDoKJSuen5A4RIUcoHGN7G9Kir7cbsYA
         nLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Y8pg9spqEmLuY1u51TxS1cbQbAUszFDvmB696GVKik=;
        b=CUDSwtzrR1j3qL4cpH2i98I+2TsLXJrWcU1BgJfRf6PPhNr0qyZACkYQvxRk0eoSej
         cY4941VY66nAsXMbiDwNsfQGTQzHMYqC+bHo50XlEYhvBFaBarF21GVH34TM63OwfIGa
         2hXmlEBUckd1Ky3wJ2z8sLqTi20dHORRP38oZ+Q1csiNmTcnaEI1l19J7BThtO0UU0Gz
         +H8SabjExUfzxISGZ/IS4yQDqAlpJVsRA5EEScfdEV9I15eBQs7XCphyrxLKvsp355Bv
         dvOLeMU1R0/KEfP9Xfk+N5Mf9pWc6S/p+rdGahrx9anulvdaRIwzghBbfcCQ6VIqi8bG
         3lIw==
X-Gm-Message-State: AFqh2kqZH4+7k0BHb8Fx6dReDRPd08dllQ3E29bRwP1duYCw1Ix7TkvR
	ozgSUM+xuI9f5OZpgcRNgGDgBnYkkrMqgFy502E=
X-Google-Smtp-Source: AMrXdXuB+RkcWPyvnfTsYj81+Hd1RvjbjGAxCtQjyGFwd5v6R8h4nssjwtitZE37GK6RbUP7wZtegrUHSz/kwMCyzmQ=
X-Received: by 2002:a05:651c:1426:b0:27f:dea6:3d2a with SMTP id
 u38-20020a05651c142600b0027fdea63d2amr2191204lje.45.1673009290026; Fri, 06
 Jan 2023 04:48:10 -0800 (PST)
MIME-Version: 1.0
References: <20230104110548.2537259-1-alex@linutronix.de> <20230104110548.2537259-12-alex@linutronix.de>
 <473700d6582fd2575030df7fdbf224d36ed9164b.camel@linuxfoundation.org>
In-Reply-To: <473700d6582fd2575030df7fdbf224d36ed9164b.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Jan 2023 13:47:58 +0100
Message-ID: <CANNYZj_v4Hk2EBQWd=18y3hUbFFuYtBuUg+BymgqRx9sZJs7yA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 12/77] man-pages: upgrade 6.01 -> 6.02
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000070224605f197d47e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 12:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175585

--00000000000070224605f197d47e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri 6. Jan 2023 at 13.05, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2023-01-04 at 12:04 +0100, Alexander Kanavin wrote:
> > License-Update: readme rewritten, set of licenses provided explicitly.
> >
> > Of those, there's various bsd flavours, gpl2-and-later and gpl-2-only,
> so add the
> > latter.
>
> That does mean I have to ask whether the BSD licenses are missing from
> LICENSE and should be added too?


They should, yes. I=E2=80=99ll resend. The idea was that gpl + bsd =3D gpl,=
 but not
when pieces are individually installed.

Alex



>
> Cheers,
>
> Richard
>
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  .../man-pages/{man-pages_6.01.bb =3D> man-pages_6.02.bb}      | 6 +++-=
--
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta/recipes-extended/man-pages/{man-pages_6.01.bb =3D>
> man-pages_6.02.bb} (83%)
> >
> > diff --git a/meta/recipes-extended/man-pages/man-pages_6.01.bb
> b/meta/recipes-extended/man-pages/man-pages_6.02.bb
> > similarity index 83%
> > rename from meta/recipes-extended/man-pages/man-pages_6.01.bb
> > rename to meta/recipes-extended/man-pages/man-pages_6.02.bb
> > index 1ad4ed1317..2e574e1de4 100644
> > --- a/meta/recipes-extended/man-pages/man-pages_6.01.bb
> > +++ b/meta/recipes-extended/man-pages/man-pages_6.02.bb
> > @@ -2,12 +2,12 @@ SUMMARY =3D "Linux man-pages"
> >  DESCRIPTION =3D "The Linux man-pages project documents the Linux kerne=
l
> and C library interfaces that are employed by user programs"
> >  SECTION =3D "console/utils"
> >  HOMEPAGE =3D "http://www.kernel.org/pub/linux/docs/man-pages"
> > -LICENSE =3D "GPL-2.0-or-later"
> > +LICENSE =3D "GPL-2.0-or-later & GPL-2.0-only"
> >
> > -LIC_FILES_CHKSUM =3D "file://README;md5=3Dbf1faa9b0245e39a7c0c9690ffdf=
6e54"
> > +LIC_FILES_CHKSUM =3D "file://README;md5=3D26901408d8cfd6f6675f8b49daf9=
cc74"
> >  SRC_URI =3D "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
> >
> > -SRC_URI[sha256sum] =3D
> "c1e8bea88589f1a80b67dafd82fb98b018ddd7f7bfa594f8f79686258d26e784"
> > +SRC_URI[sha256sum] =3D
> "968def9e7055c9cbca9a4f21f79677b02ac8b0d2fa62ceea7bd8ef4dcc6cac41"
> >
> >  inherit manpages
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#175398):
> https://lists.openembedded.org/g/openembedded-core/message/175398
> > Mute This Topic: https://lists.openembedded.org/mt/96047880/1686473
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> richard.purdie@linuxfoundation.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--00000000000070224605f197d47e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri 6. Jan 2023 at 13.05, Richard Purdie &lt;<a href=3D"mailto:rich=
ard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; =
wrote:<br></div><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Wed, 20=
23-01-04 at 12:04 +0100, Alexander Kanavin wrote:<br>
&gt; License-Update: readme rewritten, set of licenses provided explicitly.=
<br>
&gt; <br>
&gt; Of those, there&#39;s various bsd flavours, gpl2-and-later and gpl-2-o=
nly, so add the<br>
&gt; latter.<br>
<br>
That does mean I have to ask whether the BSD licenses are missing from<br>
LICENSE and should be added too?</blockquote><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">They should, yes. I=E2=80=99ll resend. The idea was that gp=
l + bsd =3D gpl, but not when pieces are individually installed.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padd=
ing-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br><br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../man-pages/{<a href=3D"http://man-pages_6.01.bb" rel=3D"noref=
errer" target=3D"_blank">man-pages_6.01.bb</a> =3D&gt; <a href=3D"http://ma=
n-pages_6.02.bb" rel=3D"noreferrer" target=3D"_blank">man-pages_6.02.bb</a>=
}=C2=A0 =C2=A0 =C2=A0 | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-extended/man-pages/{<a href=3D"http://man-pa=
ges_6.01.bb" rel=3D"noreferrer" target=3D"_blank">man-pages_6.01.bb</a> =3D=
&gt; <a href=3D"http://man-pages_6.02.bb" rel=3D"noreferrer" target=3D"_bla=
nk">man-pages_6.02.bb</a>} (83%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-extended/man-pages/<a href=3D"http://man-pag=
es_6.01.bb" rel=3D"noreferrer" target=3D"_blank">man-pages_6.01.bb</a> b/me=
ta/recipes-extended/man-pages/<a href=3D"http://man-pages_6.02.bb" rel=3D"n=
oreferrer" target=3D"_blank">man-pages_6.02.bb</a><br>
&gt; similarity index 83%<br>
&gt; rename from meta/recipes-extended/man-pages/<a href=3D"http://man-page=
s_6.01.bb" rel=3D"noreferrer" target=3D"_blank">man-pages_6.01.bb</a><br>
&gt; rename to meta/recipes-extended/man-pages/<a href=3D"http://man-pages_=
6.02.bb" rel=3D"noreferrer" target=3D"_blank">man-pages_6.02.bb</a><br>
&gt; index 1ad4ed1317..2e574e1de4 100644<br>
&gt; --- a/meta/recipes-extended/man-pages/<a href=3D"http://man-pages_6.01=
.bb" rel=3D"noreferrer" target=3D"_blank">man-pages_6.01.bb</a><br>
&gt; +++ b/meta/recipes-extended/man-pages/<a href=3D"http://man-pages_6.02=
.bb" rel=3D"noreferrer" target=3D"_blank">man-pages_6.02.bb</a><br>
&gt; @@ -2,12 +2,12 @@ SUMMARY =3D &quot;Linux man-pages&quot;<br>
&gt;=C2=A0 DESCRIPTION =3D &quot;The Linux man-pages project documents the =
Linux kernel and C library interfaces that are employed by user programs&qu=
ot;<br>
&gt;=C2=A0 SECTION =3D &quot;console/utils&quot;<br>
&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"http://www.kernel.org/pub/linux/do=
cs/man-pages" rel=3D"noreferrer" target=3D"_blank">http://www.kernel.org/pu=
b/linux/docs/man-pages</a>&quot;<br>
&gt; -LICENSE =3D &quot;GPL-2.0-or-later&quot;<br>
&gt; +LICENSE =3D &quot;GPL-2.0-or-later &amp; GPL-2.0-only&quot;<br>
&gt;=C2=A0 <br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://README;md5=3Dbf1faa9b0245e39a7c0c96=
90ffdf6e54&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://README;md5=3D26901408d8cfd6f6675f8b=
49daf9cc74&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.ta=
r.gz&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI[sha256sum] =3D &quot;c1e8bea88589f1a80b67dafd82fb98b018ddd7f7=
bfa594f8f79686258d26e784&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;968def9e7055c9cbca9a4f21f79677b02ac8b0d2=
fa62ceea7bd8ef4dcc6cac41&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit manpages<br>
&gt;=C2=A0 <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#175398): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/175398" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/175398</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96047880=
/1686473" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/96047880/1686473</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>]<br=
>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000070224605f197d47e--

