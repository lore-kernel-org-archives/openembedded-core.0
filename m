Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21D7C6370A
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.web08.31998.1650903565091933190
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 09:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=IJZWbMiU;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151,
 mailfrom: crg7475@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Kn9FP6lVKz9sW5
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 18:19:21 +0200 (CEST)
Content-Type: multipart/alternative;
 boundary="------------5Dym7E1rFbE6zKFXs2GX4h24"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1650903559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9YlX88eDvKjUycErZj1/h7Iu2aEVpCF5SN+7tt+lB9U=;
	b=IJZWbMiUrKmfCoTKaFG4MLF4ouqDXJtTw2NRG/qthPUd++CluW6tDNjL5JE5M1ixynrD/A
	YceGll8v44a5ibqNREVf8whQ67qDiRGjNzUCiTzJjfxWBsmweKI8t4MufH8CBGmegUQYCD
	jRfs3KrI9Xsq//MP88wZtFOgv9jFtf6tKfg9Wj8ZLxz6ej/AOQKNbMowHuEDsz22GSmzQ8
	O9L/p//QbPN7IGQPrgInd9Qg2FUQ9Gnno3c/NWEoWuw4/jskGmMJzv564gfZfAQrLjwFI8
	ipBXk+VPVbXRy5Pp+fSqr3ZILFtmbcfPOX94xqdVKkhkkI4JNLbq2Oq9hXScZg==
Message-ID: <1bd6d4e0-f62f-086c-6668-899037221a7d@mailbox.org>
Date: Mon, 25 Apr 2022 18:19:14 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [master][kirkstone][PATCH] gstreamer1.0-plugins-good:
 Fix libsoup dependency
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220425150104.1001838-1-crg7475@mailbox.org>
 <d250366a-40fe-0476-971d-4ff125559eb1@gmail.com>
From: Carlos Rafael Giani <crg7475@mailbox.org>
In-Reply-To: <d250366a-40fe-0476-971d-4ff125559eb1@gmail.com>
X-MBO-RS-META: 4781yx31h6fcxtpz9j86qi7u15oy8pfh
X-MBO-RS-ID: bd58660032b6bb5026d
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164834

This is a multi-part message in MIME format.
--------------5Dym7E1rFbE6zKFXs2GX4h24
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

According to https://gstreamer.freedesktop.org/releases/1.20/ , libsoup=20
3 support isn't stable:

 > Runtime compatibility support for libsoup2 and libsoup3 (libsoup3=20
support experimental)

So I wouldn't add it just yet.


On 25.04.22 17:39, Khem Raj wrote:
>
>
> On 4/25/22 8:01 AM, Carlos Rafael Giani via lists.openembedded.org wrot=
e:
>> Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
>> ---
>> =C2=A0 .../gstreamer/gstreamer1.0-plugins-good_1.20.1.bb=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7 ++++++-
>> =C2=A0 1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git=20
>> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.b=
b=20
>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.b=
b
>> index 08ff5a0bb5..1f61d9a10e 100644
>> ---=20
>> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.b=
b
>> +++=20
>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.b=
b
>> @@ -49,7 +49,12 @@ PACKAGECONFIG[libv4l2]=C2=A0=C2=A0=C2=A0 =3D=20
>> "-Dv4l2-libv4l2=3Denabled,-Dv4l2-libv4l2=3Ddisabled,v4l-
>> =C2=A0 PACKAGECONFIG[mpg123]=C2=A0=C2=A0=C2=A0=C2=A0 =3D=20
>> "-Dmpg123=3Denabled,-Dmpg123=3Ddisabled,mpg123"
>> =C2=A0 PACKAGECONFIG[pulseaudio] =3D=20
>> "-Dpulse=3Denabled,-Dpulse=3Ddisabled,pulseaudio"
>> =C2=A0 PACKAGECONFIG[qt5]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtbase=20
>> qtdeclarative qtbase-native ${QT5WAYLANDDEPENDS}"
>> -PACKAGECONFIG[soup]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=20
>> "-Dsoup=3Denabled,-Dsoup=3Ddisabled,libsoup-2.4"
>> +# Starting with version 1.20, the GStreamer soup plugin loads=20
>> libsoup with dlopen()
>> +# instead of linking to it. And instead of using the default libsoup=20
>> C headers, it
>> +# uses its own stub header. Consequently, objdump will not show the=20
>> libsoup .so as
>> +# a dependency, and libsoup won't be added to an image. Fix this by=20
>> setting libsoup
>> +# as RDEPEND instead of DEPEND.
>> +PACKAGECONFIG[soup]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=20
>> "-Dsoup=3Denabled,-Dsoup=3Ddisabled,,libsoup-2.4"
>
> We have soup3 as well. I wonder if that should also be an option ?
>
>> =C2=A0 PACKAGECONFIG[speex]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "-Dspeex=
=3Denabled,-Dspeex=3Ddisabled,speex"
>> =C2=A0 PACKAGECONFIG[rpi]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=20
>> "-Drpicamsrc=3Denabled,-Drpicamsrc=3Ddisabled,userland"
>> =C2=A0 PACKAGECONFIG[taglib]=C2=A0=C2=A0=C2=A0=C2=A0 =3D=20
>> "-Dtaglib=3Denabled,-Dtaglib=3Ddisabled,taglib"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#164825):=20
>> https://lists.openembedded.org/g/openembedded-core/message/164825
>> Mute This Topic: https://lists.openembedded.org/mt/90686912/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------5Dym7E1rFbE6zKFXs2GX4h24
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><font face=3D"Helvetica, Arial, sans-serif">According to
        <a class=3D"moz-txt-link-freetext" href=3D"https://gstreamer.free=
