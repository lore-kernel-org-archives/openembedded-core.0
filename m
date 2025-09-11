Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F001CAC587
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 16:29:33 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.1997.1757608163095763126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 09:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout08.t-online.de (Postfix) with SMTP id ADA50E66D;
	Thu, 11 Sep 2025 18:29:20 +0200 (CEST)
Received: from [192.168.178.36] ([79.219.225.207]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uwkAd-0OMTeC0; Thu, 11 Sep 2025 18:29:16 +0200
Date: Thu, 11 Sep 2025 18:29:10 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] glib-2.0: update 2.84.4 -> 2.86.0
To: alex.kanavin@gmail.com
Cc: "Alexander Kanavin via lists.openembedded.org"
	<alex.kanavin=gmail.com@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org,
	"Khem Raj via lists.openembedded.org"
	<raj.khem=gmail.com@lists.openembedded.org>
Message-Id: <M4NF2T.NWI151OK55WY2@t-online.de>
In-Reply-To: <CANNYZj89e_Q80kSO-E7_iByBw72=0TuJNgoyPV1DzM=Q73irJg@mail.gmail.com>
References: <186275A42D34EEAB.19063@lists.openembedded.org>
	<5I7F2T.KIGKW1QUPNT51@t-online.de>
	<CANNYZj89e_Q80kSO-E7_iByBw72=0TuJNgoyPV1DzM=Q73irJg@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-lOijQBLSDc84qnghpuW9"
X-TOI-EXPURGATEID: 150726::1757608156-7B7FD9B4-F521375D/0/0 CLEAN NORMAL
X-TOI-MSGID: 6e9f46bc-2303-4256-be8b-ae8c271029d4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 16:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223288

--=-lOijQBLSDc84qnghpuW9
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

That's just my own ambition ;) But as far as I'm concerned, it's no=20
problem if the update has to stay. Things will become clear in time.

On Thu, Sep 11 2025 at 18:00:43 +02:00:00, Alexander Kanavin via=20
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>=20
wrote:
> On Thu, 11 Sept 2025 at 12:52, Markus Volk via lists.openembedded.org
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:f_l_k=3Dt-online.de@lists.openembedded.org>> wrote:
>>=20
>>  After briefly testing the upcoming gnome environment, I believe=20
>> that this update should be postponed until the next release. Support=20
>> for girepository-1 has been completely removed from the gnome=20
>> environment, which does not bode well for backward compatibility.=20
>> gnome-shell 48 is broken with glib-2.86 at runtime, and updating to=20
>> gnome-shell 49 requires an update to mutter, which in turn adds=20
>> glycin2 as a hard dependency. Despite several tests, I have not yet=20
>> been able to compile it. I am having problems with a 'rust error:=20
>> Linker =E2=80=9Ccc=E2=80=9D not found' and a problem that, despite crate=
s.inc,=20
>> the network must still be active during do_compile. In addition,=20
>> gnome-shell 49 requires a gjs update that requires mozjs140. I=20
>> performed this update and it works... but it is also not compatible=20
>> with gnome-shell 48. Finally, gnome-control-center also introduces a=20
>> new cross-compile issue that I have not yet investigated.
>>=20
>>  Long story short... there is still a lot to do and free time is=20
>> unfortunately scarce at the moment.
>=20
> Sadly this glib update has already landed in master. It would be
> really really unfortunate to have to revert it, so can we identify
> what is specifically broken with current gnome shell 48 and see if it
> can be fixed?
>=20
> I want to also remind you that you do not owe anyone a working
> gnome-shell. It's open source; if someone needs it working, they
> should be helping you, and not just take your efforts for granted.
>=20
> Alex
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223286):=20
> <https://lists.openembedded.org/g/openembedded-core/message/223286>
> Mute This Topic: <https://lists.openembedded.org/mt/115087264/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org=20
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-core/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-lOijQBLSDc84qnghpuW9
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>That's just my own ambition ;) But=
 as far as I'm concerned, it's no problem if the update has to stay. Things=
 will become clear in time.</div></div><div id=3D"geary-quote" dir=3D"auto"=
><br>On Thu, Sep 11 2025 at 18:00:43 +02:00:00, Alexander Kanavin via lists=
.openembedded.org &lt;alex.kanavin=3Dgmail.com@lists.openembedded.org&gt; w=
rote:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-=
space: break-spaces;">On Thu, 11 Sept 2025 at 12:52, Markus Volk via lists.=
openembedded.org
&lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.openembedded.org">f_l_k=3Dt=
-online.de@lists.openembedded.org</a>&gt; wrote:
<blockquote>
 After briefly testing the upcoming gnome environment, I believe that this =
update should be postponed until the next release. Support for girepository=
-1 has been completely removed from the gnome environment, which does not b=
ode well for backward compatibility. gnome-shell 48 is broken with glib-2.8=
6 at runtime, and updating to gnome-shell 49 requires an update to mutter, =
which in turn adds glycin2 as a hard dependency. Despite several tests, I h=
ave not yet been able to compile it. I am having problems with a 'rust erro=
r: Linker =E2=80=9Ccc=E2=80=9D not found' and a problem that, despite crate=
s.inc, the network must still be active during do_compile. In addition, gno=
me-shell 49 requires a gjs update that requires mozjs140. I performed this =
update and it works... but it is also not compatible with gnome-shell 48. F=
inally, gnome-control-center also introduces a new cross-compile issue that=
 I have not yet investigated.

 Long story short... there is still a lot to do and free time is unfortunat=
ely scarce at the moment.
</blockquote>
Sadly this glib update has already landed in master. It would be
really really unfortunate to have to revert it, so can we identify
what is specifically broken with current gnome shell 48 and see if it
can be fixed?

I want to also remind you that you do not owe anyone a working
gnome-shell. It's open source; if someone needs it working, they
should be helping you, and not just take your efforts for granted.

Alex
</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#223286): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/223286">https://lists.openembedded.org/g/openembedd=
ed-core/message/223286</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115087264/361=
8223">https://lists.openembedded.org/mt/115087264/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-lOijQBLSDc84qnghpuW9--


