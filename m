Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7F6C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 08:18:57 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.14333.1679041135028788569
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 01:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout01.t-online.de (Postfix) with SMTP id DC48E24503;
	Fri, 17 Mar 2023 09:18:51 +0100 (CET)
Received: from [192.168.178.83] ([79.219.227.8]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pd5IZ-0KzlWi0; Fri, 17 Mar 2023 09:18:51 +0100
Date: Fri, 17 Mar 2023 09:18:45 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] Remove usage of /var/volatile/tmp
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <9FONRR.ZLSABXKTP67E@t-online.de>
In-Reply-To: 
	<dd5e0f7df463ddc2733dc126beaa3bf29eb8d49b.camel@linuxfoundation.org>
References: <20230317060202.385862-1-f_l_k@t-online.de>
	<dd5e0f7df463ddc2733dc126beaa3bf29eb8d49b.camel@linuxfoundation.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-BB3Rq+29XwEIJ0MCH4RA"
X-TOI-EXPURGATEID: 150726::1679041131-FFFFA778-7AA60FEA/0/0 CLEAN NORMAL
X-TOI-MSGID: 61c57a63-24c2-48e5-83f9-80288843aecd
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 08:18:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178746

--=-BB3Rq+29XwEIJ0MCH4RA
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Am Fr, 17. M=E4r 2023 um 08:00:37 +0000 schrieb Richard Purdie=20
<richard.purdie@linuxfoundation.org>:
> This changes the system layout to what systemd wants but what happens
> to sysvinit or anything else though? Some systems won't have systemd-
> tmpfiles and so on present. The commit message above makes it sound
> like systemd is the only thing that exists/matters.

I like systemd and I like that it standardizes a lot of things, but I=20
really don't care about politics. That's why I also sent a patch for a=20
different way. But the commit message is right, that would clearly be a=20
step towards systemd.


--=-BB3Rq+29XwEIJ0MCH4RA
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Fr, 17. M=E4r 2023 um 08:00:37 +0000=
 schrieb Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;:<br><blo=
ckquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-=
spaces;">This changes the system layout to what systemd wants but what happ=
ens
to sysvinit or anything else though? Some systems won't have systemd-
tmpfiles and so on present. The commit message above makes it sound
like systemd is the only thing that exists/matters.</div></blockquote><div>=
<br></div><div>I like systemd and I like that it standardizes a lot of thin=
gs, but I really don't care about politics. That's why I also sent a patch =
for a different way. But the commit message is right, that would clearly be=
 a step towards systemd.</div></div>
--=-BB3Rq+29XwEIJ0MCH4RA--


