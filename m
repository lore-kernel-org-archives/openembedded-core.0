Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 5DDE960670
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 23:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4638620BFB;
	Tue, 19 Jun 2018 23:53:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gSOFCBitdcTE; Tue, 19 Jun 2018 23:53:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 18AAD2088D;
	Tue, 19 Jun 2018 23:53:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9A4241634BF; Tue, 19 Jun 2018 19:53:20 -0400 (EDT)
Date: Tue, 19 Jun 2018 19:53:20 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180619235320.GN19965@denix.org>
References: <cover.1526944475.git.denys@ti.com>
	<b3a976f9a497296a3cecd524931f1e8ea048489f.1526944475.git.denys@ti.com>
	<CAAQYJAvkUet1eLhbLaAFd=QH=ReBc82CcKituaanwZpEXcZEiw@mail.gmail.com>
	<CAJTo0LaQjo2iUw1BGo18fmH+Mz0j7pnkq7ooX_Q7zNyYa-chVQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaQjo2iUw1BGo18fmH+Mz0j7pnkq7ooX_Q7zNyYa-chVQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] mtd-utils: upgrade 2.0.1 -> 2.0.2
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
X-List-Received-Date: Tue, 19 Jun 2018 23:53:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 22, 2018 at 01:16:34PM +0100, Burton, Ross wrote:
> On 22 May 2018 at 08:49, Andrea Adami <andrea.adami@gmail.com> wrote:
> > I am just wondering about this patch:we carry it since 2009  [1] and
> > is still marked as pending.
> > Why was it necessary to ignore part of the filesystem? Can you remember?
> 
> Make that at least 2004.  This commit in oe-classic touches it:
> 
> commit c70605ebdca81412a93b4d867de7931543193f26
> Author: Chris Larson <clarson@kergoth.com>
> Date:   Thu Dec 23 21:24:57 2004 +0000
> 
>     Update mtd to a current snapshot, change the mkfs.jffs2 -i cmdline option to
>     -I, and rename mtd and mtd-native to mtd-utils and mtd-utils-native,
>     respectively.
> 
> Prior history is lost to the git/bk migration unless anyone has a
> BitKeeper clone to mine...

So, does this prevent the version upgrade from being merged?

-- 
Denys

