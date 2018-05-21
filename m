Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id B24EF7481C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 23:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9B84F2085B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 23:21:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id lUhD32gdIw9o
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 23:21:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 61070204D6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 23:21:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A31B9163482; Mon, 21 May 2018 19:21:02 -0400 (EDT)
Date: Mon, 21 May 2018 19:21:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180521232102.GT19965@denix.org>
References: <cover.1526944475.git.denys@ti.com>
MIME-Version: 1.0
In-Reply-To: <cover.1526944475.git.denys@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 0/4] Package upgrades
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
X-List-Received-Date: Mon, 21 May 2018 23:21:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 21, 2018 at 07:17:35PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Upgrades for hdparm, lz4, mtd-utils and wayland-protocols.
> 
> The following changes since commit 9611485bba03ef77ff31121e3b1da7cd57990c3e:
> 
>   patchreview: don't disable malformed SoB check (2018-05-15 10:00:33 +0100)
> 
> are available in the git repository at:
> 
>   git://push.openembedded.org/openembedded-core-contrib denix/master

BTW, create-pull-request doesn't seem to handle push.oe.org vs. git.oe.org


> 
> Denys Dmytriyenko (4):
>   hdparm: upgrade 9.55 -> 9.56
>   lz4: upgrade 1.8.1.2 -> 1.8.2
>   mtd-utils: upgrade 2.0.1 -> 2.0.2
>   wayland-protocols: upgrade 1.13 -> 1.14
> 
>  meta/recipes-devtools/mtd/mtd-utils_git.bb                            | 4 ++--
>  meta/recipes-extended/hdparm/{hdparm_9.55.bb => hdparm_9.56.bb}       | 4 ++--
>  .../wayland/{wayland-protocols_1.13.bb => wayland-protocols_1.14.bb}  | 4 ++--
>  meta/recipes-support/lz4/{lz4_1.8.1.2.bb => lz4_1.8.2.bb}             | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
>  rename meta/recipes-extended/hdparm/{hdparm_9.55.bb => hdparm_9.56.bb} (90%)
>  rename meta/recipes-graphics/wayland/{wayland-protocols_1.13.bb => wayland-protocols_1.14.bb} (85%)
>  rename meta/recipes-support/lz4/{lz4_1.8.1.2.bb => lz4_1.8.2.bb} (94%)
> 
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

