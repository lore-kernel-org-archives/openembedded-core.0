Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2F9C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 20:55:11 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79012.1783025708456351532
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 13:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=AZnEuwk2;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout03.t-online.de (Postfix) with SMTP id E131AED56;
	Thu,  2 Jul 2026 22:55:04 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.162.131]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wfOR4-0Nr84W0; Thu, 2 Jul 2026 22:55:02 +0200
Date: Thu, 02 Jul 2026 22:54:56 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][Patch 2/3] mesa.inc: enable intel raytracing support
 conditionally
To: mathieu.dubois-briand@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <KFFKHT.YNG6GN4OIH0B@t-online.de>
In-Reply-To: <DJOASP0ROLWE.3673CSD4EKMAU@bootlin.com>
References: <20260701163640.1285581-1-f_l_k@t-online.de>
	<20260701163640.1285581-2-f_l_k@t-online.de>
	<DJOASP0ROLWE.3673CSD4EKMAU@bootlin.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-HMgJ705nIX2e3Bzeyuuz"
X-TOI-EXPURGATEID: 150726::1783025702-5F7FD83E-1CF7B51D/0/0 CLEAN NORMAL
X-TOI-MSGID: 40aafc45-b186-4e37-9449-a806191e4210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1783025704; i=f_l_k@t-online.de;
	bh=M0EvANwIF/m+9PgNapKvAb65Z/5ApKVxDJoYkJsCMFw=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=AZnEuwk2gp+1sB9EcoFjYzOY//ruqWZSIghF/yvTyiahNuk7H1B9CHV/0V5V97Cfu
	 v3bCI/jBO61QOsQRQhH3H3nvgrHolwc90kwXkQXMclBMH2ymd9EKLK1dn4PrzdqQfk
	 oATeiqckqOYr2qQrffx0BusS29zXamTAsj8eODbV1+uXHp+eOi2mov97dSDKYEb/h+
	 R+jzO5ng9v2GnefyFyCGNrUbu1RtnbGUnH72iCB//hjmBMehmtw2KbBHj7Q0QNs72x
	 GC2gf8yjpSPusz5wz82LC4ylul9B6wKfEgkuDCOdGeJlQxsJpLzG3jKQ8UNj4qnZoy
	 n2T5hRmz9dkbg==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 20:55:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240070

--=-HMgJ705nIX2e3Bzeyuuz
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Jul 2 2026 at 20:30:59 +02:00:00, Mathieu Dubois-Briand via 
lists.openembedded.org 
<mathieu.dubois-briand=bootlin.com@lists.openembedded.org> wrote:
> Intel Ray Tracing requires 64-bit architectures

Hi Mathieu,

Starting tomorrow, I'll be on vacation for a week. After that, I'll 
take a look at it.


--=-HMgJ705nIX2e3Bzeyuuz
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Jul 2 2026 at 20:30:59 +02:00:00, Mathieu Dubois-Briand via lists.openembedded.org &lt;mathieu.dubois-briand=bootlin.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Intel Ray Tracing requires 64-bit architectures</div></blockquote><div><br></div><div>Hi Mathieu,</div><div><br></div><div>Starting tomorrow, I'll be on vacation for a week. After that, I'll take a look at it.</div></div>
--=-HMgJ705nIX2e3Bzeyuuz--


