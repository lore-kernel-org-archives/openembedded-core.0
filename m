Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B06EC87FC9
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 08:23:43 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.2781.1754123015268591916
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 01:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout03.t-online.de (Postfix) with SMTP id 9B06CE3C4;
	Sat,  2 Aug 2025 10:23:32 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.172.51]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ui7Wc-4QnMCe0; Sat, 2 Aug 2025 10:23:31 +0200
Date: Sat, 02 Aug 2025 10:23:25 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] autoconf-archive: add backport patch to fix gl
 detection
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <1ZXC0T.ZZLD0ZTNVTUO@t-online.de>
In-Reply-To: <E097FB9D-888D-4730-9BD8-E1F9CF76D37A@arm.com>
References: <20250730092958.383275-1-f_l_k@t-online.de>
	<E097FB9D-888D-4730-9BD8-E1F9CF76D37A@arm.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-83QgUJ6ef+wyFZqPAyE1"
X-TOI-EXPURGATEID: 150726::1754123011-9A7EC834-613C03B8/0/0 CLEAN NORMAL
X-TOI-MSGID: 8ce1eda9-1354-43f8-9750-cff58a19fce0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 08:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221379

--=-83QgUJ6ef+wyFZqPAyE1
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: quoted-printable

That's right. I'll add the missing patches and send a v3

On Fri, Aug 1 2025 at 12:30:57 +00:00:00, Ross Burton=20
<Ross.Burton@arm.com> wrote:
> On 30 Jul 2025, at 10:29, Markus Volk via lists.openembedded.org=20
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:f_l_k=3Dt-online.de@lists.openembedded.org>> wrote:
>>  This issue has already been fixed upstream, but there has been no=20
>> new release since then.
>=20
> The series of patches that fixed this also fixed a number of other=20
> bugs, so arguably we should grab them all.
>=20
> Of course at that point you start wondering if we should just take a=20
> git snapshot if they=E2=80=99re going to go _months_ between releases=E2=
=80=A6
>=20
> Ross


--=-83QgUJ6ef+wyFZqPAyE1
Content-Type: text/html; charset=windows-1251
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>That's right. I'll add the missing=
 patches and send a v3</div></div><div id=3D"geary-quote" dir=3D"auto"><br>=
On Fri, Aug 1 2025 at 12:30:57 +00:00:00, Ross Burton &lt;Ross.Burton@arm.c=
om&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=
=3D"white-space: break-spaces;">On 30 Jul 2025, at 10:29, Markus Volk via l=
ists.openembedded.org &lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.opene=
mbedded.org">f_l_k=3Dt-online.de@lists.openembedded.org</a>&gt; wrote:
<blockquote> This issue has already been fixed upstream, but there has been=
 no new release since then.
</blockquote>
The series of patches that fixed this also fixed a number of other bugs, so=
 arguably we should grab them all.

Of course at that point you start wondering if we should just take a git sn=
apshot if they=E2=80=99re going to go _months_ between releases=E2=80=A6

Ross</div></blockquote></div>
--=-83QgUJ6ef+wyFZqPAyE1--


