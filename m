Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2487CC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 14:32:50 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.12452.1741357969406656004
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 06:32:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout08.t-online.de (Postfix) with SMTP id CBDB242C;
	Fri,  7 Mar 2025 15:32:46 +0100 (CET)
Received: from [192.168.178.20] ([84.154.160.145]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tqYkm-2447CS0; Fri, 7 Mar 2025 15:32:44 +0100
Date: Fri, 07 Mar 2025 15:33:24 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] glib-2.0: update 2.82.4 -> 2.84.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <OFCRSS.DMAMQS5P3JTF@t-online.de>
In-Reply-To: <182A8AC2C61D2C82.9571@lists.openembedded.org>
References: <20250307132900.456962-1-f_l_k@t-online.de>
	<CANNYZj_Y9kM=uq0pKWduZt4LQ9zVwLXnOzu+HAhWJBApAfwduA@mail.gmail.com>
	<182A8AC2C61D2C82.9571@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-dE7220kph6L5BObHScy7"
X-TOI-EXPURGATEID: 150726::1741357964-23FFC90D-56C9F1DD/0/0 CLEAN NORMAL
X-TOI-MSGID: 61e85857-897a-43ca-a0ca-08b9fd37ecab
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 14:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212445

--=-dE7220kph6L5BObHScy7
Content-Type: text/plain; charset=us-ascii; format=flowed

taptestrunner.py testprogramrunner.py

These two files are installed in ${libexecdir}/installed-tests

And looking at its meson.build this seems to be the default location

<https://gitlab.gnome.org/GNOME/glib/-/blob/main/tests/lib/meson.build?ref_type=heads>

Should they go to ${datadir}/installed-tests ?

On Fri, Mar 7 2025 at 15:13:32 +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> On Fri, Mar 7 2025 at 15:05:26 +01:00:00, Alexander Kanavin 
> <alex.kanavin@gmail.com> wrote:
>> This needs to be explained, as it doesn't seem correct, and
>> contradicts ptest-gnome which (correctly) installs these to the ptest
>> package.
> 
> I see. I think the issue here is, that the install path changed from 
> ${datadir} to ${libexecdir}


--=-dE7220kph6L5BObHScy7
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>taptestrunner.py testprogramrunner.py</div><div><br></div><div>These two files are installed in ${libexecdir}/installed-tests</div><div><br></div><div>And looking at its meson.build this seems to be the default location</div><div><br></div><div><a href="https://gitlab.gnome.org/GNOME/glib/-/blob/main/tests/lib/meson.build?ref_type=heads">https://gitlab.gnome.org/GNOME/glib/-/blob/main/tests/lib/meson.build?ref_type=heads</a></div><div><br></div><div>Should they go to ${datadir}/installed-tests ?</div></div><div id="geary-quote" dir="auto"><br>On Fri, Mar 7 2025 at 15:13:32 +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div id="geary-body" dir="auto">On Fri, Mar 7 2025 at 15:05:26 +01:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This needs to be explained, as it doesn't seem correct, and
contradicts ptest-gnome which (correctly) installs these to the ptest
package.</div></blockquote><div><br></div><div>I see. I think the issue here is, that the install path changed from ${datadir} to ${libexecdir}</div></div>
</blockquote></div>
--=-dE7220kph6L5BObHScy7--


