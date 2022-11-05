Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EBBC43217
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 18:28:55 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.8842.1667672925832873139
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 11:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J6+bMYr0;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id v1so10985169wrt.11
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 11:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zA6a+GX4Xrte5ehE3ccVhYEdoprM6XHVgweGo8Z/tGg=;
        b=J6+bMYr0EZmpl58CpmXADAFXai4djbEtsLzkebJ5/2M85E0Eek8UoqNq5wRXSRVBY8
         EMHxzvNj+zBlIY7uCPytXTHj57oz5sMTm6lg9VjKtQ9EfHveZsAUNEz1MfJ9Ny4ToE/X
         +haaubbjX9IvnFzvKf0X2fQMLVwZGBqcuvX7viDADc9LdovsJJikv64u07lchdAey6dY
         gn+3VYH9m2Djj7shHDfGACo7Qal8vIGkpwhmFmBlJGMRynyDsbHvAEgDhqnUhN35mv+x
         JfILR+xstPiNpCR9R0vN6zToPFngHndC8BUBfHMgubz8I1oQu6JDRWx8upQdEp9oVjan
         +y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zA6a+GX4Xrte5ehE3ccVhYEdoprM6XHVgweGo8Z/tGg=;
        b=oi4PyjyYOGHXFSEl9RUKRdotofkAUpesl7CuHnyvCv461GSCROAi3qtzraoqI1qNex
         Xj9J+/Us+u34YApk/AEmm0Sh4A3YKfKX44ILCGYNSGT4QpOB7zoRHrMvrKsrZE5LGIAl
         +Q4DQgTcr1j4I3zrY2S/CtmUZYJSv/LEq5Do0Px/MmKKKjfy8glKFRGuqdiX/wlMT5tX
         ge9HiSGRrmJYZwPgI/WYPU0X6S7Nl5et5XHGQFnsTwTY1k4Bo0+ntg4nq/60hXdmCTuC
         ljMkyGiPNovUJCC4jRAI3cQ5w/huHHfFtGh/a1tvHhhDjc8993bKTDsSqeY1PJJcSkgp
         sskw==
X-Gm-Message-State: ACrzQf0q6PH+1mpIS1GmmyOA/ra+JO3kSpaEKmVapngGerfFwdtm2QOu
	4Xo5pwWQ3skJBwBBmMp8MyQIo0t2pyIL0CDepao=
X-Google-Smtp-Source: AMsMyM7KykNa03PeDdAluoD+Qi9gKx2I1GWc1yyACvc9wc6ig0f/MFXT2vImS5iLQwZ83edlS8jNrmJlU1I810II3Xw=
X-Received: by 2002:adf:f70b:0:b0:236:f367:920f with SMTP id
 r11-20020adff70b000000b00236f367920fmr12310110wrp.129.1667672923878; Sat, 05
 Nov 2022 11:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221105154203.273684-1-pkj@axis.com> <20221105154203.273684-2-pkj@axis.com>
 <CAOSpxdZzGOPfcesAm0ykhcatZCMUwLUBjLudauD1J1Kod1UFFw@mail.gmail.com>
In-Reply-To: <CAOSpxdZzGOPfcesAm0ykhcatZCMUwLUBjLudauD1J1Kod1UFFw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 5 Nov 2022 19:28:29 +0100
Message-ID: <CA+chaQcY4iku9jwfsTQqe95E_Gge6X5GC=ZHLBDVwr7_poa86A@mail.gmail.com>
Subject: Re: [OE-core] [langdale][PATCH 2/2] externalsrc.bbclass: Remove a
 trailing slash from ${B}
To: Steve Sakoman <steve@sakoman.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003aba6005ecbd5c51"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 18:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172755

--0000000000003aba6005ecbd5c51
Content-Type: text/plain; charset="UTF-8"

In my inbox it looks differently, 2/3 and 3/3 aren't identical and both are
indeed in langdale-nut.

Then there is 1/2 identical to 2/3 (probably from sending last 3
externalsrc.bbclass changes and then re-sending after realizing that only
last 2 are needed).

1/3 is  already in langdale:
https://git.openembedded.org/openembedded-core/commit/?h=langdale&id=6d9364e5f3535954f65cbbc694ee7933ac1d664f

I think all is fine in langdale-nut.

Cheers,

On Sat, Nov 5, 2022 at 6:59 PM Steve Sakoman <steve@sakoman.com> wrote:

