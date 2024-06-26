Return-Path: <sreejith.ravi087@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87034C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 14:14:01 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.27933.1719411233296068118
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 07:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m/doO7Qt;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: sreejith.ravi087@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-52cdb0d8107so6486917e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719411231; x=1720016031; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2fPj/cQ2XQ/DAARKkr1qxqQpRRMG+rB63Kr5BfM744s=;
        b=m/doO7QtnMNQp38fSYrnFcwWjyXlRC2TYWPCkVrnjsAgHZ8wvzTFG0ARDk/HLayXzG
         Q/KlSdmZoCYAQ7uQjp2J5Z/3Fw+jLL2choCGsKTqodukm4rII83LH1yN/KYkct0VDZ2P
         rHTaqDh8xvRzqAEDiHpwiS7Zf+jAO6lVyYLBKOHE23GwAFpVJrSgHxW3TKPYSf2iIC5p
         9klKqxS1NbKu5e94IeAhFohUti+AP6GvgYxTi6XV2qkxRn/59SJroNZrQHK+h8/p5x8f
         mpXDO9UaVR3cDrzgiZSzohuZuJUbXn5fWv03TFj53YmbA54m2/kR7AQjiU6uhYQnOIar
         gO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719411231; x=1720016031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2fPj/cQ2XQ/DAARKkr1qxqQpRRMG+rB63Kr5BfM744s=;
        b=AadeKjHhXt+Di5WQuWGIEp0tqOK+nJvqyZPX+tyshL/BJmj8GAC7624DJ5gw9fvCKs
         HBvtphIXMzxOHnEWAxH9msq8jaoLvcMq/+tFLsoUqBKLQF/6Xj6dWL+cOurH15RnKPHS
         RDOewfICl1YNKLjmyFngc9qjPXb+gW6/Pj7W+/iNJ/3b7o3Cro7edvU+si1NWzNSSpbh
         aPBvucCRGEwsI34iF+kwtspOIz2QqiRJLMH6q2dAxaYp5VPS/uQ651TVxdT03z2QN0Ym
         9UtT8hhtyZz2AK2VcpAmDkpJOYGKiRgdFCMULV1Wv7hw70dsXFSRTMB3L8wTwiAysnw0
         0/1A==
X-Forwarded-Encrypted: i=1; AJvYcCXxe+lAzwklPRLaJB2TJlp+8ONat4Uatii6S7kmAKjaqBoQvJ48ypE22G1RKlMp9e894pPPuJeVcp11bxzC2HrmoizaZTZOXj3cHzhhNeqsUJMeG4jMm0YE
X-Gm-Message-State: AOJu0YyWy8N7fqDreIq8WHEdZpe0VdhLdAyMeKPqiiNUwBhu/JKKPLdf
	wl3uLc6TAUmDn2fczjJm+ZlpyZphyWJBsxOanNPLPseybTkTJWQKhe/+/648oUfaaUKsU+4vir3
	ygG2EalSdALaeOI79khAmz9uBn3o=
X-Google-Smtp-Source: AGHT+IEpdBtFNJMYENBOJNiErfgnjn+u9OqRzxxRM0E1rHsTeYBnkz20KqXcV+YiuBm2sakotW7XFY5tFRBdEN6StCc=
X-Received: by 2002:a19:6a10:0:b0:52b:c089:4579 with SMTP id
 2adb3069b0e04-52cdf8209c4mr7790837e87.49.1719411231005; Wed, 26 Jun 2024
 07:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240625191513.22142-1-sreejith.ravi087@gmail.com>
 <6e13e5817b8c4dc5afe99642f06198359447854a.camel@rpsys.net> <17DC91911DB229DD.24534@lists.openembedded.org>
In-Reply-To: <17DC91911DB229DD.24534@lists.openembedded.org>
From: Sreejith Ravi <sreejith.ravi087@gmail.com>
Date: Wed, 26 Jun 2024 15:13:38 +0100
Message-ID: <CAFt4JuFk+sfP1jysBe5x5Bm2QBPOTyPjbeWorbJAPfhrRmiZ9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package.bbclass: Add Requires.private field in package_do_pkgconfig()
To: sreejith.ravi087@gmail.com
Cc: Richard Purdie <rpurdie@rpsys.net>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a5a41f061bcb9f17"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 14:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201168

--000000000000a5a41f061bcb9f17
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The reason for the failure in master is that the functionality has been
moved from package.bbclass to package.py. I have created the patch for
master and sent it for review.

Cheers
Sreejith

On Wed, Jun 26, 2024 at 2:40=E2=80=AFPM Sreejith Ravi via lists.openembedde=
d.org
<sreejith.ravi087=3Dgmail.com@lists.openembedded.org> wrote:

