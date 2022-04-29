Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D24C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 23:33:23 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.17050.1651275193358688049
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 16:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=flUnW1Yg;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: kergoth@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id m20so18047702ejj.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 16:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZViORTnptG8Q4+n1kcTk6y0prCViLxmo2J7P93gXQ8Y=;
        b=flUnW1YgYldV9QGD5Glp6ZgooDCcdGsp7K4jVfTev3C1HGYLDxjY2IM+nNB/m5Vg8t
         nK7h1z0zz3myyk5iVCjzb8OApwKc16gxiSY2jy07MEi8aw1BN6ST4EXL8ocIcOzAcsxU
         gL1fcxnN0vDoH/T5MDJtuUAmbBtmzCyyrhlFANj3maGysHxF9CC5ySDeCCjcbY2I0tEN
         PQ7Y3I/4ZB0d6SC8PqGMqxJC+8IrFahdudAFlcaLqkLHUx/bs/pjKVW3WHvsdDDcXQSU
         HlnO8DEEkPwVuTm/G//aBN+5OVX9pgp3MZMWHfxL8EWzik+N4HqUrDk9Kts4AKRoioYD
         82Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZViORTnptG8Q4+n1kcTk6y0prCViLxmo2J7P93gXQ8Y=;
        b=GKLvY6OGicTwPUwjBmSyM7QFH1uIfL38dykZ3zd1d5oXq5zPZeg/O78pxu8EolJjev
         zKyIm0WyyKwasoEl14Gt+roIH98qMuoo9V3EWWhMos60z2r4WDWfCYNVN7pjBrIu26Qa
         uvWSjUIOE5c627/iySFD7gsj13UCATOgjGn9IGX0Wg+Wele6cHSnmU4OO5s8Y3ZG1d/u
         hBUyjzuxnXxGZdKDhzpPIp7MmaCd8paGqpTslI9eTUsFd6bixFwHEEn2LyoEdRjKFRnq
         7kK2yZUxdMQNVuMf4yWAddlgqkJ2t1fKNtZnVerNHEHMfmgb076sm1XbcrqW6tMfFO8f
         jS7A==
X-Gm-Message-State: AOAM533q4u18ZwLZuPnMA/jJDxFuvtjOpUVjxLqmfPuyC0Zy/8ObeNZ2
	K/54UMbwA+hcOqCaj6/aTchkq8cJ1clxIqlQByM=
X-Google-Smtp-Source: 
 ABdhPJy9/piyEVjqHYsqvcHgWfDis/7JXoDxGw5q0Kcy2FwQVTKoSSD/dG3uITc5rLsomJIkiG0T8RIwkNZVf9ezqkI=
X-Received: by 2002:a17:907:7f94:b0:6da:64ec:fabc with SMTP id
 qk20-20020a1709077f9400b006da64ecfabcmr1520300ejc.717.1651275191360; Fri, 29
 Apr 2022 16:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220419112118.60914-1-peter.marko@siemens.com>
 <AS1PR10MB56979EF202CB2921C9EA4C6AFDFC9@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAGDS+nkTey6cB9OAFMFYA=uG6SR=pF=xwkay2DXS_dUQQozgrw@mail.gmail.com>
In-Reply-To: 
 <CAGDS+nkTey6cB9OAFMFYA=uG6SR=pF=xwkay2DXS_dUQQozgrw@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 29 Apr 2022 16:33:00 -0700
Message-ID: 
 <CABcZANmywE3Wp8e5ufiJ84=j-T+41E4zmP4SXBF+oR69NiRZWg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] openssl: extract legacy provider module to a
 separate package
To: Steve Sakoman <sakoman@gmail.com>
Cc: Peter Marko <peter.marko@siemens.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000035217b05ddd377b1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 23:33:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165061

--00000000000035217b05ddd377b1
Content-Type: text/plain; charset="UTF-8"

Just to clarify, you can certainly make rdepends of a subpackage depend on
a packageconfig, you just use inline python to do it. There are a number of
examples of this sort of conditional in oe-core.

On Fri, Apr 29, 2022 at 11:17 AM Steve Sakoman <sakoman@gmail.com> wrote:

