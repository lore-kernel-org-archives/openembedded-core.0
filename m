Return-Path: <florin.diaconescu009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EB7C54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 21:16:07 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.2700.1663708564227647161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 14:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YpX7f4fW;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: florin.diaconescu009@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 i203-20020a1c3bd4000000b003b3df9a5ecbso7800551wma.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 14:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=eyltaocuzsab+ph5DU/CCSlWf2RHb1MPu4C8m1/H2kw=;
        b=YpX7f4fWTQG35rFt/hc77q+GpowNzcF/6+87CW55nNMqWGebouXFNoJdVWacdOzYOc
         OnfnFNV7aJCRKcSyJKEgpz6cxHTUZHlN1JwvgR71BK4BBnfCSFhKlNDxkQwDuAzETvUV
         ANb/xsV0MZdCwnN5CsV5PZyCvPqmp1eGzMJqjlptIaORChRWtpQ5dqvved9RFGRzQF5z
         WkUT8K02pzDtcBhpurDnA8bgcoVt6rwYRNOgg/6ftKE5FoM56yNWmVPJHNaVOHnAiNL1
         ePyxhLLxJ378gQNCDo0CW97OdHqLSta7SakkSbEEEntq5pTVfJQwUnifGxGFi/IypsGz
         wrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=eyltaocuzsab+ph5DU/CCSlWf2RHb1MPu4C8m1/H2kw=;
        b=0iSVs7HyhzmdK1ubzgI+T/7YvlOb43bQ1WeRbQk1rYMbDXVuntmdrfRrIg4aIs5F35
         nrY9QlTzlOaZypKngvxio5rXXG37O+JVqaqBm/Vfhma1nkUfezPP4ZDjbYrwwe0IWlZU
         YAixwhB9qh45SejINilpkzqcnk0mwN0Uqe3VxtKhythc8ajfJcrHCtKD1d9F+5x10qSx
         aHxzEJ5ibLl0QKSygyJjyGxxnebECXuoWHEnovX4uiNJJokHpvPgjotThkE+RNAKkhJa
         tK8irZny/Rm7/Crq8VkGiz8CLumi73tPXMXJaIoCEp2MXtPAYriG+BaUKXV0vZl3B02a
         /tmQ==
X-Gm-Message-State: ACrzQf05svoX0c1z2leaA/eNXlVkukDb3Q6pvavzLBfRkRj2blCzSXv0
	0N7cf/3zSj0s7JokBLWLAVTIQURGoogkkIVPRTw=
X-Google-Smtp-Source: 
 AMsMyM43Hrn8c5yVfm99nkcYA99uXuR+18jT3/oWUcWaHVViC3B6iM3CYJISIlClgX86YndFQFcCWtsf27kPF3hVJ+M=
X-Received: by 2002:a05:600c:5110:b0:3b4:b3d7:c30f with SMTP id
 o16-20020a05600c511000b003b4b3d7c30fmr3710970wms.93.1663708562602; Tue, 20
 Sep 2022 14:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220920110856.18019-1-florin.diaconescu009@gmail.com>
 <CAO5Uq5Q2-QpL82BaZx2FB0paWeUq61nCqtVf16T-BmdS3q6xdw@mail.gmail.com>
In-Reply-To: 
 <CAO5Uq5Q2-QpL82BaZx2FB0paWeUq61nCqtVf16T-BmdS3q6xdw@mail.gmail.com>
From: Florin Diaconescu <florin.diaconescu009@gmail.com>
Date: Wed, 21 Sep 2022 00:15:51 +0300
Message-ID: 
 <CANBDK7iFo6jCqdL1kUwqsZ0jJiQHLE27ZB7eGnMQAijXTxqqPg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] expat: CVE-2022-40674
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e23f4105e92255ed"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 21:16:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170909

--000000000000e23f4105e92255ed
Content-Type: text/plain; charset="UTF-8"

Just saw the new release, I will submit another patch with the 2.4.9
upgrade. Thanks for letting me know!

Florin

On Tue, Sep 20, 2022 at 6:57 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:

