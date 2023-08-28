Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967CDC83F12
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 17:31:35 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.405.1693243886871913272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 10:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=y4/l+nGS;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=I8o6GN/d9HwygeCxr4fpZb04QVdUYgqYX5jwUY4oWFI=; b=y4/l+nGSFI2zgaDDDtRgk4lup9
	VuAi17Bef1Mak5adQus9Vn0ZUkb2jP50kz4ytZg52+9gjiOH+kiCeB+fBu9UPf/tTH/qoDkv7Pl8Q
	cC0ejyS0z8C3b8hxP44uh28UFXsw41Aroq4MWY0KARTfBOaoJHvKl8w17sK5Odu/CGNvZt9KBFRzX
	kOnchxnrSHO3E01wTKE0WvtKU6qxIFzbhb35kUrFakCd6DF2iPWJEzJUOvhXjV6xvtm2Q9jWvc7KV
	dw4+TxE/hbG0WslmIjYMn7aM27O82RwMdi+LVXSdIHmjenRhmNElTKOtXm8a6tJsu6+G6wgsgqAmY
	E6+gliKw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1qag5E-0000la-Ua; Mon, 28 Aug 2023 19:31:24 +0200
Received: from 85.184.138.13.dynamic.dhcp.aura-net.dk ([85.184.138.13] helo=[127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <martin@geanix.com>)
	id 1qag5E-0008mX-HY; Mon, 28 Aug 2023 19:31:24 +0200
Date: Mon, 28 Aug 2023 19:31:24 +0200 (GMT+02:00)
From: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <0f05b0a6-d210-4640-b04b-1880a09558e9@geanix.com>
In-Reply-To: <CAMKF1soPeynqxqQs6tsxdvbOXriZOGByDJijU76a3eodcqE91g@mail.gmail.com>
References: <20230828124834.376779-1-martin@geanix.com> <20230828124834.376779-3-martin@geanix.com> <CAMKF1soPeynqxqQs6tsxdvbOXriZOGByDJijU76a3eodcqE91g@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 3/5] ninja: build modified version with
 GNU Make jobserver support
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_20_10698535.1693243884106"
X-Correlation-ID: <0f05b0a6-d210-4640-b04b-1880a09558e9@geanix.com>
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27014/Mon Aug 28 09:38:26 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 17:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186841

------=_Part_20_10698535.1693243884106
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Aug 28, 2023 19:16:28 Khem Raj <raj.khem@gmail.com>:

> On Mon, Aug 28, 2023 at 5:48=E2=80=AFAM Martin Hundeb?ll <martin@geanix.c=
om> wrote:
>>
>> Ninja doesn't (yet) support the GNU Make jobserver out of the box, but
>> there is a pull request adding that support[1]. Switch the SRC_URI and
>> SRCREV to point at the source of that pull request, to make ninja play
>> nicely together with the recently added jobserver class.
>>
>> Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
>> ---
>> .../ninja/{ninja_1.11.1.bb =3D> ninja_1.12.0.bb}=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>> rename meta/recipes-devtools/ninja/{ninja_1.11.1.bb =3D> ninja_1.12.0.bb=
} (84%)
>>
>> diff --git a/meta/recipes-devtools/ninja/ninja_1.11.1.bb b/meta/recipes-=
devtools/ninja/ninja_1.12.0.bb
>> similarity index 84%
>> rename from meta/recipes-devtools/ninja/ninja_1.11.1.bb
>> rename to meta/recipes-devtools/ninja/ninja_1.12.0.bb
>> index 8e297ec4d4..9abdd40a92 100644
>> --- a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
>> +++ b/meta/recipes-devtools/ninja/ninja_1.12.0.bb
>> @@ -6,9 +6,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da81586a64ad4e=
476c791cda7e2f2c52e"
>>
>> DEPENDS =3D "re2c-native ninja-native"
>>
>> -SRCREV =3D "a524bf3f6bacd1b4ad85d719eed2737d8562f27a"
>> +SRCREV =3D "c9e21dbbc4c746ba397c0f9bec5f65c99f783c08"
>>
>> -SRC_URI =3D "git://github.com/ninja-build/ninja.git;branch=3Drelease;pr=
otocol=3Dhttps"
>> +SRC_URI =3D "git://github.com/stefanb2/ninja.git;branch=3Dtopic-issue-1=
139-part-3-jobserver-fifo;protocol=3Dhttps"
>
> This is a little concerning, as we are pointing to a fork here and
> quite a lot depend on ninja now
> a days. so I wonder whats the status of the patches and likelyhood of
> them going upstream
> in anycase, we should pick the patches instead of switching SRC_URI

Yes, I agree that we shouldn't change uri to a fork; hence the RFC... Maybe=
 I should try to put some pressure on ninja upstream to consider the pull r=
equest...

I can look into whether a separate patch is feasible...

>> UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
>>
>> S =3D "${WORKDIR}/git"
>> --
>> 2.41.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#186825): https://lists.openembedded.org/g/openembedd=
ed-core/message/186825
>> Mute This Topic: https://lists.openembedded.org/mt/101009093/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [r=
aj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


------=_Part_20_10698535.1693243884106
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
 <head>
  <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scale=3D=
1.0">
 </head>
 <body>
  <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">Aug 28, 2=
023 19:16:28 Khem Raj &lt;raj.khem@gmail.com&gt;:</span> <br> <br> <span di=
r=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; On Mon, Aug 28, 202=
3 at 5:48=E2=80=AFAM Martin Hundeb?ll &lt;martin@geanix.com&gt; wrote:</spa=
n> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;=
</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt=
;&gt; Ninja doesn't (yet) support the GNU Make jobserver out of the box, bu=
t</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&g=
t;&gt; there is a pull request adding that support[1]. Switch the SRC_URI a=
nd</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&=
gt;&gt; SRCREV to point at the source of that pull request, to make ninja p=
lay</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">=
&gt;&gt; nicely together with the recently added jobserver class.</span> <b=
r> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</spa=
n> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;=
 Signed-off-by: Martin Hundeb=C3=B8ll &lt;martin@geanix.com&gt;</span> <br>=
 <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; ---</s=
