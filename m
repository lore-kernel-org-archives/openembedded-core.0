Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF421C74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 17:31:39 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.25902.1679074293387537110
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 10:31:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout04.t-online.de (Postfix) with SMTP id 852F121D94;
	Fri, 17 Mar 2023 18:31:30 +0100 (CET)
Received: from [192.168.178.83] ([79.219.227.8]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pdDvN-3NIgzI0; Fri, 17 Mar 2023 18:31:29 +0100
Date: Fri, 17 Mar 2023 18:31:23 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] Remove usage of /var/volatile/tmp
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <B0EORR.JWJ884MGYK8G2@t-online.de>
In-Reply-To: 
	<a1807744c2e652e0d05c1c313039e697b2b07d1e.camel@linuxfoundation.org>
References: <20230317060202.385862-1-f_l_k@t-online.de>
	<dd5e0f7df463ddc2733dc126beaa3bf29eb8d49b.camel@linuxfoundation.org>
	<9FONRR.ZLSABXKTP67E@t-online.de>
	<a1807744c2e652e0d05c1c313039e697b2b07d1e.camel@linuxfoundation.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-4lMjYjPAfUAyCzriDHrI"
X-TOI-EXPURGATEID: 150726::1679074289-812ECD99-4D04532A/0/0 CLEAN NORMAL
X-TOI-MSGID: 05b52a8f-4ab5-4871-816b-11d2835b1b44
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 17:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178758

--=-4lMjYjPAfUAyCzriDHrI
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Am Fr, 17. M=E4r 2023 um 11:53:17 +0000 schrieb Richard Purdie=20
<richard.purdie@linuxfoundation.org>:
> It would help me if adverse effects are mentioned in commit messages.
> In this case I can spot it easily enough but I don't always know/spot
> all the issues.

It would be too harsh to say that I don't care about sysvinit. Of=20
course, if something breaks as a result of this commit, I'm willing to=20
take care of it if I can help. It's just that I don't personally use=20
it, so I haven't identified any other issues that might be relevant to=20
sysvinit. Other than the obvious that anything that would write=20
directly to '/var/volatile/tmp' would break.
At least I checked that sysvinit images could still boot. I have=20
successfully run core-image-ptest-glib-2.0 with this patch applied. If=20
I knew of any problems with sysvinit I would have pointed them out, but=20
unfortunately I have no further findings yet


--=-4lMjYjPAfUAyCzriDHrI
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Fr, 17. M=E4r 2023 um 11:53:17 +0000=
 schrieb Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;:<br><blo=
ckquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-=
spaces;">It would help me if adverse effects are mentioned in commit messag=
es.
In this case I can spot it easily enough but I don't always know/spot
all the issues.</div></blockquote><div><br></div><div><div>It would be too =
harsh to say that I don't care about sysvinit. Of course, if something brea=
ks as a result of this commit, I'm willing to take care of it if I can help=
. It's just that I don't personally use it, so I haven't identified any oth=
er issues that might be relevant to sysvinit. Other than the obvious that a=
nything that would write directly to '/var/volatile/tmp' would break.</div>=
<div>At least I checked that sysvinit images could still boot. I have succe=
ssfully run core-image-ptest-glib-2.0 with this patch applied. If I knew of=
 any problems with sysvinit I would have pointed them out, but unfortunatel=
y I have no further findings yet&nbsp;</div></div></div>
--=-4lMjYjPAfUAyCzriDHrI--


