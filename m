Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA91DC54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 10:47:41 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.40742.1710931657554893647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 03:47:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout06.t-online.de (Postfix) with SMTP id 613A3B75A;
	Wed, 20 Mar 2024 11:47:18 +0100 (CET)
Received: from [192.168.178.67] ([84.163.34.101]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmtTZ-1ZI0pc0; Wed, 20 Mar 2024 11:47:17 +0100
Date: Wed, 20 Mar 2024 11:47:43 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCH 1/2] glib-2.0: update 2.78.4 -> 2.80.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <JB7NAS.9E9M921LDZIH2@t-online.de>
In-Reply-To: <CANNYZj-Wy7pFVNGYE7ccYvr3sToKk4vBPsw4bnyg4gBBrUadrw@mail.gmail.com>
References: <20240320085846.206946-1-f_l_k@t-online.de>
	<CANNYZj-Wy7pFVNGYE7ccYvr3sToKk4vBPsw4bnyg4gBBrUadrw@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-v93FPEFNhV5oAALY/Tc4"
X-TOI-EXPURGATEID: 150726::1710931637-5201F95D-F921E2CF/0/0 CLEAN NORMAL
X-TOI-MSGID: e133010c-58c6-42ed-b4a7-8e467b51d81c
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 10:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197356

--=-v93FPEFNhV5oAALY/Tc4
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, Mar 20 2024 at 10:17:45 AM +01:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> Is this correctly rebased? The patch is meant to replace lines, and
> the rebased version removes them instead.

I sent a v2 that fixes this issue, but after cleaning the sstate cache 
I see a circular dependency where gobject-introspection needs glib and 
glib needs gobject-introspection.
I won't be around for the next few days, so I don't have time to look 
at this promptly. Therefore I have marked this patch as RFC


--=-v93FPEFNhV5oAALY/Tc4
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, Mar 20 2024 at 10:17:45 AM +01:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Is this correctly rebased? The patch is meant to replace lines, and
the rebased version removes them instead.</div></blockquote><div><br></div><div><div>I sent a v2 that fixes this issue, but after cleaning the sstate cache I see a circular dependency where gobject-introspection needs glib and glib needs gobject-introspection.&nbsp;</div><div>I won't be around for the next few days, so I don't have time to look at this promptly. Therefore I have marked this patch as RFC</div></div></div>
--=-v93FPEFNhV5oAALY/Tc4--


