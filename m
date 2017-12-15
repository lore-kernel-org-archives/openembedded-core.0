Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id D6BAD719B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 00:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E19CE20AD6;
	Fri, 15 Dec 2017 00:18:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id STrRN24Ab0CS; Fri, 15 Dec 2017 00:18:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C1ACC20567;
	Fri, 15 Dec 2017 00:18:07 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 52FF61631EC; Thu, 14 Dec 2017 19:18:07 -0500 (EST)
Date: Thu, 14 Dec 2017 19:18:07 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Message-ID: <20171215001807.GH9221@denix.org>
References: <1513218231-12626-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<1513250295.30397.73.camel@andred.net>
MIME-Version: 1.0
In-Reply-To: <1513250295.30397.73.camel@andred.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Fix build issues with fitimage
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
X-List-Received-Date: Fri, 15 Dec 2017 00:18:08 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Dec 14, 2017 at 11:18:15AM +0000, André Draszik wrote:
> On Wed, 2017-12-13 at 18:23 -0800, Manjukumar Matha wrote:
> > While building fitimage with initramfs bundle using INITRAMFS_IMAGE and
> > INITRAMFS_IMAGE_BUNDLE = "1", we have few failures
> 
> Nothing against these patches, but what is the use-case to do that? Why
> don't you just disable INITRAMFS_IMAGE_BUNDLE?

+1 here

Also, I don't think this is the first revision of the patch here, so please 
specify [PATCH vX] accordingly, with log of changes between revisions.

-- 
Denys

