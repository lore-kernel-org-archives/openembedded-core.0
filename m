Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4697FC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 07:26:40 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web09.907.1667805996703281379
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 23:26:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout06.t-online.de (Postfix) with SMTP id AD62516017;
	Mon,  7 Nov 2022 08:26:34 +0100 (CET)
Received: from [192.168.178.122] ([79.219.226.160]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1orwWb-3uxX960; Mon, 7 Nov 2022 08:26:29 +0100
Date: Mon, 07 Nov 2022 08:26:23 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 2/2] gstreamer1.0-plugins-good: use libsoup-3.0
 by default
To: alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <ZBVYKR.Z128MBC3O0S6@t-online.de>
In-Reply-To: <Y2gxWH7vuDMlDH0m@mail.local>
References: <20221106080249.89929-1-f_l_k@t-online.de>
	<20221106080249.89929-2-f_l_k@t-online.de> <Y2gxWH7vuDMlDH0m@mail.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ITTWkBFnbRN2aDAPsqvn"
X-TOI-EXPURGATEID: 150726::1667805989-17FE898D-9081F075/0/0 CLEAN NORMAL
X-TOI-MSGID: 8d240fde-e53c-415f-97b3-b7baecb46954
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172826

--=-ITTWkBFnbRN2aDAPsqvn
Content-Type: text/plain; charset=us-ascii; format=flowed

Am So, 6. Nov 2022 um 23:12:40 +0100 schrieb Alexandre Belloni via 
lists.openembedded.org 
<alexandre.belloni=bootlin.com@lists.openembedded.org>:
> WARNING: gstreamer1.0-meta-base-1.0-r0 do_package_qa: QA Issue: 
> gstreamer1.0-meta-base rdepends on gstreamer1.0-plugins-good-soup, 
> but it isn't a build dependency? [build-deps]

Hello,

i've sent a v2 for this patch that should fix the issue.


--=-ITTWkBFnbRN2aDAPsqvn
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am So, 6. Nov 2022 um 23:12:40 +0100 schrieb Alexandre Belloni via lists.openembedded.org &lt;alexandre.belloni=bootlin.com@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">WARNING: gstreamer1.0-meta-base-1.0-r0 do_package_qa: QA Issue: gstreamer1.0-meta-base rdepends on gstreamer1.0-plugins-good-soup, but it isn't a build dependency? [build-deps]</div></blockquote><div><br></div><div>Hello,</div><div><br></div><div>i've sent a v2 for this patch that should fix the issue.</div></div>
--=-ITTWkBFnbRN2aDAPsqvn--


