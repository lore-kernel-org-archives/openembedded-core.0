Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0035C433F5
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 12:54:02 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.3572.1665233639638543923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 05:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout10.t-online.de (Postfix) with SMTP id 62A06A26C;
	Sat,  8 Oct 2022 14:53:56 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.46.233]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oh9L0-0jZATQ0; Sat, 8 Oct 2022 14:53:54 +0200
Date: Sat, 08 Oct 2022 14:53:48 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] wic-imager-direct.py: use fstab update also
 for root device
To: alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <OHQFJR.BSWQE91JLN3H@t-online.de>
In-Reply-To: <Yzd3sgaUonex6igX@mail.local>
References: <20220930041807.2509199-1-f_l_k@t-online.de>
	<Yzd3sgaUonex6igX@mail.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-zAfsyjs4oYHsmSEWIeqH"
X-TOI-EXPURGATEID: 150726::1665233634-3D081535-64445B09/0/0 CLEAN NORMAL
X-TOI-MSGID: ffd70f4d-e775-4c20-904c-6a6444956e8b
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Oct 2022 12:54:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171533

--=-zAfsyjs4oYHsmSEWIeqH
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Sa, 1. Okt 2022 um 01:11:46 +0200 schrieb Alexandre Belloni via 
lists.openembedded.org 
<alexandre.belloni=bootlin.com@lists.openembedded.org>:
> This causes the following failure:
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4140/steps/14/logs/stdio>

Hi Alexandre,

I've looked at the problem and can reproduce the errors when I run 
'oe-selftest -v -r overlay-fs', but unfortunately I can't really see 
what exactly the problem is. qemu just ends unexpectedly and doesn't 
give much useful information in its output. At least I am not able to 
find it.


--=-zAfsyjs4oYHsmSEWIeqH
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Sa, 1. Okt 2022 um 01:11:46 +0200 schrieb Alexandre Belloni via lists.openembedded.org &lt;alexandre.belloni=bootlin.com@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This causes the following failure:
<a href="https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4140/steps/14/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4140/steps/14/logs/stdio</a></div></blockquote><div><br></div><div><div>Hi Alexandre,</div><div><br></div><div>I've looked at the problem and can reproduce the errors when I run 'oe-selftest -v -r overlay-fs', but unfortunately I can't really see what exactly the problem is. qemu just ends unexpectedly and doesn't give much useful information in its output. At least I am not able to find it.</div></div></div>
--=-zAfsyjs4oYHsmSEWIeqH--