> 2.4.9 looks to have landed w/ this change in it.
>
> On Tue, Sep 20, 2022 at 12:09 PM Florin Diaconescu
> <florin.diaconescu009@gmail.com> wrote:
> >
> > Upstream-Status: Accepted
> > [
> https://github.com/libexpat/libexpat/pull/629/commits/4a32da87e931ba54393d465bb77c40b5c33d343b
> ]
> >
> > Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
> > ---
> >  .../expat/expat/CVE-2022-40674.patch          | 56 +++++++++++++++++++
> >  meta/recipes-core/expat/expat_2.4.8.bb        |  1 +
> >  2 files changed, 57 insertions(+)
> >  create mode 100644 meta/recipes-core/expat/expat/CVE-2022-40674.patch
> >
> > diff --git a/meta/recipes-core/expat/expat/CVE-2022-40674.patch
> b/meta/recipes-core/expat/expat/CVE-2022-40674.patch
> > new file mode 100644
> > index 0000000000..468811fefa
> > --- /dev/null
> > +++ b/meta/recipes-core/expat/expat/CVE-2022-40674.patch
> > @@ -0,0 +1,56 @@
> > +From 4a32da87e931ba54393d465bb77c40b5c33d343b Mon Sep 17 00:00:00 2001
> > +From: Rhodri James <rhodri@wildebeest.org.uk>
> > +Date: Wed, 17 Aug 2022 18:26:18 +0100
> > +Subject: [PATCH] Ensure raw tagnames are safe exiting
> internalEntityParser
> > +
> > +It is possible to concoct a situation in which parsing is
> > +suspended while substituting in an internal entity, so that
> > +XML_ResumeParser directly uses internalEntityProcessor as
> > +its processor.  If the subsequent parse includes some unclosed
> > +tags, this will return without calling storeRawNames to ensure
> > +that the raw versions of the tag names are stored in memory other
> > +than the parse buffer itself.  If the parse buffer is then changed
> > +or reallocated (for example if processing a file line by line),
> > +badness will ensue.
> > +
> > +This patch ensures storeRawNames is always called when needed
> > +after calling doContent.  The earlier call do doContent does
> > +not need the same protection; it only deals with entity
> > +substitution, which cannot leave unbalanced tags, and in any
> > +case the raw names will be pointing into the stored entity
> > +value not the parse buffer.
> > +
> > +CVE: CVE-2022-40674
> > +Upstream-Status: Accepted [
> https://github.com/libexpat/libexpat/pull/629/commits/4a32da87e931ba54393d465bb77c40b5c33d343b
> ]
> > +
> > +Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
> > +---
> > + lib/xmlparse.c | 13 +++++++++----
> > + 1 file changed, 9 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> > +index e986156..eabe0fc 100644
> > +--- a/lib/xmlparse.c
> > ++++ b/lib/xmlparse.c
> > +@@ -5826,10 +5826,15 @@ internalEntityProcessor(XML_Parser parser,
> const char *s, const char *end,
> > +   {
> > +     parser->m_processor = contentProcessor;
> > +     /* see externalEntityContentProcessor vs contentProcessor */
> > +-    return doContent(parser, parser->m_parentParser ? 1 : 0,
> parser->m_encoding,
> > +-                     s, end, nextPtr,
> > +-                     (XML_Bool)! parser->m_parsingStatus.finalBuffer,
> > +-                     XML_ACCOUNT_DIRECT);
> > ++    result = doContent(parser, parser->m_parentParser ? 1 : 0,
> > ++                       parser->m_encoding, s, end, nextPtr,
> > ++                       (XML_Bool)! parser->m_parsingStatus.finalBuffer,
> > ++                       XML_ACCOUNT_DIRECT);
> > ++    if (result == XML_ERROR_NONE) {
> > ++      if (! storeRawNames(parser))
> > ++        return XML_ERROR_NO_MEMORY;
> > ++    }
> > ++    return result;
> > +   }
> > + }
> > +
> > +--
> > +2.35.1
> > diff --git a/meta/recipes-core/expat/expat_2.4.8.bb
> b/meta/recipes-core/expat/expat_2.4.8.bb
> > index 980c488640..93a2f98b38 100644
> > --- a/meta/recipes-core/expat/expat_2.4.8.bb
> > +++ b/meta/recipes-core/expat/expat_2.4.8.bb
> > @@ -10,6 +10,7 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
> >
> >  SRC_URI = "
> https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2
> \
> >             file://run-ptest \
> > +           file://CVE-2022-40674.patch \
> >             "
> >
> >  UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#170894):
> https://lists.openembedded.org/g/openembedded-core/message/170894
> > Mute This Topic: https://lists.openembedded.org/mt/93800770/3618097
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kiernan@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alex Kiernan
>

