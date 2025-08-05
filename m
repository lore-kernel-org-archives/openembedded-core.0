Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C8EC87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 21:07:17 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.10279.1754428027115849172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 14:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout06.t-online.de (Postfix) with SMTP id 5962F1C738;
	Tue,  5 Aug 2025 23:07:04 +0200 (CEST)
Received: from [192.168.178.36] ([79.219.225.228]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ujOs3-3fR5yC0; Tue, 5 Aug 2025 23:06:55 +0200
Date: Tue, 05 Aug 2025 23:06:49 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [PATCH 1/2] librsvg: upgrade 2.59.2 -> 2.60.0
To: skandigraun@gmail.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <DBHJ0T.FD31D5EWUATV2@t-online.de>
In-Reply-To: <1858F5D9B7200FC9.26265@lists.openembedded.org>
References: <20250805063925.771875-1-skandigraun@gmail.com>
	<1858D393D35BC4B4.28357@lists.openembedded.org>
	<DBUIS9SGNETD.1OJZHA0Y17QRS@bootlin.com>
	<dc1d93ac-23b0-4d79-b8b6-73b0d22720e9@gmail.com>
	<1858F5D9B7200FC9.26265@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-i9Nketwghwo5lQ9BLjDt"
X-TOI-EXPURGATEID: 150726::1754428015-76FFA99E-82C33C16/0/0 CLEAN NORMAL
X-TOI-MSGID: a1d32c24-bcb1-49bf-9e10-4c2dacec217e
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 21:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221495

--=-i9Nketwghwo5lQ9BLjDt
Content-Type: text/plain; charset=us-ascii; format=flowed

Cause of the issue

<https://github.com/GNOME/librsvg/commit/994582cfa995d00f9472dc22f8237b6571b4c510>

On Tue, Aug 5 2025 at 21:32:35 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> On Tue, Aug 5 2025 at 21:23:48 +02:00:00, Gyorgy Sarvari via 
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org> 
> wrote:
>> Indeed, the bug is here - it is trying to use the build machine's
>> gdk-pixbuf-query-loaders
> 
> I wouldn't call it a bug ... seems to be intended because 
> find_program is used and the dependeny is explicitly added only, if 
> meson can use hosttools


--=-i9Nketwghwo5lQ9BLjDt
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Cause of the issue</div><div><br></div><div><a href="https://github.com/GNOME/librsvg/commit/994582cfa995d00f9472dc22f8237b6571b4c510">https://github.com/GNOME/librsvg/commit/994582cfa995d00f9472dc22f8237b6571b4c510</a></div></div><div id="geary-quote" dir="auto"><br>On Tue, Aug 5 2025 at 21:32:35 +02:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div id="geary-body" dir="auto">On Tue, Aug 5 2025 at 21:23:48 +02:00:00, Gyorgy Sarvari via lists.openembedded.org &lt;skandigraun=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Indeed, the bug is here - it is trying to use the build machine's
gdk-pixbuf-query-loaders</div></blockquote><div><br></div><div>I wouldn't call it a bug ... seems to be intended because find_program is used and the dependeny is explicitly added only, if meson can use hosttools</div></div>
</blockquote></div>
--=-i9Nketwghwo5lQ9BLjDt--


