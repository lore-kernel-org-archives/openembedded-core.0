Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BC5D116EA
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 16:26:07 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17047.1764433562660060825
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Nov 2025 08:26:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout02.t-online.de (Postfix) with SMTP id A270CE3EB;
	Sat, 29 Nov 2025 17:26:00 +0100 (CET)
Received: from [192.168.178.36] ([84.154.165.68]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vPNll-1ltmsK0; Sat, 29 Nov 2025 17:25:58 +0100
Date: Sat, 29 Nov 2025 17:25:52 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core][PATCH V2 2/2] rootfs-postcommands.bbclass: remove the
 '\n' in 'no password' banner
To: Qi.Chen@windriver.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	"Chen Qi via lists.openembedded.org"
	<Qi.Chen=windriver.com@lists.openembedded.org>,
	openembedded-core@lists.openembedded.org, alex@linutronix.de
Message-Id: <4NXH6T.3IOIUZ90266T3@t-online.de>
In-Reply-To: <CO6PR11MB56024FAE14C1A1D20970E29DEDDDA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20251129035436.249679-1-Qi.Chen@windriver.com>
	<20251129035436.249679-2-Qi.Chen@windriver.com>
	<CANNYZj83Sda+1Ycoiwdzxdw1y17zK=AiuxQ5a89H9RUqK+OMew@mail.gmail.com>
	<187C80565E96F071.270132@lists.openembedded.org>
	<CO6PR11MB56024FAE14C1A1D20970E29DEDDDA@CO6PR11MB5602.namprd11.prod.outlook.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-5PYkLYgTOndvKfMW0wGG"
X-TOI-EXPURGATEID: 150726::1764433558-BFFEC53A-B6F9DC01/0/0 CLEAN NORMAL
X-TOI-MSGID: 70aeeb9d-55b8-4690-9bc0-a95eb2fbbe5e
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 16:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226944

--=-5PYkLYgTOndvKfMW0wGG
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 29 2025 at 15:43:17 +00:00:00, Chen Qi via=20
lists.openembedded.org <Qi.Chen=3Dwindriver.com@lists.openembedded.org>=20
wrote:
> I think I know what's going on here.
> Your sh symlinks to dash, right?
>=20
> It seems that bash and dash have different behavior on echo + '\n'.

bash's =91echo=92 requires the =91-e=92 option so that \n is=20
interpreted as new line.


--=-5PYkLYgTOndvKfMW0wGG
Content-Type: text/html; charset=windows-1251
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Sat, Nov 29 2025 at 15:43:17 +00:00:=
00, Chen Qi via lists.openembedded.org &lt;Qi.Chen=3Dwindriver.com@lists.op=
enembedded.org&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plaint=
ext" style=3D"white-space: break-spaces;">I think I know what's going on he=
re.
Your sh symlinks to dash, right?

It seems that bash and dash have different behavior on echo + '\n'.
</div></blockquote><div><br></div><div>bash's =91echo=92 requires the =91-e=
=92 option so that \n is interpreted as new line.</div></div>
--=-5PYkLYgTOndvKfMW0wGG--


