Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675E8C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 08:06:40 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.37580.1669881996953901279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 00:06:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout10.t-online.de (Postfix) with SMTP id E5C0F16A25;
	Thu,  1 Dec 2022 09:06:34 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.248]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p0eaY-2GFDV20; Thu, 1 Dec 2022 09:06:34 +0100
Date: Thu, 01 Dec 2022 09:06:28 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv8 4/4] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, alexandre.belloni@bootlin.com
Message-Id: <S6D7MR.2CMVVM95TNLB2@t-online.de>
In-Reply-To: 
	<CANNYZj9bUx2=YbP+NY0Zkd9kZMX3vi81uPPhuJMTR-PCNi5FwA@mail.gmail.com>
References: <20221130053450.95655-1-f_l_k@t-online.de>
	<20221130053450.95655-4-f_l_k@t-online.de> <Y4d8QoDyNaoV0rEY@mail.local>
	<MD46MR.7526AS010V5V3@t-online.de> <Y4fDxIl6wWuVUTnc@mail.local>
	<CANNYZj9bUx2=YbP+NY0Zkd9kZMX3vi81uPPhuJMTR-PCNi5FwA@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Xzl94R4P9abQ+vOzZ6Yi"
X-TOI-EXPURGATEID: 150726::1669881994-3EFE8B8C-AB47DA0B/0/0 CLEAN NORMAL
X-TOI-MSGID: 80083e21-1680-4b7e-9cf2-ee53d3a05414
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 08:06:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174042

--=-Xzl94R4P9abQ+vOzZ6Yi
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mi, 30. Nov 2022 um 22:10:56 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> devtool check-upgrade-status <list of newly added recipes>

I never have used this feature but i checked and should now be working.

By the way it told me, that gtk4 needs to be updated, so I did, and 
sorted the dependencies a little bit.
Luckily sassc-native is an outdated dependency. No need to add the sass 
lang recipes to oe-core.

I disabled demo build, because the recently added node-editor has an 
installed vs. shipped issue and even worse,
it has references to tmpdir in its binary.

Added some PACKAGECONFIG Options and enabled gstreamer by default, 
because meson_options.txt contains:
# Media backends
# For distros: GTK guarantees support for WebM video (VP8 and VP9), so 
a supported build
# should provide that.

Fixed install of the printbackends into its dynamic packages.

In gcr I have removed the patch for the ssh binary paths. Looks like 
upstream wants this to be done with a meson.cross file.
I dont like that much, but at least better, than collection 
inappropriate patches.





--=-Xzl94R4P9abQ+vOzZ6Yi
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Mi, 30. Nov 2022 um 22:10:56 +0100 s=
chrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote typ=
e=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">de=
vtool check-upgrade-status &lt;list of newly added recipes&gt;</div></block=
quote><div><br></div><div>I never have used this feature but i checked and =
should now be working.</div><div><br></div><div>By the way it told me, that=
 gtk4 needs to be updated, so I did, and sorted the dependencies a little b=
it.</div><div>Luckily sassc-native is an outdated dependency. No need to ad=
d the sass lang recipes to oe-core.</div><div><br></div><div>I disabled dem=
o build, because the recently added node-editor has an installed vs. shippe=
d issue and even worse,</div><div>it has references to tmpdir in its binary=
.</div><div><br></div><div>Added some PACKAGECONFIG Options and enabled gst=
reamer by default, because meson_options.txt contains:</div><div><pre class=
=3D"code highlight" lang=3D"meson"><span class=3D"line" id=3D"LC28" lang=3D=
"meson"># Media backends</span>
<span class=3D"line" id=3D"LC29" lang=3D"meson"># For distros: GTK guarante=
es support for WebM video (VP8 and VP9), so a supported build</span>
<span class=3D"line" id=3D"LC30" lang=3D"meson"># should provide that.</spa=
n></pre><pre class=3D"code highlight" lang=3D"meson"><span class=3D"line" l=
ang=3D"meson"><br></span></pre><pre class=3D"code highlight" lang=3D"meson"=
><span class=3D"line" lang=3D"meson"><div style=3D"font-family: -webkit-sta=
ndard; white-space: normal;">Fixed install of the printbackends into its dy=
namic packages.</div><div style=3D"font-family: -webkit-standard; white-spa=
ce: normal;"><br></div><div style=3D"font-family: -webkit-standard; white-s=
pace: normal;">In gcr I have removed the patch for the ssh binary paths. Lo=
oks like upstream wants this to be done with a meson.cross file.</div><div =
style=3D"font-family: -webkit-standard; white-space: normal;">I dont like t=
hat much, but at least better, than collection inappropriate patches.</div>=
<div style=3D"font-family: -webkit-standard; white-space: normal;"><br></di=
v><div style=3D"font-family: -webkit-standard; white-space: normal;"><br></=
div><div><br></div></span></pre></div></div>
--=-Xzl94R4P9abQ+vOzZ6Yi--


