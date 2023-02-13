Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51001C636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 18:05:19 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.22259.1676311514990442705
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 10:05:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout06.t-online.de (Postfix) with SMTP id 7D4B01F5E1;
	Mon, 13 Feb 2023 19:05:12 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.111]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pRdCS-0e4jvU0; Mon, 13 Feb 2023 19:05:12 +0100
Date: Mon, 13 Feb 2023 19:05:06 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv4] graphene: add a PACKAGECONFIG for arm_neon
To: Carlos Alberto Lopez Perez <clopez@igalia.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <I861QR.3981Y38IYFC1@t-online.de>
In-Reply-To: <e2096747-5447-3cb0-c3b4-7f55d2a9b568@igalia.com>
References: <20230213120407.1092455-1-f_l_k@t-online.de>
	<e2096747-5447-3cb0-c3b4-7f55d2a9b568@igalia.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-oVqTpCHVfOsV/ok06PpH"
X-TOI-EXPURGATEID: 150726::1676311512-B1029007-D7212EBD/0/0 CLEAN NORMAL
X-TOI-MSGID: 848d6cc0-2d8b-4712-b695-cb8b78cbbd35
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 18:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177107

--=-oVqTpCHVfOsV/ok06PpH
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 13. Feb 2023 um 16:31:51 +0100 schrieb Carlos Alberto Lopez 
Perez <clopez@igalia.com>:
> Can you please add a comment in the .bb file with a note saying that
> Neon support gets disabled by default on ARM-32 platforms because of 
> the
> following upstream bug: 
> <https://github.com/ebassi/graphene/issues/215>
> 
> ?

sure


--=-oVqTpCHVfOsV/ok06PpH
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 13. Feb 2023 um 16:31:51 +0100 schrieb Carlos Alberto Lopez Perez &lt;clopez@igalia.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Can you please add a comment in the .bb file with a note saying that
Neon support gets disabled by default on ARM-32 platforms because of the
following upstream bug: <a href="https://github.com/ebassi/graphene/issues/215">https://github.com/ebassi/graphene/issues/215</a>

?</div></blockquote><div><br></div><div>sure</div></div>
--=-oVqTpCHVfOsV/ok06PpH--


