Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68488CA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 06:13:33 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.9526.1757657604698652204
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 23:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout01.t-online.de (Postfix) with SMTP id 5C14D1CE7E;
	Fri, 12 Sep 2025 08:13:04 +0200 (CEST)
Received: from [192.168.178.36] ([79.219.236.20]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uwx1p-4Fc7uK0; Fri, 12 Sep 2025 08:13:01 +0200
Date: Fri, 12 Sep 2025 08:12:55 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] glib-2.0: update 2.84.4 -> 2.86.0
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org,
	"Khem Raj via lists.openembedded.org"
	<raj.khem=gmail.com@lists.openembedded.org>
Message-Id: <J9PG2T.NK5VSUKA3AQO3@t-online.de>
In-Reply-To: <CANNYZj89e_Q80kSO-E7_iByBw72=0TuJNgoyPV1DzM=Q73irJg@mail.gmail.com>
References: <186275A42D34EEAB.19063@lists.openembedded.org>
	<5I7F2T.KIGKW1QUPNT51@t-online.de>
	<CANNYZj89e_Q80kSO-E7_iByBw72=0TuJNgoyPV1DzM=Q73irJg@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-4QeI6R0321z4qACPK6dg"
X-TOI-EXPURGATEID: 150726::1757657581-BAFFAC1C-D98940C4/0/0 CLEAN NORMAL
X-TOI-MSGID: a31be6cb-80c2-4b90-aa45-cc6486ed4395
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 06:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223305

--=-4QeI6R0321z4qACPK6dg
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Sep 11 2025 at 18:00:43 +02:00:00, Alexander Kanavin via 
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org> 
wrote:
> so can we identify
> what is specifically broken with current gnome shell 48 and see if it
> can be fixed?

<https://gitlab.gnome.org/GNOME/glib/-/commit/cb074a65c79a3b4ae4f3ae0e36775af46bcc8009>

Here's the problem. This commit breaks gir at least in gjs, causing 
gnome-shell to crash.
Reverting the commit fixed the runtime issue. Maybe we can adopt this 
patch until we're ready to switch to gnome49?

I'll send a RFC patch for it


--=-4QeI6R0321z4qACPK6dg
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Sep 11 2025 at 18:00:43 +02:00:00, Alexander Kanavin via lists.openembedded.org &lt;alex.kanavin=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">so can we identify
what is specifically broken with current gnome shell 48 and see if it
can be fixed?</div></blockquote><div><br></div><div><a href="https://gitlab.gnome.org/GNOME/glib/-/commit/cb074a65c79a3b4ae4f3ae0e36775af46bcc8009">https://gitlab.gnome.org/GNOME/glib/-/commit/cb074a65c79a3b4ae4f3ae0e36775af46bcc8009</a></div><div><br></div><div><div>Here's the problem. This commit breaks gir at least in gjs, causing gnome-shell to crash.</div><div>Reverting the commit fixed the runtime issue. Maybe we can adopt this patch until we're ready to switch to gnome49?</div></div><div><br></div><div>I'll send a RFC patch for it&nbsp;</div></div>
--=-4QeI6R0321z4qACPK6dg--