> I've already got these first two patches in stable/langdale-nut:
>
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-nut
>
> And your 3/3 seems to be identical to 2/3.  Am I missing something?
>
> Steve
>
> On Sat, Nov 5, 2022 at 5:42 AM Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> >
> > From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> >
> > The trailing slash in ${B} caused -fdebug-prefix-map=${B}=... to not
> > match as intended, resulting in ${TMPDIR} ending up in files in
> > ${PN}-dbg when externalsrc was in use, which in turn triggered buildpath
> > QA warnings.
> >
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  meta/classes/externalsrc.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/externalsrc.bbclass
> b/meta/classes/externalsrc.bbclass
> > index 5905342589..75fb91bcb0 100644
> > --- a/meta/classes/externalsrc.bbclass
> > +++ b/meta/classes/externalsrc.bbclass
> > @@ -61,7 +61,7 @@ python () {
> >          if externalsrcbuild:
> >              d.setVar('B', externalsrcbuild)
> >          else:
> > -            d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
> > +            d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
> >
> >          local_srcuri = []
> >          fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172754):
> https://lists.openembedded.org/g/openembedded-core/message/172754
> Mute This Topic: https://lists.openembedded.org/mt/94828874/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000003aba6005ecbd5c51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In my inbox it looks differently, 2/3 and 3/3 aren&#39;t i=
dentical and both are indeed in langdale-nut.<div><br></div><div>Then there=
 is 1/2 identical to 2/3 (probably from sending last 3 externalsrc.bbclass =
changes and then re-sending after realizing that only last 2 are needed).<b=
r><div><br></div><div>1/3 is=C2=A0 already in langdale:</div><div><a href=
=3D"https://git.openembedded.org/openembedded-core/commit/?h=3Dlangdale&amp=
;id=3D6d9364e5f3535954f65cbbc694ee7933ac1d664f">https://git.openembedded.or=
g/openembedded-core/commit/?h=3Dlangdale&amp;id=3D6d9364e5f3535954f65cbbc69=
4ee7933ac1d664f</a><br></div></div><div><br></div><div>I think all is fine =
in langdale-nut.</div><div><br></div><div>Cheers,</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov 5, 2022 =
at 6:59 PM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sak=
oman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">I&#39;ve already got these first two patches in stable/langdale-nut=
:<br>
<br>
<a href=3D"https://git.openembedded.org/openembedded-core-contrib/log/?h=3D=
stable/langdale-nut" rel=3D"noreferrer" target=3D"_blank">https://git.opene=
mbedded.org/openembedded-core-contrib/log/?h=3Dstable/langdale-nut</a><br>
<br>
And your 3/3 seems to be identical to 2/3.=C2=A0 Am I missing something?<br=
>
<br>
Steve<br>
<br>
On Sat, Nov 5, 2022 at 5:42 AM Peter Kjellerstedt<br>
&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.=
kjellerstedt@axis.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis=
.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt;<br>
&gt; The trailing slash in ${B} caused -fdebug-prefix-map=3D${B}=3D... to n=
ot<br>
&gt; match as intended, resulting in ${TMPDIR} ending up in files in<br>
&gt; ${PN}-dbg when externalsrc was in use, which in turn triggered buildpa=
th<br>
&gt; QA warnings.<br>
&gt;<br>
&gt; Signed-off-by: Alexandre Belloni &lt;<a href=3D"mailto:alexandre.bello=
ni@bootlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellers=
tedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/externalsrc.bbclass | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externals=
rc.bbclass<br>
&gt; index 5905342589..75fb91bcb0 100644<br>
&gt; --- a/meta/classes/externalsrc.bbclass<br>
&gt; +++ b/meta/classes/externalsrc.bbclass<br>
&gt; @@ -61,7 +61,7 @@ python () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if externalsrcbuild:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;B&#39;, =
externalsrcbuild)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;B&#39;, &#39;=
${WORKDIR}/${BPN}-${PV}/&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;B&#39;, &#39;=
${WORKDIR}/${BPN}-${PV}&#39;)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local_srcuri =3D []<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fetch =3D bb.fetch2.Fetch((d.getVar(=
&#39;SRC_URI&#39;) or &#39;&#39;).split(), d)<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172754): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172754" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172754</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94828874/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94828874/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000003aba6005ecbd5c51--