> On Fri, Apr 29, 2022 at 2:27 AM Peter Marko <peter.marko@siemens.com>
> wrote:
> >
> > This is important for seamless migration of applications to openssl3.
> > In particular poco from meta-oe needs this as packageconfig cannot add
> rdepends to a sub-package.
> > Could this be picked to kirkstone or do I need to send it as new patch?
>
> No need to send a patch, I'll cherry-pick it in my next patch set.
>
> Thanks,
>
> Steve
>
> > > -----Original Message-----
> > > From: Marko, Peter <Peter.Marko@siemens.com>
> > > Sent: Tuesday, April 19, 2022 13:21
> > > To: openembedded-core@lists.openembedded.org
> > > Cc: Marko, Peter <Peter.Marko@siemens.com>
> > > Subject: [OE-core][PATCH] openssl: extract legacy provider module to a
> separate package
> > >
> > > This module contains legacy cipher suites from libcrypto.
> > > We should not need to include base package because we want
> > >   to use this part of libcrypto.
> > >
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > ---
> > >  meta/recipes-connectivity/openssl/openssl_3.0.2.bb | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
> b/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
> > > index ff2a22c6c3..a809666aa7 100644
> > > --- a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
> > > +++ b/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
> > > @@ -224,7 +224,7 @@ do_install_ptest () {  # file to be installed for
> both the openssl-bin package and the libcrypto  # package since the
> openssl-bin package depends on the libcrypto package.
> > >
> > > -PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc"
> > > +PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc
> ${PN}-ossl-module-legacy"
> > >
> > >  FILES:libcrypto = "${libdir}/libcrypto${SOLIBS}"
> > >  FILES:libssl = "${libdir}/libssl${SOLIBS}"
> > > @@ -235,12 +235,13 @@ FILES:${PN}-engines = "${libdir}/engines-3"
> > >  # ${prefix} comes from what we pass into --prefix at configure time
> (which is used for INSTALLTOP)
> FILES:${PN}-engines:append:mingw32:class-nativesdk = "
> ${prefix}${libdir}/engines-3"
> > >  FILES:${PN}-misc = "${libdir}/ssl-3/misc ${bindir}/c_rehash"
> > > +FILES:${PN}-ossl-module-legacy = "${libdir}/ossl-modules/legacy.so"
> > >  FILES:${PN} =+ "${libdir}/ssl-3/* ${libdir}/ossl-modules/"
> > >  FILES:${PN}:append:class-nativesdk = "
> ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
> > >
> > >  CONFFILES:openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
> > >
> > > -RRECOMMENDS:libcrypto += "openssl-conf"
> > > +RRECOMMENDS:libcrypto += "openssl-conf ${PN}-ossl-module-legacy"
> > >  RDEPENDS:${PN}-misc = "perl"
> > >  RDEPENDS:${PN}-ptest += "openssl-bin perl perl-modules bash sed"
> > >
> > > --
> > > 2.30.2
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165054):
> https://lists.openembedded.org/g/openembedded-core/message/165054
> Mute This Topic: https://lists.openembedded.org/mt/90559122/3617123
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> kergoth@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
Christopher Larson
chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
Principal Software Engineer, Embedded Linux Solutions, Siemens Digital
Industries Software

--00000000000035217b05ddd377b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just to clarify, you can certainly make rdepends of a subp=
ackage depend on a packageconfig, you just use inline python to do it. Ther=
e are a number of examples of this sort of conditional in oe-core.</div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, A=
pr 29, 2022 at 11:17 AM Steve Sakoman &lt;<a href=3D"mailto:sakoman@gmail.c=
om">sakoman@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Fri, Apr 29, 2022 at 2:27 AM Peter Marko &lt;<a hre=
f=3D"mailto:peter.marko@siemens.com" target=3D"_blank">peter.marko@siemens.=
com</a>&gt; wrote:<br>
&gt;<br>
&gt; This is important for seamless migration of applications to openssl3.<=
br>
&gt; In particular poco from meta-oe needs this as packageconfig cannot add=
 rdepends to a sub-package.<br>
&gt; Could this be picked to kirkstone or do I need to send it as new patch=
?<br>
<br>
No need to send a patch, I&#39;ll cherry-pick it in my next patch set.<br>
<br>
Thanks,<br>
<br>
Steve<br>
<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com"=
 target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
&gt; &gt; Sent: Tuesday, April 19, 2022 13:21<br>
&gt; &gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; Cc: Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com" t=
arget=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
&gt; &gt; Subject: [OE-core][PATCH] openssl: extract legacy provider module=
 to a separate package<br>
