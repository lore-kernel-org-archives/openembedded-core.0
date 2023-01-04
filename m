Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12B5C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 12:24:22 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.10645.1672835059873427047
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 04:24:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.17, mailfrom: kubiznak@2n.com)
From: =?iso-8859-2?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for
 GI_DATA_ENABLED
Thread-Topic: [OE-core][PATCH 1/2] gobject-introspection: check for
 GI_DATA_ENABLED
Thread-Index: AQHZIDIvVR7HPOD4Nkm3C4IeSj1LKa6OJ86sgAACnh8=
Date: Wed, 4 Jan 2023 12:24:17 +0000
Message-ID: <35848697143b4b3a8612c027d8852575@2n.com>
References: <20230104114555.575278-1-kubiznak@2n.com>
 <17371904FDF90491.29426@lists.openembedded.org>,<CANNYZj8Qfcs+X8yGRiHZJygZ0RH4n=KDsKXkXO-+duY=ycRS5A@mail.gmail.com>
In-Reply-To: <CANNYZj8Qfcs+X8yGRiHZJygZ0RH4n=KDsKXkXO-+duY=ycRS5A@mail.gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: multipart/alternative;
	boundary="_000_35848697143b4b3a8612c027d88525752ncom_"
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 12:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175472

--_000_35848697143b4b3a8612c027d88525752ncom_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi Alex,


Yes, that's exactly the reason. I'm particularly concerned about dependency=
 on glib, but other dependencies are unnecessary, too.


This change was sufficient to remove the dependency from the target. I am n=
ot aware of potential consequences of removing the -native dependencies, bu=
t if you think it should also be done, I'm happy to update the patch. Pleas=
e let me know.


Petr

________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Wednesday, January 4, 2023 12:59:58 PM
To: alex.kanavin@gmail.com
Cc: Petr Kubiz=F2=E1k - 2N; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_DATA_=
ENABLED

I mean, if you want to do this to reduce dependency chains, then
depending on qemu-native and g-i-native isn't necessary either. But
the patch as it is seems like going halfway.

Alex

On Wed, 4 Jan 2023 at 12:54, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Wed, 4 Jan 2023 at 12:46, Petr Kubiz=F2=E1k <kubiznak@2n.com> wrote:
> > When GI_DATA_ENABLED is 'False' (e.g. because
> > 'gobject-introspection-data' is not in DISTRO_FEATURES),
> > gobject-introspection should not be added to DEPENDS.
>
> Why?
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175467): https://lists.openembedded.org/g/openembedde=
d-core/message/175467
> Mute This Topic: https://lists.openembedded.org/mt/96048399/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--_000_35848697143b4b3a8612c027d88525752ncom_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;">
<p>Hi Alex,</p>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;App=
le Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe =
UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<p><br>
</p>
<p>Yes, that's exactly the reason. I'm particularly concerned about depende=
ncy on&nbsp;glib, but other dependencies are unnecessary, too.</p>
<p><br>
</p>
<p>This change was sufficient to remove the dependency from the target. I a=
m not aware of potential consequences of removing the -native dependencies,=
 but if you think it should also&nbsp;be done, I'm happy to update the patc=
h. Please let me know.</p>
<p><br>
</p>
<p>Petr</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Alexander Kanavin &=
lt;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, January 4, 2023 12:59:58 PM<br>
<b>To:</b> alex.kanavin@gmail.com<br>
<b>Cc:</b> Petr Kubiz=F2=E1k - 2N; openembedded-core@lists.openembedded.org=
<br>
<b>Subject:</b> Re: [OE-core][PATCH 1/2] gobject-introspection: check for G=
I_DATA_ENABLED</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt">
<div class=3D"PlainText">I mean, if you want to do this to reduce dependenc=
y chains, then<br>
depending on qemu-native and g-i-native isn't necessary either. But<br>
the patch as it is seems like going halfway.<br>
<br>
Alex<br>
<br>
On Wed, 4 Jan 2023 at 12:54, Alexander Kanavin via<br>
lists.openembedded.org &lt;alex.kanavin=3Dgmail.com@lists.openembedded.org&=
gt;<br>
wrote:<br>
&gt;<br>
&gt; On Wed, 4 Jan 2023 at 12:46, Petr Kubiz=F2=E1k &lt;kubiznak@2n.com&gt;=
 wrote:<br>
&gt; &gt; When GI_DATA_ENABLED is 'False' (e.g. because<br>
&gt; &gt; 'gobject-introspection-data' is not in DISTRO_FEATURES),<br>
&gt; &gt; gobject-introspection should not be added to DEPENDS.<br>
&gt;<br>
&gt; Why?<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#175467): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/175467" id=3D"LPlnk126645" previewremoved=3D"t=
rue">
https://lists.openembedded.org/g/openembedded-core/message/175467</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96048399=
/1686489" id=3D"LPlnk525646" previewremoved=3D"true">
https://lists.openembedded.org/mt/96048399/1686489</a><br>
&gt; Group Owner: openembedded-core&#43;owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" id=3D"LPlnk918967" previewremoved=3D"true">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [alex.kanavin@=
gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_35848697143b4b3a8612c027d88525752ncom_--