desktop.org/releases/1.20/">https://gstreamer.freedesktop.org/releases/1.=
20/</a> , libsoup 3
        support isn't stable:</font></p>
    <p><font face=3D"Helvetica, Arial, sans-serif">&gt; Runtime
        compatibility support for libsoup2 and libsoup3 (libsoup3
        support experimental)</font></p>
    <p><font face=3D"Helvetica, Arial, sans-serif">So I wouldn't add it
        just yet.</font></p>
    <p><font face=3D"Helvetica, Arial, sans-serif"></font><br>
    </p>
    <div class=3D"moz-cite-prefix">On 25.04.22 17:39, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:d250366a-40fe-0476-971d-4ff125559eb1@gmail.com">
      <br>
      <br>
      On 4/25/22 8:01 AM, Carlos Rafael Giani via lists.openembedded.org
      wrote:
      <br>
      <blockquote type=3D"cite">Signed-off-by: Carlos Rafael Giani
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:crg7475@mailbox=
.org">&lt;crg7475@mailbox.org&gt;</a>
        <br>
        ---
        <br>
        =C2=A0 .../gstreamer/gstreamer1.0-plugins-good_1.20.1.bb=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7
        ++++++-
        <br>
        =C2=A0 1 file changed, 6 insertions(+), 1 deletion(-)
        <br>
        <br>
        diff --git
        a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2=
0.1.bb
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
        <br>
        index 08ff5a0bb5..1f61d9a10e 100644
        <br>
        ---
        a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2=
0.1.bb
        <br>
        +++
        b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2=
0.1.bb
        <br>
        @@ -49,7 +49,12 @@ PACKAGECONFIG[libv4l2]=C2=A0=C2=A0=C2=A0 =3D
        "-Dv4l2-libv4l2=3Denabled,-Dv4l2-libv4l2=3Ddisabled,v4l-
        <br>
        =C2=A0 PACKAGECONFIG[mpg123]=C2=A0=C2=A0=C2=A0=C2=A0 =3D
        "-Dmpg123=3Denabled,-Dmpg123=3Ddisabled,mpg123"
        <br>
        =C2=A0 PACKAGECONFIG[pulseaudio] =3D
        "-Dpulse=3Denabled,-Dpulse=3Ddisabled,pulseaudio"
        <br>
        =C2=A0 PACKAGECONFIG[qt5]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D
        "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtbase qtdeclarative qtbase-nat=
ive
        ${QT5WAYLANDDEPENDS}"
        <br>
        -PACKAGECONFIG[soup]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D
        "-Dsoup=3Denabled,-Dsoup=3Ddisabled,libsoup-2.4"
        <br>
        +# Starting with version 1.20, the GStreamer soup plugin loads
        libsoup with dlopen()
        <br>
        +# instead of linking to it. And instead of using the default
        libsoup C headers, it
        <br>
        +# uses its own stub header. Consequently, objdump will not show
        the libsoup .so as
        <br>
        +# a dependency, and libsoup won't be added to an image. Fix
        this by setting libsoup
        <br>
        +# as RDEPEND instead of DEPEND.
        <br>
        +PACKAGECONFIG[soup]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D
        "-Dsoup=3Denabled,-Dsoup=3Ddisabled,,libsoup-2.4"
        <br>
      </blockquote>
      <br>
      We have soup3 as well. I wonder if that should also be an option ?
      <br>
      <br>
      <blockquote type=3D"cite">=C2=A0 PACKAGECONFIG[speex]=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D
        "-Dspeex=3Denabled,-Dspeex=3Ddisabled,speex"
        <br>
        =C2=A0 PACKAGECONFIG[rpi]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D
        "-Drpicamsrc=3Denabled,-Drpicamsrc=3Ddisabled,userland"
        <br>
        =C2=A0 PACKAGECONFIG[taglib]=C2=A0=C2=A0=C2=A0=C2=A0 =3D
        "-Dtaglib=3Denabled,-Dtaglib=3Ddisabled,taglib"
        <br>
        <br>
        <br>
        <br>
        -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
        <br>
        Links: You receive all messages sent to this group.
        <br>
        View/Reply Online (#164825):
        <a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembe=
dded.org/g/openembedded-core/message/164825">https://lists.openembedded.o=
rg/g/openembedded-core/message/164825</a>
        <br>
        Mute This Topic:
        <a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembe=
dded.org/mt/90686912/1997914">https://lists.openembedded.org/mt/90686912/=
1997914</a>
        <br>
        Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto=
:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@=
lists.openembedded.org</a>
        <br>
        Unsubscribe:
        <a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembe=
dded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/open=
embedded-core/unsub</a>
        [<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:raj.khem@gm=
ail.com">raj.khem@gmail.com</a>]
        <br>
        -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
        <br>
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------5Dym7E1rFbE6zKFXs2GX4h24--