&gt; &gt;<br>
&gt; &gt; This module contains legacy cipher suites from libcrypto.<br>
&gt; &gt; We should not need to include base package because we want<br>
&gt; &gt;=C2=A0 =C2=A0to use this part of libcrypto.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siem=
ens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-connectivity/openssl/<a href=3D"http://openssl=
_3.0.2.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.2.bb</a> | 5 ++=
+--<br>
&gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://=
openssl_3.0.2.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.2.bb</a>=
 b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.2.bb" re=
l=3D"noreferrer" target=3D"_blank">openssl_3.0.2.bb</a><br>
&gt; &gt; index ff2a22c6c3..a809666aa7 100644<br>
&gt; &gt; --- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl=
_3.0.2.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.2.bb</a><br>
&gt; &gt; +++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl=
_3.0.2.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.2.bb</a><br>
&gt; &gt; @@ -224,7 +224,7 @@ do_install_ptest () {=C2=A0 # file to be inst=
alled for both the openssl-bin package and the libcrypto=C2=A0 # package si=
nce the openssl-bin package depends on the libcrypto package.<br>
&gt; &gt;<br>
&gt; &gt; -PACKAGES =3D+ &quot;libcrypto libssl openssl-conf ${PN}-engines =
${PN}-misc&quot;<br>
&gt; &gt; +PACKAGES =3D+ &quot;libcrypto libssl openssl-conf ${PN}-engines =
${PN}-misc ${PN}-ossl-module-legacy&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 FILES:libcrypto =3D &quot;${libdir}/libcrypto${SOLIBS}&quot=
;<br>
&gt; &gt;=C2=A0 FILES:libssl =3D &quot;${libdir}/libssl${SOLIBS}&quot;<br>
&gt; &gt; @@ -235,12 +235,13 @@ FILES:${PN}-engines =3D &quot;${libdir}/eng=
ines-3&quot;<br>
&gt; &gt;=C2=A0 # ${prefix} comes from what we pass into --prefix at config=
ure time (which is used for INSTALLTOP)=C2=A0 FILES:${PN}-engines:append:mi=
ngw32:class-nativesdk =3D &quot; ${prefix}${libdir}/engines-3&quot;<br>
&gt; &gt;=C2=A0 FILES:${PN}-misc =3D &quot;${libdir}/ssl-3/misc ${bindir}/c=
_rehash&quot;<br>
&gt; &gt; +FILES:${PN}-ossl-module-legacy =3D &quot;${libdir}/ossl-modules/=
legacy.so&quot;<br>
&gt; &gt;=C2=A0 FILES:${PN} =3D+ &quot;${libdir}/ssl-3/* ${libdir}/ossl-mod=
ules/&quot;<br>
&gt; &gt;=C2=A0 FILES:${PN}:append:class-nativesdk =3D &quot; ${SDKPATHNATI=
VE}/environment-setup.d/openssl.sh&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 CONFFILES:openssl-conf =3D &quot;${sysconfdir}/ssl/openssl.=
cnf&quot;<br>
&gt; &gt;<br>
&gt; &gt; -RRECOMMENDS:libcrypto +=3D &quot;openssl-conf&quot;<br>
&gt; &gt; +RRECOMMENDS:libcrypto +=3D &quot;openssl-conf ${PN}-ossl-module-=
legacy&quot;<br>
&gt; &gt;=C2=A0 RDEPENDS:${PN}-misc =3D &quot;perl&quot;<br>
&gt; &gt;=C2=A0 RDEPENDS:${PN}-ptest +=3D &quot;openssl-bin perl perl-modul=
es bash sed&quot;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.30.2<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#165054): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/165054" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/165054</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90559122/3617=
123" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90559122/3617123</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:kergoth@gmail.com" target=
=3D"_blank">kergoth@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><font color=3D=
"#333333">Christopher Larson<br><a>chris_larson@mentor.com</a>,=C2=A0<a>chr=
is.larson@siemens.com</a>,=C2=A0<a>kergoth@gmail.com</a><br>Principal Softw=
are Engineer,=C2=A0Embedded Linux Solutions,=C2=A0Siemens Digital Industrie=
s Software</font><br></div></div></div>

--00000000000035217b05ddd377b1--

