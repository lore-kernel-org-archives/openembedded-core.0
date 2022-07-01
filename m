Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0978C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:19:38 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.38923.1656685175512228811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b9Ekk4/s;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id z21so4093906lfb.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=juPXb0H7QQep/Bg8T086qehSRnMDmjbGP3rU6zx7KRw=;
        b=b9Ekk4/s4BX4vGNkNd3BC7Djl9EqF8pPd28q5K+ddmhhQywBSNo+qF3h+Nr6ZOyftB
         GJ/0Tvg0yuhpeOXq732uDE550AIfqbceLNGi2bRBC4r//HYFpnu4GnX+7d3QFIpKM5KA
         EcZ2STnZBViKscl1hky62bUfxZ4lsxCzG6UeYIpRog60na+jWcViLgZ2TIpgBADRtcgH
         ZpyJEZ0CyP6CJOWZM3muELEKJ3bDpvvWjr+8NgfYweW1Ze+Wq5S8E17vqCgUSfYuYmhB
         oM0yMVt42/UKVLVcWDQhhuDNnNmBd7LqM/T19U0fjYu6FQNhjBwE2u+H5F9MkzDHiMcs
         MNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=juPXb0H7QQep/Bg8T086qehSRnMDmjbGP3rU6zx7KRw=;
        b=e/g0wXhvTDwm1hWxomJlYuY5iZvDMJdoI3AKIwMXOSBAiqJAXeWgTB+20dg5htfk0W
         A5m5v9+Vx1bMrxsiCAC2PLbp5WYMFiEbjyGx4ijJiT8KK/T4Ztz/wc1//4aW0BLpVja4
         FBTeVvoT2U0S5eEyiuGStzd64eRDEE3wVv10rfERC/cXUGMA5WaJ7rb+e8A6fOS5RMF+
         D/oaaUdZWcaa++xfCFbFLMJuOU9fchx03xc98Gd6JrJmTPXpEl655VL3WMKQucJ9MrBE
         WBO8C/zizqTOUFcP9rGSIRVtHJg1uNz1ryvm7YnnKJAOwAOQn5fhKRgK7STVGNGUVYR2
         +3Uw==
X-Gm-Message-State: AJIora/6rBOiiGbXaqQ1UAbyq0ReOxP7+QTg6ZleeewjlJqB3CgqSs0T
	VlFd5rpP1BCO6z8CYWY613Hm2MHnJJwJecPe+30=
X-Google-Smtp-Source: 
 AGRyM1uORyIV3rOmyyhjRnvVQWTXN4CYSyCnysqPHJ8O/1+sgNNadVEG9Fsd5F+zpPgKsKGJnnbtMIKJoiqIvmTQWg4=
X-Received: by 2002:a05:6512:3da8:b0:47f:616d:e54c with SMTP id
 k40-20020a0565123da800b0047f616de54cmr10178098lfv.218.1656685173626; Fri, 01
 Jul 2022 07:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220701134413.99129-1-jose.quaresma@foundries.io>
 <CAMKF1sqar94+9M_WO+V3eMjxuqVq8PrakX7T7sYJep3-EtfRog@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqar94+9M_WO+V3eMjxuqVq8PrakX7T7sYJep3-EtfRog@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 1 Jul 2022 15:19:22 +0100
Message-ID: 
 <CANPvuRmXvBujb7+RPCSRW_JtGRa6AXQis9ptXhBvwD_mZGuPLg@mail.gmail.com>
Subject: Re: [OE-core][PATCH]] Update to 7.84.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000475b8805e2bf1387"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:19:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167475

--000000000000475b8805e2bf1387
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Khem Raj <raj.khem@gmail.com> escreveu no dia sexta, 1/07/2022 =C3=A0(s) 14=
:58:

> subject is missing recipe name.
>

thanks, fixed in v2


