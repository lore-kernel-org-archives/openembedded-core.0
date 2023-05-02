Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5373BC19F20
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 23:03:26 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5733.1683068599639444702
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 16:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EA10640C5D;
	Tue,  2 May 2023 23:03:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ba56Q8eq2pFE; Tue,  2 May 2023 23:03:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C62DE40C1C;
	Tue,  2 May 2023 23:03:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E0FDA1638BC; Tue,  2 May 2023 19:02:33 -0400 (EDT)
Date: Tue, 2 May 2023 19:02:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: p-bhagat@ti.com
Cc: rs@ti.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] wic/bootimg-efi: if fixed-size is set
 then use that for mkdosfs
Message-ID: <20230502230233.GF9226@denix.org>
References: <51022390-b911-5b8c-36bf-3ddb13263826@ti.com>
 <17864.1682500019497210025@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17864.1682500019497210025@lists.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 23:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180777

On Wed, Apr 26, 2023 at 02:06:59AM -0700, Paresh Bhagat via lists.openembedded.org wrote:
> Hi Randolph
> 
> I tested your patch in my local kirkstone build for am62x. SD Card boot is working.
> Boot logs here: http://serenity.dal.design.ti.com:7777/ewakutoqom.yaml

This is an internal-only resource ^^^
Since you are both TI-ers, don't you think there's a better way to communicate 
this information rather than using a public mailing list? :)

-- 
Denys

