Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A2FC7EE23
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 15:09:08 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.30522.1685286541555417240
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 08:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout11.t-online.de (Postfix) with SMTP id 5B9DB5862;
	Sun, 28 May 2023 17:08:58 +0200 (CEST)
Received: from [192.168.178.156] ([79.219.225.43]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q3I0p-2uVmWu0; Sun, 28 May 2023 17:08:51 +0200
Date: Sun, 28 May 2023 17:08:46 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 2/4] python3: add libxcrypt-native dependency
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <MEJDVR.WDZW7MFB3W9N1@t-online.de>
In-Reply-To: 
	<CANNYZj-megU_4p_eR84XiSt7YvwWu57tWBEZDKoBFkjRj8ZKVQ@mail.gmail.com>
References: <20230527133252.284132-1-f_l_k@t-online.de>
	<20230527133252.284132-2-f_l_k@t-online.de>
	<17635252DFD4EDDE.6918@lists.openembedded.org>
	<CANNYZj_jz-SCh4kq33fe7_uiVRAvL+15i4kQ=U9Dkv84W2s+xw@mail.gmail.com>
	<VDGDVR.YBUKQ953M2TP3@t-online.de>
	<CANNYZj_0ASF5ERsCgrB3W3qYgGJFwJzXn35cgc6ojQf0fi1Yxg@mail.gmail.com>
	<POIDVR.URDIMNIKV0SE3@t-online.de>
	<CANNYZj-megU_4p_eR84XiSt7YvwWu57tWBEZDKoBFkjRj8ZKVQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-LqYJFo8tbVepLtS8mUA+"
X-TOI-EXPURGATEID: 150726::1685286532-DA7FADA8-9C11666C/0/0 CLEAN NORMAL
X-TOI-MSGID: 5ee1ee76-62d2-4dde-89fa-1876407e7945
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 15:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181833

--=-LqYJFo8tbVepLtS8mUA+
Content-Type: text/plain; charset=us-ascii; format=flowed

Am So, 28. Mai 2023 um 17:01:44 +0200 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> Thanks, then all three recipes should add libxcrypt to DEPENDS

But wouldn't that lead to multiple virtual/crypt providers on musl ?


--=-LqYJFo8tbVepLtS8mUA+
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am So, 28. Mai 2023 um 17:01:44 +0200 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Thanks, then all three recipes should add libxcrypt to DEPENDS</div></blockquote><div><br></div><div>But wouldn't that lead to multiple virtual/crypt providers on musl ?</div></div>
--=-LqYJFo8tbVepLtS8mUA+--