>
> On Fri, Jul 1, 2022 at 9:44 AM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/recipes-support/curl/{curl_7.83.1.bb =3D> curl_7.84.0.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-support/curl/{curl_7.83.1.bb =3D> curl_7.84.0.bb}
> (97%)
> >
> > diff --git a/meta/recipes-support/curl/curl_7.83.1.bb
> b/meta/recipes-support/curl/curl_7.84.0.bb
> > similarity index 97%
> > rename from meta/recipes-support/curl/curl_7.83.1.bb
> > rename to meta/recipes-support/curl/curl_7.84.0.bb
> > index 1d9de29a65..ade2846a64 100644
> > --- a/meta/recipes-support/curl/curl_7.83.1.bb
> > +++ b/meta/recipes-support/curl/curl_7.84.0.bb
> > @@ -10,7 +10,7 @@ LICENSE =3D "MIT-open-group"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D190c51487259708330337168495=
4f238"
> >
> >  SRC_URI =3D "https://curl.se/download/${BP}.tar.xz"
> > -SRC_URI[sha256sum] =3D
> "2cb9c2356e7263a1272fd1435ef7cdebf2cd21400ec287b068396deb705c22c4"
> > +SRC_URI[sha256sum] =3D
> "2d118b43f547bfe5bae806d8d47b4e596ea5b25a6c1f080aef49fbcd817c5db8"
> >
> >  # Curl has used many names over the years...
> >  CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl
> libcurl:libcurl daniel_stenberg:curl"
> > --
> > 2.37.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#167469):
> https://lists.openembedded.org/g/openembedded-core/message/167469
> > Mute This Topic: https://lists.openembedded.org/mt/92109630/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000475b8805e2bf1387
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; escreveu no dia sexta, 1/07/2022 =
=C3=A0(s) 14:58:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>subject is missing recipe name.<br></blockquote><div><br></div><div>thanks=
, fixed in v2</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
On Fri, Jul 1, 2022 at 9:44 AM Jose Quaresma &lt;<a href=3D"mailto:quaresma=
.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-support/curl/{<a href=3D"http://curl_7.83.1.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_7.83.1.bb</a> =3D&gt; <a href=3D"htt=
p://curl_7.84.0.bb" rel=3D"noreferrer" target=3D"_blank">curl_7.84.0.bb</a>=
} | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 rename meta/recipes-support/curl/{<a href=3D"http://curl_7.83.1.=
bb" rel=3D"noreferrer" target=3D"_blank">curl_7.83.1.bb</a> =3D&gt; <a href=
=3D"http://curl_7.84.0.bb" rel=3D"noreferrer" target=3D"_blank">curl_7.84.0=
.bb</a>} (97%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_7.83.1.b=
b" rel=3D"noreferrer" target=3D"_blank">curl_7.83.1.bb</a> b/meta/recipes-s=
upport/curl/<a href=3D"http://curl_7.84.0.bb" rel=3D"noreferrer" target=3D"=
_blank">curl_7.84.0.bb</a><br>
&gt; similarity index 97%<br>
&gt; rename from meta/recipes-support/curl/<a href=3D"http://curl_7.83.1.bb=
" rel=3D"noreferrer" target=3D"_blank">curl_7.83.1.bb</a><br>
&gt; rename to meta/recipes-support/curl/<a href=3D"http://curl_7.84.0.bb" =
rel=3D"noreferrer" target=3D"_blank">curl_7.84.0.bb</a><br>
&gt; index 1d9de29a65..ade2846a64 100644<br>
&gt; --- a/meta/recipes-support/curl/<a href=3D"http://curl_7.83.1.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_7.83.1.bb</a><br>
&gt; +++ b/meta/recipes-support/curl/<a href=3D"http://curl_7.84.0.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_7.84.0.bb</a><br>
&gt; @@ -10,7 +10,7 @@ LICENSE =3D &quot;MIT-open-group&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D190c514872597083=
303371684954f238&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://curl.se/download/$%7BBP%7D.=
tar.xz" rel=3D"noreferrer" target=3D"_blank">https://curl.se/download/${BP}=
.tar.xz</a>&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;2cb9c2356e7263a1272fd1435ef7cdebf2cd2140=
0ec287b068396deb705c22c4&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;2d118b43f547bfe5bae806d8d47b4e596ea5b25a=
6c1f080aef49fbcd817c5db8&quot;<br>
&gt;<br>
&gt;=C2=A0 # Curl has used many names over the years...<br>
&gt;=C2=A0 CVE_PRODUCT =3D &quot;haxx:curl haxx:libcurl curl:curl curl:libc=
url libcurl:libcurl daniel_stenberg:curl&quot;<br>
&gt; --<br>
&gt; 2.37.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#167469): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/167469" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/167469</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92109630=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/92109630/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000475b8805e2bf1387--

