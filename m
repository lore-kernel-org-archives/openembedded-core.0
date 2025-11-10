Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964AECCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 17:37:25 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2452.1762796244034299330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 09:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout10.t-online.de (Postfix) with SMTP id DFB6E37F2C;
	Mon, 10 Nov 2025 18:37:21 +0100 (CET)
Received: from [192.168.178.36] ([79.219.229.199]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vIVpQ-1Sb41w0; Mon, 10 Nov 2025 18:37:20 +0100
Date: Mon, 10 Nov 2025 18:37:14 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: bitbake-setup test
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Message-Id: <2AUI5T.7ZXVDQ11N5KQ@t-online.de>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-j3aNvdR/4iSW5prmGUaQ"
X-TOI-EXPURGATEID: 150726::1762796240-9A7FBA12-3263F8E3/0/0 CLEAN NORMAL
X-TOI-MSGID: d684e440-df50-42b7-a689-7248032a231a
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 17:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226133

--=-j3aNvdR/4iSW5prmGUaQ
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

I ran some tests with the bitbake-setup tool and noticed a problem that=20
is at least partly related to the long name of the setup directory.

With the default value, compiling intel-media-driver fails with:
posix_spawn: Argument list too long

It turns out that this is a known issue when the string length reaches=20
MAX_ARG_STRLEN.
<https://github.com/ninja-build/ninja/issues/1261>

To verify this assumption, I changed the setup directory name to just=20
=E2=80=9Cpoky,=E2=80=9D which avoided the problem. This is an annoying issu=
e and=20
not a satisfactory solution, but perhaps it will help as a bug report=20
or if someone else encounters the same problem.

Perhaps using response files would help?



--=-j3aNvdR/4iSW5prmGUaQ
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>I ran some tests with the bitbake-=
setup tool and noticed a problem that is at least partly related to the lon=
g name of the setup directory.</div><div><br></div><div>With the default va=
lue, compiling intel-media-driver fails with:</div><div>posix_spawn: Argume=
nt list too long</div><div><br></div><div>It turns out that this is a known=
 issue when the string length reaches MAX_ARG_STRLEN.</div><div><a href=3D"=
https://github.com/ninja-build/ninja/issues/1261">https://github.com/ninja-=
build/ninja/issues/1261</a></div><div><br></div><div>To verify this assumpt=
ion, I changed the setup directory name to just =E2=80=9Cpoky,=E2=80=9D whi=
ch avoided the problem. This is an annoying issue and not a satisfactory so=
lution, but perhaps it will help as a bug report or if someone else encount=
ers the same problem.</div><div><br></div><div>Perhaps using response files=
 would help?</div><div><br></div></div>
--=-j3aNvdR/4iSW5prmGUaQ--


