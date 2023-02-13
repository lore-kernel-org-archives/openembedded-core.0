Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2160C636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 11:37:17 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.12442.1676288227030324534
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 03:37:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout04.t-online.de (Postfix) with SMTP id 7F6D7D968;
	Mon, 13 Feb 2023 12:37:02 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.111]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pRX8o-0zuThI0; Mon, 13 Feb 2023 12:37:02 +0100
Date: Mon, 13 Feb 2023 12:36:56 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv3] graphene: add a PACKAGECONFIG for arm_neon
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <K9O0QR.HDTIOZR7P56X@t-online.de>
In-Reply-To: 
	<CANNYZj-r5n+s6P8TyOuSdniATzPZnvGsxLSMb33rQF+FfBTUWQ@mail.gmail.com>
References: <20230213104228.1067057-1-f_l_k@t-online.de>
	<CANNYZj8KiZfFD6-BvTNv5oSQ5pNg_KX7_qF1hfNpip8WLM=G-g@mail.gmail.com>
	<17435D409BDFDC2E.12482@lists.openembedded.org>
	<RPN0QR.78GW1EDG5GW2@t-online.de>
	<CANNYZj-r5n+s6P8TyOuSdniATzPZnvGsxLSMb33rQF+FfBTUWQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-IBGCmUPe77TWBaZFfgMG"
X-TOI-EXPURGATEID: 150726::1676288222-D671D046-446BC84E/0/0 CLEAN NORMAL
X-TOI-MSGID: e1fce8aa-ebb4-49b2-82bc-cc330a58f292
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 11:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177100

--=-IBGCmUPe77TWBaZFfgMG
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 13. Feb 2023 um 12:30:42 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> Does enabling neon break the build on non-aarch64?

As far as I know it breaks runtime for some armv7 tunes and will 
probably also break build for older arm platforms that do not support 
neon at all.

That would also work:
PACKAGECONFIG ?= "introspection ${@bb.utils.contains('TUNE_FEATURES', 
'aarch64', 'neon', '', d)}"


--=-IBGCmUPe77TWBaZFfgMG
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 13. Feb 2023 um 12:30:42 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Does enabling neon break the build on non-aarch64?
</div></blockquote><div><br></div><div>As far as I know it breaks runtime for some armv7 tunes and will probably also break build for older arm platforms that do not support neon at all.</div><div><br></div><div>That would also work:</div><div><span style="white-space: break-spaces;">PACKAGECONFIG ?= "introspection ${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'neon', '', d)}"</span></div></div>
--=-IBGCmUPe77TWBaZFfgMG--


