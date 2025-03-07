Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C0EC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 15:32:20 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.13916.1741361530115329687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 07:32:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout05.t-online.de (Postfix) with SMTP id 385CE4FD;
	Fri,  7 Mar 2025 16:32:08 +0100 (CET)
Received: from [192.168.178.20] ([84.154.160.145]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tqZgE-21nK9w0; Fri, 7 Mar 2025 16:32:06 +0100
Date: Fri, 07 Mar 2025 16:32:45 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] glib-2.0: update 2.82.4 -> 2.84.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <L6FRSS.WQC0AO8WAEUW@t-online.de>
In-Reply-To: <182A8DD37F985901.9571@lists.openembedded.org>
References: <20250307132900.456962-1-f_l_k@t-online.de>
	<CANNYZj_Y9kM=uq0pKWduZt4LQ9zVwLXnOzu+HAhWJBApAfwduA@mail.gmail.com>
	<182A8AC2C61D2C82.9571@lists.openembedded.org>
	<OFCRSS.DMAMQS5P3JTF@t-online.de>
	<CANNYZj_uNe90wTLJkJhnL17JSbWi6xA1x+_YXHZ_ccWCHOhKrg@mail.gmail.com>
	<182A8DD37F985901.9571@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-zRqD01R98wik3L3n9ncn"
X-TOI-EXPURGATEID: 150726::1741361526-36FFA9FB-B03FFF51/0/0 CLEAN NORMAL
X-TOI-MSGID: 4cdc943b-eefd-450e-9022-1b6d6387030f
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 15:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212451

--=-zRqD01R98wik3L3n9ncn
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Mar 7 2025 at 16:09:42 +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Eventually we are just missing a guard?

Looks good at first glance. Using ptest in DISTRO_FEATURES installs the 
files into the ptest package, so this patch seems to fix the problem. 
I'll send it to upstream in the next few days and see what I hear there



--=-zRqD01R98wik3L3n9ncn
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Mar 7 2025 at 16:09:42 +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite">Eventually we are just missing a guard?</blockquote><div><br></div><div>Looks good at first glance. Using ptest in DISTRO_FEATURES installs the files into the ptest package, so this patch seems to fix the problem. I'll send it to upstream in the next few days and see what I hear there</div><div><br></div></div>
--=-zRqD01R98wik3L3n9ncn--


