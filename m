Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3442C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 00:27:20 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.57598.1643761639856685569
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 16:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6F9E940C82;
	Wed,  2 Feb 2022 00:27:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 73mL3gEMTzl6; Wed,  2 Feb 2022 00:27:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 25BBD40AB7;
	Wed,  2 Feb 2022 00:27:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5906717472A; Tue,  1 Feb 2022 19:27:08 -0500 (EST)
Date: Tue, 1 Feb 2022 19:27:08 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>,
	Marius Vlad <marius.vlad@collabora.com>,
	Daniel Stone <daniel.stone@collabora.com>,
	Chen Qi <Qi.Chen@windriver.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	Tom Hochstein <tom.hochstein@nxp.com>,
	Jussi Kukkonen <jussi.kukkonen@intel.com>,
	Ming Liu <ming.liu@toradex.com>
Subject: Re: [OE-core] [RFC PATCH 2/2] weston: upgrade 9.0.0 -> 10.0.0
Message-ID: <20220202002708.GB26229@denix.org>
References: <20220201133054.3265186-1-alex@linutronix.de>
 <20220201133054.3265186-2-alex@linutronix.de>
 <16CFB8EC2EFE6F03.7982@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16CFB8EC2EFE6F03.7982@lists.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 00:27:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161171

On Tue, Feb 01, 2022 at 12:15:01PM -0500, Denys Dmytriyenko wrote:
> On Tue, Feb 01, 2022 at 02:30:54PM +0100, Alexander Kanavin wrote:
> Just to make it clear to everyone else on the list - this is not the final 
> 10.0.0 release, but rather an RC1 that is versioned as 9.0.93, hence the RFC 
> status of the patch, just for review.

BTW, the final 10.0.0 just got released earlier today:
https://lists.freedesktop.org/archives/wayland-devel/2022-February/042103.html

Alex,

Would it be possible to includue the link above with the full Changelog in the 
commit message? Thanks.

-- 
Denys