--000000000000e23f4105e92255ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Just saw the new release, I will submit another patch=
 with the 2.4.9 upgrade. Thanks for letting me know!</div><div><br></div><d=
iv>Florin<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Sep 20, 2022 at 6:57 PM Alex Kiernan &lt;<a href=
=3D"mailto:alex.kiernan@gmail.com">alex.kiernan@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">2.4.9 looks to hav=
e landed w/ this change in it.<br>
<br>
On Tue, Sep 20, 2022 at 12:09 PM Florin Diaconescu<br>
&lt;<a href=3D"mailto:florin.diaconescu009@gmail.com" target=3D"_blank">flo=
rin.diaconescu009@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Upstream-Status: Accepted<br>
&gt; [<a href=3D"https://github.com/libexpat/libexpat/pull/629/commits/4a32=
da87e931ba54393d465bb77c40b5c33d343b" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/libexpat/libexpat/pull/629/commits/4a32da87e931ba54393d4=
65bb77c40b5c33d343b</a>]<br>
&gt;<br>
&gt; Signed-off-by: Florin Diaconescu &lt;<a href=3D"mailto:florin.diacones=
cu009@gmail.com" target=3D"_blank">florin.diaconescu009@gmail.com</a>&gt;<b=
r>
&gt; ---<br>
&gt;=C2=A0 .../expat/expat/CVE-2022-40674.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 56 +++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-core/expat/<a href=3D"http://expat_2.4.8.bb" rel=3D=
"noreferrer" target=3D"_blank">expat_2.4.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 57 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-40674.=
patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/expat/expat/CVE-2022-40674.patch b/meta=
/recipes-core/expat/expat/CVE-2022-40674.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..468811fefa<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/expat/expat/CVE-2022-40674.patch<br>
&gt; @@ -0,0 +1,56 @@<br>
&gt; +From 4a32da87e931ba54393d465bb77c40b5c33d343b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Rhodri James &lt;<a href=3D"mailto:rhodri@wildebeest.org.uk" ta=
rget=3D"_blank">rhodri@wildebeest.org.uk</a>&gt;<br>
&gt; +Date: Wed, 17 Aug 2022 18:26:18 +0100<br>
&gt; +Subject: [PATCH] Ensure raw tagnames are safe exiting internalEntityP=
arser<br>
&gt; +<br>
&gt; +It is possible to concoct a situation in which parsing is<br>
&gt; +suspended while substituting in an internal entity, so that<br>
&gt; +XML_ResumeParser directly uses internalEntityProcessor as<br>
&gt; +its processor.=C2=A0 If the subsequent parse includes some unclosed<b=
r>
&gt; +tags, this will return without calling storeRawNames to ensure<br>
&gt; +that the raw versions of the tag names are stored in memory other<br>
&gt; +than the parse buffer itself.=C2=A0 If the parse buffer is then chang=
ed<br>
&gt; +or reallocated (for example if processing a file line by line),<br>
&gt; +badness will ensue.<br>
&gt; +<br>
&gt; +This patch ensures storeRawNames is always called when needed<br>
&gt; +after calling doContent.=C2=A0 The earlier call do doContent does<br>
&gt; +not need the same protection; it only deals with entity<br>
&gt; +substitution, which cannot leave unbalanced tags, and in any<br>
&gt; +case the raw names will be pointing into the stored entity<br>
&gt; +value not the parse buffer.<br>
&gt; +<br>
&gt; +CVE: CVE-2022-40674<br>
&gt; +Upstream-Status: Accepted [<a href=3D"https://github.com/libexpat/lib=
expat/pull/629/commits/4a32da87e931ba54393d465bb77c40b5c33d343b" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/libexpat/libexpat/pull/629/co=
mmits/4a32da87e931ba54393d465bb77c40b5c33d343b</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Florin Diaconescu &lt;<a href=3D"mailto:florin.diacone=
scu009@gmail.com" target=3D"_blank">florin.diaconescu009@gmail.com</a>&gt;<=
br>
&gt; +---<br>
&gt; + lib/xmlparse.c | 13 +++++++++----<br>
&gt; + 1 file changed, 9 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/lib/xmlparse.c b/lib/xmlparse.c<br>
&gt; +index e986156..eabe0fc 100644<br>
&gt; +--- a/lib/xmlparse.c<br>
&gt; ++++ b/lib/xmlparse.c<br>
&gt; +@@ -5826,10 +5826,15 @@ internalEntityProcessor(XML_Parser parser, co=
nst char *s, const char *end,<br>
&gt; +=C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0parser-&gt;m_processor =3D contentProcessor;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* see externalEntityContentProcessor vs contentP=
rocessor */<br>
&gt; +-=C2=A0 =C2=A0 return doContent(parser, parser-&gt;m_parentParser ? 1=
 : 0, parser-&gt;m_encoding,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0s, end, nextPtr,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(XML_Bool)! parser-&gt;m_parsingStatus.finalBuffer,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0XML_ACCOUNT_DIRECT);<br>
&gt; ++=C2=A0 =C2=A0 result =3D doContent(parser, parser-&gt;m_parentParser=
 ? 1 : 0,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0parser-&gt;m_encoding, s, end, nextPtr,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(XML_Bool)! parser-&gt;m_parsingStatus.finalBuffer,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0XML_ACCOUNT_DIRECT);<br>
&gt; ++=C2=A0 =C2=A0 if (result =3D=3D XML_ERROR_NONE) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (! storeRawNames(parser))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return XML_ERROR_NO_MEMORY;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 return result;<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; + }<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.35.1<br>
&gt; diff --git a/meta/recipes-core/expat/<a href=3D"http://expat_2.4.8.bb"=
 rel=3D"noreferrer" target=3D"_blank">expat_2.4.8.bb</a> b/meta/recipes-cor=
e/expat/<a href=3D"http://expat_2.4.8.bb" rel=3D"noreferrer" target=3D"_bla=
nk">expat_2.4.8.bb</a><br>
&gt; index 980c488640..93a2f98b38 100644<br>
&gt; --- a/meta/recipes-core/expat/<a href=3D"http://expat_2.4.8.bb" rel=3D=
"noreferrer" target=3D"_blank">expat_2.4.8.bb</a><br>
&gt; +++ b/meta/recipes-core/expat/<a href=3D"http://expat_2.4.8.bb" rel=3D=
"noreferrer" target=3D"_blank">expat_2.4.8.bb</a><br>
&gt; @@ -10,6 +10,7 @@ VERSION_TAG =3D &quot;${@d.getVar(&#39;PV&#39;).repl=
ace(&#39;.&#39;, &#39;_&#39;)}&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://github.com/libexpat/libexpa=
t/releases/download/R_$%7BVERSION_TAG%7D/expat-$%7BPV%7D.tar.bz2" rel=3D"no=
referrer" target=3D"_blank">https://github.com/libexpat/libexpat/releases/d=
ownload/R_${VERSION_TAG}/expat-${PV}.tar.bz2</a>=C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-40674.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/libex=
pat/libexpat/releases/" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/libexpat/libexpat/releases/</a>&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#170894): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/170894" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/170894</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93800770=
/3618097" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/93800770/3618097</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kiernan@gmail.co=
m" target=3D"_blank">alex.kiernan@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
Alex Kiernan<br>
</blockquote></div>

--000000000000e23f4105e92255ed--

