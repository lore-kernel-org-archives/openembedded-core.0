Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC4974A03
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 16:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9DDB520BD7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 16:21:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id eMHYNzbrsOPy
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 16:21:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 768DC2085B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 16:21:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DA37216347F; Sat, 19 May 2018 12:21:02 -0400 (EDT)
Date: Sat, 19 May 2018 12:21:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180519162102.GL19965@denix.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: GCC 9 Drops Support For Older ARM Microarchitecture Versions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 May 2018 16:21:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

https://www.phoronix.com/scan.php?page=news_item&px=GCC-9-Dropping-Older-ARM

Particularly, ARMv5 and ARMv5E are being dropped (but T and TE variants 
remain)

Are there any concerns from OE community perspective?

At least for binutils we needed this patch even for armv5te:
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch

Any other way this change will affect us? Thanks.

-- 
Denys

