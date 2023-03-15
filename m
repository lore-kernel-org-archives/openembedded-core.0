Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D32B6C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 07:07:58 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.2152.1678864075598365957
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 00:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout08.t-online.de (Postfix) with SMTP id 22AFE258BC;
	Wed, 15 Mar 2023 08:07:20 +0100 (CET)
Received: from [192.168.178.83] ([79.219.227.85]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pcLEF-17dUtU0; Wed, 15 Mar 2023 08:07:19 +0100
Date: Wed, 15 Mar 2023 08:07:13 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] glib: update 2.74.6 -> 2.76.0
To: alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <1SVJRR.5I6N2A8XK4C8@t-online.de>
In-Reply-To: <20230314222845ff996abf@mail.local>
References: <20230313092017.1145105-1-f_l_k@t-online.de>
	<20230314222845ff996abf@mail.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-2uZ/EckRmAi//H26C3wG"
X-TOI-EXPURGATEID: 150726::1678864039-B2834007-3227830A/0/0 CLEAN NORMAL
X-TOI-MSGID: f3fdc13c-987f-4e95-a47a-843e3ad1ad0b
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178522

--=-2uZ/EckRmAi//H26C3wG
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Am Di, 14. M=E4r 2023 um 23:28:45 +0100 schrieb Alexandre Belloni via=20
lists.openembedded.org=20
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org>:
> This causes those new ptest failures:
>=20
> {'glib-2.0': ['glib/utils.test',
>               'glib/utils-c-99.test',
>               'glib/utils-c-11.test',
>               'glib/utils-c-17.test',
>               'glib/utils-c-90.test']}

Maybe i did something wrong in trying to reproduce this. Did install=20
the glib-2.0-ptest to my image and ran it with 'sudo ptest-runner'
Like this all tests did succeeded.

But looking at the error message it looks like it could be possibly get=20
fixed by running the tests from /var/volatile/tmp instead of /tmp. I'll=20
send a patch in the hope that this will help


--=-2uZ/EckRmAi//H26C3wG
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Di, 14. M=E4r 2023 um 23:28:45 +0100=
 schrieb Alexandre Belloni via lists.openembedded.org &lt;alexandre.belloni=
=3Dbootlin.com@lists.openembedded.org&gt;:<br><blockquote type=3D"cite"><di=
v class=3D"plaintext" style=3D"white-space: break-spaces;">This causes thos=
e new ptest failures:

{'glib-2.0': ['glib/utils.test',
              'glib/utils-c-99.test',
              'glib/utils-c-11.test',
              'glib/utils-c-17.test',
              'glib/utils-c-90.test']}</div></blockquote><div><br></div><di=
v><div>Maybe i did something wrong in trying to reproduce this. Did install=
 the glib-2.0-ptest to my image and ran it with 'sudo ptest-runner'</div><d=
iv>Like this all tests did succeeded.</div><div><br></div><div>But looking =
at the error message it looks like it could be possibly get fixed by runnin=
g the tests from /var/volatile/tmp instead of /tmp. I'll send a patch in th=
e hope that this will help</div></div></div>
--=-2uZ/EckRmAi//H26C3wG--


