Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64694C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 13:05:19 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.10544.1741352716249699162
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 05:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout08.t-online.de (Postfix) with SMTP id CC4A2F92;
	Fri,  7 Mar 2025 14:05:12 +0100 (CET)
Received: from [192.168.178.20] ([84.154.160.145]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tqXO3-0ufAq80; Fri, 7 Mar 2025 14:05:11 +0100
Date: Fri, 07 Mar 2025 14:05:54 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH v2] btrfs-tools: upgrade 6.12 -> 6.13
To: ross.burton@arm.com
Cc: wangmy@fujitsu.com, "Ross Burton via lists.openembedded.org"
	<ross.burton=arm.com@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org
Message-Id: <UD8RSS.47AJZQPO7BE93@t-online.de>
In-Reply-To: <B28BC953-04E4-4BE3-86B5-2444CB3FCEF4@arm.com>
References: <1741159159-21356-1-git-send-email-wangmy@fujitsu.com>
	<B28BC953-04E4-4BE3-86B5-2444CB3FCEF4@arm.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-opKQ4/bL8CAyKqvtIFOh"
X-TOI-EXPURGATEID: 150726::1741352711-DFFFCAEF-1BC73AA1/0/0 CLEAN NORMAL
X-TOI-MSGID: ff89026a-9ad9-4cbb-b823-5d282fd0dc77
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 13:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212434

--=-opKQ4/bL8CAyKqvtIFOh
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6 2025 at 11:50:52 +00:00:00, Ross Burton via=20
lists.openembedded.org <ross.burton=3Darm.com@lists.openembedded.org>=20
wrote:
> LZO is an ancient compression format and I=E2=80=99ve got a background=20
> project to remove it from oe-core entirely, so why are you turning it=20
> on by default?  The packageconfig can present but disabled, can it=20
> not?

Not that it would affect me, but just thought I'd mention it. LZO is=20
snap's default compression as a compromise between speed/file size and=20
the goal of supporting older platforms


--=-opKQ4/bL8CAyKqvtIFOh
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Thu, Mar 6 2025 at 11:50:52 +00:00:0=
0, Ross Burton via lists.openembedded.org &lt;ross.burton=3Darm.com@lists.o=
penembedded.org&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plain=
text" style=3D"white-space: break-spaces;">LZO is an ancient compression fo=
rmat and I=E2=80=99ve got a background project to remove it from oe-core en=
tirely, so why are you turning it on by default?  The packageconfig can pre=
sent but disabled, can it not?
</div></blockquote><div><br></div><div>Not that it would affect me, but jus=
t thought I'd mention it. LZO is snap's default compression as a compromise=
 between speed/file size and the goal of supporting older platforms</div></=
div>
--=-opKQ4/bL8CAyKqvtIFOh--