pan> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&g=
t; .../ninja/{ninja_1.11.1.bb =3D&gt; ninja_1.12.0.bb}&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 4 +=
+--</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">=
&gt;&gt; 1 file changed, 2 insertions(+), 2 deletions(-)</span> <br> <span =
dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; rename meta/r=
ecipes-devtools/ninja/{ninja_1.11.1.bb =3D&gt; ninja_1.12.0.bb} (84%)</span=
> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;<=
/span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;=
&gt; diff --git a/meta/recipes-devtools/ninja/ninja_1.11.1.bb b/meta/recipe=
s-devtools/ninja/ninja_1.12.0.bb</span> <br> <span dir=3D"ltr" style=3D"mar=
gin-top:0; margin-bottom:0;">&gt;&gt; similarity index 84%</span> <br> <spa=
n dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; rename from=
 meta/recipes-devtools/ninja/ninja_1.11.1.bb</span> <br> <span dir=3D"ltr" =
style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; rename to meta/recipes-de=
vtools/ninja/ninja_1.12.0.bb</span> <br> <span dir=3D"ltr" style=3D"margin-=
top:0; margin-bottom:0;">&gt;&gt; index 8e297ec4d4..9abdd40a92 100644</span=
> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; =
--- a/meta/recipes-devtools/ninja/ninja_1.11.1.bb</span> <br> <span dir=3D"=
ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; +++ b/meta/recipes-d=
evtools/ninja/ninja_1.12.0.bb</span> <br> <span dir=3D"ltr" style=3D"margin=
-top:0; margin-bottom:0;">&gt;&gt; @@ -6,9 +6,9 @@ LIC_FILES_CHKSUM =3D "fi=
le://COPYING;md5=3Da81586a64ad4e476c791cda7e2f2c52e"</span> <br> <span dir=
=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</span> <br> <spa=
n dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; DEPENDS =3D=
 "re2c-native ninja-native"</span> <br> <span dir=3D"ltr" style=3D"margin-t=
op:0; margin-bottom:0;">&gt;&gt;</span> <br> <span dir=3D"ltr" style=3D"mar=
gin-top:0; margin-bottom:0;">&gt;&gt; -SRCREV =3D "a524bf3f6bacd1b4ad85d719=
eed2737d8562f27a"</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; marg=
in-bottom:0;">&gt;&gt; +SRCREV =3D "c9e21dbbc4c746ba397c0f9bec5f65c99f783c0=
8"</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&=
gt;&gt;</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:=
0;">&gt;&gt; -SRC_URI =3D "git://github.com/ninja-build/ninja.git;branch=3D=
release;protocol=3Dhttps"</span> <br> <span dir=3D"ltr" style=3D"margin-top=
:0; margin-bottom:0;">&gt;&gt; +SRC_URI =3D "git://github.com/stefanb2/ninj=
a.git;branch=3Dtopic-issue-1139-part-3-jobserver-fifo;protocol=3Dhttps"</sp=
an> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;</s=
pan> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; T=
his is a little concerning, as we are pointing to a fork here and</span> <b=
r> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; quite a =
lot depend on ninja now</span> <br> <span dir=3D"ltr" style=3D"margin-top:0=
; margin-bottom:0;">&gt; a days. so I wonder whats the status of the patche=
s and likelyhood of</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; ma=
rgin-bottom:0;">&gt; them going upstream</span> <br> <span dir=3D"ltr" styl=
e=3D"margin-top:0; margin-bottom:0;">&gt; in anycase, we should pick the pa=
tches instead of switching SRC_URI</span> <br> <br> <span dir=3D"ltr" style=
=3D"margin-top:0; margin-bottom:0;">Yes, I agree that we shouldn't change u=
ri to a fork; hence the RFC... Maybe I should try to put some pressure on n=
inja upstream to consider the pull request...</span> <br> <br> <span dir=3D=
"ltr" style=3D"margin-top:0; margin-bottom:0;">I can look into whether a se=
parate patch is feasible...</span> <br> <br> <span dir=3D"ltr" style=3D"mar=
gin-top:0; margin-bottom:0;">&gt;&gt; UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P&=
lt;pver&gt;.*)"</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin=
-bottom:0;">&gt;&gt;</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; m=
argin-bottom:0;">&gt;&gt; S =3D "${WORKDIR}/git"</span> <br> <span dir=3D"l=
tr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; --</span> <br> <span =
dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; 2.41.0</span>=
 <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</=
span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&=
gt;</span> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">=
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</span> <br> <span di=
r=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; Links: You rece=
ive all messages sent to this group.</span> <br> <span dir=3D"ltr" style=3D=
"margin-top:0; margin-bottom:0;">&gt;&gt; View/Reply Online (#186825): http=
s://lists.openembedded.org/g/openembedded-core/message/186825</span> <br> <=
span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; Mute Thi=
s Topic: https://lists.openembedded.org/mt/101009093/1997914</span> <br> <s=
pan dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; Group Own=
er: openembedded-core+owner@lists.openembedded.org</span> <br> <span dir=3D=
"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; Unsubscribe: https:=
//lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]</sp=
an> <br> <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt=
; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</span> <br> <span dir=3D"lt=
r" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt;</span> <br> <br>
 </body>
</html>
------=_Part_20_10698535.1693243884106--

