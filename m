Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39014C3ABB2
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 12:46:54 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.7693.1726490809677222853
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Sep 2024 05:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout10.t-online.de (Postfix) with SMTP id 0861028CE;
	Mon, 16 Sep 2024 14:46:47 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.33.165]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sqB7m-1ITpTM0; Mon, 16 Sep 2024 14:46:38 +0200
Date: Mon, 16 Sep 2024 14:48:23 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Preview GTK-47.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <NWOWJS.9JQ0730OG8B71@t-online.de>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Mt+rAe5iO8lRXBljHV06"
X-TOI-EXPURGATEID: 150726::1726490798-957F985B-5A41D619/0/0 CLEAN NORMAL
X-TOI-MSGID: 26aeb397-f5ec-4044-a322-e1a5d44a09cb
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 12:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204607

--=-Mt+rAe5iO8lRXBljHV06
Content-Type: text/plain; charset=us-ascii; format=flowed

pre-release version of gnome 47. There were some issues, mainly in 
tracker. Besides the obligatory newly included build paths, the 
programs were annoyingly renamed from tracker/tracker-miners to 
tinysparql/localsearch. This has caused a merry go round of changes all 
over the place.

I will wait to send the updates to the mailing list until styhead 
release is finalized. At best gtk4, glib-2.0 and libadwaita in oe-core 
should be updated first. That would allow to put in all the updates for 
meta-openembedded in one go.

This includes all the changes I made to oe-core and meta-openembedded. 
I have tested this for x86-64 and aarch64 so far.

<https://codeberg.org/flk/meta-image/src/branch/master/meta>
<https://codeberg.org/flk/meta-image/src/branch/master/meta-gnome>


--=-Mt+rAe5iO8lRXBljHV06
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div>pre-release version of gnome =
47. There were some issues, mainly in tracker. Besides the obligatory newly=
 included build paths, the programs were annoyingly renamed from tracker/tr=
acker-miners to tinysparql/localsearch. This has caused a merry go round of=
 changes all over the place.</div><div><br></div><div>I will wait to send t=
he updates to the mailing list until styhead release is finalized. At best =
gtk4, glib-2.0 and libadwaita in oe-core should be updated first. That woul=
d allow to put in all the updates for meta-openembedded in one go.</div><di=
v><br></div><div>This includes all the changes I made to oe-core and meta-o=
penembedded. I have tested this for x86-64 and aarch64 so far.</div></div><=
div><br></div><div><a href=3D"https://codeberg.org/flk/meta-image/src/branc=
h/master/meta">https://codeberg.org/flk/meta-image/src/branch/master/meta</=
a></div><div><a href=3D"https://codeberg.org/flk/meta-image/src/branch/mast=
er/meta-gnome">https://codeberg.org/flk/meta-image/src/branch/master/meta-g=
nome</a></div></div>
--=-Mt+rAe5iO8lRXBljHV06--


