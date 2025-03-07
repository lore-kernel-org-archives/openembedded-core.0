Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDA6C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 14:13:00 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.11851.1741356774679460753
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 06:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout02.t-online.de (Postfix) with SMTP id DAD85A49;
	Fri,  7 Mar 2025 15:12:52 +0100 (CET)
Received: from [192.168.178.20] ([84.154.160.145]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tqYRX-3wRNTs0; Fri, 7 Mar 2025 15:12:51 +0100
Date: Fri, 07 Mar 2025 15:13:32 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] glib-2.0: update 2.82.4 -> 2.84.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <KIBRSS.6ETEMT8JI9NV2@t-online.de>
In-Reply-To: <CANNYZj_Y9kM=uq0pKWduZt4LQ9zVwLXnOzu+HAhWJBApAfwduA@mail.gmail.com>
References: <20250307132900.456962-1-f_l_k@t-online.de>
	<CANNYZj_Y9kM=uq0pKWduZt4LQ9zVwLXnOzu+HAhWJBApAfwduA@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-016eKHtTQHdEHLhlUQEn"
X-TOI-EXPURGATEID: 150726::1741356771-227FB90D-A08323CB/0/0 CLEAN NORMAL
X-TOI-MSGID: 68c5dbd9-8b69-4a83-b543-99f31be23c24
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 14:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212444

--=-016eKHtTQHdEHLhlUQEn
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Mar 7 2025 at 15:05:26 +01:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> This needs to be explained, as it doesn't seem correct, and
> contradicts ptest-gnome which (correctly) installs these to the ptest
> package.

I see. I think the issue here is, that the install path changed from 
${datadir} to ${libexecdir}


--=-016eKHtTQHdEHLhlUQEn
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Mar 7 2025 at 15:05:26 +01:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This needs to be explained, as it doesn't seem correct, and
contradicts ptest-gnome which (correctly) installs these to the ptest
package.</div></blockquote><div><br></div><div>I see. I think the issue here is, that the install path changed from ${datadir} to ${libexecdir}</div></div>
--=-016eKHtTQHdEHLhlUQEn--


