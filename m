Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13986C98325
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 16:27:29 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2328.1790353642618751270
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 09:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=TBPYm1z/;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout06.t-online.de (Postfix) with SMTP id B8075216;
	Fri, 25 Sep 2026 18:27:13 +0200 (CEST)
Received: from [192.168.178.36] ([79.219.226.236]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xA8lV-4D6UE40; Fri, 25 Sep 2026 18:27:13 +0200
Date: Fri, 25 Sep 2026 18:27:06 +0200
From: "Markus Volk" <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 5/5] go-mod-update-modules: include the generated
 files from the class
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <7PHXLT.V9NSMKKNGKOU@t-online>
In-Reply-To: <776C7C9B-D450-4067-B9E0-A68576F303A3@arm.com>
References: <20260922092411.262885-1-f_l_k@t-online.de>
	<20260922092411.262885-5-f_l_k@t-online.de>
	<776C7C9B-D450-4067-B9E0-A68576F303A3@arm.com>
X-Mailer: net.donnybeelo.Convey/50.2-1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-WbmPNPmgPA88mgY7eJ+V"
X-TOI-EXPURGATEID: 150726::1790353633-C8FF6986-51F68D5F/0/0 CLEAN NORMAL
X-TOI-MSGID: 7368d718-bdb8-4a37-9e8f-c05ed6282059
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790353633; i=f_l_k@t-online.de;
	bh=n6Hrs1mUPRR7qByYjunBTUNXF6mcalS+Ki2+vUMU8pQ=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=TBPYm1z/bZpPDWLm0VjAp0OTFi6x9Vq9z2NELuRRDGSKS1mdbOWMJPgKsZ30VkYx2
	 /whBW+6Iy6GKZRUspn4lLxqZmiNLadosRINSRZyr6R++02ZddzuJbt1XerVoKhWMhF
	 MSQnmeZCuk4EM1w87BGfrspDCQqHDBp4o5UXZhNS1JSMJU1ALz25t463KBS3n8/uPh
	 UM9RCqTVjkNXhsN+8cNTx62n4DLPaK0hzISOOWCcSJmnElp3Wo0eMViEUw5X40uDBS
	 mYj0Jp+o8NL0iIe8K4y45s8VDSwR5JBlcSN8qvOGVPMY4ucysOMV6jynZUDiq26q1E
	 BzcnUmp9yPP+A==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 16:27:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246623

--=-WbmPNPmgPA88mgY7eJ+V
Content-Type: text/plain; charset=iso-8859-13; format=flowed

On Fri, Sep 25 2026 at 11:18:39 +00:00:00, Ross Burton 
<Ross.Burton@arm.com> wrote:
> Where is this new recipe coming from?  recipetool should be creating 
> the files when it writes the recipe file so it can’t be there.  If 
> you’re hand-coding the recipe then you can touch the files when you 
> write require, or just include in the recipe.

Hi Ross,

the recipe was hand-coded and I wasn't aware that recipetool creates 
the files. You definitely got a point here


--=-WbmPNPmgPA88mgY7eJ+V
Content-Type: text/html; charset=iso-8859-13

<div id="convey-body" dir="auto">On Fri, Sep 25 2026 at 11:18:39 +00:00:00, Ross Burton &lt;Ross.Burton@arm.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Where is this new recipe coming from?  recipetool should be creating the files when it writes the recipe file so it can’t be there.  If you’re hand-coding the recipe then you can touch the files when you write require, or just include in the recipe.
</div></blockquote><div><br></div><div>Hi Ross,</div><div><br></div><div>the recipe was hand-coded and I wasn't aware that recipetool creates the files. You definitely got a point here</div></div>
--=-WbmPNPmgPA88mgY7eJ+V--


