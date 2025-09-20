Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4082CAC5A0
	for <webhook@archiver.kernel.org>; Sat, 20 Sep 2025 10:50:02 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.7350.1758365401077617987
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Sep 2025 03:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout11.t-online.de (Postfix) with SMTP id 2E9201C5FC;
	Sat, 20 Sep 2025 12:49:59 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.169.67]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uzvAC-3cshnc0; Sat, 20 Sep 2025 12:49:56 +0200
Date: Sat, 20 Sep 2025 12:49:50 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 1/2] introduce virtual/ffmpeg
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <2FVV2T.SU62KH523LF@t-online.de>
In-Reply-To: <CANNYZj964ZPDbN7HjhCCkxS5a9dPR7-uVewK9pcrpcZp9ZVGLw@mail.gmail.com>
References: <20250916155800.3860178-1-f_l_k@t-online.de>
	<CANNYZj964ZPDbN7HjhCCkxS5a9dPR7-uVewK9pcrpcZp9ZVGLw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-i916CXkNSc0DQ+QIrHec"
X-TOI-EXPURGATEID: 150726::1758365396-57FFC90B-6DF864D3/0/0 CLEAN NORMAL
X-TOI-MSGID: 447a60f3-1569-49d6-b3e0-d56c788a35f9
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Sep 2025 10:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223779

--=-i916CXkNSc0DQ+QIrHec
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16 2025 at 18:26:32 +02:00:00, Alexander Kanavin=20
<alex.kanavin@gmail.com> wrote:
> This needs more detail. What else would be providing virtual/ffmpeg,
> other than ffmpeg itself? Why the justification is talking about
> 'different versions', and not different providers?


Because it's been a while, I found it surprisingly difficult to get to=20
the point ;)

I think I tried it as you recommended, and I also think that I only=20
needed =E2=80=98virtual/kodi=E2=80=99 at the time.
The 'idea' of virtual/ffmpeg is introduced in meta-raspberrypi because=20
it provides rpidistro-ffmpeg,
and the build system therefore expects me to set a PREFERRED_PROVIDER=20
for it.


--=-i916CXkNSc0DQ+QIrHec
Content-Type: text/html; charset=windows-1251
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Tue, Sep 16 2025 at 18:26:32 +02:00:=
00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote =
type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;"=
>This needs more detail. What else would be providing virtual/ffmpeg,
other than ffmpeg itself? Why the justification is talking about
'different versions', and not different providers?</div></blockquote><div><=
br></div><div><br></div><div><div>Because it's been a while, I found it sur=
prisingly difficult to get to the point ;)</div><div><br></div><div>I think=
 I tried it as you recommended, and I also think that I only needed =E2=80=
=98virtual/kodi=E2=80=99 at the time.</div><div>The 'idea' of virtual/ffmpe=
g is introduced in meta-raspberrypi because it provides rpidistro-ffmpeg,</=
div><div>and the build system therefore expects me to set a PREFERRED_PROVI=
DER for it.</div></div></div>
--=-i916CXkNSc0DQ+QIrHec--


