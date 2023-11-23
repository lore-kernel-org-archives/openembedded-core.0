Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF03C61DF7
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 14:04:07 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.91581.1700748240436374960
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 06:04:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout06.t-online.de (Postfix) with SMTP id A64088B21;
	Thu, 23 Nov 2023 15:03:57 +0100 (CET)
Received: from [192.168.178.67] ([84.163.41.134]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r6AJ9-3bQmo40; Thu, 23 Nov 2023 15:03:55 +0100
Date: Thu, 23 Nov 2023 15:04:20 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCHv3] cups: Allow to be controlled by root and users
 in wheel
To: Markus Volk <f_l_k@t-online.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Message-Id: <8RXK4S.ZEPMLSMPYBO92@t-online.de>
In-Reply-To: <179A449F252F0281.9514@lists.openembedded.org>
References: <20231120161848.1461683-1-f_l_k@t-online.de>
	<aa9e1e82072027c73d4ce2b787a0a2cc9e4ada79.camel@linuxfoundation.org>
	<179A449F252F0281.9514@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-hU5qxZSVHz2ukNPTFDkx"
X-TOI-EXPURGATEID: 150726::1700748235-47FFC979-0360C13E/0/0 CLEAN NORMAL
X-TOI-MSGID: 8320b759-0ac2-4f45-a42c-56521979a0a0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 14:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191157

--=-hU5qxZSVHz2ukNPTFDkx
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Nov 23 2023 at 02:40:19 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> In other words. This makes the cups-pk-helper unlock mechanism work 
> out of the box without further configuration

with this commit:
Nov 23 15:03:06 intel-corei7-64 dbus-daemon[739]: [system] Activating 
service name='org.opensuse.CupsPkHelper.Mechanism' requested by 
':1.126' (uid=1000 pid=2346631 comm="/usr/bin/gnome-control-center") 
(using servicehelper)
Nov 23 15:03:06 intel-corei7-64 dbus-daemon[739]: [system] Successfully 
activated service 'org.opensuse.CupsPkHelper.Mechanism'


without this commit:
Nov 23 15:00:01 intel-corei7-64 dbus-daemon[739]: [system] Activating 
service name='org.opensuse.CupsPkHelper.Mechanism' requested by 
':1.115' (uid=1000 pid=2346285 comm="/usr/bin/gnome-control-center") 
(using servicehelper)
Nov 23 15:00:01 intel-corei7-64 dbus-daemon[739]: [system] Successfully 
activated service 'org.opensuse.CupsPkHelper.Mechanism'
Nov 23 15:00:01 intel-corei7-64 gnome-control-c[2346285]: 
cups-pk-helper: setting of an option failed: client-error-forbidden
Nov 23 15:00:01 intel-corei7-64 gnome-control-c[2346285]: 
g_hash_table_ref: assertion 'hash_table != NULL' failed
Nov 23 15:00:03 intel-corei7-64 gnome-control-c[2346285]: 
cups-pk-helper: setting of an option failed: client-error-forbi


--=-hU5qxZSVHz2ukNPTFDkx
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Thu, Nov 23 2023 at 02:40:19 PM +01:=
00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type=3D"=
cite">In other words. This makes the cups-pk-helper unlock mechanism work o=
ut of the box without further configuration</blockquote><div><br></div><div=
>with this commit:</div><div><div>Nov 23 15:03:06 intel-corei7-64 dbus-daem=
on[739]: [system] Activating service name=3D'org.opensuse.CupsPkHelper.Mech=
anism' requested by ':1.126' (uid=3D1000 pid=3D2346631 comm=3D"/usr/bin/gno=
me-control-center") (using servicehelper)</div><div>Nov 23 15:03:06 intel-c=
orei7-64 dbus-daemon[739]: [system] Successfully activated service 'org.ope=
nsuse.CupsPkHelper.Mechanism'</div></div><div><br></div><div><br></div><div=
>without this commit:</div><div><div>Nov 23 15:00:01 intel-corei7-64 dbus-d=
aemon[739]: [system] Activating service name=3D'org.opensuse.CupsPkHelper.M=
echanism' requested by ':1.115' (uid=3D1000 pid=3D2346285 comm=3D"/usr/bin/=
gnome-control-center") (using servicehelper)</div><div>Nov 23 15:00:01 inte=
l-corei7-64 dbus-daemon[739]: [system] Successfully activated service 'org.=
opensuse.CupsPkHelper.Mechanism'</div><div>Nov 23 15:00:01 intel-corei7-64 =
gnome-control-c[2346285]: cups-pk-helper: setting of an option failed: clie=
nt-error-forbidden</div><div>Nov 23 15:00:01 intel-corei7-64 gnome-control-=
c[2346285]: g_hash_table_ref: assertion 'hash_table !=3D NULL' failed</div>=
<div>Nov 23 15:00:03 intel-corei7-64 gnome-control-c[2346285]: cups-pk-help=
er: setting of an option failed: client-error-forbi</div></div></div>
--=-hU5qxZSVHz2ukNPTFDkx--


