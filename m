Return-Path: <mares@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A3DC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 10:45:11 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.9072.1672829106228248273
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 02:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: mares@2n.com)
From: =?iso-8859-2?Q?Miroslav_Mare=B9_-_2N?= <Mares@2n.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] wpa-supplicant: Enable native builds
Thread-Topic: [OE-core] [PATCH] wpa-supplicant: Enable native builds
Thread-Index: AQHZIB3/+7JQXzZsL0Sh+DXcXHckta6N66YAgAAfKPaAAAcuRA==
Date: Wed, 4 Jan 2023 10:45:04 +0000
Message-ID: <c39b9d786d904b5bbfc82ba4cc8eb33b@2n.com>
References: <Y7VFxCWF/bLuBrSc@nuoska>
 <10036.1672826007578485001@lists.openembedded.org>,<CANNYZj-ztn+YBaJrf6ArbQaxPk9gZ5oWaMmcYN0Ej-95hT0WZA@mail.gmail.com>
In-Reply-To: <CANNYZj-ztn+YBaJrf6ArbQaxPk9gZ5oWaMmcYN0Ej-95hT0WZA@mail.gmail.com>
Accept-Language: cs-CZ, sv-SE, en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: multipart/alternative;
	boundary="_000_c39b9d786d904b5bbfc82ba4cc8eb33b2ncom_"
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 10:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175384

--_000_c39b9d786d904b5bbfc82ba4cc8eb33b2ncom_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Thank you for the information, in this case we should resort to using the b=
bappend,

because we don't have any use case of wpa-supplicant as a tool needed for t=
arget builds.

________________________________
Od: Alexander Kanavin <alex.kanavin@gmail.com>
Odesl=E1no: st=F8eda 4. ledna 2023 11:15:37
Komu: Miroslav Mare=B9 - 2N
Kopie: openembedded-core@lists.openembedded.org
P=F8edm=ECt: Re: [OE-core] [PATCH] wpa-supplicant: Enable native builds

You can easily enable native supplicant via a .bbappend in your own layer.

Native builds are not meant for running tests on the software that
goes into a product, they're meant only for building tools that are
needed for target builds.

Can we see the tests?

Alex

On Wed, 4 Jan 2023 at 10:53, Miroslav Mare=B9 <mares@2n.com> wrote:
>
> We are using native builds to run some tests on the software we develop i=
n Yocto
> and some of this software uses wpa-supplicant library.
>
> Is this an acceptable use case?
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175381): https://lists.openembedded.org/g/openembedde=
d-core/message/175381
> Mute This Topic: https://lists.openembedded.org/mt/96047102/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--_000_c39b9d786d904b5bbfc82ba4cc8eb33b2ncom_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>Thank you for the information, in this case we should resort to using th=
e bbappend,</p>
<p>because we don't have any use case of wpa-supplicant as a tool needed fo=
r target builds.</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>Od:</b> Alexander Kanavin &lt=
;alex.kanavin@gmail.com&gt;<br>
<b>Odesl=E1no:</b> st=F8eda 4. ledna 2023 11:15:37<br>
<b>Komu:</b> Miroslav Mare=B9 - 2N<br>
<b>Kopie:</b> openembedded-core@lists.openembedded.org<br>
<b>P=F8edm=ECt:</b> Re: [OE-core] [PATCH] wpa-supplicant: Enable native bui=
lds</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">You can easily enable native supplicant via a .bba=
ppend in your own layer.<br>
<br>
Native builds are not meant for running tests on the software that<br>
goes into a product, they're meant only for building tools that are<br>
needed for target builds.<br>
<br>
Can we see the tests?<br>
<br>
Alex<br>
<br>
On Wed, 4 Jan 2023 at 10:53, Miroslav Mare=B9 &lt;mares@2n.com&gt; wrote:<b=
r>
&gt;<br>
&gt; We are using native builds to run some tests on the software we develo=
p in Yocto<br>
&gt; and some of this software uses wpa-supplicant library.<br>
&gt;<br>
&gt; Is this an acceptable use case?<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#175381): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/175381">
https://lists.openembedded.org/g/openembedded-core/message/175381</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96047102=
/1686489">https://lists.openembedded.org/mt/96047102/1686489</a><br>
&gt; Group Owner: openembedded-core&#43;owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [alex.kanavin@=
gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font>
</body>
</html>

--_000_c39b9d786d904b5bbfc82ba4cc8eb33b2ncom_--

