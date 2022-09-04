Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05DEECAAD4
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 13:44:56 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.13537.1662299094026656554
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 06:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82,
 mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout05.t-online.de (Postfix) with SMTP id D4D77126B7;
	Sun,  4 Sep 2022 15:44:50 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.36.114]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oUpve-06ts6C0; Sun, 4 Sep 2022 15:44:50 +0200
Date: Sun, 04 Sep 2022 15:44:44 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] squashfs-tools: build with lzo support
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <K6UOHR.XK1NCQ7V3ZR12@t-online.de>
In-Reply-To: 
	<CAMKF1spWYcWTCghheMsUjSvZHZAA0SoH1m3rr56NJ=Jv0_fykQ@mail.gmail.com>
References: <20220904052928.33120-1-f_l_k@t-online.de>
	<CAMKF1spWYcWTCghheMsUjSvZHZAA0SoH1m3rr56NJ=Jv0_fykQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ackdnqQ1mGK6q8yez+hU"
X-TOI-EXPURGATEID: 150726::1662299090-01447F1E-0E3A4549/0/0 CLEAN NORMAL
X-TOI-MSGID: 479f7ac9-6d45-4181-8c95-e03f1af734e0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 13:44:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170288

--=-ackdnqQ1mGK6q8yez+hU
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Sa, 3. Sep 2022 um 23:32:00 -0700 schrieb Khem Raj 
<raj.khem@gmail.com>:
> I thought lzo was something we wanted to remove like lzop
> so is it a hard dependency for snaps ?

It depends on how the snaps are constructed. Some time ago, the default 
compression in snap was changed from xz to lzo to decrease execution 
time at the expense of binary size. Since then 'snap install' breaks 
with the message that unsquashfs is missing lzo support.
I tested installing some snaps and all of them had this issue.  After I 
built squashfs-tools with lzo support, installing the snaps worked. 
Most of them did not run (probably because my test image is largely 
x11-free), but for example the firefox snap ran very well.


--=-ackdnqQ1mGK6q8yez+hU
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Sa, 3. Sep 2022 um 23:32:00 -0700 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I thought lzo was something we wanted to remove like lzop
so is it a hard dependency for snaps ?</div></blockquote><div><br></div><div>It depends on how the snaps are constructed. Some time ago, the default compression in snap was changed from xz to lzo to decrease execution&nbsp;time at the expense of binary size. Since then 'snap install' breaks with the message that unsquashfs is missing lzo support.</div><div>I tested installing some snaps and all of them had this issue. &nbsp;After I built squashfs-tools with lzo support, installing the snaps worked. Most of them did not run (probably because my test image is largely x11-free), but for example the firefox snap ran very well.</div></div>
--=-ackdnqQ1mGK6q8yez+hU--