> Patch is created from the Kirkstone branch.
>
> Cheers
> Sreejith
>
> On Wed, Jun 26, 2024 at 2:37=E2=80=AFPM Richard Purdie <rpurdie@rpsys.net=
> wrote:
>
>> On Tue, 2024-06-25 at 19:15 +0000, Sreejith Ravi via
>> lists.openembedded.org wrote:
>> > Currently, the package_do_pkgconfig() only handles the "Requires" key
>> > field from the .pc file and ignores the "Requires.private" field
>> > while
>> > generating the dev dependency chain. This results in a broken
>> > dependency
>> > list and requires the installation of recommended packages to resolve
>> > the build dependencies when using the dev IPKs. This increases the
>> > hard disk space usage and download time and installs many unnecessary
>> > packages as part of the recommendations.
>> >
>> > This patch ensures that the "Requires.private" field is also
>> > considered
>> > when creating the dependency list for the dev IPKs. With this, the
>> > dev
>> > IPK will have the proper dependencies listed, eliminating the need to
>> > install recommended packages to resolve the build time dependencies.
>> >
>> > Example: usr/lib/pkgconfig/libical.pc
>> > ----------
>> > Libs: -L${libdir} -lical -licalss -licalvcal
>> > Libs.private: -lpthread
>> > Requires.private: icu-i18n
>> > ----------
>> > Depends field generated for libical-dev
>> > Depends: glib-2.0-dev, libical (=3D 3.0.7-r0)
>> > ------------
>> >
>> > When trying to resolve the build time dependency with libical
>> > package using =E2=80=9C-dev=E2=80=9D ipk generated, it will throw the =
below error.
>> > -----------
>> > Package icu-i18n was not found in the pkg-config search path.
>> > Perhaps you should add the directory containing `icu-i18n.pc'
>> > to the PKG_CONFIG_PATH environment variable
>> > Package 'icu-i18n', required by 'libical', not found
>> > -----------
>> >
>> > This patch will fix the broken dependency list.
>> >
>> > -------
>> > libical-dev depends field generated with this patch
>> > Depends: glib-2.0-dev, icu-dev, libical (=3D 3.0.7-r0)
>> > -------
>> >
>> > Other examples of packages generated with broken dev dependency.
>> >
>> > libflac-dev : https://packages.debian.org/sid/libflac-dev
>> > Without patch:
>> > Depends: flac (=3D 1.3.3-r0), libflac, libflac++
>> > with patch:
>> > Depends: flac (=3D 1.3.3-r0), libflac, libflac++, libogg-dev
>> >
>> > libglib2.0-dev : https://packages.debian.org/buster/libglib2.0-dev
>> > without patch:
>> > Depends: libffi-dev, libglib-2.0-0 (=3D 1:2.62.6-r0), libpcre-dev
>> > with patch:
>> > Depends: libffi-dev, libglib-2.0-0 (=3D 1:2.62.6-r0), libpcre-dev,
>> >          util-linux-dev, zlib-dev
>> >
>> > Signed-off-by: Sreejith Ravi <sreejith.ravi087@gmail.com>
>> > ---
>> >  meta/classes/package.bbclass | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/classes/package.bbclass
>> > b/meta/classes/package.bbclass
>> > index 67351b2510..084fe428e5 100644
>> > --- a/meta/classes/package.bbclass
>> > +++ b/meta/classes/package.bbclass
>> > @@ -2182,7 +2182,7 @@ python package_do_pkgconfig () {
>> >                          if m:
>> >                              hdr =3D m.group(1)
>> >                              exp =3D pd.expand(m.group(2))
>> > -                            if hdr =3D=3D 'Requires':
>> > +                            if hdr =3D=3D 'Requires' or hdr =3D=3D
>> > 'Requires.private':
>> >                                  pkgconfig_needed[pkg] +=3D
>> > exp.replace(',', ' ').split()
>> >                                  continue
>> >                          m =3D var_re.match(l)
>> >
>>
>> Unfortunately this patch fails to apply. This is not a patch against
>> master and obviously hasn't need tested there.
>>
>> Cheers,
>>
>> Richard
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201165):
> https://lists.openembedded.org/g/openembedded-core/message/201165
> Mute This Topic: https://lists.openembedded.org/mt/106876780/8634312
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> sreejith.ravi087@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a5a41f061bcb9f17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The reason for the failure in master is that the functiona=
lity has been moved from package.bbclass to package.py. I have created the =
patch for master and sent it for review.

<div><br></div><div>Cheers=C2=A0</div><div>Sreejith</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 26, 20=
24 at 2:40=E2=80=AFPM Sreejith Ravi via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;sreejith.ravi087=3D<a href=3D"mailto:=
gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">Patch is created from the Kirkstone=C2=A0branch.<div><br></div><di=
v>Cheers</div><div>Sreejith</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 26, 2024 at 2:37=E2=80=AFPM Ri=
chard Purdie &lt;<a href=3D"mailto:rpurdie@rpsys.net" target=3D"_blank">rpu=
rdie@rpsys.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Tue, 2024-06-25 at 19:15 +0000, Sreejith Ravi via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; Currently, the package_do_pkgconfig() only handles the &quot;Requires&=
quot; key<br>
&gt; field from the .pc file and ignores the &quot;Requires.private&quot; f=
ield<br>
&gt; while<br>
&gt; generating the dev dependency chain. This results in a broken<br>
&gt; dependency<br>
&gt; list and requires the installation of recommended packages to resolve<=
br>
&gt; the build dependencies when using the dev IPKs. This increases the<br>
&gt; hard disk space usage and download time and installs many unnecessary<=
br>
&gt; packages as part of the recommendations.<br>
&gt; <br>
&gt; This patch ensures that the &quot;Requires.private&quot; field is also=
<br>
&gt; considered<br>
&gt; when creating the dependency list for the dev IPKs. With this, the<br>
&gt; dev<br>
&gt; IPK will have the proper dependencies listed, eliminating the need to<=
br>
&gt; install recommended packages to resolve the build time dependencies.<b=
r>
&gt; <br>
&gt; Example: usr/lib/pkgconfig/libical.pc<br>
&gt; ----------<br>
&gt; Libs: -L${libdir} -lical -licalss -licalvcal<br>
&gt; Libs.private: -lpthread<br>
&gt; Requires.private: icu-i18n<br>
&gt; ----------<br>
&gt; Depends field generated for libical-dev<br>
&gt; Depends: glib-2.0-dev, libical (=3D 3.0.7-r0)<br>
&gt; ------------<br>
&gt; <br>
&gt; When trying to resolve the build time dependency with libical<br>
&gt; package using =E2=80=9C-dev=E2=80=9D ipk generated, it will throw the =
below error.<br>
&gt; -----------<br>
&gt; Package icu-i18n was not found in the pkg-config search path.<br>
&gt; Perhaps you should add the directory containing `icu-i18n.pc&#39;<br>
&gt; to the PKG_CONFIG_PATH environment variable<br>
&gt; Package &#39;icu-i18n&#39;, required by &#39;libical&#39;, not found<b=
r>
&gt; -----------<br>
&gt; <br>
&gt; This patch will fix the broken dependency list.<br>
&gt; <br>
&gt; -------<br>
&gt; libical-dev depends field generated with this patch<br>
&gt; Depends: glib-2.0-dev, icu-dev, libical (=3D 3.0.7-r0)<br>
&gt; -------<br>
&gt; <br>
&gt; Other examples of packages generated with broken dev dependency.<br>
&gt; <br>
&gt; libflac-dev : <a href=3D"https://packages.debian.org/sid/libflac-dev" =
rel=3D"noreferrer" target=3D"_blank">https://packages.debian.org/sid/libfla=
c-dev</a><br>
&gt; Without patch:<br>
&gt; Depends: flac (=3D 1.3.3-r0), libflac, libflac++<br>
&gt; with patch:<br>
&gt; Depends: flac (=3D 1.3.3-r0), libflac, libflac++, libogg-dev<br>
&gt; <br>
&gt; libglib2.0-dev : <a href=3D"https://packages.debian.org/buster/libglib=
2.0-dev" rel=3D"noreferrer" target=3D"_blank">https://packages.debian.org/b=
uster/libglib2.0-dev</a><br>
&gt; without patch:<br>
&gt; Depends: libffi-dev, libglib-2.0-0 (=3D 1:2.62.6-r0), libpcre-dev<br>
&gt; with patch:<br>
&gt; Depends: libffi-dev, libglib-2.0-0 (=3D 1:2.62.6-r0), libpcre-dev,<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 util-linux-dev, zlib-=
dev<br>
&gt; <br>
&gt; Signed-off-by: Sreejith Ravi &lt;<a href=3D"mailto:sreejith.ravi087@gm=
ail.com" target=3D"_blank">sreejith.ravi087@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes/package.bbclass | 2 +-<br>
&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/package.bbclass<br>
&gt; b/meta/classes/package.bbclass<br>
&gt; index 67351b2510..084fe428e5 100644<br>
&gt; --- a/meta/classes/package.bbclass<br>
&gt; +++ b/meta/classes/package.bbclass<br>
&gt; @@ -2182,7 +2182,7 @@ python package_do_pkgconfig () {<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if m:<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 hdr =3D m.group(1)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 exp =3D pd.expand(m.group(2))<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if hdr =3D=3D &#39;Requires&#39;:<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if hdr =3D=3D &#39;Requires&#39; or hdr =3D=3D<br>
&gt; &#39;Requires.private&#39;:<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgconfig_needed[pkg] +=3D=
<br>
&gt; exp.replace(&#39;,&#39;, &#39; &#39;).split()<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 m =3D var_re.match(l)<br>
&gt; <br>
<br>
Unfortunately this patch fails to apply. This is not a patch against<br>
master and obviously hasn&#39;t need tested there.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#201165): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/201165" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/201165</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106876780/863=
4312" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106876780/8634312</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:sreejith.ravi087@gmail.com=
" target=3D"_blank">sreejith.ravi087@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a5a41f061bcb9f17--

