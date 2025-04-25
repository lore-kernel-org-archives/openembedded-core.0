Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26859C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 08:25:37 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.2315.1745569532707261735
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 01:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout09.t-online.de (Postfix) with SMTP id CB9244E8;
	Fri, 25 Apr 2025 10:25:30 +0200 (CEST)
Received: from [192.168.178.20] ([84.154.169.200]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u8ENF-4RTyme0; Fri, 25 Apr 2025 10:25:29 +0200
Date: Fri, 25 Apr 2025 10:25:23 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] default-providers.inc: add entries for
 virtual/libsdl2
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <B2M9VS.YHEM9X6L6IP01@t-online.de>
In-Reply-To: <CANNYZj9POGReasMqgt6=BVRexWAMGF0FYbVoPzNwRkfojTk-7Q@mail.gmail.com>
References: <20250424213951.2514902-1-f_l_k@t-online.de>
	<CANNYZj9POGReasMqgt6=BVRexWAMGF0FYbVoPzNwRkfojTk-7Q@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-oezVk2LqGzp3WXXlp+6T"
X-TOI-EXPURGATEID: 150726::1745569529-F97F992D-FD77A121/0/0 CLEAN NORMAL
X-TOI-MSGID: 4ae9a9d6-64e4-4932-9899-99766f63824c
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 08:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215441

--=-oezVk2LqGzp3WXXlp+6T
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25 2025 at 09:59:58 +02:00:00, Alexander Kanavin via=20
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>=20
wrote:
> This is fine, but it makes me wonder: is libsdl2-compat compatible
> enough to build qemu-system-native with it? Can you try that? Then we
> might consider switching over to sdl3 in core.

I have already tried this. I have set it up as follows:
VIRTUAL-RUNTIME_libsdl2 =3D =E2=80=9Clibsdl2-compat=E2=80=9D
PREFERRED_PROVIDER_virtual/libsdl2 =3D =E2=80=9Clibsdl2-compat=E2=80=9D
PREFERRED_PROVIDER_virtual/libsdl2-native =3D =E2=80=9Clibsdl2-compat-nativ=
e=E2=80=9D
PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 =3D=20
=E2=80=9Cnativesdk-libsdl2-compat=E2=80=9D

and I was able to build my complete image, which includes building=20
qemu-system-native
and also a lot of libsdl2 games, and at least compilation-wise there=20
were no problems.
I also noticed quite some runtime improvements if running libsdl2 apps=20
under wayland

Some possible problems I can think of:

- libsdl2-compat would add a requirement for x11 and opengl
- I'm not sure why this is, but libsdl2-compat was added to=20
non-repro-meta-oe.inc, which
  suggests there may still be a reproducibility issue


--=-oezVk2LqGzp3WXXlp+6T
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Fri, Apr 25 2025 at 09:59:58 +02:00:=
00, Alexander Kanavin via lists.openembedded.org &lt;alex.kanavin=3Dgmail.c=
om@lists.openembedded.org&gt; wrote:<br><blockquote type=3D"cite"><div clas=
s=3D"plaintext" style=3D"white-space: break-spaces;">This is fine, but it m=
akes me wonder: is libsdl2-compat compatible
enough to build qemu-system-native with it? Can you try that? Then we
might consider switching over to sdl3 in core.</div></blockquote><div><br><=
/div><div><div>I have already tried this. I have set it up as follows:</div=
><div>VIRTUAL-RUNTIME_libsdl2 =3D =E2=80=9Clibsdl2-compat=E2=80=9D</div><di=
v>PREFERRED_PROVIDER_virtual/libsdl2 =3D =E2=80=9Clibsdl2-compat=E2=80=9D</=
div><div>PREFERRED_PROVIDER_virtual/libsdl2-native =3D =E2=80=9Clibsdl2-com=
pat-native=E2=80=9D</div><div>PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 =
=3D =E2=80=9Cnativesdk-libsdl2-compat=E2=80=9D</div><div><br></div><div>and=
 I was able to build my complete image, which includes building qemu-system=
-native</div><div>and also a lot of libsdl2 games, and at least compilation=
-wise there were no problems.</div><div>I also noticed quite some runtime i=
mprovements if running libsdl2 apps under wayland</div><div><br></div><div>=
Some possible problems I can think of:</div><div><br></div><div>- libsdl2-c=
ompat would add a requirement for x11 and opengl</div><div>- I'm not sure w=
hy this is, but libsdl2-compat was added to non-repro-meta-oe.inc, which</d=
iv><div>&nbsp; suggests there may still be a reproducibility issue</div></d=
iv></div>
--=-oezVk2LqGzp3WXXlp+6T--


