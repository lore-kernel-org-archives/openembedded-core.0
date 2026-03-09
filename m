Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D83EFCD9B
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:41:47 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20699.1773078106893653157
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 10:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout11.t-online.de (Postfix) with SMTP id 99FB31D29A;
	Mon,  9 Mar 2026 18:41:44 +0100 (CET)
Received: from [192.168.178.36] ([84.163.45.136]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vzebs-1wjqPA0; Mon, 9 Mar 2026 18:41:40 +0100
Date: Mon, 09 Mar 2026 18:41:34 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core][PATCH v2] orc: Enable hotdoc to produce doc
To: liuyd.fnst@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <AT7NBT.U308CGOGMJLH1@t-online.de>
In-Reply-To: <CANNYZj_JP3pWfO8=MPWBD8WiLEgr8SAcjAdM-ij7Ysu-3bzWeg@mail.gmail.com>
References: <20260225033725.708-1-liuyd.fnst@fujitsu.com>
	<CANNYZj_JP3pWfO8=MPWBD8WiLEgr8SAcjAdM-ij7Ysu-3bzWeg@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-chFcGNzeRcxPJ7+vW4JF"
X-TOI-EXPURGATEID: 150726::1773078100-A6FEE0D4-617B8223/0/0 CLEAN NORMAL
X-TOI-MSGID: 961dfa40-e1aa-4876-abc7-329ce99dc6ea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 17:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232735

--=-chFcGNzeRcxPJ7+vW4JF
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Mar 9 2026 at 18:23:07 +01:00:00, Alexander Kanavin via 
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org> 
wrote:
>  +PACKAGECONFIG[hotdoc] = ",,hotdoc-native"

Maybe call it PACKAGECONFIG[manpages] so that it could be 
enabled/disabled with the 'api-documentation' DISTRO_FEATURE ?


--=-chFcGNzeRcxPJ7+vW4JF
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Mar 9 2026 at 18:23:07 +01:00:00, Alexander Kanavin via lists.openembedded.org &lt;alex.kanavin=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;"> +PACKAGECONFIG[hotdoc] = ",,hotdoc-native"</div></blockquote><div><br></div><div>Maybe call it PACKAGECONFIG[manpages] so that it could be enabled/disabled with the 'api-documentation' DISTRO_FEATURE ?</div></div>
--=-chFcGNzeRcxPJ7+vW4JF--


